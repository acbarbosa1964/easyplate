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
// +2011-04-10 12:53:43 TEasyCustomMoneyEdit 通过下拉按钮组输入金额信息                                                                   
------------------------------------------------------------------------------}
unit untEasyMoneyEdit;
   //控件在Delphi7下或更高版本下
  {$IFDEF VER150}
  {$ELSE}
    {$DEFINE DELPHI9_LVL}
  {$ENDIF}
{$IFDEF UNICODE}
   {$DEFINE DELPHI9_LVL DELPHI_UNICODE}
{$ENDIF}  
interface

uses
  Windows, Messages, StdCtrls, Classes, Graphics, Controls, SysUtils, Forms,
  Math, ComObj, untEasyAbout, untEasyCustomDropDownEdit, CheckLst, untEasyMenus,
  Buttons;

type
  TEasyCustomMoneyEdit = class;

  {TEasyMoneyTextTabForm}
  TEasyMoneyTextTabForm = class(TForm)
  private
   FButtonWidth : integer;
   FButtonHeight: integer;
   FButtonColor : TColor;
   procedure CMWantSpecialKey(var Msg: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
   procedure WMClose(var Msg:TMessage); message WM_CLOSE;
  protected
   procedure Paint; override;
  public
   constructor Create(aOwner:TComponent); override;
   destructor Destroy; override;
  published
   property ButtonWidth:integer read FButtonWidth write FButtonWidth;
   property ButtonHeight:integer read FButtonHeight write FButtonHeight;
   property ButtonColor:TColor read FButtonColor write FButtonColor;
  end;

  { TEasyCalculatorButton }
  TEasyCalculatorButton = class(TSpeedButton)
  protected
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

    procedure Paint; override;
  end;

  { TEasyCalculatorLook }
  TEasyCalculatorLook = class(TPersistent)
  private
    FButtonBkg: TBitmap;
    FButtonWidth: integer;
    FButtonHeight: integer;
    FButtonColor: TColor;
    FColor: TColor;
    FFont: TFont;
    FFlat: boolean;
    procedure SetFont(const Value: TFont);
    procedure SetButtonBkg(const Value: TBitmap);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property ButtonWidth:integer read FButtonWidth write FButtonWidth;
    property ButtonHeight:integer read FButtonHeight write FButtonHeight;
    property ButtonColor:TColor read FButtonColor write FButtonColor;
    property Color:TColor read FColor write FColor;
    property Flat:boolean read FFlat write FFlat;
    property Font:TFont read FFont write SetFont;
    property ButtonBkg:TBitmap read FButtonBkg write SetButtonBkg;
  end;
  
  { TEasyCustomMoneyEdit }
  TEasyCustomMoneyEdit = class(TEasyCustomDropDownEdit)
  private
    FEditorEnabled: Boolean;
    FOnClickBtn   : TNotifyEvent;
    FCalcForm     : TEasyMoneyTextTabForm;
    FCalcClosed   : Boolean;
    FCloseClick   : Boolean;
    FDecim        : Integer;
    sp            : array[0..22] of TEasyCalculatorButton;
    newval        : boolean;
    prevval       : extended;
    prevop        : integer;
    FCalculatorLook: TEasyCalculatorLook;

    procedure BtnClick(Sender: TObject); virtual;
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    //按钮事件
    procedure NumButtonClick(Sender: TObject);
    //运算函数
    procedure docalc;
    procedure doplus;
    procedure domin;
    procedure domul;
    procedure dodiv;
    procedure doeq;
    procedure doperc;
    //
    procedure BuildCalculator(AForm:TForm);
    function GetValue: extended;
    procedure SetValue(const Value: extended);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure CMExit(var Message: TCMExit);   message CM_EXIT;
    procedure WMPaste(var Message: TWMPaste);   message WM_PASTE;
    procedure WMCut(var Message: TWMCut);   message WM_CUT;
    procedure WMKeyDown(var Msg:TWMKeydown); message WM_KEYDOWN;
    procedure SetCalculatorLook(const Value: TEasyCalculatorLook);
    procedure SetEditorEnabled(const Value: Boolean);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function GetParentForm(Control: TControl): TCustomForm; virtual;
    procedure KeyPress(var key:char); override;

    procedure CalcChange; virtual;
    procedure SetTextDirect(s:string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //显示隐藏
    procedure ShowCalculator;
    procedure HideCalculator;

    property Text;
    property Value:extended read GetValue write SetValue;

    property About;
    property EnterTAB;
    property BorderColor;
    property FocusColor;
    property TextRightAlign;
    property EditLabel;
    property LabelPosition;
    property LabelSpacing;

    property AutoFocus;
    property AppereanceStyle;
    property Button;
    property Flat;

    property Anchors;
    property Constraints;
    property DragKind;
    property AutoSelect;
    property AutoSize;
    property CalculatorLook:TEasyCalculatorLook read FCalculatorLook write SetCalculatorLook;
    property Color;
    property DragCursor;
    property DragMode;
    property EditorEnabled: Boolean read FEditorEnabled write SetEditorEnabled default True;
    property Enabled;
    property Font;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property Height;
    property Width;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnEndDock;
    property OnStartDock;
    property OnClickBtn: TNotifyEvent read FOnClickBtn write FOnClickBtn;
  end;

  { TEasyMoneyEdit }
  TEasyMoneyEdit = class(TEasyCustomMoneyEdit)
  published
    property Text;
    property Value;

    property About;
    property EnterTAB;
    property BorderColor;
    property FocusColor;
    property TextRightAlign;
    property EditLabel;
    property LabelPosition;
    property LabelSpacing;

    property AutoFocus;
    property AppereanceStyle;
    property Button;
    property Flat;

    property Anchors;
    property Constraints;
    property DragKind;
    property AutoSelect;
    property AutoSize;
    property CalculatorLook;
    property Color;
    property DragCursor;
    property DragMode;
    property EditorEnabled;
    property Enabled;
    property Font;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property Height;
    property Width;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnEndDock;
    property OnStartDock;
    property OnClickBtn;
  end;
  
implementation

function StripThousandSep(s:string):string;
begin
  while (Pos(ThousandSeparator,s)>0) do
    Delete(s,Pos(ThousandSeparator,s),1);
  Result := s;
end;

{ TEasyMoneyTextTabForm }

procedure TEasyMoneyTextTabForm.CMWantSpecialKey(
  var Msg: TCMWantSpecialKey);
begin
  inherited;
  if msg.CharCode in [vk_up,vk_down,vk_left,vk_right,vk_tab] then msg.result:=1;
end;

constructor TEasyMoneyTextTabForm.Create(aOwner: TComponent);
begin
  inherited;
//
end;

destructor TEasyMoneyTextTabForm.Destroy;
begin
//
  inherited;
end;

procedure TEasyMoneyTextTabForm.Paint;
var
 i,j: integer;
 r  : trect;
 oldColor:TColor;
begin
  inherited;
  with canvas do
  begin
    pen.color:=clBlack;
    r := GetClientRect;
    Rectangle(r.left,r.top,r.right,r.bottom);

    oldColor := Canvas.Brush.Color;
    Canvas.Brush.Color := ButtonColor;
    Canvas.Pen.Color := ButtonColor;

    for i := 1 to 6 do
      for j := 1 to 4 do
      begin
        if (i=5) and (j<2) then
          Continue;

        if i=6 then
          Continue;

        Rectangle(2+(2+FButtonWidth)*(i-1),2+(2+FButtonHeight)*(j-1),
                (2+FButtonWidth)*(i),(2+FButtonHeight)*(j));
      end;

    Canvas.brush.color:=oldColor;
  end;
end;

procedure TEasyMoneyTextTabForm.WMClose(var Msg: TMessage);
begin
  inherited;
  self.Free;
end;

{ TEasyCalculatorButton }

procedure TEasyCalculatorButton.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Repaint;
end;

procedure TEasyCalculatorButton.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Repaint;
end;

procedure TEasyCalculatorButton.Paint;
var
  hasGlyph: boolean;
  r: TRect;
  s:string;
begin
  hasGlyph := false;

  if Assigned(Glyph) then
    hasGlyph := not Glyph.Empty;

  if not Flat or not hasGlyph then
    inherited
  else
  begin
    s := Trim(Caption);

    if FState = bsDown then
      Canvas.Draw(1,1,Glyph)
    else
      Canvas.Draw(0,0,Glyph);

    r := ClientRect;
    Canvas.Brush.Style := bsClear;

    if FState = bsDown then
      OffsetRect(r,1,1);

    Canvas.Font.Assign(self.Font);

    DrawText(Canvas.Handle, Pchar(s),length(s),r,DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  end;
end;

{ TEasyCustomMoneyEdit }

procedure TEasyCustomMoneyEdit.BtnClick(Sender: TObject);
begin
  if not FCloseClick then
    ShowCalculator;
  FCloseClick := False;
  if Assigned(FOnClickBtn) then
    FOnClickBtn(Sender);
end;

procedure TEasyCustomMoneyEdit.BuildCalculator(AForm: TForm);
var
 i, n         : integer;
 FButtonWidth : integer;
 FButtonHeight: integer;
begin
  FButtonWidth := FCalculatorLook.ButtonWidth;
  FButtonHeight := FCalculatorLook.ButtonHeight;

  n:=5;
  AForm.Width:=4+n*(FButtonWidth+2);
  AForm.Height:=4+4*(FButtonHeight+2);

  for i:=0 to 18 do
  begin
    sp[i] := TEasyCalculatorButton.Create(AForm);

    sp[i].Font.Assign(FCalculatorLook.Font);

    if not FCalculatorLook.ButtonBkg.Empty then
     begin
       sp[i].Glyph:=FCalculatorLook.ButtonBkg;
       sp[i].Spacing:=-(FCalculatorLook.ButtonBkg.Width shr 1)-(FCalculatorLook.Font.Size shr 1);
       sp[i].Margin:=0;
       sp[i].Flat := (FCalculatorLook.Flat) or not FCalculatorLook.ButtonBkg.Empty;;
     end;

    case i of
      0,1,4,7:sp[i].left:=2;
      2,5,8,14:sp[i].left:=2+(FButtonWidth+2);
      3,6,9,15:sp[i].left:=2+2*(FButtonWidth+2);
      10,11,12,13:sp[i].left:=2+3*(FButtonWidth+2);
      16,17,18:sp[i].left:=2+4*(FButtonWidth+2);
    end;

    case i of
      7,8,9,10:sp[i].top:=2;
      4,5,6,11,18:sp[i].top:=2+(FButtonHeight+2);
      1,2,3,12,16:sp[i].top:=2+2*(FButtonHeight+2);
      0,13,14,15,17:sp[i].top:=2+3*(FButtonHeight+2);
    end;

    sp[i].width:=FButtonWidth;
    sp[i].height:=FButtonHeight;

    sp[i].tag:=i;
    sp[i].flat:= (FCalculatorLook.Flat) or not FCalculatorLook.ButtonBkg.Empty;

    case i of
      0..9:sp[i].caption:=inttostr(i)+' ';
      10:sp[i].caption:='+ ';
      11:sp[i].caption:='- ';
      12:sp[i].caption:='* ';
      13:sp[i].caption:='/ ';
      14:sp[i].caption:='+/- ';
      15:sp[i].caption:='. ';
      16:sp[i].caption:='C ';
      17:sp[i].caption:='= ';
      18:sp[i].caption:='% ';
    end;

    sp[i].OnClick := NumButtonClick;
    sp[i].Parent:=AForm;
    sp[i].Visible:=true;
  end;
end;

procedure TEasyCustomMoneyEdit.CalcChange;
begin
//
end;

procedure TEasyCustomMoneyEdit.CMEnter(var Message: TCMGotFocus);
begin
  if AutoSelect and not (csLButtonDown in ControlState) then
    SelectAll;
  inherited;
end;

procedure TEasyCustomMoneyEdit.CMExit(var Message: TCMExit);
begin
  inherited;
//  
end;

constructor TEasyCustomMoneyEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnButtonClick := BtnClick;

  FDecim := 0;
  Text := '0';
  ControlStyle := ControlStyle - [csSetCaption];
  FEditorEnabled := True;
  FCalcClosed := True;
  Enabled := True;
  FCalculatorLook := TEasyCalculatorLook.Create;
//  IndentR := 19;
//  IndentL := 0;
//  EditType := etFloat;
end;

procedure TEasyCustomMoneyEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
    Params.Style := Params.Style or ES_MULTILINE;
end;

procedure TEasyCustomMoneyEdit.CreateWnd;
begin
  inherited;
//
end;

destructor TEasyCustomMoneyEdit.Destroy;
begin
  FCalculatorLook.Free;
  inherited;
end;

procedure TEasyCustomMoneyEdit.DestroyWnd;
begin
  inherited;
//
end;

procedure TEasyCustomMoneyEdit.docalc;
var
 e: extended;
begin
  if Text = '' then
    Text := '0';

  e := strtofloat(StripThousandSep(Text));
  try
    case prevop of
      0:prevval := prevval + e;
      1:prevval := prevval * e;
      2:prevval := prevval - e;
      3:if (e<>0) then prevval:=prevval/e else prevval:=0;
    else
      prevval:=strtofloat(StripThousandSep(Text));
    end;
  except
    prevval:=0;
  end;

  Text:=format('%g',[prevval]);
//  FloatValue := prevval;
  newval := true;
end;

procedure TEasyCustomMoneyEdit.dodiv;
begin
  docalc;
  prevop:=3;
end;

procedure TEasyCustomMoneyEdit.doeq;
begin
  DoCalc;
  if Text = '' then
    Text := '0';

  prevval := strtofloat(StripThousandSep(Text));

  prevop := -1;
end;

procedure TEasyCustomMoneyEdit.domin;
begin
  docalc;
  prevop:=2;
end;

procedure TEasyCustomMoneyEdit.domul;
begin
  docalc;
  prevop:=1;
end;

procedure TEasyCustomMoneyEdit.doperc;
var
 e:extended;
begin
 if Text='' then Text:='0';
 e:=strtofloat(StripThousandSep(Text));

 e:=prevval*e/100;
 Text:=format('%g',[e]);
end;

procedure TEasyCustomMoneyEdit.doplus;
begin
  docalc;
  prevop := 0;
end;

procedure TEasyCustomMoneyEdit.FormDeactivate(Sender: TObject);
var
 pt:tpoint;
 r:trect;
begin
  {check cursor here...}
  getcursorpos(pt);
  pt:=screentoclient(pt);
  r:=clientrect;
  r.left:=r.right-16;
  FCloseClick:=ptinrect(r,pt);
  postmessage((Sender as TForm).Handle,WM_CLOSE,0,0);
end;

procedure TEasyCustomMoneyEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  s:string;
begin
  if key in [vk_F4, vk_tab] then
    Postmessage((Sender as TForm).Handle,WM_CLOSE,0,0);

  if (key = vk_back) then
  begin
    s := Text;
    Delete(s,Length(Text),1);
    if s = '' then
      s := '0';
    Text := s;
  end;
end;

procedure TEasyCustomMoneyEdit.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  CalcChange;
  if Key = DecimalSeparator then
    if (pos(DecimalSeparator,Text)=0) then Text:=Text+DecimalSeparator;

  {$IFNDEF DELPHI_UNICODE}
  if (key in ['0'..'9']) then
  {$ENDIF}
  {$IFDEF DELPHI_UNICODE}
  if character.IsNumber(key) then
  {$ENDIF}
  begin
    if (MaxLength > 0) and (Length(Text) = MaxLength) then
      Exit;
  end;

  case key of
  '0'..'9':
    if (Text = '0') or (newval) then
    begin
      SetTextDirect(key);
      newval := false;
    end
    else
      SetTextDirect(Text + key);
  'c','C':
    begin
      Text := '0';
      prevval := 0;
      newval := true;
      prevop := -1;
    end;
  '+':doplus;
  '/':dodiv;
  '-':domin;
  '*':domul;
  '=':doeq;
  '%':doperc;
  #13:
    begin
      doeq;
      postmessage((Sender as TForm).Handle,WM_CLOSE,0,0);
    end;
  #27:
    postmessage((Sender as TForm).Handle,WM_CLOSE,0,0);
  end;
end;

function TEasyCustomMoneyEdit.GetParentForm(
  Control: TControl): TCustomForm;
begin
  Result := nil;
  if Assigned(Control) then
    if Control is TCustomForm then
    begin
      Result := Control as TCustomForm;
      Exit;
    end else
    begin
      if Assigned(Control.Parent) then
        Result := GetParentForm(Control.Parent);
    end;
end;

function TEasyCustomMoneyEdit.GetValue: extended;
begin
  if Text = '' then
    Text := '0';
  try
    Result := StrToFloat(StripThousandSep(Text));
  except
    Result := 0;
  end;
end;

procedure TEasyCustomMoneyEdit.HideCalculator;
begin
  FCalcForm.Free;
  FCalcform := nil;
end;

procedure TEasyCustomMoneyEdit.KeyPress(var key: char);
begin
  if FCalcClosed or
    (Assigned(FCalcForm) and (FCalcForm.Visible = false)) then
  case key of
  'c','C':begin
            Text:='0';
            newval:=true;
            prevop:=-1;
           end;
  '+':doplus;
  '/':dodiv;
  '-':domin;
  '*':domul;
  '=',#13:doeq;
  '%':doperc;
  end;

  {$IFNDEF DELPHI_UNICODE}
  if not (Key in ['0'..'9',DecimalSeparator,#8,'-']) then key := #0;
  {$ENDIF}
  {$IFDEF DELPHI_UNICODE}
  if not (character.IsNumber(Key) or (Key = DecimalSeparator) or (Key = #8) or (Key = '-')) then key := #0;
  {$ENDIF}

  {$IFNDEF DELPHI_UNICODE}
  if ((Text='0') or (newval)) and (key in ['0'..'9']) then
  {$ENDIF}
  {$IFDEF DELPHI_UNICODE}
  if ((Text='0') or (newval)) and (character.IsNumber(key)) then
  {$ENDIF}
  begin
    Text := Key;
    Key := #0;
    SelStart := 1 + Length('');
    SelLength := 0;
    Newval := False;
    Exit;
  end;

  if (Length(Text) = 1) and (Key = #8) then
  begin
    Text := '0';
    Key := #0;
    SelStart := 1 + Length('');
    SelLength := 0;
    Exit;
  end;

  if (Key = ThousandSeparator) then
  begin
    Key := #0;
  end;

  if (Key = DecimalSeparator) and (Pos(Key,Text)>0) then
  begin
    Key := #0;
  end;

  inherited;
end;

procedure TEasyCustomMoneyEdit.NumButtonClick(Sender: TObject);
var
  s:string;
  e,n:extended;
  f: double;
begin
  CalcChange;

  if ((Sender as TEasyCalculatorButton).Tag in [10..14,16,17,18,19..22]) then
  FDecim := 0;

  if (Integer((Sender as TEasyCalculatorButton).Tag) in [0..9,14,15]) then
  begin
    if (MaxLength > 0) and (Length(Text) = MaxLength) then
      Exit;
  end;

  if ((Sender as TEasyCalculatorButton).Tag < 10) then
  begin
    f := StrToFloatDef(Text, 0.0);
    if ((StrToFloatDef(Text, 0.0) = 0.0 ) and (FDecim = 0)) or (newval) then
    begin
      Text := IntToStr((sender as TEasyCalculatorButton).Tag);
      newval := false;
    end else
    begin
     if FDecim > 0 then
     begin
       f := f + (Sender as TEasyCalculatorButton).Tag / FDecim;
       FDecim := FDecim * 10;
     end
     else
       f := f * 10 + (Sender as TEasyCalculatorButton).Tag;

     Text := Format('%g', [f]);
    end;
  end else
  begin
    case ((sender as TEasyCalculatorButton).tag) of
     10:begin doplus; prevop:=0; end;
     11:begin domin; prevop:=2; end;
     12:begin domul; prevop:=1; end;
     13:begin dodiv; prevop:=3; end;
     14:if pos('-',Text)=0 then Text:='-'+Text
        else
          begin
           s := Text;
           delete(s,1,1);
           Text := s;
          end;
     15:begin
         if pos(DecimalSeparator,Text) = 0 then
         begin
           Text := Text + DecimalSeparator;
         end;
         FDecim := 10;
         if newval then
           Text := '0';
         newval := false;
        end;
     16:begin
          Text := '0';
          prevval := 0;
          prevop := -1;
        end;
     17:doeq;
     18:begin doperc; end;
     19..22:begin
             if Text='' then Text:='0';
             e:=strtofloat(StripThousandSep(Text));
             n:=e;
             if (e<>n) then Text:=Format('%g',[e]);
            end;
    end;

  end;
  Modified := True;
end;

procedure TEasyCustomMoneyEdit.SetCalculatorLook(
  const Value: TEasyCalculatorLook);
begin
  FCalculatorLook.Assign(Value);
end;

procedure TEasyCustomMoneyEdit.SetEditorEnabled(const Value: Boolean);
begin
  FEditorEnabled := Value;
  ReadOnly:=not fEditorEnabled;
end;

procedure TEasyCustomMoneyEdit.SetTextDirect(s: string);
begin
  inherited Text := s;
end;

procedure TEasyCustomMoneyEdit.SetValue(const Value: extended);
begin
  Text := Format('%g',[value]);
end;

procedure TEasyCustomMoneyEdit.ShowCalculator;
var
  P: TPoint;
  fDropDirection:boolean;
  {$IFDEF DELPHI9_LVL}
  w, h : integer;
  {$ENDIF}
begin
  FCalcClosed := False;
  FDecim := 0;
  newval := true;

  P := Point(0, 0);
  P := Self.ClientToScreen(P);

  FCalcForm := TEasyMoneyTextTabForm.CreateNew(self, 0);

  FCalcForm.BorderStyle:=bsNone;
  FCalcForm.Visible := False;
  FCalcForm.ButtonWidth := FCalculatorLook.ButtonWidth;
  FCalcForm.ButtonHeight := FCalculatorLook.ButtonHeight;

  if not FCalculatorLook.ButtonBkg.Empty then
   FCalcForm.ButtonColor := FCalculatorLook.Color
  else
   FCalcForm.ButtonColor := FCalculatorLook.ButtonColor;

  FCalcForm.FormStyle := fsStayOnTop;

  FCalcForm.Color := FCalculatorLook.Color;

  FCalcForm.OnDeactivate := FormDeactivate;
  FCalcForm.OnKeypress := FormKeyPress;
  FCalcForm.OnKeyDown := FormKeyDown;

  P := Point(0, 0);
  P := ClientToScreen(P);
  FCalcForm.Left:=P.x;

  BuildCalculator(FCalcForm);

  FDropDirection := false;

  if P.y + FCalcForm.Height >= GetSystemMetrics(SM_CYSCREEN) then
    fDropDirection := True;

  if P.y - FCalcForm.Height <= 0 then
    fDropDirection := False;


  if (FDropDirection=false) then
    FCalcForm.Top:=P.y + self.Height
  else
    FCalcForm.Top:=P.y - FCalcForm.Height;

  {$IFNDEF DELPHI9_LVL}
  FCalcForm.Show;
  {$ENDIF}
  {$IFDEF DELPHI9_LVL}
  w := FCalcForm.Width;
  h := FCalcForm.Height;

  FCalcForm.Width := 0;
  FCalcForm.height := 0;
  FCalcForm.Show;
  FCalcForm.Left:=P.x;
  FDropDirection:=false;

  if P.y + FCalcForm.Height >= GetSystemMetrics(SM_CYSCREEN) then
    fDropDirection := True;

  if P.y - FCalcForm.Height <= 0 then
    fDropDirection := False;


  if (FDropDirection=false) then
    FCalcForm.Top:=P.y + self.Height
  else
    FCalcForm.Top:=P.y - FCalcForm.Height;

  FCalcForm.width := w;
  FCalcForm.Height := h;

  {$ENDIF}
end;

procedure TEasyCustomMoneyEdit.WMCut(var Message: TWMCut);
begin
  if FEditorEnabled then inherited;
end;

procedure TEasyCustomMoneyEdit.WMKeyDown(var Msg: TWMKeydown);
begin
  inherited;
  
  if (msg.CharCode=vk_F4) then
  begin
    ShowCalculator;
  end;

  if (msg.CharCode = vk_delete) then
    if Text = '' then
      Text := '0';
end;

procedure TEasyCustomMoneyEdit.WMPaste(var Message: TWMPaste);
begin
  if FEditorEnabled then inherited;
end;

procedure TEasyCustomMoneyEdit.WMSize(var Message: TWMSize);
begin
//
end;

{ TEasyCalculatorLook }

procedure TEasyCalculatorLook.Assign(Source: TPersistent);
begin
  if Source is TEasyCalculatorLook then
  begin
    ButtonBkg.Assign(TEasyCalculatorLook(Source).ButtonBkg);
    ButtonWidth := TEasyCalculatorLook(Source).ButtonWidth;
    ButtonHeight := TEasyCalculatorLook(Source).ButtonHeight;
    ButtonColor := TEasyCalculatorLook(Source).ButtonColor;
    Color := TEasyCalculatorLook(Source).Color;
    Font.Assign(TEasyCalculatorLook(Source).Font);
    Flat := TEasyCalculatorLook(Source).Flat;
  end;
end;

constructor TEasyCalculatorLook.Create;
begin
  inherited;
  FFont := TFont.Create;
  FButtonWidth := 24;
  FButtonHeight := 24;
  FButtonColor := clSilver;
  FColor := clWhite;
  FbuttonBkg := TBitmap.Create;
end;

destructor TEasyCalculatorLook.Destroy;
begin
  FFont.Free;
  FbuttonBkg.Free;
  inherited;
end;

procedure TEasyCalculatorLook.SetButtonBkg(const Value: TBitmap);
begin
  FButtonBkg.Assign(Value);
end;

procedure TEasyCalculatorLook.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

end.
