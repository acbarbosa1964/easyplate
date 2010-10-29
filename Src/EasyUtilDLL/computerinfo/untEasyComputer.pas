unit untEasyComputer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, WinInet, WinSock, Nb30, StdCtrls;

type
  TTimeOfWhat = ( ftCreationTime, ftLastAccessTime, ftLastWriteTime );
  TFileTimeComparision = ( ftError, ftFileOneIsOlder, ftFileTimesAreEqual, ftFileTwoIsOlder );
  TDriveType = (dtUnknown, dtNoDrive, dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM);
  
  TVolumeInfo = record
     Name               : String;
     SerialNumber       : DWORD;
     MaxComponentLength : DWORD;
     FileSystemFlags    : DWORD;
     FileSystemName     : String;
  end; // TVolumeInfo

  PFixedFileInfo = ^TFixedFileInfo;
  TFixedFileInfo = record
     dwSignature       : DWORD;
     dwStrucVersion    : DWORD;
     wFileVersionMS    : WORD;  // Minor Version
     wFileVersionLS    : WORD;  // Major Version
     wProductVersionMS : WORD;  // Build Number
     wProductVersionLS : WORD;  // Release Version
     dwFileFlagsMask   : DWORD;
     dwFileFlags       : DWORD;
     dwFileOS          : DWORD;
     dwFileType        : DWORD;
     dwFileSubtype     : DWORD;
     dwFileDateMS      : DWORD;
     dwFileDateLS      : DWORD;
  end; // TFixedFileInfo

    // 系统信息
    function GetSystemUserName            : String; stdcall;     //当前系统用户名
    function GetComputerName              : String; stdcall;     //计算机名
    function GetWindowsDirectory          : String; stdcall;     //系统windows路径
    function GetSystemDirectory           : String; stdcall;     //系统system路径

    function GetSystemTime          : String; stdcall;           //获取系统时间
    function GetLocalTime           : String; stdcall;           //本地时间，和系统时间一样
    //文件
    function GetCurrentDirectory        : String; stdcall;       //当前文件路径
    function GetTempPath                : String; stdcall;       //获取TEMP文件路径，为短路径格式
    function GetLogicalDrives           : String; stdcall;       //获取系统的所有盘符，组成一组字符串
    function GetSystemVersion           : String; stdcall;

    function GetFileTime( const FileName : String; ComparisonType : TTimeOfWhat ) : TFileTime; stdcall;
    function GlobalMemoryStatus( const Index : Integer ): DWORD; stdcall;
    //系统信息
    function GetSystemInfoWORD( const Index : Integer ): WORD; stdcall;
    function GetSystemInfoDWORD( const Index : Integer ): DWORD; stdcall;

    function SystemTimeToDateTime(const SystemTime: TSystemTime): TDateTime; stdcall;
    //获取指定文件的信息
    function GetFileInformation(const FileName, Value : String ): String; stdcall;
    //获取文件大小
    function FileSize(const FileName : String ) : LongInt; stdcall;
    //判断两个文件的创建时间的早晚
    function CompareFileTime(const FileNameOne, FileNameTwo : String;
             ComparisonType : TTimeOfWhat ): TFileTimeComparision; stdcall;
    //获取文件的创、修改、最后操作时间
    function GetFileTime_0(const FileName : String; ComparisonType : TTimeOfWhat ): TDateTime; stdcall;
    //获取程序图标
    function ExtractIcon(const FileName : String ): HIcon; stdcall;
    function ExtractAssociatedIcon( const FileName : String ): HIcon; stdcall;

    //磁盘
    function GetFreeDiskSpace(const Drive : Char ) : LongInt; stdcall;
    function GetAllDiskFreeSpace : string; stdcall;
    //断开和映射网络驱动器
    function DisconnectNetworkDrive( const Drive : Char ): Boolean;  stdcall;
    function AddNetworkDrive( const Resource : String; const Drive : Char ): Boolean; stdcall;
    
    function GetVolumeInformation(const Drive : Char ) : TVolumeInfo; stdcall;
    function DriveType(const Drive : Char ) : TDriveType; stdcall;
    function GetUniversalName( const Drive : Char ): String; stdcall;
    procedure FormatDrive( const Drive : Char ); stdcall;

    //短路径
    function GetShortPathName(const Path : String ): String; stdcall;
    function GetFullPathName(const Path : String ): String; stdcall;
    //根据可执行文件名，查找可执行文件路径
    function FindExecutable(const FileName : String ): String; stdcall;

    //关机
    procedure ShutDown; stdcall;

    //--------------------------------------------------------------------------
    //检测TCP/IP协议是否安装
    function IsIPInstalled : boolean; stdcall;
    //得到本机的局域网Ip地址
    Function GetLocalIp(var LocalIp:string): Boolean; stdcall;

    //检测网络状态
    Function CheckIPNetState(IpAddr : string): Boolean; stdcall;

    //检测机器是否上网
    Function NetInternetConnected: Boolean; stdcall;  {ERROR}

    //获取本地MAC地址
    function GetLocalMAC:string; stdcall;

    //获取本地MAC地址 调用DLL
    function GetLocalMAC_DLL: string; stdcall;

    // 以下为CMD方式
    function GetLocalMAC_CMD( AMemo :TMemo;const txtName : string = 'HHF'):Boolean; stdcall;

    //获取指定机器名的MAC 地址
    function GetRemoteMAC_PCName_CMD( AMemo :TMemo; APCName : string;
             const txtName : string = 'HHF'):Boolean; stdcall;
    
    //获取指定IP的MAC 地址
    function GetRemoteMAC_IP_CMD( AMemo :TMemo; AIP : string;
             const txtName : string = 'HHF'):Boolean; stdcall;
    
    //* hosttoip 函数作用是将域名解析成ip
    function HostToIP(Name: string; var Ip: string): Boolean; stdcall;

function SHFormatDrive(hWnd : HWND;Drive, fmtID, Options : WORD) : longint; stdcall; external  'shell32.dll';

implementation

function GetSystemUserName : String;
var
  pcUser   : PChar;
  dwUSize : DWORD;
begin
  dwUSize := 21; // u最大长度为20个字符
  GetMem( pcUser, dwUSize ); // 分配内存
  try
    if Windows.GetUserName( pcUser, dwUSize ) then
      Result := pcUser
  finally
    FreeMem( pcUser ); // 释放内存
  end;
end;

function GetComputerName : String;
var
  pcComputer : PChar;
  dwCSize    : DWORD;
begin
  dwCSize := MAX_COMPUTERNAME_LENGTH + 1;
  GetMem( pcComputer, dwCSize );
  try
    if Windows.GetComputerName( pcComputer, dwCSize ) then
      Result := pcComputer;
  finally
    FreeMem( pcComputer ); 
  end;
end;

function GetWindowsDirectory : String;
var
  pcWindowsDirectory : PChar;
  dwWDSize           : DWORD;
begin
  dwWDSize := MAX_PATH + 1;
  GetMem( pcWindowsDirectory, dwWDSize );
  try
    if Windows.GetWindowsDirectory( pcWindowsDirectory, dwWDSize ) <> 0 then
       Result := pcWindowsDirectory;
  finally
    FreeMem( pcWindowsDirectory ); 
  end;
end;

function GetSystemDirectory : String;
var
  pcSystemDirectory : PChar;
  dwSDSize          : DWORD;
begin
  dwSDSize := MAX_PATH + 1;
  GetMem( pcSystemDirectory, dwSDSize );
  try
    if Windows.GetSystemDirectory( pcSystemDirectory, dwSDSize ) <> 0 then
      Result := pcSystemDirectory;
  finally
    FreeMem( pcSystemDirectory ); 
  end;
end;

function GetSystemTime : String;
var
  stSystemTime : TSystemTime;
begin
  Windows.GetSystemTime( stSystemTime );
  Result := DateTimeToStr( SystemTimeToDateTime( stSystemTime ) );
end;

function GetLocalTime : String;
var
  stSystemTime : TSystemTime;
begin
  Windows.GetLocalTime( stSystemTime );
  Result := DateTimeToStr( SystemTimeToDateTime( stSystemTime ) );
end;

function GetCurrentDirectory: String;
var
  nBufferLength : DWORD;
  lpBuffer 	 : PChar; 
begin
  nBufferLength := MAX_PATH + 1;
  GetMem( lpBuffer, nBufferLength );
  try
    if Windows.GetCurrentDirectory( nBufferLength, lpBuffer ) > 0 then
       Result := lpBuffer;
  finally
    FreeMem( lpBuffer );
  end;
end;

function GetTempPath: String;
var
  nBufferLength : DWORD;
  lpBuffer      : PChar;
begin
  nBufferLength := MAX_PATH + 1;
  GetMem( lpBuffer, nBufferLength );
  try
    if Windows.GetTempPath( nBufferLength, lpBuffer ) <> 0 then
       Result := StrPas( lpBuffer )
    else
       Result := '';
  finally
    FreeMem( lpBuffer );
  end;
end;

function GetLogicalDrives : String;
var
  drives  : set of 0..25;
  drive   : integer;
begin
  Result := '';
  DWORD( drives ) := Windows.GetLogicalDrives;
  for drive := 0 to 25 do
    if drive in drives then
       Result := Result + Chr( drive + Ord( 'A' ));
end;

function GetFileTime( const FileName : String; ComparisonType : TTimeOfWhat ) : TFileTime;
var
  FileTime, LocalFileTime : TFileTime;
  hFile                   : THandle;
begin
  Result.dwLowDateTime := 0;
  Result.dwHighDateTime := 0;
  hFile := FileOpen( FileName, fmShareDenyNone );
  try
    if hFile <> 0 then
    begin
      case ComparisonType of
        ftCreationTime   : Windows.GetFileTime( hFile, @FileTime, nil, nil );
        ftLastAccessTime : Windows.GetFileTime( hFile, nil, @FileTime, nil );
        ftLastWriteTime  : Windows.GetFileTime( hFile, nil, nil, @FileTime );
      end;
      FileTimeToLocalFileTime( FileTime, LocalFileTime );
      Result := LocalFileTime;
    end;
  finally
    FileClose( hFile );
  end; 
end;

function GetSystemVersion: String;
var
  VersionInfo : TOSVersionInfo;
  OSName      : String;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf( TOSVersionInfo );
  if Windows.GetVersionEx( VersionInfo ) then
  begin
    with VersionInfo do
    begin
      case dwPlatformId of
        VER_PLATFORM_WIN32s	  : OSName := 'Win32s';
        VER_PLATFORM_WIN32_WINDOWS : OSName := 'Windows 95';
        VER_PLATFORM_WIN32_NT      : OSName := 'Windows NT';
      end;
      Result := OSName + ' Version ' + IntToStr( dwMajorVersion ) + '.' + IntToStr( dwMinorVersion ) +
                      #13#10' (Build ' + IntToStr( dwBuildNumber ) + ': ' + szCSDVersion + ')';
    end;
  end  else
    Result := '';
end;

function GlobalMemoryStatus( const Index : Integer ): DWORD;
var
  MemoryStatus : TMemoryStatus;
begin
  with MemoryStatus do
  begin
    dwLength := SizeOf( TMemoryStatus );
    Windows.GlobalMemoryStatus( MemoryStatus );
    case Index of
         1 : Result := dwMemoryLoad;
         2 : Result := dwTotalPhys     div 1024;
         3 : Result := dwAvailPhys     div 1024;
         4 : Result := dwTotalPageFile div 1024;
         5 : Result := dwAvailPageFile div 1024;
         6 : Result := dwTotalVirtual  div 1024;
         7 : Result := dwAvailVirtual  div 1024;
       else Result := 0;
    end;
  end;
end;

function GetSystemInfoWORD( const Index : Integer )  : WORD;
var
  SysInfo : TSystemInfo;
begin
  Windows.GetSystemInfo( SysInfo );
  with SysInfo do
      case Index of
         1 : Result := wProcessorArchitecture;
         2 : Result := wProcessorLevel;
         3 : Result := wProcessorRevision;
         else Result := null;
      end; 
end;

function GetSystemInfoDWORD( const Index : Integer ) : DWORD;
var
   SysInfo : TSystemInfo;
begin
   Windows.GetSystemInfo( SysInfo );

   with SysInfo do
      case Index of
         1 : Result := dwPageSize;
         2 : Result := dwActiveProcessorMask;
         3 : Result := dwNumberOfProcessors;
         4 : Result := dwProcessorType;
         5 : Result := dwAllocationGranularity;
         else Result := null;
      end; 
end;

function SystemTimeToDateTime(const SystemTime: TSystemTime): TDateTime;
begin
  with SystemTime do
    Result := EncodeDate(wYear, wMonth, wDay) + EncodeTime(wHour, wMinute, wSecond, wMilliSeconds);
end;

function GetFileInformation( const FileName, Value : String ): String;
var
  dwHandle, dwVersionSize   : DWORD;
  strLangCharSetInfoString  : String;
  pcBuffer                  : PChar;
  pTemp                     : Pointer;
begin
   //////////////////////////////////////////////////////////////////////////////////
   // The Win32 API contains the following predefined version information strings: //
   //////////////////////////////////////////////////////////////////////////////////
   //    CompanyName               FileDescription          FileVersion            //
   //    InternalName              LegalCopyright           OriginalFilename       //
   //    ProductName               ProductVersion           Comments               //
   //    LegalTrademarks                                                           //
   //////////////////////////////////////////////////////////////////////////////////
   strLangCharSetInfoString := '\StringFileInfo\040904E4\' + Value;
   // 获取版本信息
   dwVersionSize := GetFileVersionInfoSize( PChar( FileName ),   // 指向文件名
                                            dwHandle );
   if dwVersionSize <> 0 then
   begin
      GetMem( pcBuffer, dwVersionSize );
      try
         if GetFileVersionInfo( PChar( FileName ),               // pointer to filename string
                                dwHandle,                        // ignored
                                dwVersionSize,                   // size of buffer
                                pcBuffer ) then                  // pointer to buffer to receive file-version info.

            if VerQueryValue( pcBuffer,                          // pBlock     - address of buffer for version resource
                              PChar( strLangCharSetInfoString ), // lpSubBlock - address of value to retrieve
                              pTemp,                             // lplpBuffer - address of buffer for version pointer
                              dwVersionSize ) then               // puLen      - address of version-value length buffer
               Result := PChar( pTemp );
      finally
         FreeMem( pcBuffer );
      end; // try
   end;// if dwVersionSize
end; // GetFileInformation

function CompareFileTime( const FileNameOne, FileNameTwo : String; ComparisonType : TTimeOfWhat ): TFileTimeComparision;
var
  FileOneFileTime : TFileTime;
  FileTwoFileTime : TFileTime;
begin
  Result := ftError;
  FileOneFileTime := GetFileTime( FileNameOne, ComparisonType );
  FileTwoFileTime := GetFileTime( FileNameTwo, ComparisonType );
  case Windows.CompareFileTime( FileOneFileTime, FileTwoFileTime ) of
      -1 : Result := ftFileOneIsOlder;
       0 : Result := ftFileTimesAreEqual;
       1 : Result := ftFileTwoIsOlder;
  end;
end;

function GetFileTime_0( const FileName : String; ComparisonType : TTimeOfWhat ): TDateTime;
var
  SystemTime : TSystemTime;
  FileTime   : TFileTime;
begin
  FileTime := GetFileTime( FileName, ComparisonType );
  if FileTimeToSystemTime( FileTime, SystemTime ) then
    Result := SystemTimeToDateTime( SystemTime )
  else
    Result := StrToDateTime('0000-00-00 00:00:00');
end;

function FileInfo( const FileName :String ) : TFixedFileInfo;
var
  dwHandle, dwVersionSize : DWORD;
  strSubBlock             : String;
  pTemp                   : Pointer;
  pData                   : Pointer;
begin
   strSubBlock := '\';
   dwVersionSize := GetFileVersionInfoSize( PChar( FileName ), // pointer to filename string
                                            dwHandle );        // pointer to variable to receive zero

   // if GetFileVersionInfoSize is successful
   if dwVersionSize <> 0 then
   begin
      GetMem( pTemp, dwVersionSize );
      try
         if GetFileVersionInfo( PChar( FileName ),             // pointer to filename string
                                dwHandle,                      // ignored
                                dwVersionSize,                 // size of buffer
                                pTemp ) then                   // pointer to buffer to receive file-version info.

            if VerQueryValue( pTemp,                           // pBlock     - address of buffer for version resource
                              PChar( strSubBlock ),            // lpSubBlock - address of value to retrieve
                              pData,                           // lplpBuffer - address of buffer for version pointer
                              dwVersionSize ) then             // puLen      - address of version-value length buffer
               Result := PFixedFileInfo( pData )^;
      finally
         FreeMem( pTemp );
      end; // try
   end; // if dwVersionSize
end;

function ExtractIcon( const FileName : String ): HIcon;
begin
   Result := ShellAPI.ExtractIcon( Application.Handle,
                                   PChar( FileName ),
                                   0 );
end;
{************ Example 
   Image1.Picture.Icon.Handle := ExtractIcon( WindowsDirectory + '\Notepad.exe' );}

function ExtractAssociatedIcon( const FileName : String ): HIcon;
var
  wIndex  : WORD;
  pcFileName : Pchar;
begin
  GetMem( pcFileName, MAX_PATH + 1 ); // Allocate memory for our pointer
  try
    StrPCopy( pcFilename, FileName ); // Copy the Filename into the Pchar var
    Result := ShellAPI.ExtractAssociatedIcon( Application.Handle,
                                                pcFileName,
                                                wIndex );
  finally
     FreeMem( pcFileName );
  end; // try
end;

function GetFreeDiskSpace( const Drive : Char ) : LongInt;
var
  lpRootPathName          : PChar;	// address of root path
  lpSectorsPerCluster     : DWORD;	// address of sectors per cluster
  lpBytesPerSector        : DWORD;	// address of bytes per sector
  lpNumberOfFreeClusters  : DWORD;	// address of number of free clusters
  lpTotalNumberOfClusters : DWORD;	// address of total number of clusters
begin
  lpRootPathName := PChar( Drive + ':\' );
  if Windows.GetDiskFreeSpace( lpRootPathName,
                               lpSectorsPerCluster,
                               lpBytesPerSector,
                               lpNumberOfFreeClusters,
                               lpTotalNumberOfClusters ) then
    Result := lpNumberOfFreeClusters * lpBytesPerSector * lpSectorsPerCluster
  else
    Result := -1;
end;

function GetAllDiskFreeSpace : string;
var
  i : integer;
begin
  Result := '';
  for i := 1 to Length( GetLogicalDrives ) do
    Result := Result + GetLogicalDrives[i] + ':\ ' +
           IntToStr( GetFreeDiskSpace( GetLogicalDrives[i] ) ) + ' B' + #13#10;
end;

function FileSize( const FileName : String ) : LongInt;
var
  hFile          : THandle; // handle of file to get size of
  lpFileSizeHigh : DWORD;   // address of high-order WORD for file size
begin
  Result := -1;
  hFile := FileOpen( FileName, fmShareDenyNone );
  try
    if hFile <> 0 then
      Result := Windows.GetFileSize( hFile, @lpFileSizeHigh );
  finally
    FileClose( hFile );
  end; // try
end;

function GetShortPathName( const Path : String ): String;
var
  lpszShortPath : PChar; // points to a buffer to receive the null-terminated short form of the path
begin
  GetMem( lpszShortPath, MAX_PATH + 1 );
  try
    Windows.GetShortPathName( PChar( Path ), lpszShortPath, MAX_PATH + 1 );
    Result := lpszShortPath;
  finally
    FreeMem( lpszShortPath );
  end;
end;

function GetFullPathName( const Path : String ): String;
var
  nBufferLength : DWORD; // size, in characters, of path buffer
  lpBuffer      : PChar; // address of path buffer
  lpFilePart    : PChar; // address of filename in path
begin
  nBufferLength := MAX_PATH + 1;
  GetMem( lpBuffer, MAX_PATH + 1 );
  try
    if Windows.GetFullPathName( PChar( Path ), nBufferLength, lpBuffer, lpFilePart ) <> 0 then
      Result := lpBuffer
    else
      Result := 'ERROR';
  finally
    FreeMem( lpBuffer );
  end;
end;

function GetVolumeInformation( const Drive : Char ) : TVolumeInfo;
var
   lpRootPathName           : PChar; // address of root directory of the file system
   lpVolumeNameBuffer       : PChar; // address of name of the volume
   nVolumeNameSize          : DWORD; // length of lpVolumeNameBuffer
   lpVolumeSerialNumber     : DWORD; // address of volume serial number
   lpMaximumComponentLength : DWORD; // address of system's maximum filename length
   lpFileSystemFlags        : DWORD; // address of file system flags
   lpFileSystemNameBuffer   : PChar; // address of name of file system
   nFileSystemNameSize      : DWORD; // length of lpFileSystemNameBuffer
begin
   GetMem( lpVolumeNameBuffer, MAX_PATH + 1 );
   GetMem( lpFileSystemNameBuffer, MAX_PATH + 1 );
   try
      nVolumeNameSize     := MAX_PATH + 1;
      nFileSystemNameSize := MAX_PATH + 1;

      lpRootPathName := PChar( Drive + ':\' );
      if Windows.GetVolumeInformation( lpRootPathName,
                                       lpVolumeNameBuffer,
                                       nVolumeNameSize,
                                       @lpVolumeSerialNumber,
                                       lpMaximumComponentLength,
                                       lpFileSystemFlags,
                                       lpFileSystemNameBuffer,
                                       nFileSystemNameSize ) then
      begin
         with Result do
         begin
            Name               := lpVolumeNameBuffer;
            SerialNumber       := lpVolumeSerialNumber;
            MaxComponentLength := lpMaximumComponentLength;
            FileSystemFlags    := lpFileSystemFlags;
            FileSystemName     := lpFileSystemNameBuffer;
         end;
      end
      else
      begin
         with Result do
         begin
            Name               := '';
            SerialNumber       := 0;
            MaxComponentLength := 0;
            FileSystemFlags    := 0;
            FileSystemName     := '';
         end;
      end;
   finally
      FreeMem( lpVolumeNameBuffer );
      FreeMem( lpFileSystemNameBuffer );
   end;
end;

function FindExecutable( const FileName : String ): String;
var
  lpResult : PChar;  // address of buffer for string for executable file on return
begin
  GetMem( lpResult, MAX_PATH + 1 );
  try
    if ShellAPI.FindExecutable( PChar( FileName ),
                                  PChar( GetCurrentDirectory ),
                                  lpResult ) > 32 then
      Result := lpResult
    else
      Result := '文件未找到!';
  finally
    FreeMem( lpResult );
  end; // try
end;

function DriveType( const Drive : Char ) : TDriveType;
begin
   Result := TDriveType(GetDriveType(PChar(Drive + ':\')));
end;

function DisconnectNetworkDrive( const Drive : Char ): Boolean;
var
   sDrive    : String;
   pResource : PChar;
begin
   (*
    WNetCancelConnection2(
    LPTSTR  lpszName,	// address of resource name to disconnect
    DWORD  fdwConnection,	// connection type flags
    BOOL  fForce 	// flag for unconditional disconnect
    );
   *)
   sDrive    := Drive + ':';
   pResource := PChar( sDrive );
   Result    := ( Windows.WNetCancelConnection2( pResource, 0, True ) = NO_ERROR );
end;

function AddNetworkDrive( const Resource : String; const Drive : Char ): Boolean;
var
   sDrive : String;
   pDrive : PChar;
begin
   (*
    DWORD WNetAddConnection(
    LPTSTR  lpszRemoteName,	// address of network device name
    LPTSTR  lpszPassword,	// address of password
    LPTSTR  lpszLocalName 	// address of local device name
   );
   *)
   sDrive := Drive + ':';
   pDrive := PChar( sDrive );
   Result := ( Windows.WNetAddConnection( PChar( Resource ), '', pDrive ) = NO_ERROR );
end;

function GetUniversalName( const Drive : Char ): String;
var
   pResource : PChar;
   lpBuffer  : PUniversalNameInfo;
   dwWDSize  : DWORD;
begin
   (*
     DWORD WNetGetUniversalName(
     LPCTSTR  lpLocalPath,	// address of drive-based path for a network resource
     DWORD  dwInfoLevel,	// specifies form of universal name to be obtained
     LPVOID  lpBuffer,   	// address of buffer that receives universal name data structure
     LPDWORD  lpBufferSize 	// address of variable that specifies size of buffer
     );
   *)
   pResource := PChar( Drive + ':\' );
   dwWDSize  := 1024;
   GetMem( lpBuffer, dwWDSize );
   try
      if WNetGetUniversalName( pResource, UNIVERSAL_NAME_INFO_LEVEL, lpBuffer, dwWDSize ) = NO_ERROR then
         Result := lpBuffer.lpUniversalName
      else
         Result := 'ERROR';
   finally
      FreeMem( lpBuffer );
   end;
end;

procedure FormatDrive( const Drive : Char );
var
  wDrive       : WORD;
  dtDrive      : TDriveType;
  strDriveType : String;
begin
   dtDrive := DriveType( Drive );
   // if it's not a HDD or a FDD then raise an exception
   if  ( dtDrive <> dtFloppy ) and ( dtDrive <> dtFixed ) then
      begin
         strDriveType := 'Cannot format a ';
         case dtDrive of
            dtUnknown : strDriveType := 'Cannot determine drive type';
            dtNoDrive : strDriveType := 'Specified drive does not exist';
            dtNetwork : strDriveType := strDriveType + 'Network Drive';
            dtCDROM   : strDriveType := strDriveType + 'CD-ROM Drive';
            dtRAM     : strDriveType := strDriveType + 'RAM Drive';
         end; // case dtDrive

         raise Exception.Create( strDriveType + '.' );
      end // if DriveType
   else // proceed with the format
      begin
         wDrive := Ord( Drive ) - Ord( 'A' );
         // SHFormatDrive is an undocumented API function
         SHFormatDrive( Application.Handle, wDrive, $ffff, 0);
      end; // else
end;

procedure ShutDown;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';   // Borland forgot this declaration
var
  hToken       : THandle;
  tkp          : TTokenPrivileges;
  tkpo         : TTokenPrivileges;
  zero         : DWORD;
begin
  if Pos( 'Windows NT', GetSystemVersion ) = 1  then // we've got to do a whole buch of things
     begin
        zero := 0;
        if not OpenProcessToken( GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
           begin
             MessageBox( 0, 'Exit Error', 'OpenProcessToken() Failed', MB_OK );
             Exit;
           end; // if not OpenProcessToken( GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken)
        if not OpenProcessToken( GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
           begin
             MessageBox( 0, 'Exit Error', 'OpenProcessToken() Failed', MB_OK );
             Exit;
           end; // if not OpenProcessToken( GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken)


        // SE_SHUTDOWN_NAME
        if not LookupPrivilegeValue( nil, 'SeShutdownPrivilege' , tkp.Privileges[ 0 ].Luid ) then
           begin
              MessageBox( 0, 'Exit Error', 'LookupPrivilegeValue() Failed', MB_OK );
              Exit;
           end; // if not LookupPrivilegeValue( nil, 'SeShutdownPrivilege' , tkp.Privileges[0].Luid )
        tkp.PrivilegeCount := 1;
        tkp.Privileges[ 0 ].Attributes := SE_PRIVILEGE_ENABLED;

        AdjustTokenPrivileges( hToken, False, tkp, SizeOf( TTokenPrivileges ), tkpo, zero );
        if Boolean( GetLastError() ) then
           begin
              MessageBox( 0, 'Exit Error', 'AdjustTokenPrivileges() Failed', MB_OK );
              Exit;
           end // if Boolean( GetLastError() )
        else
           ExitWindowsEx( EWX_FORCE or EWX_SHUTDOWN, 0 );
      end // if OSVersion = 'Windows NT'
   else
      begin // just shut the machine down
        ExitWindowsEx( EWX_FORCE or EWX_SHUTDOWN, 0 );
      end; // else
end;

//------------------------------------------------------------------------------
//功 能: 判断ip协议有没有安装
//参 数: 无
//返回值: 成功: true 失败: false;
//备 注: 该函数还有问题
//版 本:
//1.0 2002/10/02 21:05:00
//------------------------------------------------------------------------------
function IsIPInstalled : boolean;
var
  wsdata  : TWSAData;
  protoent: PProtoEnt;
begin
  result := true;
  try
    if wsastartup(2,wsdata) = 0 then
    begin
      protoent := getprotobyname('ip');
      if protoent = nil then
        result := false
    end;
  finally
    wsacleanup;
  end;
end;  

{=================================================================
     功     能:     检测计算机是否上网
     参     数:     无
     返 回  值:     成功:     True     失败: False;
     uses     :     WinInet
=================================================================}
function NetInternetConnected: Boolean;
const
  // local system uses a modem to connect to the Internet.
  INTERNET_CONNECTION_MODEM = 1;
  // local system uses a local area network to connect to the Internet.
  INTERNET_CONNECTION_LAN = 2;
  // local system uses a proxy server to connect to the Internet.
  INTERNET_CONNECTION_PROXY = 4;
  // local system's modem is busy with a non-Internet connection.
  INTERNET_CONNECTION_MODEM_BUSY = 8;
var
  dwConnectionTypes : DWORD;
begin
  dwConnectionTypes := INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_MODEM +
                       INTERNET_CONNECTION_PROXY;
     //Result := InternetGetConnectedState(@dwConnectionTypes, 1);
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

{=================================================================
 功 能: 检测网络状态
 参 数: IpAddr: 被测试网络上主机的IP地址或名称，建议使用Ip
 返回值: 成功: True 失败: False;
 备 注:  uses WinSock

=================================================================}
Function CheckIPNetState(IpAddr: string): Boolean;
type
  PIPOptionInformation = ^TIPOptionInformation;
  TIPOptionInformation = packed record
     TTL:         Byte;      // Time To Live (used for traceroute)
     TOS:         Byte;      // Type Of Service (usually 0)
     Flags:       Byte;      // IP header flags (usually 0)
     OptionsSize: Byte;      // Size of options data (usually 0, max 40)
     OptionsData: PChar;     // Options data buffer
  end;

  PIcmpEchoReply = ^TIcmpEchoReply;
  TIcmpEchoReply = packed record
     Address:       DWord;                // replying address
     Status:        DWord;                // IP status value (see below)
     RTT:           DWord;                // Round Trip Time in milliseconds
     DataSize:      Word;                 // reply data size
     Reserved:      Word;
     Data:          Pointer;              // pointer to reply data buffer
     Options:       TIPOptionInformation; // reply options
  end;

  TIcmpCreateFile = function: THandle; stdcall;
  TIcmpCloseHandle = function(IcmpHandle: THandle): Boolean; stdcall;
  TIcmpSendEcho = function(
     IcmpHandle:          THandle;
     DestinationAddress:  DWord;
     RequestData:         Pointer;
     RequestSize:         Word;
     RequestOptions:      PIPOptionInformation;
     ReplyBuffer:         Pointer;
     ReplySize:           DWord;
     Timeout:             DWord
  ): DWord; stdcall;

const
  Size = 32;
  TimeOut = 1000;
var
  wsadata: TWSAData;
  Address: DWord;                     // Address of host to contact
  HostName, HostIP: String;           // Name and dotted IP of host to contact
  Phe: PHostEnt;                      // HostEntry buffer for name lookup
  BufferSize, nPkts: Integer;
  pReqData, pData: Pointer;
  pIPE: PIcmpEchoReply;               // ICMP Echo reply buffer
  IPOpt: TIPOptionInformation;        // IP Options for packet to send
const
  IcmpDLL = 'icmp.dll';
var
  hICMPlib: HModule;
  IcmpCreateFile : TIcmpCreateFile;
  IcmpCloseHandle: TIcmpCloseHandle;
  IcmpSendEcho:    TIcmpSendEcho;
  hICMP: THandle;                     // Handle for the ICMP Calls
begin
  // initialise winsock
  Result:=True;
  if WSAStartup(2,wsadata) <> 0 then begin
     Result:=False;
     halt;
  end;
  // register the icmp.dll stuff
  hICMPlib := loadlibrary(icmpDLL);
  if hICMPlib <> null then begin
    @ICMPCreateFile := GetProcAddress(hICMPlib, 'IcmpCreateFile');
    @IcmpCloseHandle:= GetProcAddress(hICMPlib, 'IcmpCloseHandle');
    @IcmpSendEcho:= GetProcAddress(hICMPlib, 'IcmpSendEcho');
    if (@ICMPCreateFile = Nil) or (@IcmpCloseHandle = Nil) or (@IcmpSendEcho = Nil) then begin
        Result:=False;
        halt;
    end;
    hICMP := IcmpCreateFile;
    if hICMP = INVALID_HANDLE_VALUE then begin
      Result:=False;
      halt;
    end;
  end else begin
    Result:=False;
    halt;
  end;
// ------------------------------------------------------------
  Address := inet_addr(PChar(IpAddr));
  if (Address = INADDR_NONE) then begin
    Phe := GetHostByName(PChar(IpAddr));
    if Phe = Nil then Result:=False
    else begin
      Address := longint(plongint(Phe^.h_addr_list^)^);
      HostName := Phe^.h_name;
      HostIP := StrPas(inet_ntoa(TInAddr(Address)));
    end;
  end
  else begin
    Phe := GetHostByAddr(@Address, 4, PF_INET);
    if Phe = Nil then Result:=False;
  end;

  if Address = INADDR_NONE then
  begin
     Result:=False;
  end;
  // Get some data buffer space and put something in the packet to send
  BufferSize := SizeOf(TICMPEchoReply) + Size;
  GetMem(pReqData, Size);
  GetMem(pData, Size);
  GetMem(pIPE, BufferSize);
  FillChar(pReqData^, Size, $AA);
  pIPE^.Data := pData;

    // Finally Send the packet
  FillChar(IPOpt, SizeOf(IPOpt), 0);
  IPOpt.TTL := 64;
  NPkts := IcmpSendEcho(hICMP, Address, pReqData, Size,
                        @IPOpt, pIPE, BufferSize, TimeOut);
  if NPkts = 0 then Result:=False;

  // Free those buffers
  FreeMem(pIPE); FreeMem(pData); FreeMem(pReqData);

// --------------------------------------------------------------
  IcmpCloseHandle(hICMP);
  FreeLibrary(hICMPlib);
  // free winsock
  if WSACleanup <> 0 then Result:=False;
end;

{=================================================================
  功  能: 返回本机的局域网Ip地址
  参  数: 无
  返回值: 成功:  True, 并填充LocalIp   失败: ?False
  备 注:
================================================================}
function GetLocalIP(var LocalIp: string): Boolean;
var
  HostEnt  : PHostEnt;
  Ip       : string;
  addr     : pchar;
  Buffer   : array [0..63] of char;
  GInitData: TWSADATA;
begin
  Result := False;
  try
    WSAStartup(2, GInitData);
    GetHostName(Buffer, SizeOf(Buffer));
    HostEnt := GetHostByName(buffer);
    if HostEnt = nil then Exit;
    addr := HostEnt^.h_addr_list^;
    ip := Format('%d.%d.%d.%d', [byte(addr [0]),
          byte (addr [1]), byte (addr [2]), byte (addr [3])]);
    LocalIp := Ip;
    Result := True;
  finally
    WSACleanup;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    tHhfNetWork.GetLocalMAC
  作者:      Administrator
  日期:      2008.11.03
  参数:      无
  返回值:    string  LOCAL MAC
  USES :  Nb30
  ERROR : 如果机器上存在VM类的虚拟机，则取出的MAC地址为第一个虚拟机的
-------------------------------------------------------------------------------}
function GetLocalMAC:string;
var
  ncb      : TNCB;
  status   : TAdapterStatus;
  lanenum : TLanaEnum;
  procedure ResetAdapter (num : char);
  begin
    fillchar(ncb,sizeof(ncb),0);
    ncb.ncb_command:=char(NCBRESET);
    ncb.ncb_lana_num:=num;
    Netbios(@ncb);
  end;
var
  i:integer;
  lanNum   : char;
  address : record
  part1 : Longint;
  part2 : Word;
  end absolute status;
begin
  Result:='';
  fillchar(ncb,sizeof(ncb),0);
  ncb.ncb_command:=char(NCBENUM);
  ncb.ncb_buffer:=@lanenum;
  ncb.ncb_length:=sizeof(lanenum);
  Netbios(@ncb);
  if lanenum.length=#0 then exit;
  lanNum:=lanenum.lana[0];
  ResetAdapter(lanNum);
  fillchar(ncb,sizeof(ncb),0);
  ncb.ncb_command:=char(NCBASTAT);
  ncb.ncb_lana_num:=lanNum;
  ncb.ncb_callname[0]:='*';
  ncb.ncb_buffer:=@status;
  ncb.ncb_length:=sizeof(status);
  Netbios(@ncb);
  ResetAdapter(lanNum);
  for i:=0 to 5 do
  begin
    result:=result+inttoHex(integer(Status.adapter_address[i]),2);
    if (i<5) then
      result:=result+'-';
  end;
end;

function GetLocalMAC_DLL:string;
var
   Lib: Cardinal;
   Func: function(GUID: PGUID): Longint; stdcall;
   GUID1, GUID2: TGUID;
begin
  Result := '';
  Lib := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then
  begin
    if Win32Platform <>VER_PLATFORM_WIN32_NT then
      @Func := GetProcAddress(Lib, 'UuidCreate')
      else @Func := GetProcAddress(Lib, 'UuidCreateSequential');
    if Assigned(Func) then
    begin
      if (Func(@GUID1) = 0) and
        (Func(@GUID2) = 0) and
        (GUID1.D4[2] = GUID2.D4[2]) and
        (GUID1.D4[3] = GUID2.D4[3]) and
        (GUID1.D4[4] = GUID2.D4[4]) and
        (GUID1.D4[5] = GUID2.D4[5]) and
        (GUID1.D4[6] = GUID2.D4[6]) and
        (GUID1.D4[7] = GUID2.D4[7]) then
      begin
        Result :=
         IntToHex(GUID1.D4[2], 2) + '-' +
         IntToHex(GUID1.D4[3], 2) + '-' +
         IntToHex(GUID1.D4[4], 2) + '-' +
         IntToHex(GUID1.D4[5], 2) + '-' +
         IntToHex(GUID1.D4[6], 2) + '-' +
         IntToHex(GUID1.D4[7], 2);
      end;
    end;
    FreeLibrary(Lib);
  end;
end;

function GetLocalMAC_CMD( AMemo :TMemo;const txtName : string = 'HHF') : Boolean;
var
  command : string;
  temp    : string;
begin
  Result := False;
  temp := 'c:\' + txtName + '.txt';
  command:='command.com   /C   nbtstat   '+'-n     >   '+ temp;
  if FileExists(temp) then
    DeleteFile(temp);
  winexec(pchar(command),sw_hide);
  while not fileexists(temp) do
      sleep(3000);
  AMemo.Lines.LoadFromFile(temp);
  Sleep(3000);
  DeleteFile(temp);
  Result := True;
end;

function GetRemoteMAC_PCName_CMD( AMemo :TMemo; APCName : string; const txtName : string = 'HHF') : Boolean;
var
  command : string;
  temp    : string;
begin
  Result := False;
  temp := 'c:\' + txtName + '.txt';
  command:='command.com   /C   nbtstat   '+'-a   '+ APCName +'   >   '+temp;   //通过计算查询MAC地址
  if FileExists(temp) then
    DeleteFile(temp);
  winexec(pchar(command),sw_hide);
  if not fileexists(temp) then
  repeat
      sleep(3000);
  until
    FileExists(temp);
      sleep(6000);
  AMemo.Lines.LoadFromFile(temp);
//  Sleep(6000);
//  DeleteFile(temp);
  Result := True;
end;

function GetRemoteMAC_IP_CMD( AMemo :TMemo; AIP : string; const txtName : string = 'HHF'):Boolean;
var
  command : string;
  temp    : string;
begin
  Result := False;
  temp := 'c:\' + txtName + '.txt';
  command:='command.com   /C   nbtstat   '+'-A   '+ AIP +'   >   '+temp;
  if FileExists(temp) then
    DeleteFile(temp);
  winexec(pchar(command),sw_hide);
  if not fileexists(temp) then
  repeat
      sleep(3000);
  until
    FileExists(temp);
      sleep(6000);
  AMemo.Lines.LoadFromFile(temp);
  Sleep(6000);
  DeleteFile(temp);
  Result := True;
end;

//hosttoip 函数作用是将域名解析成ip
function HostToIP(Name: string; var Ip: string): Boolean;
var
  wsdata : TWSAData;
  hostName : array [0..255] of char;
  hostEnt : PHostEnt;
  addr : PChar;
begin
  WSAStartup ($0101, wsdata);
  try
    gethostname(hostName, sizeof (hostName));
    StrPCopy(hostName, Name);
    hostEnt := gethostbyname(hostName);
    if Assigned (hostEnt) then
      if Assigned (hostEnt^.h_addr_list) then
      begin
        addr := hostEnt^.h_addr_list^;
        if Assigned (addr) then
        begin
          IP := Format ('%d.%d.%d.%d', [byte (addr [0]),
          byte (addr [1]), byte (addr [2]), byte (addr [3])]);
          Result := True;
        end else
          Result := False;
      end else
        Result := False
    else
    begin
      Result := False;
    end;
  finally
    WSACleanup;
  end;
end;
{* EXP
procedure TForm1.Button1Click(Sender: TObject);
var     //定义一个字符串变量
Temp:string; 
begin   
HostToIP(edit1.text,Temp); //将输入的域名解析成IP
edit2.Text:=Temp; //显示在EDIT2当中
end;
}

end.
