unit untGroupRightsOperate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ComCtrls, untEasyTreeView,
  untEasyButtons, ExtCtrls, untEasyGroupBox, untEasyEdit, StdCtrls,
  untEasyUtilConst, ImgList, DB, DBClient, untEasyLabel, untGroupRightsObjects,
  Menus, untEasyMenus, untEasyMenuStylers, untEasyBallonControl;

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
    hintBall: TEasyHintBalloonForm;
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
    procedure btnRevokeClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtParentRoleButtonClick(Sender: TObject);
  private
    { Private declarations }
    FRoleResource,
    FResource   : TList;
    function FindResourceParentNode(AParentRightGUID: string; ATree: TEasyCheckTree): TTreeNode;
    procedure InitRoleResourcesTree(AClientDataSet: TClientDataSet);
    procedure InitResourcesTree(AClientDataSet: TClientDataSet);

    //权限分配 AType = 0分配权限 = 1移除权限
    procedure AssignRight(ASrcTree, ADestTree: TEasyCheckTree; AType: Integer);

    //分配权限时增加数据到ClietnDataSet
    procedure AppendClientData(AClientDataSet: TClientDataSet; ARoleResource: TGroupRoleResource);
    procedure DeleteClientData(AClientDataSet: TClientDataSet; ARoleResource: TGroupRoleResource);
    procedure CreateParentNode(AParentNode: TTreeNode; ATree: TEasyCheckTree; AType: Integer);
  public
    { Public declarations }
    FOperateType: TEasyOperateType;
    FRoleGUID   : string;

  end;

var
  frmGroupRightsOperate: TfrmGroupRightsOperate;

implementation

{$R *.dfm}
uses
  untEasyUtilMethod, untEasySelectParentRole;

procedure TfrmGroupRightsOperate.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmGroupRightsOperate.FormShow(Sender: TObject);
var
  ARoleResourceSQL,
  AResourceSQL: string;
  ASQLOLE,
  AResultData : OleVariant;
begin
  inherited;
  case FOperateType of
    eotAdd:
      Self.Caption := Self.Caption + '-[' + EASY_OPERATE_ADD + ']';
    eotEdit:
      Self.Caption := Self.Caption + '-[' + EASY_OPERATE_EDIT + ']';
  end;

  ASQLOLE := VarArrayCreate([0, 1], varVariant);
  ARoleResourceSQL := ' SELECT * FROM vw_RoleResource WHERE RoleGUID = ' + QuotedStr(FRoleGUID);
  ASQLOLE[0] := ARoleResourceSQL;
  AResourceSQL := 'SELECT * FROM sysResource ORDER BY sParentResourceGUID, iOrder';
  ASQLOLE[1] := AResourceSQL;
//
  AResultData := EasyRDMDisp.EasyGetRDMDatas(ASQLOLE);
//  cdsRoleResource.Data := ASQLOLE[0];
//  cdsResources.Data := ASQLOLE[1];
  cdsRoleResource.Data := EasyRDMDisp.EasyGetRDMData(ARoleResourceSQL);
  cdsResources.Data := EasyRDMDisp.EasyGetRDMData(AResourceSQL);
  //显示树
  InitRoleResourcesTree(cdsRoleResource);
  InitResourcesTree(cdsResources);
end;

procedure TfrmGroupRightsOperate.FormCreate(Sender: TObject);
begin
  inherited;
  FRoleResource := TList.Create;
  FResource := TList.Create;
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

  //如果此权限是根节点、而且已经出现在已分配权限中、并且没有子节点
  //则不应出现在待分配权限中
  for I := tvNotHaveRights.Items.Count - 1 downto 0 do
  begin
    if (FindResourceParentNode(TGroupRoleResource(tvNotHaveRights.Items.Item[I].Data).ResourceGUID,
                              tvHaveRights) <> nil)
        and (not tvNotHaveRights.Items.Item[I].HasChildren)
        and (TGroupRoleResource(tvNotHaveRights.Items.Item[I].Data).ParentResourceGUID
              = '{00000000-0000-0000-0000-000000000003}') then
    begin
      tvNotHaveRights.Items.Item[I].Delete;
    end;  
  end;  
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
  ADestTree: TEasyCheckTree; AType: Integer);
var
  I, J: Integer;
  ATmpParentNode,
  ATmpResourceNode,
  ATmpNode        : TTreeNode;
  ATmpParentNodeGUID: TStrings;
begin
  ASrcTree.Items.BeginUpdate;
  ADestTree.Items.BeginUpdate;
  ATmpParentNodeGUID := TStringList.Create;

  for  I := ASrcTree.Items.Count - 1 downto 0 do
  begin
    if ASrcTree.ItemState[I] = csChecked then
    begin
      ATmpResourceNode := ASrcTree.Items.Item[I];
      ATmpParentNode := ATmpResourceNode.Parent;

      if ATmpParentNode <> nil then
      begin
        CreateParentNode(ATmpParentNode, ADestTree, AType);
        if ATmpParentNodeGUID.IndexOf(TGroupRoleResource(ATmpParentNode.Data).GUID) = -1 then
          ATmpParentNodeGUID.Add(TGroupRoleResource(ATmpParentNode.Data).GUID);
      end;
      ATmpNode := ADestTree.Items.AddChild(
        FindResourceParentNode(TGroupRoleResource(ATmpResourceNode.Data).ParentResourceGUID, ADestTree),
                          TGroupRoleResource(ATmpResourceNode.Data).ResourceName);
      ATmpNode.Data := ATmpResourceNode.Data;
      
      ATmpNode.ImageIndex := 0;
      ATmpNode.SelectedIndex := ATmpNode.ImageIndex + 1;

      if AType = 0 then
        //生成数据集
        AppendClientData(cdsRoleResource, TGroupRoleResource(ATmpNode.Data))
      else
        DeleteClientData(cdsRoleResource, TGroupRoleResource(ATmpNode.Data));

      ASrcTree.Items.Item[I].Delete;
    end;
  end;

  ASrcTree.Refresh;
  ADestTree.Refresh;
  ASrcTree.Items.EndUpdate;
  ADestTree.Items.EndUpdate;

  for J := ASrcTree.Items.Count - 1 downto 0 do
  begin
    if ATmpParentNodeGUID.IndexOf(TGroupRoleResource(ASrcTree.Items.Item[J].Data).GUID) <> -1 then
    begin
      if (not ASrcTree.Items.Item[J].HasChildren) then
        ASrcTree.Items.Item[J].Delete;
    end;
  end;
  ATmpParentNodeGUID.Free;
end;

procedure TfrmGroupRightsOperate.btnAssignAllClick(Sender: TObject);
begin
  inherited;
  if tvNotHaveRights.Items.Count = 0 then Exit;
  tvNotHaveRights.SetAllNodes(csChecked);
  AssignRight(tvNotHaveRights, tvHaveRights, 0);
end;

procedure TfrmGroupRightsOperate.btnRevokeAllClick(Sender: TObject);
begin
  inherited;
  if tvHaveRights.Items.Count = 0 then Exit;
  tvHaveRights.SetAllNodes(csChecked);
  AssignRight(tvHaveRights, tvNotHaveRights, 1);
end;

procedure TfrmGroupRightsOperate.btnAssignClick(Sender: TObject);
begin
  inherited;
  AssignRight(tvNotHaveRights, tvHaveRights, 0);
end;

procedure TfrmGroupRightsOperate.btnRevokeClick(Sender: TObject);
begin
  inherited;
  AssignRight(tvHaveRights, tvNotHaveRights, 1);
end;

procedure TfrmGroupRightsOperate.AppendClientData(
  AClientDataSet: TClientDataSet; ARoleResource: TGroupRoleResource);
begin
  with AClientDataSet do
  begin
    Append;
    FieldByName('GUID').AsString := GenerateGUID;
    FieldByName('RoleGUID').AsString := Trim(edtRoleName.EditLabel.Hint);
    FieldByName('ResourceGUID').AsString := ARoleResource.ResourceGUID;

    FieldByName('sResourceName').AsString := ARoleResource.ResourceName;
    FieldByName('sParentResourceGUID').AsString := ARoleResource.ParentResourceGUID;
    FieldByName('iOrder').AsInteger := ARoleResource.iOrder;
    Post;
  end;
end;

procedure TfrmGroupRightsOperate.DeleteClientData(
  AClientDataSet: TClientDataSet; ARoleResource: TGroupRoleResource);
begin
  if AClientDataSet.Locate('ResourceGUID', ARoleResource.ResourceGUID, [loCaseInsensitive]) then
    AClientDataSet.Delete;
end;

procedure TfrmGroupRightsOperate.CreateParentNode(AParentNode: TTreeNode;
  ATree: TEasyCheckTree; AType: Integer);
var
  AATmpNode: TTreeNode;
begin
  if FindResourceParentNode(TGroupRoleResource(AParentNode.Data).ResourceGUID,
                            ATree) = nil then
  begin
    AATmpNode := ATree.Items.AddChild(nil,
                        TGroupRoleResource(AParentNode.Data).ResourceName);
    AATmpNode.Data := AParentNode.Data;
    //生成数据集
    if AType = 0 then
      AppendClientData(cdsRoleResource, TGroupRoleResource(AParentNode.Data))
    else
      DeleteClientData(cdsRoleResource, TGroupRoleResource(AParentNode.Data));
  end;
end;

procedure TfrmGroupRightsOperate.btnSaveClick(Sender: TObject);
var
  AErrorCode: Integer;
  AResultOLE: OleVariant;
begin
  inherited;
  if Trim(edtRoleName.Text) = '' then
  begin
    hintBall.ShowTextHintBalloon(bmtInfo, EASY_SYS_HINT, EASY_SYS_NOTNULL, 500, 200,
                                 0, edtRoleName, bapBottomRight);
    Exit;
  end;
  if Trim(edtParentRole.Text) = '' then
  begin
    hintBall.ShowTextHintBalloon(bmtInfo, EASY_SYS_HINT, EASY_SYS_NOTNULL, 500, 200,
                                 0, edtParentRole, bapBottomRight);
    Exit;
  end;

  if cdsRoleResource.ChangeCount = 0 then
  begin
    EasyHint(EASY_SYS_DATANOCHANGE);
    Exit;
  end;
  try                    //sysRole_Resource
    AResultOLE := EasyRDMDisp.EasySaveRDMData('sysRole_Resource', cdsRoleResource.Delta,
                                              'GUID', AErrorCode);
    EasyHint(EASY_SYS_SAVE_SUCCESS);
    Self.ModalResult := mrOk;
  except on e: Exception do
    EasyHint(EASY_SYS_SAVE_FAILED + e.Message + IntToStr(AErrorCode));
  end;
end;

procedure TfrmGroupRightsOperate.edtParentRoleButtonClick(Sender: TObject);
var
  AList: TStrings;
begin
  inherited;
  AList := TStringList.Create;
  if EasySelectParentRole(AList) then
  begin
    edtParentRole.EditLabel.Hint := AList.Values['ParentRoleGUID'];
    edtParentRole.Text := AList.Values['ParentRoleName'];
  end;
  AList.Free;
end;

end.
