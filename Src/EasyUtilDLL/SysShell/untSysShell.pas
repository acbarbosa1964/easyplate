unit untSysShell;

interface

uses
  Windows, SysUtils, Variants, Classes;

  //设置屏幕分辨率如1024X768
  function SetScreen(x,y: Word): Boolean; stdcall;
  function CreateShortcut(Exe:string; Lnk:string = ''; Dir:string = '';
           ID:Integer = -1):Boolean; stdcall;

implementation
uses
  ShlObj, ActiveX, ComObj;

function SetScreen(x,y: Word): Boolean;
var
  DevMode: TDeviceMode;
begin
  Result := EnumDisplaySettings(nil, 0, DevMode);
  if Result then
  begin
    DevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    DevMode.dmPelsWidth := x;
    DevMode.dmPelsHeight := y;
    Result := ChangeDisplaySettings(DevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end;

{函数说明:}
{第一个参数是要建立快捷方式的文件, 这是必须的; 其他都是可选参数}
{第二个参数是快捷方式名称, 缺省使用参数一的文件名}
{第三个参数是指定目的文件夹, 缺省目的是桌面; 如果有第四个参数, 该参数将被忽略}
{第四个参数是用常数的方式指定目的文件夹; 该系列常数定义在 ShlObj 单元, CSIDL_ 打头}

function CreateShortcut(Exe:string; Lnk:string = ''; Dir:string = ''; ID:Integer = -1):Boolean;
var
  IObj: IUnknown;
  ILnk: IShellLink;
  IPFile: IPersistFile;
  PIDL: PItemIDList;
  InFolder: array[0..MAX_PATH] of Char;
  LinkFileName: WideString;
begin
  Result := False;
  if not FileExists(Exe) then
    Exit;
  if Lnk = '' then
    Lnk := ChangeFileExt(ExtractFileName(Exe), '');

  IObj := CreateComObject(CLSID_ShellLink);
  ILnk := IObj as IShellLink;
  ILnk.SetPath(PChar(Exe));
  ILnk.SetWorkingDirectory(PChar(ExtractFilePath(Exe)));

  if (Dir = '') and (ID = -1) then
    ID := CSIDL_DESKTOP;
  if ID > -1 then
  begin
    SHGetSpecialFolderLocation(0, ID, PIDL);
    SHGetPathFromIDList(PIDL, InFolder);
    LinkFileName := Format('%s\%s.lnk', [InFolder, Lnk]);
  end
  else
  begin
    Dir := ExcludeTrailingPathDelimiter(Dir);
    if not DirectoryExists(Dir) then
      Exit;
    LinkFileName := Format('%s\%s.lnk', [Dir, Lnk]);
  end;

  IPFile := IObj as IPersistFile;
  if IPFile.Save(PWideChar(LinkFileName), False) = 0 then
    Result := True;
end; {CreateShortcut 函数结束}


end.
