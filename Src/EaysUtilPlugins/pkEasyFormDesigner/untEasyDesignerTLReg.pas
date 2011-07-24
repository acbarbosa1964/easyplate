unit untEasyDesignerTLReg;

{$I cxVer.inc}

interface
uses
  Classes, SysUtils, TypInfo, Types, DesignIntf, DesignEditors, VCLEditors, dxCore,
  cxInplaceContainer, Forms, DB, cxDesignWindows, cxPropEditors, cxClasses, cxControls,
  cxEdit, cxStyles, cxTL, cxTLData, cxDBTL, cxTLStrs,
  cxTLEditor, cxTLItemsEditor, cxTLPredefinedStyles, cxTLStyleSheetPreview{, cxTLExportLink};

procedure DesignerTLRegister;

implementation

uses
  dxCoreReg, cxLibraryReg, cxEditPropEditors;

type
  { TcxTreeListComponentEditor }

  TcxTreeListComponentEditor = class(TdxComponentEditor)
  protected
    FItems: TStringList;
    function GetTreeList: TcxCustomTreeList;
    procedure ItemsNeeded; virtual;
  protected
    function GetProductMajorVersion: string; override;
    function GetProductName: string; override;
    function InternalGetVerb(AIndex: Integer): string; override;
    function InternalGetVerbCount: Integer; override;
    procedure InternalExecuteVerb(AIndex: Integer); override;
  public
    destructor Destroy; override;

    property TreeList: TcxCustomTreeList read GetTreeList;
  end;

  { TcxstStylesEventsProperty }

  TcxTreeListStylesEventsProperty = class(TcxNestedEventProperty)
  protected
    function GetInstance: TPersistent; override;
  end;

  { TcxTreeListPopupMenusEventsProperty }

  TcxTreeListPopupMenusEventsProperty = class(TcxNestedEventProperty)
  protected
    function GetInstance: TPersistent; override;
  end;

  { TcxDBTreeListDataBindingFieldNameProperty }

  TcxDBTreeListDataBindingFieldNameProperty = class(TFieldNameProperty)
  public
    function GetDataSource: TDataSource; override;
  end;

  { TcxDBTreeListDataControllerFieldNameProperty }
  
  TcxDBTreeListDataControllerFieldNameProperty = class(TFieldNameProperty)
  public
    function GetDataSource: TDataSource; override;
  end;

  { TcxTreeListColumnProperty }

  TcxTreeListColumnProperty = class(TComponentProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

const
  UnitNamePrefix       =  '' ;
  ComponentDescription = 'ExpressQuantumTreeList';

procedure ShowItemsDesigner(
  AEditor: TcxTreeListComponentEditor; APageIndex: Integer);
var
  ADesigner: TcxTreeListBandColumnDesigner;
begin
  ADesigner := TcxTreeListBandColumnDesigner(ShowFormEditorClass(AEditor.Designer,
    AEditor.Component, TcxTreeListBandColumnDesigner));
  ADesigner.SetVisiblePageIndex(APageIndex);
end;

{ TcxTreeListComponentEditor }

destructor TcxTreeListComponentEditor.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

function TcxTreeListComponentEditor.GetTreeList: TcxCustomTreeList;
begin
  Result := Component as TcxCustomTreeList;
end;

procedure TcxTreeListComponentEditor.ItemsNeeded;
var
  AOperations: IcxTreeListDesignTimeOperations;
begin
  if FItems = nil then
    FItems := TStringList.Create()
  else
    FItems.Clear;
  if not Supports(TreeList, IcxTreeListDesignTimeOperations, AOperations) then Exit;
  if AOperations.SupportBandColumnEditor then
  begin
    FItems.Add(scxStr(@scxColumns));
    FItems.Add(scxStr(@scxBands));
  end;
  if AOperations.SupportItemsEditor then
    FItems.Add(scxStr(@scxItems))
  else
    if AOperations.SupportCreateAllItems then
    begin
      FItems.Add(scxStr(@scxCreateAllItems));
      FItems.Add(scxStr(@scxDeleteAllItems));
    end;
end;

function TcxTreeListComponentEditor.GetProductMajorVersion: string;
begin
  Result := cxTLMajorVersion;
end;

function TcxTreeListComponentEditor.GetProductName: string;
begin
  Result := ComponentDescription;
end;

function TcxTreeListComponentEditor.InternalGetVerb(AIndex: Integer): string;
begin
  Result := FItems[AIndex]
end;

function TcxTreeListComponentEditor.InternalGetVerbCount: Integer;
begin
  ItemsNeeded;
  Result := FItems.Count;
end;

procedure TcxTreeListComponentEditor.InternalExecuteVerb(AIndex: Integer);
var
  AOperations: IcxTreeListDesignTimeOperations;
const
  Invert: array[Boolean] of Byte = (1, 0);
var
  ADesignerModifiedNeeded: Boolean;
begin
  if not Supports(TreeList, IcxTreeListDesignTimeOperations, AOperations) then Exit;
  ADesignerModifiedNeeded := False;
  if AIndex in [0..1] then
  begin
    if AOperations.SupportBandColumnEditor then
      ShowItemsDesigner(Self, Invert[AIndex = 1]);
  end
  else
    if AOperations.SupportItemsEditor and (AIndex = 2) then
      ADesignerModifiedNeeded := cxShowTreeListItemsEditor(TreeList)
    else
      if AOperations.SupportCreateAllItems then
      begin
        if AIndex = 2 then
          AOperations.CreateAllItems
        else
          TreeList.DeleteAllColumns;
        ADesignerModifiedNeeded := True;
      end;
  if ADesignerModifiedNeeded then
    Designer.Modified;
end;

{ TcxTreeListStylesEventsProperty }

function TcxTreeListStylesEventsProperty.GetInstance: TPersistent;
begin
  Result := TcxCustomTreeList(GetComponent(0)).Styles;
end;

{ TcxTreeListPopupMenusEventsProperty }

function TcxTreeListPopupMenusEventsProperty.GetInstance: TPersistent;
begin
  Result := TcxCustomTreeList(GetComponent(0)).PopupMenus;
end;

{ TcxDBTreeListDataBindingFieldNameProperty }

function TcxDBTreeListDataBindingFieldNameProperty.GetDataSource: TDataSource;
begin
  Result := TcxDBItemDataBinding(GetComponent(0)).DataController.DataSource
end;

{ TcxDBTreeListDataControllerFieldNameProperty }

function TcxDBTreeListDataControllerFieldNameProperty.GetDataSource: TDataSource;
begin
  Result := TcxDBTreeListDataController(GetComponent(0)).DataSource;
end;

{ TcxTreeListColumnProperty }

type
  TPersistentAccess = class(TPersistent);

procedure TcxTreeListColumnProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  ATreeList: TcxCustomTreeList;
begin
  ATreeList := TPersistentAccess(GetComponent(0)).GetOwner as TcxCustomTreeList;
  for I := 0 to ATreeList.ColumnCount - 1 do
    Proc(ATreeList.Columns[I].Name)
end;

type
  TcxTreeListSelectionEditor = class(TSelectionEditor)
  protected
    ComponentsList: TStringList;
  public
    procedure AddComponent(const Name: string);
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

procedure TcxTreeListSelectionEditor.AddComponent(const Name: string);
begin
  ComponentsList.Add(Name);
end;

procedure TcxTreeListSelectionEditor.RequiresUnits(Proc: TGetStrProc);

  procedure AddColumnUnitName(AProperties: TcxCustomEditProperties);
  begin
    if AProperties <> nil then
      Proc(UnitNamePrefix + dxShortStringToString(GetTypeData(PTypeinfo(AProperties.ClassType.ClassInfo))^.UnitName));
  end;

var
  AComponent: TComponent;
  I: Integer;
begin
  inherited RequiresUnits(Proc);
  Proc(UnitNamePrefix + 'cxGraphics');
  Proc(UnitNamePrefix + 'cxCustomData');
  Proc(UnitNamePrefix + 'cxStyles');
  Proc(UnitNamePrefix + 'cxTL');
  ComponentsList := TStringList.Create;
  try
    Designer.GetComponentNames(GetTypeData(PTypeInfo(TcxTreeListColumn.ClassInfo)), AddComponent);
    for I := 0 to ComponentsList.Count - 1 do
    begin
      AComponent := Designer.GetComponent(ComponentsList[I]);
      if AComponent is TcxTreeListColumn then
      begin
        AddColumnUnitName(TcxTreeListColumn(AComponent).Properties);
        AddColumnUnitName(TcxTreeListColumn(AComponent).PropertiesValue);
      end;
    end;
  finally
    ComponentsList.Free;
  end;
  Proc(UnitNamePrefix + dxShortStringToString(GetTypeData(PTypeinfo(cxTreeListBuiltInMenuClass.ClassInfo))^.UnitName))
end;

type
  TcxDesignSelectionListener = class(TcxIUnknownObject, IDesignNotification)
  protected
    Listeners: TList;
    // IDesignNotification
    procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemInserted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemsModified(const ADesigner: IDesigner);
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
    procedure DesignerOpened(const ADesigner: IDesigner; AResurrecting: Boolean);
    procedure DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure AddListener(AListener: TObject; AddListener: Boolean);
  end;

constructor TcxDesignSelectionListener.Create;
begin
  Listeners := TList.Create;
  RegisterDesignNotification(Self);
  DesignerNavigatorProc := AddListener;
end;

destructor TcxDesignSelectionListener.Destroy;
begin
  DesignerNavigatorProc := nil;
  Listeners.Clear;
  UnRegisterDesignNotification(Self);
  FreeAndNil(Listeners);
  inherited Destroy;
end;

procedure TcxDesignSelectionListener.AddListener(
  AListener: TObject; AddListener: Boolean);
begin
  Listeners.Remove(AListener);
  if AddListener then
    Listeners.Add(AListener);
end;

procedure TcxDesignSelectionListener.ItemDeleted(
  const ADesigner: IDesigner; AItem: TPersistent);
begin
end;

procedure TcxDesignSelectionListener.ItemInserted(
  const ADesigner: IDesigner; AItem: TPersistent);
begin
end;

procedure TcxDesignSelectionListener.ItemsModified(
  const ADesigner: IDesigner);
begin
end;

procedure TcxDesignSelectionListener.SelectionChanged(
  const ADesigner: IDesigner; const ASelection: IDesignerSelections);
var
  I: Integer;
begin
  for I := 0 to Listeners.Count - 1 do
    TcxCustomTreeList(Listeners[I]).Invalidate;
end;

procedure TcxDesignSelectionListener.DesignerOpened(
  const ADesigner: IDesigner; AResurrecting: Boolean);
begin
end;

procedure TcxDesignSelectionListener.DesignerClosed(
  const ADesigner: IDesigner; AGoingDormant: Boolean);
begin
end;

procedure DesignerTLRegister;
begin
{$IFDEF DELPHI9}
  ForceDemandLoadState(dlDisable);
{$ENDIF}  

  RegisterComponents('Easy TreeView', [TcxTreeList, TcxDBTreeList, TcxVirtualTreeList]);
  RegisterClasses([TcxTreeListColumn, TcxDBTreeListColumn, TcxTreeListBands, TcxTreeListBand, TcxTreeListStyleSheet]);
  RegisterNoIcon([TcxTreeListColumn, TcxDBTreeListColumn, TcxTreeListStyleSheet]);
  RegisterComponentEditor(TcxCustomTreeList, TcxTreeListComponentEditor);
  RegisterPropertyEditor(TypeInfo(TcxTreeListColumn), TcxTreeListPreview,
    'Column', TcxTreeListColumnProperty);
  RegisterPropertyEditor(TypeInfo(TcxTreeListColumn), TcxTreeListOptionsView,
    'CategorizedColumn', TcxTreeListColumnProperty);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomTreeList,
    'StylesEvents', TcxTreeListStylesEventsProperty);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomTreeList,
    'PopupMenusEvents', TcxTreeListPopupMenusEventsProperty);
  RegisterPropertyEditor(TypeInfo(TComponent),
    TcxTreeListPopupMenu, 'PopupMenu', TcxControlPopupMenuProperty);

  RegisterPropertyEditor(TypeInfo(string), TcxDBItemDataBinding,
    'FieldName', TcxDBTreeListDataBindingFieldNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxDBTreeListDataController,
    'KeyField', TcxDBTreeListDataControllerFieldNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxDBTreeListDataController,
    'ParentField', TcxDBTreeListDataControllerFieldNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxDBTreeListDataController,
    'ImageIndexField', TcxDBTreeListDataControllerFieldNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxDBTreeListDataController,
    'StateIndexField', TcxDBTreeListDataControllerFieldNameProperty);
  RegisterSelectionEditor(TcxCustomTreeList, TcxTreeListSelectionEditor);
  HideClassProperties(TcxTreeListColumn, ['SummaryFooter']);
end;

var
  DesignSelectionListener: TcxDesignSelectionListener;

initialization
  DesignSelectionListener := TcxDesignSelectionListener.Create;
  RegisterStyleSheetClass(TcxTreeListStyleSheet);
  DesignerTLRegister;
finalization
  UnRegisterStyleSheetClass(TcxTreeListStyleSheet);
  DesignSelectionListener.Free;

end.
