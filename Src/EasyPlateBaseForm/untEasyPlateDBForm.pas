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
//    本单元是工程数据集窗体的基本单元
//
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyPlateDBForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, DB, DBClient, ImgList, untEasyToolBar,
  untEasyToolBarStylers, untReconcileError, ExtCtrls, untEasyGroupBox, DBGrids,
  untEasyPageControl, untEasyDevExt, untEasyDBDevExt, Buttons, Grids, ComCtrls,
  StdCtrls, DBCtrls, dbcgrids, Tabs, cxGrid, cxGridDBTableView, cxGridCustomTableView,
  cxGridTableView;

type
  //浏览 编辑(插入) 无记录 不可用状态
  TEasyDataState = (edsBrowse, edsInsert, edsEdit, edsNoRecord, edsInactive);
  
  TfrmEasyPlateDBForm = class(TfrmEasyPlateDBBaseForm)
    dkpDBForm: TEasyDockPanel;
    tlbDBForm: TEasyToolBar;
    tlbStyDBForm: TEasyToolBarOfficeStyler;
    btnNew: TEasyToolBarButton;
    imgTlbDBForm: TImageList;
    btnEdit: TEasyToolBarButton;
    btnCancel: TEasyToolBarButton;
    btnDelete: TEasyToolBarButton;
    btnCopy: TEasyToolBarButton;
    btnFind: TEasyToolBarButton;
    btnPrint: TEasyToolBarButton;
    btnExit: TEasyToolBarButton;
    btnRefresh: TEasyToolBarButton;
    btnSave: TEasyToolBarButton;
    cdsMain: TClientDataSet;
    pnlContainer: TEasyPanel;
    pgcContainer: TEasyPageControl;
    dsMain: TDataSource;
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cdsMainReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure __ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsMainStateChange(Sender: TObject);
  private
    { Private declarations }
    FMainClientDataSet: TClientDataSet;         //绑定数据的ClientDataSet
    FMainDataSource   : TDataSource;
    FMainGrid         : TcxGrid;
    FMainSQL          : string;                 //窗体初始化时执行的SQL语句
    FDeleteMark: String;                    //删除标志

    FISSaveSuccessMsg     : Boolean;        //当保存成功时是否提示信息
    FISDeleteSuccessMsg   : Boolean;        //当删除时提示信息
    FISBtnNotVisibleHotKey: Boolean;        //按钮在非可视状态下是否接收快捷键
    FISCanHotKey          : Boolean;
    
    FEasyDataState        : TEasyDataState; //数据集状态

    FNotNullFieldList     : TStrings;      //非空和非复制字段列表
    FNotCopyFieldList     : TStrings;
    FNotNullFieldColor    : TColor;        //非空字段颜色
    FDFMList              : TStrings;

    FNotNullControlList   : TList;
    //设置非空字段的颜色的过程
    procedure SetEasyMainClientDataSet(const Value: TClientDataSet);
    function GetEasyMainClientDataSet: TClientDataSet;

    procedure DoShow; override;
    //加载模块的配置界面所需要的函数
    procedure BindRoot(Form: TComponent; AFileName: string);
    procedure ReadError(Reader: TReader; const Message: string; var Handled: Boolean);
    function GetMainDataSource: TDataSource;
    procedure SetMainDataSource(const Value: TDataSource);
    function GetMainGrid: TcxGrid;
    procedure SetMainGrid(const Value: TcxGrid);
  protected
    { protected declarations }
    //改变按钮输入状态的过程
    procedure SetAllControlStatus; virtual;
    //当数据集无记录时
    procedure SetBtnStatus_NoRecord; virtual;
    procedure SetSQL(AValue: string);
    procedure DoSetSQL(const Value: string); virtual;
    procedure DoSave(sender : TObject);

    function Append: Boolean; virtual;
    function Edit: Boolean; virtual;
    function Save: Boolean; virtual;
    function Cancel: Boolean; virtual;
    function Copy: Boolean; virtual;
    function Print: Boolean;virtual;

    //Save
    function BeforeSave(DataSet: TDataSet): Boolean; virtual;
    function AfterSave(DataSet: TDataSet): Boolean; virtual;
    function SaveError(DataSet: TDataSet): Boolean; virtual;

    // 删除数据的过程，含状态控制 ，包含Delete
    function DeleteClick(DataSet: TDataSet):Boolean;virtual;
    // 删除数据的过程，不含状态控制
    function Delete(AClientDataSet: TClientDataSet; ShowHint: Boolean): Boolean; virtual;
    function BeforeDelete(DataSet: TDataSet): Boolean; virtual;
    function ExecuteDelete(AClientDataSet: TClientDataSet): Boolean; virtual;
    function AfterDelete(DataSet: TDataSet): Boolean; virtual;
    function SetDeleteMark(AClientDataSet: TClientDataSet): Boolean; virtual;
    function GetMainClientDataSet: TClientDataSet;
    procedure SetClientDataSet(const Value: TClientDataSet);
    function GetMainSQL: string;
    procedure SetMainSQL(const Value: string);
    function GetNotNullFieldColor: TColor;
    procedure SetNullFieldColor(const Value: TColor);
    function GetMainDeleteMark: string;
    procedure SetMainDeleteMark(const Value: string);
    //复制操作相关
    function BuildCopyList(AClientDataSet: TClientDataSet; ANotCopyFieldList: TStrings): TStrings;
    procedure CopyDataFromList(AClientDataSet: TClientDataSet; ACopyFieldList: TStrings);
    function GetEasyDataState: TEasyDataState;
    procedure SetEasyDataState(const Value: TEasyDataState);
    procedure SetNotNullFieldColor(const Value: TColor);
    //设置非空字段的控件颜色
    procedure SetNotNullFieldsControlColor; virtual;
    //保存之前检查必填字段是否有空
    function CheckNotNullFields: Boolean; virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    //非空和非复制字段处理
    procedure AddNotNullField(FieldName: string);
    procedure AddNotNullFields(FieldList: array of string);
    procedure AddNotCopyField(FieldName: string);
    procedure AddNotCopyFields(FieldList: array of string);
    procedure AddDFMFile(FieldName: string);
    procedure AddDFMFiles(FieldList: array of string);
    //加载配置DFM文件
    procedure LoadEasyDFM(DFMFile: string);
    //非空字段的颜色
    property NotNullFieldColor: TColor read GetNotNullFieldColor write SetNotNullFieldColor default clBlue;
    //必须指定EasyMainClientDataSet
    property EasyMainClientDataSet: TClientDataSet read GetEasyMainClientDataSet
                                    write SetEasyMainClientDataSet;
    //操作提示
    property ISSaveSuccessMsg : Boolean read FISSaveSuccessMsg write FISSaveSuccessMsg;
    property ISDeleteSuccessMsg : Boolean read FISDeleteSuccessMsg write FISDeleteSuccessMsg;
    property ISBtnNotVisibleHotKey : Boolean read FISBtnNotVisibleHotKey write FISBtnNotVisibleHotKey;
    property ISCanHotKey : Boolean read FISCanHotKey write FISCanHotKey;
    //数据删除标志
    property MainDeleteMark: string read GetMainDeleteMark write SetMainDeleteMark;
    property EasyDataState: TEasyDataState read GetEasyDataState write SetEasyDataState;
    //初始化数据集信息
    property MainClientDataSet: TClientDataSet read GetMainClientDataSet write SetClientDataSet;
    property MainDataSource: TDataSource read GetMainDataSource write SetMainDataSource;
    property MainGrid: TcxGrid read GetMainGrid write SetMainGrid;
    property MainSQL: string read GetMainSQL write SetMainSQL;
  end;

var
  frmEasyPlateDBForm: TfrmEasyPlateDBForm;

implementation

{$R *.dfm}

uses
   untEasyUtilMethod, untEasyDBConnection, untEasyBaseConst, cxDBEdit, TypInfo,
   untEasyIODFM, untEasyStdCmpsReg;

{ TfrmEasyPlateDBForm }

procedure TfrmEasyPlateDBForm.AddNotCopyField(FieldName: string);
begin
  if not Assigned(FNotCopyFieldList) then
    FNotCopyFieldList := TStringList.Create;
  if FNotCopyFieldList.IndexOf(UpperCase(FieldName)) < 0 then
    FNotCopyFieldList.Add(UpperCase(FieldName));
end;

procedure TfrmEasyPlateDBForm.AddNotCopyFields(FieldList: array of string);
var
  I: Integer;
begin
  for I := Low(FieldList) to High(FieldList) do
    AddNotCopyField(FieldList[I]);
end;

procedure TfrmEasyPlateDBForm.AddNotNullField(FieldName: string);
begin
  if not Assigned(FNotNullFieldList) then
    FNotNullFieldList := TStringList.Create;
  if FNotNullFieldList.IndexOf(FieldName) < 0 then
    FNotNullFieldList.Add(FieldName);
end;

procedure TfrmEasyPlateDBForm.AddNotNullFields(FieldList: array of string);
var
  I: Integer;
begin
  for I := Low(FieldList) to High(FieldList) do
    AddNotNullField(FieldList[I]);
end;

function TfrmEasyPlateDBForm.AfterDelete(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.AfterSave(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.Append: Boolean;
begin
  Result := False;
  MainClientDataSet.ReadOnly := False;
  if Assigned(MainClientDataSet) then
  begin
    MainClientDataSet.Append;
    //添加时间
    //用户权限控制
    Result := True;
  end;  
end;

function TfrmEasyPlateDBForm.BeforeDelete(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.BeforeSave(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.Cancel: Boolean;
begin
  Result := False;
  if Assigned(MainClientDataSet) then
  begin
    MainClientDataSet.CancelUpdates;
    Result := True;
  end;
end;

function TfrmEasyPlateDBForm.Copy: Boolean;
var
  CopyList    : TStrings;
  bCanContinue: Boolean;
begin
  Result := False;
  if Assigned(MainClientDataSet) then
  begin
    bCanContinue := True;
    if not GetUserRight then
    begin
      bCanContinue := False;
      EasyErrorHint(EasyErrorHint_NRight);
    end;
    if bCanContinue then
    begin
      CopyList := TStringList.Create;
      if not Assigned(FNotCopyFieldList) then
        FNotCopyFieldList := TStringList.Create;
      //获取此表的主键字段和不可复制字段
//      if FNotCopyFieldList.Count <= 0 then
//        FNotCopyFieldList.AddStrings(GetUniqueKeys(GetTableName(FClientDataSet), Self.Connection, [ikPrimary, ikUnique]));

      try
        CopyList := BuildCopyList(MainClientDataSet, FNotCopyFieldList);
        if Append then
        begin
          CopyDataFromList(MainClientDataSet, CopyList);
          Result := True;
        end;
      finally
        CopyList.Free;
      end; 
    end;
  end;
end;

constructor TfrmEasyPlateDBForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEasyDataState := edsInactive;

  if not Assigned(FNotNullFieldList) then
    FNotNullFieldList := TStringList.Create;
  if not Assigned(FNotCopyFieldList) then
    FNotCopyFieldList := TStringList.Create;
  if not Assigned(FDFMList) then
    FDFMList := TStringList.Create;
  //打开数据集
  if MainSQL <> '' then
  begin
    if DMEasyDBConnection.EasyAppType = 'CAS' then
    begin
      if MainClientDataSet <> nil then
      begin
        if EasyRDMDisp = nil then
          EasyErrorHint(EasyErrorHint_RDMDispNIL)
        else
        begin
          MainClientDataSet.Data := EasyRDMDisp.EasyGetRDMData(MainSQL);
          if MainClientDataSet.RecordCount > 0 then
            EasyDataState := edsBrowse
          else
            SetBtnStatus_NoRecord;
        end;
      end;
    end;
  end;  
end;

function TfrmEasyPlateDBForm.Delete(AClientDataSet: TClientDataSet;
  ShowHint: Boolean): Boolean;
var
  bCanContinue : Boolean;
begin
  Result := False;
  bCanContinue := True;
  //判断当前用户的操作权限
  if not GetUserRight then
  begin
    bCanContinue := False;
    EasyErrorHint(EasyErrorHint_NRight);
    Exit;
  end
  else
  begin
    if bCanContinue then
    begin
      if BeforeDelete(AClientDataSet) then
      begin
        //如果执行成功提示 和 显示信息
        if ISDeleteSuccessMsg and ShowHint then
        begin
          if MessageDlg(EasyHint_ConfirmDelete, mtWarning, [mbYes, mbNo], 0) = mrYes then
          begin
            if Trim(MainDeleteMark) <> '' then
              Result := SetDeleteMark(MainClientDataSet)
            else
              Result := ExecuteDelete(MainClientDataSet);
          end;
        end
        else
        begin
          if Trim(MainDeleteMark) <> '' then
            Result := SetDeleteMark(MainClientDataSet)
          else
            Result := ExecuteDelete(MainClientDataSet);
        end;
      end;
    end;
  end;
  if Result then
    AfterDelete(MainClientDataSet);
end;

function TfrmEasyPlateDBForm.DeleteClick(DataSet: TDataSet): Boolean;
begin
  Result := False;
  if Delete(MainClientDataSet, True) then
  begin
    if MainClientDataSet.RecordCount > 0 then
      EasyDataState := edsBrowse
    else
      SetBtnStatus_NoRecord;
    Result := True;
  end;
end;

destructor TfrmEasyPlateDBForm.Destroy;
begin
  if Assigned(FNotNullFieldList) then
    FNotNullFieldList.Free;
  if Assigned(FNotCopyFieldList) then
    FNotCopyFieldList.Free;
  if Assigned(MainClientDataSet) then
    MainClientDataSet.Free;
  if Assigned(FDFMList) then
    FDFMList.Free;
  inherited Destroy;
end;

procedure TfrmEasyPlateDBForm.DoSave(sender: TObject);
begin
  Self.Save;
end;

procedure TfrmEasyPlateDBForm.DoSetSQL(const Value: string);
begin

end;

procedure TfrmEasyPlateDBForm.DoShow;
begin
  inherited;
  SetNotNullFieldsControlColor;
end;

function TfrmEasyPlateDBForm.Edit: Boolean;
var
  bCanContinues : Boolean;
begin
  Result := False;
  //检查是否指定数据集
  if Assigned(MainClientDataSet) then
  begin
    if not MainClientDataSet.Active then
      MainClientDataSet.Open;
    bCanContinues := True;
    //检查用户权限
    if not GetUserRight then
    begin
      bCanContinues := false;
      EasyErrorHint(EasyErrorHint_NRight);
    end;
    //有用户权限 进入Edit
    if bCanContinues then
    begin
      MainClientDataSet.Edit;
      Result := True;
    end
    else
      EasyErrorHint(EasyEditHint_Edit);
  end;
end;

function TfrmEasyPlateDBForm.ExecuteDelete(
  AClientDataSet: TClientDataSet): Boolean;
begin
  Result := True;
end;

function TfrmEasyPlateDBForm.GetEasyMainClientDataSet: TClientDataSet;
begin
  Result := FMainClientDataSet;
end;

function TfrmEasyPlateDBForm.Print: Boolean;
begin
  Result := True;
  if Assigned(MainClientDataSet) then
  begin
    if not MainClientDataSet.Active then
      MainClientDataSet.Open;
    if not GetUserRight then
    begin
      EasyErrorHint(EasyErrorHint_NRight);
      Result := False
    end
    else
      Result := True;
  end;
end;

function TfrmEasyPlateDBForm.Save: Boolean;
begin
  Result := False;
  //在保存之前检查是否还NOT NULL字段未填，是否指定数据集
  if not CheckNotNullFields and Assigned(MainClientDataSet) then
  begin
  {  if DMEasyDBConnection.EasyNetType = 'CS' then
    begin
      Screen.Cursor := crHourGlass;
      try
        //如果数据连接处于事务中则回滚，再开始新的事务处理
        if DMEasyDBConnection.EasyADOConn.InTransaction then
          DMEasyDBConnection.EasyADOConn.RollbackTrans;
        DMEasyDBConnection.EasyADOConn.BeginTrans;
        //如果ClientDataSet存在异常则回滚退出
        if not BeforeSave(MainClientDataSet) then
        begin
          DMEasyDBConnection.EasyADOConn.RollbackTrans;
          Screen.Cursor := crDefault;
          Exit;
        end;
        try
          //根据ClientDataState状态执行相应操作
//          if Assigned(FHhfRelateUpdates.Provider) then
//          begin
//            if HhfDataState = dsInsert then
//              FHhfRelateUpdates.RunUpdate(ukInsert, FClientDataSet)
//            else
//              FHhfRelateUpdates.RunUpdate(ukModify, FClientDataSet);
//          end
//          else
//          begin
//            FClientDataSet.ApplyUpdates(-1);
//          end;
          DMEasyDBConnection.EasyADOConn.CommitTrans;
          //是否提示Hint信息
          if ISSaveSuccessMsg then
            EasyHint(EasySaveHint_Success);
        except
            on E:Exception do
            begin
              DMEasyDBConnection.EasyADOConn.RollbackTrans;
              ShowMessage(EasySaveHint_Error + E.Message);
            end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    if DMEasyDBConnection.EasyNetType = 'CAS' then
    begin
      try
//      EasyRDMDisp.EasySaveRDMDatas();
      finally
      end;
    end;   }
  end;
end;

function TfrmEasyPlateDBForm.SaveError(DataSet: TDataSet): Boolean;
begin
  Result := True;
end;

procedure TfrmEasyPlateDBForm.SetAllControlStatus;
  //设置Grid的编辑状态
  {procedure SetDBTableViewState(AState: Boolean);
  var
    I: Integer;
  begin
    if MainGrid <> nil then
    begin
      for I := 0 to MainGrid.ViewCount - 1 do
      begin
        if MainGrid.Views[I] is TcxGridDBTableView then
        begin
//          ShowMessage(TcxGridDBTableView(MainGrid.Views[I]).Name);
          TcxGridDBTableView(MainGrid.Views[I]).OptionsData.Editing := AState;
        end;
      end;
    end;
  end;   }
  //编辑状态
  procedure SetEditButtons;
  begin
    btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnCancel.Enabled := True;
    btnSave.Enabled := True;
    btnCopy.Enabled := False;
    btnFind.Enabled := False;
    btnPrint.Enabled := False;

//    SetDBTableViewState(True);
    //新增操作之前设置
//    MainClientDataSet.ReadOnly := false;
  end;

  procedure SetBrowseButtons;
  begin
    btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := True;
    btnFind.Enabled := True;
    btnPrint.Enabled := True;

//    SetDBTableViewState(False);
    MainClientDataSet.ReadOnly := True;
  end;

  procedure SetInactiveButtons;
  begin
    btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := False;
    btnFind.Enabled := True;
    btnPrint.Enabled := False;

//    SetDBTableViewState(False);
    MainClientDataSet.ReadOnly := True;
  end;

  procedure SetNoRecordButtons;
  begin
    btnNew.Enabled := True;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := False;
    btnFind.Enabled := True;
    btnPrint.Enabled := False;

//    SetDBTableViewState(False);
    MainClientDataSet.ReadOnly := True;
  end;

  procedure SetUserModuleButtonAuth;
  var
    iAuth: string;
  begin
    iAuth := getUserModuleRight(FormId, DMEasyDBConnection.EasyCurrLoginUserID);
    if iAuth[1] = '1' then
      btnNew.Enabled := True
    else
      btnNew.Enabled := False;   
    if iAuth[2] = '1' then
      btnEdit.Enabled := True
    else
      btnEdit.Enabled := False;
    if iAuth[3] = '1' then
      btnDelete.Enabled := True
    else
      btnDelete.Enabled := False;
    if iAuth[4] = '1' then
      btnCopy.Enabled := True
    else
      btnCopy.Enabled := False;
    if iAuth[5] = '1' then
      btnFind.Enabled := True
    else
      btnFind.Enabled := False;
    if iAuth[6] = '1' then
      btnPrint.Enabled := True
    else
      btnPrint.Enabled := False;
  end;
begin
  case EasyDataState of
    edsEdit, edsInsert:
      begin
        SetEditButtons;
      end;
    edsBrowse:
      begin
        SetBrowseButtons;
      end;
    edsInactive:
      begin
        SetInactiveButtons;
      end;
    edsNoRecord:
      begin
        SetNoRecordButtons;
      end;  
  end;
//  SetUserModuleButtonAuth;
end;

procedure TfrmEasyPlateDBForm.SetBtnStatus_NoRecord;
begin
  if MainClientDataSet.RecordCount = 0 then
  begin
    btnNew.Enabled := True;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnSave.Enabled := False;
    btnCopy.Enabled := False;
    btnFind.Enabled := False;
  end;
end;

function TfrmEasyPlateDBForm.SetDeleteMark(
  AClientDataSet: TClientDataSet): Boolean;
begin
 { try
 //   SetHhfDeleteMark(AClientDataSet,DeleteMark);
    FHhfRelateUpdates.RunUpdate(ukModify, AClientDataSet);
//    SetCttRefreshDeleteMark(AClientDataSet);
    Result := True;
  except
    on E:Exception do
    begin
      SysErrorBox(NDeleteMark);
      Result := False;
    end;
  end; }
end;

procedure TfrmEasyPlateDBForm.SetEasyDataState(const Value: TEasyDataState);
begin
  FEasyDataState := Value;
  //重置按钮状态
  SetAllControlStatus;
end;

procedure TfrmEasyPlateDBForm.SetEasyMainClientDataSet(
  const Value: TClientDataSet);
begin
  FMainClientDataSet := Value;
end;

procedure TfrmEasyPlateDBForm.btnExitClick(Sender: TObject);
begin
  inherited;
  if MainClientDataSet.ChangeCount > 0 then
  begin
//    if 
  end;
//
  Close;
end;

procedure TfrmEasyPlateDBForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEasyPlateDBForm.FormCreate(Sender: TObject);
begin
  inherited;
  FISSaveSuccessMsg := True;
  FISDeleteSuccessMsg := True;
  FISBtnNotVisibleHotKey:=False;
  FISCanHotKey:=True;
  //KeyPreview
  IsKeyPreView := True;
  FMainClientDataSet := cdsMain;
  FMainDataSource := dsMain;
  //非空字段颜色默认为蓝色 clBlue
  FNotNullFieldColor := clBlue;
  FNotNullControlList := TList.Create;
end;

procedure TfrmEasyPlateDBForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  function GetState(Value : TEasyToolBarButton): Boolean;
  begin
    Result :=  Value.Enabled ;
    if not FISBtnNotVisibleHotKey then
      Result:=(Result and Value.Visible);
  end;
begin
  inherited;
  if FISCanHotKey then
  case Key of
    112: if GetState(btnNew)  then btnNewClick(Sender);
    113: if GetState(btnEdit) then btnEditClick(Sender);
    114: if GetState(btnDelete) then btnDeleteClick(Sender);
    115: if GetState(btnSave) then DoSave(Sender);
    116: if GetState(btnCancel) then btnCancelClick(Sender);
    117: if GetState(btnCopy) then btnCopyClick(Sender);
    118: if GetState(btnFind) then btnFindClick(Sender);
    119: if GetState(btnPrint) then btnPrintClick(Sender);
    120: if GetState(btnExit) then btnExitClick(Sender);
  end;
end;

procedure TfrmEasyPlateDBForm.btnNewClick(Sender: TObject);
begin
  inherited;
  if Append then
    EasyDataState := edsInsert;
end;

procedure TfrmEasyPlateDBForm.btnEditClick(Sender: TObject);
begin
  inherited;
  if Edit then
    EasyDataState := edsEdit;
end;

procedure TfrmEasyPlateDBForm.btnDeleteClick(Sender: TObject);
begin
  inherited;
  DeleteClick(MainClientDataSet);
end;

procedure TfrmEasyPlateDBForm.btnCancelClick(Sender: TObject);
begin
  inherited;
  if Cancel then
  begin
    if MainClientDataSet.RecordCount > 0 then
      EasyDataState := edsBrowse
    else
      EasyDataState := edsNoRecord;
  end; 
end;

procedure TfrmEasyPlateDBForm.btnCopyClick(Sender: TObject);
begin
  inherited;
  if Copy then
    EasyDataState := edsInsert;
end;

procedure TfrmEasyPlateDBForm.btnSaveClick(Sender: TObject);
begin
  inherited;
  DoSave(Sender);
end;

procedure TfrmEasyPlateDBForm.btnRefreshClick(Sender: TObject);
begin
  inherited;
  if EasyDataState in [edsInsert, edsEdit] then
  begin
    if MessageDlg(EasyRefreshHint_Save, mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      if Save then
        EasyDataState := edsBrowse;
    end;
  end;
end;

procedure TfrmEasyPlateDBForm.btnFindClick(Sender: TObject);
begin
  inherited;
  if EasyDataState in [edsInsert, edsEdit] then
  begin
    if MessageDlg(EasyFindHint_Save, mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      if Save then
        EasyDataState := edsBrowse;
    end;
  end;
end;

procedure TfrmEasyPlateDBForm.btnPrintClick(Sender: TObject);
begin
  inherited;
  if not Print then
    Exit;
end;

function TfrmEasyPlateDBForm.GetMainClientDataSet: TClientDataSet;
begin
  Result := FMainClientDataSet;
end;

procedure TfrmEasyPlateDBForm.SetClientDataSet(
  const Value: TClientDataSet);
begin
  FMainClientDataSet := Value;
end;

function TfrmEasyPlateDBForm.GetMainSQL: string;
begin
  Result := FMainSQL;
end;

procedure TfrmEasyPlateDBForm.SetMainSQL(const Value: string);
begin
  FMainSQL := Value;
end;

function TfrmEasyPlateDBForm.GetNotNullFieldColor: TColor;
begin
  Result := FNotNullFieldColor;
end;

procedure TfrmEasyPlateDBForm.SetNullFieldColor(const Value: TColor);
begin
  FNotNullFieldColor := Value;
end;

function TfrmEasyPlateDBForm.GetMainDeleteMark: string;
begin
  Result := FDeleteMark;
end;

procedure TfrmEasyPlateDBForm.SetMainDeleteMark(const Value: string);
begin
  FDeleteMark := Value;
end;

procedure TfrmEasyPlateDBForm.cdsMainReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  __ReconcileError(DataSet, E, UpdateKind, Action);
end;

procedure TfrmEasyPlateDBForm.__ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E);
end;

function TfrmEasyPlateDBForm.BuildCopyList(AClientDataSet: TClientDataSet;
  ANotCopyFieldList: TStrings): TStrings;
begin

end;

procedure TfrmEasyPlateDBForm.CopyDataFromList(
  AClientDataSet: TClientDataSet; ACopyFieldList: TStrings);
begin

end;

function TfrmEasyPlateDBForm.GetEasyDataState: TEasyDataState;
begin
  Result := FEasyDataState;
end;

procedure TfrmEasyPlateDBForm.SetNotNullFieldColor(const Value: TColor);
begin
  FNotNullFieldColor := Value;
end;

function TfrmEasyPlateDBForm.CheckNotNullFields: Boolean;
var
  I, J: Integer;
  TmpComponent: TControl;
  ACaption: string;
begin
  Result := False;
  for I := 0 to FNotNullFieldList.Count - 1 do
  begin
    for J := 0 to pnlContainer.ControlCount - 1 do
    begin
      TmpComponent := pnlContainer.Controls[J];
      if GetDBDataBinding(TmpComponent, ACaption) = FNotNullFieldList[I] then
      begin
        if VarToStrDef(GetDBDataBindingDataSet(TmpComponent).FieldByName(FNotNullFieldList[I]).Value,
                        '') = '' then
        begin
          Result := True;
          EasyHint('【' + ACaption +'】' + EasyNotNullField_Hint);
          Break;
        end;  
      end;  
    end;  
  end;  
end;

procedure TfrmEasyPlateDBForm.SetSQL(AValue: string);
begin

end;

procedure TfrmEasyPlateDBForm.SetNotNullFieldsControlColor;
var
  I, J        : Integer;
  TmpComponent: TComponent;
  ACaption    : string;
begin
  if FDFMList.Count = 0 then Exit;
  if FDFMList.Count <= 1 then
  begin
    //1 为EasyPageControl 2 为后附加的窗体
    if pnlContainer.ControlCount = 2 then
    begin
      for I := 0 to TForm(pnlContainer.Controls[1]).ComponentCount - 1 do
      begin
        TmpComponent := TForm(pnlContainer.Controls[1]).Components[I];
        //绑定数据源
        if MainDataSource <> nil then
          SetEditDataSource(TmpComponent, MainDataSource);
        //设置非空字段颜色
        if FNotNullFieldList.IndexOf(GetDBDataBinding(TmpComponent, ACaption)) <> -1 then
          SetEditLabelColor(TmpComponent, NotNullFieldColor);
      end;
    end;
  end
  else
  begin
    if pgcContainer.PageCount > 0 then
      pgcContainer.ActivePageIndex := 0;
    for I := 0 to pgcContainer.PageCount - 1 do
    begin
      if pgcContainer.ActivePage.ControlCount = 1 then
      begin
        for J := 0 to TForm(pgcContainer.Pages[I].Controls[0]).ComponentCount - 1 do
        begin
          TmpComponent := TForm(pgcContainer.Pages[I].Controls[0]).Components[J];
          //绑定数据源
          if MainDataSource <> nil then
            SetEditDataSource(TmpComponent, MainDataSource);
          //设置非空字段颜色
          if FNotNullFieldList.IndexOf(GetDBDataBinding(TmpComponent, ACaption)) <> -1 then
            SetEditLabelColor(TmpComponent, NotNullFieldColor);
        end;
      end;
      pgcContainer.ActivePageIndex := pgcContainer.ActivePageIndex + 1;
    end;  
    if pgcContainer.PageCount > 0 then
      pgcContainer.ActivePageIndex := 0;
  end;    
end;

procedure TfrmEasyPlateDBForm.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := FNotNullControlList.Count - 1 downto 0 do
    TObject(FNotNullControlList[I]).Free;
  if pgcContainer.Visible then
  begin
    while pgcContainer.PageCount > 0 do
      FreeComponent_Child(pgcContainer.Pages[0]);
  end
  else
    FreeComponent_NoChild(pnlContainer);
  inherited;
end;

procedure TfrmEasyPlateDBForm.BindRoot(Form: TComponent;
  AFileName: string);
var
  Page: TEasyTabSheet;
begin
  if FDFMList.Count <= 1 then
  begin
    if Form is TForm then // 只有Form窗体才能挂靠
    begin
      with TForm(Form) do
      begin
        Parent := pnlContainer;
        BorderStyle := bsNone;
        Align := alClient;
        Show;
      end;
    end;
  end
  else
  begin
    if Form is TForm then // 只有Form窗体才能挂靠
    begin
      Page := TEasyTabSheet.Create(Self);
      Page.Caption := TForm(Form).Caption;
      Page.PageControl := pgcContainer;

      with TForm(Form) do
      begin
        Parent := Page;
        BorderStyle := bsNone;
        Align := alClient;
        Show;
      end;
      pgcContainer.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfrmEasyPlateDBForm.LoadEasyDFM(DFMFile: string);
var
  fm: TForm;
begin
  if FDFMList.Count = 0 then Exit;
  if FDFMList.Count = 1 then
    pgcContainer.Visible := False;
  fm := TForm.Create(nil);
  try
    EasyReadForm(fm, DFMFile);
  except on e: Exception do
    begin
      EasyErrorHint(e.Message);
      fm.Free;
    end;
  end;
  BindRoot(fm, DFMFile);
end;

procedure TfrmEasyPlateDBForm.ReadError(Reader: TReader;
  const Message: string; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TfrmEasyPlateDBForm.AddDFMFile(FieldName: string);
begin
  if not Assigned(FDFMList) then
    FDFMList := TStringList.Create;
  if FDFMList.IndexOf(FieldName) = -1 then
    FDFMList.Add(FieldName);
end;

procedure TfrmEasyPlateDBForm.AddDFMFiles(FieldList: array of string);
var
  I: Integer;
begin
  for I := Low(FieldList) to High(FieldList) do
    AddDFMFile(FieldList[I]);
end;

procedure TfrmEasyPlateDBForm.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not DirectoryExists(EasyPlugPath + 'dfm') then
  begin
    try
      CreateDir(EasyPlugPath + 'dfm');
    except on e:Exception do
      EasyErrorHint(EasyErrorHint_DirCreate + e.Message);
    end;
  end;
  for I := 0 to FDFMList.Count - 1 do
  begin
    if FileExists(EasyPlugPath + 'dfm\' + FDFMList.Strings[I]) then
      LoadEasyDFM(EasyPlugPath + 'dfm\' + FDFMList.Strings[I])
    else
      EasyErrorHint(FDFMList.Strings[I] + EasyErrorHint_NotFile);
  end;
end;

function TfrmEasyPlateDBForm.GetMainDataSource: TDataSource;
begin
  Result := FMainDataSource;
end;

procedure TfrmEasyPlateDBForm.SetMainDataSource(const Value: TDataSource);
begin
  FMainDataSource := Value;
end;

function TfrmEasyPlateDBForm.GetMainGrid: TcxGrid;
begin
  Result := FMainGrid;
end;

procedure TfrmEasyPlateDBForm.SetMainGrid(const Value: TcxGrid);
begin
  FMainGrid := Value;
end;

procedure TfrmEasyPlateDBForm.dsMainStateChange(Sender: TObject);
begin
  inherited;
  case dsMain.State of
    dsEdit:
      EasyDataState := edsEdit;
    dsInsert:
      EasyDataState := edsInsert;
    dsInactive:
      EasyDataState := edsInactive;
    dsBrowse:
      begin
        if cdsMain.RecordCount <= 0 then
          EasyDataState := edsInactive
        else
          EasyDataState := edsBrowse;
      end;  
  end;
end;

end.
