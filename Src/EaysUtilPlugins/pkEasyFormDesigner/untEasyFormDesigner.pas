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
//------------------------------------------------------------------------------}
unit untEasyFormDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, untEasyPageControl, untEasyMenus, untEasyMenuStylers,
  untEasyToolBar, untEasyToolBarStylers, untEasyStatusBar, untFrmDsnEdit,
  untEasyStatusBarStylers, Menus, eddPaletteFrame, eddObjInspFrm,
  eddObjTreeFrame, edActns, ActnList, ImgList, ed_DsnBase, ed_Designer,
  ed_dsncont, untEasyPlateDBBaseForm;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
  
type
  TfrmEasyFormDesigner = class(TfrmEasyPlateDBBaseForm)
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    pgcLeft: TEasyPageControl;
    pgcRight: TEasyPageControl;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    tbsToolBox: TEasyTabSheet;
    tbsObjectTree: TEasyTabSheet;
    EasyMainMenu1: TEasyMainMenu;
    F1: TMenuItem;
    tbsInspector: TEasyTabSheet;
    ObjectTreeFrame1: TObjectTreeFrame;
    PaletteFrame1: TPaletteFrame;
    ObjectInspectorFrame1: TObjectInspectorFrame;
    ImageList1: TImageList;
    SD: TSaveDialog;
    OD: TOpenDialog;
    ActionList1: TActionList;
    FileNew: TAction;
    dsnAlignToGrid1: TdsnAlignToGrid;
    dsnBringToFront1: TdsnBringToFront;
    dsnSendToBack1: TdsnSendToBack;
    dsnAlignmentDlg1: TdsnAlignmentDlg;
    dsnSizeDlg1: TdsnSizeDlg;
    dsnScale1: TdsnScale;
    dsnTabOrderDlg1: TdsnTabOrderDlg;
    dsnCreationOrderDlg1: TdsnCreationOrderDlg;
    dsnFlipChildrenAll1: TdsnFlipChildrenAll;
    dsnFlipChildren1: TdsnFlipChildren;
    dsnCopy1: TdsnCopy;
    dsnCut1: TdsnCut;
    dsnDelete1: TdsnDelete;
    dsnPaste1: TdsnPaste;
    dsnLockControls1: TdsnLockControls;
    dsnSelectAll1: TdsnSelectAll;
    FileOpen: TAction;
    FileSave: TAction;
    FileExit: TAction;
    FileMerge: TAction;
    DesignMode: TAction;
    FileClose: TAction;
    FileCloseAll: TAction;
    actBDSStyle: TAction;
    actReadOnly: TAction;
    dsnUndo1: TdsnUndo;
    dsnRedo1: TdsnRedo;
    dsnTextEditMode1: TdsnTextEditMode;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    Copy2: TMenuItem;
    Cut2: TMenuItem;
    Paste2: TMenuItem;
    New1: TMenuItem;
    EasyToolBarButton1: TEasyToolBarButton;
    Open1: TMenuItem;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    Save1: TMenuItem;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    N1: TMenuItem;
    Mergewithcurrent1: TMenuItem;
    Close1: TMenuItem;
    CloseAll1: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    EasyToolBarButton4: TEasyToolBarButton;
    pgcCenter: TEasyPageControl;
    E1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N4: TMenuItem;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton5: TEasyToolBarButton;
    EasyToolBarButton6: TEasyToolBarButton;
    EasyToolBarButton7: TEasyToolBarButton;
    EasyToolBarButton8: TEasyToolBarButton;
    EasyToolBarSeparator3: TEasyToolBarSeparator;
    EasyToolBarButton9: TEasyToolBarButton;
    EasyToolBarButton10: TEasyToolBarButton;
    EasyToolBarSeparator4: TEasyToolBarSeparator;
    EasyToolBarButton11: TEasyToolBarButton;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N5: TMenuItem;
    SelectAll1: TMenuItem;
    D1: TMenuItem;
    EasyToolBar2: TEasyToolBar;
    EasyToolBarButton12: TEasyToolBarButton;
    EasyToolBarButton13: TEasyToolBarButton;
    EasyToolBarButton14: TEasyToolBarButton;
    Aligntogrid1: TMenuItem;
    Bringtofront1: TMenuItem;
    Sendtoback1: TMenuItem;
    Align1: TMenuItem;
    Size1: TMenuItem;
    Scale1: TMenuItem;
    EasyToolBarSeparator5: TEasyToolBarSeparator;
    EasyToolBarSeparator6: TEasyToolBarSeparator;
    EasyToolBarButton15: TEasyToolBarButton;
    EasyToolBarButton16: TEasyToolBarButton;
    EasyToolBarButton17: TEasyToolBarButton;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    aborder1: TMenuItem;
    CreationOrder1: TMenuItem;
    N9: TMenuItem;
    EasyToolBarSeparator7: TEasyToolBarSeparator;
    EasyToolBarButton18: TEasyToolBarButton;
    EasyToolBarButton19: TEasyToolBarButton;
    FlipChildren1: TMenuItem;
    Flipallchildren1: TMenuItem;
    Flipchildren2: TMenuItem;
    LockControls1: TMenuItem;
    N10: TMenuItem;
    ReadOnly1: TMenuItem;
    EditText1: TMenuItem;
    EasyToolBarSeparator8: TEasyToolBarSeparator;
    EasyToolBarButton20: TEasyToolBarButton;
    T1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    BDSStyle1: TMenuItem;
    EasyToolBarButton21: TEasyToolBarButton;
    dsnSaveAs: TAction;
    N13: TMenuItem;
    V1: TMenuItem;
    N14: TMenuItem;
    actRightPageControl: TAction;
    actLeftPageControl: TAction;
    N15: TMenuItem;
    N16: TMenuItem;
    EasyToolBar3: TEasyToolBar;
    EasyToolBarButton22: TEasyToolBarButton;
    procedure FileNewExecute(Sender: TObject);
    procedure FileCloseExecute(Sender: TObject);
    procedure FileOpenExecute(Sender: TObject);
    procedure FileSaveExecute(Sender: TObject);
    procedure FileCloseAllExecute(Sender: TObject);
    procedure FileMergeExecute(Sender: TObject);
    procedure DesignModeExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FileCloseUpdate(Sender: TObject);
    procedure FileSaveUpdate(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure pgcCenterDblClick(Sender: TObject);
    procedure actBDSStyleExecute(Sender: TObject);
    procedure actBDSStyleUpdate(Sender: TObject);
    procedure dsnLockControls1Update(Sender: TObject);
    procedure dsnSaveAsExecute(Sender: TObject);
    procedure dsnSaveAsUpdate(Sender: TObject);
    procedure FileExitExecute(Sender: TObject);
    procedure actRightPageControlExecute(Sender: TObject);
    procedure actRightPageControlUpdate(Sender: TObject);
    procedure actLeftPageControlExecute(Sender: TObject);
    procedure actLeftPageControlUpdate(Sender: TObject);
    procedure pgcCenterChange(Sender: TObject);
  private
    { Private declarations }
    FIgnoreAll: Boolean;
    function BindRoot(Form: TComponent; AFileName: string): TFrmDsnEdit;
    procedure ReadError(Reader: TReader; const Message: string; var Handled: Boolean);
    function GetCurDesigner: TzFormDesigner;
  public
    { Public declarations }
    property CurDesigner: TzFormDesigner read GetCurDesigner;
  end;

var
  frmEasyFormDesigner: TfrmEasyFormDesigner;

implementation

uses
   ed_RegComps, edUtils, edManager, {untStdRegComps, }TypInfo, edIOUtils,
   DesignIntf, TreeIntf, edReg;

{$R *.dfm}

var
  Count: integer = 1; //窗体创建计数器

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyFormDesigner := TfrmEasyFormDesigner.Create(Application);
  if frmEasyFormDesigner.FormStyle <> fsMDIChild then
    frmEasyFormDesigner.FormStyle := fsMDIChild;
  if frmEasyFormDesigner.WindowState <> wsMaximized then
    frmEasyFormDesigner.WindowState := wsMaximized;
  frmEasyFormDesigner.FormId := '{5EDC78F7-3AD4-413B-AF8E-298CF3E8789A}';
  Result := frmEasyFormDesigner;
end;

function TfrmEasyFormDesigner.BindRoot(Form: TComponent; AFileName: string): TFrmDsnEdit;
var
  Page: TEasyTabSheet;
begin
  if Form is TForm then // 只有Form窗体才能挂靠
  begin
    Page := TEasyTabSheet.Create(Self);
    Page.Caption := Form.Name;
    Page.PageControl := pgcCenter;
    Page.Hint := AFileName;
    Result := TFrmDsnEdit.Create(nil);
    Result.Align := alClient;
    Result.Parent := Page;
    Result.AForm := TForm(Form);
    Result.FormDesigner.Target := Form;
    Result.FormDesigner.Active := True;
    pgcCenter.ActivePage := Page;
  end
  else
    Result := nil;
end;

procedure TfrmEasyFormDesigner.FileNewExecute(Sender: TObject);
var
  fm: TForm;
begin
  fm := TForm.Create(nil);
  fm.Name := 'Untitled' + IntToStr(Count);
  Inc(Count);
  BindRoot(fm, '');
end;

procedure TfrmEasyFormDesigner.FileCloseExecute(Sender: TObject);
var
  I, Count: Integer;
begin
  Count := pgcCenter.PageCount;
  if pgcCenter.ActivePage <> nil then
  begin
    I := pgcCenter.ActivePageIndex;
    if dsnUndo1.Enabled then
    begin
      if Application.MessageBox('文件已更改,是否保存?', 
        PChar('提示'), MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        FileSave.Execute;
    end;  
    pgcCenter.ActivePage.Free;
    if I < (Count - 1) then
      pgcCenter.ActivePageIndex := I
    else
      pgcCenter.ActivePageIndex := I - 1;
  end;
end;

procedure TfrmEasyFormDesigner.FileOpenExecute(Sender: TObject);
var
  fm : TForm;
begin
  if OD.Execute then
  begin
    FIgnoreAll := False;
    fm := TForm.Create(nil);
    try
      zReadCmpFromFile(OD.FileName, fm, ReadError);
    except
      fm.Free;
      Exit;
    end;
    BindRoot(fm, OD.FileName);
  end;
end;

procedure TfrmEasyFormDesigner.ReadError(Reader: TReader;
  const Message: string; var Handled: Boolean);
begin
  Handled := FIgnoreAll;
  if not Handled then
   case MessageDlg(Message + sLineBreak + '忽略此错误?', mtError, [mbYes, mbNo, mbAll], 0) of
     mrYes: Handled := True;
     mrAll:
     begin
       Handled := True;
       FIgnoreAll := True;
     end;
   end;
end;

procedure TfrmEasyFormDesigner.FileSaveExecute(Sender: TObject);
begin
  if dsnUndo1.Enabled then
  begin
    if pgcCenter.ActivePage.Hint <> '' then
      DsnWriteToFile(pgcCenter.ActivePage.Hint, CurDesigner, True)
    else
    begin
      if SD.Execute then
      begin
        DsnWriteToFile(SD.FileName, CurDesigner, True);
        pgcCenter.ActivePage.Hint := SD.FileName;
      end
      else
        Exit;
    end;
  end;
end;

function TfrmEasyFormDesigner.GetCurDesigner: TzFormDesigner;
begin
  if pgcCenter.ActivePage = nil then
    Result := nil
  else
    Result := TFrmDsnEdit(pgcCenter.ActivePage.Controls[0]).FormDesigner;
end;

procedure TfrmEasyFormDesigner.FileCloseAllExecute(Sender: TObject);
var
  I: integer;
begin
  for i := pgcCenter.PageCount - 1 downto 0 do
    pgcCenter.Pages[i].Free;
end;

procedure TfrmEasyFormDesigner.FileMergeExecute(Sender: TObject);
begin
  if (CurDesigner <> nil) and OD.Execute then
    DsnReadFromFile(OD.FileName, CurDesigner, ReadError);
end;

procedure TfrmEasyFormDesigner.DesignModeExecute(Sender: TObject);
var
  fm: TForm;
  Mem: TMemoryStream;
begin
if CurDesigner <> nil then
  if CurDesigner.Active then
  begin
    Mem := TMemoryStream.Create;
    try
      DsnWriteCmpToStream(Mem, CurDesigner, False);
      fm := TForm.Create(Self);
      fm.OnClose := FormClose;
      Mem.Position := 0;
      zReadCmpFromStream(Mem, fm);
      fm.Show;
    finally
      Mem.Free;
    end;
  end;
end;

procedure TfrmEasyFormDesigner.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmEasyFormDesigner.FileCloseUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := CurDesigner <> nil;
end;

procedure TfrmEasyFormDesigner.FileSaveUpdate(Sender: TObject);
begin
  FileSave.Enabled := CurDesigner <> nil;
end;

procedure TfrmEasyFormDesigner.N11Click(Sender: TObject);
begin
  ObjectInspectorFrame1.Customize;
end;

procedure TfrmEasyFormDesigner.pgcCenterDblClick(Sender: TObject);
begin
  FileClose.Execute;
end;

procedure TfrmEasyFormDesigner.actBDSStyleExecute(Sender: TObject);
begin
  CurDesigner.BDSStyle := not CurDesigner.BDSStyle;
end;

procedure TfrmEasyFormDesigner.actBDSStyleUpdate(Sender: TObject);
begin
  actBDSStyle.Enabled := CurDesigner <> nil;
  if actBDSStyle.Enabled then
    actBDSStyle.Checked := CurDesigner.BDSStyle;
end;

procedure TfrmEasyFormDesigner.dsnLockControls1Update(Sender: TObject);
begin
  CurDesigner.LockControls :=  dsnLockControls1.Checked
end;

procedure TfrmEasyFormDesigner.dsnSaveAsExecute(Sender: TObject);
begin
  if (CurDesigner <> nil) and SD.Execute then
    DsnWriteToFile(SD.FileName, CurDesigner, True)
end;

procedure TfrmEasyFormDesigner.dsnSaveAsUpdate(Sender: TObject);
begin
  dsnSaveAs.Enabled := CurDesigner <> nil;
end;

procedure TfrmEasyFormDesigner.FileExitExecute(Sender: TObject);
begin
  FileCloseAll.Execute;
  Close;
//  if CurDesigner.Modified then
//  begin
//    ShowMessage('Modified');
//  end;
end;

procedure TfrmEasyFormDesigner.actRightPageControlExecute(Sender: TObject);
begin
  pgcRight.Visible := not pgcRight.Visible;
end;

procedure TfrmEasyFormDesigner.actRightPageControlUpdate(Sender: TObject);
begin
  actRightPageControl.Checked := pgcRight.Visible;
end;

procedure TfrmEasyFormDesigner.actLeftPageControlExecute(Sender: TObject);
begin
  pgcLeft.Visible := not pgcLeft.Visible;
end;

procedure TfrmEasyFormDesigner.actLeftPageControlUpdate(Sender: TObject);
begin
  actLeftPageControl.Checked := pgcLeft.Visible;
end;

procedure TfrmEasyFormDesigner.pgcCenterChange(Sender: TObject);
begin
  if pgcCenter.ActivePage <> nil then
  begin
    TFrmDsnEdit(pgcCenter.ActivePage.Controls[0]).FormDesigner.Active := False;
    TFrmDsnEdit(pgcCenter.ActivePage.Controls[0]).FormDesigner.Target :=
      TFrmDsnEdit(pgcCenter.ActivePage.Controls[0]).AForm;
    TFrmDsnEdit(pgcCenter.ActivePage.Controls[0]).FormDesigner.Active := True;
  end;
end;

end.
