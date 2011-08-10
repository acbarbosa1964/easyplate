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
//    报表中心
//主要实现：
//    报表的增加、设计等
//    系统的所有报表均在此管理
//-----------------------------------------------------------------------------}
unit untEasySysConst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, untEasyToolBar, untEasyToolBarStylers,
  DB, ImgList, DBClient, ActnList, Grids, untEasyBaseGrid, untEasyGrid,
  untEasyDBGrid, untEasyClassSysConst, untEasyUtilMethod, untEasyUtilConst;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasySysConst = class(TfrmEasyPlateDBBaseForm)
    actDataList: TActionList;
    actNewMst: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actRedo: TAction;
    actUndo: TAction;
    actFind: TAction;
    actPrint: TAction;
    actExit: TAction;
    actAddDtl: TAction;
    actEditDtl: TAction;
    actDeleteDtl: TAction;
    actCopyDtl: TAction;
    actRedoDtl: TAction;
    actUndoDtl: TAction;
    actSave: TAction;
    actRefresh: TAction;
    cdsSysConstMain: TClientDataSet;
    imgToolBar: TImageList;
    dsSysConstMain: TDataSource;
    edpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton1: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton9: TEasyToolBarButton;
    EasyToolBarButton11: TEasyToolBarButton;
    EasyToolBarButton15: TEasyToolBarButton;
    EasyToolBarButton7: TEasyToolBarButton;
    tbosMain: TEasyToolBarOfficeStyler;
    EasyDBGrid1: TEasyDBGrid;
    EasyToolBarButton4: TEasyToolBarButton;
    procedure FormShow(Sender: TObject);
    procedure actNewMstExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actUndoUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure EasyDBGrid1EditingDone(Sender: TObject);
    procedure cdsSysConstMainAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    procedure InitData;
    function CheckNotNULL: Boolean;
  public
    { Public declarations }
  end;

var
  frmEasySysConst: TfrmEasySysConst;

implementation

{$R *.dfm}

uses
  untEasyDBConnection;

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasySysConst := TfrmEasySysConst.Create(Application);
  if frmEasySysConst.FormStyle <> fsMDIChild then
    frmEasySysConst.FormStyle := fsMDIChild;
  if frmEasySysConst.WindowState <> wsMaximized then
    frmEasySysConst.WindowState := wsMaximized;
  Result := frmEasySysConst;
end;

{ TfrmEasySysConst }

procedure TfrmEasySysConst.InitData;
var
  ASQL: string;
begin
  ASQL := 'SELECT * FROM vw_SysConst';
  cdsSysConstMain.Data := EasyRDMDisp.EasyGetRDMData(ASQL);
end;

procedure TfrmEasySysConst.FormShow(Sender: TObject);
begin
  inherited;
  InitData;
  EasyDBGrid1.Options := EasyDBGrid1.Options - [goEditing];
  EasyDBGrid1.AutoNumberCol(0);
end;

procedure TfrmEasySysConst.actNewMstExecute(Sender: TObject);
begin
  inherited;
  cdsSysConstMain.Last;
  EasyDBGrid1.Options := EasyDBGrid1.Options + [goEditing];
  EasyDBGrid1.Refresh;
  with cdsSysConstMain do
  begin
    Append;
    FieldByName('ConstGUID').AsString := GenerateGUID;
      //2 CName
    FieldByName('CName').AsString := '';
      //3 EName
    FieldByName('EName').AsString := '';
      //4 Value
    FieldByName('Value').AsString := '';
      //5 CreateTime
    FieldByName('CreateTime').AsDateTime := Now;
      //6 Creater
    FieldByName('Creater').AsString := EasyCurrLoginSysUser.UserGUID;
      //7 Updater
    FieldByName('Updater').AsString := EasyCurrLoginSysUser.UserGUID;
      //8 UpdateTime
    FieldByName('UpdateTime').AsDateTime := Now;
    Post;
  end;
  EasyDBGrid1.AutoNumberCol(0);
end;

procedure TfrmEasySysConst.actExitExecute(Sender: TObject);
begin
  inherited;
  if cdsSysConstMain.ChangeCount > 0 then
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

procedure TfrmEasySysConst.actEditExecute(Sender: TObject);
begin
  inherited;
  EasyDBGrid1.Options := EasyDBGrid1.Options + [goEditing];
end;

procedure TfrmEasySysConst.actEditUpdate(Sender: TObject);
begin
  inherited;
  actEdit.Enabled := cdsSysConstMain.RecordCount > 0;
end;

procedure TfrmEasySysConst.actDeleteUpdate(Sender: TObject);
begin
  inherited;
  actDelete.Enabled := cdsSysConstMain.RecordCount > 0;
end;

procedure TfrmEasySysConst.actDeleteExecute(Sender: TObject);
begin
  inherited;
  cdsSysConstMain.Delete;
end;

procedure TfrmEasySysConst.actUndoExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('确定要取消所做的更改吗?', '提示', MB_OKCANCEL + 
    MB_ICONQUESTION) = IDOK then
  begin
    cdsSysConstMain.CancelUpdates;
  end;
end;

procedure TfrmEasySysConst.actRefreshUpdate(Sender: TObject);
begin
  inherited;
  actRefresh.Enabled := cdsSysConstMain.RecordCount > 0;
end;

procedure TfrmEasySysConst.actSaveExecute(Sender: TObject);
var
  AResultOle: OleVariant;
  cdsError  : TClientDataSet;
  AErrorCode: Integer;
begin
  inherited;
  if not CheckNotNULL then Exit;
  AErrorCode := 0;
  if cdsSysConstMain.ChangeCount > 0 then
  begin
    AResultOle := EasyRDMDisp.EasySaveRDMData('SysConst', cdsSysConstMain.Delta,
                                              'ConstGUID', AErrorCode);
    if AErrorCode <> 0 then
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
      if cdsSysConstMain.ChangeCount > 0 then
        cdsSysConstMain.MergeChangeLog;
      Application.MessageBox(EASY_SYS_SAVE_SUCCESS, EASY_SYS_HINT, MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmEasySysConst.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := cdsSysConstMain.ChangeCount > 0;
end;

function TfrmEasySysConst.CheckNotNULL: Boolean;
var
  I: Integer;
  Flag: Boolean;
begin
//  Result := False;
  Flag := False;
  if cdsSysConstMain.State = dsEdit then cdsSysConstMain.Post;
  try
    cdsSysConstMain.DisableControls;
    cdsSysConstMain.First;
    for I := 0 to cdsSysConstMain.RecordCount - 1 do
    begin
      if Trim(cdsSysConstMain.FieldByName('EName').AsString) = '' then
      begin
        Application.MessageBox(PChar('第' + inttostr(I + 1) + '行记录,常量【英文名称】不能为空!'),
                              '提示', MB_OK + MB_ICONINFORMATION);
        Flag := True;
      end else
      if Trim(cdsSysConstMain.FieldByName('Value').AsString) = '' then
      begin
        Application.MessageBox(PChar('第' + inttostr(I + 1) + '行记录,常量【值】不能为空!'),
                              '提示', MB_OK + MB_ICONINFORMATION);
        Flag := True;
      end;
      if Flag then
        Break
      else
        cdsSysConstMain.Next;
    end;
  finally
    cdsSysConstMain.EnableControls;
  end;
  Result := not Flag;
end;

procedure TfrmEasySysConst.actUndoUpdate(Sender: TObject);
begin
  inherited;
  actUndo.Enabled := cdsSysConstMain.ChangeCount > 0;
end;

procedure TfrmEasySysConst.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if cdsSysConstMain.ChangeCount > 0 then
  begin
    case Application.MessageBox('数据已发生改变是否先保存再刷新?', '提示',
      MB_YESNO + MB_ICONQUESTION) of
      IDYES:
        begin
          actSaveExecute(Sender);
        end;
      IDNO:
        begin
          cdsSysConstMain.CancelUpdates;
        end;
    end;
  end;
end;

procedure TfrmEasySysConst.EasyDBGrid1EditingDone(Sender: TObject);
begin
  inherited;
  cdsSysConstMain.Edit;
end;

procedure TfrmEasySysConst.cdsSysConstMainAfterEdit(DataSet: TDataSet);
begin
  inherited;
  with cdsSysConstMain do
  begin
    Edit;
      //7 Updater
    FieldByName('Updater').AsString := EasyCurrLoginSysUser.UserGUID;
      //8 UpdateTime
    FieldByName('UpdateTime').AsDateTime := Now;
    Post;
  end;
end;

end.
