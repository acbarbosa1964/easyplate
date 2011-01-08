{ *************************************************************************** }
{                                                                             }
{ EControl Syntax Editor (MDI Application)                                    }
{                                                                             }
{ Copyright (c) 2004 - 2006 EControl Ltd., Zaharov Michael                    }
{     www.econtrol.ru                                                         }
{     support@econtrol.ru                                                     }
{                                                                             }
{ *************************************************************************** }
unit untEasySyncEditMain;

interface

{To compile without RX Library uncomment next UNDEF}
{.$UNDEF USE_RX_LIB}
{$IFNDEF WIN32}
 {$UNDEF USE_RX_LIB}
{$ENDIF}
{$IFNDEF VER140}
 {.$UNDEF USE_RX_LIB}
{$ENDIF}

// Only if EControl Localizer is installed
{.$DEFINE USE_LOCALIZER}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ImgList, ShellApi, StdActns,
  ComCtrls, ActnList, Buttons, ToolWin, Menus,
  {$IFNDEF WIN32} Variants, System.ComponentModel, {$ENDIF}
  {$IFDEF USE_RX_LIB} MRUList, Placemnt, {$ENDIF}
  ecSyntTree, ecKeyMap, ecActns, ecExports, ecPopupCtrl, ecSyntDlg,
  ecSyntMemo, ecSyntAnal, ecPrint, ecStylesCombo, ecPropManager, ecAutoReplace,
  {$IFDEF USE_LOCALIZER}
  ecLocalizer, ecLocalizerEdit, untEditFrm,
  ecAutoReplDlg, ecCodeTemplDlg, ecCodeTemplListDlg, ecCustDlg, ecCustEditDlg,
  ecDictDlg, ecFReplDlg, ecFTextDlg, ecGoLineDlg, ecImpRulesDlg, ecKeyMapDlg,
  ecLexLibDlg, ecLocalizerEditText, ecMacroCmdEditDlg, ecMacroEditDlg,
  ecMultReplDlg, ecMultReplSelectDlg, ecPageSetupBase, ecPageSetupEditor,
  ecPreviewFm, ecsnColEdit, ecsnStyleEdit, ecStlDlg, ecSyntLexFm, ecsnCodeTempl,
  {$ENDIF} ecSpell, AppEvnts, ecSingleInst, ecMacroRec, ActiveX, ecMultRepl;

type

  TfrmEasySyncEditMain = class(TForm)
    ActionList1: TActionList;
    SB: TStatusBar;
    SyntFindDialog1: TSyntFindDialog;
    actOpen: TAction;
    actSave: TAction;
    OD: TOpenDialog;
    SD: TSaveDialog;
    SyntReplaceDialog1: TSyntReplaceDialog;
    actSaveAs: TAction;
    SyntaxManager1: TSyntaxManager;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Splitter1: TSplitter;
    ImageList1: TImageList;
    SyntKeyMapping1: TSyntKeyMapping;
    ecCommandRedo: TecCommandAction;
    ecCommandAction1: TecCommandAction;
    ecCommandAction2: TecCommandAction;
    ecFullCollapse1: TecFullCollapse;
    ecFullExpand1: TecFullExpand;
    ecCopyAsRTF1: TecCopyAsRTF;
    ecCommandAction3: TecCommandAction;
    HelpContents1: THelpContents;
    ecSearch1: TecSearch;
    ecSearchAgain1: TecSearchAgain;
    ecReplace1: TecReplace;
    SyntStyles1: TSyntStyles;
    ecUserRangeDelete1: TecUserRangeDelete;
    ecUserRangeCollapsable1: TecUserRangeCollapsable;
    ecUserRangeTopLine1: TecUserRangeTopLine;
    ecUserRangeBottomLine1: TecUserRangeBottomLine;
    ecUserRangeLineHighlight1: TecUserRangeLineHighlight;
    TemplatePopup1: TTemplatePopup;
    ecSyntPrinter1: TecSyntPrinter;
    ecPrintAction1: TecPrintAction;
    ecPreviewAction1: TecPreviewAction;
    ecExportRTFAction1: TecExportRTFAction;
    ecExportHTMLAction1: TecExportHTMLAction;
    ecCustomizeEditorOptionsAction1: TecCustomizeEditorOptionsAction;
    ecCustomizeSyntaxHighlightingAction1: TecCustomizeSyntaxHighlightingAction;
    ecCustomizeLexerPropertiesAction1: TecCustomizeLexerPropertiesAction;
    ecCustomizeKeyMappingAction1: TecCustomizeKeyMappingAction;
    ecCustomizeUserStylesAction1: TecCustomizeUserStylesAction;
    ecToggleNonPrinted1: TecToggleNonPrinted;
    ecToggleWordWrap1: TecToggleWordWrap;
    PropsManager1: TPropsManager;
    SyntAutoReplace1: TSyntAutoReplace;
    ecCustomizeLexerLib1: TecCustomizeLexerLib;
    ecToggleSyntTreeSync1: TecToggleSyntTreeSync;
    ecCustomizeAutoReplace1: TecCustomizeAutoReplace;
    PropsManager2: TPropsManager;
    ecIncrementalSearch1: TecIncrementalSearch;
    ecPageSetupAction1: TecPageSetupAction;
    ecFindCurrentWordNextAction1: TecFindCurrentWordNextAction;
    ecFindCurrentWordPriorAction1: TecFindCurrentWordPriorAction;
    PrinterSetupDialog2: TPrinterSetupDialog;
    PrintSetupAction: TAction;
    FileExitAction: TAction;
    SharedStyles: TSyntStyles;
    TemplateEditor: TSyntaxMemo;
    PageControl1: TPageControl;
    actSaveAll: TAction;
    actClose: TAction;
    actCloseAll: TAction;
    actMDIView: TAction;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton32: TToolButton;
    ToolButton17: TToolButton;
    ToolBar2: TToolBar;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton18: TToolButton;
    UserStylesCombo1: TUserStylesCombo;
    ToolButton33: TToolButton;
    ToolButton42: TToolButton;
    ToolBar4: TToolBar;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton27: TToolButton;
    ToolButton11: TToolButton;
    ToolButton14: TToolButton;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    PopupMenu1: TPopupMenu;
    Close2: TMenuItem;
    N13: TMenuItem;
    Save2: TMenuItem;
    Saveas2: TMenuItem;
    actSortTree: TAction;
    ecCopy1: TecCopy;
    ecPaste1: TecPaste;
    ecCut1: TecCut;
    ecClear1: TecClear;
    ecUndo1: TecUndo;
    ecSelectAll1: TecSelectAll;
    ecToggleCollapse1: TecToggleCollapse;
    ecDictionary1: TecDictionary;
    actDictionaries: TAction;
    SyntaxTreeView1: TSyntaxTreeView;
    actShowHyperlinks: TAction;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ecSyncEditMode1: TecSyncEditMode;
    TreeImageList: TImageList;
    ecCommentLines1: TecCommentLines;
    ecUnCommentLines1: TecUnCommentLines;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton34: TToolButton;
    ecInSelCollapse1: TecInSelCollapse;
    ecInSelExpand1: TecInSelExpand;
    ecToggleFolding1: TecToggleFolding;
    ToolButton35: TToolButton;
    ToolButton43: TToolButton;
    ApplicationEvents1: TApplicationEvents;
    ecSingleInstance1: TecSingleInstance;
    ecMacroRecorder1: TecMacroRecorder;
    ecMacroRecord1: TecMacroRecord;
    ecMacroStop1: TecMacroStop;
    ecMacroPlay1: TecMacroPlay;
    actEditMacros: TAction;
    ecSortAscending1: TecSortAscending;
    ecSortDescending1: TecSortDescending;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ecGotoLine1: TecGotoLine;
    ToolBar5: TToolBar;
    ToolButton44: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    ToolButton50: TToolButton;
    ecMacroCancel1: TecMacroCancel;
    ecMultiReplace1: TecMultiReplace;
    actMultiReplConfig: TAction;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Reopen1: TMenuItem;
    N6: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    SaveAll1: TMenuItem;
    Close1: TMenuItem;
    CloseAll1: TMenuItem;
    N2: TMenuItem;
    EncodingMenu: TMenuItem;
    ANSI1: TMenuItem;
    Unicode1: TMenuItem;
    SwapedUnicode1: TMenuItem;
    UTF81: TMenuItem;
    FormatMenu: TMenuItem;
    Default1: TMenuItem;
    Windows1: TMenuItem;
    Unix1: TMenuItem;
    Macintosh1: TMenuItem;
    N9: TMenuItem;
    ExportRTF1: TMenuItem;
    ExportHTML1: TMenuItem;
    N11: TMenuItem;
    PageSetup1: TMenuItem;
    PrintSetup1: TMenuItem;
    actPrintPreview1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N3: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    CopyasRTF1: TMenuItem;
    N4: TMenuItem;
    SelectAll1: TMenuItem;
    N16: TMenuItem;
    SortLines1: TMenuItem;
    Ascending1: TMenuItem;
    Descending1: TMenuItem;
    Macros1: TMenuItem;
    Play1: TMenuItem;
    N17: TMenuItem;
    Record1: TMenuItem;
    Stop1: TMenuItem;
    Cancel1: TMenuItem;
    N18: TMenuItem;
    Customize1: TMenuItem;
    Search1: TMenuItem;
    Action11: TMenuItem;
    Findnext1: TMenuItem;
    Replace1: TMenuItem;
    IncrementalSearch1: TMenuItem;
    N14: TMenuItem;
    FindCurrentWordNext1: TMenuItem;
    FindCurrentWordPrior1: TMenuItem;
    N19: TMenuItem;
    GotoLineNumber1: TMenuItem;
    View1: TMenuItem;
    actShowNonPrinted1: TMenuItem;
    Wordwrap1: TMenuItem;
    N10: TMenuItem;
    DisableFolding1: TMenuItem;
    oggleCollapse1: TMenuItem;
    CollapseSelection1: TMenuItem;
    N15: TMenuItem;
    FullExpand1: TMenuItem;
    FullCollapse1: TMenuItem;
    Collapseinselection1: TMenuItem;
    Expandinselection1: TMenuItem;
    N12: TMenuItem;
    SynchronizeTree1: TMenuItem;
    Sortedtree1: TMenuItem;
    Showhyperlinks1: TMenuItem;
    N7: TMenuItem;
    MDIInterface1: TMenuItem;
    SelLexMenu: TMenuItem;
    Options1: TMenuItem;
    EditorProperties1: TMenuItem;
    actCustomize1: TMenuItem;
    SyntaxHighlignting2: TMenuItem;
    LexerLibrary1: TMenuItem;
    KeyMapping1: TMenuItem;
    Userstyles1: TMenuItem;
    Sharedstyles1: TMenuItem;
    CustomizeAutoReplace1: TMenuItem;
    Dictionaries1: TMenuItem;
    MultiReplaceTool1: TMenuItem;
    Language1: TMenuItem;
    WindowMenu: TMenuItem;
    Cascade1: TMenuItem;
    ileHorizontally1: TMenuItem;
    ileVertically1: TMenuItem;
    MinimizeAll1: TMenuItem;
    Arrange1: TMenuItem;
    N8: TMenuItem;
    Contents1: TMenuItem;
    N5: TMenuItem;
    About1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Copy2: TMenuItem;
    Cut2: TMenuItem;
    Paste2: TMenuItem;
    Delete2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    Indent1: TMenuItem;
    Unindent1: TMenuItem;
    MenuItem8: TMenuItem;
    ogglebookmarks1: TMenuItem;
    Bookmark01: TMenuItem;
    Bookmark11: TMenuItem;
    Bookmark21: TMenuItem;
    Bookmark31: TMenuItem;
    Bookmark41: TMenuItem;
    Bookmark51: TMenuItem;
    Bookmark61: TMenuItem;
    Bookmark71: TMenuItem;
    Bookmark81: TMenuItem;
    Bookmark91: TMenuItem;
    Gotobookmarks1: TMenuItem;
    Bookmark02: TMenuItem;
    Bookmark12: TMenuItem;
    Bookmark22: TMenuItem;
    Bookmark32: TMenuItem;
    Bookmark42: TMenuItem;
    Bookmark52: TMenuItem;
    Bookmark62: TMenuItem;
    Bookmark72: TMenuItem;
    Bookmark82: TMenuItem;
    Bookmark92: TMenuItem;
    ToolbarPopup: TPopupMenu;
    N20: TMenuItem;
    ToolsMenu: TMenuItem;
    ConvertText1: TMenuItem;
    exttoUTF81: TMenuItem;
    UTF8toText1: TMenuItem;
    N21: TMenuItem;
    SelectAll2: TMenuItem;
    CharacterSet1: TMenuItem;
    Default2: TMenuItem;
    N22: TMenuItem;
    Ansi2: TMenuItem;
    N23: TMenuItem;
    MAC1: TMenuItem;
    OEM1: TMenuItem;
    N24: TMenuItem;
    Symbol1: TMenuItem;
    Shiftji1: TMenuItem;
    HANGEUL1: TMenuItem;
    Cirillic1: TMenuItem;
    Hebrew1: TMenuItem;
    Arabic1: TMenuItem;
    Greek1: TMenuItem;
    urkish1: TMenuItem;
    Vietnamese1: TMenuItem;
    Baltic1: TMenuItem;
    CentralEurope1: TMenuItem;
    HAI1: TMenuItem;
    JOHAB1: TMenuItem;
    GB23121: TMenuItem;
    CHINESEBIG51: TMenuItem;
    ecMultiReplaceSelectExecuteAction1: TecMultiReplaceSelectExecuteAction;
    N25: TMenuItem;
    MultiReplace1: TMenuItem;
    procedure UpdateStatusBar(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actNewFileExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SyntaxMemo1IncSearchChange(Sender: TObject;
      State: TIncSearchState);
    procedure SyntaxManager1LexerChanged(Sender: TObject);
    procedure ecCustomizeEditorOptionsAction1ExecuteOK(Sender: TObject);
    procedure PrintSetupActionExecute(Sender: TObject);
    procedure FileExitActionExecute(Sender: TObject);
    procedure ecCustomizeLexerPropertiesAction1ExecuteOK(Sender: TObject);
    procedure Sharedstyles1Click(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure SetEncoding(Sender: TObject);
    procedure SetFormat(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SplitterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure actSaveAllUpdate(Sender: TObject);
    procedure actCloseUpdate(Sender: TObject);
    procedure actCloseAllUpdate(Sender: TObject);
    procedure actSaveAllExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actCloseAllExecute(Sender: TObject);
    procedure actMDIViewUpdate(Sender: TObject);
    procedure actMDIViewExecute(Sender: TObject);
    procedure ToolbarPopupPopup(Sender: TObject);
    procedure ShowToolbar(Sender: TObject);
    procedure actSortTreeUpdate(Sender: TObject);
    procedure actSortTreeExecute(Sender: TObject);
    procedure ToolButton28Click(Sender: TObject);
    procedure actDictionariesExecute(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure actShowHyperlinksUpdate(Sender: TObject);
    procedure actShowHyperlinksExecute(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ecSingleInstance1AcceptInstInfo(Sender: TObject; S: String;
      var Accept: Boolean);
    procedure ToolButton44Click(Sender: TObject);
    procedure ecMacroRecorder1Change(Sender: TObject);
    procedure actEditMacrosExecute(Sender: TObject);
    procedure actMultiReplConfigExecute(Sender: TObject);
    procedure ToggleBookmark(Sender: TObject);
    procedure GotoBookmark(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure exttoUTF81Click(Sender: TObject);
    procedure SetEditorCharset(Sender: TObject);
    procedure SyntAutoReplace1CheckChar(Sender: TObject; C: Word;
      var IsWord: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    FReadOnly: Boolean;
    FCurrentEditor: TSyntaxMemo;
    FMDIView: Boolean;
    FHyperlinkHlt: Boolean;
    procedure SaveFrame(Frame: TEditorFrame; PromtDialog: Boolean = False);
    procedure ApplySharedStyles;
    procedure SetCurrentEditor(const Value: TSyntaxMemo);
    procedure SetCurrentFrame(const Value: TEditorFrame);
    function GetCurrentFrame: TEditorFrame;
    function GetFrameCount: integer;
    function GetFrames(Index: integer): TEditorFrame;
    function GetModifiedCount: integer;
    function PromtToSave(Frame: TEditorFrame; AllowAll: Boolean): TModalResult;
    procedure SetMDIView(const Value: Boolean);
    procedure ChildCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ChildClose(Sender: TObject; var Action: TCloseAction);
    procedure TitleChanged(Sender: TObject);
    procedure CloseAll(DoPromt: Boolean);
    procedure SetHyperlinkHlt(const Value: Boolean);
    function ReloadPrompt: Boolean;
    procedure ReplaceFromDict(Sender: TObject);
{$IFDEF USE_LOCALIZER}
  private
    FLocalizer: TecLocalizer;
    function GetLanguage: string;
    procedure SetLanguage(Value: string);
    procedure LoadLanguages;
    procedure LocalizeClick(Sender: TObject);
    procedure EditLocalizeClick(Sender: TObject);
  published
    property Language: string read GetLanguage write SetLanguage;
{$ENDIF}
  private
    {$IFDEF USE_RX_LIB}
    FormPlacement: TFormPlacement;
    MRU: TMRUManager;
    procedure MRUClick(Sender: TObject; const RecentName, Caption: String;
      UserData: Integer);
    {$ENDIF}
    procedure FrameChanged;
    procedure FrameClosed(Frame: TEditorFrame);
    procedure RegisterNewEditorFrame(Frame: TEditorFrame);
    procedure CreateBind(Frame: TEditorFrame);
    procedure LoadTreeImages;
    procedure UpdateToolsMenu;
    procedure ToolClick(Sender: TObject);
  protected
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    function OpenFile(const AFileName: string): TEditorFrame;
    function CreateFrame(const FileName: string): TEditorFrame;
    procedure CloseFrame(Frame: TEditorFrame);

    property CurrentEditor: TSyntaxMemo read FCurrentEditor write SetCurrentEditor;
    property CurrentFrame: TEditorFrame read GetCurrentFrame write SetCurrentFrame;
    property FrameCount: integer read GetFrameCount;
    property Frames[Index: integer]: TEditorFrame read GetFrames;
  published
    property MDIView: Boolean read FMDIView write SetMDIView;
    property HyperlinkHlt: Boolean read FHyperlinkHlt write SetHyperlinkHlt;
  end;

var
  frmEasySyncEditMain: TfrmEasySyncEditMain;

implementation

uses ecStrUtils, ChildFrm, inifiles, ecExtHighlight, ecEmbObj,
  untEasySyncEditMainChildFrm;


{$R *.dfm}
type
  TControlHack = class(TControl);

constructor TfrmEasySyncEditMain.Create(AOwner: TComponent);
begin
  OleInitialize(nil);
  inherited;
  TControlHack(Splitter1).OnMouseDown := SplitterMouseDown;
  FHyperlinkHlt := True;
{$IFDEF USE_RX_LIB}
  FormPlacement := TFormPlacement.Create(Self);
  FormPlacement.Name := 'FormPlacement';
  FormPlacement.IniFileName := ChangeFileExt(Application.ExeName, '.ini');
  FormPlacement.IniSection := 'MainForm';
  MRU := TMRUManager.Create(Self);
  MRU.Name := 'MRU';
  MRU.AccelDelimiter := adSpace;
  MRU.Capacity := 9;
  MRU.RecentMenu := Reopen1;
  MRU.OnClick := MRUClick;
  MRU.IniStorage := FormPlacement;
  Reopen1.Visible := True;
  FormPlacement.RestoreFormPlacement;
{$ENDIF}
end;

procedure TfrmEasySyncEditMain.LoadTreeImages;
var s: string;
    bmp: TBitmap;
    c: TColor;
begin
  // Loading tree images
  s := ExtractFilePath(Application.ExeName) + 'ecTreeImg.bmp';
  if FileExists(s) then
   try
     bmp := TBitmap.Create;
     try
       bmp.LoadFromFile(s);
     except
       bmp.Free;
       Exit;
     end;
     if bmp.Empty then Exit;
     c := bmp.Canvas.Pixels[0,0];
     bmp.Free;
     if TreeImageList.GetInstRes(0, rtBitmap, s, 16, [lrFromFile], c) then
       SyntaxTreeView1.Images := TreeImageList;
    except
    end;
end;

procedure TfrmEasySyncEditMain.FormShow(Sender: TObject);
var s: string;
    ini: TIniFile;

  procedure LoadFile(Comp: TLoadableComponent; const AFileName: string);
  begin
    if FileExists(AFileName) then
      try
        Comp.LoadFromFile(AFileName);
      except
        Application.HandleException(Self);
      end;
  end;
begin
  DragAcceptFiles(Handle, True);
  Caption := 'EControl syntax' + {$IFDEF EC_UNICODE}' (unicode)' + {$ENDIF}' editor';

  {$IFDEF USE_LOCALIZER}
  LoadLanguages;
  {$ELSE}
  Language1.Enabled := False;
  {$ENDIF}
  PropsManager1.LoadProps;
  PropsManager1.UpdateAll;
  PropsManager2.LoadProps;
  LoadFile(SyntaxManager1, ExtractFilePath(Application.ExeName) + 'LexLib.LXL');
  LoadFile(SyntStyles1, ChangeFileExt(Application.ExeName, '.ecs'));

  S := ChangeFileExt(Application.ExeName, '.mcs');
  if FileExists(S) then
    ecMacroRecorder1.LoadFromFile(S);
  S := ChangeFileExt(Application.ExeName, '.mrt');
  if FileExists(S) then
   begin
    ecMultiReplace1.LoadFromFile(S);
    UpdateToolsMenu;
   end;
  LoadTreeImages;
//  LoadFile(SharedStyles, ChangeFileExt(Application.ExeName, '.ess'));
  s := ChangeFileExt(Application.ExeName, '.ari');
  if FileExists(s) then
   SyntAutoReplace1.Items.LoadFromFile(s);

  FReadOnly := (ParamCount > 1) and SameText(ParamStr(2), 'r');
  if FReadOnly then FileExitAction.ShortCut := VK_ESCAPE;

  ecDictionary1.LoadCfg(ChangeFileExt(Application.ExeName, '.ini'));

  ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    SyntKeyMapping1.AsString := ini.ReadString('KeyMapping', 'Data', '');
  finally
    ini.Free;
  end;

  if ParamCount > 0 then  OpenFile(ParamStr(1))
    else CreateFrame('');
end;

procedure TfrmEasySyncEditMain.FormClose(Sender: TObject; var Action: TCloseAction);
var ini: TIniFile;
begin
//  CloseAll(False);
  CurrentEditor := nil;
{$IFDEF USE_RX_LIB}
  FormPlacement.SaveFormPlacement;
{$ENDIF}
  PropsManager1.SaveProps;
  PropsManager2.SaveProps;
  SyntStyles1.SaveToFile(ChangeFileExt(Application.ExeName, '.ecs'));
//  SharedStyles.SaveToFile(ChangeFileExt(Application.ExeName, '.ess'));
  SyntAutoReplace1.Items.SaveToFile(ChangeFileExt(Application.ExeName, '.ari'));
  ecDictionary1.SaveCfg(ChangeFileExt(Application.ExeName, '.ini'));
  ecMacroRecorder1.SaveToFile(ChangeFileExt(Application.ExeName, '.mcs'));
  ecMultiReplace1.SaveToFile(ChangeFileExt(Application.ExeName, '.mrt'));

  ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    ini.WriteString('KeyMapping', 'Data', SyntKeyMapping1.AsString);
  finally
    ini.Free;
  end;
end;

function TfrmEasySyncEditMain.OpenFile(const AFileName: string): TEditorFrame;
var i: integer;
begin

  // Check, if the file is opened
  for i := 0 to FrameCount - 1 do
   if Frames[i].IsTheFile(AFileName) then
    begin
      Result := Frames[i];
      CurrentFrame := Frames[i];
      Exit;
    end;
  // Create new frame and load file
  if (FrameCount = 1) and Frames[0].IsNewFile and not Frames[0].Modified then
    Result := Frames[0]
  else
    Result := CreateFrame(AFileName);
  Result.TextSource.SyntaxAnalyzer := SyntaxManager1.AnalyzerForFile(AFileName);
  Result.LoadFile(AFileName);
  SyntaxManager1.CurrentLexer := Result.TextSource.SyntaxAnalyzer;
  FrameChanged;
//  Result.ecSpellChecker1.Active := True;
  if not Result.EditorMaster.Focused then
    Result.EditorMaster.SetFocus;
{$IFDEF USE_RX_LIB}
  MRU.Add(AFileName, 0);
{$ENDIF}
end;

// Save specified frame
procedure TfrmEasySyncEditMain.SaveFrame(Frame: TEditorFrame; PromtDialog: Boolean);
begin
  if Frame = nil then Exit;
  if not PromtDialog then
    PromtDialog := Frame.IsNewFile;
  if PromtDialog then
    begin
      SD.Filter := SyntaxManager1.GetFilesFilter;
      SD.FileName := Frame.FileName;
      if SD.Execute then
       begin
        Frame.SaveFile(SD.FileName);
    {$IFDEF USE_RX_LIB}
        if not Frame.IsTheFile(SD.FileName) then
          MRU.Add(SD.FileName, 0);
    {$ENDIF}
       end;
    end
  else Frame.SaveFile(Frame.FileName);
end;

procedure TfrmEasySyncEditMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i, ModifiedCount, Res: integer;
begin
  ModifiedCount := GetModifiedCount;
  if ModifiedCount > 0 then
    begin
      res := IDYES;
      for i := 0 to FrameCount - 1 do
        if Frames[i].Modified then
          begin
            if res <> mrAll then
              res := PromtToSave(Frames[i], ModifiedCount > 1);
            case res of
              mrYes, mrAll: SaveFrame(Frames[i], False);
              mrCancel: begin
                         CanClose := False;
                         Exit;
                        end;
            end;
            Dec(ModifiedCount);
          end;
    end;

  if SyntaxManager1.Modified then
   case MessageDlg('Save changes to LexLib.lxl?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
    mrYes:  SyntaxManager1.SaveToFile(ExtractFilePath(Application.ExeName) + 'LexLib.LXL');
    mrCancel: begin
               CanClose := False;
               Exit;
              end;
   end;
end;

function TfrmEasySyncEditMain.PromtToSave(Frame: TEditorFrame; AllowAll: Boolean): TModalResult;
var Buttons: TMsgDlgButtons;
begin
  Buttons := [mbYes, mbNo, mbCancel];
  if AllowAll then
    Include(Buttons, mbAll);
  Result := MessageDlg('Save changes to ' + ExtractFileName(Frame.FileName) + '?',
     mtConfirmation, Buttons, 0);
end;

function TfrmEasySyncEditMain.GetModifiedCount: integer;
var i: integer;
begin
  Result := 0;
  for i := 0 to FrameCount - 1 do
    if Frames[i].Modified then
      Inc(Result);
end;

{$IFDEF USE_RX_LIB}
procedure TfrmEasySyncEditMain.MRUClick(Sender: TObject; const RecentName,
  Caption: String; UserData: Integer);
begin
  OpenFile(RecentName);
end;
{$ENDIF}

procedure TfrmEasySyncEditMain.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled := (CurrentFrame <> nil) and CurrentFrame.Modified;
end;

procedure TfrmEasySyncEditMain.actNewFileExecute(Sender: TObject);
begin
  CreateFrame('');
end;

procedure TfrmEasySyncEditMain.actOpenExecute(Sender: TObject);
begin
  OD.Filter := SyntaxManager1.GetFilesFilter;
  if OD.Execute then
    OpenFile(OD.FileName);
end;

procedure TfrmEasySyncEditMain.actSaveExecute(Sender: TObject);
begin
  if CurrentFrame <> nil then
    SaveFrame(CurrentFrame, False);
end;

procedure TfrmEasySyncEditMain.actSaveAsExecute(Sender: TObject);
begin
  if CurrentFrame <> nil then
    SaveFrame(CurrentFrame, True);
end;

procedure TfrmEasySyncEditMain.About1Click(Sender: TObject);
begin
  TForm1.Create(Self).ShowModal;
end;

procedure TfrmEasySyncEditMain.PrintSetupActionExecute(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmEasySyncEditMain.FileExitActionExecute(Sender: TObject);
begin
  {$IFNDEF VER130}
  FileExitAction.ActionComponent := nil;
  {$ENDIF}
  Close;
end;

procedure TfrmEasySyncEditMain.actSaveAllUpdate(Sender: TObject);
begin
  actSaveAll.Enabled := GetModifiedCount > 0;
end;

procedure TfrmEasySyncEditMain.actCloseUpdate(Sender: TObject);
begin
  actClose.Enabled := CurrentFrame <> nil;
end;

procedure TfrmEasySyncEditMain.actCloseAllUpdate(Sender: TObject);
begin
  actCloseAll.Enabled := FrameCount > 0;
end;

procedure TfrmEasySyncEditMain.actSaveAllExecute(Sender: TObject);
var i: integer;
begin
  for i := 0 to FrameCount - 1 do
    if Frames[i].Modified then
      SaveFrame(Frames[i], False);
end;

procedure TfrmEasySyncEditMain.actCloseExecute(Sender: TObject);
var Frm: TEditorFrame;
begin
  Frm := CurrentFrame;
  if Frm.Modified then
   if PromtToSave(Frm, False) = mrYes then
     SaveFrame(Frm, False);
  CloseFrame(Frm);
end;

procedure TfrmEasySyncEditMain.CloseAll(DoPromt: Boolean);
var i, ModifiedCount, Res: integer;
begin
  ModifiedCount := GetModifiedCount;
  res := IDYES;
  for i := FrameCount - 1 downto 0 do
    begin
      if Frames[i].Modified then
        begin
          if (res <> mrAll) or not DoPromt then
            res := PromtToSave(Frames[i], ModifiedCount > 1);
          case res of
            mrYes, mrAll: SaveFrame(Frames[i], False);
            mrCancel: Exit;
          end;
          Dec(ModifiedCount);
        end;
      CloseFrame(Frames[i]);
    end;
end;

procedure TfrmEasySyncEditMain.actCloseAllExecute(Sender: TObject);
begin
  CloseAll(True);
end;

procedure TfrmEasySyncEditMain.ChildCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var Frm: TEditorFrame;
begin
  with Sender as TMDIChild do
  if ControlCount > 0 then
    begin
      Frm := TEditorFrame(Controls[0]);
      if Frm.Modified then
       case PromtToSave(Frm, False) of
         mrYes: SaveFrame(Frm, False);
         mrCancel: CanClose := False;
       end;
    end;
end;

procedure TfrmEasySyncEditMain.ChildClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrameClosed(TEditorFrame(TForm(Sender).Controls[0]));
end;

procedure TfrmEasySyncEditMain.actMDIViewUpdate(Sender: TObject);
begin
  actMDIView.Checked := MDIView;
end;

procedure TfrmEasySyncEditMain.actMDIViewExecute(Sender: TObject);
begin
  MDIView := not MDIView;
end;

//==============================================================================
// Editors management
//==============================================================================

function TfrmEasySyncEditMain.CreateFrame(const FileName: string): TEditorFrame;
begin
  Result := TEditorFrame.Create(Self);
  Result.Name := '';
  Result.OnTitleChanged := TitleChanged;
  Result.EditorSlave.KeyMapping := SyntKeyMapping1;
  Result.EditorMaster.KeyMapping := SyntKeyMapping1;
  CreateBind(Result);
  RegisterNewEditorFrame(Result);
  CurrentFrame := Result;
  Result.HyperlinkHighlighter1.Active := FHyperlinkHlt;
end;

procedure TfrmEasySyncEditMain.CreateBind(Frame: TEditorFrame);
var tab: TTabSheet;
    frm: TForm;
begin
  if FMDIView then
    begin
      frm := TMDIChild.Create(Self, Frame);
      frm.Caption := Frame.Title;
      frm.OnCloseQuery := ChildCloseQuery;
      frm.OnClose := ChildClose;
    end
  else
    begin
      tab := TTabSheet.Create(Self);
      tab.PageControl := PageControl1;
      tab.Caption := Frame.Title;
      Frame.Parent := tab;
    end;
end;

procedure TfrmEasySyncEditMain.RegisterNewEditorFrame(Frame: TEditorFrame);
begin
  with Frame do
    begin
      PropsManager1.Add(EditorSlave);
      PropsManager1.Add(EditorMaster);

      EditorMaster.ReadOnly := FReadOnly;
      EditorMaster.OnIncSearchChange := SyntaxMemo1IncSearchChange;

      EditorSlave.ReadOnly := FReadOnly;
      EditorSlave.OnIncSearchChange := SyntaxMemo1IncSearchChange;
    end;
end;

procedure TfrmEasySyncEditMain.SetCurrentEditor(const Value: TSyntaxMemo);
begin
  if FCurrentEditor = Value then Exit;
  ecSyntPrinter1.SyntMemo := Value;
  SyntAutoReplace1.SyntMemo := Value;
  TemplatePopup1.SyntMemo := Value;
  SyntFindDialog1.Control := Value;
  SyntReplaceDialog1.Control := Value;
  UserStylesCombo1.Editor := Value;
  ecMacroRecorder1.SyntMemo := Value;
  ecCustomizeLexerPropertiesAction1.SyntMemo := Value;
  ecMultiReplace1.SyntMemo := Value;
  if SyntaxTreeView1.Width = 0 then SyntaxTreeView1.SyntaxMemo := nil else
   if not (not SyntaxTreeView1.AutoSynchronize and Assigned(Value) and
     Assigned(FCurrentEditor) and (Value.Parent = FCurrentEditor.Parent)) then
    SyntaxTreeView1.SyntaxMemo := Value;
  FCurrentEditor := Value;
  if (FCurrentEditor <> nil) and not FCurrentEditor.Focused then
    FCurrentEditor.SetFocus;
  if FCurrentEditor <> nil then
   begin
    UpdateStatusBar(FCurrentEditor);
    if FCurrentEditor.SyntObj <> nil then
      SyntaxManager1.CurrentLexer := FCurrentEditor.SyntObj.Owner
    else
      SyntaxManager1.CurrentLexer := nil;
   end;
end;

procedure TfrmEasySyncEditMain.SetCurrentFrame(const Value: TEditorFrame);
begin
  if FMDIView then
    Value.Parent.SetFocus
  else
    PageControl1.ActivePage := TTabSheet(Value.Parent);
  FrameChanged;
end;

function TfrmEasySyncEditMain.GetCurrentFrame: TEditorFrame;
begin
  Result := nil;
  if FMDIView then
    begin
      if ActiveMDIChild <> nil then
        Result := TEditorFrame(ActiveMDIChild.Controls[0])
    end
  else
    begin
      if (PageControl1.ActivePage <> nil) then
        Result := TEditorFrame(PageControl1.ActivePage.Controls[0])
    end;
end;

function TfrmEasySyncEditMain.GetFrameCount: integer;
begin
  if FMDIView then
    Result := MDIChildCount
  else
    Result := PageControl1.PageCount;
end;

function TfrmEasySyncEditMain.GetFrames(Index: integer): TEditorFrame;
begin
  if FMDIView then
    Result := TEditorFrame(MDIChildren[Index].Controls[0])
  else
    Result := TEditorFrame(PageControl1.Pages[Index].Controls[0])
end;

procedure TfrmEasySyncEditMain.FrameChanged;
  // Checks tree images
  procedure SetImages;
  var i: integer;
  begin
    if (TreeImageList.Count > 0) and (CurrentFrame.TextSource.SyntaxAnalyzer <> nil) then
     with CurrentFrame.TextSource.SyntaxAnalyzer do
      for i := 0 to BlockRules.Count - 1 do
       if (BlockRules[i].TreeItemImage <> -1) or
          (BlockRules[i].TreeGroupImage <> -1) then
        begin
          SyntaxTreeView1.Images := TreeImageList;
          Exit;
        end;
    SyntaxTreeView1.Images := nil;
  end;
begin
  if CurrentFrame <> nil then
    with CurrentFrame do
     begin
       SyntaxManager1.CurrentLexer := TextSource.SyntaxAnalyzer;
        if FMDIView and (TForm(Parent).ActiveControl is TSyntaxMemo) then
          CurrentEditor := TForm(Parent).ActiveControl as TSyntaxMemo
        else
          CurrentEditor := EditorMaster;
       ecSyntPrinter1.Title := Title;
//       SyntaxTreeView1.SyntaxMemo := EditorMaster;
  //  Caption := 'EControl syntax' + {$IFDEF EC_UNICODE}' (unicode)' + {$ENDIF}' editor [' + FileName + ']';
       Application.Title := Title;
       SetImages;
     end;
end;

procedure TfrmEasySyncEditMain.FrameClosed(Frame: TEditorFrame);
begin
  if (CurrentEditor <> nil) and
     (CurrentEditor.Parent = Frame) then
    CurrentEditor := nil;
end;

procedure TfrmEasySyncEditMain.PageControl1Change(Sender: TObject);
begin
  FrameChanged;
end;

procedure TfrmEasySyncEditMain.CloseFrame(Frame: TEditorFrame);
var ts: TTabSheet;
begin
  CurrentEditor := nil;
  if Frame.Parent is TTabSheet then
   begin
//    FrameClosed(Frame);
    ts := Frame.Parent as TTabSheet;
    Frame.Free;
    ts.Free;
   end
  else
    TForm(Frame.Parent).Close;
  // Empty new doc after close all
  if not FMDIView and (PageControl1.PageCount = 0) then
   CreateFrame('');
end;

procedure TfrmEasySyncEditMain.SetMDIView(const Value: Boolean);
var i: integer;
begin
  if FMDIView <> Value then
    begin
      FMDIView := Value;
      WindowMenu.Visible := FMDIView;
      if FMDIView then
        begin
          PageControl1.SetFocus;
          PageControl1.Visible := False;
          for i := PageControl1.PageCount - 1 downto 0 do
           begin
            CreateBind(TEDitorFrame(PageControl1.Pages[i].Controls[0]));
            PageControl1.Pages[i].Free;
           end;
          Color := clAppWorkSpace;
        end
      else
        begin
          Color := clBtnFace;
          for i := MDIChildCount - 1 downto 0 do
            begin
              CreateBind(TEDitorFrame(MDIChildren[i].Controls[0]));
              MDIChildren[i].Free;
            end;
          PageControl1.Visible := True;
        end;
    end;
end;

procedure TfrmEasySyncEditMain.TitleChanged(Sender: TObject);
begin
  if CurrentFrame = Sender then
   with CurrentFrame do
    begin
     ecSyntPrinter1.Title := Title;
     Application.Title := Title;
    end;
end;
//==============================================================================
// Localization
//==============================================================================
// Loads *.lng files
{$IFDEF USE_LOCALIZER}
procedure TfrmEasySyncEditMain.LoadLanguages;
var F: TSearchRec;
    R: integer;
    Dir, S: string;
    mi: TMenuItem;
begin
  Language1.Clear;
 {$IFDEF WIN32}
  Dir := ExtractFileDir(Application.ExeName);
  try
    R := FindFirst(Dir + '\*.lng', faAnyFile, F);
    while R = 0 do
     begin
       S := ExtractFileName(F.Name);
       R := Pos('.', S);
       if R > 1 then S := Copy(S, 1, R - 1);
       mi := TMenuItem.Create(Self);
       mi.Caption := '&' + S;
       mi.RadioItem := True;
       mi.OnClick := LocalizeClick;
       Language1.Add(mi);

       R := FindNext(F);
     end;
  finally
    FindClose(F);
  end;
 {$ENDIF}
 mi := TMenuItem.Create(Self);
 mi.Caption := '-';
 Language1.Add(mi);

 mi := TMenuItem.Create(Self);
 mi.Caption := 'Edit Localization';
 mi.OnClick := EditLocalizeClick;
 Language1.Add(mi);
end;


procedure TfrmEasySyncEditMain.LocalizeClick(Sender: TObject);
var i: integer;
    fn: string;
begin
  if FLocalizer = nil then
    FLocalizer := TecLocalizer.Create(Self);

  fn := ExtractFilePath(Application.ExeName) +
        RemoveAmpersand((Sender as TMenuItem).Caption) + '.lng';
  FLocalizer.LoadFromFile(fn);
  FLocalizer.Enabled := True;

  for i := 0 to Language1.Count - 1 do
    Language1.Items[i].Checked := Language1.Items[i] = Sender;
  LocalizeForms;
end;


procedure TfrmEasySyncEditMain.EditLocalizeClick(Sender: TObject);
begin
  EditLocalizer(FLocalizer, [TSyntEditMain,
    TAutoReplDlg,
    TAddTemplateDlg,
    TCodeTemplatesDlg,
    TCustomSyntDlg,
    TCustSyntMemoDlg,
    TDictionariesDlg,
    TReplaceTextDlg,
    TFindTextDlg,
    TecGotoLineDlg,
    TImportRules,
    TecKeyMappingEditor,
    TLexerLibraryDlg,
    TLocalizerTextEditDlg,
    TMacroCmdEditDlg,
    TMacrosEditDlg,
    TMultiReplaceDlg,
    TMultiReplaceSelectDlg,
    TPageSetupBaseDlg,
    TPageSetupEditorDlg,
    TSyntPreviewForm,
    TSyntCodeTemplFrame,
    TSyntColFrame,
    TSyntStyleFrame,
    TStylesColEdit,
    TSyntLexerDlg
    ], False);
end;

function TfrmEasySyncEditMain.GetLanguage: string;
var i: integer;
begin
  for i := 0 to Language1.Count - 1 do
   with Language1.Items[i] do
    if Checked then
     begin
      Result := RemoveAmpersand(Caption);
      Exit;
     end;
  Result := '';
end;

procedure TfrmEasySyncEditMain.SetLanguage(Value: string);
var i: integer;
begin
  Value := RemoveAmpersand(Value);
  for i := 0 to Language1.Count - 1 do
   with Language1.Items[i] do
    if SameText(RemoveAmpersand(Caption), Value) then
     begin
      LocalizeClick(Language1.Items[i]);
      Exit;
     end;
end;
{$ENDIF}

//==============================================================================
// Common editor's event handlers
//==============================================================================
procedure TfrmEasySyncEditMain.ecCustomizeLexerPropertiesAction1ExecuteOK(
  Sender: TObject);
begin
  SyntaxManager1.Modified := True;
end;

procedure TfrmEasySyncEditMain.UpdateStatusBar(Sender: TObject);
//var idx: integer;
begin
  with Sender as TSyntaxMemo do
   begin
     SB.Panels[0].Text := Format('  %d: %d', [CaretPos.X, CaretPos.Y]);
     if Modified then  SB.Panels[1].Text := 'Modified'
                 else  SB.Panels[1].Text := '';
     if ReplaceMode then SB.Panels[2].Text := 'Overwrite'
                    else SB.Panels[2].Text := 'Insert';
{     if SyntObj = nil then
       idx := -1 else
       idx := SyntObj.TokenAtPos(CaretStrPos);
     if idx = -1 then SB.Panels[3].Text := '-1'
       else SB.Panels[3].Text := SyntObj.TagStr[idx];}
   end;
end;

procedure TfrmEasySyncEditMain.SyntaxMemo1IncSearchChange(Sender: TObject;
  State: TIncSearchState);
begin
  if State = isStart then
   with Sender as TSyntaxMemo do
     begin
      IncSearchBack := ftBackward in SyntFindDialog1.Flags;
      IncSearchIgnoreCase := not (ftCaseSensitive in SyntFindDialog1.Flags);
     end;
  if State <> isStop then
   SB.SimpleText := 'Search for: ' + (Sender as TSyntaxMemo).IncSearchStr
  else
   SB.SimpleText := '';
  SB.SimplePanel := State <> isStop;
end;

//==============================================================================
// Other event handlers
//==============================================================================
procedure TfrmEasySyncEditMain.SyntaxManager1LexerChanged(Sender: TObject);
begin
  if (CurrentFrame <> nil) then
    CurrentFrame.TextSource.SyntaxAnalyzer := SyntaxManager1.CurrentLexer;
end;

procedure TfrmEasySyncEditMain.Sharedstyles1Click(Sender: TObject);
begin
  if SharedStyles.Customize then
   ApplySharedStyles;
end;

procedure TfrmEasySyncEditMain.ApplySharedStyles;
var i: integer;
begin
  for i := 0 to SyntaxManager1.AnalyzerCount - 1 do
   SyntaxManager1.Analyzers[i].Formats.Synchronize(SharedStyles.Styles);
end;

procedure TfrmEasySyncEditMain.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var i : integer;
    en: Boolean;
begin
  if Action = FileExitAction then
   begin
    en := CurrentFrame <> nil;
    FormatMenu.Enabled := en;
    EncodingMenu.Enabled := en;
    if en then
      with CurrentFrame.TextSource do
      begin
        for i := 0 to FormatMenu.Count - 1 do
          FormatMenu.Items[i].Checked :=
            integer(Lines.TextFormat) = FormatMenu.Items[i].Tag;
        for i := 0 to EncodingMenu.Count - 1 do
          EncodingMenu.Items[i].Checked :=
            integer(Lines.TextCoding) = EncodingMenu.Items[i].Tag;
      end;
    CharacterSet1.Enabled := CurrentEditor <> nil;
    if CharacterSet1.Enabled then
      for i := 0 to CharacterSet1.Count - 1 do
       with CharacterSet1.Items[i] do
        if Tag <> -1 then
          Checked := Tag = CurrentEditor.Charset;
   end;
end;

procedure TfrmEasySyncEditMain.SetEncoding(Sender: TObject);
var te: TTextCoding;
begin
  te := TTextCoding((Sender as TMenuItem).Tag);
  if CurrentFrame <> nil then
   with CurrentFrame do
    if te <> TextSource.Lines.TextCoding then
      begin
        TextSource.Lines.TextCoding := te;
//        if not ReloadPrompt then
        Modified := True;
      end;
end;

procedure TfrmEasySyncEditMain.SetFormat(Sender: TObject);
var tf: TTextFormat;
begin
  tf := TTextFormat((Sender as TMenuItem).Tag);
  if CurrentFrame <> nil then
   with CurrentFrame do
    if tf <> TextSource.Lines.TextFormat then
      begin
        TextSource.Lines.TextFormat := tf;
        Modified := True;
      end;
end;

procedure TfrmEasySyncEditMain.SplitterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not SyntaxTreeView1.Visible or (SyntaxTreeView1.Width = 0) then
   begin
    SyntaxTreeView1.Left := 0;
    Splitter1.Left := 1;
   end;
end;

procedure TfrmEasySyncEditMain.ecCustomizeEditorOptionsAction1ExecuteOK(
  Sender: TObject);
begin
  PropsManager1.UpdateAll;
end;

procedure TfrmEasySyncEditMain.ToolbarPopupPopup(Sender: TObject);
var i, N: integer;
    mi: TMenuItem;
begin
  ToolbarPopup.Items.Clear;
  N := ComponentCount;
  for i := 0 to N - 1 do
   if Components[i] is TToolBar then
    with Components[i] as TToolBar do
    begin
      mi := TMenuItem.Create(Self);
      mi.Caption := Caption;
      mi.Checked := Visible;
      mi.Tag := integer(Self.Components[i]);
      mi.OnClick := ShowToolbar;
      ToolbarPopup.Items.Add(mi);
    end;
end;

procedure TfrmEasySyncEditMain.ShowToolbar(Sender: TObject);
begin
  with TToolbar((Sender as TComponent).Tag) do
    Visible := not Visible;
end;

procedure TfrmEasySyncEditMain.actSortTreeUpdate(Sender: TObject);
begin
  actSortTree.Checked := SyntaxTreeView1.SortType = stText;
end;

procedure TfrmEasySyncEditMain.actSortTreeExecute(Sender: TObject);
begin
  if SyntaxTreeView1.SortType = stText then
    begin
      SyntaxTreeView1.SortType := stNone;
      SyntaxTreeView1.UpdateTree;
    end
  else
    SyntaxTreeView1.SortType := stText;
end;

// Processing single instance message
procedure TfrmEasySyncEditMain.WndProc(var Message: TMessage);
var PC: array[0..MAX_PATH] of Char;
    N, i: integer;
begin
  case Message.Msg of
    WM_DROPFILES:
       begin
         N := DragQueryFile(Message.wParam, $FFFFFFFF, nil, 0);
         for i := 0 to N - 1 do
          if DragQueryFile(Message.wParam, i, PC, MAX_PATH) > 0 then
           try
             OpenFile(PC);
           except
           end;
         DragFinish(Message.wParam);
       end;
    else inherited;
  end;
end;

procedure TfrmEasySyncEditMain.actDictionariesExecute(Sender: TObject);
begin
  ecDictionary1.Customize;
end;

procedure TfrmEasySyncEditMain.Splitter1Moved(Sender: TObject);
begin
  if (SyntaxTreeView1.Width = 0) or (CurrentEditor = nil) then
    SyntaxTreeView1.SyntaxMemo := nil else
   SyntaxTreeView1.SyntaxMemo := CurrentEditor;
end;

procedure TfrmEasySyncEditMain.SetHyperlinkHlt(const Value: Boolean);
var i: integer;
begin
  FHyperlinkHlt := Value;
  for i := 0 to FrameCount - 1 do
   Frames[i].HyperlinkHighlighter1.Active := FHyperlinkHlt;
end;

procedure TfrmEasySyncEditMain.actShowHyperlinksUpdate(Sender: TObject);
begin
  actShowHyperlinks.Checked := HyperlinkHlt;
end;

procedure TfrmEasySyncEditMain.actShowHyperlinksExecute(Sender: TObject);
begin
  HyperlinkHlt := not HyperlinkHlt;
end;

{procedure TSyntEditMain.ToolButton35Click(Sender: TObject);
var memo: TSyntaxMemo;
    i: integer;
    r: TTagBlockCondition;
    Range: TTextRange;
    p: TPoint;
begin
  memo := CurrentEditor;
  if (memo = nil) or (memo.SyntObj = nil) then Exit;
  // look for rule to collapse
  r := TTagBlockCondition(memo.SyntObj.Owner.BlockRules.ItemByName('begin'));
  if r = nil then Exit;

  memo.BeginUpdate;
  try
    for i := 0 to memo.SyntObj.RangeCount - 1 do
     begin
      Range := memo.SyntObj.Ranges[i];
      if Range.Rule = r then
       begin
        p := memo.SyntObj.GetRangeBound(Range);
        // Checks that range occupies more than one line (optional)
        if memo.StrPosToCaretPos(p.X).Y < memo.StrPosToCaretPos(p.y).Y then
           memo.CollapseRange(memo.SyntObj.Ranges[i], False);
       end;
     end;
  finally
    memo.EndUpdate;
  end;
end;

procedure TSyntEditMain.ToolButton35Click(Sender: TObject);
var t: integer;
begin
  t := GetTickCount;
  CurrentEditor.SyntObj.Clear;
  CurrentEditor.SyntObj.Analyze;
  Caption := IntToStr(GetTickCount - t);
end;}

procedure TfrmEasySyncEditMain.ApplicationEvents1Activate(Sender: TObject);
begin
  if CurrentEditor <> nil then
    CurrentEditor.SetFocus;
end;

procedure TfrmEasySyncEditMain.ecSingleInstance1AcceptInstInfo(Sender: TObject;
  S: String; var Accept: Boolean);
begin
  if S <> '' then
    OpenFile(S);
end;

procedure TfrmEasySyncEditMain.ToolButton44Click(Sender: TObject);
begin
{  with CurrentEditor.UserRanges.Add do
   begin
    StartLine := 10;
    EndLine := 20;
    Style := 'Style 1';
   end;}
end;

procedure TfrmEasySyncEditMain.ecMacroRecorder1Change(Sender: TObject);
begin
  if ecMacroRecorder1.Recording then
    SB.Panels[3].Text := 'Recording'
  else
    SB.Panels[3].Text := '';
end;

procedure TfrmEasySyncEditMain.actEditMacrosExecute(Sender: TObject);
begin
  ecMacroRecorder1.Customize;
end;

procedure TfrmEasySyncEditMain.actMultiReplConfigExecute(Sender: TObject);
begin
  ecMultiReplace1.Customize;
  UpdateToolsMenu;
end;

procedure TfrmEasySyncEditMain.ToggleBookmark(Sender: TObject);
begin
  CurrentEditor.ToggleBookmark((Sender as TComponent).Tag);
end;

procedure TfrmEasySyncEditMain.GotoBookmark(Sender: TObject);
begin
  CurrentEditor.GotoBookmark((Sender as TComponent).Tag);
end;

procedure TfrmEasySyncEditMain.ReplaceFromDict(Sender: TObject);
var p: TPoint;
begin
  p := CurrentFrame.ecSpellChecker1.HltRangeBndAt(CurrentEditor.CaretStrPos);
  if p.Y > p.X then
    CurrentEditor.ReplaceText(p.X, p.Y - p.X, TMenuItem(Sender).Caption);
end;

procedure TfrmEasySyncEditMain.PopupMenu2Popup(Sender: TObject);
var i, j: integer;
    b: Boolean;
    St: TStringList;
    mi: TMenuItem;
begin
  for i := 0 to 9 do
   for j := 1 to 2 do
    (FindComponent('Bookmark'+IntToStr(i)+IntToStr(j)) as TMenuItem).Checked :=
      CurrentEditor.Bookmarks[i] <> -1;
  with CurrentFrame do
   begin
      for i := PopupMenu2.Items.Count - 1 downto 0 do
        if PopupMenu2.Items[i].Tag = 100 then
          PopupMenu2.Items.Delete(i);

      b := (ecSpellChecker1.Dictionary <> nil) and
           (ecSpellChecker1.HltRangeAt(CurrentEditor.CaretStrPos) <> '');
      MenuItem1.Visible := b;
      MenuItem2.Visible := b;
      MenuItem3.Visible := b;
      if b then
       begin
        MenuItem1.Enabled := ecSpellChecker1.Dictionary.SkippedDictionary.Active;
        MenuItem2.Enabled := ecSpellChecker1.Dictionary.UserDictionary.Active;
        St := TStringList.Create;
        St.Sorted := True;
        St.Duplicates := dupIgnore;
        try
          ecSpellChecker1.Dictionary.GetNearestWords(ecSpellChecker1.HltRangeAt(CurrentEditor.CaretStrPos), St, 1);
          if St.Count > 0 then
            begin
              mi := TMenuItem.Create(Self);
              mi.Caption := '-';
              mi.Tag := 100;
              PopupMenu2.Items.Insert(0, mi);
            end;
          for i := St.Count - 1 downto 0 do
            begin
              mi := TMenuItem.Create(Self);
              mi.Caption := St[i];
              mi.Default := True;
              mi.OnClick := ReplaceFromDict;
              mi.Tag := 100;
              PopupMenu2.Items.Insert(0, mi);
            end;
        finally
          St.Free;
        end;
       end;
   end;
  for i := 0 to ToolsMenu.Count - 1 do
    for j := 0 to ToolsMenu.Items[i].Count - 1 do
      with ToolsMenu.Items[i].Items[j] do
        Enabled := ecMultiReplace1.Items[Tag].IsEnabled(CurrentEditor);
end;

procedure TfrmEasySyncEditMain.UpdateToolsMenu;
var i: integer;
    mi: TMenuItem;

  function AddCategory(const Cat: string): TMenuItem;
  var i: integer;
  begin
    for i := 0 to ToolsMenu.Count - 1 do
      if ToolsMenu.Items[i].Caption = Cat then
        begin
          Result := ToolsMenu.Items[i];
          Exit;
        end;
    Result := TMenuItem.Create(Self);
    Result.Caption := Cat;
    ToolsMenu.Add(Result);
  end;
begin
  ToolsMenu.Clear;
  for i := 0 to ecMultiReplace1.Items.Count - 1 do
    if ecMultiReplace1.Items[i].Category <> '' then
     begin
      mi := TMenuItem.Create(Self);
      mi.Caption := ecMultiReplace1.Items[i].DisplayName;
      mi.Tag := i;
      mi.OnClick := ToolClick;
      AddCategory(ecMultiReplace1.Items[i].Category).Add(mi);
     end;
  ToolsMenu.Visible := ToolsMenu.Count > 0;
end;

procedure TfrmEasySyncEditMain.ToolClick(Sender: TObject);
begin
  ecMultiReplace1.Items[TComponent(Sender).Tag].Execute(CurrentEditor);
end;

procedure TfrmEasySyncEditMain.exttoUTF81Click(Sender: TObject);
begin
  if CurrentEditor <> nil then
   case TComponent(Sender).Tag of
     0: CurrentEditor.Lines.Text := UTF8Decode(CurrentEditor.Lines.Text);
     1: CurrentEditor.Lines.Text := UTF8Encode(CurrentEditor.Lines.Text);
   end;
end;

function TfrmEasySyncEditMain.ReloadPrompt: Boolean;
begin
  Result := MessageDlg('Do you want to reload file with new settings?', mtConfirmation, [mbYes, mbNo], 0) = IDYes;
  if Result then
    with CurrentFrame do
      TextSource.Lines.LoadFromFile(FileName);
end;

procedure TfrmEasySyncEditMain.SetEditorCharset(Sender: TObject);
begin
  if CurrentEditor <> nil then
   begin
    if CurrentEditor.Charset = TComponent(Sender).Tag then Exit;
    CurrentEditor.Charset := TComponent(Sender).Tag;
    if (CurrentEditor.Lines.TextCoding {$IFDEF EC_UNICODE}={$ELSE}<>{$ENDIF} tcAnsi) and
       not CurrentFrame.IsNewFile then
      ReloadPrompt;
   end;
end;

procedure TfrmEasySyncEditMain.SyntAutoReplace1CheckChar(Sender: TObject; C: Word;
  var IsWord: Boolean);
begin
  IsWord := IsWord or (Pos(ecChar(C), '()') <> 0)
end;

procedure TfrmEasySyncEditMain.MenuItem1Click(Sender: TObject);
begin
  with CurrentFrame do
  if ecSpellChecker1.AddToDictionary(ecSpellChecker1.HltRangeAt(CurrentEditor.CaretStrPos),
         TecDictionaryWords(SKIP_DICTIONARY)) then
   begin
     EditorMaster.Invalidate;
     EditorSlave.Invalidate;
   end;
end;

procedure TfrmEasySyncEditMain.MenuItem2Click(Sender: TObject);
begin
  with CurrentFrame do
  if ecSpellChecker1.AddToDictionary(ecSpellChecker1.HltRangeAt(CurrentEditor.CaretStrPos),
         TecDictionaryWords(USER_DICTIONARY)) then
   begin
     EditorMaster.Invalidate;
     EditorSlave.Invalidate;
   end;
end;

procedure TfrmEasySyncEditMain.ToolButton28Click(Sender: TObject);
{var img: TecEmbeddedImageIdx;
begin
  if CurrentFrame <> nil then
    begin
     img := TecEmbeddedImageIdx.Create;
     img.ImageIndex := 51;
     img.Position := CurrentEditor.CaretStrPos;
     img.Hint := 'In-text image hint (testing)';
     CurrentFrame.ecEmbeddedObjects1.Add(img);
     CurrentEditor.Invalidate;
    end;}
//var obj: TecEmbeddedControl;
begin
{  if CurrentFrame <> nil then
    begin
     obj := TecEmbeddedControl.Create(TComboBox.Create(nil));
     obj.Position := CurrentEditor.CaretStrPos;
     CurrentFrame.ecEmbeddedObjects1.Add(obj);
     CurrentEditor.ResetLineHeights;
     CurrentEditor.Invalidate;
    end;}
end;

end.
