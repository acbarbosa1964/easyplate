unit untEasyWorkFlowDiagramPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, atDiagram, Buttons, StdCtrls, Menus;

type
  TPagePreview = class(TCustomControl)
  private
    FPage: TGraphic;
  protected
    procedure WMEraseBkGnd(var Message: TWMEraseBkGnd); message WM_ERASEBKGND;
    procedure Paint; override;
  public
    destructor Destroy; override;
  end;

  TfrmEasyWorkFlowDiagramPreview = class(TForm)
    ScrollBox1: TScrollBox;
    pnToolbar: TPanel;
    btPreviousPage: TSpeedButton;
    btNextPage: TSpeedButton;
    btPrint: TSpeedButton;
    btZoom: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pmZoom: TPopupMenu;
    N5001: TMenuItem;
    N2001: TMenuItem;
    N1501: TMenuItem;
    N1001: TMenuItem;
    N751: TMenuItem;
    N501: TMenuItem;
    N251: TMenuItem;
    N101: TMenuItem;
    pnPage: TPanel;
    PrintDialog1: TPrintDialog;
    procedure btPreviousPageClick(Sender: TObject);
    procedure btNextPageClick(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure btZoomClick(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    FPrinterRes: TPoint;
    FDiagram: TatDiagram;
    FZoomRatio: double;
    FCurPage: integer;
    FPagePreview: TPagePreview;
    procedure UpdateImagePlacement;
    procedure Redraw;
    procedure SetDiagram(const Value: TatDiagram);
    procedure UpdateZoomCaption;
    procedure UpdatePageCaption;
    procedure UpdatePrinterInfo;
    procedure CalculateImageSize;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Diagram: TatDiagram read FDiagram write SetDiagram;
  end;

implementation
uses Printers, Math;

{$R *.dfm}

resourcestring
  SPageCount = 'ҳ %d/%d';

procedure TfrmEasyWorkFlowDiagramPreview.Redraw;
begin
  UpdatePageCaption;
  UpdateZoomCaption;
  CalculateImageSize;
  UpdateImagePlacement;
  {$WARNINGS OFF}
  if FPagePreview.FPage <> nil then
    FPagePreview.FPage.Free;
  FPagePreview.FPage := FDiagram.BuildPreviewBitmap(FCurPage,
    FPagePreview.Width - 5, FPagePreview.Height - 5);
  //FPagePreview.FPage := FDiagram.BuildPreviewMetafile(FCurPage);
  {$WARNINGS ON}
  FPagePreview.Invalidate;
end;

procedure TfrmEasyWorkFlowDiagramPreview.UpdateImagePlacement;
const
  Margin = 6;
begin
  ScrollBox1.HorzScrollBar.Position := 0;
  ScrollBox1.VertScrollBar.Position := 0;
  if FPagePreview.Width < (ScrollBox1.ClientWidth - 2 * Margin) then
    FPagePreview.Left := (ScrollBox1.ClientWidth - FPagePreview.Width) div 2
  else
    FPagePreview.Left := Margin;
  if FPagePreview.Height < (ScrollBox1.ClientHeight - 2 * Margin) then
    FPagePreview.Top := (ScrollBox1.ClientHeight - FPagePreview.Height) div 2
  else
    FPagePreview.Top := Margin;
end;

procedure TfrmEasyWorkFlowDiagramPreview.CalculateImageSize;

  function ConvToPreview(X, Y: integer): TPoint;
  begin
    result.X := Round(X * FZoomRatio * Screen.PixelsPerInch / FPrinterRes.X);
    result.Y := Round(Y * FZoomRatio * Screen.PixelsPerInch / FPrinterRes.Y);
  end;

var
  P: TPoint;
begin
  P := ConvToPreview(Printer.PageWidth, Printer.PageHeight);
  FPagePreview.Width := P.X + 5;
  FPagePreview.Height := P.Y + 5;
end;

procedure TfrmEasyWorkFlowDiagramPreview.UpdatePrinterInfo;
begin
  FPrinterRes.X := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
  FPrinterRes.Y := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
end;

constructor TfrmEasyWorkFlowDiagramPreview.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPagePreview := TPagePreview.Create(Self);
  FPagePreview.FPage := nil;
  FZoomRatio := 1;
  FCurPage := 1;
  UpdatePrinterInfo;
end;

destructor TfrmEasyWorkFlowDiagramPreview.Destroy;
begin
  FPagePreview.Free;
  inherited;
end;

procedure TfrmEasyWorkFlowDiagramPreview.btPreviousPageClick(Sender: TObject);
begin
  if FCurPage > 1 then
    Dec(FCurPage);
  Redraw;
end;

procedure TfrmEasyWorkFlowDiagramPreview.btNextPageClick(Sender: TObject);
begin
  if FCurPage < Diagram.PageCount then
    Inc(FCurPage);
  Redraw;
end;

procedure TfrmEasyWorkFlowDiagramPreview.btPrintClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
    Diagram.Print;
end;

procedure TfrmEasyWorkFlowDiagramPreview.UpdateZoomCaption;
begin
  btZoom.Caption := Format('%d%%',[Trunc(FZoomRatio * 100)]);
end;

procedure TfrmEasyWorkFlowDiagramPreview.UpdatePageCaption;
begin
  pnPage.Caption := Format(SPageCount, [FCurPage, Diagram.PageCount]);
end;

procedure TfrmEasyWorkFlowDiagramPreview.SetDiagram(const Value: TatDiagram);
begin
  FDiagram := Value;
  FCurPage := 1;
  FZoomRatio := 1;
  Redraw;
end;

procedure TfrmEasyWorkFlowDiagramPreview.btZoomClick(Sender: TObject);
var
  P: TPoint;
begin
  P := pnToolbar.ClientToScreen(Point(btZoom.Left, btZoom.Top + btZoom.Height + 1));
  pmZoom.Popup(P.X, P.Y);
end;

procedure TfrmEasyWorkFlowDiagramPreview.N101Click(Sender: TObject);
begin
  FZoomRatio := TMenuItem(Sender).Tag / 100;
  Redraw;
end;

procedure TfrmEasyWorkFlowDiagramPreview.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEasyWorkFlowDiagramPreview.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  FPagePreview.Parent := ScrollBox1;
end;

{ TPagePreview }

destructor TPagePreview.Destroy;
begin
  if FPage <> nil then
  begin
    FPage.Free;
    FPage := nil;
  end;
  inherited;
end;

procedure TPagePreview.Paint;
var
  R, PR: TRect;
  Region: THandle;
begin
  with PR do
  begin
    Left := 1;
    Top := 1;
    Right := Width - 4;
    Bottom := Height - 4;
  end;
  with Canvas do
  begin
    Pen.Mode := pmCopy;
    Pen.Width := 1;
    Pen.Style := psInsideFrame;
    Pen.Color := clBlue;
    Brush.Style := bsClear;
    Rectangle(0, 0, Width - 3, Height - 3);
    Brush.Style := bsSolid;
    Brush.Color := clBlack;
    SetRect(R, Width - 3, 3, Width, Height);
    FillRect(R);
    SetRect(R, 3, Height - 3, Width, Height);
    FillRect(R);
    Brush.Color := Color;
    SetRect(R, Width - 3, 0, Width, 3);
    FillRect(R);
    SetRect(R, 0, Height - 3, 3, Height);
    FillRect(R);
    {Brush.Style := bsSolid;
    Brush.Color := clWhite;
    FillRect(PR);}
  end;
  Region := CreateRectRgn(PR.Left, PR.Top, PR.Right, PR.Bottom);
  SelectClipRgn(Canvas.Handle, Region);
  DeleteObject(Region);
  try
    if FPage <> nil then
      Canvas.StretchDraw(PR, FPage);

  finally
    SelectClipRgn(Canvas.Handle, 0);
  end;
end;

procedure TPagePreview.WMEraseBkGnd(var Message: TWMEraseBkGnd);
begin
  Message.Result := 1;
end;

procedure TfrmEasyWorkFlowDiagramPreview.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ABar: TControlScrollBar;
  APage: integer;
begin
  if ssShift in Shift then
  begin
    ABar := ScrollBox1.HorzScrollBar;
    APage := ScrollBox1.Width;
  end
  else
  begin
    ABar := ScrollBox1.VertScrollBar;
    APage := ScrollBox1.Height;
  end;
  Case Key of
    VK_PRIOR:
      ABar.Position := ABar.Position - APage;
    VK_NEXT:
      ABar.Position := ABar.Position + APage;
    VK_HOME:
      ABar.Position := 0;
    VK_END:
      ABar.Position := ABar.Range;
    VK_UP:
      With ScrollBox1.VertScrollBar do
        ABar.Position := ABar.Position - ABar.Increment;
    VK_DOWN:
      With ScrollBox1.VertScrollBar do
        ABar.Position := ABar.Position + ABar.Increment;
    VK_LEFT:
      With ScrollBox1.HorzScrollBar do
        ABar.Position := ABar.Position - ABar.Increment;
    VK_RIGHT:
      With ScrollBox1.HorzScrollBar do
        ABar.Position := ABar.Position + ABar.Increment;
  end;
end;

procedure TfrmEasyWorkFlowDiagramPreview.FormResize(Sender: TObject);
begin
  UpdateImagePlacement;
end;

end.
