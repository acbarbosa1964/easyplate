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
unit untEasySQLEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, ecSyntAnal, StdCtrls, DB, ExtCtrls, dbtables,
  ComCtrls, ecSyntTree, ecPopupCtrl, Buttons, Grids, DBGrids, untEasyPlateDBBaseForm ,
  ecExtHighlight, ecSpell, ImgList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLookAndFeels,
  cxLookAndFeelPainters;

  //插件导出函数
  function ShowBplForm(var AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
  
type
  TfrmEasySQLEditor = class(TfrmEasyPlateDBBaseForm)
    Label1: TLabel;
    SyntAnalyzer1: TSyntAnalyzer;
    AutoCompletePopup1: TAutoCompletePopup;
    AutoCompletePopup2: TAutoCompletePopup;
    TableHighlighter: TecSpellChecker;
    AliasHighloghter: TecSpellChecker;
    Panel1: TPanel;
    SyntaxMemo1: TSyntaxMemo;
    Splitter1: TSplitter;
    SyntaxTreeView1: TSyntaxTreeView;
    Splitter2: TSplitter;
    Query1: TQuery;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    procedure FormCreate(Sender: TObject);
    procedure AutoCompletePopup1GetAutoCompleteList(Sender: TObject;
      Pos: TPoint; List, Display: TStrings);
    procedure AutoCompletePopup2GetAutoCompleteList(Sender: TObject;
      Pos: TPoint; List, Display: TStrings);
    procedure SyntaxMemo1TextChanged(Sender: TObject; Pos, Count,
      LineChange: Integer);
    procedure TableHighlighterCheckWord(Sender: TObject;
      const AWord: String; APos: integer; var Valid: Boolean);
    procedure AliasHighloghterCheckWord(Sender: TObject;
      const AWord: String; APos: integer; var Valid: Boolean);
    procedure SyntaxMemo1FinishAnalysis(Sender: TObject);
  private
    procedure GetTables(List: TStrings);
    procedure GetAliases(List: TStrings; Tables: TStrings = nil);
    procedure GetFields(TableName: string; List, Display: TStrings);
    function IsIdentifier(APos: integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmEasySQLEditor: TfrmEasySQLEditor;

implementation

uses ecStrUtils;

{$R *.dfm}

//引出函数实现
function ShowBplForm(var AParamList: TStrings): TForm;
begin
  frmEasySQLEditor := TfrmEasySQLEditor.Create(Application);
  if frmEasySQLEditor.FormStyle <> fsMDIChild then
    frmEasySQLEditor.FormStyle := fsMDIChild;
  if frmEasySQLEditor.WindowState <> wsMaximized then
    frmEasySQLEditor.WindowState := wsMaximized;
  frmEasySQLEditor.FormId := '{B21F94ED-1579-4C40-9851-376DDBF8FEAF}';
  Result := frmEasySQLEditor;
end;

// Extracting databases
procedure TfrmEasySQLEditor.FormCreate(Sender: TObject);
begin
end;

// Extracting tables
procedure TfrmEasySQLEditor.GetTables(List: TStrings);
begin
end;

// Extracting aliases using parsing results
procedure TfrmEasySQLEditor.GetAliases(List, Tables: TStrings);
var i: integer;
    r: TTagBlockCondition;
begin
  with SyntaxMemo1.SyntObj do
   begin
     r := TTagBlockCondition(Owner.BlockRules.ItemByName('alias'));
     if r <> nil then
     for i := 0 to RangeCount - 1 do
      if Ranges[i].Rule = r then  // lloking for all text ranges of 'alias' rule
       begin
         List.Add(TagStr[Ranges[i].StartIdx + 1]);
         if Tables <> nil then
           Tables.Add(TagStr[Ranges[i].StartIdx]);
       end;
   end;
end;

// Extracting fields
procedure TfrmEasySQLEditor.GetFields(TableName: string; List, Display: TStrings);
begin
end;

// Fill tables name auto-completion list
procedure TfrmEasySQLEditor.AutoCompletePopup1GetAutoCompleteList(Sender: TObject;
  Pos: TPoint; List, Display: TStrings);
var range: TTextRange;
    p, idx: integer;
    r: TTagBlockCondition;
  function IsInRule(Range: TTextRange; Rule: TTagBlockCondition): Boolean;
  begin
    Result := (Range <> nil) and
              ((Range.Rule = Rule) or
               IsInRule(Range.Parent, Rule));
  end;
begin
  p := SyntaxMemo1.CaretPosToStrPos(Pos);
  with SyntaxMemo1.SyntObj do
   begin
    r := TTagBlockCondition(Owner.BlockRules.ItemByName('from'));
    idx := PriorTokenAt(p);
    if idx < 1 then Exit;
    Range := NearestRangeAtPos(p);
    if IsInRule(Range, r) then
      begin
        if Tags[idx].EndPos > p then Dec(idx);
        if Tags[idx].TokenType = 2 then // Identifier
          Exit;
        GetTables(List);
      end;
   end;
end;

// Fill fields name auto-completion list
procedure TfrmEasySQLEditor.AutoCompletePopup2GetAutoCompleteList(Sender: TObject;
  Pos: TPoint; List, Display: TStrings);
var range: TTextRange;
    p, idx: integer;
    Al, Tables: TStringList;
    S: string;
begin
  p := SyntaxMemo1.CaretPosToStrPos(Pos);
  if p < 3 then Exit;
  if SyntaxMemo1.Lines.Chars[p] = '.' then
   begin
     idx := SyntaxMemo1.SyntObj.TokenAtPos(p - 2); // get index of table/alias name token
     if idx <> -1 then
      begin
        S := SyntaxMemo1.SyntObj.TagStr[idx]; // table/alias name
        Al := TStringList.Create;
        Tables := TStringList.Create;
        try
          GetAliases(Al, Tables);
          idx := Al.IndexOf(S);
          if idx = -1 then
           begin  // it is not alias
            Tables.Clear;
            GetTables(Tables);
            idx := Tables.IndexOf(S);
           end;
          if idx <> -1 then
           begin
            GetFields(Tables[idx], List, Display); // get fields list
            if List.Count > 0 then
              begin
               List.Insert(0, '*');
               Display.Insert(0, '<ALL>');
              end;
           end;
        finally
          Al.Free;
          Tables.Free;
        end;
      end;
   end;
end;

// Run table name auto-completion after first letter inputing
procedure TfrmEasySQLEditor.SyntaxMemo1TextChanged(Sender: TObject; Pos, Count,
  LineChange: Integer);
begin
  with SyntaxMemo1 do
   if (Count = 1) and IsWordChar(Lines.Chars[Pos + 1]) and
      ((Pos = 0) or IsSpaceChar(Lines.Chars[Pos])) then
     begin
       AutoCompletePopup1.Execute;
     end;
end;

// Check type of token at given position
function TfrmEasySQLEditor.IsIdentifier(APos: integer): Boolean;
var idx: integer;
begin
  idx := SyntaxMemo1.SyntObj.TokenAtPos(APos);
  Result := (idx <> -1) and (SyntaxMemo1.SyntObj.Tags[idx].TokenType = 2);
end;

// Using ecSpellChecker to highlight valid tables
procedure TfrmEasySQLEditor.TableHighlighterCheckWord(Sender: TObject;
  const AWord: String; APos: integer; var Valid: Boolean);
var sl: TStringList;
begin
  if not IsIdentifier(APos) then
   begin
    Valid := True;
    Exit;
   end;
  sl := TStringList.Create;
  GetTables(sl);
  Valid := sl.IndexOf(AWord) = -1;
  sl.Free;
end;

// Using ecSpellChecker to highlight aliases
procedure TfrmEasySQLEditor.AliasHighloghterCheckWord(Sender: TObject;
  const AWord: String; APos: integer; var Valid: Boolean);
var sl: TStringList;
begin
  if not IsIdentifier(APos) then
   begin
    Valid := True;
    Exit;
   end;
  sl := TStringList.Create;
  GetAliases(sl);
  Valid := sl.IndexOf(AWord) = -1;
  sl.Free;
end;

procedure TfrmEasySQLEditor.SyntaxMemo1FinishAnalysis(Sender: TObject);
begin
  // Clear previous results
  TableHighlighter.Clear;
  AliasHighloghter.Clear;
  // Analyze (not background)
  TableHighlighter.Analyze(False);
  AliasHighloghter.Analyze(False);
end;

end.
