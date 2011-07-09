{*******************************************************}
{                                                       }
{        Midas RemoteDataModule Pooler Demo             }
{                                                       }
{*******************************************************}

unit untEasyRDMPooler;

interface

uses
  ComObj, ActiveX, EasyPlateServer_TLB, Classes, SyncObjs, Windows, Variants, DB,
  Provider, Messages, Forms;

type
{
  This is the pooler class.  It is responsible for managing the pooled RDMs.
  It implements the same interface as the RDM does, and each call will get an
  unused RDM and use it for the call.
}
  TPooler = class(TAutoObject, IRDMEasyPlateServer)
  private
    function LockRDM: IRDMEasyPlateServer;
    procedure UnlockRDM(Value: IRDMEasyPlateServer);
    // 手工加入
    function InnerGetData(strSQL: String): OleVariant;
    function InnerPostData(Delta: OleVariant; out ErrorCode: Integer): OleVariant;
  protected
    { IAppServer }
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant;
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; safecall;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                            Options: Integer; const CommandText: WideString;
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; safecall;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; safecall;
    function  AS_GetProviderNames: OleVariant; safecall;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer;
                            var OwnerData: OleVariant): OleVariant; safecall;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); safecall;
    function EasyGetRDMData(const ASQL: WideString): OleVariant; safecall;
    function EasySaveRDMData(const ATableName: WideString; ADelta: OleVariant;
      const AKeyField: WideString; out AErrorCode: SYSINT): OleVariant;
      safecall;
    function EasySaveRDMDatas(ATableNameOLE, ADeltaOLE, AKeyFieldOLE,
      ACodeErrorOLE: OleVariant): OleVariant; safecall;
    function EasyGetRDMDatas(ASQLOLE: OleVariant): OleVariant; safecall;
  end;

{
  The pool manager is responsible for keeping a list of RDMs that are being
  pooled and for giving out unused RDMs.
}
  TPoolManager = class(TObject)
  private
    FRDMList: TList;
    FMaxCount: Integer;
    FTimeout: Integer;
    FCriticalSection: TCriticalSection;
    FSemaphore: THandle;

    function GetLock(Index: Integer): Boolean;
    procedure ReleaseLock(Index: Integer; var Value: IRDMEasyPlateServer);
    function CreateNewInstance: IRDMEasyPlateServer;
  public
    constructor Create;
    destructor Destroy; override;
    function LockRDM: IRDMEasyPlateServer;
    procedure UnlockRDM(var Value: IRDMEasyPlateServer);

    property Timeout: Integer read FTimeout;
    property MaxCount: Integer read FMaxCount;
  end;

  PRDM = ^TRDM;
  TRDM = record
    Intf: IRDMEasyPlateServer;
    InUse: Boolean;
  end;

var
  PoolManager: TPoolManager;

implementation

uses ComServ, untRDMEasyPlateServer, SysUtils, untEasyPlateServerMain;

constructor TPoolManager.Create;
begin
  FRDMList := TList.Create;
  FCriticalSection := TCriticalSection.Create;
  FTimeout := 5000;
  FMaxCount := 5;
  FSemaphore := CreateSemaphore(nil, FMaxCount, FMaxCount, nil);
//  PostMessage(Application.MainForm.Handle, WM_USER + 101, 0, 0);
end;

destructor TPoolManager.Destroy;
var
  i: Integer;
begin
  FCriticalSection.Free;
  for i := 0 to FRDMList.Count - 1 do
  begin
    PRDM(FRDMList[i]).Intf := nil;
    FreeMem(PRDM(FRDMList[i]));
  end;
  FRDMList.Free;
  CloseHandle(FSemaphore);
  inherited Destroy;
end;

function TPoolManager.GetLock(Index: Integer): Boolean;
begin
  FCriticalSection.Enter;
  try
    Result := not PRDM(FRDMList[Index]).InUse;
    if Result then
      PRDM(FRDMList[Index]).InUse := True;
  finally
    FCriticalSection.Leave;
  end;
end;

procedure TPoolManager.ReleaseLock(Index: Integer; var Value: IRDMEasyPlateServer);
begin
  FCriticalSection.Enter;
  try
    PRDM(FRDMList[Index]).InUse := False;
    Value := nil;
    ReleaseSemaphore(FSemaphore, 1, nil);
  finally
    FCriticalSection.Leave;
  end;
end;

function TPoolManager.CreateNewInstance: IRDMEasyPlateServer;
var
  p: PRDM;
begin
  FCriticalSection.Enter;
  try
    New(p);
    p.Intf := RDMFactory.CreateComObject(nil) as IRDMEasyPlateServer;
    p.InUse := True;
    FRDMList.Add(p);
    Result := p.Intf;
    PostMessage(Application.MainForm.Handle, WM_USER + 101, 0, 0);
  finally
    FCriticalSection.Leave;
  end;
end;

function TPoolManager.LockRDM: IRDMEasyPlateServer;
var
  i: Integer;
begin
  Result := nil;
  if WaitForSingleObject(FSemaphore, Timeout) = WAIT_FAILED then
    raise Exception.Create('服务器繁忙!');//Server too busy
  for i := 0 to FRDMList.Count - 1 do
  begin
    if GetLock(i) then
    begin
      Result := PRDM(FRDMList[i]).Intf;
      Exit;
    end;
  end;
  if FRDMList.Count < MaxCount then
    Result := CreateNewInstance;
  if Result = nil then { This shouldn't happen because of the sempahore locks }
    raise Exception.Create('无法锁定远程数据服务模块!'); //Unable to lock RDM
end;

procedure TPoolManager.UnlockRDM(var Value: IRDMEasyPlateServer);
var
  i: Integer;
begin
  for i := 0 to FRDMList.Count - 1 do
  begin
    if Value = PRDM(FRDMList[i]).Intf then
    begin
      ReleaseLock(i, Value);
      break;
    end;
  end;
end;

{
  Each call for the server is wrapped in a call to retrieve the RDM, and then
  when it is finished it releases the RDM.
}

function TPooler.LockRDM: IRDMEasyPlateServer;
begin
  Result := PoolManager.LockRDM;
end;

procedure TPooler.UnlockRDM(Value: IRDMEasyPlateServer);
begin
  PoolManager.UnlockRDM(Value);
end;

function TPooler.AS_ApplyUpdates(const ProviderName: WideString;
  Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer;
  var OwnerData: OleVariant): OleVariant;
var
  RDM: IRDMEasyPlateServer;
begin
  RDM := LockRDM;
  try
    Result := RDM.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
  finally
    UnlockRDM(RDM);
  end;
end;

function TPooler.AS_DataRequest(const ProviderName: WideString;
  Data: OleVariant): OleVariant;
var
  RDM: IRDMEasyPlateServer;
begin
  RDM := LockRDM;
  try
    Result := RDM.AS_DataRequest(ProviderName, Data);
  finally
    UnlockRDM(RDM);
  end;
end;

procedure TPooler.AS_Execute(const ProviderName, CommandText: WideString;
  var Params, OwnerData: OleVariant);
var
  RDM: IRDMEasyPlateServer;
begin
  RDM := LockRDM;
  try
    RDM.AS_Execute(ProviderName, CommandText, Params, OwnerData);
  finally
    UnlockRDM(RDM);
  end;
end;

function TPooler.AS_GetParams(const ProviderName: WideString;
  var OwnerData: OleVariant): OleVariant;
var
  RDM: IRDMEasyPlateServer;
begin
  RDM := LockRDM;
  try
    Result := RDM.AS_GetParams(ProviderName, OwnerData);
  finally
    UnlockRDM(RDM);
  end;
end;

function TPooler.AS_GetProviderNames: OleVariant;
var
  RDM: IRDMEasyPlateServer;
begin
  RDM := LockRDM;
  try
    Result := RDM.AS_GetProviderNames;
  finally
    UnlockRDM(RDM);
  end;
end;

function TPooler.AS_GetRecords(const ProviderName: WideString;
  Count: Integer; out RecsOut: Integer; Options: Integer;
  const CommandText: WideString; var Params,
  OwnerData: OleVariant): OleVariant;
var
  RDM: IRDMEasyPlateServer;
begin
  RDM := LockRDM;
  try
    Result := RDM.AS_GetRecords(ProviderName, Count, RecsOut, Options,
      CommandText, Params, OwnerData);
  finally
    UnlockRDM(RDM);
  end;
end;

function TPooler.AS_RowRequest(const ProviderName: WideString;
  Row: OleVariant; RequestType: Integer;
  var OwnerData: OleVariant): OleVariant;
var
  RDM: IRDMEasyPlateServer;
begin
  RDM := LockRDM;
  try
    Result := RDM.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
  finally
    UnlockRDM(RDM);
  end;
end;

function TPooler.EasyGetRDMData(const ASQL: WideString): OleVariant;
begin
  Result := Self.InnerGetData(ASQL);
end;

function TPooler.EasyGetRDMDatas(ASQLOLE: OleVariant): OleVariant;
var
  ACount, I: Integer;
begin
  ACount := VarArrayHighBound(ASQLOLE, 1);
  Result := VarArrayCreate([0, ACount], varVariant);
  for I := VarArrayLowBound(ASQLOLE, 1) to VarArrayHighBound(ASQLOLE, 1) do
    Result[I] := EasyGetRDMData(ASQLOLE[I]);
end;

function TPooler.EasySaveRDMData(const ATableName: WideString;
  ADelta: OleVariant; const AKeyField: WideString;
  out AErrorCode: SYSINT): OleVariant;
var
  KeyField: TField;
begin
  //执行之前检查要更新的字段是否存在
  with RDMEasyPlateServer do
  begin
    EasyRDMCds.Data := ADelta;
    if EasyRDMCds.IsEmpty then Exit;
    KeyField := EasyRDMCds.FindField(AKeyField);
    if KeyField=nil then
    begin
      frmEasyPlateServerMain.mmErrorLog.Lines.Add('主键字段:' + AKeyField + '未提供');
      Exit;
    end;
    EasyRDMQry.SQL.Text := 'SELECT * FROM ' + ATableName + ' WHERE 1 > 2';
    EasyRDMQry.Open;
    with EasyRDMQry.FieldByName(AKeyField) do
      ProviderFlags := ProviderFlags + [pfInKey];
    EasyRDMDsp.UpdateMode := upWhereKeyOnly;
    Result := InnerPostData(ADelta, AErrorCode);
  end;
end;

function TPooler.EasySaveRDMDatas(ATableNameOLE, ADeltaOLE, AKeyFieldOLE,
  ACodeErrorOLE: OleVariant): OleVariant;
var
  I, ErrorCode: Integer;
  CanCommit: Boolean;
begin
  CanCommit := True;
  with RDMEasyPlateServer do
  begin
    if EasyRDMADOConn.InTransaction then
      EasyRDMADOConn.RollbackTrans;

    if VarArrayHighBound(ATableNameOLE, 1) <> VarArrayHighBound(AKeyFieldOLE, 1) then
    begin
      AddExecLog('表数量<>主健数量', 1);
      Exit;
    end;
    if VarArrayHighBound(ATableNameOLE, 1) <> VarArrayHighBound(ADeltaOLE, 1) then
    begin
      AddExecLog('表数量<>提交数据集数量', 1);
      Exit;
    end;
    if VarArrayHighBound(ATableNameOLE, 1) <> VarArrayHighBound(ACodeErrorOLE, 1) then
    begin
      AddExecLog('表数量<>错误返回数量', 1);
      Exit;
    end;

    EasyRDMADOConn.BeginTrans;
    AddExecLog('BeginTrans');
    try
      for I := VarArrayLowBound(ATableNameOLE, 1) to VarArrayHighBound(ATableNameOLE, 1) do
      begin
        Result := EasySaveRDMData(ATableNameOLE[I], ADeltaOLE[I], AKeyFieldOLE[I], ErrorCode);
        ACodeErrorOLE[I] := ErrorCode;
      end;
      for I := VarArrayLowBound(ACodeErrorOLE, 1) to VarArrayHighBound(ACodeErrorOLE, 1) do
      begin
        if ACodeErrorOLE[I] <> 0 then
          CanCommit := False;
      end;
      if CanCommit then
      begin
        EasyRDMADOConn.CommitTrans;
        AddExecLog('CommitTrans');
      end
      else
      begin
        EasyRDMADOConn.RollbackTrans;
        AddExecLog('RollbackTrans');
      end;
    except on e:Exception do
      begin
        EasyRDMADOConn.RollbackTrans;
        AddExecLog('RollbackTrans:' + e.Message);
      end;
    end;
  end;
end;

function TPooler.InnerGetData(strSQL: String): OleVariant;
var
  I: Integer;
begin
  // 必须是CLOSE状态, 否则报错.
  with RDMEasyPlateServer do
  begin
    if EasyRDMQry.Active then
      EasyRDMQry.Active := False;
    Result := Self.AS_GetRecords('EasyRDMDsp', -1, I, ResetOption+MetaDataOption,
      strSQL, Params, OwnerData);
  end;
end;

function TPooler.InnerPostData(Delta: OleVariant;
  out ErrorCode: Integer): OleVariant;
begin
  with RDMEasyPlateServer do
  begin
    Result := Self.AS_ApplyUpdates('EasyRDMDsp', Delta, 0, ErrorCode, OwnerData);
  end;
end;

{ciInternal       --对象不受外部影响
ciSingleInstance --单实例，每启动一个COM新实例就是一个新进程
ciMultiInstance  --多实例, 启动多个COM实例也只启动一个进程

tmSingle         --单线程, 自动化对象的执行线程是主线程
tmApartment      --公寓线程, 自动化对象的执行线程也是主线程
tmFree           --自由线程,自动化对象的执行线程是新的工作线程
tmBoth           --没研究，效果同上
tmNeutral        --没研究，效果同上}
{initialization
  PoolManager := TPoolManager.Create;
  //自由线程,自动化对象的执行线程是新的工作线程
  TAutoObjectFactory.Create(ComServer, TPooler, CLASS_RDMEasyPlatePoolerServer,
                            ciMultiInstance, tmFree);
  //tmFree

finalization
  PoolManager.Free;   }

end.
