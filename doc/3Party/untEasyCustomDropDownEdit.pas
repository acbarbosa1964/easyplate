{------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7
//                         一轩软研第三方开发包                         
//                         @Copyright 2009 hehf                      
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
// EasyComponents是HhfComponents的升级版本，当前主版本号为2.0                                                                            
------------------------------------------------------------------------------}
{
  2011-04-09 22:27:29
  * TEasyCustomDropDownEdit的基类从TEasyCustomLabelEdit开始，具有Label、BorderColor等属性
    并增加右侧的下拉按钮
}
unit untEasyCustomDropDownEdit;

interface

uses
  Windows, Messages, StdCtrls, Classes, Graphics, Controls, SysUtils, Forms,
  Math, ComObj, untEasyAbout, untEasyEdit, unEasyComboBox;

type
  TEasyCustomDropDownEdit = class(TEasyCustomLabelEdit)
  private
    FAutoFocus      : boolean;
    FOnMouseEnter   : TNotifyEvent;
    FOnMouseLeave   : TNotifyEvent;
    FOnButtonClick  : TNotifyEvent;
    FMouseInControl : Boolean;
    FFlat           : Boolean;
    FButton         : TDgrComboBtn;   //下拉按钮
    FOldCursor      : TCursor;        //鼠标状态

    FAppereanceStyle: TEasyComboStyle;
    FSelectionColor : TColor;
    FSelectionColorTo      : TColor;
    FSelectionGradient     : TSelectionGradient;
    function GetButtonRect: TRect;
    procedure DrawButton(DC: HDC); overload;
    procedure DrawButton; overload;

    procedure DrawBorders(DC: HDC); overload;
    procedure DrawBorders; overload;
    
    procedure ButtonOnChange(Sender: TObject);
    procedure WMMouseMove(var Msg: TWMMouse); message WM_MOUSEMOVE;
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
    procedure WMLButtonDown(var Msg: TWMMouse); message WM_LBUTTONDOWN;
    procedure SetFlat(const Value: Boolean);
    procedure SetAppereanceStyle(const Value: TEasyComboStyle);
    procedure SetButton(const Value: TDgrComboBtn);
    procedure SetSelectionColor(const Value: TColor);
    procedure SetSelectionColorTo(const Value: TColor);
    procedure SetSelectionGradient(const Value: TSelectionGradient);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SetEditRect;
    procedure Loaded; override;
    procedure DoEnter; override;
    procedure DrawArrow(ArP: TPoint; ArClr: TColor); virtual;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    property About;
    property Anchors;
    property EnterTAB;
    property Color;
    property BorderColor;
    property FocusColor;

    property AutoFocus: boolean read FAutoFocus write fAutoFocus default false;
    property AppereanceStyle: TEasyComboStyle read FAppereanceStyle write SetAppereanceStyle;
    property Button: TDgrComboBtn read FButton write SetButton;
    property Flat: Boolean read FFlat write SetFlat;

    property TextRightAlign;
    property EditLabel;
    property LabelPosition;
    property LabelSpacing;
    
    property SelectionColor: TColor read FSelectionColor write SetSelectionColor;
    property SelectionColorTo: TColor read FSelectionColorTo write SetSelectionColorTo default clNone;
    property SelectionGradient: TSelectionGradient read FSelectionGradient write SetSelectionGradient default sgVerticalInOut;

    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;
  end;

  TEasyDropDownEdit = class(TEasyCustomDropDownEdit)
  published
    property Anchors;
    property EnterTAB;
    property BorderColor;
    property Color;
    property FocusColor;

    property AutoFocus;
    property AppereanceStyle;
    property Button;
    property Flat;

    property TextRightAlign;
    property EditLabel;
    property LabelPosition;
    property LabelSpacing;

    property SelectionColor;
    property SelectionColorTo;
    property SelectionGradient;

    property OnMouseEnter;
    property OnMouseLeave;
    property OnButtonClick;
  end;
  
implementation

{ TEasyCustomDropDownEdit }

procedure TEasyCustomDropDownEdit.CMMouseEnter(var Msg: TMessage);
var
  DC: HDC;
begin
  inherited;

  if (csDesigning in ComponentState) then
    Exit;

  if FAutoFocus then
    SetFocus;
    
  if not FMouseInControl and Enabled then
  begin
    FMouseInControl := True;
    DC := GetDC(Handle);

    DrawButton(DC);
    DrawBorders(DC);

    ReleaseDC(Handle, DC);
  end;
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TEasyCustomDropDownEdit.CMMouseLeave(var Message: TMessage);
begin
  if FMouseInControl and Enabled then
  begin
    FMouseInControl := False;
    Invalidate;
  end;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

constructor TEasyCustomDropDownEdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FButton := TDgrComboBtn.Create;
  FButton.OnChange := ButtonOnChange;

  FMouseInControl := false;
  FFlat := true;
  
  FSelectionColor := clHighlight;
  FSelectionColorTo := clNone;
  FSelectionGradient := sgVerticalInOut;

  AppereanceStyle := esOffice2003Classic;//esOffice2003Blue;
  FOldCursor := Cursor;
end;

destructor TEasyCustomDropDownEdit.Destroy;
begin
  FButton.Free;
  inherited Destroy;
end;

procedure TEasyCustomDropDownEdit.DrawButton(DC: HDC);
var
  Canvas: TCanvas;
  BtnR: TRect;
  P: TPoint;
  l, t: integer;

//  procedure DrawArrow(ArP: TPoint; ArClr: TColor);
//  begin
//    Canvas.Pen.Color := ArClr;
//    Canvas.MoveTo(ArP.X, ArP.Y);
//    Canvas.LineTo(ArP.X + 5, ArP.Y);
//    Canvas.MoveTo(ArP.X + 1, ArP.Y + 1);
//    Canvas.LineTo(ArP.X + 4, ArP.Y + 1);
//    Canvas.Pixels[ArP.X + 2, ArP.Y + 2] := ArClr;
//  end;

begin
  Canvas := TCanvas.Create;
  Canvas.Handle := DC;

  BtnR := GetButtonRect;

  P.X := BtnR.Left + ((BtnR.Right - BtnR.Left - 5) div 2) + 1;
  P.Y := BtnR.Top + ((BtnR.Bottom - BtnR.Top - 3) div 2) + 1;

  if Flat then
  begin
    if (FMouseInControl or self.Focused) and not (csDesigning in ComponentState) then
    begin
      if FButton.ColorHot <> clNone then
        DrawGradient(Canvas, FButton.ColorHot, FButton.ColorHotTo, 16, BtnR, false);

      if not FButton.GlyphHot.Empty then
      begin
        t := ((BtnR.Bottom - BtnR.Top) - FButton.GlyphHot.Height) div 2 + 1;
        l := ((BtnR.Right - BtnR.Left) - FButton.GlyphHot.Width) div 2;
        FButton.GlyphHot.Transparent := true;
        Canvas.Draw(BtnR.Left + l, BtnR.Top + t, FButton.GlyphHot);
      end
      else
        DrawArrow(P, FButton.HotArrowColor);
    end
    else
    begin
      if FButton.Color <> clNone then
        DrawGradient(Canvas, FButton.Color, FButton.ColorTo, 16, BtnR, false);

      if not FButton.Glyph.Empty then
      begin
        t := ((BtnR.Bottom - BtnR.Top) - FButton.Glyph.Height) div 2 + 1;
        l := ((BtnR.Right - BtnR.Left) - FButton.Glyph.Width) div 2;
        FButton.Glyph.Transparent := true;
        Canvas.Draw(BtnR.Left + l, BtnR.Top + t, FButton.Glyph);
      end
      else
        DrawArrow(P, FButton.ArrowColor);
    end;
  end
  else
  begin
  end;
  Canvas.Free;
end;

procedure TEasyCustomDropDownEdit.DrawBorders(DC: HDC);
var
  Canvas: TCanvas;
  R, BtnR: TRect;
begin
  Canvas := TCanvas.Create;
  Canvas.Handle := DC;

  R := ClientRect;
  BtnR := GetButtonRect;

  if Flat then
  begin
//    if 1 = 2 then
//    begin
//      Canvas.Pen.Color := BorderColor;
//      Canvas.Brush.Style := bsClear;
//      Canvas.Rectangle(R);
//    end
//    else
    begin
      if (BorderColor <> clNone) then
        Canvas.Pen.Color := BorderColor
      else
        Canvas.Pen.Color := self.Color;
      Canvas.Brush.Style := bsClear;
      Canvas.Rectangle(R);
    end;
    Canvas.MoveTo(BtnR.Left - 1, BtnR.Top);
    Canvas.LineTo(BtnR.Left - 1, BtnR.Bottom + 2);
  end;
  Canvas.Free;
end;

procedure TEasyCustomDropDownEdit.DrawBorders;
var
  DC: HDC;
begin
  DC := GetDC(Handle);
  DrawBorders(DC);
  ReleaseDC(Handle, DC);
end;

procedure TEasyCustomDropDownEdit.DrawButton;
var
  DC: HDC;
begin
  DC := GetDC(Handle);
  DrawButton(DC);
  ReleaseDC(Handle, DC);
end;

function TEasyCustomDropDownEdit.GetButtonRect: TRect;
var
  R: TRect;
begin
  R := ClientRect;
  Result := Rect(R.Right - FButton.Width - 1, R.Top + 1, R.Right - 1, R.Bottom - 2);
end;

procedure TEasyCustomDropDownEdit.SetFlat(const Value: Boolean);
begin
  if (csLoading in ComponentState) then
  begin
    FFlat := Value;
    Exit;
  end;

  if FFlat <> Value then
  begin
    FFlat := Value;
    Invalidate;
  end;
end;

procedure TEasyCustomDropDownEdit.WMPaint(var Msg: TWMPaint);
var
  R, BtnR: TRect;
begin
  inherited;
  R := ClientRect;
  BtnR := GetButtonRect;
  if Flat then
  begin
    // Button Painting
    DrawButton;
    // Control and Button Border
    DrawBorders();
  end;
end;

procedure TEasyCustomDropDownEdit.SetAppereanceStyle(
  const Value: TEasyComboStyle);
begin
  if (FAppereanceStyle <> Value) or (1 > 0) then
  begin
    FAppereanceStyle := Value;
    case FAppereanceStyle of
      esOffice2003Blue:
        begin
          FButton.Color := $FCE1CB;
          FButton.ColorTo := $E0A57D;

          FButton.ColorDown := $087FE8;
          FButton.ColorDownTo := $7CDAF7;

          FButton.ColorHot := $DCFFFF;
          FButton.ColorHotTo := $5BC0F7;

          FSelectionColor := $E0A57D;
          BorderColor := $00E0A57D;
        end;
      esOffice2003Olive:
        begin
          FButton.Color := $CFF0EA;
          FButton.ColorTo := $8CC0B1;

          FButton.ColorDown := $087FE8;
          FButton.ColorDownTo := $7CDAF7;

          FButton.ColorHot := $DCFFFF;
          FButton.ColorHotTo := $5BC0F7;

          FSelectionColor := $8CC0B1;

          //BorderColor := $588060;
          BorderColor := $8CC0B1;
        end;
      esOffice2003Silver:
        begin
          FButton.Color := $ECE2E1;
          FButton.ColorTo := $B39698;

          FButton.ColorDown := $087FE8;
          FButton.ColorDownTo := $7CDAF7;

          FButton.ColorHot := $DCFFFF;
          FButton.ColorHotTo := $5BC0F7;

          FSelectionColor := $B39698;
          BorderColor := $B39698;
        end;
      esOffice2003Classic:
        begin
          FButton.Color := clWhite;
          FButton.ColorTo := $C9D1D5;

          FButton.ColorDown := $B59285;
          FButton.ColorDownTo := $B59285;

          FButton.ColorHot := $D2BDB6;
          FButton.ColorHotTo := $D2BDB6;

          FSelectionColor := $B59285;
          BorderColor := $C9D1D5;
        end;
    end;
  end;
end;

procedure TEasyCustomDropDownEdit.SetButton(const Value: TDgrComboBtn);
begin
  if assigned(Value) then
    FButton.Assign(Value);
end;

procedure TEasyCustomDropDownEdit.SetSelectionColor(const Value: TColor);
begin
  if FSelectionColor <> Value then
  begin
    FSelectionColor := Value;
  end;
end;

procedure TEasyCustomDropDownEdit.SetSelectionColorTo(const Value: TColor);
begin
  FSelectionColorTo := Value;
end;

procedure TEasyCustomDropDownEdit.SetSelectionGradient(
  const Value: TSelectionGradient);
begin
  FSelectionGradient := Value;
end;

procedure TEasyCustomDropDownEdit.ButtonOnChange(Sender: TObject);
begin
  Invalidate;
end;

procedure TEasyCustomDropDownEdit.WMLButtonDown(var Msg: TWMMouse);
begin
  inherited;
  if csDesigning in ComponentState then
    Exit;

  if PtInRect(GetButtonRect, point(msg.xpos, msg.ypos)) then
  begin             
    if Assigned(FOnButtonClick) then
      FOnButtonClick(Self);
  end;
end;

procedure TEasyCustomDropDownEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or (ES_MULTILINE);
end;

procedure TEasyCustomDropDownEdit.SetEditRect;
var
  Loc: TRect;
begin
  if csDesigning in ComponentState then
    Exit;

  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));

  Loc.Bottom := ClientHeight + 1; {+1 is workaround for windows paint bug}
  Loc.Right := ClientWidth - FButton.Width - 4;
  if (BorderStyle = bsNone) then
  begin
    Loc.Top := 4;
    Loc.Left := 2;
  end
  else
  begin
    Loc.Top := 1;
    Loc.Left := 1;
  end;

  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
end;

procedure TEasyCustomDropDownEdit.DoEnter;
begin
  inherited;
  SetEditRect;
end;

procedure TEasyCustomDropDownEdit.Loaded;
begin
  inherited Loaded;
  SetEditRect;
end;

procedure TEasyCustomDropDownEdit.DrawArrow(ArP: TPoint; ArClr: TColor);
begin
  Canvas.Pen.Color := ArClr;
  Canvas.MoveTo(ArP.X, ArP.Y);
  Canvas.LineTo(ArP.X + 5, ArP.Y);
  Canvas.MoveTo(ArP.X + 1, ArP.Y + 1);
  Canvas.LineTo(ArP.X + 4, ArP.Y + 1);
  Canvas.Pixels[ArP.X + 2, ArP.Y + 2] := ArClr;
end;

procedure TEasyCustomDropDownEdit.WMMouseMove(var Msg: TWMMouse);
begin
  inherited;
  if PtInRect(GetButtonRect, point(msg.xpos, msg.ypos)) then
  begin
    if (Cursor <> crArrow) then
    begin
      FOldCursor := Cursor;
      Cursor := crArrow;
    end;
  end
  else if (Cursor = crArrow) then
    Cursor := FOldCursor;
end;

end.
