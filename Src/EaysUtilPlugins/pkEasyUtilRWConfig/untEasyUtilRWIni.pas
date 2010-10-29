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
//------------------------------------------------------------------------------
//单元说明：
//    本单元是提供数据连接的单元(两层架),只输出一个有效的ADOConnection
//
//主要实现：
//      1、读取Ini配置文件信息
//-----------------------------------------------------------------------------}
unit untEasyUtilRWIni;

interface

uses
  SysUtils, Classes, Windows, IniFiles;

type

{ TEasyStreamIniFile }

  TEasyStreamIniFile = class (TMemIniFile)
  {* 支持流操作的 IniFile 类，提供了 LoadFromStream、SaveToStream 允许从流中读取
     Ini 数据。 }
  private
    FFileName: string;
  public
    constructor Create(const FileName: string = '');
    destructor Destroy; override;
    function LoadFromFile(const FileName: string): Boolean;
    function LoadFromStream(Stream: TStream): Boolean; virtual;
    function SaveToFile(const FileName: string): Boolean;
    function SaveToStream(Stream: TStream): Boolean; virtual;
    procedure UpdateFile; override;

    property FileName: string read FFileName;
  end;

{ TEasyXorIniFile }

  TEasyXorIniFile = class (TEasyStreamIniFile)
  {* 支持内容 Xor 加密及流操作的 IniFile 类，允许对 INI 数据进行 Xor 加密。 }
  private
    FXorStr: string;
  protected

  public
    constructor Create(const FileName: string; const XorStr: string);
    {* 类构造器。
     |<PRE>
       FileName: string     - INI 文件名，如果文件存在将自动加载
       XorStr: string       - 用于 Xor 操作的字符串
     |</PRE>}
    function LoadFromStream(Stream: TStream): Boolean; override;
    {* 从流中装载 INI 数据，流中的数据将用 Xor 解密 }
    function SaveToStream(Stream: TStream): Boolean; override;
    {* 保存 INI 数据到流，流中的数据将用 Xor 加密 }
  end;

  TEasyRWIni = class(TComponent)
  private
    FIniFile: TIniFile;
  public
    //读INI取值
    function ReadValueString(ASection, AIdent, ADefault: string): string; overload;
    function ReadValueBoolean(ASection, AIdent: string; ADefault: Boolean): Boolean; overload;
    function ReadValueInteger(ASection, AIdent: string; ADefault: Integer): Integer; overload;
    function ReadValueDateTime(ASection, AIdent: string; ADefault: TDateTime): TDateTime; overload;
    function ReadValueDouble(ASection, AIdent: string; ADefault: Double): Double; overload;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; IniPath: string); reintroduce; overload;
    destructor Destroy; override;
  end;
implementation

uses untEasyUtilStream;

{ TEasyRWIni }

constructor TEasyRWIni.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);  
end;

constructor TEasyRWIni.Create(AOwner: TComponent; IniPath: string);
begin
  inherited Create(AOwner);
  FIniFile := TIniFile.Create(IniPath);
end;

destructor TEasyRWIni.Destroy;
begin
  if FIniFile <> nil then
    FreeAndNil(FIniFile);
  inherited;
end;

function TEasyRWIni.ReadValueBoolean(ASection, AIdent: string; ADefault: Boolean): Boolean;
begin
  Result := FIniFile.ReadBool(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueDateTime(ASection, AIdent: string; ADefault: TDateTime): TDateTime;
begin
  Result := FIniFile.ReadDateTime(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueDouble(ASection, AIdent: string; ADefault: Double): Double;
begin
  Result := FIniFile.ReadFloat(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueInteger(ASection, AIdent: string; ADefault: Integer): Integer;
begin
  Result := FIniFile.ReadInteger(ASection, AIdent, ADefault);
end;

function TEasyRWIni.ReadValueString(ASection, AIdent, ADefault: string): string;
begin
  Result := FIniFile.ReadString(ASection, AIdent, ADefault);
end;

{ TEasyStreamIniFile }

constructor TEasyStreamIniFile.Create(const FileName: string);
begin
  inherited Create('');
  FFileName := FileName;
  if FileExists(FFileName) then
    LoadFromFile(FFileName);
end;

destructor TEasyStreamIniFile.Destroy;
begin
  UpdateFile;
  inherited;
end;

function TEasyStreamIniFile.LoadFromFile(const FileName: string): Boolean;
var
  Stream: TFileStream;
begin
  try
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    try
      Result := LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  except
    Result := False;
  end;
end;

function TEasyStreamIniFile.LoadFromStream(Stream: TStream): Boolean;
var
  Strings: TStrings;
begin
  try
    Strings := TStringList.Create;
    try
      Strings.LoadFromStream(Stream);
      SetStrings(Strings);
    finally
      Strings.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TEasyStreamIniFile.SaveToFile(const FileName: string): Boolean;
var
  Stream: TFileStream;
begin
  try
    Stream := TFileStream.Create(FileName, fmCreate);
    try
      Stream.Size := 0;
      Result := SaveToStream(Stream);
    finally
      Stream.Free;
    end;
  except
    Result := False;
  end;
end;

function TEasyStreamIniFile.SaveToStream(Stream: TStream): Boolean;
var
  Strings: TStrings;
begin
  try
    Strings := TStringList.Create;
    try
      GetStrings(Strings);
      Strings.SaveToStream(Stream);
    finally
      Strings.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TEasyStreamIniFile.UpdateFile;
begin
  if FileExists(FFileName) then
    SaveToFile(FFileName);
end;

{ TEasyXorIniFile }

constructor TEasyXorIniFile.Create(const FileName, XorStr: string);
begin
  FXorStr := XorStr;
  inherited Create(FileName);
end;

function TEasyXorIniFile.LoadFromStream(Stream: TStream): Boolean;
var
  XorStream: TEasyXorStream;
begin
  XorStream := TEasyXorStream.Create(Stream, AnsiString(FXorStr));
  try
    Result := inherited LoadFromStream(XorStream);
  finally
    XorStream.Free;
  end;
end;

function TEasyXorIniFile.SaveToStream(Stream: TStream): Boolean;
var
  XorStream: TEasyXorStream;
begin
  XorStream := TEasyXorStream.Create(Stream, AnsiString(FXorStr));
  try
    Result := inherited SaveToStream(XorStream);
  finally
    XorStream.Free;
  end;
end;

end.
