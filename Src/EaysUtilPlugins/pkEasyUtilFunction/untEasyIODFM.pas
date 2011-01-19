{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7
//                         一轩软研第三方开发包                         
//                         @Copyright 2010 hehf                      
//                   ------------------------------------                       
//                                                                              
//           本开发包是公司内部使用,作为开发工具使用任何,何海锋个人负责开发,任何
//       人不得外泄,否则后果自负.        
//
//            使用权限以及相关解释请联系何海锋  
//                
//                                                               
//            网站地址：http://www.YiXuan-SoftWare.com                                  
//            电子邮件：hehaifeng1984@126.com 
//                      YiXuan-SoftWare@hotmail.com    
//            QQ      ：383530895
//            MSN     ：YiXuan-SoftWare@hotmail.com                                   
//------------------------------------------------------------------------------}
unit untEasyIODFM;

interface

uses
  Windows, Classes;

  //从流读取控件
  procedure EasyReadCmpFromStream(Stream: TStream; Root: TComponent;
         OnError: TReaderError = nil; OnCreateCmp: TCreateComponentEvent = nil);
  procedure EasyReadCmpFromFile(const FileName: string; Root: TComponent;
      OnError: TReaderError = nil; OnCreateCmp: TCreateComponentEvent = nil);

  //写控件信息到流
  procedure EasyWriteCmpToStream(Stream: TStream; Root: TComponent; AsText: Boolean = True);
  procedure EasyWriteCmpToFile(const FileName: string; Root: TComponent; AsText: Boolean = True);

  //复制控件
  procedure EasyCopyCmpResource(Dest, Source: TComponent);

  function EasyComponentToString(Component: TComponent): string;
  function EasyStringToComponent(Value: string; Instance: TComponent): TComponent;
  //按ON标识符删除事件相关文本
  procedure EasyDeleteDFMEnventLines(list: TStrings);

implementation

uses
  SysUtils;

type
  { Special Reader to support overloading. }
  TMyReader = class(TReader)
  public
    FFinded: TComponent;
    procedure ReadPrefix(var Flags: TFilerFlags; var AChildPos: Integer); override;
    function FindAncestorComponent(const Name: string;
      ComponentClass: TPersistentClass): TComponent; override;
  end;

function Local(Input: string; Default: String = ''): String;
begin
  Result := Input;
end;
  
procedure EasyReadCmpFromFile(const FileName: string; Root: TComponent; OnError: TReaderError; OnCreateCmp: TCreateComponentEvent);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    EasyReadCmpFromStream(Stream, Root, OnError, OnCreateCmp);
  finally
    Stream.Free;
  end;
end;

procedure EasyReadCmpFromStream(Stream: TStream; Root: TComponent; OnError: TReaderError; OnCreateCmp: TCreateComponentEvent);
var
  MemSt: TStream;
  Reader: TReader;
begin
  MemSt := nil;
  case TestStreamFormat(Stream) of
    sofUnknown: raise Exception.Create(Local('SUnsuppResFormat'));
    sofText:
      begin
        MemSt := TMemoryStream.Create;
        try
          ObjectTextToBinary(Stream, MemSt);
        finally
          MemSt.Position := 0;
        end;
      end;
    sofBinary: Stream.ReadResHeader;
  end;
  if MemSt <> nil then
    Reader := TMyReader.Create(MemSt, 4096)
  else
    Reader := TMyReader.Create(Stream, 4096);

  try
    Reader.OnCreateComponent := OnCreateCmp;
    Reader.OnError := OnError;
    Reader.ReadRootComponent(Root);
  finally
    Reader.Free;
    if MemSt <> nil then MemSt.Free;
  end;
end;

{ TMyReader }

function TMyReader.FindAncestorComponent(const Name: string;
  ComponentClass: TPersistentClass): TComponent;
begin
  if FFinded <> nil then
    Result := FFinded
  else
    Result := inherited FindAncestorComponent(Name, ComponentClass);
end;

procedure TMyReader.ReadPrefix(var Flags: TFilerFlags;
  var AChildPos: Integer);
var
  cName, cClass: string;
  sPos: integer;
begin
  inherited;
  if Root = nil then Exit;
  sPos := Position;
  cClass := ReadStr;
  cName := ReadStr;
  FFinded := Root.FindComponent(cName);
  if (FFinded <> nil) and SameText(FFinded.ClassName, cClass) then
    Include(Flags, ffInherited)
  else
    FFinded := nil;
  Position := sPos;
end;

procedure EasyWriteCmpToStream(Stream: TStream; Root: TComponent; AsText: Boolean = True);
var
  MemSt: TStream;
begin
  if AsText then
  begin
    MemSt := TMemoryStream.Create;
    try
      MemSt.WriteComponent(Root);
      MemSt.Position := 0;
      ObjectBinaryToText(MemSt, Stream);
    finally
      MemSt.Free;
    end
  end
  else
  begin
    Stream.WriteComponentRes(Root.ClassName, Root);
  end;
end;

procedure EasyWriteCmpToFile(const FileName: string; Root: TComponent; AsText: Boolean);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    EasyWriteCmpToStream(Stream, Root, AsText);
  finally
    Stream.Free;
  end;
end;

//复制控件
procedure EasyCopyCmpResource(Dest, Source: TComponent);
var
  MemSt: TStream;
  Reader: TMyReader;
begin
  MemSt := TMemoryStream.Create;
  try
    MemSt.WriteComponent(Source);
    MemSt.Position := 0;
    Reader := TMyReader.Create(MemSt, 4096);
    try
      Reader.ReadRootComponent(Dest);
    finally
      Reader.Free;
    end;
  finally
    MemSt.Free;
  end;
end;

function EasyComponentToString(Component: TComponent): string;
var
  BinStream: TMemoryStream;
  StrStream: TStringStream;
  s: string;
begin
  BinStream := TMemoryStream.Create;
  try
    StrStream := TStringStream.Create(s);
    try
      BinStream.WriteComponent(Component);
      BinStream.Seek(0, soFromBeginning);
      ObjectBinaryToText(BinStream, StrStream);
      StrStream.Seek(0, soFromBeginning);
      Result := StrStream.DataString;
    finally
      StrStream.Free;
    end;
  finally
    BinStream.Free
  end;
end; { ComponentToString }

function EasyStringToComponent(Value: string; Instance: TComponent): TComponent;
var
  StrStream: TStringStream;
  BinStream: TMemoryStream;
begin
  StrStream := TStringStream.Create(Value);
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(StrStream, BinStream);
      BinStream.Seek(0, soFromBeginning);
      Result := BinStream.ReadComponent(Instance);
    finally
      BinStream.Free;
    end;
  finally
    StrStream.Free;
  end;
end; { StringToComponent }

procedure EasyDeleteDFMEnventLines(list: TStrings);
var
  i   : Integer;
  line: String;
begin
  if list.Count=0 then
    Exit;

  i := 0;
  while i<list.Count do
  begin
    line := Trim(list[i]);
    if Copy(line,1,2)='On' then
      list.Delete(i)
    else
      Inc(i);
  end;
end;


end.
