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
// +2011-04-10 15:24:44 TEasyCustomTreeComboBox
------------------------------------------------------------------------------}
unit untEasyTreeComboBox;

interface

uses
  Windows, Messages, StdCtrls, Classes, Graphics, Controls, SysUtils, Forms,
  Math, ComObj, untEasyAbout, untEasyCustomDropDownEdit, ComCtrls, Imglist,
  Menus;

type
  TEasyCustomTreeComboBox = class;
  TEasySelectMode = (smSingleClick, smDblClick);

  TEasyDropPosition = (dpAuto, dpDown, dpUp);
  //acceptdrop=true allow tree dropping

  TEasyDropDown = procedure(Sender: TObject; var acceptdrop: boolean) of object;
  //canceled = true ignores SelecteItem and stores Old Edit caption
  //canceled = false on selection and true when Cancel (key=Esc, click outside of tree...)
  TEasyDropUp = procedure(Sender: TObject; canceled: boolean) of object;

  TEasyDropTreeForm = class(TForm)
  private
    FDeActivate: DWORD;
    procedure WMClose(var Msg: TMessage); message WM_CLOSE;
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
    function GetParentWnd: HWnd;
  published
    property DeActivateTime: DWORD read FDeActivate;
  end;
  
  { TEasyCustomTreeComboBox }
  TEasyCustomTreeComboBox = class(TEasyCustomDropDownEdit)
  private
    { Private declarations }
    FTreeView     : TTreeview;
    FDropTreeForm : TEasyDropTreeForm;
    FDropWidth    : integer;
    FDropHeight   : integer;
    FEditorEnabled: boolean;
    FExpandOnDrop : boolean;
    FCollapseOnDrop: boolean;
    FDropPosition : TEasyDropPosition;
    FOldCaption   : string;
    FOndropDown   : TEasydropDown;
    FOndropUP     : TEasydropUP;
    FAutoOpen     : boolean;
    FSelectMode   : TEasyselectMode;
//    FFlat         : Boolean;
    function GetAbsoluteIndex: Integer;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    function GetImages: TCustomImageList;
    function GetIndent: Integer;
    function GetReadOnlyTree: boolean;
    function GetRightClickSelect: Boolean;
    function GetRowSelect: Boolean;
    function GetSelection: Integer;
    function GetShowButtons: Boolean;
    function GetShowLines: Boolean;
    function GetShowRoot: Boolean;
    function GetSortType: TSortType;
    function GetStateImages: TCustomImageList;
    function GetTreeBorder: TBorderStyle;
    function GetTreeColor: TColor;
    function GetTreeFont: Tfont;
    function GetTreeNodes: TTreeNodes;
    function GetTreepopupmenu: Tpopupmenu;
    procedure SetCollapseOnDrop(const Value: boolean);
    procedure SetEditorEnabled(const Value: boolean);
    procedure SetExpandOnDrop(const Value: boolean);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetIndent(const Value: Integer);
    procedure SetReadOnlyTree(const Value: boolean);
    procedure SetRightClickSelect(const Value: Boolean);
    procedure SetRowSelect(const Value: Boolean);
    procedure SetSelection(const Value: Integer);
    procedure SetShowButtons(const Value: Boolean);
    procedure SetShowLines(const Value: Boolean);
    procedure SetShowRoot(const Value: Boolean);
    procedure SetSortType(const Value: TSortType);
    procedure SetStateImages(const Value: TCustomImageList);
    procedure SetTreeBorder(const Value: TBorderStyle);
    procedure SetTreeColor(const Value: TColor);
    procedure SetTreeFont(const Value: Tfont);
    procedure SetTreeNodes(const Value: TTreeNodes);
    procedure SetTreepopupmenu(const Value: Tpopupmenu);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure KeyPress(var Key: Char); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;

    function CreateTreeview(AOwner: TComponent): TTreeView; virtual;
    procedure DropButtonClick(Sender: TObject);
    //树宿主窗体事件
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewKeyPress(Sender: TObject; var Key: Char);
    procedure TreeViewDblClick(Sender: TObject);
    procedure TreeViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TreeViewBlockChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure TreeViewExit(Sender: TObject);
    //隐藏树
    procedure HideTree(canceled: boolean);
    procedure FindTextInNode;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //显示树
    procedure ShowTree;
    property AbsoluteIndex: Integer read GetAbsoluteIndex;
    property Treeview: TTreeview read FTreeView;
    { Extend Property }
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
    { Extend Property end }
    { property }
    property AutoOpen: boolean read FAutoOpen write FAutoOpen default True;
    property SelectMode: TEasySelectMode read FSelectMode write FSelectMode default smDblClick;
    property DropWidth: integer read FDropWidth write fDropWidth;
    property DropHeight: integer read FDropHeight write fDropHeight;
    property Items: TTreeNodes read GetTreeNodes write SetTreeNodes;
    property EditorEnabled: boolean read FEditorEnabled write SetEditorEnabled default true;
    property CollapseOnDrop: boolean read FCollapseOnDrop write SetCollapseOnDrop default false;
    property ExpandOnDrop: boolean read FExpandOnDrop write SetExpandOnDrop default false;
    property DropPosition: TEasyDropPosition read FDropPosition write FDropPosition default dpAuto;
     //----- Tree properties
    property ReadOnlyTree: boolean read GetReadOnlyTree write SetReadOnlyTree default true;
    property ShowButtons: Boolean read GetShowButtons write SetShowButtons default True;
    property ShowLines: Boolean read GetShowLines write SetShowLines default True;
    property ShowRoot: Boolean read GetShowRoot write SetShowRoot default True;
    property SortType: TSortType read GetSortType write SetSortType default stNone;
    property RightClickSelect: Boolean read GetRightClickSelect write SetRightClickSelect default False;
    property RowSelect: Boolean read GetRowSelect write SetRowSelect default False;
    property Indent: Integer read GetIndent write SetIndent;
    property Images: TCustomImageList read GetImages write SetImages;
    property StateImages: TCustomImageList read GetStateImages write SetStateImages;
    property TreeFont: Tfont read GetTreeFont write SetTreeFont;
    property TreeColor: TColor read GetTreeColor write SetTreeColor;
    property TreeBorder: TBorderStyle read GetTreeBorder write SetTreeBorder;
    property TreePopupMenu: Tpopupmenu read GetTreepopupmenu write SetTreepopupmenu;
    property Selection: Integer read GetSelection write SetSelection;
     //--------
    property OnDropDown: TEasyDropDown read FOnDropDown write FOnDropDown;
    property OnDropUp: TEasyDropUp read FOnDropUP write FOnDropUp;

    property Align;
     //------- Edit Properties
    property Constraints;
    property DragKind;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property BevelKind;
    property BevelInner;
    property BevelOuter;
    property BevelEdges;
    property DragCursor;
    property DragMode;
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
    property Text;
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
  end;

  { TEasyTreeComboBox }
  TEasyTreeComboBox = class(TEasyCustomTreeComboBox)
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
    { Extend Property end }
    { property }
    property AutoOpen;
    property SelectMode;
    property DropWidth;
    property DropHeight;
    property Items;
    property EditorEnabled;
    property CollapseOnDrop;
    property ExpandOnDrop;
    property DropPosition;
     //----- Tree properties
    property ReadOnlyTree;
    property ShowButtons;
    property ShowLines;
    property ShowRoot;
    property SortType;
    property RightClickSelect;
    property RowSelect;
    property Indent;
    property Images;
    property StateImages;
    property TreeFont;
    property TreeColor;
    property TreeBorder;
    property TreePopupMenu;
    property Selection;
     //--------
    property OnDropDown;
    property OnDropUp;

    property Align;
     //------- Edit Properties
    property Constraints;
    property DragKind;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property BevelKind;
    property BevelInner;
    property BevelOuter;
    property BevelEdges;
    property Ctl3D;
    property DragCursor;
    property DragMode;
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
    property Text;
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
  end;
  
implementation

{ TEasyDropTreeForm }

function TEasyDropTreeForm.GetParentWnd: HWnd;
var
  Last, P: HWnd;
begin
  P := GetParent((Owner as TWinControl).Handle);
  Last := P;
  while P <> 0 do
  begin
    Last := P;
    P := GetParent(P);
  end;
  Result := Last;
end;

procedure TEasyDropTreeForm.WMActivate(var Message: TWMActivate);
begin
  inherited;
  if Message.Active = integer(False) then
  begin
    if Visible then
    begin
      FDeActivate := GetTickCount;
      Hide;
    end;
  end
  else
  begin
    SendMessage(getParentWnd, WM_NCACTIVATE, 1, 0);
  end;
end;

procedure TEasyDropTreeForm.WMClose(var Msg: TMessage);
begin
  inherited;
//  
end;

{ TEasyCustomTreeComboBox }

constructor TEasyCustomTreeComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetBounds(left, top, 200, 25);

  if not (csDesigning in ComponentState) then
  begin
    FDropTreeForm := TEasyDropTreeForm.CreateNew(self, 0);
    with FDropTreeForm do
    begin
      BorderStyle := bsNone;
      //
      FormStyle := fsStayOnTop;
      Visible := False;
      Width := FDropWidth;
      Height := FDropHeight;
      OnClose := FormClose;
    end;
  end;

  FTreeView := CreateTreeView(Self);
  with FTreeView do
  begin
    if not (csDesigning in ComponentState) then
      Parent := FDropTreeForm
    else
      Parent := Self;

    if not (csDesigning in ComponentState) then
      Align := alClient
    else
      Width := 0;


    ReadOnly := true;
    ShowButtons := True;
    ShowLines := True;
    ShowRoot := True;
    SortType := stNone;
    RightClickSelect := False;
    RowSelect := False;
    if not (csDesigning in ComponentState) then
      Visible := True
    else
      Visible := False;

    OnKeyDown := TreeViewKeyDown;
    OnChange := TreeViewChange;
    OnMouseDown := TreeViewMouseDown;
    OnDblClick := TreeViewDblClick;
    OnKeyPress := TreeViewKeyPress;
  end;

  ControlStyle := ControlStyle - [csSetCaption];
  FDropHeight := 100;
  FDropWidth := self.width;
  FEditorEnabled := true;
  ReadOnly := false;
  FCollapseOnDrop := false;
  FExpandOnDrop := false;
  FDropPosition := dpAuto;
  FOldCaption := '';
  FAutoOpen := true;
  FselectMode := smDblClick;

  OnButtonClick := DropButtonClick;
end;

procedure TEasyCustomTreeComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

function TEasyCustomTreeComboBox.CreateTreeview(
  AOwner: TComponent): TTreeView;
begin
  Result := TTreeView.Create(AOwner);
end;

procedure TEasyCustomTreeComboBox.CreateWnd;
begin
  inherited CreateWnd;
end;

destructor TEasyCustomTreeComboBox.Destroy;
begin
  if not (csDesigning in ComponentState) then
    FDropTreeForm.Free;
  inherited Destroy;
end;

procedure TEasyCustomTreeComboBox.DestroyWnd;
begin
  inherited;
//
end;

procedure TEasyCustomTreeComboBox.DropButtonClick(Sender: TObject);
begin
  if csDesigning in ComponentState then
    Exit;
    
  if not FDropTreeForm.Visible and (GetTickCount - FDropTreeForm.DeActivateTime > 250) then
    ShowTree;
end;

procedure TEasyCustomTreeComboBox.FindTextInNode;
var
  i: integer;
  itm, its: TTreenode;
  sfind, stext: string;
  found: boolean;

  function noopen(Node: TTreenode): boolean;
  begin
    result := true;
    if node = nil then exit;
    while Node.Parent <> nil do
    begin
      node := Node.Parent;
      if not node.Expanded then exit;
    end;
    Result := false;
  end;

begin
  sfind := UpperCase(text);
  itm := nil;
  found := false;

  if FTreeview.Selected<> nil then
  begin
    itm := FTreeview.Selected;
    stext := UpperCase(itm.text);
    if AnsiPos(sfind, stext) = 1 then
      found := true;
  end;

  if not found then
  repeat
    for i := 0 to FTreeView.Items.count - 1 do
    begin
   // Don't search if AutoOpen disabled and the nodes are not open.
      if not AutoOpen then
        if noopen(FTreeView.items[i]) then continue;
      stext := UpperCase(FTreeView.Items[i].text);
      if AnsiPos(sfind, stext) = 1 then
      begin
        itm := FTreeView.items[i];
        Break;
      end;
    end;
    if length(sfind) > 0 then delete(sfind, length(sfind), 1);
  until (itm <> nil) or (sfind = '');

  if itm = nil then
  begin
    FTreeView.OnChanging := TreeViewBlockChanging;
    Exit;
  end;
  its := itm;
  if AutoOpen then
  begin
    while itm.Parent <> nil do
    begin
      itm := itm.Parent;
      itm.Expand(false);
    end;
  end;
  FTreeView.Selected := its;
  FTreeView.Selected.MakeVisible;
end;

procedure TEasyCustomTreeComboBox.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//
end;

function TEasyCustomTreeComboBox.GetAbsoluteIndex: Integer;
begin
  Result := -1;
  if Assigned(FTreeView.Selected) then
    Result := FTreeView.Selected.AbsoluteIndex;
end;

function TEasyCustomTreeComboBox.GetImages: TCustomImageList;
begin
  result := FtreeView.Images;
end;

function TEasyCustomTreeComboBox.GetIndent: Integer;
begin
  Result := FtreeView.Indent;
end;

function TEasyCustomTreeComboBox.GetReadOnlyTree: boolean;
begin
  Result := FtreeView.ReadOnly;
end;

function TEasyCustomTreeComboBox.GetRightClickSelect: Boolean;
begin
  Result := FtreeView.RightClickSelect;
end;

function TEasyCustomTreeComboBox.GetRowSelect: Boolean;
begin
  Result := FtreeView.RowSelect;
end;

function TEasyCustomTreeComboBox.GetSelection: Integer;
begin
  try
    if Assigned(FTreeView.Selected) then
      Result := FTreeView.Selected.AbsoluteIndex
    else
      Result := -1;
  except
    on Exception do
      Result := -1;
  end;
end;

function TEasyCustomTreeComboBox.GetShowButtons: Boolean;
begin
  result := FtreeView.ShowButtons;
end;

function TEasyCustomTreeComboBox.GetShowLines: Boolean;
begin
  result := FtreeView.ShowLines;
end;

function TEasyCustomTreeComboBox.GetShowRoot: Boolean;
begin
  result := FtreeView.ShowRoot;
end;

function TEasyCustomTreeComboBox.GetSortType: TSortType;
begin
  Result := FtreeView.SortType;
end;

function TEasyCustomTreeComboBox.GetStateImages: TCustomImageList;
begin
  result := FtreeView.StateImages;
end;

function TEasyCustomTreeComboBox.GetTreeBorder: TBorderStyle;
begin
  Result := FTreeView.BorderStyle;
end;

function TEasyCustomTreeComboBox.GetTreeColor: TColor;
begin
  Result := FtreeView.Color;
end;

function TEasyCustomTreeComboBox.GetTreeFont: Tfont;
begin
  result := FtreeView.Font;
end;

function TEasyCustomTreeComboBox.GetTreeNodes: TTreeNodes;
begin
  Result := FTreeView.Items;
end;

function TEasyCustomTreeComboBox.GetTreepopupmenu: Tpopupmenu;
begin
  result := FtreeView.PopupMenu;
end;

procedure TEasyCustomTreeComboBox.HideTree(canceled: boolean);
begin
  if csDesigning in ComponentState then
    Exit;

  if not FdropTreeForm.Visible then
    Exit;
  FDropTreeForm.Hide;
  Application.CancelHint;
  if Canceled then
  begin
    Text := FOldCaption;
  end else
  begin
    if Assigned(FTreeView.Selected) then
    begin
      Text := FTreeView.Selected.Text;
    end;
  end;
  if Assigned(FOnDropUp) then
    FOnDropUP(self, Canceled);
end;

procedure TEasyCustomTreeComboBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(key);
  if (Key = Char(VK_RETURN)) then Key := #0;
end;

procedure TEasyCustomTreeComboBox.SetCollapseOnDrop(const Value: boolean);
begin
  FCollapseOnDrop := Value;
end;

procedure TEasyCustomTreeComboBox.SetEditorEnabled(const Value: boolean);
begin
  FEditorEnabled := Value;
end;

procedure TEasyCustomTreeComboBox.SetExpandOnDrop(const Value: boolean);
begin
  FExpandOnDrop := Value;
end;

procedure TEasyCustomTreeComboBox.SetImages(const Value: TCustomImageList);
begin
  FtreeView.Images := value;
end;

procedure TEasyCustomTreeComboBox.SetIndent(const Value: Integer);
begin
  FtreeView.Indent := value;
end;

procedure TEasyCustomTreeComboBox.SetReadOnlyTree(const Value: boolean);
begin
  FtreeView.ReadOnly := value;
end;

procedure TEasyCustomTreeComboBox.SetRightClickSelect(
  const Value: Boolean);
begin
  FtreeView.RightClickSelect := value;
end;

procedure TEasyCustomTreeComboBox.SetRowSelect(const Value: Boolean);
begin
  FtreeView.RowSelect := value;
end;

procedure TEasyCustomTreeComboBox.SetSelection(const Value: Integer);
begin
  if (Value = -1) then
  begin
    FTreeView.Selected := nil;
    Text := '';
    Exit;
  end;

  try
    FTreeView.Selected := FTreeView.Items[Value];
    Text := FTreeView.Selected.Text;
  except
    on Exception do
      FTreeView.Selected := nil;
  end;
end;

procedure TEasyCustomTreeComboBox.SetShowButtons(const Value: Boolean);
begin
  FtreeView.ShowButtons := value;
end;

procedure TEasyCustomTreeComboBox.SetShowLines(const Value: Boolean);
begin
  FtreeView.ShowLines := value;
end;

procedure TEasyCustomTreeComboBox.SetShowRoot(const Value: Boolean);
begin
  FtreeView.ShowRoot := value;
end;

procedure TEasyCustomTreeComboBox.SetSortType(const Value: TSortType);
begin
  FtreeView.SortType := value;
end;

procedure TEasyCustomTreeComboBox.SetStateImages(
  const Value: TCustomImageList);
begin
  FtreeView.StateImages := value;
end;

procedure TEasyCustomTreeComboBox.SetTreeBorder(const Value: TBorderStyle);
begin
  FtreeView.BorderStyle := value;
end;

procedure TEasyCustomTreeComboBox.SetTreeColor(const Value: TColor);
begin
  FtreeView.Color := value;
end;

procedure TEasyCustomTreeComboBox.SetTreeFont(const Value: Tfont);
begin
  FtreeView.Font.Assign(value);
end;

procedure TEasyCustomTreeComboBox.SetTreeNodes(const Value: TTreeNodes);
begin
  FTreeView.Items.Assign(Value);
  FTreeView.Update;
end;

procedure TEasyCustomTreeComboBox.SetTreepopupmenu(
  const Value: Tpopupmenu);
begin
  FtreeView.PopupMenu := value;
end;

procedure TEasyCustomTreeComboBox.ShowTree;
var
  p: TPoint;
  acpt: boolean;
begin
  if csDesigning in ComponentState then
    Exit;

  if FDropTreeForm.Visible then
    Exit;

  FOldCaption := Caption;
  FDropTreeForm.Left := self.Left;
  FDropTreeForm.Top := self.Top;
  FDropTreeForm.Width := FDropWidth;
  FDropTreeForm.Height := FDropHeight;
  P := Point(0, 0);
  P := ClientToScreen(P);
  case FDropPosition of
    dpAuto: begin
        if P.y + fDropHeight >= GetSystemMetrics(SM_CYSCREEN) then
        begin //Up
          FdropTreeForm.Left := P.x;
          FdropTreeForm.Top := p.y - FDropHeight;
        end
        else
        begin //Down
          FdropTreeForm.Left := P.x;
          FdropTreeForm.Top := p.y + Height - 2;
        end;
      end;
    dpDown: begin
        FdropTreeForm.Left := P.x;
        FdropTreeForm.Top := p.y + Height - 2;
      end;
    dpUp: begin
        FdropTreeForm.Left := P.x;
        FdropTreeForm.Top := p.y - FDropHeight;
      end;
  end;

  if FCollapseOnDrop then FTreeView.FullCollapse;
  if FExpandOnDrop then FTreeView.FullExpand;
  acpt := true;

  FtreeView.Items.GetFirstNode; //Force return of correct items count

  FindTextInNode;

  if Assigned(FOnDropDown) then
    FOnDropdown(Self, acpt);
    
  if acpt then
    FDropTreeForm.Show;
  FTreeView.OnChanging := nil; // Please leave this here, otherwise procedure FindtextinNode must be modified
end;

procedure TEasyCustomTreeComboBox.TreeViewBlockChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
begin
  AllowChange := false;
end;

procedure TEasyCustomTreeComboBox.TreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  if csDesigning in ComponentState then
    Exit;

  if FDropTreeForm.Visible then
  begin
    if Assigned(Node) then
      Text := Node.Text;
    SelStart := 0;
    SelLength := Length(Text);
  end;
end;

procedure TEasyCustomTreeComboBox.TreeViewDblClick(Sender: TObject);
begin
  if Fselectmode = smDblClick then HideTree(false);
end;

procedure TEasyCustomTreeComboBox.TreeViewExit(Sender: TObject);
begin
  HideTree(False);
end;

procedure TEasyCustomTreeComboBox.TreeViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE, VK_F4:
      begin
        HideTree(true);
        key := 0;
      end;
    VK_RETURN:
      begin
        HideTree(false);
      end;
  end;
end;

procedure TEasyCustomTreeComboBox.TreeViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key <= #27 then key := #0; // stop beeping
end;

procedure TEasyCustomTreeComboBox.TreeViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AnItem: TTreeNode;
  HT: THitTests;
begin
  if Fselectmode = smDblClick then exit;
  if FTreeView.Selected = nil then Exit;
  HT := FTreeView.GetHitTestInfoAt(X, Y);
  AnItem := FTreeView.GetNodeAt(X, Y);
  // We can add htOnLabel,htOnStateIcon,htOnItem,htOnLabel
  if (htOnitem in ht) and (AnItem <> nil) then
  begin
    HideTree(false);
  end;
end;

procedure TEasyCustomTreeComboBox.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := 1; // Message.Result and DLGC_WANTALLKEYS;
end;

procedure TEasyCustomTreeComboBox.WMKeyDown(var Message: TWMKeyDown);
begin
  if csDesigning in ComponentState then
    Exit;

  inherited;
  case Message.CharCode of
    VK_DOWN: ShowTree;
    VK_F4:
      begin
        if FDropTreeForm.Visible then
          HideTree(False)
        else
          ShowTree;
      end;
  end;
end;

end.
