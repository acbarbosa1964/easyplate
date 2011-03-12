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
unit untEasyPlateMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateBaseForm, Menus, untEasyMenus, untEasyMenuStylers,
  untEasyStatusBar, untEasyStatusBarStylers, untEasyToolBar, TypInfo,  
  untEasyToolBarStylers, untEasyTabSet, untEasyOfficeTabSetStylers,
  untEasyPageControl, ExtCtrls, untEasyTrayIcon, ImgList, ComCtrls,
  untEasyTreeView, untEasyWaterImage, jpeg, StdCtrls, ActnList, Provider,
  DB, DBClient, xmldom, XMLIntf, msxmldom, XMLDoc, untEasyPlateDBBaseForm;

type

  PEasytvNavRecord = ^TEasytvNavRecord;
  TEasytvNavRecord = record
    sGUID,
    sEName,
    sCName,
    sParentGUID  : string;
    iOrder,
    iImage1,
    iImage2,
    bDir,
    iFlag        : Integer;
    sPluginFileName: string;  
  end;

  TfrmEasyPlateMain = class(TfrmEasyPlateDBBaseForm)
    mmMain: TEasyMainMenu;
    pmMain: TEasyPopupMenu;
    mmstyleMain: TEasyMenuOfficeStyler;
    mmNew: TMenuItem;
    stbMain: TEasyStatusBar;
    stbStyleMain: TEasyStatusBarOfficeStyler;
    EasyDockPanel1: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    tlbStyleMain: TEasyToolBarOfficeStyler;
    EasyMDITabSet1: TEasyMDITabSet;
    tbsStyleMain: TEasyTabSetOfficeStyler;
    EasyTrayIcon1: TEasyTrayIcon;
    pgcLeftNav: TEasyPageControl;
    Splitter1: TSplitter;
    tsbSysNav: TEasyTabSheet;
    tshWorkAssiant: TEasyTabSheet;
    tshEIM: TEasyTabSheet;
    imgNav: TImageList;
    tvNav: TEasyTreeView;
    actEasyMain: TActionList;
    img24: TImageList;
    actExit: TAction;
    EasyToolBarButton1: TEasyToolBarButton;
    img24_d: TImageList;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    EpResourceManage: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    Contents1: TMenuItem;
    Window1: TMenuItem;
    Show1: TMenuItem;
    Hide1: TMenuItem;
    N3: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    ile1: TMenuItem;
    NewWindow1: TMenuItem;
    T1: TMenuItem;
    img16: TImageList;
    img16_d: TImageList;
    actVisibleNav: TAction;
    EasyToolBarButton2: TEasyToolBarButton;
    cdsMain: TClientDataSet;
    ppMenuTrayIcon: TEasyPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    imgtv: TImageList;
    tvNavPP: TEasyPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ppTVRefresh: TMenuItem;
    actAbout: TAction;
    ppTabList: TEasyPopupMenu;
    EasyWaterImage1: TEasyWaterImage;
    ppMDITab: TEasyPopupMenu;
    N11: TMenuItem;
    cdsMainTV: TClientDataSet;
    procedure FormDestroy(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actVisibleNavExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvNavExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure tvNavDblClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ppTVRefreshClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EpResourceManageClick(Sender: TObject);
  private
    { Private declarations }
    //不允许关闭的Tab列表 以Caption为准
    NotCloseTab: TStrings;
    //传递到插件中的参数列表
    FPluginParams: TStrings;
    //插件容器
    FPluginsList: array of PEasytvNavRecord;
    //显示当前用户信息
    procedure DisplayCurrUserInfo(UserID: string);
    //初始化状态栏
    procedure InitStbMain;
    //导航树
    procedure InitTreeViewNav;
    //主菜单
    procedure InitMainMenu;
    //工具栏
    procedure InitToolBar;
    //待办工作
    procedure InitWorks;
    //即时通讯
    procedure InitEIM;

    //关闭子窗体时的事件
    procedure ChildFormClose(Sender: TObject; var Action: TCloseAction);
    //初始化系统 全部入在Init_LoadPlugs统一进度窗体调用
    function Init_LoadPlugs: Boolean;
    //加载指定的插件文件
    function LoadPlugFile: Boolean;

    //显示用户登录窗体
    procedure ShowCheckLoginUser();
    //加载子节点
    procedure LoadChildTreeNodes(ATreeView: TEasyTreeView;
                               AData: array of PEasytvNavRecord;
                               ParentNode: TTreeNode);
    //释放插件存放数组
    procedure DisposePlugArray;
  public
    { Public declarations }
    EasyLoginUserID: string; //登录用户编号/名
  end;

var
  frmEasyPlateMain: TfrmEasyPlateMain;
implementation

{$R *.dfm}

uses
  untEasyUtilInit, untEasyDBConnection, untEasyUtilDLL, untEasyUtilMethod,
  untEasyUtilClasses, untEasyPlateLoading, untEasyUtilConst, 
  untEasyProgressBar, untEasyLoginMain, untEasyPlateResourceManage;

procedure TfrmEasyPlateMain.DisplayCurrUserInfo(UserID: string);
begin
  //为空时按下的可能是取消 在按下取消时将登录用户名置空
  if Trim(UserID) = '' then
  begin
    Application.Terminate;
  end;  
  with cdsMain do
  begin
    cdsMain.Data := EasyRDMDisp.EasyGetRDMData('SELECT * FROM vw_inituser  WHERE sLoginName = ' + QuotedStr(UserID));
//    Close;
//    CommandText := 'SELECT * FROM vw_inituser  WHERE sLoginName = ' + QuotedStr(UserID);
//    Open;
    if cdsMain.RecordCount = 1 then
    begin
      stbMain.Panels[0].Text := '<a color="clblue">' + EASY_DISPLAYUSERINFO_WELCOME
                                + '</a>'
                                + fieldbyname('sEmployeeCName').AsString;
      stbMain.Panels[1].Text := '<a color="clblue">' + EASY_DISPLAYUSERINFO_DEPT
                                + '</a>';
      Close;
    end else
    if cdsMain.RecordCount > 1 then
    begin    //一个帐户对应多个员工系统，一般不会发生，防止更改数据库出错
      Close;
      Application.MessageBox(PChar(EASY_DISPLAYUSERINFO_MORE), PChar(EASY_SYS_HINT),
                             MB_OK + MB_ICONWARNING);
      Application.Terminate;
    end else  
    begin   //帐户不存在人员使用
      Close;
      Application.MessageBox(PChar(EASY_DISPLAYUSERINFO_NULL), PChar(EASY_SYS_HINT),
                             MB_OK + MB_ICONWARNING);
      Application.Terminate;
    end;
  end;
end;

procedure TfrmEasyPlateMain.FormDestroy(Sender: TObject);
begin
  DisposePlugArray;
  FPluginParams.Free;
  //不允许关闭的子窗体列表
  NotCloseTab.Free;
  inherited;
end;

procedure TfrmEasyPlateMain.InitEIM;
begin

end;

procedure TfrmEasyPlateMain.InitMainMenu;
var
  I                    : Integer;
  //在菜单上创建模块时使用
  TmpMenuItem,
  DestMenuItem         : TMenuItem;
begin
  mmMain.BeginUpdate;

  for I := Low(FPluginsList) to High(FPluginsList) do
  begin
    if PEasytvNavRecord(FPluginsList[I])^.sParentGUID = EasyRootGUID then
    begin
      //创建模块菜单
      TmpMenuItem := TMenuItem.Create(mmMain);
      with TmpMenuItem do
      begin
        Caption := PEasytvNavRecord(FPluginsList[I])^.sCName;
//        TmpMenuItem.
      end;
      DestMenuItem := mmMain.Items.Find('模块(&M)');
      if DestMenuItem <> nil then
      begin
        DestMenuItem.Add(TmpMenuItem);
      end;
    end;
    //加载窗体的进度条
    with frmEasyPlateLoading.EasyProgressBar1 do
    begin
      if Position > Max then
        Position := Max - 20;
      Position := Position + I*2;
    end;     
  end;
  mmMain.EndUpdate;
end;

procedure TfrmEasyPlateMain.InitStbMain;
begin
  //本地时间初始化
  stbMain.Panels[2].Text:='<a color="clblue">农历   ' + GetChinaDay + '  ' + FormatDateTime('YYYY-MM-DD', Date)
            + '</a>';
  //网络连接信息
  with stbMain.Panels[7] do
  begin
    Width := 25;
    Style := psImage;
    Text := '';
    if NetInternetConnected then
      ImageIndex := 7
    else
      ImageIndex := 8;
  end;
  //服务器信息
  stbMain.Panels[8].Text := '<a color="clblue">' + EASY_STATUBAR_APP
                          + DMEasyDBConnection.EasyAppType

                         + EASY_STATUBAR_DBHOST
                         + DMEasyDBConnection.EasyDBHost
                         + ':' + DMEasyDBConnection.EasyDBPort + '</a>';
end;

procedure TfrmEasyPlateMain.InitToolBar;
begin

end;

procedure TfrmEasyPlateMain.InitTreeViewNav;
var
  I: Integer;
  ATmpNode: TTreeNode;
begin
  //清空树
  tvNav.Items.Clear;
  with cdsMainTV do
  begin
    cdsMainTV.Data := EasyRDMDisp.EasyGetRDMData('SELECT * FROM sysPluginsDirectory ORDER BY bDir, iOrder');
//    Close;
//    CommandText := 'SELECT * FROM sysPluginsDirectory ORDER BY bDir, iOrder';
//    Open;
    First;
    for I := 0 to RecordCount - 1 do
    begin
        SetLength(FPluginsList, Length(FPluginsList) + 1);
        New(FPluginsList[High(FPluginsList)]);
        FPluginsList[High(FPluginsList)]^.sGUID := FieldByName('GUID').AsString;
        FPluginsList[High(FPluginsList)]^.sEName := FieldByName('sEName').AsString;
        FPluginsList[High(FPluginsList)]^.sCName := FieldByName('sCName').AsString;
        FPluginsList[High(FPluginsList)]^.sParentGUID := FieldByName('sParentGUID').AsString;
        FPluginsList[High(FPluginsList)]^.iOrder := FieldByName('iOrder').AsInteger;
        FPluginsList[High(FPluginsList)]^.iImage1 := FieldByName('iImage1').AsInteger;
        FPluginsList[High(FPluginsList)]^.iImage2 := FieldByName('iImage2').AsInteger;
        FPluginsList[High(FPluginsList)]^.iFlag := FieldByName('iFlag').AsInteger;
        FPluginsList[High(FPluginsList)]^.sPluginFileName := FieldByName('sPluginFileName').AsString;
        FPluginsList[High(FPluginsList)]^.bDir := FieldByName('bDir').AsInteger;

      if (FieldByName('sParentGUID').AsString = EasyRootGUID)
         //如果是是根节点 且为目录 此处可不判断，在程序输入目录时作限制
         and (FieldByName('bDir').AsString = '0') then
      begin
        ATmpNode := tvNav.Items.AddChildObject(nil, FPluginsList[High(FPluginsList)]^.sCName,
                                              FPluginsList[High(FPluginsList)]);
        ATmpNode.ImageIndex := FPluginsList[High(FPluginsList)]^.iImage1;
        ATmpNode.SelectedIndex := FPluginsList[High(FPluginsList)]^.iImage2;
        //增加临时子节点
        tvNav.Items.AddChildFirst(ATmpNode, 'ChildTest');
      end;
      Next;
    end;
  end;
  cdsMainTV.Close;
end;

procedure TfrmEasyPlateMain.InitWorks;
begin

end;

procedure TfrmEasyPlateMain.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEasyPlateMain.actVisibleNavExecute(Sender: TObject);
begin
  inherited;
  pgcLeftNav.Visible := not pgcLeftNav.Visible;
end;

procedure TfrmEasyPlateMain.FormShow(Sender: TObject);
begin
  //弹出登录窗体 进行登录验证
  ShowCheckLoginUser;
  if Trim(EasyLoginUserID) = '' then
    Application.Terminate
  else
  begin
    inherited;
    //显示进度窗体
    CreatePG(Init_LoadPlugs, '系统初始化...');
    //显示用户信息：当前登录用户、部门
    DisplayCurrUserInfo(EasyLoginUserID);
    //补充状态栏位
    InitStbMain;
  end;

  //限制窗体最小宽 870 高500
  Self.Constraints.MinHeight := 500;
  Self.Constraints.MinWidth := 870;
end;

procedure TfrmEasyPlateMain.FormCreate(Sender: TObject);
var
  ABitMap: TBitmap;
begin
  inherited;
  //加载导航树所需要的图像
  ABitMap := TBitmap.Create;
  ABitMap.LoadFromFile(EasyImagePath + 'Tree.bmp');
  imgtv.Add(ABitMap, nil);
  ABitMap.Free;
  
  //打开双缓冲
  Self.DoubleBuffered := True;
  FPluginParams := TStringList.Create;

  //初始化菜单和导航树统一放在Init_LoadPlugs中由进度窗体负责
  //不充许关闭的Tab标题
  NotCloseTab := TStringList.Create;
  with NotCloseTab do
  begin
    Add('主界面');
    Add('桌面');
    Add('工作台');
    Add('工作区');
    Add('主工作台');
    Add('主工作区');
    Add('首页');
  end;
end;

procedure TfrmEasyPlateMain.tvNavExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.HasChildren then
  begin
    if Node.Item[0].Text = 'ChildTest' then
    begin
      Node.Item[0].Delete;
      LoadChildTreeNodes(tvNav, FPluginsList, Node);
    end;
  end;
end;       

procedure TfrmEasyPlateMain.N6Click(Sender: TObject);
begin
  inherited;
  tvNav.FullExpand;
end;

procedure TfrmEasyPlateMain.N7Click(Sender: TObject);
begin
  inherited;
  tvNav.FullCollapse;
end;

procedure TfrmEasyPlateMain.tvNavDblClick(Sender: TObject);
var
  TmpPlugFileName: string;
begin
  inherited;
  if tvNav.Selected = nil then
    Exit;
  if PEasytvNavRecord(tvNav.Selected.Data)^.bDir = 1 then
  begin
    TmpPlugFileName := PEasytvNavRecord(tvNav.Selected.Data)^.sPluginFileName;
    if FileExists(EasyPlugPath + TmpPlugFileName) then
      CreatePG_Plug(LoadPlugFile, '正在加载插件,请稍后...', tvNav.Selected)
    else
    begin
      Application.MessageBox(PChar('插件文件【'+ TmpPlugFileName +'】未找到,请检查系统完整性或通知系统管理员！'),
        '提示', MB_OK + MB_ICONSTOP);
      Exit;
    end;  
  end;
end;

procedure TfrmEasyPlateMain.About1Click(Sender: TObject);
begin
  inherited;
  LoadPkg('pkEasyAboutUS.bpl', FPluginParams);
end;

procedure TfrmEasyPlateMain.ChildFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //判断当前要关闭的子窗体是否允许关闭
  if NotCloseTab.IndexOf(TForm(Sender).Caption) = - 1 then
  begin
    tlbMain.RemoveMDIChildMenu(TForm(Sender), TForm(Sender).Caption);

    Action := caFree;
  end;
end;

function TfrmEasyPlateMain.Init_LoadPlugs: Boolean;
begin
  frmEasyPlateLoading.EasyProgressBar1.Position := 10;

  //先初始化导航树 再初始化主菜单
  //初始化导航树
  InitTreeViewNav; 
  //初始化主菜单
  InitMainMenu;
  Result := True;
  //加载窗体的进度条
  with frmEasyPlateLoading.EasyProgressBar1 do
  begin
    if Position < Max then
      Position := Max;
  end;
  frmEasyPlateLoading.Close;
end;

function TfrmEasyPlateMain.LoadPlugFile: Boolean;
var
  TmpPluginFile: String;
  TmpNode      : TTreeNode;
begin
  TmpNode := frmEasyPlateLoading.ATmpNode_Loading;
  //进度窗体进度
  frmEasyPlateLoading.EasyProgressBar1.Position := 10;
  TmpPluginFile := EasyPlugPath + PEasytvNavRecord(TmpNode.Data)^.sPluginFileName;
  if (pos('.bpl', TmpPluginFile) > 0) and (FileExists(TmpPluginFile)) then
  begin
    LoadPkg(TmpPluginFile, FPluginParams, EasyMDITabSet1,
            frmEasyPlateLoading.EasyProgressBar1, ChildFormClose, 1);
  end;
  Result := True;
  //进度窗体进度
  frmEasyPlateLoading.EasyProgressBar1.Position := 100;
  frmEasyPlateLoading.Close;
end;

procedure TfrmEasyPlateMain.N11Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to EasyMDITabSet1.ComponentCount - 1 do
    EasyMDITabSet1.Components[I].Free;
end;

procedure TfrmEasyPlateMain.ShowCheckLoginUser();
begin
  try
    frmEasyLoginMain := TfrmEasyLoginMain.Create(Application);
    frmEasyLoginMain.ShowModal;
  finally
    frmEasyLoginMain.Free;
  end;
end;

procedure TfrmEasyPlateMain.LoadChildTreeNodes(ATreeView: TEasyTreeView;
  AData: array of PEasytvNavRecord; ParentNode: TTreeNode);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  with ATreeView do
  begin
    for I := Low(AData) to High(AData) do
    begin
      if AData[I]^.sParentGUID = PEasytvNavRecord(ParentNode.Data)^.sGUID then
      begin
        ATmpNode := ATreeView.Items.AddChildObject(ParentNode, AData[I]^.sCName, AData[I]);
        ATmpNode.ImageIndex := AData[I]^.iImage1;
        ATmpNode.SelectedIndex := AData[I]^.iImage2;
        
        //生成临时节点 只有目录
        if AData[I]^.bDir = 0 then
          ATreeView.Items.AddChildFirst(ATmpNode, 'ChildTest');
      end;
    end;
  end;
end;

procedure TfrmEasyPlateMain.DisposePlugArray;
var
  I: Integer;
begin
  //从插件容器FPluginsList释放所有插件
  for I := Low(FPluginsList) to High(FPluginsList) do
    Dispose(PEasytvNavRecord(FPluginsList[I])); 
end;

procedure TfrmEasyPlateMain.ppTVRefreshClick(Sender: TObject);
begin
  inherited;
  DisposePlugArray;
  SetLength(FPluginsList, 0);
  InitTreeViewNav;
end;

procedure TfrmEasyPlateMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if Application.MessageBox('确定要退出系统吗?', '提示', MB_OKCANCEL +
    MB_ICONQUESTION) = IDOK then
    Application.Terminate
  else
    CanClose := False;
end;

procedure TfrmEasyPlateMain.EpResourceManageClick(Sender: TObject);
begin
  inherited;
  frmEasyPlateResourceManage := TfrmEasyPlateResourceManage.Create(Application);
  frmEasyPlateResourceManage.ShowModal;
  frmEasyPlateResourceManage.Free;
//  for I := 0 to Screen.Forms[1].ComponentCount - 1 do
//  begin
//    if GetPropInfo(Screen.Forms[1].Components[I], 'Caption') <> nil then
//      Memo1.Lines.Add(Screen.Forms[1].Components[I].Name +'.Caption='+ GetPropValue(Screen.Forms[1].Components[I], 'Caption'));
//    if GetPropInfo(Screen.Forms[1].Components[I], 'Text') <> nil then
//      Memo1.Lines.Add(Screen.Forms[1].Components[I].Name +'.Text='+ GetPropValue(Screen.Forms[1].Components[I], 'Text'));
//    if GetPropInfo(Screen.Forms[1].Components[I], 'Hint') <> nil then
//      Memo1.Lines.Add(Screen.Forms[1].Components[I].Name +'.Hint='+ GetPropValue(Screen.Forms[1].Components[I], 'Hint'));
//  end;
//  for I := 0 to Screen.FormCount - 1 do
//  begin
//    Memo1.Clear;
//    Memo1.Lines.Add(Screen.Forms[I].Caption + TfrmEasyPlateBaseForm(Screen.Forms[I]).FormId);
//  end;
//  ShowMessage(IntToStr(Screen.FormCount));
end;

end.
