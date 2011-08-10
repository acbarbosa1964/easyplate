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
//    数据字典
//主要实现：
//    系统所用选择列表均在些管理
//-----------------------------------------------------------------------------}
unit untEasySysDataList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, untEasyToolBar, untEasyToolBarStylers,
  ExtCtrls, untEasyGroupBox, ComCtrls, DB, DBClient, untEasyUtilMethod,
  ActnList, ImgList, Grids, untEasyBaseGrid, untEasyGrid, untEasyDBGrid,
  untEasyTreeView, untEasyUtilConst, DBGrids;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasySysDataList = class(TfrmEasyPlateDBBaseForm)
    edpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    tbosMain: TEasyToolBarOfficeStyler;
    EasyPanel1: TEasyPanel;
    EasyPanel2: TEasyPanel;
    EasyPanel3: TEasyPanel;
    Splitter1: TSplitter;
    cdsDataListMain: TClientDataSet;
    dsDataListMain: TDataSource;
    EasyDBGrid1: TEasyDBGrid;
    tvDataListMain: TEasyTreeView;
    imgDataList: TImageList;
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarButton2: TEasyToolBarButton;
    imgToolBar: TImageList;
    EasyToolBarButton1: TEasyToolBarButton;
    actDataList: TActionList;
    actNewMst: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actExit: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actRedo: TAction;
    actUndo: TAction;
    actFind: TAction;
    actPrint: TAction;
    actAddDtl: TAction;
    actEditDtl: TAction;
    actDeleteDtl: TAction;
    actCopyDtl: TAction;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton9: TEasyToolBarButton;
    EasyToolBarButton10: TEasyToolBarButton;
    EasyToolBarButton12: TEasyToolBarButton;
    actRedoDtl: TAction;
    actUndoDtl: TAction;
    cdsCloneData: TClientDataSet;
    EasyToolBarButton11: TEasyToolBarButton;
    actSave: TAction;
    EasyToolBarButton14: TEasyToolBarButton;
    actRefresh: TAction;
    EasyToolBarButton15: TEasyToolBarButton;
    EasyToolBarButton7: TEasyToolBarButton;
    cdsMain: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvDataListMainChange(Sender: TObject; Node: TTreeNode);
    procedure actExitExecute(Sender: TObject);
    procedure actAddDtlExecute(Sender: TObject);
    procedure actDeleteDtlExecute(Sender: TObject);
    procedure actNewMstExecute(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actEditDtlExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actAddDtlUpdate(Sender: TObject);
    procedure actEditDtlUpdate(Sender: TObject);
    procedure actDeleteDtlUpdate(Sender: TObject);
    procedure EasyDBGrid1EditingDone(Sender: TObject);
    procedure actFindUpdate(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure tvDataListMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FSysDataListList: TList;
    procedure InitDataSet;
    procedure InitSysDataListTreeView;
    procedure FindTV(tv: TEasyTreeView);
  public
    { Public declarations }
  end;

var
  frmEasySysDataList: TfrmEasySysDataList;

implementation

{$R *.dfm}

uses
  untEasyClassSysDataList, untEasySysDataListOP, untEasyInputQuery;

var
  SysDataListRoot : string = '{00000000-0000-0000-0000-000000000000}';
  FindText: string;
  FindCurrIndex: Integer;

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasySysDataList := TfrmEasySysDataList.Create(Application);
  if frmEasySysDataList.FormStyle <> fsMDIChild then
    frmEasySysDataList.FormStyle := fsMDIChild;
  if frmEasySysDataList.WindowState <> wsMaximized then
    frmEasySysDataList.WindowState := wsMaximized;
  Result := frmEasySysDataList;
end;

{ TfrmEasySysDataList }

procedure TfrmEasySysDataList.InitDataSet;
var
  ASysDataList: string;
begin
  ASysDataList := 'SELECT * FROM SysDataList ORDER BY ParentDataListGUID,iOrder';
  cdsDataListMain.Close;
  cdsDataListMain.Data := EasyRDMDisp.EasyGetRDMData(ASysDataList);

  with cdsDataListMain do
  begin
    Filtered := False;
    Filter := 'ParentDataListGUID = ' + QuotedStr(SysDataListRoot);
    Filtered := True;
  end;
  cdsMain.Close;
  cdsMain.CloneCursor(cdsDataListMain, False);
  cdsMain.IndexFieldNames := 'ParentDataListGUID;iOrder';

  with cdsDataListMain do
  begin
    Filtered := False;
    Filter := 'ParentDataListGUID <> ' + QuotedStr(SysDataListRoot);
    Filtered := True;
  end;
  cdsCloneData.Close;
  cdsCloneData.CloneCursor(cdsDataListMain, False);
  cdsCloneData.IndexFieldNames := 'iOrder';
end;

procedure TfrmEasySysDataList.FormShow(Sender: TObject);
var
  AOle: OleVariant;
begin
  inherited;
  //初始化数据
  InitDataSet;
  AOle := cdsMain.Data;
  TEasySysDataList.GenerateSysDataList(AOle, FSysDataListList);
  //初始化树
  InitSysDataListTreeView;
  //导航树不可编辑
  tvDataListMain.ReadOnly := True;
  //
  FindCurrIndex := -1;
  FindText := '';
end;

procedure TfrmEasySysDataList.FormCreate(Sender: TObject);
begin
  inherited;
  FSysDataListList := TList.Create;
end;

procedure TfrmEasySysDataList.FormDestroy(Sender: TObject);
begin
  while (FSysDataListList.Count > 0) do
  begin
    TEasySysDataList(FSysDataListList[0]).Free;
    FSysDataListList.Delete(0);
  end;
  FSysDataListList.Free;
  inherited;
end;

procedure TfrmEasySysDataList.InitSysDataListTreeView;
var
  I: Integer;
  ATreeNode: TTreeNode;
begin
  try
    tvDataListMain.Items.BeginUpdate;
    tvDataListMain.Items.Clear;
    for I := 0 to FSysDataListList.Count - 1 do
    begin
      if TEasySysDataList(FSysDataListList[I]).ParentDataListGUID = SysDataListRoot then
      begin
        ATreeNode := tvDataListMain.Items.AddChild(nil,
                   IntToStr(tvDataListMain.Items.Count + 1) + '、'
                   + TEasySysDataList(FSysDataListList[I]).SysDataName);
        ATreeNode.Data := FSysDataListList[I];

        ATreeNode.ImageIndex := 2;
        ATreeNode.SelectedIndex := 1;
      end;
    end;
  finally
    tvDataListMain.Items.EndUpdate;
  end;
end;

procedure TfrmEasySysDataList.tvDataListMainChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  try
    EasyDBGrid1.BeginUpdate;
    with cdsCloneData do
    begin
      Filtered := False;
      Filter := 'ParentDataListGUID = ' + QuotedStr(TEasySysDataList(Node.Data).DataListGUID);
      Filtered := True;
    end;
    EasyDBGrid1.AutoNumberCol(0);
    EasyDBGrid1.Options := EasyDBGrid1.Options - [goEditing];
  finally
    EasyDBGrid1.EndUpdate;
  end;
end;

procedure TfrmEasySysDataList.actExitExecute(Sender: TObject);
begin
  inherited;
  if (cdsMain.ChangeCount > 0)  or (cdsCloneData.ChangeCount > 0) then
  begin
    case Application.MessageBox('数据已发生改变是否保存?', '提示',
      MB_YESNOCANCEL + MB_ICONQUESTION) of
      IDYES:
        begin
          actSaveExecute(Sender);
          Close;
        end;
      IDNO:
        begin
          Close;
        end;
    end;
  end else
    Close;
end;

procedure TfrmEasySysDataList.actAddDtlExecute(Sender: TObject);
begin
  inherited;
  cdsCloneData.Last;
  EasyDBGrid1.Options := EasyDBGrid1.Options + [goEditing];
  with cdsCloneData do
  begin
    Append;
    //1 DataListGUID
    FieldByName('DataListGUID').AsString := GenerateGUID;
    //2 SysDataName
    FieldByName('SysDataName').AsString := '';
    //3 SysDataValue
    FieldByName('SysDataValue').AsString := '';
    //4 ParentDataListGUID
    FieldByName('ParentDataListGUID').AsString := TEasySysDataList(tvDataListMain.Selected.Data).DataListGUID;
    //5 bEnable
    FieldByName('bEnable').AsBoolean := True;
    //6 iOrder
    FieldByName('iOrder').AsInteger := EasyDBGrid1.RealRow;
    //7 Remark
    FieldByName('Remark').AsString := '';
  end;
//  EasyDBGrid1.AutoNumberCol(0);
end;

procedure TfrmEasySysDataList.actDeleteDtlExecute(Sender: TObject);
begin
  inherited;
//  if Trim(cdsCloneData.fieldbyname('SysDataName').AsString) <> '' then
  begin
    if Application.MessageBox(pchar('确定要删除【' + cdsCloneData.fieldbyname('SysDataName').AsString
        + '】吗?'), '提示', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
    begin
      cdsCloneData.Delete;
//      EasyDBGrid1.AutoNumberCol(0);
    end;
  end;
end;

procedure TfrmEasySysDataList.actNewMstExecute(Sender: TObject);
var
  ASysDataList: TEasySysDataList;
  ATreeNode   : TTreeNode;
begin
  inherited;
  try
    ASysDataList := TEasySysDataList.Create;
    ASysDataList.iOrder := tvDataListMain.Items.Count + 1;
    ShowfrmuntEasySysDataListOP(ASysDataList, eotAdd);
    if Trim(ASysDataList.DataListGUID) = '' then
      ASysDataList.Free
    else
    begin
      TEasySysDataList.AppendClientDataSet(cdsMain, ASysDataList, FSysDataListList);
      ATreeNode := tvDataListMain.Items.AddChild(nil,
                   IntToStr(tvDataListMain.Items.Count + 1) + '、' + ASysDataList.SysDataName);
      ATreeNode.ImageIndex := 2;
      ATreeNode.SelectedIndex := 1;
      ATreeNode.Data := ASysDataList;
      tvDataListMain.Selected := ATreeNode;
    end;
  except on E:Exception do
    begin
      ASysDataList.Free;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TfrmEasySysDataList.actEditUpdate(Sender: TObject);
begin
  inherited;
  actEdit.Enabled := tvDataListMain.Selected <> nil;
end;

procedure TfrmEasySysDataList.actEditExecute(Sender: TObject);
var
  AData: TEasySysDataList;
begin
  inherited;
  AData := TEasySysDataList(tvDataListMain.Selected.Data);
  ShowfrmuntEasySysDataListOP(AData, eotEdit);
  TEasySysDataList.EditClientDataSet(cdsMain, AData, FSysDataListList);
  tvDataListMain.Selected.Text := AData.SysDataName;
end;

procedure TfrmEasySysDataList.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  actDelete.Enabled := tvDataListMain.Selected <> nil;
end;

procedure TfrmEasySysDataList.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if cdsCloneData.RecordCount > 0 then
  begin
    Application.MessageBox('存在子记录,不能进行删除操作！', '提示', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
  if Application.MessageBox(PChar('确定要删除节点【'
             + TEasySysDataList(tvDataListMain.Selected.Data).SysDataName
             +'】吗?'), '提示', MB_OKCANCEL + MB_ICONQUESTION) <> IDOK then
    Exit
  else
  begin
    TEasySysDataList.DeleteClientDataSet(cdsMain,
            TEasySysDataList(tvDataListMain.Selected.Data), FSysDataListList);
    tvDataListMain.Items.Delete(tvDataListMain.Selected);
  end;
end;

procedure TfrmEasySysDataList.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := (cdsCloneData.ChangeCount > 0) or (cdsMain.ChangeCount > 0);
end;

procedure TfrmEasySysDataList.actSaveExecute(Sender: TObject);
var
  ATableOle,
  AKeyFieldOle,
  ADeltaOle,
  ACodeErrorOle,
  AResultOle: OleVariant;
  cdsError  : TClientDataSet;
  I         : Integer;
  AErrorCode: Integer;
  __Error   : Boolean;
begin
  inherited;
  __Error := False;

  if (cdsMain.ChangeCount > 0) and (cdsCloneData.ChangeCount = 0) then
    AResultOle := EasyRDMDisp.EasySaveRDMData('SysDataList', cdsMain.Delta, 'DataListGUID', AErrorCode)
  else
  if (cdsMain.ChangeCount = 0) and (cdsCloneData.ChangeCount > 0) then
    AResultOle := EasyRDMDisp.EasySaveRDMData('SysDataList', cdsCloneData.Delta, 'DataListGUID', AErrorCode)
  else if (cdsMain.ChangeCount > 0) and (cdsCloneData.ChangeCount > 0) then
  begin
    ATableOle := VarArrayCreate([0, 1], varVariant);
    ATableOle[0] := 'SysDataList';
    ATableOle[1] := 'SysDataList';

    AKeyFieldOle := VarArrayCreate([0, 1], varVariant);
    AKeyFieldOle[0] := 'DataListGUID';
    AKeyFieldOle[1] := 'DataListGUID';

    ADeltaOle := VarArrayCreate([0, 1], varVariant);
    ADeltaOle[0] := cdsMain.Delta;
    ADeltaOle[1] := cdsCloneData.Delta;

    ACodeErrorOle := VarArrayCreate([0, 1], varVariant);
    AResultOle := EasyRDMDisp.EasySaveRDMDatas(ATableOle, ADeltaOle, AKeyFieldOle, ACodeErrorOle);
    //如果 ACodeErrorOle > 0 即发生错误
    for I := VarArrayLowBound(ACodeErrorOle, 1) to VarArrayHighBound(ACodeErrorOle, 1) do
    begin
      if ACodeErrorOLE[I] <> 0 then
      begin
        __Error := True;
        Break;
      end;
    end;
  end;
  if (AErrorCode <> 0) or __Error then
  begin
    cdsError := TClientDataSet.Create(Self);
    try
      cdsError.Data := AResultOle;
      Application.MessageBox(PChar(EASY_SYS_SAVE_FAILED + #13
         + cdsError.fieldbyname('ERROR_MESSAGE').AsString), EASY_SYS_HINT, MB_OK + MB_ICONERROR);
    finally
      cdsError.Free;
    end;
  end else
  begin
    if cdsMain.ChangeCount > 0 then
      cdsMain.MergeChangeLog;
    if cdsCloneData.ChangeCount > 0 then
      cdsCloneData.MergeChangeLog;
    Application.MessageBox(EASY_SYS_SAVE_SUCCESS, EASY_SYS_HINT, MB_OK + MB_ICONINFORMATION);
    if tvDataListMain.Selected <> nil then
      tvDataListMainChange(Sender, tvDataListMain.Selected);
  end; 
end;

procedure TfrmEasySysDataList.actEditDtlExecute(Sender: TObject);
begin
  inherited;
  if Trim(cdsCloneData.fieldbyname('DataListGUID').AsString) <> '' then
    EasyDBGrid1.Options := EasyDBGrid1.Options + [goEditing];
end;

procedure TfrmEasySysDataList.actRefreshExecute(Sender: TObject);
begin
  inherited;
  //初始化树
  InitSysDataListTreeView;
  //
  with cdsCloneData do
  begin
    Filtered := False;
    Filter := '1=2';
    Filtered := True;        
  end;
end;

procedure TfrmEasySysDataList.actAddDtlUpdate(Sender: TObject);
begin
  inherited;
  actAddDtl.Enabled := tvDataListMain.Selected <> nil;
end;

procedure TfrmEasySysDataList.actEditDtlUpdate(Sender: TObject);
begin
  inherited;
  actEditDtl.Enabled := cdsCloneData.FieldByName('DataListGUID').AsString <> '';
end;

procedure TfrmEasySysDataList.actDeleteDtlUpdate(Sender: TObject);
begin
  inherited;
  actDeleteDtl.Enabled := cdsCloneData.FieldByName('DataListGUID').AsString <> '';
end;

procedure TfrmEasySysDataList.EasyDBGrid1EditingDone(Sender: TObject);
begin
  inherited;
  cdsCloneData.Edit;
end;

procedure TfrmEasySysDataList.actFindUpdate(Sender: TObject);
begin
  inherited;
  actFind.Enabled := tvDataListMain.Items.Count > 0;
end;

procedure TfrmEasySysDataList.FindTV(tv: TEasyTreeView);
var
  I: Integer;
begin
  for I := FindCurrIndex + 1 to tv.Items.Count - 1 do
  begin
    if Pos(FindText, tv.Items.Item[I].Text) > 0 then
    begin
      tv.Items.Item[I].Selected := True;
      FindCurrIndex := I;
      Break;
    end;  
  end;
  if I = tv.Items.Count - 1 then
    FindCurrIndex := -1;
end;

procedure TfrmEasySysDataList.actFindExecute(Sender: TObject);
begin
  inherited;
  if EasyInputQuery('查询', '内容', FindText) then
    FindTV(tvDataListMain);
end;

procedure TfrmEasySysDataList.tvDataListMainKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if Trim(FindText) <> '' then
      FindTV(tvDataListMain);
  end;  
end;

end.
