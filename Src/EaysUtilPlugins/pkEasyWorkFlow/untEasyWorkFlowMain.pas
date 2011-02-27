unit untEasyWorkFlowMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, atDiagram, ExtCtrls, DiagramExtra, ImgList, StdCtrls, Menus,
  wsDB, wsADO, ComCtrls, wsControls, LiveDiagram, wsClasses, 
  untEasyStatusBar, untEasyStatusBarStylers, untEasyGroupBox,
  untEasyToolBar, untEasyToolBarStylers,
  DgrSelectors, EasyDgrCombo, ActnList, ExtDlgs, untEasyWorkFlowDiagramShadow,
  untEasyWorkFlowDiagramGradient;

type
  TfrmEasyWorkFlowMain = class(TForm)
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    EasyPanel1: TEasyPanel;
    EasyStatusBarOfficeStyler1: TEasyStatusBarOfficeStyler;
    Splitter1: TSplitter;
    EasyPanel2: TEasyPanel;
    WorkflowDiagramMain: TWorkflowDiagram;
    WorkDefListView1: TWorkDefListView;
    WorkflowADODB1: TWorkflowADODB;
    WorkflowDB1: TWorkflowDB;
    EasyToolBar2: TEasyToolBar;
    TabControl1: TTabControl;
    DiagramToolBar1: TDiagramToolBar;
    DgrColorSelector2: TDgrColorSelector;
    DgrGradientDirectionSelector2: TDgrGradientDirectionSelector;
    DgrBrushStyleSelector2: TDgrBrushStyleSelector;
    DgrShadowSelector2: TDgrShadowSelector;
    DgrPenStyleSelector2: TDgrPenStyleSelector;
    DgrPenColorSelector2: TDgrPenColorSelector;
    DgrTransparencySelector2: TDgrTransparencySelector;
    DgrZoomSelector2: TDgrZoomSelector;
    DgrPenWidthSelector2: TDgrPenWidthSelector;
    DgrTextColorSelector2: TDgrTextColorSelector;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    DgrFontSizeSelector1: TDgrFontSizeSelector;
    DgrFontSelector1: TDgrFontSelector;
    EasyToolBar3: TEasyToolBar;
    EasyToolBarButton1: TEasyToolBarButton;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarSeparator3: TEasyToolBarSeparator;
    EasyToolBarButton4: TEasyToolBarButton;
    EasyToolBarButton5: TEasyToolBarButton;
    EasyToolBar4: TEasyToolBar;
    EasyToolBarButton6: TEasyToolBarButton;
    EasyToolBarButton7: TEasyToolBarButton;
    EasyToolBarButton8: TEasyToolBarButton;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton9: TEasyToolBarButton;
    EasyToolBarButton10: TEasyToolBarButton;
    EasyToolBarButton11: TEasyToolBarButton;
    EasyToolBarSeparator4: TEasyToolBarSeparator;
    EasyToolBarButton12: TEasyToolBarButton;
    EasyToolBarButton13: TEasyToolBarButton;
    EasyToolBarButton14: TEasyToolBarButton;
    EasyToolBarSeparator5: TEasyToolBarSeparator;
    EasyToolBarButton15: TEasyToolBarButton;
    EasyToolBarButton16: TEasyToolBarButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actWFNew: TAction;
    actWFSave: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    actWFOpen: TAction;
    actPreview: TAction;
    actPrint: TAction;
    ActionList3: TActionList;
    acBold: TAction;
    acItalic: TAction;
    acUnderline: TAction;
    acAlignLeft: TAction;
    acAlignCenter: TAction;
    acAlignRight: TAction;
    acVertAlignTop: TAction;
    acVertAlignMiddle: TAction;
    acVertAlignBottom: TAction;
    ImageList3: TImageList;
    actWFGroup: TAction;
    actWFUnGroup: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    actWFCopy: TAction;
    actWFCut: TAction;
    actWFPaste: TAction;
    actWFSelectAll: TAction;
    actWFDelete: TAction;
    actWFEditText: TAction;
    actWFUndo: TAction;
    actWFRedo: TAction;
    actWFViewTopRuler: TAction;
    actWFViewLeftRuler: TAction;
    actWFGrid: TAction;
    actWFBlockPicture: TAction;
    actWFShapeColor: TAction;
    actWFLineColor: TAction;
    actWFArrowShape: TAction;
    actBringToFront: TAction;
    actWFSendToBack: TAction;
    actWFControlFont: TAction;
    actWFGradientSetting: TAction;
    actWFShadow: TAction;
    OpenPictureDialog1: TOpenPictureDialog;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    EasyToolBarSeparator6: TEasyToolBarSeparator;
    EasyToolBarButton17: TEasyToolBarButton;
    EasyToolBarButton18: TEasyToolBarButton;
    EasyToolBarButton19: TEasyToolBarButton;
    EasyToolBarButton20: TEasyToolBarButton;
    EasyToolBarButton21: TEasyToolBarButton;
    EasyToolBarSeparator7: TEasyToolBarSeparator;
    EasyToolBarButton22: TEasyToolBarButton;
    EasyToolBarButton23: TEasyToolBarButton;
    EasyToolBarSeparator8: TEasyToolBarSeparator;
    EasyToolBarButton24: TEasyToolBarButton;
    EasyToolBarButton25: TEasyToolBarButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    EasyToolBarButton26: TEasyToolBarButton;
    EasyToolBarButton27: TEasyToolBarButton;
    EasyToolBarSeparator9: TEasyToolBarSeparator;
    N15: TMenuItem;
    N16: TMenuItem;
    procedure actWFNewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actWFSaveExecute(Sender: TObject);
    procedure actWFOpenExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure acBoldExecute(Sender: TObject);
    procedure acBoldUpdate(Sender: TObject);
    procedure acAlignCenterExecute(Sender: TObject);
    procedure acAlignCenterUpdate(Sender: TObject);
    procedure acAlignLeftExecute(Sender: TObject);
    procedure acAlignLeftUpdate(Sender: TObject);
    procedure acAlignRightExecute(Sender: TObject);
    procedure acAlignRightUpdate(Sender: TObject);
    procedure acItalicExecute(Sender: TObject);
    procedure acItalicUpdate(Sender: TObject);
    procedure acUnderlineExecute(Sender: TObject);
    procedure acUnderlineUpdate(Sender: TObject);
    procedure acVertAlignBottomExecute(Sender: TObject);
    procedure acVertAlignBottomUpdate(Sender: TObject);
    procedure acVertAlignMiddleExecute(Sender: TObject);
    procedure acVertAlignMiddleUpdate(Sender: TObject);
    procedure acVertAlignTopExecute(Sender: TObject);
    procedure acVertAlignTopUpdate(Sender: TObject);
    procedure actWFGroupExecute(Sender: TObject);
    procedure actWFUnGroupExecute(Sender: TObject);
    procedure actWFGroupUpdate(Sender: TObject);
    procedure actWFUnGroupUpdate(Sender: TObject);
    procedure actWFCopyExecute(Sender: TObject);
    procedure actWFCopyUpdate(Sender: TObject);
    procedure actWFCutExecute(Sender: TObject);
    procedure actWFCutUpdate(Sender: TObject);
    procedure actWFPasteExecute(Sender: TObject);
    procedure actWFSelectAllExecute(Sender: TObject);
    procedure actWFSelectAllUpdate(Sender: TObject);
    procedure actWFDeleteExecute(Sender: TObject);
    procedure actWFDeleteUpdate(Sender: TObject);
    procedure actWFEditTextExecute(Sender: TObject);
    procedure actWFEditTextUpdate(Sender: TObject);
    procedure actWFPasteUpdate(Sender: TObject);
    procedure actWFUndoExecute(Sender: TObject);
    procedure actWFUndoUpdate(Sender: TObject);
    procedure actWFViewTopRulerExecute(Sender: TObject);
    procedure actWFViewTopRulerUpdate(Sender: TObject);
    procedure actWFViewLeftRulerExecute(Sender: TObject);
    procedure actWFViewLeftRulerUpdate(Sender: TObject);
    procedure actWFGridExecute(Sender: TObject);
    procedure actWFGridUpdate(Sender: TObject);
    procedure actWFBlockPictureExecute(Sender: TObject);
    procedure actWFBlockPictureUpdate(Sender: TObject);
    procedure actWFShapeColorExecute(Sender: TObject);
    procedure actWFShapeColorUpdate(Sender: TObject);
    procedure actWFLineColorExecute(Sender: TObject);
    procedure actWFLineColorUpdate(Sender: TObject);
    procedure actWFArrowShapeExecute(Sender: TObject);
    procedure actWFArrowShapeUpdate(Sender: TObject);
    procedure actBringToFrontExecute(Sender: TObject);
    procedure actBringToFrontUpdate(Sender: TObject);
    procedure actWFSendToBackExecute(Sender: TObject);
    procedure actWFSendToBackUpdate(Sender: TObject);
    procedure actWFControlFontExecute(Sender: TObject);
    procedure actWFControlFontUpdate(Sender: TObject);
    procedure actWFGradientSettingExecute(Sender: TObject);
    procedure actWFGradientSettingUpdate(Sender: TObject);
    procedure actWFShadowExecute(Sender: TObject);
    procedure actWFShadowUpdate(Sender: TObject);
    procedure actWFRedoExecute(Sender: TObject);
    procedure actWFRedoUpdate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    //连接线箭头的
    FShape: TArrowShape;
    FSource: boolean;
    
    FTabControl: TTabControl;
    FToolbar: TDiagramToolbar;
    bModified : Boolean;
    FDiagram : TWorkflowDiagram;
    procedure SetModified(value: Boolean);
    procedure PrepareCategoryTab(ATabControl: TTabControl; AToolbar: TDiagramToolbar);
    procedure TabControlChange(Sender: TObject);
    procedure SwitchSelectedFontStyle(AStyle: TFontStyle; AInclude: boolean);
    procedure SetSelectedAlignment(AAlign: TAlignment);
    procedure SetSelectedVertAlign(AAlign: TVertAlign);
    function FirstCellSelected: TTextCell;
  public
    { Public declarations }
  end;

var
  frmEasyWorkFlowMain: TfrmEasyWorkFlowMain;

implementation

uses untEasyWorkFlowDiagramPreview;

{$R *.dfm}

procedure TfrmEasyWorkFlowMain.SetModified(value: Boolean);
begin
  bModified := value;
end;

procedure TfrmEasyWorkFlowMain.actWFNewExecute(Sender: TObject);
begin
  if not bModified or (MessageDlg('创建一个新流程图并取消当前发生的变更?',
    mtInformation, [mbYes, mbNo], 0) = mrYes) then
  begin
    WorkflowDiagramMain.Clear;
    SetModified(False);
    Caption := '未命名';
  end;
end;

procedure TfrmEasyWorkFlowMain.PrepareCategoryTab(ATabControl: TTabControl;
  AToolbar: TDiagramToolbar);
var
  c: integer;
  SL: TStringList;
  ATab: string;
begin
  FTabControl := ATabControl;
  if FTabControl <> nil then
  begin
    SL := TStringList.Create;
    SL.Add('All objects');
    try
      for c := 0 to RegDControlList.Count - 1 do
      begin
        ATab := RegDControlList[c].Category;
        if (ATab <> '') and (SL.IndexOf(ATab) = -1) then
          SL.Add(RegDControlList[c].Category);
      end;
      FTabControl.Tabs := SL;
    finally
      SL.Free;
    end;
    FTabControl.OnChange := TabControlChange;
    FToolbar := AToolbar;
  end;
end;

procedure TfrmEasyWorkFlowMain.FormCreate(Sender: TObject);
begin
  PrepareCategoryTab(TabControl1, DiagramToolBar1);
  FDiagram := WorkflowDiagramMain;
end;

procedure TfrmEasyWorkFlowMain.TabControlChange(Sender: TObject);
begin
  if (FTabControl <> nil) and (FToolbar <> nil) then
  begin
    if (FTabControl.TabIndex = 0) or (FTabControl.Tabs.Count <= 0) then
      FToolbar.Category := ''
    else
      FToolbar.Category := FTabControl.Tabs[FTabControl.TabIndex];
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFSaveExecute(Sender: TObject);
begin
  if FileExists(Caption) then
    WorkflowDiagramMain.SaveToFile(Caption)
  else if SaveDialog1.Execute then
  begin
    WorkflowDiagramMain.SaveToFile(SaveDialog1.FileName);
    SetModified(false);
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFOpenExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if not bModified or (MessageDlg('打开一个新流程图并取消当前发生的变更?',
      mtInformation, [mbYes, mbNo], 0) = mrYes) then
    begin
      WorkflowDiagramMain.LoadFromFile(OpenDialog1.FileName);
      SetModified(False);
      Caption := OpenDialog1.FileName;
    end;
  end;
end;

procedure TfrmEasyWorkFlowMain.actPrintExecute(Sender: TObject);
begin
  if PrintDialog1.Execute then
    WorkflowDiagramMain.Print;
end;

procedure TfrmEasyWorkFlowMain.actPreviewExecute(Sender: TObject);
var
  PreviewForm: TfrmEasyWorkFlowDiagramPreview;
begin                           
  PreviewForm := TfrmEasyWorkFlowDiagramPreview.Create(Application);
  try
    PreviewForm.Diagram := FDiagram;
    PreviewForm.ShowModal;
  finally
    PreviewForm.Free;
  end;
end;

procedure TfrmEasyWorkFlowMain.acBoldExecute(Sender: TObject);
begin
  SwitchSelectedFontStyle(fsBold, not acBold.Checked);
end;

procedure TfrmEasyWorkFlowMain.acItalicExecute(Sender: TObject);
begin
  SwitchSelectedFontStyle(fsItalic, not acItalic.Checked);
end;

procedure TfrmEasyWorkFlowMain.acUnderlineExecute(Sender: TObject);
begin
  SwitchSelectedFontStyle(fsUnderline, not acUnderline.Checked);
end;

procedure TfrmEasyWorkFlowMain.acAlignLeftExecute(Sender: TObject);
begin
  SetSelectedAlignment(taLeftJustify);
end;

procedure TfrmEasyWorkFlowMain.acAlignCenterExecute(Sender: TObject);
begin
  SetSelectedAlignment(taCenter);
end;

procedure TfrmEasyWorkFlowMain.acAlignRightExecute(Sender: TObject);
begin
  SetSelectedAlignment(taRightJustify);
end;

procedure TfrmEasyWorkFlowMain.acVertAlignTopExecute(Sender: TObject);
begin
  SetSelectedVertAlign(vaTop);
end;

procedure TfrmEasyWorkFlowMain.acVertAlignMiddleExecute(Sender: TObject);
begin
  SetSelectedVertAlign(vaCenter);
end;

procedure TfrmEasyWorkFlowMain.acVertAlignBottomExecute(Sender: TObject);
begin
  SetSelectedVertAlign(vaBottom);
end;

procedure TfrmEasyWorkFlowMain.acBoldUpdate(Sender: TObject);
begin
  acBold.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acBold.Checked := (FirstCellSelected <> nil) and (fsBold in FirstCellSelected.Font.Style);
end;

procedure TfrmEasyWorkFlowMain.acItalicUpdate(Sender: TObject);
begin
  acItalic.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acItalic.Checked := (FirstCellSelected <> nil) and (fsItalic in FirstCellSelected.Font.Style);
end;

procedure TfrmEasyWorkFlowMain.acUnderlineUpdate(Sender: TObject);
begin
  acUnderline.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acUnderline.Checked := (FirstCellSelected <> nil) and (fsUnderline in FirstCellSelected.Font.Style);
end;

procedure TfrmEasyWorkFlowMain.acAlignLeftUpdate(Sender: TObject);
begin
  acAlignLeft.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acAlignLeft.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.Alignment = taLeftJustify);
end;

procedure TfrmEasyWorkFlowMain.acAlignCenterUpdate(Sender: TObject);
begin
  acAlignCenter.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acAlignCenter.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.Alignment = taCenter);
end;

procedure TfrmEasyWorkFlowMain.acAlignRightUpdate(Sender: TObject);
begin
  acAlignRight.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acAlignRight.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.Alignment = taRightJustify);
end;

procedure TfrmEasyWorkFlowMain.acVertAlignTopUpdate(Sender: TObject);
begin
  acVertAlignTop.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acVertAlignTop.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.VertAlign = vaTop);
end;

procedure TfrmEasyWorkFlowMain.acVertAlignMiddleUpdate(Sender: TObject);
begin
  acVertAlignMiddle.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acVertAlignMiddle.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.VertAlign = vaCenter);
end;

procedure TfrmEasyWorkFlowMain.acVertAlignBottomUpdate(Sender: TObject);
begin
  acVertAlignBottom.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acVertAlignBottom.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.VertAlign = vaBottom);
end;

procedure TfrmEasyWorkFlowMain.SwitchSelectedFontStyle(AStyle: TFontStyle;
  AInclude: boolean);

  procedure _SwitchStyle(AFont: TFont);
  begin
    if AInclude then
      AFont.Style := AFont.Style + [AStyle]
    else
      AFont.Style := AFont.Style - [AStyle];
  end;

var
  c: integer;
  d: integer;
begin
  with FDiagram do
    if EditingText then
      _SwitchStyle(EditingCell.Font)
    else
      for c := 0 to SelectedCount - 1 do if not Selecteds[c].IsGroup then
      begin
        _SwitchStyle(Selecteds[c].Font);
        for d := 0 to Selecteds[c].TextCells.Count - 1 do
          if not Selecteds[c].TextCells[d].DControlFont then
            _SwitchStyle(Selecteds[c].TextCells[d].Font);
      end;   
end;

procedure TfrmEasyWorkFlowMain.SetSelectedAlignment(AAlign: TAlignment);
var
  c: integer;
  d: integer;
begin
  with FDiagram do
    if EditingText then
      EditingCell.Alignment := AAlign
    else
      for c := 0 to SelectedCount - 1 do if not Selecteds[c].IsGroup then
      begin
        for d := 0 to Selecteds[c].TextCells.Count - 1 do
          Selecteds[c].TextCells[d].Alignment := AAlign;
      end;
end;

procedure TfrmEasyWorkFlowMain.SetSelectedVertAlign(AAlign: TVertAlign);
var
  c: integer;
  d: integer;
begin
  with FDiagram do
    if EditingText then
      EditingCell.VertAlign := AAlign
    else
      for c := 0 to SelectedCount - 1 do if not Selecteds[c].IsGroup then
      begin
        for d := 0 to Selecteds[c].TextCells.Count - 1 do
          Selecteds[c].TextCells[d].VertAlign := AAlign;
      end;
end;

function TfrmEasyWorkFlowMain.FirstCellSelected: TTextCell;
var
  AControl: TDiagramControl;
begin
  result := nil;
  if (FDiagram <> nil) then
  begin
    if FDiagram.EditingText then
      result := FDiagram.EditingCell
    else
    if (FDiagram.SelectedCount > 0) then
    begin
      AControl := FDiagram.Selecteds[0];
      while AControl.IsGroup and (TGroupBlock(AControl).Members.Count > 0) do
        AControl := TGroupBlock(AControl).Members[0].DControl;
      if (AControl <> nil) and (AControl.HasDefaultTextCell) then
        result := AControl.DefaultTextCell;

      if not result.Visible then
      begin
        repeat
          result := AControl.SelectNextCell(result, true);
        until (result.Visible) or (result = AControl.DefaultTextCell);
      end;
    end;   
  end;   
end;

procedure TfrmEasyWorkFlowMain.actWFGroupExecute(Sender: TObject);
begin
  FDiagram.GroupSelectedBlocks;
end;

procedure TfrmEasyWorkFlowMain.actWFUnGroupExecute(Sender: TObject);
begin
  FDiagram.UngroupSelectedBlocks;
end;

procedure TfrmEasyWorkFlowMain.actWFGroupUpdate(Sender: TObject);
begin
  actWFGroup.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount(cfIgnoreMembers) > 1);
end;

procedure TfrmEasyWorkFlowMain.actWFUnGroupUpdate(Sender: TObject);
var
  c: integer;
  Ok: boolean;
begin
  Ok := false;
  if FDiagram <> nil then
    for c := 0 to FDiagram.SelectedCount - 1 do
      if FDiagram.Selecteds[c].IsGroup and not FDiagram.Selecteds[c].IsMember then
      begin
        Ok := true;
        break;
      end;
  actWFUnGroup.Enabled := Ok;
end;

procedure TfrmEasyWorkFlowMain.actWFCopyExecute(Sender: TObject);
begin
  FDiagram.CopyToClipboard;
end;

procedure TfrmEasyWorkFlowMain.actWFCopyUpdate(Sender: TObject);
begin
  actWFCopy.Enabled := (FDiagram <> nil) and (FDiagram.CanCopy);
end;

procedure TfrmEasyWorkFlowMain.actWFCutExecute(Sender: TObject);
begin
  FDiagram.CutToClipboard;
end;

procedure TfrmEasyWorkFlowMain.actWFCutUpdate(Sender: TObject);
begin
  actWFCut.Enabled := (FDiagram <> nil) and (FDiagram.CanCopy);
end;

procedure TfrmEasyWorkFlowMain.actWFPasteExecute(Sender: TObject);
begin
  FDiagram.PasteFromClipboard;
end;

procedure TfrmEasyWorkFlowMain.actWFSelectAllExecute(Sender: TObject);
begin
  FDiagram.SelectAll;
end;

procedure TfrmEasyWorkFlowMain.actWFSelectAllUpdate(Sender: TObject);
begin
  actWFSelectAll.Enabled := (FDiagram <> nil) and (FDiagram.MouseState = msBrowsing);
end;

procedure TfrmEasyWorkFlowMain.actWFDeleteExecute(Sender: TObject);
begin
  FDiagram.DeleteSelecteds;
end;

procedure TfrmEasyWorkFlowMain.actWFDeleteUpdate(Sender: TObject);
begin
  actWFDelete.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount > 0) and
    (FDiagram.MouseState = msBrowsing) and
    not FDiagram.EditingText;
end;

procedure TfrmEasyWorkFlowMain.actWFEditTextExecute(Sender: TObject);
begin
  if FDiagram.Selecteds[0].IsMember then
    FDiagram.Selecteds[0].MasterGroup.EditText
  else
    FDiagram.Selecteds[0].EditText;
end;

procedure TfrmEasyWorkFlowMain.actWFEditTextUpdate(Sender: TObject);
var
  enable :Boolean;
begin
  Enable := (FDiagram <> nil) and (FDiagram.SelectedCount > 0) and (FDiagram.MouseState = msBrowsing);
  if Enable then
  begin
    if FDiagram.Selecteds[0].IsMember then
      Enable := Enable and not (crNoEdit in FDiagram.Selecteds[0].MasterGroup.Restrictions)
    else
      Enable := Enable and not (crNoEdit in FDiagram.Selecteds[0].Restrictions)
  end;
  actWFEditText.Enabled := Enable;
end;

procedure TfrmEasyWorkFlowMain.actWFPasteUpdate(Sender: TObject);
begin
  actWFPaste.Enabled := (FDiagram <> nil) and (FDiagram.CanPaste);
end;

procedure TfrmEasyWorkFlowMain.actWFUndoExecute(Sender: TObject);
begin
  FDiagram.Undo;
end;

procedure TfrmEasyWorkFlowMain.actWFUndoUpdate(Sender: TObject);
begin
  actWFUndo.Enabled := (FDiagram <> nil) and (FDiagram.NextUndoAction <> '');
end;

procedure TfrmEasyWorkFlowMain.actWFViewTopRulerExecute(Sender: TObject);
begin
  actWFViewTopRuler.Checked := not actWFViewTopRuler.Checked;
  FDiagram.TopRuler.Visible := actWFViewTopRuler.Checked;
  FDiagram.PushUndoStack('view top ruler');
end;

procedure TfrmEasyWorkFlowMain.actWFViewTopRulerUpdate(Sender: TObject);
begin
  actWFViewTopRuler.Enabled := (FDiagram <> nil);
  actWFViewTopRuler.Checked := actWFViewTopRuler.Enabled and FDiagram.TopRuler.Visible;
end;

procedure TfrmEasyWorkFlowMain.actWFViewLeftRulerExecute(Sender: TObject);
begin
  actWFViewLeftRuler.Checked := not actWFViewLeftRuler.Checked;
  FDiagram.LeftRuler.Visible := actWFViewLeftRuler.Checked;
  FDiagram.PushUndoStack('view left ruler');
end;

procedure TfrmEasyWorkFlowMain.actWFViewLeftRulerUpdate(Sender: TObject);
begin
  actWFViewLeftRuler.Enabled := (FDiagram <> nil);
  actWFViewLeftRuler.Checked := actWFViewLeftRuler.Enabled and FDiagram.LeftRuler.Visible;
end;

procedure TfrmEasyWorkFlowMain.actWFGridExecute(Sender: TObject);
begin
  actWFGrid.Checked := not actWFGrid.Checked;
  FDiagram.SnapGrid.Visible  := actWFGrid.Checked;
  FDiagram.Modified;
  FDiagram.PushUndoStack('view snap grid');
end;

procedure TfrmEasyWorkFlowMain.actWFGridUpdate(Sender: TObject);
begin
  actWFGrid.Enabled := (FDiagram <> nil);
  actWFGrid.Checked := actWFGrid.Enabled and FDiagram.SnapGrid.Visible;
end;

procedure TfrmEasyWorkFlowMain.actWFBlockPictureExecute(Sender: TObject);
var
  c: integer;
  OD: TOpenPictureDialog;
  Ext: string;
begin
  OD := TOpenPictureDialog.Create(nil);
  try
    if OD.Execute then
    begin
      Ext := UpperCase(ExtractFileExt(OD.FileName));
      for c := 0 to FDiagram.BlockCount - 1 do
        if FDiagram.Blocks[c].Selected and not FDiagram.Blocks[c].IsGroup then
          if Ext = '.BMP' then
            FDiagram.Blocks[c].Bitmap.LoadFromFile(OD.FileName)
          else
            FDiagram.Blocks[c].Picture.LoadFromFile(OD.FileName);
      FDiagram.Modified;
      FDiagram.PushUndoStack('picture');
    end;
  finally
    OD.Free;
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFBlockPictureUpdate(Sender: TObject);
begin
  actWFBlockPicture.Enabled := (FDiagram <> nil) and (FDiagram.SelectedBlockCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFShapeColorExecute(Sender: TObject);
var
  c: integer;
  CD: TColorDialog;
begin
  CD := TColorDialog.Create(nil);
  try
    if CD.Execute then
    begin
      for c := 0 to FDiagram.BlockCount - 1 do
        if FDiagram.Blocks[c].Selected and not FDiagram.Blocks[c].IsGroup then
        begin
          FDiagram.Blocks[c].Color := CD.Color;
          FDiagram.Blocks[c].SelColor := CD.Color;
        end;
      FDiagram.Modified;
      FDiagram.PushUndoStack('color');
    end;
  finally
    CD.Free;
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFShapeColorUpdate(Sender: TObject);
begin
  actWFShapeColor.Enabled := (FDiagram <> nil) and (FDiagram.SelectedBlockCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFLineColorExecute(Sender: TObject);
var
  c: integer;
  CD: TColorDialog;
begin
  CD := TColorDialog.Create(nil);
  try
    if CD.Execute then
    begin
      for c := 0 to FDiagram.BlockCount - 1 do
        if FDiagram.Blocks[c].Selected and not FDiagram.Blocks[c].IsGroup then
          FDiagram.Blocks[c].Pen.Color := CD.Color;
      for c := 0 to FDiagram.LinkCount - 1 do
        if FDiagram.Links[c].Selected then
        begin
          FDiagram.Links[c].Pen.Color := CD.Color;
          FDiagram.Links[c].SelPen.Color := CD.Color;
        end;
      FDiagram.Modified;
      FDiagram.PushUndoStack('line color');
    end;
  finally
    CD.Free;
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFLineColorUpdate(Sender: TObject);
begin
  actWFLineColor.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFArrowShapeExecute(Sender: TObject);
var
  c: integer;
begin
  for c := 0 to FDiagram.LinkCount - 1 do
    if FDiagram.Links[c].Selected then
    begin
      if FSource then
        FDiagram.Links[c].SourceArrow.Shape := FShape
      else
        FDiagram.Links[c].TargetArrow.Shape := FShape;
      FDiagram.Modified;
      FDiagram.PushUndoStack('arrow shape');
    end;
end;

procedure TfrmEasyWorkFlowMain.actWFArrowShapeUpdate(Sender: TObject);
  function CommonProperty(var Prop: TArrowShape): boolean;
  var
    c: integer;
    first: boolean;
  begin
    first := true;
    result := true;
    for c := 0 to FDiagram.LinkCount - 1 do
      if FDiagram.Links[c].Selected then
      begin
        if first then
        begin
          if FSource then
            Prop := FDiagram.Links[c].SourceArrow.Shape
          else
            Prop := FDiagram.Links[c].TargetArrow.Shape;
          first := false;
        end
        else
          if FSource then
            result := Prop = FDiagram.Links[c].SourceArrow.Shape
          else
            result := Prop = FDiagram.Links[c].TargetArrow.Shape;
          if not result then break;
      end;      
  end;

var
  AProp: TArrowShape;
begin
  actWFArrowShape.Enabled := (FDiagram <> nil) and (FDiagram.SelectedLinkCount > 0);
  actWFArrowShape.Checked := actWFArrowShape.Enabled and CommonProperty(AProp) and (AProp = FShape);
end;

procedure TfrmEasyWorkFlowMain.actBringToFrontExecute(Sender: TObject);
begin
  FDiagram.BringToFront;
  FDiagram.Modified;
  FDiagram.PushUndoStack('bring to front');
end;

procedure TfrmEasyWorkFlowMain.actBringToFrontUpdate(Sender: TObject);
begin
  actBringToFront.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFSendToBackExecute(Sender: TObject);
begin
  FDiagram.SendToBack;
  FDiagram.Modified;
  FDiagram.PushUndoStack('send to back');
end;

procedure TfrmEasyWorkFlowMain.actWFSendToBackUpdate(Sender: TObject);
begin
  actWFSendToBack.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFControlFontExecute(Sender: TObject);
var
  c: integer;
  FD: TFontDialog;
begin
  FD := TFontDialog.Create(nil);
  try
    {Get the first selected member as default font}
    for c := 0 to FDiagram.SelectedCount - 1 do
      if not FDiagram.Selecteds[c].IsGroup then
      begin
        FD.Font.Assign(FDiagram.Selecteds[c].Font);
        break;
      end;

    if FD.Execute then
    begin
      for c := 0 to FDiagram.SelectedCount - 1 do
        if not FDiagram.Selecteds[c].IsGroup then
          FDiagram.Selecteds[c].Font := FD.Font;
      FDiagram.Modified;
      FDiagram.PushUndoStack('text font');
    end;
  finally
    FD.Free;
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFControlFontUpdate(Sender: TObject);
begin
  actWFControlFont.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFGradientSettingExecute(
  Sender: TObject);
var
  ge: TfrmEasyWorkFlowDiagramGradient;
  grad: TDiagramGradient;
  c: Integer;
begin
  ge := TfrmEasyWorkFlowDiagramGradient.Create(nil);
  grad := TDiagramGradient.Create(nil);

  grad.StartColor := clWhite;
  grad.EndColor := clWhite;

  try
    for c := 0 to FDiagram.SelectedCount - 1 do if not FDiagram.Selecteds[c].IsGroup then
    begin
      if (FDiagram.Selecteds[c] is TCustomDiagramBlock) then
      begin
        grad.Assign(TCustomDiagramBlock(FDiagram.Selecteds[c]).Gradient);
        if not grad.Visible then
        begin
          grad.StartColor := TCustomDiagramBlock(FDiagram.Selecteds[c]).Color;
          grad.EndColor := TCustomDiagramBlock(FDiagram.Selecteds[c]).Color;
        end;
        break;
      end;  
    end;

    if (ge.EditGradient(grad)) then
    begin
      for c := 0 to FDiagram.SelectedCount - 1 do if not FDiagram.Selecteds[c].IsGroup then
      begin
        if (FDiagram.Selecteds[c] is TCustomDiagramBlock) then
        begin
          grad.Visible := true;
          TCustomDiagramBlock(FDiagram.Selecteds[c]).Gradient.Assign(grad);
        end;  
      end;
      FDiagram.Modified;
      FDiagram.PushUndoStack('gradient');
    end;
  finally
    grad.Free;
    ge.Free;
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFGradientSettingUpdate(Sender: TObject);
begin
  actWFGradientSetting.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFShadowExecute(Sender: TObject);
var
  se: TfrmEasyWorkFlowDiagramShadow;
  shad: TBlockShadow;
  c: Integer;
begin
  se := TfrmEasyWorkFlowDiagramShadow.Create(nil);
  shad := TBlockShadow.Create(nil);
  shad.Color := clGray;

  try
    for c := 0 to FDiagram.SelectedCount - 1 do if not FDiagram.Selecteds[c].IsGroup then
    begin
      if (FDiagram.Selecteds[c] is TCustomDiagramBlock) then
      begin
        shad.Assign(TCustomDiagramBlock(FDiagram.Selecteds[c]).Shadow);
        break;
      end;
    end;

    if (se.EditShadow(shad)) then
    begin
      for c := 0 to FDiagram.SelectedCount - 1 do if not FDiagram.Selecteds[c].IsGroup then
      begin
        if (FDiagram.Selecteds[c] is TCustomDiagramBlock) then
        begin
          shad.Visible := true;
          TCustomDiagramBlock(FDiagram.Selecteds[c]).Shadow.Assign(shad);
        end;
      end;
      FDiagram.Modified;
      FDiagram.PushUndoStack('shadow');
    end;
  finally
    shad.Free;
    se.Free;
  end;
end;

procedure TfrmEasyWorkFlowMain.actWFShadowUpdate(Sender: TObject);
begin
  actWFShadow.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount > 0);
end;

procedure TfrmEasyWorkFlowMain.actWFRedoExecute(Sender: TObject);
begin
  FDiagram.Redo;
end;

procedure TfrmEasyWorkFlowMain.actWFRedoUpdate(Sender: TObject);
begin
  actWFRedo.Enabled := (FDiagram <> nil) and (FDiagram.NextRedoAction <> '');
end;

procedure TfrmEasyWorkFlowMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Application.MessageBox('是否保存对当前流程图所做的更改?', '提示', 
    MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    actWFSaveExecute(Sender);
  end;
end;

end.
