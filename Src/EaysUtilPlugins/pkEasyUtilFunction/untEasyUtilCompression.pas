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
//
//主要功能：
//        流解压缩、文件夹解压缩                               
//------------------------------------------------------------------------------}
unit untEasyUtilCompression;

interface

uses
  Windows, Messages, SysUtils, Classes, ShellAPI, ZLib;

const
  cBufferSize = $1000;
  cIdent = 'eas';
  cVersion = $02;

type
  TDirectoryDecompressionProgress = function( // 解压进度
    mFileCount: Integer; // 文件总个数
    mFileIndex: Integer; // 当前解压文件序号
    mPackSize: Integer; // 文件压缩大小
    mFileName: string; // 当前解压文件名
    mFileSize: Integer; // 当前解压文件大小
    mParam: Integer // 附加参数
  ): Boolean; // 返回是否继续解压

  TFileHead = packed record
    rIdent: array[0..2] of Char; //标识
    rVersion: Byte; //版本
  end;

  //解压缩流
  procedure UnCompressionStream(var ASrcStream:TMemoryStream);
  //压缩流
  procedure CompressionStream(var ASrcStream:TMemoryStream;ACompressionLevel:Integer = 2);

  // 获得目录的大小、文件个数、目录个数
  //mDirectory 目录名
  //nFileSize 总大小
  //nFileCount  文件个数
  //nDirectoryCount 目录个数
  function DirectoryInfo(mDirectory: string; var nFileSize: Integer;
            var nFileCount: Integer; var nDirectoryCount: Integer): Boolean;

  // 将文件压缩到流中
  //mFileName 文件名
  // mStream  目标
  //返回解压后的大小
  function FileCompression(mFileName: string; mStream: TStream): Integer;

  // 从流中解压文件
  // mFileName 目标文件名
  // mStream  来源
  // 返回解压后的大小
  function FileDecompression(mFileName: string; mStream: TStream): Integer;

  // 将目录压缩成文件
  // mDirectory 目录名
  // mFileName 压缩后的文件名
  // 返回压缩后的大小 //如果为负数则标识错误
  function DirectoryCompression(mDirectory: string; mFileName: string): Integer; overload;

  // 将目录压缩成流
  //mDirectory  目录名
  //mStream 压缩后的流
  //返回压缩后的大小 //如果为负数则标识错误
  function DirectoryCompression(mDirectory: string; mStream: TStream): Integer; overload;

  // 从文件中解压目录
  //mDirectory 目录名
  //mFileName 压缩文件名
  //mProgress 进度处理
  //mParam  附加参数
  //返回解压后的个数
  function DirectoryDecompression(mDirectory: string; mFileName: string;
    mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload;

  // 从流中解压目录
  //mDirectory  指定目录名
  //mStream 压缩流
  //mProgress 进度处理
  //mParam 附加参数
  //返回解压的文件个数
  function DirectoryDecompression(mDirectory: string; mStream: TStream;
    mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload;

implementation

//取左边的字符串
//mStr 原字符串
//mDelimiter 分隔符
//mIgnoreCase 是否忽略大小写
//返回第一个分隔符左边的字符串
function StrLeft(mStr: string; mDelimiter: string; mIgnoreCase: Boolean = False): string;
begin
  if mIgnoreCase then
    Result := Copy(mStr, 1, Pos(UpperCase(mDelimiter), UpperCase(mStr)) - 1)
  else Result := Copy(mStr, 1, Pos(mDelimiter, mStr) - 1);
end; { StrLeft }

//取右边的字符串
//mStr 原字符串
//mDelimiter 分隔符
//mIgnoreCase 是否忽略大小写
//返回第一个分隔符右边的字符串
function StrRight(mStr: string; mDelimiter: string; mIgnoreCase: Boolean = False): string;
begin
  if mIgnoreCase then
  begin
    if Pos(UpperCase(mDelimiter), UpperCase(mStr)) > 0 then
      Result := Copy(mStr, Pos(UpperCase(mDelimiter), UpperCase(mStr)) +
        Length(mDelimiter), MaxInt)
    else Result := '';
  end else
  begin
    if Pos(mDelimiter, mStr) > 0 then
      Result := Copy(mStr, Pos(mDelimiter, mStr) + Length(mDelimiter), MaxInt)
    else Result := '';
  end;
end; { StrRight }

function DirectoryInfo(mDirectory: string; var nFileSize: Integer;
          var nFileCount: Integer; var nDirectoryCount: Integer): Boolean;
var
  vSearchRec: TSearchRec;
  vFileSize: Integer; // 总大小
  vFileCount: Integer; // 文件个数
  vDirectoryCount: Integer; // 目录个数
begin
  Result := False;
  if not DirectoryExists(mDirectory) then Exit; // 目录不存在
  nFileSize := 0;
  nFileCount := 0;
  nDirectoryCount := 0;
  mDirectory := IncludeTrailingPathDelimiter(mDirectory);
  if FindFirst(mDirectory + '*.*',
    faAnyFile and not faHidden, vSearchRec) = NO_ERROR then
  begin
    repeat
      if vSearchRec.Attr and faDirectory = faDirectory then
      begin
        if Pos('.', vSearchRec.Name) <> 1 then
        begin
          Inc(nDirectoryCount);
          DirectoryInfo(mDirectory + vSearchRec.Name,
            vFileSize, vFileCount, vDirectoryCount);
          Inc(nFileSize, vFileSize);
          Inc(nFileCount, vFileCount);
          Inc(nDirectoryCount, vDirectoryCount);
        end;
      end else
      begin
        Inc(nFileCount);
        Inc(nFileSize, vSearchRec.Size);
      end;
    until FindNext(vSearchRec) <> NO_ERROR;
    FindClose(vSearchRec);
  end;
  Result := True;
end;

function FileCompression(mFileName: string; mStream: TStream): Integer;
var
  vFileStream: TFileStream;
  vBuffer: array[0..cBufferSize]of Char;
  vPosition: Integer;
  I: Integer;
begin
  Result := -1;
  if not FileExists(mFileName) then Exit;
  if not Assigned(mStream) then Exit;
  vPosition := mStream.Position;
  vFileStream := TFileStream.Create(mFileName, fmOpenRead or fmShareDenyNone);
  with TCompressionStream.Create(clMax, mStream) do
  try
    for I := 1 to vFileStream.Size div cBufferSize do
    begin
      vFileStream.Read(vBuffer, cBufferSize);
      Write(vBuffer, cBufferSize);
    end;
    I := vFileStream.Size mod cBufferSize;
    if I > 0 then
    begin
      vFileStream.Read(vBuffer, I);
      Write(vBuffer, I);
    end;
  finally
    Free;
    vFileStream.Free;
  end;
  Result := mStream.Size - vPosition; //增量
end;  

function FileDecompression(mFileName: string; mStream: TStream): Integer; 
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
  vBuffer: array[0..cBufferSize]of Char;
  I: Integer;
begin
  Result := -1;
  if not Assigned(mStream) then Exit;
  ForceDirectories(ExtractFilePath(mFileName)); //创建目录
  { TODO : 判断文件是否可以创建 }
  vFileHandle := FileCreate(mFileName);                                         //2006-09-25 ZswangY37 No.1 
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  with TDecompressionStream.Create(mStream) do
  try
    repeat
      I := Read(vBuffer, cBufferSize);
      vFileStream.Write(vBuffer, I);
    until I = 0;
    Result := vFileStream.Size;
  finally
    Free;
    vFileStream.Free;
  end;
end;  

function DirectoryCompression(mDirectory: string; mFileName: string): Integer; overload;
var
  vFileStream: TFileStream;
begin
  vFileStream := TFileStream.Create(mFileName, fmCreate or fmShareDenyWrite);
  try
    Result := DirectoryCompression(mDirectory, vFileStream);
  finally
    vFileStream.Free;
  end;
end; { DirectoryCompression }

function DirectoryCompression(mDirectory: string; mStream: TStream): Integer; overload;
var
  vFileInfo: TStrings;
  vFileInfoSize: Integer;
  vFileInfoBuffer: PChar;
  vFileHead: TFileHead;

  vMemoryStream: TMemoryStream;

  procedure pAppendFile(mSubFile: string);
  begin
    vFileInfo.Append(Format('%s|%d',
      [StringReplace(mSubFile, mDirectory + '\', '', [rfReplaceAll, rfIgnoreCase]),
        FileCompression(mSubFile, vMemoryStream)]));
    Inc(Result);
  end; { pAppendFile }

  procedure pSearchFile(mPath: string);
  var
    vSearchRec: TSearchRec;
    K: Integer;
  begin
    K := FindFirst(mPath + '\*.*', faAnyFile and not faHidden, vSearchRec);
    while K = 0 do
    begin
      if (vSearchRec.Attr and faDirectory > 0) and
        (Pos(vSearchRec.Name, '..') = 0) then
        pSearchFile(mPath + '\' + vSearchRec.Name)
      else if Pos(vSearchRec.Name, '..') = 0 then
        pAppendFile(mPath + '\' + vSearchRec.Name);
      K := FindNext(vSearchRec);
    end;
    FindClose(vSearchRec);
  end; { pSearchFile }
begin
  Result := 0;
  if not Assigned(mStream) then Exit;
  if not DirectoryExists(mDirectory) then Exit;
  vFileInfo := TStringList.Create;
  vMemoryStream := TMemoryStream.Create;
  mDirectory := ExcludeTrailingPathDelimiter(mDirectory);

  try
    pSearchFile(mDirectory);
    vFileInfoBuffer := vFileInfo.GetText;
    vFileInfoSize := StrLen(vFileInfoBuffer);

    { DONE -oZswang -c添加 : 写入头文件信息 }
    vFileHead.rIdent := cIdent;
    vFileHead.rVersion := cVersion;
    mStream.Write(vFileHead, SizeOf(vFileHead));

    mStream.Write(vFileInfoSize, SizeOf(vFileInfoSize));
    mStream.Write(vFileInfoBuffer^, vFileInfoSize);
    vMemoryStream.Position := 0;
    mStream.CopyFrom(vMemoryStream, vMemoryStream.Size);
  finally
    vFileInfo.Free;
    vMemoryStream.Free;
  end;
end;

function DirectoryDecompression(mDirectory: string; mFileName: string;
  mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload; 
var
  vFileStream: TFileStream;
begin
  vFileStream := TFileStream.Create(mFileName, fmOpenRead or fmShareDenyNone);
  try
    Result := DirectoryDecompression(
      mDirectory, vFileStream, mProgress, mParam);
  finally
    vFileStream.Free;
  end;
end; { DirectoryDeompression }

function DirectoryDecompression(mDirectory: string; mStream: TStream;
  mProgress: TDirectoryDecompressionProgress = nil; mParam: Integer = 0): Integer; overload; 
var
  vFileInfo: TStrings;
  vFileInfoSize: Integer;
  vFileHead: TFileHead;
  vFileCount: Integer;
  vFileName: string;
  vFileSize: Integer;
  vPackSize: Integer;
  
  vMemoryStream: TMemoryStream;
  I: Integer;
begin
  Result := 0;
  if not Assigned(mStream) then Exit;
  vFileInfo := TStringList.Create;
  vMemoryStream := TMemoryStream.Create;
  mDirectory := ExcludeTrailingPathDelimiter(mDirectory);
  try
    mStream.Position := 0;
    if mStream.Size < SizeOf(vFileHead) then Exit;
    { DONE -oZswang -c添加 : 读取头文件信息 }
    mStream.Read(vFileHead, SizeOf(vFileHead));
    if vFileHead.rIdent <> cIdent then Result := -1;
    if vFileHead.rVersion <> cVersion then Result := -2;
    if Result <> 0 then Exit;

    mStream.Read(vFileInfoSize, SizeOf(vFileInfoSize));
    vMemoryStream.CopyFrom(mStream, vFileInfoSize);
    vMemoryStream.Position := 0;
    vFileInfo.LoadFromStream(vMemoryStream);
    vFileCount := vFileInfo.Count;
    for I := 0 to vFileCount - 1 do
    begin
      vFileName := mDirectory + '\' + StrLeft(vFileInfo[I], '|');
      vPackSize := StrToIntDef(StrRight(vFileInfo[I], '|'), 0);

      vMemoryStream.Clear;
      vMemoryStream.CopyFrom(mStream, vPackSize);
      vMemoryStream.Position := 0;
      vFileSize := FileDecompression(vFileName, vMemoryStream);
      if Assigned(mProgress) then
        if not mProgress(vFileCount, I,
          vPackSize, vFileName, vFileSize, mParam) then Break;
    end;
    Result := vFileInfo.Count;
  finally
    vFileInfo.Free;
    vMemoryStream.Free;
  end;
end;

//解压缩
procedure UnCompressionStream(var ASrcStream:TMemoryStream);
var
  nTmpStream:TDecompressionStream;
  nDestStream:TMemoryStream;
  nBuf: array[1..512] of Byte;
  nSrcCount: integer;
begin
  ASrcStream.Position := 0;
  nDestStream := TMemoryStream.Create;
  nTmpStream := TDecompressionStream.Create(ASrcStream);
  try
    repeat
      //读入实际大小
      nSrcCount := nTmpStream.Read(nBuf, SizeOf(nBuf));
      if nSrcCount > 0 then
        nDestStream.Write(nBuf, nSrcCount);
    until (nSrcCount = 0);
    ASrcStream.Clear;
    ASrcStream.LoadFromStream(nDestStream);
    ASrcStream.Position := 0;
  finally
    nDestStream.Clear;
    nDestStream.Free;
    nTmpStream.Free;
  end;
end;

//压缩流
procedure CompressionStream(var ASrcStream:TMemoryStream;ACompressionLevel:Integer = 2);
var
  nDestStream:TMemoryStream;
  nTmpStream:TCompressionStream;
  nCompressionLevel:TCompressionLevel;
begin
  ASrcStream.Position := 0;
  nDestStream := TMemoryStream.Create;
  try
    //级别
    case ACompressionLevel of
      0:nCompressionLevel := clNone;
      1:nCompressionLevel := clFastest;
      2:nCompressionLevel := clDefault;
      3:nCompressionLevel := clMax;
    else
        nCompressionLevel := clMax;
    end;
    //开始压缩
    nTmpStream := TCompressionStream.Create(nCompressionLevel,nDestStream);
    try
      ASrcStream.SaveToStream(nTmpStream);
    finally
      nTmpStream.Free;//释放后nDestStream才会有数据
    end;
    ASrcStream.Clear;
    ASrcStream.LoadFromStream(nDestStream);
    ASrcStream.Position := 0;
  finally
    nDestStream.Clear;
    nDestStream.Free;
  end;
end;

end.
