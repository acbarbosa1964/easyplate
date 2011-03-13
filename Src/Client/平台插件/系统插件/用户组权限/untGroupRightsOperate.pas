unit untGroupRightsOperate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ComCtrls, untEasyTreeView,
  untEasyButtons, ExtCtrls, untEasyGroupBox, untEasyEdit, StdCtrls,
  untEasyUtilConst, ImgList, DB, DBClient, untEasyLabel, untGroupRightsObjects,
  Menus, untEasyMenus, untEasyMenuStylers;

type
  TfrmGroupRightsOperate = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyPanel5: TEasyPanel;
    btnAssignAll: TEasyBitButton;
    btnAssign: TEasyBitButton;
    btnRevoke: TEasyBitButton;
    btnRevokeAll: TEasyBitButton;
    tvHaveRights: TEasyCheckTree;
    tvNotHaveRights: TEasyCheckTree;
    btnSave: TEasyBitButton;
    btnCancel: TEasyBitButton;
    edtRoleName: TEasyLabelEdit;
    edtParentRole: TEasyButtonEdit;
    imgRR: TImageList;
    cdsResources: TClientDataSet;
    EasyLabel1: TEasyLabel;
    EasyLabel2: TEasyLabel;
    cdsRoleResource: TClientDataSet;
    pmNotHaveRights: TEasyPopupMenu;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    pmFullExpand2: TMenuItem;
    pmFullCollapse2: TMenuItem;
    pmHaveRights: TEasyPopupMenu;
    pmFullExpand1: TMenuItem;
    pmFullCollapse1: TMenuItem;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pmFullCollapse1Click(Sender: TObject);
    procedure pmFullExpand1Click(Sender: TObject);
    procedure pmFullExpand2Click(Sender: TObject);
    procedure pmFullCollapse2Click(Sender: TObject);
    procedure btnAssignAllClick(Sender: TObject);
    procedure btnRevokeAllClick(Sender: TObject);
    procedure btnAssignClick(Sender: TObject);
  private
    { Private declarations }
    FRoleResource,
    FResource   : TList;
    function FindResourceParentNode(AParentRightGUID: string; ATree: TEasyCheckTree): TTreeNode;
    procedure InitRoleResourcesTree(AClientDataSet: TClientDataSet);
    procedure InitResourcesTree(AClientDataSet: TClientDataSet);

    //权限分配
    procedure AssignRight(ASrcTree, ADestTree: TEasyCheckTree; var ASrcList, ADestList: TList);
  public
    { Public declarations }
    FOperateType: TEasyOperateType;
    FRoleGUID   : string;

  end;

var
  frmGroupRightsOperate: TfrmGroupRightsOperate;

implementation

{$R *.dfm}

procedure TfrmGroupRightsOperate.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmGroupRightsOperate.FormShow(Sender: TObject);
begin
  inherited;
  case FOperateType of
    eotAdd:
      Self.Caption := Self.Caption + '-[' + EASY_OPERATE_ADD + ']';
    eotEdit:
      Self.Caption := Self.Caption + '-[' + EASY_OPERATE_EDIT + ']';
  end;

  //显示树
  InitRoleResourcesTree(cdsRoleResource);
  InitResourcesTree(cdsResources);
end;

procedure TfrmGroupRightsOperate.FormCreate(Sender: TObject);
var
  ARoleResourceSQL,
  AResourceSQL: string;
  ASQLOLE,
  AResultData : OleVariant;
begin
  inherited;
  FRoleResource := TList.Create;
  FResource := TList.Create;

  ASQLOLE := VarArrayCreate([0, 1], varVariant);
  ARoleResourceSQL := ' SELECT * FROM vw_RoleResource WHERE RoleGUID = ' + QuotedStr(FRoleGUID);
//  ASQLOLE[0] := ARoleResourceSQL;
  AResourceSQL := 'SELECT * FROM sysResource ORDER BY sParentResourceGUID, iOrder';
//  ASQLOLE[1] := AResourceSQL;
//
//  AResultData := EasyRDMDisp.EasyGetRDMDatas(ASQLOLE);
//  cdsRoleResource.Data := ASQLOLE[0];
//  cdsResources.Data := ASQLOLE[1];
  cdsRoleResource.Data := EasyRDMDisp.EasyGetRDMData(ARoleResourceSQL);
  cdsResources.Data := EasyRDMDisp.EasyGetRDMData(AResourceSQL);
end;

procedure TfrmGroupRightsOperate.InitRoleResourcesTree(AClientDataSet: TClientDataSet);
var
  I: Integer;
  ATmpResourceNode: TTreeNode;
  AGroupResource  : TGroupRoleResource;
begin
  if AClientDataSet.IsEmpty then Exit;
  //先初始化模块
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentResourceGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000003}');
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupResource := TGroupRoleResource.Create;

    with AGroupResource do
    begin
      GUID := AClientDataSet.fieldbyname('GUID').AsString;
      RoleGUID := AClientDataSet.fieldbyname('RoleGUID').AsString;
      ResourceGUID := AClientDataSet.fieldbyname('ResourceGUID').AsString;
      ResourceName := AClientDataSet.fieldbyname('sResourceName').AsString;
      ParentResourceGUID := AClientDataSet.fieldbyname('sParentResourceGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iOrder').AsInteger;
      Checked := False;
    end;  

    ATmpResourceNode := tvHaveRights.Items.AddChild(nil, AGroupResource.ResourceName);
    ATmpResourceNode.Data := AGroupResource;
    FRoleResource.Add(AGroupResource);

    ATmpResourceNode.ImageIndex := 4;
    ATmpResourceNode.SelectedIndex := 4;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;

  //挂靠可操作资源
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentResourceGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000003}');
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupResource := TGroupRoleResource.Create;

    with AGroupResource do
    begin
      GUID := AClientDataSet.fieldbyname('GUID').AsString;
      RoleGUID := AClientDataSet.fieldbyname('RoleGUID').AsString;
      ResourceGUID := AClientDataSet.fieldbyname('ResourceGUID').AsString;
      ResourceName := AClientDataSet.fieldbyname('sResourceName').AsString;
      ParentResourceGUID := AClientDataSet.fieldbyname('sParentResourceGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iOrder').AsInteger;
      Checked := False;
    end;  

    ATmpResourceNode := tvHaveRights.Items.AddChild(
                      FindResourceParentNode(AGroupResource.ParentResourceGUID, tvHaveRights),
                      AGroupResource.ResourceName);
    ATmpResourceNode.Data := AGroupResource;
    FRoleResource.Add(AGroupResource);

    ATmpResourceNode.ImageIndex := 0;
    ATmpResourceNode.SelectedIndex := ATmpResourceNode.ImageIndex + 1;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRightsOperate.FindResourceParentNode(
  AParentRightGUID: string; ATree: TEasyCheckTree): TTreeNode;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ATree.Items.Count - 1 do
  begin
    if TGroupRoleResource(ATree.Items.Item[I].Data).ResourceGUID = AParentRightGUID then
    begin
      Result := ATree.Items.Item[I];
      Break;
    end;
  end;
end;

procedure TfrmGroupRightsOperate.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := FRoleResource.Count - 1 downto 0 do
    TObject(FRoleResource.Items[I]).Free;
    
  for I := FResource.Count - 1 downto 0 do
    TObject(FResource.Items[I]).Free;
  inherited;
end;

procedure TfrmGroupRightsOperate.InitResourcesTree(
  AClientDataSet: TClientDataSet);
var
  I: Integer;
  ATmpResourceNode: TTreeNode;
  AGroupResource  : TGroupRoleResource;
begin
  if AClientDataSet.IsEmpty then Exit;
  //先初始化模块
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentResourceGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000003}');
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupResource := TGroupRoleResource.Create;

    with AGroupResource do
    begin
      GUID := AClientDataSet.fieldbyname('GUID').AsString;
      RoleGUID := '';
      ResourceGUID := AClientDataSet.fieldbyname('ResourceGUID').AsString;
      ResourceName := AClientDataSet.fieldbyname('sResourceName').AsString;
      ParentResourceGUID := AClientDataSet.fieldbyname('sParentResourceGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iOrder').AsInteger;
      Checked := False;
    end;  

    ATmpResourceNode := tvNotHaveRights.Items.AddChild(nil, AGroupResource.ResourceName);
    ATmpResourceNode.Data := AGroupResource;
    FResource.Add(AGroupResource);

    ATmpResourceNode.ImageIndex := 4;
    ATmpResourceNode.SelectedIndex := 4;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;

  //挂靠可操作资源
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentResourceGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000003}');
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    //如果此权限已经分配就不会出现在待分配权限树中
    //如果从已分配权限表移除时再显示在待分配权限树中
    if FindResourceParentNode(AClientDataSet.fieldbyname('ResourceGUID').AsString,
                              tvHaveRights) = nil then
    begin
      AGroupResource := TGroupRoleResource.Create;

      with AGroupResource do
      begin
        GUID := AClientDataSet.fieldbyname('GUID').AsString;
        RoleGUID := '';
        ResourceGUID := AClientDataSet.fieldbyname('ResourceGUID').AsString;
        ResourceName := AClientDataSet.fieldbyname('sResourceName').AsString;
        ParentResourceGUID := AClientDataSet.fieldbyname('sParentResourceGUID').AsString;
        iOrder := AClientDataSet.fieldbyname('iOrder').AsInteger;
        Checked := False;
      end;

      ATmpResourceNode := tvNotHaveRights.Items.AddChild(
                        FindResourceParentNode(AGroupResource.ParentResourceGUID, tvNotHaveRights),
                        AGroupResource.ResourceName);
      ATmpResourceNode.Data := AGroupResource;
      FResource.Add(AGroupResource);

      ATmpResourceNode.ImageIndex := 0;
      ATmpResourceNode.SelectedIndex := ATmpResourceNode.ImageIndex + 1;
    end;
    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

procedure TfrmGroupRightsOperate.pmFullCollapse1Click(Sender: TObject);
begin
  inherited;
  tvHaveRights.FullCollapse;
end;

procedure TfrmGroupRightsOperate.pmFullExpand1Click(Sender: TObject);
begin
  inherited;
  tvHaveRights.FullExpand;
end;

procedure TfrmGroupRightsOperate.pmFullExpand2Click(Sender: TObject);
begin
  inherited;
  tvNotHaveRights.FullExpand;
end;

procedure TfrmGroupRightsOperate.pmFullCollapse2Click(Sender: TObject);
begin
  inherited;
  tvNotHaveRights.FullCollapse;
end;

procedure TfrmGroupRightsOperate.AssignRight(ASrcTree,
  ADestTree: TEasyCheckTree; var ASrcList, ADestList: TList);
var
  I, J: Integer;
  ATmpResource,
  AGroupResource  : TGroupRoleResource;
  ATmpParentNode,
  ATmpResourceNode,
  ATmpNode        : TTreeNode;
begin
  ASrcTree.Items.BeginUpdate;
  ADestTree.Items.BeginUpdate;

  for  I := ASrcTree.Items.Count - 1 downto 0 do
  begin
    if ASrcTree.ItemState[I] = csChecked then
    begin
      ATmpResourceNode := ASrcTree.Items.Item[I];
      if TGroupRoleResource(ATmpResourceNode.Data).ParentResourceGUID
          = '{00000000-0000-0000-0000-000000000003}' then
      begin
        //如果在目标树中不存在则创建
        if FindResourceParentNode(TGroupRoleResource(ATmpResourceNode.Data).ResourceGUID,
                                  ADestTree) = nil then
        begin
          ATmpNode := ADestTree.Items.AddChild(nil,
                              TGroupRoleResource(ATmpResourceNode.Data).ResourceName);
          ATmpNode.Data := ATmpResourceNode.Data;
        end;
      end;
    end;
  end;

  for  I := ASrcTree.Items.Count - 1 downto 0 do
  begin
    if ASrcTree.ItemState[I] = csChecked then
    begin
      ATmpResourceNode := ASrcTree.Items.Item[I];
      ATmpParentNode := ATmpResourceNode.Parent;

      if TGroupRoleResource(ATmpResourceNode.Data).ParentResourceGUID
          <> '{00000000-0000-0000-0000-000000000003}' then
      begin
        ATmpNode := ADestTree.Items.AddChild(
          FindResourceParentNode(TGroupRoleResource(ATmpResourceNode.Data).ParentResourceGUID, ADestTree),
                            TGroupRoleResource(ATmpResourceNode.Data).ResourceName);
        ATmpNode.Data := ATmpResourceNode.Data;
        ASrcTree.Items.Item[I].Delete;
        if not ATmpParentNode.HasChildren then
          ATmpNode.Delete;
      end;
    end;
  end;

  ASrcTree.Refresh;
  ADestTree.Refresh;
  ASrcTree.Items.EndUpdate;
  ADestTree.Items.EndUpdate;
end;

procedure TfrmGroupRightsOperate.btnAssignAllClick(Sender: TObject);
begin
  inherited;
  if tvNotHaveRights.Items.Count = 0 then Exit;
  tvNotHaveRights.SetAllNodes(csChecked);
  AssignRight(tvNotHaveRights, tvHaveRights, FResource, FRoleResource);
end;

procedure TfrmGroupRightsOperate.btnRevokeAllClick(Sender: TObject);
begin
  inherited;
  if tvHaveRights.Items.Count = 0 then Exit;
  tvHaveRights.SetAllNodes(csUnknown);
end;

procedure TfrmGroupRightsOperate.btnAssignClick(Sender: TObject);
begin
  inherited;
  AssignRight(tvNotHaveRights, tvHaveRights, FResource, FRoleResource);
end;

end.
