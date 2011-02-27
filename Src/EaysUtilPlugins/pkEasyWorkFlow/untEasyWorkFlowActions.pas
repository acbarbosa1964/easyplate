unit untEasyWorkFlowActions;

interface

uses
  SysUtils, Classes, Forms, ComCtrls, Graphics, atDiagram, DiagramActns,
  DiagramExtra, ActnList, Dialogs, ImgList, Controls, wsClasses;

type
  TDMEasyWorkFlowActions = class(TDataModule)
    ActionList1: TActionList;
    acHasTargetArrow: TAction;
    acHasSourceArrow: TAction;
    acNewDiagram: TAction;
    acOpenDiagram: TAction;
    acSaveDiagram: TAction;
    acPrintDiagram: TAction;
    acPreviewDiagram: TAction;
    acAutomaticNodes: TAction;
    acCopyAsImage: TAction;
    acGroup: TAction;
    acUngroup: TAction;
    ActionList2: TActionList;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    ImageList2: TImageList;
    PrintDialog1: TPrintDialog;
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
    procedure acHasTargetArrowExecute(Sender: TObject);
    procedure acHasSourceArrowExecute(Sender: TObject);
    procedure acNewDiagramExecute(Sender: TObject);
    procedure acOpenDiagramExecute(Sender: TObject);
    procedure acSaveDiagramExecute(Sender: TObject);
    procedure acPrintDiagramExecute(Sender: TObject);
    procedure acPreviewDiagramExecute(Sender: TObject);
    procedure acAutomaticNodesExecute(Sender: TObject);
    procedure acCopyAsImageExecute(Sender: TObject);
    procedure acGroupExecute(Sender: TObject);
    procedure acUngroupExecute(Sender: TObject);
    procedure acHasTargetArrowUpdate(Sender: TObject);
    procedure acHasSourceArrowUpdate(Sender: TObject);
    procedure acAutomaticNodesUpdate(Sender: TObject);
    procedure acGroupUpdate(Sender: TObject);
    procedure acUngroupUpdate(Sender: TObject);
    procedure acBoldExecute(Sender: TObject);
    procedure acItalicExecute(Sender: TObject);
    procedure acUnderlineExecute(Sender: TObject);
    procedure acAlignLeftExecute(Sender: TObject);
    procedure acAlignCenterExecute(Sender: TObject);
    procedure acAlignRightExecute(Sender: TObject);
    procedure acVertAlignTopExecute(Sender: TObject);
    procedure acVertAlignMiddleExecute(Sender: TObject);
    procedure acVertAlignBottomExecute(Sender: TObject);
    procedure acBoldUpdate(Sender: TObject);
    procedure acItalicUpdate(Sender: TObject);
    procedure acUnderlineUpdate(Sender: TObject);
    procedure acAlignLeftUpdate(Sender: TObject);
    procedure acAlignCenterUpdate(Sender: TObject);
    procedure acAlignRightUpdate(Sender: TObject);
    procedure acVertAlignTopUpdate(Sender: TObject);
    procedure acVertAlignMiddleUpdate(Sender: TObject);
    procedure acVertAlignBottomUpdate(Sender: TObject);
  private
    { Private declarations }
//    FDiagram: TatDiagram;
    FDiagram: TWorkflowDiagram;
    FToolbar: TDiagramToolbar;
    FTabControl: TTabControl;
    FOnModified: TNotifyEvent;
    FModified: boolean;
    FOldFormClose: TCloseEvent;
    FOnSaveDiagram: TNotifyEvent;
    procedure SetDiagram(const Value: TWorkflowDiagram);
    procedure SetModified(Value: boolean);
    procedure SetActionsDiagram(ActionList: TActionList);
    procedure DiagramModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabControlChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function FirstCellSelected: TTextCell;
    procedure SwitchSelectedFontStyle(AStyle: TFontStyle; AInclude: boolean);
    procedure SetSelectedAlignment(AAlign: TAlignment);
    procedure SetSelectedVertAlign(AAlign: TVertAlign);
  public
    { Public declarations }
    procedure PrepareDiagram;
    procedure PrepareForm(AForm: TForm);
    procedure PrepareCategoryTab(ATabControl: TTabControl; AToolbar: TDiagramToolbar);
    property Diagram: TWorkflowDiagram read FDiagram write SetDiagram;
    property Modified: boolean read FModified;
    property OnModified: TNotifyEvent read FOnModified write FOnModified;
    property OnSaveDiagram: TNotifyEvent read FOnSaveDiagram write FOnSaveDiagram;
  end;

var
  DMEasyWorkFlowActions: TDMEasyWorkFlowActions;

implementation

{$R *.dfm}

{ TDMEasyWorkFlowActions }

procedure TDMEasyWorkFlowActions.PrepareCategoryTab(
  ATabControl: TTabControl; AToolbar: TDiagramToolbar);
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

procedure TDMEasyWorkFlowActions.PrepareDiagram;
begin
  if FDiagram <> nil then
  begin
    FDiagram.ConnectionLineId := 'TDiagramLine';
  end;
end;

procedure TDMEasyWorkFlowActions.PrepareForm(AForm: TForm);
begin
  if AForm <> nil then
  begin
    AForm.OnCloseQuery := FormCloseQuery;
    FOldFormClose := AForm.OnClose;
    AForm.OnClose := FormClose;
  end;
end;

procedure TDMEasyWorkFlowActions.SetDiagram(const Value: TWorkflowDiagram);
begin
  FDiagram := Value;
end;

procedure TDMEasyWorkFlowActions.acHasTargetArrowExecute(Sender: TObject);
begin
  //This line is needed to keep action active
end;

procedure TDMEasyWorkFlowActions.acHasSourceArrowExecute(Sender: TObject);
begin
  //This line is needed to keep action active
end;

procedure TDMEasyWorkFlowActions.acNewDiagramExecute(Sender: TObject);
begin
  if not FModified or (MessageDlg('创建一个新流程图并取消当前发生的变更?',
    mtInformation, [mbYes, mbNo], 0) = mrYes) then
  begin
    FDiagram.Clear;
    SetModified(False);
  end;
end;

procedure TDMEasyWorkFlowActions.SetModified(Value: boolean);
begin
  if FModified <> Value then
  begin
    FModified := Value;
    if Assigned(FOnModified) then
      FOnModified(FDiagram);
  end;
end;

procedure TDMEasyWorkFlowActions.acOpenDiagramExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if not FModified or (MessageDlg('打开一个新流程图并取消当前发生的变更?',
      mtInformation, [mbYes, mbNo], 0) = mrYes) then
    begin
      FDiagram.LoadFromFile(OpenDialog1.FileName);
      SetModified(False);
    end;
  end;
end;

procedure TDMEasyWorkFlowActions.acSaveDiagramExecute(Sender: TObject);
begin
  if Assigned(FOnSaveDiagram) then
  begin
    FOnSaveDiagram(Sender);;
    SetModified(false);
  end
  else
    if SaveDialog1.Execute then
    begin
      FDiagram.SaveToFile(SaveDialog1.FileName);
      SetModified(false);
    end;
end;

procedure TDMEasyWorkFlowActions.acPrintDiagramExecute(Sender: TObject);
begin
  if PrintDialog1.Execute then
    FDiagram.Print;
end;

procedure TDMEasyWorkFlowActions.acPreviewDiagramExecute(Sender: TObject);
begin
  FDiagram.Preview;
end;

procedure TDMEasyWorkFlowActions.acAutomaticNodesExecute(Sender: TObject);
begin
  acAutomaticNodes.Checked := not acAutomaticNodes.Checked;
  FDiagram.AutomaticNodes := acAutomaticNodes.Checked;
  FDiagram.Modified;
end;

procedure TDMEasyWorkFlowActions.acCopyAsImageExecute(Sender: TObject);
begin
  FDiagram.CopyBitmapToClipboard;
end;

procedure TDMEasyWorkFlowActions.acGroupExecute(Sender: TObject);
begin
  FDiagram.GroupSelectedBlocks;
end;

procedure TDMEasyWorkFlowActions.acUngroupExecute(Sender: TObject);
begin
  FDiagram.UngroupSelectedBlocks;
end;

procedure TDMEasyWorkFlowActions.acHasTargetArrowUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FDiagram.SelectedLinkCount > 0;
end;

procedure TDMEasyWorkFlowActions.acHasSourceArrowUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FDiagram.SelectedLinkCount > 0;
end;

procedure TDMEasyWorkFlowActions.acAutomaticNodesUpdate(Sender: TObject);
begin
  acAutomaticNodes.Checked := FDiagram.AutomaticNodes;
end;

procedure TDMEasyWorkFlowActions.acGroupUpdate(Sender: TObject);
begin
  acGroup.Enabled := (FDiagram <> nil) and (FDiagram.SelectedCount(cfIgnoreMembers) > 1);
end;

procedure TDMEasyWorkFlowActions.acUngroupUpdate(Sender: TObject);
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
  acUngroup.Enabled := Ok;
end;

procedure TDMEasyWorkFlowActions.acBoldExecute(Sender: TObject);
begin
  SwitchSelectedFontStyle(fsBold, not acBold.Checked);
end;

procedure TDMEasyWorkFlowActions.acItalicExecute(Sender: TObject);
begin
  SwitchSelectedFontStyle(fsItalic, not acItalic.Checked);
end;

procedure TDMEasyWorkFlowActions.acUnderlineExecute(Sender: TObject);
begin
  SwitchSelectedFontStyle(fsUnderline, not acUnderline.Checked);
end;

procedure TDMEasyWorkFlowActions.acAlignLeftExecute(Sender: TObject);
begin
  SetSelectedAlignment(taLeftJustify);
end;

procedure TDMEasyWorkFlowActions.acAlignCenterExecute(Sender: TObject);
begin
  SetSelectedAlignment(taCenter);
end;

procedure TDMEasyWorkFlowActions.acAlignRightExecute(Sender: TObject);
begin
  SetSelectedAlignment(taRightJustify);
end;

procedure TDMEasyWorkFlowActions.acVertAlignTopExecute(Sender: TObject);
begin
  SetSelectedVertAlign(vaTop);
end;

procedure TDMEasyWorkFlowActions.acVertAlignMiddleExecute(Sender: TObject);
begin
  SetSelectedVertAlign(vaCenter);
end;

procedure TDMEasyWorkFlowActions.acVertAlignBottomExecute(Sender: TObject);
begin
  SetSelectedVertAlign(vaBottom);
end;

procedure TDMEasyWorkFlowActions.acBoldUpdate(Sender: TObject);
begin
  acBold.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acBold.Checked := (FirstCellSelected <> nil) and (fsBold in FirstCellSelected.Font.Style);
end;

procedure TDMEasyWorkFlowActions.acItalicUpdate(Sender: TObject);
begin
  acItalic.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acItalic.Checked := (FirstCellSelected <> nil) and (fsItalic in FirstCellSelected.Font.Style);
end;

procedure TDMEasyWorkFlowActions.acUnderlineUpdate(Sender: TObject);
begin
  acUnderline.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acUnderline.Checked := (FirstCellSelected <> nil) and (fsUnderline in FirstCellSelected.Font.Style);
end;

procedure TDMEasyWorkFlowActions.acAlignLeftUpdate(Sender: TObject);
begin
  acAlignLeft.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acAlignLeft.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.Alignment = taLeftJustify);
end;

procedure TDMEasyWorkFlowActions.acAlignCenterUpdate(Sender: TObject);
begin
  acAlignCenter.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acAlignCenter.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.Alignment = taCenter);
end;

procedure TDMEasyWorkFlowActions.acAlignRightUpdate(Sender: TObject);
begin
  acAlignRight.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acAlignRight.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.Alignment = taRightJustify);
end;

procedure TDMEasyWorkFlowActions.acVertAlignTopUpdate(Sender: TObject);
begin
  acVertAlignTop.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acVertAlignTop.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.VertAlign = vaTop);
end;

procedure TDMEasyWorkFlowActions.acVertAlignMiddleUpdate(Sender: TObject);
begin
  acVertAlignMiddle.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acVertAlignMiddle.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.VertAlign = vaCenter);
end;

procedure TDMEasyWorkFlowActions.acVertAlignBottomUpdate(Sender: TObject);
begin
  acVertAlignBottom.Enabled := (FDiagram <> nil) and (FirstCellSelected <> nil);
  acVertAlignBottom.Checked := (FirstCellSelected <> nil) and (FirstCellSelected.VertAlign = vaBottom);
end;

procedure TDMEasyWorkFlowActions.DiagramModified(Sender: TObject);
begin
  SetModified(True);
end;

function TDMEasyWorkFlowActions.FirstCellSelected: TTextCell;
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

procedure TDMEasyWorkFlowActions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(FOldFormClose) then
    FOldFormClose(Sender, Action);
end;

procedure TDMEasyWorkFlowActions.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Modified then
  begin
    Case MessageDlg('是否保存对当前流程图的更改?', mtInformation,
      [mbYes, mbNo, mbCancel], 0) of
      mrYes:
        begin
          acSaveDiagram.Execute;
          CanClose := not Modified;
        end;
      mrNo:
        CanClose := true;
      mrCancel:
        CanClose := false;
    end;
  end else
    CanClose := true;
end;

procedure TDMEasyWorkFlowActions.SetActionsDiagram(
  ActionList: TActionList);
var
  c: integer;
begin
  for c := 0 to ActionList.ActionCount - 1 do
    if ActionList.Actions[c] is TDiagramAction then
      TDiagramAction(ActionList.Actions[c]).Diagram := FDiagram;
end;

procedure TDMEasyWorkFlowActions.SetSelectedAlignment(AAlign: TAlignment);
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

procedure TDMEasyWorkFlowActions.SetSelectedVertAlign(AAlign: TVertAlign);
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

procedure TDMEasyWorkFlowActions.SwitchSelectedFontStyle(
  AStyle: TFontStyle; AInclude: boolean);

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

procedure TDMEasyWorkFlowActions.TabControlChange(Sender: TObject);
begin
  if (FTabControl <> nil) and (FToolbar <> nil) then
  begin
    if (FTabControl.TabIndex = 0) or (FTabControl.Tabs.Count <= 0) then
      FToolbar.Category := ''
    else
      FToolbar.Category := FTabControl.Tabs[FTabControl.TabIndex];
  end;
end;

end.
