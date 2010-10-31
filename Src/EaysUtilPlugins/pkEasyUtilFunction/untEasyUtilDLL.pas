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
//    公共DLL函数的调用单元
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyUtilDLL;

interface

uses
  Windows, SysUtils, Classes, Math;

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

  TWinVer = Packed Record
    dwVersion : DWORD;
    sVerSion  : String;   
  end;   

  TKeyBit = (kb128, kb192, kb256);
{$IFDEF VER130}            // This is a bit awkward 
    // 8-byte integer
    TInteger8 = Int64;     // Delphi 5 
{$ELSE} 
  {$IFDEF VER120} 
    TInteger8 = Int64;     // Delphi 4 
  {$ELSE} 
    TInteger8 = COMP;      // Delphi  2 or 3 
  {$ENDIF} 
{$ENDIF}

const
  START_YEAR=1901;
  END_YEAR=2050;

  DLLEasyOS = 'EasyOS.dll';
  CalendarDLL = 'EasyCalendar.dll';
  //----------------------------------------------------------------------------
  //EasyOS.dll
  //获取系统版本 返回字符串
  function GetWindowsVersion: string; stdcall; external 'EasyOS.dll';
  //返回操作系统版本标识
 {Win3x    = $03000000;
  Win95    = $04000000;
  Win98ME  = $04010000;
  WinNT40  = $04020000;
  Win2000  = $05000000;
  WinXP    = $05010000;
  Win2003  = $05020000;
  WinVista = $06000000;
  Win2008  = $06000100;}
  function GetWindowsVersion_dw: DWORD; stdcall; external 'EasyOS.dll';

  //获取计算机用户名
  function GetComputerUserName: PChar; stdcall; external DLLEasyOS;
  
  //获取系统用户名
  function GetSystemUserName: PChar; external DLLEasyOS;

  //检测TCP/IP协议是否安装
  function IsIPInstalled : boolean; external DLLEasyOS;

  //得到本机的局域网Ip地址
  Function GetLocalIp(var LocalIp:string): Boolean; external DLLEasyOS;

  //检测网络状态
  Function CheckIPNetState(IpAddr : string): Boolean; external DLLEasyOS;

  //检测机器是否上网
  Function NetInternetConnected: Boolean; external DLLEasyOS;  {ERROR}

  //获取本地MAC地址
  function GetLocalMAC:string; external DLLEasyOS;

  //获取本地MAC地址 调用DLL
  function GetLocalMAC_DLL: string; external DLLEasyOS;

  //* hosttoip 函数作用是将域名解析成ip
  function HostToIP(Name: string; var Ip: string): Boolean; external DLLEasyOS;

  {*out和in汇编指令在Window2000以上Ring3(普通级别)不能再使用,如果要使用,必须
  进入Ring0指令级别(操作系统级),驱动程序工作在Ring0级别下*}
  function GetPrinterStatus : byte; external DLLEasyOS;//从并行端口读取打印机状态
  function CheckPrinter : boolean; external DLLEasyOS;//获取打印机是否出错

    function GetWindowsDirectory          : String; external DLLEasyOS;     //系统windows路径
    function GetSystemDirectory           : String; external DLLEasyOS;     //系统system路径

    function GetSystemTime          : String; external DLLEasyOS;           //获取系统时间
    function GetLocalTime           : String; external DLLEasyOS;           //本地时间，和系统时间一样
    //文件
    function GetCurrentDirectory        : String; external DLLEasyOS;       //当前文件路径
    function GetTempPath                : String; external DLLEasyOS;       //获取TEMP文件路径，为短路径格式
    function GetLogicalDrives           : String;  external DLLEasyOS;      //获取系统的所有盘符，组成一组字符串

    //获取文件的创建、修改或最后一次的读取时间
    function GetFileTime( const FileName : String; ComparisonType : TTimeOfWhat ) : TFileTime; external DLLEasyOS;
    function GlobalMemoryStatus( const Index : Integer )                          : DWORD; external DLLEasyOS;
    //系统信息
    function GetSystemInfoWORD( const Index : Integer )                           : WORD; external DLLEasyOS;
    function GetSystemInfoDWORD( const Index : Integer )                          : DWORD; external DLLEasyOS;
    function GetSystemVersion           : String; external DLLEasyOS;

    function GetSystemInfoPtr( const Index : Integer )                            : Pointer; external DLLEasyOS;
    //获取指定文件的信息
    function GetFileInformation(const FileName, Value : String ): String; external DLLEasyOS;
    //获取文件大小
    function FileSize(const FileName : String ) : LongInt; external DLLEasyOS;
    //判断两个文件的创建时间的早晚
    function CompareFileTime(const FileNameOne, FileNameTwo : String; ComparisonType : TTimeOfWhat ): TFileTimeComparision; external DLLEasyOS;
    //获取文件的创、修改、最后操作时间
    function GetFileTime_0(const FileName : String; ComparisonType : TTimeOfWhat ): TDateTime; external DLLEasyOS;
    //获取程序图标
    function ExtractIcon(const FileName : String ): HIcon; external DLLEasyOS;
    function ExtractAssociatedIcon( const FileName : String ): HIcon;  external DLLEasyOS;

    //磁盘
    function GetFreeDiskSpace(const Drive : Char ) : LongInt; external DLLEasyOS;
    function GetAllDiskFreeSpace : string; external DLLEasyOS;
    function GetVolumeInformation(const Drive : Char ) : TVolumeInfo; external DLLEasyOS;
    function DriveType(const Drive : Char ) : TDriveType; external DLLEasyOS;
    function DisconnectNetworkDrive( const Drive : Char ): Boolean; external DLLEasyOS;
    function AddNetworkDrive( const Resource : String; const Drive : Char ): Boolean;  external DLLEasyOS;
    function GetUniversalName( const Drive : Char ): String; external DLLEasyOS;
    procedure FormatDrive( const Drive : Char ); external DLLEasyOS;

    //短路径
    function GetShortPathName(const Path : String ): String; external DLLEasyOS;
    function GetFullPathName(const Path : String ): String; external DLLEasyOS;
    //根据可执行文件名，查找可执行文件路径
    function FindExecutable(const FileName : String ): String; external DLLEasyOS;

    procedure ShellAbout( const TitleBar, OtherText : String );  external DLLEasyOS;
    procedure ShutDown; external DLLEasyOS;

    function FileInfo(const FileName : String ) : TFixedFileInfo;  external DLLEasyOS;

    //EMAIL有效性判断
    procedure SendEMail_Hide; external DLLEasyOS;
    function CheckMailAddress(Value : string): boolean; external DLLEasyOS;//判断EMAIL地址是否合法
    
//----------------------------------------------------------------------------
  //EasySysShell.dll
  //系统相关操作
  //设置屏幕分辨率
  function SetScreen(x,y: Word): Boolean; stdcall; external 'EasySysShell.dll';
  {函数说明:}
  {第一个参数是要建立快捷方式的文件, 这是必须的; 其他都是可选参数}
  {第二个参数是快捷方式名称, 缺省使用参数一的文件名}
  {第三个参数是指定目的文件夹, 缺省目的是桌面; 如果有第四个参数, 该参数将被忽略}
  {第四个参数是用常数的方式指定目的文件夹; 该系列常数定义在 ShlObj 单元, CSIDL_ 打头}
  {测试 1: 把当前程序在桌面上建立快捷方式}
  //  procedure TForm1.Button1Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName);
  //  end;
  //
  //  {测试 2: 在桌面上建立快捷方式, 同时指定快捷方式名称}
  //  procedure TForm1.Button2Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName, 'NewLinkName');
  //  end;
  //
  //  {测试 3: 在 C:\ 下建立快捷方式}
  //  procedure TForm1.Button3Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName, '', 'C:\');
  //  end;
  //
  //  {测试 3: 在开始菜单的程序文件夹下建立快捷方式}
  //  procedure TForm1.Button4Click(Sender: TObject);
  //  begin
  //  CreateShortcut(Application.ExeName, '', '', CSIDL_PROGRAMS);
  //  end;
  function CreateShortcut(Exe:string; Lnk:string = ''; Dir:string = '';
           ID:Integer = -1):Boolean; stdcall; external 'EasySysShell.dll';

  //----------------------------------------------------------------------------
  //EasyString.dll
  //简体和繁体互换
  function GB2Big(GB: string): string; stdcall; external 'EasyString.dll';
  function Big2GB(Big: string): string; stdcall; external 'EasyString.dll';

  //----------------------------------------------------------------------------
  //EasyIMCode.dll
  //获取汉字拼音 拼音转汉字
  function MakeSpellCode(stText: string; iMode, iCount: Integer): string; stdcall;
           external 'EasyIMCode.dll';
  { iMode 二进制功能位说明
    X X X X X X X X X X X X X X X X
                             3 2 1
    1: 0 - 只取各个汉字声母的第一个字母; 1 - 全取
    2: 0 - 遇到不能翻译的字符不翻译; 1 - 翻译成 '?' (本选项目针对全角字符)
    3: 0 - 生成的串不包括非数字, 字母的其他字符; 1 - 包括
     (控制全角的要输出非数字, 字母字符的; 半角的非数字, 字母字符)
  }
  function GetSpellCode(szText: PChar; iMode, iCount: Integer): PChar; stdcall;
           external 'EasyIMCode.dll';
  function GetPY(hzchar: string):char; stdcall; external 'EasyIMCode.dll';

  //----------------------------------------------------------------------------
  //EasyEncrypt.dll
  //字符串、文件加解密

  //AES
  function StrToHex(Value: string): string; stdcall; external 'EasyEncrypt.dll';
  function HexToStr(Value: string): string; stdcall; external 'EasyEncrypt.dll';

  function EncryptString(Value: string; Key: string;
    KeyBit: TKeyBit = kb128): string; stdcall; external 'EasyEncrypt.dll';
  function DecryptString(Value: string; Key: string;
    KeyBit: TKeyBit = kb128): string; stdcall; external 'EasyEncrypt.dll';

  function EncryptStream(Src: TStream; Key: string;
    var Dest: TStream; KeyBit: TKeyBit = kb128): Boolean; stdcall; external 'EasyEncrypt.dll';
  function DecryptStream(Src: TStream; Key: string;
    var Dest: TStream; KeyBit: TKeyBit = kb128): Boolean; stdcall; external 'EasyEncrypt.dll';

  procedure EncryptFile(SourceFile, DestFile: string;
    Key: string; KeyBit: TKeyBit = kb128); stdcall; external 'EasyEncrypt.dll';
  procedure DecryptFile(SourceFile, DestFile: string;
    Key: string; KeyBit: TKeyBit = kb128); stdcall; external 'EasyEncrypt.dll';

  //MD5
  function transfer(tran:widestring): widestring; external 'EasyEncrypt.dll';
  function GetCode(Afilename:String): String; external 'EasyEncrypt.dll';

  //Base64
  function StrToBase64(const str: string): string; stdcall; external 'EasyEncrypt.dll';
  function Base64ToStr(const Base64: string): string; stdcall; external 'EasyEncrypt.dll';

  //CRC16
  procedure CalcCRC16 (p:  pointer; nbyte:  WORD;
              var CRCvalue:  WORD); stdcall; external 'EasyEncrypt.dll';
  procedure CalcFileCRC16 (FromName:  string; var CRCvalue:  WORD;
              var IOBuffer:  pointer;  BufferSize:
              WORD; var error:  WORD); stdcall; external 'EasyEncrypt.dll';

  //CRC32
  procedure CalcCRC32(p: pointer; ByteCount: DWORD;
              var CRCvalue: DWORD); stdcall; external 'EasyEncrypt.dll';

  procedure CalcFileCRC32 (FromName: string; var CRCvalue:  DWORD;
              var TotalBytes: TInteger8;
              var error:  WORD); stdcall; external 'EasyEncrypt.dll';

  //日期
  //----------------------------------------------------------------------------
  //   ==>   function   IsLeapYear(Year:   Word):   Boolean;   

  //计算iYear,iMonth,iDay对应是星期几   1年1月1日   ---   65535年12月31日   
  function   WeekDay(iYear,iMonth,iDay:Word):Integer; stdcall; external CalendarDLL;
  //   ==>   function   DayOfWeek(Date:   TDateTime):   Integer;
  //计算指定日期的周数，周0为新年开始后第一个星期天开始的周
  function   WeekNum_A(const   TDT:TDateTime):Word;{overload; }stdcall; external CalendarDLL;
  function   WeekNum_B(const   iYear,iMonth,iDay:Word):Word;{overload; }stdcall; external CalendarDLL;
    
  //返回iYear年iMonth月的天数   1年1月   ---   65535年12月   
  function   MonthDays(iYear,iMonth:Word):Word; stdcall; external CalendarDLL;
    
  //返回阴历iLunarYer年阴历iLunarMonth月的天数，如果iLunarMonth为闰月，   
  //高字为第二个iLunarMonth月的天数，否则高字为0   
  //   1901年1月---2050年12月   
  function   LunarMonthDays(iLunarYear,iLunarMonth:Word):Longword; stdcall;  external CalendarDLL;
    
  //返回阴历iLunarYear年的总天数   
  //   1901年1月---2050年12月   
  function   LunarYearDays(iLunarYear:Word):Word; stdcall; external CalendarDLL;
    
  //返回阴历iLunarYear年的闰月月份，如没有返回0   
  //   1901年1月---2050年12月   
  function   GetLeapMonth(iLunarYear:Word):Word; stdcall; external CalendarDLL;
    
  //把iYear年格式化成天干记年法表示的字符串   
  procedure   FormatLunarYear_A(iYear:Word;var   pBuffer:string);{overload;} stdcall; external CalendarDLL;
  function   FormatLunarYear_B(iYear:Word):string;{overload;} stdcall; external CalendarDLL;
    
  //把iMonth格式化成中文字符串   
  procedure   FormatMonth_A(iMonth:Word;var   pBuffer:string;bLunar:Boolean=True);{overload;} stdcall; external CalendarDLL;
  function   FormatMonth_B(iMonth:Word;bLunar:Boolean=True):string;{overload;} stdcall; external CalendarDLL;
    
  //把iDay格式化成中文字符串   
  procedure   FormatLunarDay_A(iDay:Word;var   pBuffer:string);{overload; }stdcall; external CalendarDLL;
  function   FormatLunarDay_B(iDay:Word):string;{overload; }stdcall; external CalendarDLL;
    
  //计算公历两个日期间相差的天数     1年1月1日   ---   65535年12月31日
  function   CalcDateDiff_A(iEndYear,iEndMonth,iEndDay:Word;iStartYear:Word=START_YEAR;
             iStartMonth:Word=1;iStartDay:Word=1):Longword;{overload; }stdcall; external CalendarDLL;
  function   CalcDateDiff_B(EndDate,StartDate:TDateTime):Longword;{overload; }stdcall; external CalendarDLL;
    
  //计算公历iYear年iMonth月iDay日对应的阴历日期,返回对应的阴历节气   0-24   
  //1901年1月1日---2050年12月31日   
  function   GetLunarDate_A(iYear,iMonth,iDay:Word;
             var iLunarYear,iLunarMonth,iLunarDay:Word):Word;{overload; }stdcall; external CalendarDLL;
  procedure   GetLunarDate_B(InDate:TDateTime;
             var iLunarYear,iLunarMonth,iLunarDay:Word);{overload; }stdcall; external CalendarDLL;
    
  function   GetLunarHolDay_A(InDate:TDateTime):string;{overload; }stdcall; external CalendarDLL;
  function   GetLunarHolDay_B(iYear,iMonth,iDay:Word):string;{overload; }stdcall; external CalendarDLL;

  //private   function--------------------------------------   
    
  //计算从1901年1月1日过iSpanDays天后的阴历日期   
  procedure   l_CalcLunarDate(var iYear,iMonth,iDay:Word;iSpanDays:Longword); stdcall; external CalendarDLL;
    
  //计算公历iYear年iMonth月iDay日对应的节气   0-24，0表不是节气   
  function   l_GetLunarHolDay(iYear,iMonth,iDay:Word):Word; stdcall; external CalendarDLL;

  //根据当前日期返回中国日历字符
  function GetChinaDay: PChar; stdcall; external CalendarDLL;
  
implementation

end.
