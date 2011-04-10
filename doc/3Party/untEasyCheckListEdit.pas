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
  2011-04-10 10:27:29
  * TEasyCustomCheckListEdit的基类从TEasyCustomDropDownEdit开始，
    具有下拉多选属性
}
unit untEasyCheckListEdit;

interface

uses
  Windows, Messages, StdCtrls, Classes, Graphics, Controls, SysUtils, Forms,
  Math, ComObj, untEasyAbout, untEasyCustomDropDownEdit, CheckLst, untEasyMenus;

const
  CL_CHECKED = $8;
  
type
  TEasyCustomCheckListEdit = class;

  { TEasyCheckListDropFrom }
  TEasyCheckListDropFrom = class(TForm)
  private
    procedure WMClose(var Msg: TMessage); message WM_CLOSE;
  end;
  
  { TEasyCheckListIntList }
  TEasyCheckListIntList = class(TList)
  private
    procedure SetInteger(Index: Integer; Value: Integer);
    function GetInteger(Index: Integer): Integer;
  public
    constructor Create;
    property Items[index: Integer]: Integer read GetInteger write SetInteger; default;
    procedure Add(Value: integer);
    procedure Delete(Index: Integer);
  end;

  { TEasyInplaceCheckListBox }

  TEasyInplaceCheckListBox = class(TCheckListBox)
  private
    FParentEdit: TEasyCustomCheckListEdit;
    procedure WMKeyDown(var Msg: TWMKeydown); message wm_keydown;
  protected
    procedure DoExit; override;
    function GetDropDownWidth: Integer;
    property ParentEdit: TEasyCustomCheckListEdit read FParentEdit write FParentEdit;
  end;
  
  { TEasyCustomCheckListEdit }
  TCheckListItemToText = procedure(sender: TObject; var aText: string) of object;
  TTextToCheckListItem = procedure(sender: TObject; var aItem: string) of object;

  TDropDirection = (ddDown, ddUp);
  
  TEasyCustomCheckListEdit = class(TEasyCustomDropDownEdit)
  private
    FEditorEnabled: Boolean;
    FOnClickBtn: TNotifyEvent;
    FCheckListBox: TEasyInplaceCheckListBox;
    FItems: TStringList;

    FDropHeight: integer;
    FDropWidth: integer;
    FDropColumns: integer;
    FDropColor: TColor;
    FDropFont: TFont;
    FDropFlat: Boolean;
    FDropSorted: Boolean;
    FDropDirection: TDropDirection;
    FDroppedDown: Boolean;
    
    CheckFlag: Boolean;
    FChkForm: TForm;
    FIntList: TEasyCheckListIntList;
    FChkClosed: Boolean;
    FCloseClick: Boolean;
    FTextDelimiter: Char;

    FOnCheckListItemToText: TCheckListItemToText;
    FOnTextToCheckListItem: TTextToCheckListItem;
    FOnClose: TNotifyEvent;
    FAutoDropWidthSize: Boolean;
    FAppNtfy: TNotifyEvent;
    FDropDownPopupMenu: TEasyPopupMenu;
    FOnShowCheckList: TNotifyEvent;
    FOnClickCheck: TNotifyEvent;
    //显示隐藏选择框
    procedure ShowCheckList(Focus: boolean;startchar: string);
    procedure HideCheckList;
    //单击事件触发
    procedure DownClick(Sender: TObject);
    procedure ItemChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SetItems(const Value: TStringList);
    //字符串与列表选择框的相互转化
    function CheckToString: string;
    procedure StringToCheck(s: string);
    //
    procedure CheckClick(Sender: TObject);
    procedure CheckClickCheck(Sender: TObject);
    procedure AppDeactivate(Sender: TObject);
    procedure SetDropFont(const Value: TFont);
    procedure SetTextDelimiter(const Value: Char);
    function GetCheck(i: Integer): Boolean;
    function GetItemEnabled(ItemIndex: Integer): Boolean;
    function GetSelected(Index: Integer): Boolean;
    function GetState(i: Integer): TCheckBoxState;
    function GetText: string;
    procedure SetCheck(i: Integer; const Value: Boolean);
    procedure SetItemEnabled(ItemIndex: Integer; const Value: Boolean);
    procedure SetSelected(Index: Integer; const Value: Boolean);
    procedure SetState(i: Integer; const Value: TCheckBoxState);
    procedure SetText(const Value: string);
    
    procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMPaste(var Message: TWMPaste); message WM_PASTE;
    procedure WMCut(var Message: TWMCut); message WM_CUT;
    procedure WMKeyDown(var Msg: TWMKeydown); message WM_KEYDOWN;
    procedure WMSysKeyDown(var Msg: TWMKeydown); message WM_SYSKEYDOWN;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function GetParentForm(Control: TControl): TCustomForm; virtual;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;

    property ItemEnabled[ItemIndex: Integer]: Boolean read GetItemEnabled write SetItemEnabled;
    property Checked[i: Integer]: Boolean read GetCheck write SetCheck;
    property State[i: Integer]: TCheckBoxState read GetState write SetState;
    property Text: string read GetText write SetText;
    property DroppedDown: Boolean read FDroppedDown;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;

    property About;
    property TextRightAlign;
    property EditLabel;
    property LabelPosition;
    property LabelSpacing;
    
    property Align;
    property Anchors;
    property Constraints;
    property DragKind;

    property AutoSelect;
    property AutoSize;
    property AutoDropWidthSize: Boolean read FAutoDropWidthSize write FAutoDropWidthSize;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property EditorEnabled: Boolean read FEditorEnabled write FEditorEnabled default True;
    property Enabled;
    property Font;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
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

    property Items: TStringList read FItems write SetItems;
    property DropWidth: integer read FDropWidth write fDropWidth;
    property DropHeight: integer read FDropHeight write fDropHeight;
    property DropColumns: integer read FDropColumns write fDropColumns;
    property DropColor: tColor read FDropColor write fDropColor;
    property DropFlat: boolean read FDropFlat write fDropFlat;
    property DropFont: TFont read FDropFont write SetDropFont;
    property DropDirection: TDropDirection read fDropDirection write fDropDirection;
    property DropSorted: boolean read fDropSorted write fDropSorted;
    property DropDownPopupMenu: TEasyPopupMenu read FDropDownPopupMenu write FDropDownPopupMenu;

    property TextDelimiter: Char read fTextDelimiter write SetTextDelimiter nodefault;
    
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnClickBtn: TNotifyEvent read FOnClickBtn write FOnClickBtn;
    property OnClickCheck: TNotifyEvent read FOnClickCheck write FOnClickCheck;
    property OnTextToCheckListItem: TTextToCheckListItem read FOnTextToCheckListItem write FOnTextToCheckListItem;
    property OnCheckListItemToText: TCheckListItemToText read FOnCheckListItemToText write FOnCheckListItemToText;
    property OnShowCheckList: TNotifyEvent read FOnShowCheckList write FOnShowCheckList;
  end;

  { TEasyCheckListEdit }
  TEasyCheckListEdit = class(TEasyCustomCheckListEdit)
  published
    property About;
    property Align;
    property Anchors;
    property Constraints;
    property DragKind;

    property EnterTAB;
    property BorderColor;
    property FocusColor;

    property AutoFocus;
    property AppereanceStyle;
    property Button;
    property Flat;

    property TextRightAlign;
    property EditLabel;
    property LabelPosition;
    property LabelSpacing;
    property AutoSelect;
    property AutoSize;
    property AutoDropWidthSize;
    property BorderStyle;
    property Color;
    property Ctl3D;
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

    property Items;
    property DropWidth;
    property DropHeight;
    property DropColumns;
    property DropColor;
    property DropFlat;
    property DropFont;
    property DropDirection;
    property DropSorted;
    property DropDownPopupMenu;

    property TextDelimiter;
    
    property OnClose;
    property OnClickBtn;
    property OnClickCheck;
    property OnTextToCheckListItem;
    property OnCheckListItemToText;
    property OnShowCheckList;
  end;
  
implementation

function GetCharFromVirtualKey(Key: Word): string;
var
   keyboardState: TKeyboardState;
   asciiResult: Integer;
begin
   GetKeyboardState(keyboardState) ;

   SetLength(Result, 2) ;
   asciiResult := ToAscii(key, MapVirtualKey(key, 0), keyboardState, @Result[1], 0) ;
   case asciiResult of
     0: Result := '';
     1: SetLength(Result, 1) ;
     2:;
   else
     Result := '';
   end;
end;

procedure QuickSortList(List: TStringList; IntList: TEasyCheckListIntList; left, right: integer);
var
  i, j, si: integer;
  s, sw: string;
  so: TObject;

begin
  i := left;
  j := right;

 {get middle item here}
  s := List.Strings[(left + right) shr 1];

  repeat
    while (AnsiStrComp(pchar(s), pchar(List.Strings[i])) > 0) and (i < right) do inc(i);
    while (AnsiStrComp(pchar(s), pchar(List.Strings[j])) < 0) and (j > left) do dec(j);

    if (i <= j) then
    begin
      if (i <> j) then
      begin
        if AnsiStrComp(pchar(List.Strings[i]), pchar(List.Strings[j])) <> 0 then
        begin
          sw := List.Strings[i];
          so := List.Objects[i];

          si := IntList.Items[i];

          List.Strings[i] := List.Strings[j];
          List.Objects[i] := List.Objects[j];
          IntList.Items[i] := IntList.Items[j];
          List.Strings[j] := sw;
          List.Objects[j] := so;
          IntList.Items[j] := si;
        end;
      end;
      inc(i);
      dec(j);
    end;
  until (i > j);

  if (left < j) then QuicksortList(List, IntList, left, j);
  if (i < right) then QuickSortList(List, IntList, i, right);
end;

{ TEasyCheckListDropFrom }

procedure TEasyCheckListDropFrom.WMClose(var Msg: TMessage);
begin
  inherited;
  self.Free;
end;

{ TEasyCheckListIntList }

procedure TEasyCheckListIntList.Add(Value: integer);
begin
  inherited Add(TObject(Value));
end;

constructor TEasyCheckListIntList.Create;
begin
  inherited Create;
end;

procedure TEasyCheckListIntList.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;

function TEasyCheckListIntList.GetInteger(Index: Integer): Integer;
begin
  Result := Integer(inherited Items[Index]);
end;

procedure TEasyCheckListIntList.SetInteger(Index, Value: Integer);
begin
  inherited Items[Index] := TObject(Value);
end;

{ TEasyInplaceCheckListBox }

procedure TEasyInplaceCheckListBox.DoExit;
begin
  inherited;
  if Visible then
    ParentEdit.HideCheckList;
end;

function TEasyInplaceCheckListBox.GetDropDownWidth: Integer;
const
  CheckBoxWidth: integer = 15;
var
  i: integer;
  Width, Height: integer;
  MaxWidth: integer;
begin
  MaxWidth := self.Width;
  Height := 0;

  for i := 0 to Items.Count - 1 do
  begin
    Width := CheckBoxWidth + 2 +
      2 * GetSystemMetrics(SM_CXBORDER) + Canvas.TextWidth(Items[i]);

    Height := Height + Self.Canvas.TextHeight(Items[i]);
    if Width > MaxWidth then
      MaxWidth := Width;
  end;

  if Height + 2 * GetSystemMetrics(SM_CYBORDER) > self.Height then
    MaxWidth := MaxWidth + GetSystemMetrics(SM_CXVSCROLL);

  Result := MaxWidth;
end;

procedure TEasyInplaceCheckListBox.WMKeyDown(var Msg: TWMKeydown);
begin
  if (msg.charcode = VK_TAB) then
    Exit;

  if (msg.charcode = vk_escape) or (msg.charcode = vk_F4) or
    ((msg.CharCode = vk_up) and (getkeystate(vk_menu) and $8000 = $8000)) then
  begin
    postmessage((Parent as TForm).Handle, WM_CLOSE, 0, 0);
  end;

  if (msg.charcode = VK_RETURN) then
  begin
    if (ItemIndex > -1) then
      Checked[ItemIndex] := true;

    if Assigned(OnClickCheck) then
      OnClickCheck(self);

    PostMessage((Parent as TForm).Handle, WM_CLOSE, 0, 0);
  end;

  inherited;
end;

{ TEasyCustomCheckListEdit }

procedure TEasyCustomCheckListEdit.AppDeactivate(Sender: TObject);
begin
  HideCheckList;
end;

procedure TEasyCustomCheckListEdit.CheckClick(Sender: TObject);
begin
  inherited;
  checkflag := false;
end;

procedure TEasyCustomCheckListEdit.CheckClickCheck(Sender: TObject);
var
  i: integer;
begin
  checkflag := true;
  for i := 1 to FCheckListBox.Items.Count do
  begin
    if FCheckListBox.Checked[i - 1] then
      FIntList.Items[i - 1] := FIntList.Items[i - 1] or CL_CHECKED
    else
      FIntList.Items[i - 1] := FIntList.Items[i - 1] and not CL_CHECKED;
  end;

  self.Text := CheckToString;

  if Assigned(FOnClickCheck) then
  begin
    FOnClickCheck(Self);
    FCheckListBox.Refresh;            // Workaround Delphi TCustomChecklist-bug
  end;
end;

function TEasyCustomCheckListEdit.CheckToString: string;
var
  i: integer;
  s, sli: string;  
begin
  s := '';
  for i := 1 to FIntList.Count do
  begin
    if (FIntList.Items[i - 1] and CL_CHECKED = CL_CHECKED) then
    begin
      sli := FItems[i - 1];
      if Assigned(FOnCheckListItemToText) then
        FOnCheckListItemToText(self, sli);

      if(length(s)>0) then
        s := s + FTextDelimiter;
      s := s + sli;
    end;
  end;
  Result := s;
end;

procedure TEasyCustomCheckListEdit.CMEnabledChanged(var Msg: TMessage);
begin
  inherited;
//  Button.
end;

procedure TEasyCustomCheckListEdit.CMEnter(var Message: TCMGotFocus);
begin
  if AutoSelect and not (csLButtonDown in ControlState) then
    SelectAll;
  inherited;
end;

procedure TEasyCustomCheckListEdit.CMExit(var Message: TCMExit);
begin
//
  inherited;
end;

constructor TEasyCustomCheckListEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnButtonClick := DownClick;

  ControlStyle := ControlStyle - [csSetCaption];
  FEditorEnabled := True;
  FCheckListBox := nil;
  FItems := TStringList.Create;
  FItems.OnChange := ItemChange;

  FDropHeight := 100;
  FDropWidth := self.Width;
  FDropSorted := False;
  FDropFlat := True;
  FDropColor := clWindow;
  FDropFont := TFont.Create;
  FIntList := TEasyCheckListIntList.Create;
  FChkClosed := True;

  FTextDelimiter := ';';
  FDroppedDown := False;
end;

procedure TEasyCustomCheckListEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

procedure TEasyCustomCheckListEdit.CreateWnd;
begin
  inherited CreateWnd;
//  SetEditRect;
  self.ReadOnly := true;
end;

destructor TEasyCustomCheckListEdit.Destroy;
begin
  FItems.Free;
  FIntList.Free;
  FDropFont.Free;
  inherited Destroy;
end;

procedure TEasyCustomCheckListEdit.DestroyWnd;
begin
  inherited;    
end;

procedure TEasyCustomCheckListEdit.DownClick(Sender: TObject);
begin
  if FChkClosed then
  begin
    if not FCloseClick then
      ShowCheckList(true,#0);
  end;
  FCloseClick := False;
end;

procedure TEasyCustomCheckListEdit.FormDeactivate(Sender: TObject);
var
  pt: TPoint;
  r: TRect;
begin
  {check cursor here...}
  GetCursorPos(pt);
  pt := screentoclient(pt);
  r := clientrect;
  r.left := r.right - 16;
  FCloseClick := ptinrect(r, pt);
  HideCheckList;
end;

function TEasyCustomCheckListEdit.GetCheck(i: Integer): Boolean;
begin
  ItemChange(self);

  if (i >= fItems.Count) or (i >= fIntList.Count) or (i < 0) then
    raise Exception.Create('Index out of bounds');

  Result := FIntList.Items[i] and CL_CHECKED = CL_CHECKED;
end;

function TEasyCustomCheckListEdit.GetItemEnabled(
  ItemIndex: Integer): Boolean;
begin
  Result := True;
  if not Assigned(FCheckListBox) then Exit;

  if (ItemIndex > -1) and (ItemIndex < FCheckListBox.Items.Count) then
    Result := FCheckListBox.ItemEnabled[ItemIndex];
end;

function TEasyCustomCheckListEdit.GetParentForm(
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

function TEasyCustomCheckListEdit.GetSelected(Index: Integer): Boolean;
begin
  Result := FCheckListBox.Selected[Index];
end;

function TEasyCustomCheckListEdit.GetState(i: Integer): TCheckBoxState;
begin
  ItemChange(self);

  if (i >= fItems.Count) or (i >= fIntList.Count) or (i < 0) then
    raise Exception.Create('Index out of bounds');

  case fIntList.Items[i] and $3 of
    0: result := cbUnchecked;
    1: result := cbChecked;
    2: result := cbGrayed;
  else
    result := cbUnchecked;
  end;
end;

function TEasyCustomCheckListEdit.GetText: string;
begin
  Result := inherited Text;
end;

procedure TEasyCustomCheckListEdit.HideCheckList;
begin
  PostMessage(FChkForm.Handle, WM_CLOSE, 0, 0);
  FChkClosed := true;
  Application.OnDeactivate := FAppNtfy;
  FDroppedDown := False;

  StringToCheck(Text);

  if Assigned(FOnClose) then
    FOnClose(Self);
end;

procedure TEasyCustomCheckListEdit.ItemChange(Sender: TObject);
begin
  inherited;
  while FItems.Count > FIntList.Count do
    FIntList.Add(0);
  while FItems.Count < FIntList.Count do
    FIntList.Delete(fIntList.Count - 1);
end;

procedure TEasyCustomCheckListEdit.Loaded;
begin
  inherited;
  self.Text := CheckToString;
end;

procedure TEasyCustomCheckListEdit.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  if (AOperation = opRemove) and (AComponent = FDropDownPopupMenu) then
    FDropDownPopupMenu := nil;
  inherited;
end;

procedure TEasyCustomCheckListEdit.SetCheck(i: Integer;
  const Value: Boolean);
begin
  ItemChange(self);

  if (i >= FItems.Count) or (i >= FIntList.Count) or (i < 0) then
    raise Exception.Create('Index out of bounds');

  if Value then
    FIntList.Items[i] := FIntList.Items[i] or CL_CHECKED
  else
    FIntList.Items[i] := FIntList.Items[i] and not CL_CHECKED;

  Self.Text := CheckToString;

  if not FChkClosed then
    FChecklistbox.Checked[i] := Value;
end;

procedure TEasyCustomCheckListEdit.SetDropFont(const Value: TFont);
begin
  FDropFont.Assign(Value);
end;

procedure TEasyCustomCheckListEdit.SetItemEnabled(ItemIndex: Integer;
  const Value: Boolean);
begin
  if not Assigned(FCheckListBox) then Exit;

  if (ItemIndex > -1) and (ItemIndex < FCheckListBox.Items.Count) then
    FCheckListBox.ItemEnabled[ItemIndex] := Value;
  Invalidate;
end;

procedure TEasyCustomCheckListEdit.SetItems(const Value: TStringList);
var
  i: Integer;
begin
  if value <> nil then
    fItems.Assign(value);

  // Initialze enabled!
  if not (csDesigning in ComponentState) then
    for i := 0 to FItems.Count - 1 do
      FCheckListBox.ItemEnabled[i - 1] := True;
end;

procedure TEasyCustomCheckListEdit.SetSelected(Index: Integer;
  const Value: Boolean);
begin
  FCheckListBox.Selected[Index] := Value;
end;

procedure TEasyCustomCheckListEdit.SetState(i: Integer;
  const Value: TCheckBoxState);
begin
  ItemChange(self);

  if (i >= fItems.Count) or (i >= fIntList.Count) or (i < 0) then
    raise Exception.Create('Index out of bounds');

  fIntList.Items[i] := fIntList.Items[i] and not $3;

  case value of
    cbChecked: fIntList.Items[i] := fIntList.Items[i] or $1;
    cbGrayed: fIntList.Items[i] := fIntList.Items[i] or $2;
  end;

  self.Text := CheckToString;
end;

procedure TEasyCustomCheckListEdit.SetText(const Value: string);
begin
  inherited Text := value;
  if not (csLoading in ComponentState) then
  begin
    StringToCheck(value);
  end;
end;

procedure TEasyCustomCheckListEdit.SetTextDelimiter(const Value: Char);
begin
  fTextDelimiter := Value;
  if not (csLoading in ComponentState) then
    self.Text := CheckToString;
end;

procedure TEasyCustomCheckListEdit.ShowCheckList(Focus: boolean;
  startchar: string);
var
  P: TPoint;
  FOldDropDirection: TDropDirection;
  i: integer;
  s: string;
begin
  FOldDropDirection := FDropDirection;

  P := Point(0, 0);
  P := Self.ClientToScreen(P);

  if P.y + FDropHeight >= Screen.DesktopHeight then
    FDropDirection := ddUp;

  if P.y - FDropHeight <= 0 then
    FDropDirection := ddDown;

  FChkForm := TEasyCheckListDropFrom.CreateNew(self, 0);

  FChkForm.BorderStyle := bsNone;
  FChkForm.FormStyle := fsStayOnTop;
  FChkForm.Visible := False;
  FChkForm.Width := FDropWidth;
  FChkForm.Height := FDropHeight;
  FChkForm.OnDeactivate := FormDeactivate;

  FCheckListBox := TEasyInplaceCheckListBox.Create(FChkForm);
  FCheckListBox.Parent := FChkForm;
  FCheckListBox.Left := 0;
  FCheckListBox.Top := 0;
  FCheckListBox.Align := alClient;
  FCheckListBox.Width := FDropWidth;
  FCheckListBox.Height := FDropHeight;
  FCheckListBox.Color := FDropColor;
  FCheckListBox.Columns := FDropColumns;
  FCheckListBox.Flat := fDropFlat;

  FCheckListBox.Font.Assign(FDropFont);
  FCheckListBox.Sorted := FDropSorted;
  FCheckListBox.PopupMenu := FDropDownPopupMenu;

  if fDropSorted then QuickSortList(Items, FIntList, 0, self.Items.Count - 1);

  FCheckListBox.Font.Assign(fDropFont);
  FCheckListBox.Items.Assign(self.Items);

  if FAutoDropWidthSize then
    FChkForm.Width := FCheckListBox.GetDropDownWidth
  else
    FChkForm.Width := FCheckListBox.Width;

  StringToCheck(Text);

  for i := 1 to fIntList.Count do
  begin
    FChecklistbox.Checked[i - 1] := FIntList.Items[i - 1] and CL_CHECKED = CL_CHECKED;
    case (FIntList.Items[i - 1] and $3) of
      1: FChecklistbox.State[i - 1] := cbChecked;
      2: FChecklistbox.State[i - 1] := cbGrayed;
    end;
  end;

  FCheckListBox.Ctl3D := false;
  FCheckListBox.OnClick := CheckClick;
  FCheckListBox.OnClickCheck := CheckClickCheck;
  FCheckListBox.ParentEdit := self;

  StringToCheck(self.Text);

  FCheckListBox.Visible := true;

  if startchar = #0 then
    FCheckListBox.ItemIndex := 0
  else
  begin
    for i := 0 to FCheckListBox.Items.Count - 1 do
    begin
      s := FCheckListBox.Items[i];

      if (length(s) > 0) and (uppercase(s[1]) = uppercase(startchar)) then
      begin
        FCheckListBox.ItemIndex := i;
        break;
      end;
    end;
  end;

  FCheckListBox.TabStop := true;

  P := Point(0, 0);
  P := ClientToScreen(P);

  if P.x + FChkForm.Width > Screen.DesktopWidth then
    FChkForm.Left := Screen.DesktopWidth - FChkForm.Width
  else
    FChkForm.Left := P.x - 2;

  if (fDropDirection = ddDown) then
    FChkForm.Top := P.y + self.Height - 2
  else
    FChkForm.Top := P.y - fDropHeight;

  FChkForm.Show;

  FAppNtfy := Application.OnDeactivate;

  Application.OnDeactivate := AppDeactivate;

  if Focus then
    FCheckListBox.SetFocus;

  FCheckListBox.Height := FCheckListBox.Height + 1;
  FCheckListBox.Height := FCheckListBox.Height - 1;

  FDropDirection := fOldDropDirection;

  FChkClosed := False;
  FDroppedDown := True;
  if Assigned(FOnShowCheckList) then
    FOnShowCheckList(Self);

  FCheckListBox.Refresh;
end;

procedure TEasyCustomCheckListEdit.StringToCheck(s: string);
var
  su      : string;
  i, j    : integer;
  ATmpList: TStrings;
begin
  if not Assigned(FItems) then
    Exit;

  ATmpList := TStringList.Create;
  if ExtractStrings([FTextDelimiter], [' '], PChar(s), ATmpList) > 0 then
  begin
    for I := 0 to ATmpList.Count - 1 do
    begin
      J := FItems.IndexOf(ATmpList.Strings[I]);
      su := ATmpList.Strings[I];
      if Assigned(FOnTextToCheckListItem) then
        FOnTextToCheckListItem(self, su);
      if J >= 0 then
      begin
        FIntList.Items[J] := FIntList.Items[J] or CL_CHECKED;
      end;  
    end;  
  end;
  ATmpList.Free; 
end;

procedure TEasyCustomCheckListEdit.WMCut(var Message: TWMCut);
begin
  Exit;
  inherited;
end;

procedure TEasyCustomCheckListEdit.WMKeyDown(var Msg: TWMKeydown);
begin
  inherited;
  if not (msg.CharCode in [VK_LEFT,VK_RIGHT,VK_HOME,VK_END,VK_NEXT,VK_PRIOR]) then
    ShowCheckList(true,GetCharFromVirtualKey(Msg.CharCode));
end;

procedure TEasyCustomCheckListEdit.WMPaste(var Message: TWMPaste);
begin
  Exit;
  inherited;
end;

procedure TEasyCustomCheckListEdit.WMSysKeyDown(var Msg: TWMKeydown);
begin
  inherited;
  if (msg.CharCode = VK_DOWN) and (GetKeyState(VK_MENU) and $8000 = $8000) then
    ShowCheckList(true,#0);
end;

end.
