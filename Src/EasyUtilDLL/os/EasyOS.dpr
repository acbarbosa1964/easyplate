library EasyOS;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  SysUtils,
  Classes,
  untEasyOS in 'untEasyOS.pas';

{$R *.res}

  exports
    GetWindowsVersion,
    GetWindowsVersion_dw,
    GetComputerUserName,
    GetSystemUserName,
    IsIPInstalled,
    GetLocalIp,
    CheckIPNetState,
    NetInternetConnected,
    GetLocalMAC,
    GetLocalMAC_DLL,
    HostToIP,
    GetPrinterStatus,
    CheckPrinter,
    GetWindowsDirectory,
    GetSystemDirectory,
    GetSystemTime,
    GetLocalTime,
    GetCurrentDirectory,
    GetTempPath,
    GetLogicalDrives,
    GetFileTime,
    GlobalMemoryStatus,
    GetSystemInfoWORD,
    GetSystemInfoDWORD,
    GetSystemVersion,
    GetSystemInfoPtr,
    GetFileInformation,
    FileSize,
    CompareFileTime,
    GetFileTime_0,
    ExtractIcon,
    ExtractAssociatedIcon,
    GetFreeDiskSpace,
    GetAllDiskFreeSpace,
    GetVolumeInformation,
    DriveType,
    DisconnectNetworkDrive,
    AddNetworkDrive,
    GetUniversalName,
    FormatDrive,
    GetShortPathName,
    GetFullPathName,
    FindExecutable,
    ShellAbout,
    ShutDown,
    FileInfo,
    SendEMail_Hide,
    CheckMailAddress;
begin
end.
