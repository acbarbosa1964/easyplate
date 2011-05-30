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
//-----------------------------------------------------------------------------}
unit untEasyUtilFile;

interface

uses
  Windows, Messages, SysUtils, Classes, ShellAPI, ZLib;

type
  TFileVersionInfomation = record // 文件版本信息
    rCommpanyName: string;
    rFileDescription: string;
    rFileVersion: string;
    rInternalName: string;
    rLegalCopyright: string;
    rLegalTrademarks: string;
    rOriginalFileName: string;
    rProductName: string;
    rProductVersion: string;
    rComments: string;
    rVsFixedFileInfo: VS_FIXEDFILEINFO;
    rDefineValue: string;
  end;

// 读取文件的版本信息
//mFileName 目标文件名
//nFileVersionInfomation 文件信息结构
//mDefineName 自定义字段名
//返回是否读取成功
function GetFileVersionInfomation(mFileName: string;
        var nFileVersionInfomation: TFileVersionInfomation; mDefineName: string = ''): Boolean; 

// 删除指定目录
//mDirName 目录名
//mPrefix 前缀
//mChangeAttrib 是否修改属性以便删除
// 返回删除指定目录是否成功
function DeletePath(mDirName: string; mPrefix: string; mChangeAttrib: Boolean): Boolean;

// 将文件时间处理为TDateTime
//mFileTime 文件时间
// 返回处理后的结果
function FileTimeToDateTime(mFileTime: TFileTime): TDateTime; 

implementation

function GetFileVersionInfomation(mFileName: string;
        var nFileVersionInfomation: TFileVersionInfomation; mDefineName: string = ''): Boolean; 
var
  vHandle: Cardinal;
  vInfoSize: Cardinal;
  vVersionInfo: Pointer;
  vTranslation: Pointer;
  vVersionValue: string;
  vInfoPointer: Pointer;
begin
  Result := False;
  vInfoSize := GetFileVersionInfoSize(PChar(mFileName), vHandle); // 取得文件版本信息空间及资源句柄
  FillChar(nFileVersionInfomation, SizeOf(nFileVersionInfomation), 0); // 初始化返回信息
  if vInfoSize <= 0 then Exit; // 安全检查

  GetMem(vVersionInfo, vInfoSize); // 分配资源
  with nFileVersionInfomation do try
    if not GetFileVersionInfo(PChar(mFileName),
      vHandle, vInfoSize, vVersionInfo) then Exit;
    CloseHandle(vHandle);
    VerQueryValue(vVersionInfo, '\VarFileInfo\Translation',
      vTranslation, vInfoSize);
    if not Assigned(vTranslation) then Exit;
    vVersionValue := Format('\StringFileInfo\%.4x%.4x\',
      [LOWORD(Longint(vTranslation^)), HIWORD(Longint(vTranslation^))]);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'CompanyName'),
      vInfoPointer, vInfoSize);
    rCommpanyName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'FileDescription'),
      vInfoPointer, vInfoSize);
    rFileDescription := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'FileVersion'),
      vInfoPointer, vInfoSize);
    rFileVersion := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'InternalName'),
      vInfoPointer, vInfoSize);
    rInternalName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'LegalCopyright'),
      vInfoPointer, vInfoSize);
    rLegalCopyright := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'LegalTrademarks'),
      vInfoPointer, vInfoSize);
    rLegalTrademarks := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'OriginalFileName'),
      vInfoPointer, vInfoSize);
    rOriginalFileName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'ProductName'),
      vInfoPointer, vInfoSize);
    rProductName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'ProductVersion'),
      vInfoPointer, vInfoSize);
    rProductVersion := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'Comments'),
      vInfoPointer, vInfoSize);
    rComments := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, '\', vInfoPointer, vInfoSize);
    rVsFixedFileInfo := TVSFixedFileInfo(vInfoPointer^);
    if mDefineName <> '' then begin
      VerQueryValue(vVersionInfo, PChar(vVersionValue + mDefineName),
        vInfoPointer, vInfoSize);
      rDefineValue := PChar(vInfoPointer);
    end else rDefineValue := '';
  finally
    FreeMem(vVersionInfo, vInfoSize);
  end;
  Result := True;
end; { GetFileVersionInfomation }

function DeletePath(mDirName: string; mPrefix: string; mChangeAttrib: Boolean): Boolean;
var
  vSearchRec: TSearchRec;
  vPathName: string;
  K: Integer;
begin
  Result := True;
  if mDirName = '' then Exit;
  vPathName := mDirName + '\*.*';
  K := FindFirst(vPathName, faAnyFile, vSearchRec);
  while K = 0 do begin
    if (vSearchRec.Attr and faDirectory > 0) and
      (Pos(vSearchRec.Name, '..') = 0) then
    begin
      if mChangeAttrib then
        FileSetAttr(mDirName + '\' + vSearchRec.Name, faDirectory);
      if (mPrefix = '') or (Pos(mPrefix, vSearchRec.Name) = 1) then
        Result := DeletePath(mDirName + '\' + vSearchRec.Name, mPrefix, mChangeAttrib);
    end else if Pos(vSearchRec.Name, '..') = 0 then
    begin
      if mChangeAttrib then
        FileSetAttr(mDirName + '\' + vSearchRec.Name, 0);
      if (mPrefix = '') or (Pos(mPrefix, vSearchRec.Name) = 1) then
        Result := DeleteFile(PChar(mDirName + '\' + vSearchRec.Name));
    end;
    if not Result then Break;
    K := FindNext(vSearchRec);
  end;
  FindClose(vSearchRec);
  Result := RemoveDir(mDirName);
end; { DeletePath }

function FileTimeToDateTime(mFileTime: TFileTime): TDateTime; 
var
  vSystemTime: TSystemTime;
  vLocalFileTime: TFileTime;
begin
  FileTimeToLocalFileTime(mFileTime, vLocalFileTime);
  FileTimeToSystemTime(vLocalFileTime, vSystemTime);
  Result := SystemTimeToDateTime(vSystemTime);
end; { FileTimeToDateTime }

end.
