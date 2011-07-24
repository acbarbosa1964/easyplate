unit untStdRegEditors;

interface

uses
  DesignIntf, DesignEditors, DB, dxorgchr, dxdborgc, dxorgced, SqlEdit,
  Windows, Classes, Forms, ShellApi, cxDBShellComboBox, cxEditPropEditors,
  cxEditRepositoryEditor, cxExtEditConsts, cxShellBrowserDialog, cxShellComboBox,
  cxShellCommon, cxShellEditRepositoryItems, cxShellListView, cxShellTreeView,
  cxLookAndFeels, AdoConEd, ADODB, TypInfo, DBCommon, ColnEdit;

const
  cxShellBrowserEditorVerb = 'Test Browser...';
  dxdbcVersion = '1.52';
  dxotcVersion = '1.52';

type
  { TcxShellBrowserEditor }

  TcxShellBrowserEditor = class(TcxEditorsLibraryComponentEditorEx)
  protected
    function GetEditItemCaption: string; override;
    procedure ExecuteEditAction; override;
  public
    procedure ExecuteVerb(Index: Integer); override;
  end;

  TFieldProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TdxDBOrgChartEditor = class(TComponentEditor)
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TdxOrgChartEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

{ TADOConnectionEditor }

 { TADOConnectionEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

{ TCommandTextProperty }

{  TCommandTextProperty = class(TDBStringProperty)
  private
    FCommandType: TCommandType;
    FConnection: TADOConnection;
  public
    procedure Activate; override;
    function AutoFill: Boolean; override;
    procedure Edit; override;
    procedure EditSQLText; virtual;
    function GetAttributes: TPropertyAttributes; override;
    function GetConnection(Opened: Boolean): TADOConnection;
    procedure GetValueList(List: TStrings); override;
    property CommandType: TCommandType read FCommandType write FCommandType;
  end;
  
{ TTableNameProperty }

{  TTableNameProperty = class(TCommandTextProperty)
  public
    procedure Activate; override;
  end;

{ TProviderProperty }

 { TProviderProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;
  
{ TConnectionStringProperty }

{  TConnectionStringProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

{ TProcedureNameProperty }

 { TProcedureNameProperty = class(TCommandTextProperty)
  public
    procedure Activate; override;
  end;

{ TParametersProperty }

{  TParametersProperty = class(TCollectionProperty)
  public
    procedure Edit; override;
  end;

{ TADOIndexNameProperty }

 { TADOIndexNameProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;  }
  
implementation

uses
  Dialogs, Consts, DsnDBCst;
  
function EditFileName(ADataSet: TADODataSet; LoadData: Boolean): Boolean;
begin
  with TOpenDialog.Create(nil) do
  try
    Title := sOpenFileTitle;
    DefaultExt := 'adtg';
    Filter := SADODataFilter;
    Result := Execute;
    if Result then
      if LoadData then
        ADataSet.LoadFromFile(FileName) else
        ADataSet.CommandText := FileName;
  finally
    Free;
  end;
end;

function TFieldProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect,paValueList,paSortList];
end;

procedure TFieldProperty.GetValues(Proc: TGetStrProc);
var
  Table: TDataSet;
  List: TStringList;
  I: Integer;
begin
  Table := (GetComponent(0) as TdxDbOrgChart).DataSet;
  if Table=nil then Exit;
  List := TStringList.Create;
  Table.GetFieldNames(List);
  for I:=0 to List.Count-1 do Proc(List[I]);
  List.Free;
end;

function TdxDBOrgChartEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'ExpressDBOrgChart ' + dxdbcVersion;
    1: Result := 'Developer Express Inc.';
  end;
end;

function TdxDBOrgChartEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

{ TcxShellBrowserEditor }

procedure TcxShellBrowserEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 4 then
    ShellExecute(0, 'OPEN', 'http://www.devexpress.com', nil, nil, SW_SHOWMAXIMIZED)
  else
    inherited ExecuteVerb(Index);
end;

function TcxShellBrowserEditor.GetEditItemCaption: string;
begin
  Result := cxShellBrowserEditorVerb;
end;

procedure TcxShellBrowserEditor.ExecuteEditAction;
var
  ADialog: TcxShellBrowserDialog;
begin
ADialog := Component as TcxShellBrowserDialog;
with TcxShellBrowserDialog.Create(Application) do
  try
    if Length(ADialog.Title) > 0 then
      Title := ADialog.Title;
    if Length(ADialog.FolderLabelCaption) > 0 then
      FolderLabelCaption := ADialog.FolderLabelCaption;
    Options.ShowFolders := ADialog.Options.ShowFolders;
    Options.ShowToolTip := ADialog.Options.ShowToolTip;
    Options.TrackShellChanges := ADialog.Options.TrackShellChanges;
    Options.ContextMenus := ADialog.Options.ContextMenus;
    Options.ShowNonFolders := ADialog.Options.ShowNonFolders;
    Options.ShowHidden := ADialog.Options.ShowHidden;
    Root.BrowseFolder := ADialog.Root.BrowseFolder;
    Root.CustomPath := ADialog.Root.CustomPath;
    LookAndFeel.Kind := ADialog.LookAndFeel.Kind;
    LookAndFeel.NativeStyle := ADialog.LookAndFeel.NativeStyle;
    LookAndFeel.SkinName := ADialog.LookAndFeel.SkinName;
    ShowButtons := ADialog.ShowButtons;
    ShowInfoTips := ADialog.ShowInfoTips;
    ShowLines := ADialog.ShowLines;
    ShowRoot := ADialog.ShowRoot;
    Path := ADialog.Path;
    Execute;
  finally
    Free;
  end;
end;

procedure TdxOrgChartEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: if ShowOrgChartEditor(TdxOrgChart(Component)) then Designer.Modified;
  end;
end;

function TdxOrgChartEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Items Editor...';
    1: Result := '-';
    2: Result := 'ExpressOrgChart ' + dxotcVersion;
    3: Result := 'Developer Express Inc.';
  end;
end;

function TdxOrgChartEditor.GetVerbCount: Integer;
begin
  Result := 4;
end;

{ TADOConnectionEditor }

{procedure TADOConnectionEditor.ExecuteVerb(Index: Integer);
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then inherited else
  begin
    case Index - I of
      0: if EditConnectionString(Component) then Designer.Modified;
    end;
  end;
end;

function TADOConnectionEditor.GetVerb(Index: Integer): string;
var
  I: Integer;
begin
  I := inherited GetVerbCount;
  if Index < I then Result := inherited GetVerb(Index) else
    case Index - I of
      0: Result := '连接数据库';
    end;
end;

function TADOConnectionEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 1;
end;

{ TTableNameProperty }

{procedure TTableNameProperty.Activate;
begin
  CommandType := cmdTable;
end;

{ TCommandTextProperty }

{function TCommandTextProperty.GetAttributes: TPropertyAttributes;
begin
  if CommandType in [cmdTable, cmdTableDirect, cmdStoredProc] then
    Result := [paValueList, paSortList, paMultiSelect] else {Drop down list for name list}
{    Result := [paMultiSelect, paRevertable, paDialog]; {SQL or File}
{end;

procedure TCommandTextProperty.Activate;
var
  PropInfo: PPropInfo;
  Component: TComponent;
begin
  Component := GetComponent(0) as TComponent;
  PropInfo := TypInfo.GetPropInfo(Component.ClassInfo, 'CommandType'); { do not localize }
{  if Assigned(PropInfo) then
    CommandType := TCommandType(GetOrdProp(Component, PropInfo)) else
    CommandType := cmdText;
end;

procedure TCommandTextProperty.EditSQLText;
var
  Command: string;
  Connection: TADOConnection;
  TableName: string;
begin
  if paDialog in GetAttributes then
  begin
    Command := GetStrValue;
    Connection := GetConnection(True);
    try
      if Command <> '' then
        TableName := GetTableNameFromSQL(Command);
      if EditSQL(Command, Connection.GetTableNames, Connection.GetFieldNames,
         TableName) then
        SetStrValue(Command);
    finally
      FConnection.Free;
      FConnection := nil;
    end;
  end;
end;

procedure TCommandTextProperty.Edit;
begin
  case CommandType of
    cmdText, cmdUnknown: EditSQLText;
    cmdFile: EditFileName(GetComponent(0) as TADODataSet, False);
  else
    inherited;
  end;
end;

function TCommandTextProperty.GetConnection(Opened: Boolean): TADOConnection;
var
  Component: TComponent;
  ConnectionString: string;
begin
  Component := GetComponent(0) as TComponent;
  Result := TObject(GetOrdProp(Component, TypInfo.GetPropInfo(Component.ClassInfo,
    'Connection'))) as TADOConnection; { do not localize }
{  if not Opened then Exit;
  if not Assigned(Result) then
  begin
    ConnectionString := TypInfo.GetStrProp(Component,
      TypInfo.GetPropInfo(Component.ClassInfo, 'ConnectionString')); { do not localize }
{    if ConnectionString = '' then Exit;
    FConnection := TADOConnection.Create(nil);
    FConnection.ConnectionString := ConnectionString;
    FConnection.LoginPrompt := False;
    Result := FConnection;
  end;
  Result.Open;
end;

procedure TCommandTextProperty.GetValueList(List: TStrings);
var
  Connection: TADOConnection;
begin
  Connection := GetConnection(True);
  if Assigned(Connection) then
  try
    case CommandType of
      cmdTable, cmdTableDirect:
        Connection.GetTableNames(List);
      cmdStoredProc:
        Connection.GetProcedureNames(List);
    end;
  finally
    FConnection.Free;
    FConnection := nil;
  end;
end;

function TCommandTextProperty.AutoFill: Boolean;
var
  Connection: TADOConnection;
begin
  Connection := GetConnection(False);
  Result := Assigned(Connection) and Connection.Connected;
end;

{ TConnectionStringProperty }

{function TConnectionStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure TConnectionStringProperty.Edit;
begin
  if EditConnectionString(GetComponent(0) as TComponent) then
    Modified;
end;

{ TProviderProperty }

{procedure TProviderProperty.GetValueList(List: TStrings);
begin
  GetProviderNames(List);
end;

{ TProcedureNameProperty }

{procedure TProcedureNameProperty.Activate;
begin
  CommandType := cmdStoredProc;
end;

{ TParametersProperty }

{procedure TParametersProperty.Edit;
var
  Parameters: TParameters;
begin
  try
    Parameters := TParameters(GetOrdValue);
    if Parameters.Count = 0 then Parameters.Refresh;
  except
    { Ignore any error when trying to refresh the params }
{  end;
  inherited Edit;
end;

{ TADOIndexNameProperty }

{procedure TADOIndexNameProperty.GetValueList(List: TStrings);
var
  IndexDefs: TIndexDefs;
begin
  if GetComponent(0) is TADODataSet then
    IndexDefs := TADODataSet(GetComponent(0)).IndexDefs
  else
    IndexDefs := TADOTable(GetComponent(0)).IndexDefs;
  IndexDefs.Updated := False;
  IndexDefs.Update;
  IndexDefs.GetItemNames(List);
end; }

end.
