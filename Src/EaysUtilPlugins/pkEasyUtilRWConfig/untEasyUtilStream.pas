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
//
//主要实现：
//
//-----------------------------------------------------------------------------}
unit untEasyUtilStream;

interface

uses
  Windows, SysUtils, Classes;

type

{ TEasyEncryptStream }

  TEasyEncryptStream = class (TStream)
  {* 加密的 TStream 抽象基类，支持数据读写时进行加密处理。}
  private
    FStream: TStream;
    FOwned: Boolean;
  protected
    procedure DeEncrypt(var Buffer; Count: Longint); virtual; abstract;
    {* 解密方法，抽象方法。}
    procedure Encrypt(var Buffer; Count: Longint); virtual; abstract;
    {* 加密方法，抽象方法。}

    procedure DoBeforeEncrypt(const Buffer; Count: Longint); virtual; abstract;
    procedure DoAfterEncrypt(const Buffer; Count: Longint); virtual; abstract;
    procedure DoBeforeDeEncrypt(const Buffer; Count: Longint); virtual; abstract;
    procedure DoAfterDeEncrypt(const Buffer; Count: Longint); virtual; abstract;

    function GetSize: Int64; override;
    procedure SetSize(NewSize: Longint); override;
    procedure SetSize(const NewSize: Int64); overload; override;
  
    property Owned: Boolean read FOwned;
    property Stream: TStream read FStream;
  public
    constructor Create(AStream: TStream; AOwned: Boolean = False);
    {* 类构造器，AStream 参数为需要进行加密处理的流，AOwned 表示是否
       在释放加密流时同时释放 AStream。}
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): LongInt; override;
    function Seek(Offset: Longint; Origin: Word): LongInt; override;
    function Write(const Buffer; Count: Longint): LongInt; override;
  end;

{ TEasyXorStream }

  TEasyXorStream = class (TEasyEncryptStream)
  {* Xor 加密的 TStream 类，支持数据读写时进行 Xor 加密处理。}
  private
    FXorStr: AnsiString;
    FSeedPos: Integer;
  protected
    procedure DeEncrypt(var Buffer; Count: Longint); override;
    procedure Encrypt(var Buffer; Count: Longint); override;

    procedure DoBeforeEncrypt(const Buffer; Count: Longint); override;
    procedure DoAfterEncrypt(const Buffer; Count: Longint); override;
    procedure DoBeforeDeEncrypt(const Buffer; Count: Longint); override;
    procedure DoAfterDeEncrypt(const Buffer; Count: Longint); override;
  public
    constructor Create(AStream: TStream; const AXorStr: AnsiString;
      AOwned: Boolean = False);
    {* 类构造器
     |<PRE>
       AStream: TStream         - 需要进行加密处理的流
       AXorStr: string          - 用于加密处理的字符串
       AOwned: Boolean          - 是否在释放加密流时同时释放 AStream
     |</PRE>}
    property XorStr: AnsiString read FXorStr write FXorStr;
    {* 用于加密处理的字符串 }
  end;

function EasyFastMemoryStreamCopyFrom(Dest, Source: TStream; Count: Int64): Int64;
{* 快速的 MemoryStream 的 CopyFrom 方法，用于 Dest 或 Source 之一是 MemoryStream
   的情况，直接读写内存，避免了分配缓冲区和重复读写的开销。如传入的俩 Stream 都
   不是 TCustomMemoryStream，则调用原 CopyFrom 方法。}

implementation

function EasyFastMemoryStreamCopyFrom(Dest, Source: TStream; Count: Int64): Int64;
var
  aNewSize: Longint;
begin
  if Count = 0 then
  begin
    Source.Position := 0;
    Count := Source.Size;
  end;
  Result := Count;
  //注意此方法能工作的首要条件是Dest, Source两者之一是TCustomMemoryStream,否则调用原函数
  
  //判断Dest或Source是不是TCustomMemoryStream,如果是的话，直接从Memory的地址上进行操作 ,
  //因为CustomMemoryStream 的read或writer都用到System.move
  //这样省去了原TStream不停地创建和写buffer 及设置Capacity ,原copyfrom这里最浪费时间
  //用此方法可直接将Source的内存块追加到Dest的Memory地址的后面

  if Source is TCustomMemoryStream then     //直接写入到Dest的地址内
    Dest.WriteBuffer(Pointer(Longint(TCustomMemoryStream(Source).Memory) + Source.Position)^,Count)
  else if Dest is TCustomMemoryStream then
  begin
    aNewSize := Dest.Position + Count;
    TCustomMemoryStream(Dest).Size := aNewSize; //先设置内存的大小，将Dest.Memory扩大,不然下面找不到地址
    //source直接从Dest.memory后面写
    Source.ReadBuffer(Pointer(Longint(TCustomMemoryStream(Dest).Memory) + Dest.Position)^, Count);
  end
  else
  begin
    Dest.CopyFrom(Source, Count);
  end;
end;

{ TEasyEncryptStream }

constructor TEasyEncryptStream.Create(AStream: TStream; AOwned: Boolean);
begin
  inherited Create;
  Assert(Assigned(AStream));
  FStream := AStream;
  FOwned := AOwned;
end;

destructor TEasyEncryptStream.Destroy;
begin
  if FOwned then
    FreeAndNil(FStream);
  inherited;
end;

function TEasyEncryptStream.GetSize: Int64;
begin
  Result := FStream.Size;
end;

function TEasyEncryptStream.Read(var Buffer; Count: Integer): LongInt;
begin
  Result := FStream.Read(Buffer, Count);
  DoBeforeDeEncrypt(Buffer, Count);
  DeEncrypt(Buffer, Count);
  DoAfterDeEncrypt(Buffer, Count);
end;

function TEasyEncryptStream.Seek(Offset: Integer; Origin: Word): LongInt;
begin
  Result := FStream.Seek(Offset, Origin);
end;

procedure TEasyEncryptStream.SetSize(NewSize: Integer);
begin
  FStream.Size := NewSize;
end;

procedure TEasyEncryptStream.SetSize(const NewSize: Int64);
begin
  FStream.Size := NewSize;
end;

function TEasyEncryptStream.Write(const Buffer; Count: Integer): LongInt;
var
  MemBuff: Pointer;
begin
  GetMem(MemBuff, Count);
  try
    DoBeforeEncrypt(Buffer, Count);
    CopyMemory(MemBuff, @Buffer, Count);
    Encrypt(MemBuff^, Count);
    DoAfterEncrypt(Buffer, Count);
    Result := FStream.Write(MemBuff^, Count);
  finally
    FreeMem(MemBuff);
  end;
end;

{ TEasyXorStream }

constructor TEasyXorStream.Create(AStream: TStream;
  const AXorStr: AnsiString; AOwned: Boolean);
begin
  inherited Create(AStream, AOwned);
  FXorStr := AXorStr;
end;

procedure TEasyXorStream.DeEncrypt(var Buffer; Count: Integer);
begin
  Encrypt(Buffer, Count);
end;

procedure TEasyXorStream.DoAfterDeEncrypt(const Buffer; Count: Integer);
begin
//  inherited;

end;

procedure TEasyXorStream.DoAfterEncrypt(const Buffer; Count: Integer);
begin
//  inherited;

end;

procedure TEasyXorStream.DoBeforeDeEncrypt(const Buffer; Count: Integer);
begin
  // 读写前后需要记录位置，和流中的xor加密的种子字符位置对的上号
  FSeedPos := Position - Count;
end;

procedure TEasyXorStream.DoBeforeEncrypt(const Buffer; Count: Integer);
begin
  // 读写前后需要记录位置，和流中的xor加密的种子字符位置对的上号
  FSeedPos := Position;
end;

procedure TEasyXorStream.Encrypt(var Buffer; Count: Integer);
var
  i, p, l: Integer;
begin
  l := Length(FXorStr);
  if l > 0 then
  begin
    p := FSeedPos;
    for i := 0 to Count - 1 do
      PByteArray(@Buffer)^[i] := PByteArray(@Buffer)^[i] xor
        Byte(FXorStr[(p + i) mod l + 1]);
  end;
end;

end.


