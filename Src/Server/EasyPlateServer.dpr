program EasyPlateServer;

uses
  SvcMgr,
  Forms,
  Windows,
  SysUtils,
  WinSvc,
  ScktCnst,
  untEasyPlateServerMain in 'untEasyPlateServerMain.pas' {frmEasyPlateServerMain},
  EasyPlateServer_TLB in 'EasyPlateServer_TLB.pas',
  untRDMEasyPlateServer in 'untRDMEasyPlateServer.pas' {RDMEasyPlateServer: TRemoteDataModule} {RDMEasyPlateServer: CoClass},
  untEasyLocalDM in 'untEasyLocalDM.pas' {DMLocal: TDataModule};

{$R *.TLB}

{$R *.res}     

function Installing: Boolean;
begin
  Result := FindCmdLineSwitch('INSTALL',['-','\','/'], True) or
            FindCmdLineSwitch('UNINSTALL',['-','\','/'], True);
end;

function StartService: Boolean;
var
  Mgr, Svc: Integer;
  UserName, ServiceStartName: string;
  Config: Pointer;
  Size: DWord;
begin
  Result := False;
  Mgr := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if Mgr <> 0 then
  begin
    Svc := OpenService(Mgr, PChar(SServiceName), SERVICE_ALL_ACCESS);
    Result := Svc <> 0;
    if Result then
    begin
      QueryServiceConfig(Svc, nil, 0, Size);
      Config := AllocMem(Size);
      try
        QueryServiceConfig(Svc, Config, Size, Size);
        ServiceStartName := PQueryServiceConfig(Config)^.lpServiceStartName;
        if CompareText(ServiceStartName, 'LocalSystem') = 0 then
          ServiceStartName := 'SYSTEM';
      finally
        Dispose(Config);
      end;
      CloseServiceHandle(Svc);
    end;
    CloseServiceHandle(Mgr);
  end;
  if Result then
  begin
    Size := 256;
    SetLength(UserName, Size);
    GetUserName(PChar(UserName), Size);
    SetLength(UserName, StrLen(PChar(UserName)));
    Result := CompareText(UserName, ServiceStartName) = 0;
  end;
end;

begin
  if not Installing then
  begin
    CreateMutex(nil, True, 'SCKTSRVR');
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      MessageBox(0, PChar(EAlreadyRunning), EApplicationName, MB_ICONERROR);
      Halt;
    end;
  end;  
  {if Installing or StartService then
  begin
    SvcMgr.Application.Initialize;
    SocketService := TSocketService.CreateNew(SvcMgr.Application, 0);
    SvcMgr.Application.CreateForm(TfrmEasyPlateServerMain, frmEasyPlateServerMain);
    //创建附属SvcMgr的远程数据模块
    SvcMgr.Application.CreateForm(TRDMEasyPlateServer, RDMEasyPlateServer);
    SvcMgr.Application.Run;
  end
  else  }
  begin
    Forms.Application.Initialize;
    Forms.Application.CreateForm(TfrmEasyPlateServerMain, frmEasyPlateServerMain);
  Application.CreateForm(TDMLocal, DMLocal);
  //    Forms.Application.CreateForm(TDMLocal, DMLocal);
  //根据配置文件初始化Socket
    frmEasyPlateServerMain.Initialize(False);
    //创建附属Forms的远程数据模块
    //RDM随Socket线程创建，此处不需要再创建
//    Forms.Application.CreateForm(TRDMEasyPlateServer, RDMEasyPlateServer);
    Forms.Application.Run;
  end;
end.
