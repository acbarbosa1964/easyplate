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
unit untFrmDsnEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ed_DsnBase, ed_Designer, ed_dsncont, untEasyPageControl,
  ExtCtrls, untEasyGroupBox, ecSyntAnal, ecSyntMemo, StdCtrls, TypInfo,
  edcDsnEvents;

type
  TFrmDsnEdit = class(TFrame)
    FormDesigner: TzFormDesigner;
    pgcDesignFormCode: TEasyPageControl;
    EasyTabSheet1: TEasyTabSheet;
    EasyTabSheet2: TEasyTabSheet;
    DesignSurface1: TDesignSurface;
    EasyPanel1: TEasyPanel;
    EasyPanel2: TEasyPanel;
    Splitter1: TSplitter;
    CodeEditor: TSyntaxMemo;
  
    SyntAnalyzer1: TSyntAnalyzer;
    EventsList: TListBox;
    DesignerEvents1: TDesignerEvents;
    procedure FormDesignerCanRename(Sender: TObject; Component: TComponent;
      const NewName: String; var Accept: Boolean);
    procedure FormDesignerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDesignerGetMethodNames(Sender: TObject;
      TypeData: PTypeData; Proc: TGetStrProc);
    procedure FormDesignerGetScriptProc(Sender, Instance: TObject;
      pInfo: PPropInfo; var ProcName: String);
    procedure FormDesignerSetScriptProc(Sender, Instance: TObject;
      pInfo: PPropInfo; const EventProc: String);
    procedure FormDesignerShowMethod(Sender: TObject;
      const MethodName: String);
    procedure DesignerEvents1ItemDeleted(Sender, AItem: TObject);
  private
    { Private declarations }
    function CreateMethod(const MethName: string; Instance: TObject;
      pInfo: PPropInfo): Boolean;
    function FindMethod(const MethName: string): TTextRange;
    function ShowMethod(const MethodName: string): Boolean;
  public
    { Public declarations }
    AForm: TForm;
    destructor Destroy; override;
  end;

implementation

uses untEasyFormDesigner;

{$R *.dfm}

{ParamList: array[1..ParamCount] of
  record
    Flags: TParamFlags;
    ParamName: ShortString;
    TypeName: ShortString;
  end;
ResultType: ShortString}
procedure GetParamList(ptData: PTypeData; SL: TStrings);
var i, k: integer;
    pName, pType: PShortString;
begin
  k := 0;
  for i := 1 to ptData^.ParamCount do
   begin
    Inc(k);
    pName := @ptData^.ParamList[k];
    Inc(k, Length(pName^) + 1);
    pType := @ptData^.ParamList[k];
    Inc(k, Length(pType^) + 1);
    SL.Add(pName^ + '=' + pType^);
   end;
end;

function TFrmDsnEdit.CreateMethod(const MethName: string;
  Instance: TObject; pInfo: PPropInfo): Boolean;
var
  Code, Comment: string;
  SL           : TStringList;
  i, offs,
  ins_p        : integer;
begin
  Result := (MethName <> '') and (FindMethod(MethName) = nil) and (pInfo^.PropType^^.Kind = tkMethod);
  if Result then
  begin
    SL := TStringList.Create;
    try
      GetParamList(GetTypeData(pInfo^.PropType^), SL);
      if (Instance is TComponent) then
        Comment := (Instance as TComponent).Name + '.' + pInfo^.Name
      else
        Comment := pInfo^.Name + ' handler';
      Code := sLineBreak + '// ' + Comment + sLineBreak +
              'procedure ' + MethName + '(';
      for i := 0 to SL.Count - 1 do
       begin
        if i > 0 then Code := Code + '; ';
        Code := Code + SL.Names[i] + ': ' + SL.ValueFromIndex[i];
       end;
      Code := Code + ');' + sLineBreak + 'begin' + sLineBreak + '  ';
      offs := Length(Code);
      Code := Code + sLineBreak + 'end;' + sLineBreak;
      ins_p := 0;
      with CodeEditor do
      begin
        if (SyntObj <> nil) and (SyntObj.TagCount > 0) and
           (SyntObj.Tags[0].TokenType = 1) then
         begin
           ins_p := CaretPosToStrPos(Point(0, StrPosToCaretPos(SyntObj.Tags[0].EndPos).Y + 1));
         end;
        CaretStrPos := ins_p;
        InsertText(Code);
        CaretStrPos := ins_p + offs;
        SetFocus;
      end;
    finally
      SL.Free;
    end;
  end;
end;

destructor TFrmDsnEdit.Destroy;
begin
  if FormDesigner.Target <> nil then
    FormDesigner.Target.Free;
  inherited;
end;

function TFrmDsnEdit.FindMethod(const MethName: string): TTextRange;
var i: integer;
    R: TTagBlockCondition;
begin
  if MethName <> '' then
   with CodeEditor.SyntObj do
    begin
      R := TTagBlockCondition(Owner.BlockRules.ItemByName('function'));
      if R <> nil then
       for i := 0 to RangeCount - 1 do
        if (Ranges[i].Rule = R) and
            SameText(TagStr[Ranges[i].StartIdx + 1], MethName) then
         begin
           Result := Ranges[i];
           Exit;
         end;
    end;
   Result := nil;
end;

procedure TFrmDsnEdit.FormDesignerCanRename(Sender: TObject;
  Component: TComponent; const NewName: String; var Accept: Boolean);
begin
  if (Component = FormDesigner.Root) or (Component = nil) then
    (Parent as TEasyTabSheet).Caption := NewName;
end;

function TFrmDsnEdit.ShowMethod(const MethodName: string): Boolean;
var R: TTextRange;
    st, en: integer;
begin
  R := FindMethod(MethodName);
  Result := R <> nil;
  if Result then
   with CodeEditor.SyntObj do
   begin
     st := Tags[R.StartIdx].StartPos;
     if R.EndIdx <> -1 then
       en := Tags[R.EndIdx].EndPos
     else
       en := st;
     Windows.SetFocus(CodeEditor.Handle);
     CodeEditor.CaretStrPos := st;
     CodeEditor.CaretStrPos := en;
     CodeEditor.SetSelection(st , en - st);
   end;
end;

procedure TFrmDsnEdit.FormDesignerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
    if Key = Ord('C') then
      FormDesigner.CopySelection else
    if Key = Ord('V') then
      FormDesigner.PasteSelection else
    if Key = Ord('X') then
      FormDesigner.CutSelection;
end;

procedure TFrmDsnEdit.FormDesignerGetMethodNames(Sender: TObject;
  TypeData: PTypeData; Proc: TGetStrProc);
var i: integer;
    R: TTagBlockCondition;
begin
   with CodeEditor.SyntObj do
    begin
      // Looking for all text ranges with rule "function"
      R := TTagBlockCondition(Owner.BlockRules.ItemByName('function'));
      if R <> nil then
       for i := 0 to RangeCount - 1 do
        if (Ranges[i].Rule = R) then
         Proc(TagStr[Ranges[i].StartIdx + 1]);
    end;
end;

procedure TFrmDsnEdit.FormDesignerGetScriptProc(Sender, Instance: TObject;
  pInfo: PPropInfo; var ProcName: String);
begin
  ProcName := '';
  if Instance is TComponent then
    if FormDesigner.Root = Instance then
      ProcName := EventsList.Items.Values[PInfo^.Name]
    else
      ProcName := EventsList.Items.Values[(Instance as TComponent).Name + '.' + PInfo^.Name];
end;

procedure TFrmDsnEdit.FormDesignerSetScriptProc(Sender, Instance: TObject;
  pInfo: PPropInfo; const EventProc: String);
var idx: integer;
    pn: string;
begin
  if pgcDesignFormCode.ActivePageIndex <> 1 then
    pgcDesignFormCode.ActivePageIndex := 1;
  if Instance is TComponent then
  begin
    if FormDesigner.Root = Instance then
      pn := PInfo^.Name
    else
      pn := (Instance as TComponent).Name + '.' + PInfo^.Name;
    idx := EventsList.Items.IndexOfName(pn);
    if idx <> -1 then
      EventsList.Items.Delete(idx);
    if EventProc <> '' then
    begin
      // Saving associating
      EventsList.Items.Add(pn + '=' + EventProc);
      // Creating event handler text body
      CreateMethod(EventProc, Instance, pInfo);
    end;
  end;
end;

procedure TFrmDsnEdit.FormDesignerShowMethod(Sender: TObject;
  const MethodName: String);
begin
  ShowMethod(MethodName);
end;

procedure TFrmDsnEdit.DesignerEvents1ItemDeleted(Sender, AItem: TObject);
var i: integer;
    S: string;
begin
  if not (AItem is TComponent) then Exit;
  S := TComponent(AItem).Name;
  for i := EventsList.Items.Count - 1 downto 0 do
   if SameText(S, Copy(EventsList.Items[i], 1, Length(S))) then
    EventsList.Items.Delete(i);
end;

end.
