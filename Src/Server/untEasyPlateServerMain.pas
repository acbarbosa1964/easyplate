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
//    EasyPlate程序的服务端单元
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyPlateServerMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyToolBar, untEasyToolBarStylers, untEasyNavBar,
  ExtCtrls, Grids, untEasyBaseGrid, untEasyGrid, untEasyStatusBar, Registry,
  untEasyStatusBarStylers, untEasyGroupBox, Menus, untEasyMenus, IniFiles,
  untEasyMenuStylers, untEasyTrayIcon, SvcMgr, ScktComp, ScktCnst, ActnList,
  AdvNavBar, untEasyEdit, ComCtrls, ImgList;

const
  EApplicationName = 'EasyPlate服务程序';
  EAlreadyRunning = '系统中已存在运行的服务程序实例,请不要重复运行!';
type
  TfrmEasyPlateServerMain = class(TForm)
    dkpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    stbMain: TEasyStatusBar;
    EasyStatusBarOfficeStyler1: TEasyStatusBarOfficeStyler;
    EasyPanel1: TEasyPanel;
    Splitter1: TSplitter;
    mmMain: TEasyMainMenu;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    N1: TMenuItem;
    pmMain: TEasyPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ServerTrayIcon: TEasyTrayIcon;
    N5: TMenuItem;
    SN1: TMenuItem;
    N7: TMenuItem;
    XML1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ActionList1: TActionList;
    ApplyAction: TAction;
    DisconnectAction: TAction;
    ShowHostAction: TAction;
    RemovePortAction: TAction;
    RegisteredAction: TAction;
    AllowXML: TAction;
    AdvNavBar1: TAdvNavBar;
    nbpPort: TAdvNavBarPanel;
    PortList: TListBox;
    nbpSocketSet: TAdvNavBarPanel;
    PortNo: TEasyLabelEdit;
    ThreadSize: TEasyLabelEdit;
    Timeout: TEasyLabelEdit;
    InterceptGUID: TEasyLabelEdit;
    PortUpDown: TUpDown;
    ThreadUpDown: TUpDown;
    TimeoutUpDown: TUpDown;
    ConnectionList: TListView;
    imgServer: TImageList;
    EasyToolBarButton1: TEasyToolBarButton;
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ApplyActionExecute(Sender: TObject);
    procedure DisconnectActionExecute(Sender: TObject);
    procedure RemovePortActionExecute(Sender: TObject);
    procedure RegisteredActionExecute(Sender: TObject);
    procedure AllowXMLExecute(Sender: TObject);
    procedure ShowHostActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PortListClick(Sender: TObject);
    procedure ApplyActionUpdate(Sender: TObject);
    procedure DisconnectActionUpdate(Sender: TObject);
    procedure RemovePortActionUpdate(Sender: TObject);
    procedure ServerTrayIconCycle(Sender: TObject; Current: Integer);
  private
    { Private declarations }
    FFromService: Boolean;
    NT351: Boolean;

    FClosing: Boolean;
    FCurItem: Integer;
    FSortCol: Integer;
    function GetItemIndex: Integer;
    procedure SetItemIndex(Value: Integer);
    function GetSelectedSocket: TServerSocket; //保存端口列表
    procedure CheckValues;
    procedure UpdateStatus;
  public
    { Public declarations }
    procedure Initialize(FromService: Boolean);
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property SelectedSocket: TServerSocket read GetSelectedSocket;
  protected
    procedure ReadSettings;
    procedure WriteSettings;
    procedure AddClient(Thread: TServerClientThread);
    procedure RemoveClient(Thread: TServerClientThread);
    procedure ClearModifications;
  end;

  TSocketService = class(TService)
  protected
    procedure Start(Sender: TService; var Started: Boolean);
    procedure Stop(Sender: TService; var Stopped: Boolean);
  public
    function GetServiceController: TServiceController; override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;
var
  frmEasyPlateServerMain: TfrmEasyPlateServerMain;
  SocketService: TSocketService;

implementation

uses untRDMEasyPlateServer, SConnect, ActiveX, MidConst;

{$R *.dfm}

{ TSocketDispatcherThread }

type
  TSocketDispatcherThread = class(TServerClientThread, ISendDataBlock)
  private
    FRefCount: Integer;
    FInterpreter: TDataBlockInterpreter;
    FTransport: ITransport;
    FInterceptGUID: string;
    FLastActivity: TDateTime;
    FTimeout: TDateTime;
    FRegisteredOnly: Boolean;
    FAllowXML: Boolean;
  protected
    function CreateServerTransport: ITransport; virtual;
    procedure AddClient;
    procedure RemoveClient;
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    { ISendDataBlock }
    function Send(const Data: IDataBlock; WaitForResult: Boolean): IDataBlock; stdcall;
  public
    constructor Create(CreateSuspended: Boolean; ASocket: TServerClientWinSocket;
      const InterceptGUID: string; Timeout: Integer; RegisteredOnly, AllowXML: Boolean);
    procedure ClientExecute; override;
    property LastActivity: TDateTime read FLastActivity;
  end;

{ TSocketDispatcher }

type
  TSocketDispatcher = class(TServerSocket)
  private
    FInterceptGUID: string;
    FTimeout: Integer;
    procedure GetThread(Sender: TObject; ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
  public
    constructor Create(AOwner: TComponent); override;
    procedure ReadSettings(PortNo: Integer; Reg: TRegINIFile);
    procedure WriteSettings(Reg: TRegINIFile);
    property InterceptGUID: string read FInterceptGUID write FInterceptGUID;
    property Timeout: Integer read FTimeout write FTimeout;
  end;

procedure TfrmEasyPlateServerMain.AddClient(Thread: TServerClientThread);
var
  Item: TListItem;
begin
  Item := ConnectionList.Items.Add;
  Item.Caption := IntToStr(Thread.ClientSocket.LocalPort);
  Item.SubItems.Add(Thread.ClientSocket.RemoteAddress);
  if ShowHostAction.Checked then
  begin
    Item.SubItems.Add(Thread.ClientSocket.RemoteHost);
    if Item.SubItems[1] = '' then Item.SubItems[1] := SHostUnknown;
  end
  else
    Item.SubItems.Add(SNotShown);
  if Thread is TSocketDispatcherThread then
    Item.SubItems.Add(DateTimeToStr(TSocketDispatcherThread(Thread).LastActivity));
  Item.Data := Pointer(Thread);
  UpdateStatus;
end;

procedure TfrmEasyPlateServerMain.FormCreate(Sender: TObject);
begin
  //判断是否安装WinSock2
  if not LoadWinSock2 then
    raise Exception.CreateRes(@SNoWinSock2);
  FClosing := False;
  FCurItem := -1;
  FSortCol := -1;
end;

{ TSocketService }

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  SocketService.Controller(CtrlCode);
end;

constructor TSocketService.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited CreateNew(AOwner, Dummy);
  AllowPause := False;
  Interactive := True;
  DisplayName := EApplicationName;
  Name := SServiceName;
  OnStart := Start;
  OnStop := Stop;
end;

function TSocketService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TSocketService.Start(Sender: TService; var Started: Boolean);
begin
  Started := True;
end;

procedure TSocketService.Stop(Sender: TService; var Stopped: Boolean);
begin
  Stopped := True;
end;

procedure TfrmEasyPlateServerMain.ReadSettings;
var
  Reg: TRegINIFile;

  procedure CreateItem(ID: Integer);
  var
    SH: TSocketDispatcher;
  begin
    SH := TSocketDispatcher.Create(nil);
    SH.ReadSettings(ID, Reg);
    PortList.Items.AddObject(IntToStr(SH.Port), SH);
    try
      SH.Open;
    except
      on E: Exception do
        raise Exception.CreateResFmt(@SOpenError, [SH.Port, E.Message]);
    end;
  end;

var
  Sections: TStringList;
  i: Integer;
begin
  Reg := TRegINIFile.Create('');
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey(KEY_SOCKETSERVER, True);
    Sections := TStringList.Create;
    try
      Reg.ReadSections(Sections);
      if Sections.Count > 1 then
      begin
        for i := 0 to Sections.Count - 1 do
          if CompareText(Sections[i], csSettings) <> 0 then
            CreateItem(StrToInt(Sections[i]));
      end
      else
        CreateItem(-1);
      ItemIndex := 0;
      ShowHostAction.Checked := Reg.ReadBool(csSettings, ckShowHost, False);
      RegisteredAction.Checked := Reg.ReadBool(csSettings, ckRegistered, True);
    finally
      Sections.Free;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmEasyPlateServerMain.RemoveClient(
  Thread: TServerClientThread);
var
  Item: TListItem;
begin
  Item := ConnectionList.FindData(0, Thread, True, False);
  if Assigned(Item) then Item.Free;
  UpdateStatus;
end;

procedure TfrmEasyPlateServerMain.WriteSettings;
var
  Reg: TRegINIFile;
  Sections: TStringList;
  i: Integer;
begin
  Reg := TRegINIFile.Create('');
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey(KEY_SOCKETSERVER, True);
    Sections := TStringList.Create;
    try
      Reg.ReadSections(Sections);
      for i := 0 to Sections.Count - 1 do
        TRegistry(Reg).DeleteKey(Sections[i]);
    finally
      Sections.Free;
    end;
    for i := 0 to PortList.Items.Count - 1 do
      TSocketDispatcher(PortList.Items.Objects[i]).WriteSettings(Reg);
    Reg.WriteBool(csSettings, ckShowHost, ShowHostAction.Checked);
    Reg.WriteBool(csSettings, ckRegistered, RegisteredAction.Checked);
  finally
    Reg.Free;
  end;
end;

{ TSocketDispatcher }

constructor TSocketDispatcher.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ServerType := stThreadBlocking;
  OnGetThread := GetThread;
end;

procedure TSocketDispatcher.GetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
begin
  SocketThread := TSocketDispatcherThread.Create(False, ClientSocket,
    InterceptGUID, Timeout, frmEasyPlateServerMain.RegisteredAction.Checked,
    frmEasyPlateServerMain.AllowXML.Checked);
end;

procedure TSocketDispatcher.ReadSettings(PortNo: Integer;
  Reg: TRegINIFile);
var
  Section: string;
begin
  if PortNo = -1 then
  begin
    Section := csSettings;
    //默认取211端口
    Port := Reg.ReadInteger(Section, ckPort, 211);
    //2011-01-05将默认端口调成9090
//    Port := Reg.ReadInteger(Section, ckPort, 9090);
  end
  else
  begin
    Section := IntToStr(PortNo);
    Port := PortNo;
  end;
  ThreadCacheSize := Reg.ReadInteger(Section, ckThreadCacheSize, 10);
  FInterceptGUID := Reg.ReadString(Section, ckInterceptGUID, '');
  FTimeout := Reg.ReadInteger(Section, ckTimeout, 0);
end;

procedure TSocketDispatcher.WriteSettings(Reg: TRegINIFile);
var
  Section: string;
begin
  Section := IntToStr(Port);
  Reg.WriteInteger(Section, ckPort, Port);
  Reg.WriteInteger(Section, ckThreadCacheSize, ThreadCacheSize);
  Reg.WriteString(Section, ckInterceptGUID, InterceptGUID);
  Reg.WriteInteger(Section, ckTimeout, Timeout);
end;

{ TSocketDispatcherThread }

function TSocketDispatcherThread._AddRef: Integer;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TSocketDispatcherThread._Release: Integer;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

procedure TSocketDispatcherThread.AddClient;
begin
  frmEasyPlateServerMain.AddClient(Self);
end;

procedure TSocketDispatcherThread.ClientExecute;
var
  Data: IDataBlock;
  msg: TMsg;
  Obj: ISendDataBlock;
  Event: THandle;
  WaitTime: DWord;
begin
  CoInitialize(nil);
  try
    Synchronize(AddClient);
    FTransport := CreateServerTransport;
    try
      Event := FTransport.GetWaitEvent;
      PeekMessage(msg, 0, WM_USER, WM_USER, PM_NOREMOVE);
      GetInterface(ISendDataBlock, Obj);
      if FRegisteredOnly then
        FInterpreter := TDataBlockInterpreter.Create(Obj, SSockets)
      else
        FInterpreter := TDataBlockInterpreter.Create(Obj, '');
      try
        Obj := nil;
        if FTimeout = 0 then
          WaitTime := INFINITE
        else
          WaitTime := 60000;
        while not Terminated and FTransport.Connected do
        try
          case MsgWaitForMultipleObjects(1, Event, False, WaitTime, QS_ALLEVENTS) of
            WAIT_OBJECT_0:
            begin
              WSAResetEvent(Event);
              Data := FTransport.Receive(False, 0);
              if Assigned(Data) then
              begin
                FLastActivity := Now;
                FInterpreter.InterpretData(Data);
                Data := nil;
                FLastActivity := Now;
              end;
            end;
            WAIT_OBJECT_0 + 1:
              while PeekMessage(msg, 0, 0, 0, PM_REMOVE) do
                DispatchMessage(msg);
            WAIT_TIMEOUT:
              if (FTimeout > 0) and ((Now - FLastActivity) > FTimeout) then
                FTransport.Connected := False;
          end;
        except
          FTransport.Connected := False;
        end;
      finally
        FInterpreter.Free;
        FInterpreter := nil;
      end;
    finally
      FTransport := nil;
    end;
  finally
    CoUninitialize;
    Synchronize(RemoveClient);
  end;
end;

constructor TSocketDispatcherThread.Create(CreateSuspended: Boolean;
  ASocket: TServerClientWinSocket; const InterceptGUID: string;
  Timeout: Integer; RegisteredOnly, AllowXML: Boolean);
begin
  FInterceptGUID := InterceptGUID;
  FTimeout := EncodeTime(Timeout div 60, Timeout mod 60, 0, 0);
  FLastActivity := Now;
  FRegisteredOnly := RegisteredOnly;
  FAllowXML := AllowXML;
  inherited Create(CreateSuspended, ASocket);
end;

function TSocketDispatcherThread.CreateServerTransport: ITransport;
var
  SocketTransport: TSocketTransport;
begin
  SocketTransport := TSocketTransport.Create;
  SocketTransport.Socket := ClientSocket;
  SocketTransport.InterceptGUID := FInterceptGUID;
  Result := SocketTransport as ITransport;
end;

function TSocketDispatcherThread.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  if GetInterface(IID, Obj) then Result := 0 else Result := E_NOINTERFACE;
end;

procedure TSocketDispatcherThread.RemoveClient;
begin
  frmEasyPlateServerMain.RemoveClient(Self);
end;

function TSocketDispatcherThread.Send(const Data: IDataBlock;
  WaitForResult: Boolean): IDataBlock;
begin
  FTransport.Send(Data);
  if WaitForResult then
  begin
    while True do
    begin
      Result := FTransport.Receive(True, 0);
      if Result = nil then break;
      if (Result.Signature and ResultSig) = ResultSig then
        break
      else
        FInterpreter.InterpretData(Result);
    end;
  end;
end;

function TfrmEasyPlateServerMain.GetItemIndex: Integer;
begin
  Result := FCurItem;
end;

procedure TfrmEasyPlateServerMain.SetItemIndex(Value: Integer);
var
  Selected: Boolean;
begin
  if (FCurItem <> Value) then
  try
    if ApplyAction.Enabled then
      ApplyAction.Execute;
  except
    PortList.ItemIndex := FCurItem;
    raise;
  end
  else
    Exit;
  if Value = -1 then
    Value := 0;
  PortList.ItemIndex := Value;
  FCurItem := PortList.ItemIndex;
  Selected := FCurItem <> -1;
  if Selected then
    with TSocketDispatcher(PortList.Items.Objects[FCurItem]) do
    begin
      PortUpDown.Position := Port;
      ThreadUpDown.Position := ThreadCacheSize;
      Self.InterceptGUID.Text := FInterceptGUID;
      TimeoutUpDown.Position := Timeout;
      ClearModifications;
    end;
  PortNo.Enabled := Selected;
  ThreadSize.Enabled := Selected;
  Timeout.Enabled := Selected;
  InterceptGUID.Enabled := Selected;
end;

procedure TfrmEasyPlateServerMain.N5Click(Sender: TObject);
begin
  frmEasyPlateServerMain.WindowState := wsMaximized;
end;

procedure TfrmEasyPlateServerMain.Initialize(FromService: Boolean);
  function IE4Installed: Boolean;
  var
    RegKey: HKEY;
  begin
    Result := False;
    if RegOpenKey(HKEY_LOCAL_MACHINE, KEY_IE, RegKey) = ERROR_SUCCESS then
    try
      Result := RegQueryValueEx(RegKey, 'Version', nil, nil, nil, nil) = ERROR_SUCCESS;
    finally
      RegCloseKey(RegKey);
    end;
  end;

begin
  FFromService := FromService;
  NT351 := (Win32MajorVersion <= 3) and (Win32Platform = VER_PLATFORM_WIN32_NT);
  if NT351 then
  begin
    if not FromService then
      raise Exception.CreateRes(@SServiceOnly);
  end;
  ReadSettings;
  if FromService then
  begin
//    miClose.Visible := False;
//    N1.Visible := False;
  end;
//  if IE4Installed then
//    FTaskMessage := RegisterWindowMessage('TaskbarCreated')
//  else
end;

procedure TfrmEasyPlateServerMain.ApplyActionExecute(Sender: TObject);
begin
  with TSocketDispatcher(SelectedSocket) do
  begin
    if Socket.ActiveConnections > 0 then
      if MessageDlg(SErrChangeSettings, mtConfirmation, [mbYes, mbNo], 0) = idNo then
        Exit;
    Close;
    Port := StrToInt(PortNo.Text);
    PortList.Items[ItemIndex] := PortNo.Text;
    ThreadCacheSize := StrToInt(ThreadSize.Text);
    InterceptGUID := Self.InterceptGUID.Text;
    Timeout := StrToInt(Self.Timeout.Text);
    Open;
  end;
  ClearModifications;
end;

function TfrmEasyPlateServerMain.GetSelectedSocket: TServerSocket;
begin
  Result := TServerSocket(PortList.Items.Objects[ItemIndex]);
end;

procedure TfrmEasyPlateServerMain.ClearModifications;
begin
  PortNo.Modified  := False;
  ThreadSize.Modified := False;
  Timeout.Modified := False;
  InterceptGUID.Modified := False;
end;

procedure TfrmEasyPlateServerMain.DisconnectActionExecute(Sender: TObject);
var
  i: Integer;
begin
  if MessageDlg(SQueryDisconnect, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;
  with SelectedSocket.Socket do
  begin
    Lock;
    try
      for i := 0 to ConnectionList.Items.Count - 1 do
        with ConnectionList.Items[i] do
          if Selected then
            TServerClientThread(Data).ClientSocket.Close;
    finally
      Unlock;
    end;
  end;
end;

procedure TfrmEasyPlateServerMain.RemovePortActionExecute(Sender: TObject);
begin
  CheckValues;
  PortList.Items.Objects[ItemIndex].Free;
  PortList.Items.Delete(ItemIndex);
  FCurItem := -1;
  ItemIndex := 0;
end;

procedure TfrmEasyPlateServerMain.CheckValues;
begin
  StrToInt(PortNo.Text);
  StrToInt(ThreadSize.Text);
  StrToInt(Timeout.Text);
end;

procedure TfrmEasyPlateServerMain.RegisteredActionExecute(Sender: TObject);
begin
  RegisteredAction.Checked := not RegisteredAction.Checked;
  ShowMessage(SNotUntilRestart);
end;

procedure TfrmEasyPlateServerMain.AllowXMLExecute(Sender: TObject);
begin
  AllowXML.Checked := not AllowXML.Checked;
end;

procedure TfrmEasyPlateServerMain.ShowHostActionExecute(Sender: TObject);
var
  i: Integer;
  Item: TListItem;
begin
  ShowHostAction.Checked := not ShowHostAction.Checked;
  ConnectionList.Items.BeginUpdate;
  try
    for i := 0 to ConnectionList.Items.Count - 1 do
    begin
      Item := ConnectionList.Items[i];
      if ShowHostAction.Checked then
      begin
        Item.SubItems[1] := TServerClientThread(Item.Data).ClientSocket.RemoteHost;
        if Item.SubItems[1] = '' then Item.SubItems[1] := SHostUnknown;
      end
      else
        Item.SubItems[1] := SNotShown;
    end;
  finally
    ConnectionList.Items.EndUpdate;
  end;
end;

procedure TfrmEasyPlateServerMain.UpdateStatus;
begin
//  ServerTrayIcon.Icon := TIcon(ServerTrayIcon.IconList.i
//  UserStatus.SimpleText := Format(SStatusLine,[ConnectionList.Items.Count]);
end;

procedure TfrmEasyPlateServerMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to PortList.Items.Count - 1 do
    PortList.Items.Objects[i].Free;
end;

procedure TfrmEasyPlateServerMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  try
    CanClose := False;
    if ApplyAction.Enabled then ApplyAction.Execute;
    if FClosing and (not FFromService) and (ConnectionList.Items.Count > 0) then
    begin
      FClosing := False;
      if MessageDlg(SErrClose, mtConfirmation, [mbYes, mbNo], 0) <> idYes then
        Exit;
    end;
    WriteSettings;
    CanClose := True;
  finally
  end;
end;

procedure TfrmEasyPlateServerMain.PortListClick(Sender: TObject);
begin
  ItemIndex := PortList.ItemIndex;  
end;

procedure TfrmEasyPlateServerMain.ApplyActionUpdate(Sender: TObject);
begin
  ApplyAction.Enabled := PortNo.Modified or ThreadSize.Modified or
    Timeout.Modified or InterceptGUID.Modified;
end;

procedure TfrmEasyPlateServerMain.DisconnectActionUpdate(Sender: TObject);
begin
  DisconnectAction.Enabled := ConnectionList.SelCount > 0;
end;

procedure TfrmEasyPlateServerMain.RemovePortActionUpdate(Sender: TObject);
begin
  RemovePortAction.Enabled := (PortList.Items.Count > 1) and (ItemIndex <> -1);
end;

procedure TfrmEasyPlateServerMain.ServerTrayIconCycle(Sender: TObject;
  Current: Integer);
begin
//
end;

end.
