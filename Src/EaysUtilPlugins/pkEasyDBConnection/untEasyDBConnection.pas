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
//      1、EasyADOConnection
//         输出一个有效的
//      2、定时检查数据连接有效性
//-----------------------------------------------------------------------------}
unit untEasyDBConnection;

interface

uses
  Windows, SysUtils, Classes, DB, ADODB, IniFiles, Forms, untEasyUtilRWIni,
  Provider, MConnect, ObjBrkr, DBClient, SConnect, Dialogs, EasyPlateServer_TLB;

function GenrateEasyDBConnection(AHandle: THandle): Integer; stdcall;
         exports GenrateEasyDBConnection;

type
  TDMEasyDBConnection = class(TDataModule)
    EasyADOConn: TADOConnection;
    EasyScktConn: TSocketConnection;
    EasySOB: TSimpleObjectBroker;
    EasyQry: TADOQuery;
    EasyDsp: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    //获取库类型 MSSQL、ORACLE
    FDBType: String;
    //当前程序运行模式：CS两层 CAS三层
    FAppType: string;
    //连接类型：innet 内网 outnet 外网
    FNetType: String;
    //服务器地址、用户名、密码、数据库、端口
    FDBHost,
    FDBUserName,
    FDBPassWord,
    FDBDataBase,
    FDBPort   : string;
    //ScktConnection连接信息
    FScktHost,
    FScktIGUID,
    FScktIName,
    FScktSGUID,
    FScktSName,
    FScktPort : string;
    //存储当前登录的用户ID和数据模块句柄
    FCurrLoginUserID: string;
    FCurrLoginDBHandle: Cardinal;
    //获取数据连接Ini
    FEasyDBIni: TEasyRWIni;
    FDBIniFilePath: string;
    function GetDBIniFilePath: string;
    procedure SetDBIniFilePath(const Value: string);
    //打开ADOConnection
    function OpenEasyADOConnection(DBType, NetType: string): Integer;
    //打开Sckt连接
    function OpenEasyScktConnection: Integer;
    //读取配置文件信息
    procedure ReadIniFile(AFileName, ASeed: string);
    //负载均衡加载可用的服务器
    procedure LoadSOBServers;
    //读取负载均衡服务器
    procedure ReadSOBFile(AFileName, ASeed: string);
    
    procedure SetNetType(const Value: string);
    procedure SetDBDataBase(const Value: string);
    procedure SetDBHost(const Value: string);
    procedure SetDBPassWord(const Value: string);
    procedure SetDBPort(const Value: string);
    procedure SetDBUserName(const Value: string);
    procedure SetDBType(const Value: string);
    function GetCurrLoginDBHandle: Cardinal;
    function GetCurrLoginUserID: string;
    procedure SetCurrLoginDBHandle(const Value: Cardinal);
    procedure SetCurrLoginUserID(const Value: string);
    function GetAppType: string;
    procedure SetAppType(const Value: string);
    function GetScktHost: string;
    function GetScktIGUID: string;
    function GetScktIName: string;
    function GetScktPort: string;
    function GetScktSGUID: string;
    function GetScktSName: string;
    procedure SetScktHost(const Value: string);
    procedure SetScktIGUID(const Value: string);
    procedure SetScktIName(const Value: string);
    procedure SetScktPort(const Value: string);
    procedure SetScktSGUID(const Value: string);
    procedure SetScktSName(const Value: string);
  public
    { Public declarations }
    EasyApplicationHandle: Cardinal;      //主应用程序句柄
    //如果是三层 获取远端的服务接口
    EasyIRDMEasyPlateServerDisp: IRDMEasyPlateServerDisp;
    property EasyDBIniFilePath: string read GetDBIniFilePath write SetDBIniFilePath;
    property EasyDBType: string read FDBType write SetDBType;
    property EasyNetType: string read FNetType write SetNetType;
    property EasyAppType: string read GetAppType write SetAppType;

    //服务器地址、用户名、密码、数据库、端口
    property EasyDBHost: string read FDBHost write SetDBHost;
    property EasyDBUserName: string read FDBUserName write SetDBUserName;
    property EasyDBPassWord: string read FDBPassWord write SetDBPassWord;
    property EasyDBDataBase: string read FDBDataBase write SetDBDataBase;
    property EasyDBPort: string read FDBPort write SetDBPort;

    //Socket连接信息
    property EasyScktHost: string read GetScktHost write SetScktHost;
    //拦截压缩数据的COM GUID和名称
    property EasyScktIGUID: string read GetScktIGUID write SetScktIGUID;
    property EasyScktIName: string read GetScktIName write SetScktIName;
    //服务器名称和GUID
    property EasyScktSGUID: string read GetScktSGUID write SetScktSGUID;
    property EasyScktSName: string read GetScktSName write SetScktSName;
    property EasyScktPort: string read GetScktPort write SetScktPort;

    //存储当前登录的用户ID和数据模块句柄
    property EasyCurrLoginUserID: string read GetCurrLoginUserID write SetCurrLoginUserID;
    property EasyCurrLoginDBHandle: Cardinal read GetCurrLoginDBHandle write SetCurrLoginDBHandle;

  end;

var
  DMEasyDBConnection: TDMEasyDBConnection;

implementation

{$R *.dfm}

uses
  ActiveX;
  
function GenrateEasyDBConnection(AHandle: THandle): Integer; stdcall;
begin
  Result := 0;
  Application.Handle := AHandle;
  try
    DMEasyDBConnection := TDMEasyDBConnection.Create(nil);
  except on e:Exception do
    begin
      Result := -1;
      Application.Terminate;
    end;
  end;
end;  

{ TDMEasyDBConnection }

procedure TDMEasyDBConnection.DataModuleCreate(Sender: TObject);
begin
//  ShowMessage(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now));
  FDBIniFilePath := 'DBConfig.ini';
  FAppType := 'CS';

  //调整查询缓存大小
  EasyQry.CacheSize :=1000;
  //设置EasyRDMDsp可远程执行SQL语句
  EasyDsp.Options := EasyDsp.Options + [poAllowCommandText];

  //先初始化数据库配置
  ReadIniFile(EasyDBIniFilePath, 'ABC123_888888');

  if UpperCase(EasyAppType) = 'CAS' then
  begin
    //打开Sckt连接
    if OpenEasyScktConnection <> 1 then
    begin
      Application.MessageBox('中间层服务器连接异常!', '提示', MB_OK + 
        MB_ICONWARNING);
      Exit;    
    end
  end
  else
    //打开ADO两层数据连接
    OpenEasyADOConnection(EasyDBType, EasyNetType);  
  //加载可用的服务器
//  LoadSOBServers;
  //调整负载均衡
//  if not EasySOB.LoadBalanced then
//    EasySOB.LoadBalanced := True;
  //如果是三层就获取远程的服务接口
  if UpperCase(EasyAppType) = 'CAS' then
  begin
    EasyIRDMEasyPlateServerDisp := IRDMEasyPlateServerDisp((IDispatch(EasyScktConn.AppServer)));
  end;
end;

function TDMEasyDBConnection.GetDBIniFilePath: string;
begin
  Result := FDBIniFilePath;
end;

procedure TDMEasyDBConnection.SetDBIniFilePath(const Value: string);
begin
  FDBIniFilePath := Value;
end;

procedure TDMEasyDBConnection.DataModuleDestroy(Sender: TObject);
begin
  if EasyADOConn.Connected then
    EasyADOConn.Close;
  if Assigned(FEasyDBIni) then
    FEasyDBIni.Free;
end;

procedure TDMEasyDBConnection.ReadIniFile(AFileName, ASeed: string);
var
  Ini      : TEasyXorIniFile;
  Sections,
  Values   : TStrings;
begin
  Ini := nil;
  Sections := nil;
  Values := nil;
  try
    Ini := TEasyXorIniFile.Create(AFileName, ASeed);

    Sections := TStringList.Create;
    Values := TStringList.Create;

    Ini.ReadSections(Sections);
    //应用程序运行模式CS二层 CAS三层
    FAppType := ini.ReadString('APPTYPE', 'APPTYPE', 'CS');
    //获取数据库连接类型、连接内/外网
    FDBType := ini.ReadString('DBTYPE', 'DBTYPE', 'MSSQL');
    FNetType := ini.ReadString('NETTYPE', 'NETTYPE', 'innet');
    //服务器地址、用户名、密码、数据库、端口
    FDBHost := ini.ReadString('DBCONFIG', 'HOST', '');
    FDBUserName := ini.ReadString('DBCONFIG', 'USERNAME', '');
    FDBPassWord := ini.ReadString('DBCONFIG', 'PASSWORD', '');
    FDBDataBase := ini.ReadString('DBCONFIG', 'DATABASE', '');
    FDBPort := ini.ReadString('DBCONFIG', 'PORT', '');

    //获取Sckt连接参数
    FScktHost := ini.ReadString('SCKT', 'HOST', '');
    FScktIGUID := ini.ReadString('SCKT', 'IGUID', '');
    FScktIName := ini.ReadString('SCKT', 'INAME', '');
    FScktSGUID := ini.ReadString('SCKT', 'SGUID', '');
    FScktSName := ini.ReadString('SCKT', 'SNAME', '');
    FScktPort := ini.ReadString('SCKT', 'PORT', '');
  finally
    Sections.Free;
    Ini.Free;
    Values.Free;
  end;
end;

procedure TDMEasyDBConnection.SetNetType(const Value: string);
begin
  FNetType := Value;
end;

procedure TDMEasyDBConnection.SetDBDataBase(const Value: string);
begin
  FDBDataBase := Value;
end;

procedure TDMEasyDBConnection.SetDBHost(const Value: string);
begin
  FDBHost := Value;
end;

procedure TDMEasyDBConnection.SetDBPassWord(const Value: string);
begin
  FDBPassWord := Value;
end;

procedure TDMEasyDBConnection.SetDBPort(const Value: string);
begin
  FDBPort := Value;
end;

procedure TDMEasyDBConnection.SetDBUserName(const Value: string);
begin
  FDBUserName := Value;
end;

//0成功 -1失败
function TDMEasyDBConnection.OpenEasyADOConnection(DBType,
  NetType: string): Integer;
begin
  Result := 0;
  if EasyADOConn.Connected then
    EasyADOConn.Close;
  EasyADOConn.LoginPrompt := False;
  EasyADOConn.ConnectionString := '';
  begin
    if UpperCase(trim(DBType)) = 'MSSQL' then
    begin
      if UpperCase(trim(NetType)) = 'INNET' then
        EasyADOConn.ConnectionString := 'Provider=SQLOLEDB.1;Password='
          + trim(EasyDBPassWord) + ';Persist Security Info=True;User ID='
          + trim(EasyDBUserName) + ';Initial Catalog='
          + trim(EasyDBDataBase) + ';Data Source='
          + trim(EasyDBHost) + ';' + Trim(EasyDBPort) + ''
      else
        EasyADOConn.ConnectionString := 'Provider=SQLOLEDB.1;Password='
          + trim(EasyDBPassWord) + ';Persist Security Info=True;User ID='
          + trim(EasyDBUserName) + ';Initial Catalog='
          + trim(EasyDBDataBase) + ';Data Source=' 
          + trim(EasyDBDataBase) + ';NetWork Library=DBMSSOCN;NetWork Address='
          + trim(EasyDBHost) + ';' + trim(EasyDBPort) + '';
    end
    else if UpperCase(trim(DBType)) = 'ORACLE' then
      EasyADOConn.ConnectionString := 'Provider=MSDAORA.1;Password='
          + trim(EasyDBPassWord) + ';User ID='
          + trim(EasyDBUserName) + ';Data Source='
          + trim(EasyDBDataBase) + ';Persist Security Info=False';
    try
      EasyADOConn.Open;
    except on e: Exception do
      Result := -1
    end; 
  end;  
end;

procedure TDMEasyDBConnection.SetDBType(const Value: string);
begin
  FDBType := Value;
end;


function TDMEasyDBConnection.GetCurrLoginDBHandle: Cardinal;
begin
  Result := FCurrLoginDBHandle;
end;

function TDMEasyDBConnection.GetCurrLoginUserID: string;
begin
  Result := FCurrLoginUserID;
end;

procedure TDMEasyDBConnection.SetCurrLoginDBHandle(const Value: Cardinal);
begin
  FCurrLoginDBHandle := Value;
end;

procedure TDMEasyDBConnection.SetCurrLoginUserID(const Value: string);
begin
  FCurrLoginUserID := Value;
end;

function TDMEasyDBConnection.GetAppType: string;
begin
  Result := FAppType;
end;

procedure TDMEasyDBConnection.SetAppType(const Value: string);
begin
  FAppType := Value;
end;

procedure TDMEasyDBConnection.LoadSOBServers;
begin
  ReadSOBFile('Servers.ini', 'ABC123_888888');
end;

procedure TDMEasyDBConnection.ReadSOBFile(AFileName, ASeed: string);
var
  Ini      : TEasyXorIniFile;
  Sections : TStrings;
  I        : Integer;
  AHost,
  AEnable,
  APort     : string;
begin
  //先清空服务器列表
  EasySOB.Servers.Clear;
  Ini := nil;
  Sections := nil;
  try
    Ini := TEasyXorIniFile.Create(AFileName, ASeed);

    Sections := TStringList.Create;
    Ini.ReadSections(Sections);
    for I := 0 to Sections.Count - 1 do
    begin
      AHost := ini.ReadString(Sections.Strings[I], 'HOST', '');
      AEnable := ini.ReadString(Sections.Strings[I], 'ENABLE', '');
      APort := ini.ReadString(Sections.Strings[I], 'PORT', '');
      with EasySOB.Servers do
      begin
        Add.Index := I;
        Items[I].ComputerName := AHost;
        if UpperCase(AEnable) = 'TRUE' then
          Items[I].Enabled := True
        else
          Items[I].Enabled := False;
        Items[I].Port := StrToInt(APort);
      end;
    end;
  finally
    Sections.Free;
    Ini.Free;
  end;
end;

//连接Sckt
function TDMEasyDBConnection.OpenEasyScktConnection: Integer;
begin
  Result := 0;
  with EasyScktConn do
  begin
    Address := EasyScktHost;
////    Host := EasyScktHost;
    if Trim(EasyScktIGUID) <> '' then
      InterceptGUID := EasyScktIGUID;
    if Trim(EasyScktIName) <> '' then
      InterceptName := EasyScktIName;
    Port := StrToInt(EasyScktPort);
    if Trim(EasyScktSGUID) <> '' then
      ServerGUID := EasyScktSGUID;
    ServerName := EasyScktSName;
    Open;
  end;
  if EasyScktConn.Connected then
    Result := 1;
end;

function TDMEasyDBConnection.GetScktHost: string;
begin
  Result := FScktHost;
end;

function TDMEasyDBConnection.GetScktIGUID: string;
begin
  Result := FScktIGUID;
end;

function TDMEasyDBConnection.GetScktIName: string;
begin
  Result := FScktIName;
end;

function TDMEasyDBConnection.GetScktPort: string;
begin
  Result := FScktPort;
end;

function TDMEasyDBConnection.GetScktSGUID: string;
begin
  Result := FScktSGUID;
end;

function TDMEasyDBConnection.GetScktSName: string;
begin
  Result := FScktSName;
end;

procedure TDMEasyDBConnection.SetScktHost(const Value: string);
begin
  FScktHost := Value;
end;

procedure TDMEasyDBConnection.SetScktIGUID(const Value: string);
begin
  FScktIGUID := Value;
end;

procedure TDMEasyDBConnection.SetScktIName(const Value: string);
begin
  FScktIName := Value;
end;

procedure TDMEasyDBConnection.SetScktPort(const Value: string);
begin
  FScktPort := Value;
end;

procedure TDMEasyDBConnection.SetScktSGUID(const Value: string);
begin
  FScktSGUID := Value;
end;

procedure TDMEasyDBConnection.SetScktSName(const Value: string);
begin
  FScktSName := Value;
end;

initialization
  CoInitialize(nil);
  DMEasyDBConnection := TDMEasyDBConnection.Create(Application);
  Application.Handle := DMEasyDBConnection.EasyApplicationHandle;

finalization
  CoUninitialize;

end.                                   
