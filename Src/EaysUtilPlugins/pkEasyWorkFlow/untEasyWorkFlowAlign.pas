unit untEasyWorkFlowAlign;

interface

uses
  Windows, SysUtils, Classes, ActnList, atDiagram, Graphics;

Type
  TEasyWorkFlowBlocksAlignment = (baLeft, baRight, baTop,baBottom,
                      baHorzCenter, baVertCenter,
                      baSameWidth, baSameHeight, baSameSize,
                      baSameSpaceHorz, baSameSpaceVert,
                      baIncHorzSpace, baIncrVertSpace,
                      baDecHorzSpace, baDecVertSpace);

  TEasyWorkFlowDiagramAction = class(TAction)
  private
    FDiagram: TatDiagram;
    procedure SetDiagram(Value: TatDiagram);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  published
    property Diagram: TatDiagram read FDiagram write SetDiagram;
  end;
  
  TBlockList = class(TList)
  private
    function GetBlock(index: integer): TCustomDiagramBlock;
    function GetFirst: TCustomDiagramBlock;
  public
    property Blocks[index : integer] : TCustomDiagramBlock read GetBlock; default;
    property Champion : TCustomDiagramBlock read GetFirst;
  end;

  TBlockSort = (bsNone, bsByX, bsByY);

  {TEasyWorkFlowDiagramAlign class was first a contribution from David Nardella}
  TEasyWorkFlowDiagramAlign = class(TEasyWorkFlowDiagramAction)
  private
    FBlockAlignment: TEasyWorkFlowBlocksAlignment;
    FDefaultAlignment: TEasyWorkFlowDiagramAlign;
    FList : TBlockList;
    procedure GetSelection;
    procedure SortByX;
    procedure SortByY;
    procedure AlignLeft;
    procedure AlignRight;
    procedure AlignTop;
    procedure AlignBottom;
    procedure AlignHorzCenter;
    procedure AlignVertCenter;
    procedure SameWidth;
    procedure SameHeight;
    procedure SameSize;
    procedure SameSpaceHorz;
    procedure SameSpaceVert;
    procedure IncHorzSpace;
    procedure IncVertSpace;
    procedure DecHorzSpace;
    procedure DecVertSpace;
    procedure SetBlockAlignment(const Value: TEasyWorkFlowBlocksAlignment);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: boolean; override;
    function Update: boolean; override;
  published
    property DefaultAlignment : TEasyWorkFlowDiagramAlign read FDefaultAlignment write FDefaultAlignment;
    property BlockAlignment : TEasyWorkFlowBlocksAlignment read FBlockAlignment write SetBlockAlignment;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterActions('EasyWorkFlowAlign', [TEasyWorkFlowDiagramAlign], TEasyWorkFlowDiagramAlign);
end;

resourcestring
sAlignleftedges =          '左对齐';
sAlignrightedges =         '右对齐';
sAligntopedges =           '上对齐';
sAlignbottomedges =         '下对齐';
sAlignhorizontalcenters =   '水平中心对齐';
sAlignverticalcenters =     '垂直中心对齐';
sMakesamewidth =            '等宽';
sMakesameheight =           '等高';
sMakesamesize =             '等尺寸';
sSpaceequallyhorizontally = '水平等分';
sSpaceequallyvertically =   '垂直等分';
sIncrementhorizontalspace = '增加水平间距';
sIncrementverticalspace =   '增加垂直间距';
sDecrementhorizontalspace = '减小水平间距';
sDecrementverticalspace =   '减小垂直间距';

const
  AlignCaptions : Array[TEasyWorkFlowBlocksAlignment] of String = (
                  sAlignleftedges,
                  sAlignrightedges,
                  sAligntopedges,
                  sAlignbottomedges,
                  sAlignhorizontalcenters,
                  sAlignverticalcenters,
                  sMakesamewidth,
                  sMakesameheight,
                  sMakesamesize,
                  sSpaceequallyhorizontally,
                  sSpaceequallyvertically,
                  sIncrementhorizontalspace,
                  sIncrementverticalspace,
                  sDecrementhorizontalspace,
                  sDecrementverticalspace);

  AlignHints : Array[TEasyWorkFlowBlocksAlignment] of String = (
                  '左对齐',
                  '右对齐',
                  '上对齐',
                  '下对齐',
                  '水平中心对齐',
                  '垂直中心对齐',
                  '等宽',
                  '等高',
                  '等尺寸',
                  '水平等分',
                  '垂直等分',
                  '增加水平间距',
                  '增加垂直间距',
                  '减小水平间距',
                  '减小垂直间距');

{ TEasyWorkFlowDiagramAction }

procedure TEasyWorkFlowDiagramAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Diagram) then
    Diagram := nil;
end;

procedure TEasyWorkFlowDiagramAction.SetDiagram(Value: TatDiagram);
begin
  if Value <> FDiagram then
  begin
    FDiagram := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

                  
{ TBlockList }

function TBlockList.GetBlock(index: integer): TCustomDiagramBlock;
begin
  {$WARNINGS OFF}
  Result := TCustomDiagramBlock(Items[index]);
  {$WARNINGS ON}
end;

function TBlockList.GetFirst: TCustomDiagramBlock;
begin
  Result:=Blocks[0];
end;

{ TEasyWorkFlowDiagramAlign }

procedure TEasyWorkFlowDiagramAlign.AlignBottom;
Var
  c,b : integer;
begin
  b:=FList.Champion.Bottom;
  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoMove in FList[c].Restrictions) then
         FList[c].Top:=b-FList[c].Height;
end;

procedure TEasyWorkFlowDiagramAlign.AlignHorzCenter;
Var
  c,hc : integer;
begin
  with FList.Champion do
    hc:=Left+Width div 2;

  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoMove in FList[c].Restrictions) then
        FList[c].Left:=hc-(FList[c].Width div 2);
end;

procedure TEasyWorkFlowDiagramAlign.AlignVertCenter;
Var
  c,vc : integer;
begin
  with FList.Champion do
    vc:=Top+Height div 2;

  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoMove in FList[c].Restrictions) then
        FList[c].Top:=vc-(FList[c].Height div 2);
end;

procedure TEasyWorkFlowDiagramAlign.AlignLeft;
Var
  c : integer;
begin
  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoMove in FList[c].Restrictions) then
        FList[c].Left:=FList.Champion.Left;
end;

procedure TEasyWorkFlowDiagramAlign.AlignRight;
Var
  c,r : integer;
begin
  r:=FList.Champion.Right;
  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoMove in FList[c].Restrictions) then
        FList[c].Left:=r-FList[c].Width;
end;

procedure TEasyWorkFlowDiagramAlign.AlignTop;
Var
  c : integer;
begin
  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoMove in FList[c].Restrictions) then
        FList[c].Top:=FList.Champion.Top;
end;

procedure TEasyWorkFlowDiagramAlign.SameWidth;
Var
  c : integer;
begin
  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoResize in FList[c].Restrictions) and
         not (crKeepRatio in FList[c].Restrictions) then
           FList[c].Width:=FList.Champion.Width;
end;

procedure TEasyWorkFlowDiagramAlign.SameHeight;
Var
  c : integer;
begin
  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoResize in FList[c].Restrictions) and
         not (crKeepRatio in FList[c].Restrictions) then
           FList[c].Height:=FList.Champion.Height;
end;

procedure TEasyWorkFlowDiagramAlign.SameSize;
Var
  c : integer;
begin
  with Diagram do
    for c := 0 to FList.Count - 1 do
      if not (crNoResize in FList[c].Restrictions) and
         not (crKeepRatio in FList[c].Restrictions) then
      begin
        FList[c].Width:=FList.Champion.Width;
        FList[c].Height:=FList.Champion.Height;
      end;
end;

procedure TEasyWorkFlowDiagramAlign.SameSpaceHorz;
Var
  c, Gap : integer;
  TotW   : integer;
begin
  // User can select blocks randomly so we need to sort them
  SortByX;

  TotW:=0;
  for c := 0 to FList.Count - 1 do
    inc(TotW,FList[c].Width);

  with FList do
    Gap:= Round((Blocks[Count-1].Right - Blocks[0].Left - TotW) / (Count-1));

  for c := 1 to FList.Count - 2 do
    FList[c].Left:=FList[c-1].Right+Gap;
end;

procedure TEasyWorkFlowDiagramAlign.SameSpaceVert;
Var
  c, Gap : integer;
  TotH   : integer;
begin
  // User can select blocks randomly so we need to sort them
  SortByY;

  TotH:=0;
  for c := 0 to FList.Count - 1 do
    inc(TotH,FList[c].Height);

  with FList do
    Gap:= Round((Blocks[Count-1].Bottom - Blocks[0].Top - TotH) / (Count-1));

  for c := 1 to FList.Count - 2 do
    FList[c].Top:=FList[c-1].Bottom+Gap;
end;

procedure TEasyWorkFlowDiagramAlign.IncHorzSpace;
Var
  Step : integer;
begin
  SortByX;
  Step:=Round(Diagram.SnapGrid.SizeX*Diagram.Zoom/100.0);
  with FList[FList.Count-1] do
    Left:=Left+Step;
  SameSpaceHorz;
end;

procedure TEasyWorkFlowDiagramAlign.IncVertSpace;
Var
  Step : integer;
begin
  SortByY;
  Step:=Round(Diagram.SnapGrid.SizeY*Diagram.Zoom/100.0);
  with FList[FList.Count-1] do
    Top:=Top+Step;
  SameSpaceVert;
end;

procedure TEasyWorkFlowDiagramAlign.DecHorzSpace;
Var
  Step : integer;
begin
  SortByX;
  Step:=Round(Diagram.SnapGrid.SizeX*Diagram.Zoom/100.0);
  with FList[FList.Count-1] do
  begin
    Left:=Left-Step;
    if Left<=FList.Champion.Left then
      AlignLeft
    else
      SameSpaceHorz;
  end;
end;

procedure TEasyWorkFlowDiagramAlign.DecVertSpace;
Var
  Step : integer;
begin
  SortByY;
  Step:=Round(Diagram.SnapGrid.SizeY*Diagram.Zoom/100.0);
  with FList[FList.Count-1] do
  begin
    Top:=Top-Step;
    if Top<=FList.Champion.Top then
      AlignTop
    else
      SameSpaceVert;
  end;
end;

function TEasyWorkFlowDiagramAlign.Execute: boolean;
begin
  GetSelection;
  if FList.Count > 1 then
  begin
    Case FBlockAlignment of
      baLeft : AlignLeft;
      baRight : AlignRight;
      baTop : AlignTop;
      baBottom : AlignBottom;
      baHorzCenter : AlignHorzCenter;
      baVertCenter : AlignVertCenter;
      baSameWidth : SameWidth;
      baSameHeight : SameHeight;
      baSameSize : SameSize;
      baSameSpaceHorz : SameSpaceHorz;
      baSameSpaceVert : SameSpaceVert;
      baIncHorzSpace  : IncHorzSpace;
      baIncrVertSpace : IncVertSpace;
      baDecHorzSpace  : DecHorzSpace;
      baDecVertSpace  : DecVertSpace;
    end;
    Diagram.PushUndoStack('Align');
    if Assigned(FDefaultAlignment) and (FDefaultAlignment <> self) then
    begin
      // Properties reflection
      FDefaultAlignment.BlockAlignment:=FBlockAlignment;
      FDefaultAlignment.ImageIndex:=ImageIndex;
      FDefaultAlignment.Caption:=Caption;
      FDefaultAlignment.Hint:=Hint;
    end;
  end;
  result := True;
end;

function TEasyWorkFlowDiagramAlign.Update: boolean;
begin
  if FBlockAlignment in [baSameSpaceHorz..baDecVertSpace] then
    Enabled := (Diagram <> nil) and (Diagram.SelectedBlockCount(cfIgnoreMembers) > 2) // we need at least 3 blocks
  else
    Enabled := (Diagram <> nil) and (Diagram.SelectedBlockCount(cfIgnoreMembers) > 1);

  result := true;
end;

procedure TEasyWorkFlowDiagramAlign.SetBlockAlignment(const Value: TEasyWorkFlowBlocksAlignment);
begin
  if FBlockAlignment <> Value then
  begin
    FBlockAlignment := Value;
    Caption:=AlignCaptions[FBlockAlignment];
    Hint:=AlignHints[FBlockAlignment];
  end;
end;

procedure TEasyWorkFlowDiagramAlign.SortByX;

  function XSort : boolean;
  Var
    c : integer;
  begin
    Result:=true;
    for c := 0 to FList.Count - 2 do
      if Flist[c].Left>Flist[c+1].Left then
      begin
        Result:=false;
        FList.Exchange(C,C+1);
      end;
  end;

begin
  Repeat
  Until XSort;
end;

procedure TEasyWorkFlowDiagramAlign.SortByY;

  function YSort : boolean;
  Var
    c : integer;
  begin
    Result:=true;
    for c := 0 to FList.Count - 2 do
      if Flist[c].Top>Flist[c+1].Top then
      begin
        Result:=false;
        FList.Exchange(C,C+1);
      end;
  end;

begin
  Repeat
  Until YSort;
end;

constructor TEasyWorkFlowDiagramAlign.Create(AOwner: TComponent);
begin
  inherited;
  FList:=TBlockList.Create;
  BlockAlignment:=baHorzCenter;
end;

destructor TEasyWorkFlowDiagramAlign.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TEasyWorkFlowDiagramAlign.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDefaultAlignment) then
    DefaultAlignment := nil;
end;

procedure TEasyWorkFlowDiagramAlign.GetSelection;
Var
  c : integer;
begin
  FList.Clear;
  for c := 0 to Diagram.SelectedCount - 1 do if not Diagram.Selecteds[c].IsMember then
  begin
    if Diagram.Selecteds[c].InheritsFrom(TCustomDiagramBlock) then
      FList.Add(Diagram.Selecteds[c]);
  end;
end;

end.

