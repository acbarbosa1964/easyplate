unit untEasyPlateManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, StdCtrls, untEasyLabel,
  untEasyPageControl, ExtCtrls, untEasyGroupBox, untEasyProgressBar,
  untEasyEdit, untEasyEditExt, untEasyButtons, Grids, untEasyBaseGrid,
  untEasyGrid, ComCtrls, untEasyTreeView, untEasyMemo, DB, DBClient,
  Provider, ImgList, Menus, untEasyMenus, untEasyMenuStylers;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type

  PEasytvDirectoryRecord = ^TEasytvDirectoryRecord;
  TEasytvDirectoryRecord = record
    sGUID,
    sEName,
    sCName,
    sParentGUID : string;     //父节点GUID
    iOrder,                   //排序
    iImage1,                  //节点\展开的图标
    iImage2,
    bDir,                     //0目录 1插件
    iFlag   : Integer;
    sPluginFileName: string; //要调用的插件文件名称
    sFlag: string;  //Add 新增 Edit 编辑 Del 删除
  end;

  PEasytvParamsRecord = ^TEasytvParamsRecord;
  TEasytvParamsRecord = record
    //提取参数
    ParamGUID,
    sPluginGUID,//GUID 挂靠节点
    sParamEName,
    sParamCName,
    sValueType,
    sValue,
    sFlag     : string;
  end;

  TfrmEasyPlateManage = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel2: TEasyPanel;
    pgcSystemManager: TEasyPageControl;
    tbsDirectoryManage: TEasyTabSheet;
    tbsModulesUpdate: TEasyTabSheet;
    tbsSystemFileUpdate: TEasyTabSheet;
    tbsReportUpdate: TEasyTabSheet;
    lblOperateHint: TEasyLabel;
    pgbOperate: TEasyProgressBar;
    EasyLabel1: TEasyLabel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyBitButton1: TEasyBitButton;
    EasyBitButton2: TEasyBitButton;
    EasyStringGrid1: TEasyStringGrid;
    EasyPanel5: TEasyPanel;
    EasyPanel6: TEasyPanel;
    EasyStringGrid2: TEasyStringGrid;
    EasyPanel11: TEasyPanel;
    Splitter2: TSplitter;
    EasyPanel12: TEasyPanel;
    tvSysDirectory: TEasyTreeView;
    EasyPanel13: TEasyPanel;
    btnAdd: TEasyBitButton;
    btnInsert: TEasyBitButton;
    btnEdit: TEasyBitButton;
    pgcDirOperate: TEasyPageControl;
    EasyTabSheet3: TEasyTabSheet;
    EasyLabel4: TEasyLabel;
    lvParamers: TListView;
    btnParamAdd: TEasyBitButton;
    btnParamEdit: TEasyBitButton;
    btnParamDelete: TEasyBitButton;
    EasyPanel8: TEasyPanel;
    Splitter1: TSplitter;
    EasyPanel9: TEasyPanel;
    tvModules: TEasyTreeView;
    EasyPanel10: TEasyPanel;
    EasyLabelEdit1: TEasyLabelEdit;
    EasyLabelEdit2: TEasyLabelEdit;
    EasyLabelEdit3: TEasyLabelEdit;
    EasyLabelEdit4: TEasyLabelEdit;
    EasyBitButton7: TEasyBitButton;
    EasyBitButton8: TEasyBitButton;
    EasyLabelEdit5: TEasyLabelEdit;
    EasyLabelEdit6: TEasyLabelEdit;
    rdgUpdateOptions: TEasyRadioGroup;
    EasyPanel7: TEasyPanel;
    EasyBitButton5: TEasyBitButton;
    EasyBitButton6: TEasyBitButton;
    EasyLabel6: TEasyLabel;
    lvDeleted: TListView;
    btnSave: TEasyBitButton;
    btnCancel: TEasyBitButton;
    btnRefresh: TEasyBitButton;
    EasyBitButton19: TEasyBitButton;
    EasyBitButton3: TEasyBitButton;
    EasyBitButton4: TEasyBitButton;
    cdsDirManager: TClientDataSet;
    btnDelete: TEasyBitButton;
    imgTv: TImageList;
    tbsOPLog: TEasyTabSheet;
    mmOPLog: TEasyMemo;
    tvNavPP: TEasyPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    ppTVRefresh: TMenuItem;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    imglv: TImageList;
    imglvDel: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tvSysDirectoryExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvSysDirectoryDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure tvSysDirectoryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvSysDirectoryDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ppTVRefreshClick(Sender: TObject);
    procedure tvSysDirectoryChange(Sender: TObject; Node: TTreeNode);
    procedure FormDestroy(Sender: TObject);
    procedure btnParamEditClick(Sender: TObject);
    procedure btnParamDeleteClick(Sender: TObject);
    procedure btnParamAddClick(Sender: TObject);
    procedure pgcSystemManagerChange(Sender: TObject);
  private
    { Private declarations }
    tvTmpData: array of PEasytvDirectoryRecord;  //存储从数据库返回的数据
    tvTmpParamsData: array of PEasytvParamsRecord; //参数列表
    
    AAddedTreeGUID: TStrings;
    //初始化树，只生成第一层节点
    procedure GenerateTreeView(ATreeView: TEasyTreeView;
                               AData: array of PEasytvDirectoryRecord;
                               RootFlag: string);
    procedure GenerateTreeNode(ATreeView: TEasyTreeView;
                               AData: PEasytvDirectoryRecord;
                               ParentNode: TTreeNode);
    //加载子节点
    procedure LoadChildTreeNodes(ATreeView: TEasyTreeView;
                               AData: array of PEasytvDirectoryRecord;
                               ParentNode: TTreeNode);
    
    procedure InitDirectoryData;
    function InsertDirectory(AData: PEasytvDirectoryRecord): Boolean;
    function UpdateDirectory(AData: PEasytvDirectoryRecord): Boolean;
    function DeleteDirectory(AData: PEasytvDirectoryRecord): Boolean;

    function InsertParam(AData: PEasytvParamsRecord): Boolean;
    function UpdateParam(AData: PEasytvParamsRecord): Boolean;
    function DeleteParam(AData: PEasytvParamsRecord): Boolean;
    //删除生成的临时节点
    procedure DeleteTmpNode(AText: string = '暂无目录结构');
    //释放数组  0 释放所有数组 1释放为空数组
    procedure DisposeArrayTvDirectory(AFlag: string = '0');
    //释放数组  0 释放所有数组 1释放为空数组
    procedure DisposeArrayTvParams(AFlag: string = '0');

    //模块升级
    //初始化模块升级页
    procedure InitTvModules();
  public
    { Public declarations }
  end;

var
  frmEasyPlateManage: TfrmEasyPlateManage;

implementation

{$R *.dfm}

uses
  untTvDirectoryOper, ActiveX, untEasyUtilDLL, untPlugParamsOP,
  untEasyUtilMethod;


var
  //操作对应的三种标志 增加 修改 删除
  Easy_Add :string= 'Add';
  Easy_Edit :string= 'Edit';
  Easy_Del :string= 'Del';

  ParentNodeFlag :string = '{00000000-0000-0000-0000-000000000000}';
//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyPlateManage := TfrmEasyPlateManage.Create(Application);
  if frmEasyPlateManage.FormStyle <> fsMDIChild then
    frmEasyPlateManage.FormStyle := fsMDIChild;
  if frmEasyPlateManage.WindowState <> wsMaximized then
    frmEasyPlateManage.WindowState := wsMaximized;
  frmEasyPlateManage.FormId := '{AC8E0BB3-2578-4D2A-8869-850891B8E5E8}';
  Result := frmEasyPlateManage;
end;

procedure TfrmEasyPlateManage.FormCreate(Sender: TObject);
var
  ABitMap: TBitmap;
begin
  inherited;
  //已添加到树的节点 提前创建
  AAddedTreeGUID := TStringList.Create;

  //初始化分页显示页面
  pgcSystemManager.ActivePageIndex := 0;
  pgcDirOperate.ActivePageIndex := 0;
  //加载树所需要的图片
  ABitMap := TBitmap.Create;
  ABitMap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'images\Tree.bmp');
  imgTv.Add(ABitMap, nil);
  ABitMap.Free;
  //初始化数据
  InitDirectoryData;
  //生成目录树
  GenerateTreeView(tvSysDirectory, tvTmpData, ParentNodeFlag);
  //
  tvSysDirectory.ReadOnly := True;
  mmOPLog.ReadOnly := True;

end;

procedure TfrmEasyPlateManage.GenerateTreeView(ATreeView: TEasyTreeView;
  AData: array of PEasytvDirectoryRecord; RootFlag: string);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  ATreeView.Items.Clear;
  with ATreeView do
  begin
    for I := Low(AData) to High(AData) do
    begin
      if (AData[I]^.sParentGUID = RootFlag) and  (AData[I]^.sCName <> '')
         and (AData[I]^.sFlag <> Easy_Del)
         and (AAddedTreeGUID.IndexOf(AData[I]^.sGUID) = -1) then
      begin
        ATmpNode := ATreeView.Items.AddChildObject(nil, AData[I]^.sCName, AData[I]);
        ATmpNode.ImageIndex := AData[I]^.iImage1;
        ATmpNode.SelectedIndex := AData[I]^.iImage2;
        
        AAddedTreeGUID.Add(AData[I]^.sGUID);
        //生成临时节点 只有目录
        if AData[I]^.bDir = 0 then
          ATreeView.Items.AddChildFirst(ATmpNode, 'TempChildNode');
      end;
    end;
  end;
  if ATreeView.Items.Count = 0 then
  begin
     Application.MessageBox('暂无目录结构数据！', '提示', MB_OK 
       + MB_ICONWARNING);
     Exit;
  end;
//    ATreeView.Items.AddChild(nil, '暂无目录结构');
end;

function TfrmEasyPlateManage.DeleteDirectory(
  AData: PEasytvDirectoryRecord): Boolean;
var
  DelSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    DelSQL := ' DELETE FROM sysPluginsDirectory WHERE GUID = ' + QuotedStr(AData^.sGUID);
    cdsDirManager.CommandText := DelSQL;
    cdsDirManager.Execute;
  //  AData^.sFlag := '';
    //执行日志输出
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '【删除】'
                      + AData^.sCName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('删除【' + AData^.sCName +'】出错,原因:' + e.Message), '提示',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.InsertDirectory(
  AData: PEasytvDirectoryRecord): Boolean;

  function Boolean2String(ABoolean: Boolean): string;
  begin
    if ABoolean then
      Result := 'True'
    else
      Result := 'False';
  end;  
var
  InsSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    InsSQL := ' INSERT INTO sysPluginsDirectory (GUID, sEName, sCName, iOrder,'
              + 'iImage1, iImage2, iFlag, bDir, sParentGUID, sPluginFileName) VALUES ('
              + QuotedStr(AData^.sGUID)
              + ',' + QuotedStr(AData^.sEName)
              + ',' + QuotedStr(AData^.sCName)
              + ',' + QuotedStr(IntToStr(AData^.iOrder))
              + ',' + QuotedStr(IntToStr(AData^.iImage1))
              + ',' + QuotedStr(IntToStr(AData^.iImage2))
              + ',' + QuotedStr(IntToStr(AData^.iFlag))
              + ',' + QuotedStr(IntToStr(AData^.bDir))
              + ',' + QuotedStr(AData^.sParentGUID)
              + ',' + QuotedStr(AData^.sPluginFileName)
              + ')';
    cdsDirManager.CommandText := InsSQL;
    cdsDirManager.Execute;
    AData^.sFlag := '';
    //执行日志输出
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '【新增】'
                        + AData^.sCName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('插入【' + AData^.sCName +'】出错,原因:' + e.Message), '提示',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.UpdateDirectory(
  AData: PEasytvDirectoryRecord): Boolean;
var
  UdpSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    UdpSQL := ' Update sysPluginsDirectory SET '
              + ' sEName = ' + QuotedStr(AData^.sEName) + ','
              + ' sCName = ' + QuotedStr(AData^.sCName) + ','
              + ' iOrder = ' + QuotedStr(IntToStr(AData^.iOrder)) + ','
              + ' iImage1 = ' + QuotedStr(IntToStr(AData^.iImage1))+ ','
              + ' iImage2 = ' + QuotedStr(IntToStr(AData^.iImage2))+ ','
              + ' iFlag = ' + QuotedStr(IntToStr(AData^.iFlag))  + ','
              + ' bDir = ' + QuotedStr(IntToStr(AData^.bDir))   + ','
              + ' sParentGUID = ' + QuotedStr(AData^.sParentGUID) + ','
              + ' sPluginFileName = ' + QuotedStr(AData^.sPluginFileName) + ' '
              + ' WHERE GUID = ' + QuotedStr(AData^.sGUID);
    cdsDirManager.CommandText := UdpSQL;
    cdsDirManager.Execute;
    AData^.sFlag := '';
    //执行日志输出
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '【修改】'
                        + AData^.sCName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('更新【' + AData^.sCName +'】出错,原因:' + e.Message), '提示',
                            MB_OK + MB_ICONSTOP);
  end;
end;

procedure TfrmEasyPlateManage.btnAddClick(Sender: TObject);
begin
  inherited;
  DeleteTmpNode;
  SetLength(tvTmpData, Length(tvTmpData) + 1);
  New(tvTmpData[High(tvTmpData)]);
  tvTmpData[High(tvTmpData)]^.sGUID := GenerateGUID;
  tvTmpData[High(tvTmpData)]^.sParentGUID := ParentNodeFlag;
  tvTmpData[High(tvTmpData)]^.sFlag := Easy_Add;

  ShowfrmTvDirectoryOper(tvTmpData[High(tvTmpData)], Easy_Add);
  if tvTmpData[High(tvTmpData)]^.sCName <> '' then
    GenerateTreeNode(tvSysDirectory, tvTmpData[High(tvTmpData)], nil);
end;

procedure TfrmEasyPlateManage.GenerateTreeNode(ATreeView: TEasyTreeView;
  AData: PEasytvDirectoryRecord; ParentNode: TTreeNode);
var
  AResultNode: TTreeNode;
begin
  AResultNode := ATreeView.Items.AddChildObject(ParentNode, AData^.sCName, AData);
  AResultNode.ImageIndex := AData^.iImage1;
  AResultNode.SelectedIndex := AData^.iImage2;
  //生成生必须选中生成节点
  if AResultNode <> nil then
    ATreeView.Selected := AResultNode;
end;

procedure TfrmEasyPlateManage.btnInsertClick(Sender: TObject);
begin
  inherited;
  DeleteTmpNode;
  if tvSysDirectory.Selected = nil then
  begin
    Application.MessageBox('请选择一个节点做为挂靠节点！', '提示', MB_OK + 
      MB_ICONINFORMATION);
    Exit;     
  end;  
  SetLength(tvTmpData, Length(tvTmpData) + 1);
  New(tvTmpData[High(tvTmpData)]);
  tvTmpData[High(tvTmpData)]^.sGUID := GenerateGUID;
  tvTmpData[High(tvTmpData)]^.sParentGUID := PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID;
  tvTmpData[High(tvTmpData)]^.sFlag := Easy_Add;

  ShowfrmTvDirectoryOper(tvTmpData[High(tvTmpData)], Easy_Add,
                   PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sCName);
  if tvTmpData[High(tvTmpData)]^.sCName <> '' then
    GenerateTreeNode(tvSysDirectory, tvTmpData[High(tvTmpData)], tvSysDirectory.Selected);
end;

procedure TfrmEasyPlateManage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DisposeArrayTvDirectory;
  DisposeArrayTvParams;
end;

procedure TfrmEasyPlateManage.btnEditClick(Sender: TObject);
var
  ASelectedNode: TTreeNode;
  TmpData      : PEasytvDirectoryRecord;
begin
  inherited;
  DeleteTmpNode;
  ASelectedNode := tvSysDirectory.Selected;
  if ASelectedNode = nil then
  begin
    Application.MessageBox('请选择一个要修改的节点！', '提示', MB_OK + 
      MB_ICONINFORMATION);
    Exit;     
  end;
  TmpData := PEasytvDirectoryRecord(ASelectedNode.Data);
  if TmpData^.sFlag <> Easy_Add then
    TmpData^.sFlag := Easy_Edit;
    
  ShowfrmTvDirectoryOper(TmpData, Easy_Edit);
  ASelectedNode.Text := TmpData^.sCName;
end;

procedure TfrmEasyPlateManage.btnSaveClick(Sender: TObject);
var
  I, J: Integer;
  ADivValue: Integer; //进度条的幅度
begin
  inherited;
  J := 0;
  ADivValue := 100 div High(tvTmpData);
  pgbOperate.Position := 0;
  //新增 修改 删除 保存操作
  try
    for I := Low(tvTmpData) to High(tvTmpData) do
    begin
      if Trim(tvTmpData[I]^.sCName) <> '' then
      begin
        if tvTmpData[I]^.sFlag = Easy_Add then
        begin
          inc(J);
          InsertDirectory(tvTmpData[I]);
        end;
        if tvTmpData[I]^.sFlag = Easy_Del then
        begin
          inc(J);
          DeleteDirectory(tvTmpData[I]);
        end;
        if tvTmpData[I]^.sFlag = Easy_Edit then
        begin
          inc(J);
          UpdateDirectory(tvTmpData[I]);
        end;
      end;
      pgbOperate.Position := pgbOperate.Position + ADivValue;
    end;
    if J > 0 then
    begin
      Application.MessageBox('提交完成！', '提示', MB_OK + MB_ICONINFORMATION);
      btnRefreshClick(Sender);
      pgbOperate.Position := 0;
      lvDeleted.Items.Clear;
    end
    else
    begin
      pgbOperate.Position := 0;
      Application.MessageBox('没有要提交的更改！', '提示', MB_OK + MB_ICONINFORMATION);
    end;
  except on e:Exception do
    if Application.MessageBox(PChar('提交出错,原因：' + e.Message
              + '具体可查看【操作日志】！'), '提示', MB_OKCANCEL + MB_ICONWARNING) = IDOK then
    begin
      pgcSystemManager.ActivePage := tbsOPLog;
      pgbOperate.Position := 0;
      lvDeleted.Items.Clear;
    end
    else
    begin
      pgbOperate.Position := 0;
      lvDeleted.Items.Clear;
    end;  
    //将未操作数据处理                                
  end;
end;

procedure TfrmEasyPlateManage.DeleteTmpNode;
begin
  if tvSysDirectory.Items.Count = 1 then
  begin
    if tvSysDirectory.Items[0].Text = AText then
      tvSysDirectory.Items[0].Delete;
  end;
end;

procedure TfrmEasyPlateManage.btnDeleteClick(Sender: TObject);
var
  ASelectedNode: TTreeNode;
  TmpListItem  : TListItem;
  I            : Integer;
begin
  inherited;
  //判断是否有临时节点，将其删除
  DeleteTmpNode;
  ASelectedNode := tvSysDirectory.Selected;
  if ASelectedNode = nil then
  begin
    Application.MessageBox('请选择要删除的节点！', '提示', MB_OK + 
      MB_ICONINFORMATION);
    Exit;  
  end;
  TmpListItem := lvDeleted.Items.Add;
  TmpListItem.Caption := PEasytvDirectoryRecord(ASelectedNode.Data)^.sCName;
  for I := Low(tvTmpData) to High(tvTmpData) do
  begin
    if tvTmpData[I]^.sGUID = PEasytvDirectoryRecord(ASelectedNode.Data)^.sGUID then
      tvTmpData[I]^.sFlag := Easy_Del;
  end;  
  tvSysDirectory.Items.Delete(ASelectedNode);
end;

procedure TfrmEasyPlateManage.btnRefreshClick(Sender: TObject);
begin
  inherited;
  tvSysDirectory.Items.Clear;
  AAddedTreeGUID.Clear;

  DisposeArrayTvDirectory('0');
  //2010-10-31 18:30:41 + 
  DisposeArrayTvParams('0');
  lvParamers.Items.Clear;

  InitDirectoryData;
  //生成目录树
  GenerateTreeView(tvSysDirectory, tvTmpData, ParentNodeFlag);
end;

procedure TfrmEasyPlateManage.btnCancelClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  DisposeArrayTvDirectory('1');

  lvParamers.Items.Clear;
  AAddedTreeGUID.Clear;
  lvDeleted.Items.Clear;

  for I := Low(tvTmpData) to High(tvTmpData) do
  begin
    if tvTmpData[I]^.sFlag <> '' then
      tvTmpData[I]^.sFlag := '';
  end;  

  //生成目录树
  GenerateTreeView(tvSysDirectory, tvTmpData, ParentNodeFlag);
end;

procedure TfrmEasyPlateManage.DisposeArrayTvDirectory(AFlag: string = '0');
var
  I: Integer;
begin
  if AFlag = '0' then
  begin
    for I := Low(tvTmpData) to High(tvTmpData) do
      Dispose(tvTmpData[I]);
    SetLength(tvTmpData, 0);
  end
  else
  if AFlag = '1' then
  begin
    for I := Low(tvTmpData) to High(tvTmpData) do
    begin
      if tvTmpData[I]^.sCName = '' then
        Dispose(tvTmpData[I]);
    end;
  end;
end;

procedure TfrmEasyPlateManage.InitDirectoryData;
var
  I: Integer;
begin
  if cdsDirManager.Active then
    cdsDirManager.Close;
  //初始化系统目录数组
  cdsDirManager.CommandText := '';
  cdsDirManager.CommandText := 'SELECT * FROM vw_sysPlugins ORDER BY bDir, iOrder';
  cdsDirManager.Open;
  cdsDirManager.First;  //*
  for I := 0 to cdsDirManager.RecordCount - 1 do
  begin
    SetLength(tvTmpData, Length(tvTmpData) + 1);
    New(tvTmpData[High(tvTmpData)]);

    tvTmpData[High(tvTmpData)]^.sGUID := cdsDirManager.fieldbyname('GUID').AsString;
    tvTmpData[High(tvTmpData)]^.sEName := cdsDirManager.fieldbyname('sEName').AsString;
    tvTmpData[High(tvTmpData)]^.sCName := cdsDirManager.fieldbyname('sCName').AsString;
    tvTmpData[High(tvTmpData)]^.iOrder := cdsDirManager.fieldbyname('iOrder').AsInteger;
    tvTmpData[High(tvTmpData)]^.iImage1 := cdsDirManager.fieldbyname('iImage1').AsInteger;
    tvTmpData[High(tvTmpData)]^.iImage2 := cdsDirManager.fieldbyname('iImage2').AsInteger;
    tvTmpData[High(tvTmpData)]^.iFlag := cdsDirManager.fieldbyname('iFlag').AsInteger;
    tvTmpData[High(tvTmpData)]^.sParentGUID := cdsDirManager.fieldbyname('sParentGUID').AsString;
    tvTmpData[High(tvTmpData)]^.bDir := cdsDirManager.fieldbyname('bDir').AsInteger;
    tvTmpData[High(tvTmpData)]^.sPluginFileName := cdsDirManager.fieldbyname('sPluginFileName').AsString;
    //参数
    if cdsDirManager.fieldbyname('bDir').AsInteger = 1 then
    begin
      SetLength(tvTmpParamsData, Length(tvTmpParamsData) + 1);
      New(tvTmpParamsData[High(tvTmpParamsData)]);
      tvTmpParamsData[High(tvTmpParamsData)]^.ParamGUID := cdsDirManager.fieldbyname('ParamGUID').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sPluginGUID := cdsDirManager.fieldbyname('PlugGUID').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sParamEName := cdsDirManager.fieldbyname('sParamEName').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sParamCName := cdsDirManager.fieldbyname('sParamCName').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sValueType := cdsDirManager.fieldbyname('sValueType').AsString;
      tvTmpParamsData[High(tvTmpParamsData)]^.sValue := cdsDirManager.fieldbyname('sValue').AsString;
    end;

    cdsDirManager.Next;
  end;
end;

procedure TfrmEasyPlateManage.LoadChildTreeNodes(ATreeView: TEasyTreeView;
  AData: array of PEasytvDirectoryRecord; ParentNode: TTreeNode);
var
  I       : Integer;
  ATmpNode: TTreeNode;
begin
  with ATreeView do
  begin
    for I := Low(AData) to High(AData) do
    begin
      if (AData[I]^.sParentGUID = PEasytvDirectoryRecord(ParentNode.Data)^.sGUID) and
         (AData[I]^.sCName <> '') and (AData[I]^.sFlag <> Easy_Del)
          and (AAddedTreeGUID.IndexOf(AData[I]^.sGUID) = -1) then
      begin
        ATmpNode := ATreeView.Items.AddChildObject(ParentNode, AData[I]^.sCName, AData[I]);
        ATmpNode.ImageIndex := AData[I]^.iImage1;
        ATmpNode.SelectedIndex := AData[I]^.iImage2;
        
        AAddedTreeGUID.Add(AData[I]^.sGUID);
        //生成临时节点 只有目录
        if AData[I]^.bDir = 0 then
          ATreeView.Items.AddChildFirst(ATmpNode, 'TempChildNode');
      end;
    end;
  end;
end;

procedure TfrmEasyPlateManage.tvSysDirectoryExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.HasChildren then
  begin
    if Node.Item[0].Text = 'TempChildNode' then
    begin
      Node.Item[0].Delete;
      LoadChildTreeNodes(tvSysDirectory, tvTmpData, Node);
    end;
  end;
end;

procedure TfrmEasyPlateManage.tvSysDirectoryDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var 
  AnItem: TTreeNode;
  AttachMode: TNodeAttachMode;
  HT: THitTests;
begin
  if tvSysDirectory.Selected = nil then Exit;
  AttachMode := naAdd;
  HT := tvSysDirectory.GetHitTestInfoAt(X, Y);
  AnItem := tvSysDirectory.GetNodeAt(X, Y);
  if (HT - [htOnItem, htOnIcon, htNowhere, htOnIndent] <> HT) then 
  begin
    if (htOnItem in HT) or (htOnIcon in HT) then
      AttachMode := naAddChild
    else
    if htNowhere in HT then
      AttachMode := naAdd
    else
    if htOnIndent in HT then
      AttachMode := naInsert;
    tvSysDirectory.Selected.MoveTo(AnItem, AttachMode);
    //更改移动节点的上级节点 并设置更新状态
    if AnItem.Data <> nil then
    begin
      PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sParentGUID :=
                             PEasytvDirectoryRecord(AnItem.Data)^.sGUID;
      //如果不是新增的节点就将更标志改为编辑状态
      if PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sFlag <> Easy_Add then
        PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sFlag := Easy_Edit;
    end;
  end;
end;

procedure TfrmEasyPlateManage.tvSysDirectoryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  //判断左键按下并且鼠标点在一个结点上开始实现拖拽}
  if (Button = mbLeft) and (htOnItem in tvSysDirectory.GetHitTestInfoAt(X, Y)) then
    tvSysDirectory.BeginDrag(False);
end;

procedure TfrmEasyPlateManage.tvSysDirectoryDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var   
  Node: TTreeNode;   
begin
  if Source = tvSysDirectory then
  begin
    Node := tvSysDirectory.GetNodeAt(X, Y);   {取当前结点}
    if Node <> nil then   {当前结点不为空才能实现拖拽，accept:=true}
      Accept := True;
  end;   
end;

procedure TfrmEasyPlateManage.N6Click(Sender: TObject);
begin
  inherited;
  tvSysDirectory.FullExpand;
end;

procedure TfrmEasyPlateManage.N7Click(Sender: TObject);
begin
  inherited;
  tvSysDirectory.FullCollapse;
end;

procedure TfrmEasyPlateManage.ppTVRefreshClick(Sender: TObject);
begin
  inherited;
  btnRefreshClick(Sender);
end;

procedure TfrmEasyPlateManage.tvSysDirectoryChange(Sender: TObject;
  Node: TTreeNode);
var
  TmpListItem: TListItem;
  I          : Integer;
begin
  inherited;
  DeleteTmpNode();
  lvParamers.Items.Clear;

  if PEasytvDirectoryRecord(Node.Data)^.bDir = 1 then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
    begin
      if (PEasytvParamsRecord(tvTmpParamsData[I])^.sPluginGUID
         = PEasytvDirectoryRecord(Node.Data)^.sGUID)
         and (PEasytvParamsRecord(tvTmpParamsData[I])^.sParamEName <> '') then
      begin
        TmpListItem := lvParamers.Items.Add;
        //2010-10-31 18:29:46  参数改为显示英文名称
        TmpListItem.Caption := PEasytvParamsRecord(tvTmpParamsData[I])^.sParamEName;
        TmpListItem.SubItems.Add(PEasytvParamsRecord(tvTmpParamsData[I])^.sValue);
      end;
    end;
  end;
end;

procedure TfrmEasyPlateManage.FormDestroy(Sender: TObject);
begin
  inherited;
  AAddedTreeGUID.Free;
end;

procedure TfrmEasyPlateManage.btnParamEditClick(Sender: TObject);
var
  I       : Integer;
  ATmpParamData: PEasytvParamsRecord;
begin
  inherited;
  if lvParamers.Selected <> nil then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
    begin
      if (tvTmpParamsData[I]^.sPluginGUID
        = PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID)
        and (tvTmpParamsData[I]^.sParamEName = lvParamers.Selected.Caption) then
      begin
        ATmpParamData := tvTmpParamsData[I];
        Break;
      end;  
    end;
    if ATmpParamData <> nil then
      ShowfrmPlugParamsOP(ATmpParamData, Easy_Edit);
  end
  else
  begin
    Application.MessageBox('请选择要【编辑】的参数！', '提示', MB_OK + 
      MB_ICONINFORMATION);
    Exit;  
  end;
  if ATmpParamData <> nil then
  begin
    UpdateParam(ATmpParamData);
    lvParamers.Selected.Caption := ATmpParamData^.sParamEName;
    lvParamers.Selected.SubItems[0] := ATmpParamData^.sValue;
  end;  
end;

procedure TfrmEasyPlateManage.btnParamDeleteClick(Sender: TObject);
var
  I:  Integer;
  ATmpParamData: PEasytvParamsRecord;
begin
  inherited;
  if lvParamers.Selected <> nil then
  begin
    if Application.MessageBox(PChar('确定要删除【' + lvParamers.Selected.Caption
             + '】参数吗？'), '提示', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
    begin
      for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
      begin
        if (tvTmpParamsData[I]^.sPluginGUID
          = PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID)
          and (tvTmpParamsData[I]^.sParamEName = lvParamers.Selected.Caption) then
        begin
          ATmpParamData := tvTmpParamsData[I];
          Break;
        end;
      end;
      if ATmpParamData <> nil then
      begin
        if DeleteParam(ATmpParamData) then
          lvParamers.DeleteSelected;
      end;  
    end;
  end
  else
  begin
    Application.MessageBox('请选择要【删除】的参数！', '提示', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TfrmEasyPlateManage.btnParamAddClick(Sender: TObject);
var
  ATmpParamData: PEasytvParamsRecord;
  TmpListItem: TListItem;
begin
  inherited;
  if tvSysDirectory.Selected <> nil then
  begin
    if PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.bDir = 1 then
    begin
      SetLength(tvTmpParamsData, Length(tvTmpParamsData) + 1);
      New(tvTmpParamsData[High(tvTmpParamsData)]);
      ATmpParamData := tvTmpParamsData[High(tvTmpParamsData)];
      //新增时初始化
      ATmpParamData^.ParamGUID := GenerateGUID;
      ATmpParamData^.sPluginGUID := PEasytvDirectoryRecord(tvSysDirectory.Selected.Data)^.sGUID;

      ShowfrmPlugParamsOP(ATmpParamData, Easy_Add);
    end
    else
    begin
      Application.MessageBox('只能对【插件】文件添加参数！', '提示', MB_OK +
        MB_ICONWARNING);
      Exit;
    end;
  end
  else
  begin
      Application.MessageBox('请选择要添加参数的【插件】文件！', '提示', MB_OK +
        MB_ICONWARNING);
      Exit;
  end;
  //执行保存
  if Trim(tvTmpParamsData[High(tvTmpParamsData)]^.sParamEName) <> '' then
  begin
    if tvTmpParamsData[High(tvTmpParamsData)] <> nil then
    begin
      if InsertParam(tvTmpParamsData[High(tvTmpParamsData)]) then
      begin
        TmpListItem := lvParamers.Items.Add;
        TmpListItem.Caption := tvTmpParamsData[High(tvTmpParamsData)]^.sParamEName;
        TmpListItem.SubItems.Add(tvTmpParamsData[High(tvTmpParamsData)]^.sValue);
      end;
    end;
  end;   
end;

procedure TfrmEasyPlateManage.DisposeArrayTvParams(AFlag: string);
var
  I: Integer;
begin
  if AFlag = '0' then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
      Dispose(tvTmpParamsData[I]);
    SetLength(tvTmpParamsData, 0);
  end
  else
  if AFlag = '1' then
  begin
    for I := Low(tvTmpParamsData) to High(tvTmpParamsData) do
    begin
      if tvTmpParamsData[I]^.sParamEName = '' then
        Dispose(tvTmpParamsData[I]);
    end;
  end;
end;

function TfrmEasyPlateManage.DeleteParam(
  AData: PEasytvParamsRecord): Boolean;
var
  DelSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    DelSQL := ' DELETE FROM sysPluginParams WHERE GUID = ' + QuotedStr(AData^.ParamGUID);
    cdsDirManager.CommandText := DelSQL;
    cdsDirManager.Execute;
    //执行日志输出
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '【删除参数】'
                      + AData^.sParamEName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('删除【' + AData^.sParamEName +'】出错,原因:' + e.Message), '提示',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.InsertParam(
  AData: PEasytvParamsRecord): Boolean;
var
  InsSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    InsSQL := ' INSERT INTO sysPluginParams (GUID, PlugGUID, sEName, sCName, sValueType,'
              + ' sValue) VALUES ('
              + QuotedStr(AData^.ParamGUID)
              + ',' + QuotedStr(AData^.sPluginGUID)
              + ',' + QuotedStr(AData^.sParamEName)
              + ',' + QuotedStr(AData^.sParamCName)
              + ',' + QuotedStr(AData^.sValueType)
              + ',' + QuotedStr(AData^.sValue)
              + ')';
    cdsDirManager.CommandText := InsSQL;
    cdsDirManager.Execute;
    //执行日志输出
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '【新增参数】'
                        + AData^.sParamEName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('插入【' + AData^.sParamEName +'】出错,原因:' + e.Message), '提示',
                            MB_OK + MB_ICONSTOP);
  end;
end;

function TfrmEasyPlateManage.UpdateParam(
  AData: PEasytvParamsRecord): Boolean;
var
  UdpSQL: string;
begin
  Result := False;
  try
    cdsDirManager.Close;
    UdpSQL := ' Update sysPluginParams SET '
              + ' sEName = ' + QuotedStr(AData^.sParamEName) + ','
              + ' sValue = ' + QuotedStr(AData^.sValue) + ' '
              + ' WHERE GUID = ' + QuotedStr(AData^.ParamGUID);
    cdsDirManager.CommandText := UdpSQL;
    cdsDirManager.Execute;
    //执行日志输出
    mmOPLog.Lines.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '【修改参数】'
                        + AData^.sParamEName);
    Result := True;
  except on e: Exception do
    Application.MessageBox(PChar('更新【' + AData^.sParamEName +'】出错,原因:' + e.Message), '提示',
                            MB_OK + MB_ICONSTOP);
  end;
end;

procedure TfrmEasyPlateManage.pgcSystemManagerChange(Sender: TObject);
begin
  inherited;
  //切换到模块升级
  if pgcSystemManager.ActivePage = tbsModulesUpdate then
  begin
    if tvModules.Items.Count <= 0 then
    begin
      AAddedTreeGUID.Clear;
      InitTvModules;
    end;
  end;
end;

procedure TfrmEasyPlateManage.InitTvModules;
begin
  //生成目录树
  GenerateTreeView(tvModules, tvTmpData, ParentNodeFlag);
end;

end.
