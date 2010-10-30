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
  untEasyStatusBar, untEasyStatusBarStylers, untEasyToolBar,  
  untEasyToolBarStylers, untEasyTabSet, untEasyOfficeTabSetStylers,
  untEasyPageControl, ExtCtrls, untEasyTrayIcon, ImgList, ComCtrls,
  untEasyTreeView, untEasyWaterImage, jpeg, StdCtrls, ActnList, Provider,
  DB, DBClient, xmldom, XMLIntf, msxmldom, XMLDoc;

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
    sPlugFileName: string;  //Add 新增 Edit 编辑 Del 删除
  end;

  TfrmEasyPlateMain = class(TfrmEasyPlateBaseForm)
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
    HowtoUseHelp1: TMenuItem;
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
    XMLDocMain: TXMLDocument;
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
    procedure ppTVRefreshClick(Sender: TObject);
    procedure tvNavDblClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //不允许关闭的Tab列表 以Caption为准
    NotCloseTab: TStrings;
    //传递到插件中的参数列表
    FPluginParams: TStrings;
    //插件容器
    FPluginsList: TList;
    //展开树形节点下的子节点
    procedure ExpandChildNodes(ANode: TTreeNode);
    //获取Plugins目录下的插件目录
    procedure GetPluginsDirectoryList(AParentNode: TTreeNode; APath, AFileType: string;
                                      AType: Integer; AFlag: string = 'init');
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

    //
    procedure ShowCheckLoginUser();
  public
    { Public declarations }
    EasyDBHandle : Cardinal; //数据连接模块包句柄
    EasyLoginUserID: string; //登录用户编号/名
  end;

var
  frmEasyPlateMain: TfrmEasyPlateMain;
implementation

{$R *.dfm}

uses
  untEasyUtilInit, untEasyDBConnection, untEasyUtilDLL, untEasyUtilMethod,
  untEasyUtilClasses, untEasyPlateLoading, untEasyUtilConst,
  untEasyProgressBar, untEasyLoginMain;

procedure TfrmEasyPlateMain.DisplayCurrUserInfo(UserID: string);
begin
  //为空时按下的可能是取消 在按下取消时将登录用户名置空
  if Trim(UserID) = '' then
  begin
    Application.Terminate;
  end;  
  with cdsMain do
  begin
    Close;
    CommandText := 'SELECT * FROM vw_inituser  WHERE sLoginName = ' + QuotedStr(UserID);
    Open;
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
var
  I: Integer;
begin
  //从插件容器FPluginsList释放所有插件
  for I := FPluginsList.Count - 1  downto 0 do
  begin
    Dispose(PPlugin(FPluginsList.Items[I]));
  end;
  FPluginsList.Free;

  EasyDBHandle := DMEasyDBConnection.EasyCurrLoginDBHandle;
  if EasyDBHandle > 0 then
    UnloadPackage(EasyDBHandle);

  //
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
  APluginsDirectoryList: TStrings;
  I                    : Integer;
  //在菜单上创建模块时使用
  TmpMenuItem,
  DestMenuItem         : TMenuItem;
  APath                : string;
  TmpXMLNode           : IXMLNode;
begin
  mmMain.BeginUpdate;
  APath := ExtractFilePath(Application.ExeName) + 'plugins\';
  APluginsDirectoryList := TStringList.Create;
  //XML
  if XMLDocMain.Active then
    XMLDocMain.Active := False;
  //菜单模块只显示一级模块
  XMLDocMain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'plugins\plugins-dir.xml');
  XMLDocMain.Active := True;
  //搜索文件
  SearchFile(APath, APluginsDirectoryList, '*.*', 1);

  for I := 0 to APluginsDirectoryList.Count - 1 do
  begin
    TmpXMLNode := XMLDocMain.DocumentElement.ChildNodes.FindNode('plugins_' + APluginsDirectoryList.Strings[I]);
    if TmpXMLNode <> nil then
    begin
      //创建模块菜单
      TmpMenuItem := TMenuItem.Create(mmMain);
      with TmpMenuItem do
      begin
        Caption := IntToStr(I) + '、' + VarToStrDef(TmpXMLNode.Attributes['CName'], '');
        Hint :=  APath + APluginsDirectoryList.Strings[I];
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
  XMLDocMain.Active := False;
  APluginsDirectoryList.Free;
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
    Close;
    CommandText := 'SELECT * FROM sysPluginsDirectory ';
    Open;
    First;
    for I := 0 to RecordCount - 1 do
    begin
      if FieldByName('sParentGUID').AsString = '{00000000-0000-0000-0000-000000000000}' then

    end;  
  end;
//  GetPluginsDirectoryList(nil, ExtractFilePath(Application.ExeName) + 'plugins\',
//                          '*.*', 1, 'init');
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
end;

//+AFlag 判断是程序初始化进入还是其它进入
//初始化进入操作进度窗体、其它不操作
procedure TfrmEasyPlateMain.GetPluginsDirectoryList(AParentNode: TTreeNode;
                            APath, AFileType: string; AType: Integer; AFlag: string = 'init');
var
  APluginsDirectoryList: TStrings;
  I                    : Integer;
  TmpNode              : TTreeNode;
  TmpPlugin            : PPLugin;
  TmpXMLNode           : IXMLNode;
begin
  APluginsDirectoryList := TStringList.Create;
  //XML
  if XMLDocMain.Active then
    XMLDocMain.Active := False;
  if AType = 1 then    //加载文件夹
    XMLDocMain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'plugins\plugins-dir.xml')
  else if AType = 2 then //加载插件
    XMLDocMain.LoadFromFile(ExtractFilePath(Application.ExeName) + 'plugins\plugins-file.xml');
  XMLDocMain.Active := True;
  //搜索文件
  SearchFile(APath, APluginsDirectoryList, AFileType, AType);

  for I := 0 to APluginsDirectoryList.Count - 1 do
  begin
    TmpXMLNode := XMLDocMain.DocumentElement.ChildNodes.FindNode('plugins_' + APluginsDirectoryList.Strings[I]);
    if TmpXMLNode <> nil then
    begin
      New(TmpPlugin);
      TmpPlugin.FileName := APath + APluginsDirectoryList.Strings[I];
      TmpPlugin.EName := VarToStrDef(TmpXMLNode.Attributes['EName'], '');
      TmpPlugin.CName := VarToStrDef(TmpXMLNode.Attributes['CName'], '');
      TmpPlugin.image1 := VarToStrDef(TmpXMLNode.Attributes['image1'], '');
      TmpPlugin.image2 := VarToStrDef(TmpXMLNode.Attributes['image2'], '');
      TmpPlugin.iOrder := StrToInt(VarToStrDef(TmpXMLNode.Attributes['Order'], '0'));
      TmpPlugin.Flag := VarToStrDef(TmpXMLNode.Attributes['Flag'], '');
      //将创建的插件添加到插件容器中
      FPluginsList.Add(TmpPlugin);

      //创建树形节点
      TmpNode := tvNav.Items.AddChildObject(AParentNode, TmpPlugin.CName, TmpPlugin);
      with TmpNode do
      begin
        ImageIndex := StrToInt(PPLugin(Data).image1);
        SelectedIndex := StrToInt(PPLugin(Data).image2);
      end;
      //暂存节点显示用
      if Pos('.', PPLugin(TmpNode.Data).FileName) = 0 then
      begin
        tvNav.Items.AddChild(TmpNode, 'ChildTest');
      end;

    end;
    //加载窗体的进度条
    if AFlag = 'init' then //防止树在展开时进入
    begin
      with frmEasyPlateLoading.EasyProgressBar1 do
      begin
        if Position > Max then
          Position := Max - 20;
        Position := Position + I*2;
      end;
    end;
  end;
  XMLDocMain.Active := False;
  APluginsDirectoryList.Free;
end;

procedure TfrmEasyPlateMain.FormCreate(Sender: TObject);
begin
  inherited;
  //打开双缓冲
  Self.DoubleBuffered := True;
  FPluginParams := TStringList.Create;
  //创建插件容器
  FPluginsList := TList.Create;

//初始化菜单和导航树统一放在Init_LoadPlugs中由进度窗体负责
//  初始化主菜单
//  InitMainMenu;
//  初始化导航树
//  InitTreeViewNav;
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

procedure TfrmEasyPlateMain.ExpandChildNodes(ANode: TTreeNode);
begin
  ANode.DeleteChildren;
  //先查找文件夹
  GetPluginsDirectoryList(ANode, PPlugin(ANode.Data).FileName + '\', '*.*', 1, 'NO_INIT');
  //查找指定文件
  GetPluginsDirectoryList(ANode, PPlugin(ANode.Data).FileName + '\', '*.bpl', 2, 'NO_INIT');
end;               

procedure TfrmEasyPlateMain.tvNavExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.HasChildren then
  begin
    if Node.Item[0].Text = 'ChildTest' then
      Node.Item[0].Delete;
    //执行加载任务，加载中会先删除原来的旧子值
    ExpandChildNodes(Node);
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

procedure TfrmEasyPlateMain.ppTVRefreshClick(Sender: TObject);
var
  TmpNode: TTreeNode;
begin
  inherited;
  //刷新时如果存在子节点就删除后再重新加载    
  TmpNode := tvNav.Selected;
  //加载以后再自动打开
  TmpNode.Expanded := True; 
end;

procedure TfrmEasyPlateMain.tvNavDblClick(Sender: TObject);
begin
  inherited;
  CreatePG_Plug(LoadPlugFile, '正在加载插件,请稍后...', tvNav.Selected);
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
  //初始化主菜单
  InitMainMenu;
  //初始化导航树
  InitTreeViewNav;
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
  TmpPluginFile := PPlugin(TmpNode.Data).FileName;
  if (pos('.bpl', TmpPluginFile) > 0) and (FileExists(TmpPluginFile)) then
    LoadPkg(TmpPluginFile, FPluginParams, EasyMDITabSet1,
            frmEasyPlateLoading.EasyProgressBar1, ChildFormClose, 1);
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

procedure TfrmEasyPlateMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Application.MessageBox('确定要退出系统吗?', '提示', MB_OKCANCEL + 
    MB_ICONQUESTION) = IDOK then
  begin
    Application.Terminate;
  end;
end;

end.
