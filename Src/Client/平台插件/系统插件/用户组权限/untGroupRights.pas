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
//------------------------------------------------------------------------------
//单元说明：
//
//主要实现：
          用户权限管理
//-----------------------------------------------------------------------------}
unit untGroupRights;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ExtCtrls, untEasyGroupBox, untGroupRightsObjects,
  untEasyToolBar, untEasyToolBarStylers, ComCtrls, untEasyTreeView, ImgList,
  DB, DBClient, StdCtrls;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmGroupRights = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    Splitter1: TSplitter;
    tvUserGroups: TEasyTreeView;
    btnAddRole: TEasyToolBarButton;
    imgUserGroup: TImageList;
    btnEditRole: TEasyToolBarButton;
    btnDeleteRole: TEasyToolBarButton;
    EasyToolBarButton5: TEasyToolBarButton;
    cdsGroups: TClientDataSet;
    cdsUsers: TClientDataSet;
    cdsResources: TClientDataSet;
    EasyPanel2: TEasyPanel;
    EasyPanel5: TEasyPanel;
    EasyPanel6: TEasyPanel;
    Splitter2: TSplitter;
    EasyPanel7: TEasyPanel;
    Splitter3: TSplitter;
    EasyPanel8: TEasyPanel;
    tvUserRoles: TEasyTreeView;
    EasyPanel9: TEasyPanel;
    tvUsers: TEasyTreeView;
    tvCheckResources: TEasyCheckTree;
    cdsUserResource: TClientDataSet;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvUserGroupsClick(Sender: TObject);
    procedure tvUserRolesClick(Sender: TObject);
    procedure tvUsersClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddRoleClick(Sender: TObject);
    procedure btnEditRoleClick(Sender: TObject);
  private
    { Private declarations }
    FGroupCompanyList,
    FGroupDeptList,
    FGroupRoleList,
    FGroupUserList,
    FGroupRoleResourceList: TList;
    //用户组--公司
    procedure InitGroupsTree(AClientDataSet: TClientDataSet);
    function InitRootGroupTree(AClientDataSet: TClientDataSet): TTreeNode;
    function ExistsGroupCompany(AKeyStr: string): Boolean;
    //用户组--部门
    function InitRootDeptTree(AClientDataSet: TClientDataSet): TTreeNode;
    function FindGroupCompany(ACompanyGUID: string): TTreeNode;
    function InitDeptTree(AClientDataSet: TClientDataSet): TTreeNode;
    function FindGroupDept(ADeptGUID: string): TTreeNode;
    //用户组--角色
    procedure InitRoleTree(AClientDataSet: TClientDataSet; ADeptGUID: string);
    function FindRoleNode(ARoleGUID: string): TTreeNode;

    //显示部门下的角色信息
    procedure DisplayRoles(ADeptGUID: string);
    procedure DisposeGroupRoleList;

    //显示角色下对应的员工
    procedure DisplayUsers(ARoleGUID: string);
    procedure InitUserTree(AClientDataSet: TClientDataSet; ARoleGUID: string);
    procedure DisposeGroupUserList;

    //显示角色所对应的权限资源
    procedure DisplayRole_Resources(ARoleGUID: string);
    procedure GetUserResources(ALoginName: string);
    procedure DisplayUser_Resources(AClientDataSet: TClientDataSet; ALoginName: string);
    //系统权限树
    procedure InitResourcesTree(AClientDataSet: TClientDataSet);
    function FindResourceParentNode(AParentRightGUID: string): TTreeNode;
  public
    { Public declarations }
  end;

var
  frmGroupRights: TfrmGroupRights;

implementation

uses untGroupRightsOperate, untEasyUtilConst;

{$R *.dfm}

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmGroupRights := TfrmGroupRights.Create(Application);
  if frmGroupRights.FormStyle <> fsMDIChild then
    frmGroupRights.FormStyle := fsMDIChild;
  if frmGroupRights.WindowState <> wsMaximized then
    frmGroupRights.WindowState := wsMaximized;
  Result := frmGroupRights;
end;

//此公司是否已生成对应树节点
function TfrmGroupRights.ExistsGroupCompany(AKeyStr: string): Boolean;
var
  J: Integer;
begin
  Result := False;
  for J := 0 to FGroupCompanyList.Count - 1 do
  begin
    if TGroupCompany(FGroupCompanyList.Items[J]).GUID = AKeyStr then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TfrmGroupRights.FormCreate(Sender: TObject);
var
  sGroupsSQL,
  sUsersSQL,
  sRoleResourceSQL: string;
begin
  inherited;
  if not Assigned(FGroupCompanyList) then
    FGroupCompanyList := TList.Create;

  if not Assigned(FGroupDeptList) then
    FGroupDeptList := TList.Create;

  if not Assigned(FGroupRoleList) then
    FGroupRoleList := TList.Create;

  if not Assigned(FGroupUserList) then
    FGroupUserList := TList.Create;

  if not Assigned(FGroupRoleResourceList) then
    FGroupRoleResourceList := TList.Create;
    
  FormId := '{3477B007-80AE-414E-BF67-9709FEEB3DD8}';

  sGroupsSQL := 'SELECT * FROM vw_Groups ORDER BY sCompanyID, iDeptOrder, iRoleOrder';
  cdsGroups.Data := EasyRDMDisp.EasyGetRDMData(sGroupsSQL);

  sUsersSQL := 'SELECT  LoginGUID, sLoginName, sRoleGUID, sEmployeeGUID, sEmployeeCName,'
               +' sEmployeeEName, sSexGUID FROM vw_InitUser '
               +' WHERE bEnable = 1 ORDER BY iOrderNo';
  cdsUsers.Data := EasyRDMDisp.EasyGetRDMData(sUsersSQL);

  sRoleResourceSQL := 'SELECT * FROM vw_RoleResource';
  cdsResources.Data := EasyRDMDisp.EasyGetRDMData(sRoleResourceSQL);
end;

procedure TfrmGroupRights.InitGroupsTree(AClientDataSet: TClientDataSet);
var
  I            : Integer;
  ARootNode,
  AGroupRootNode: TTreeNode;
  AGroupCompany : TGroupCompany;
begin
  {
    正常情况
    |--公司
    |  --部门
    |    --角色

    特殊一点
    |--公司
    |  --部门
    |    --部门
    |       --角色
    |    --角色
    
    角色的父节点主要解决【权限的继承】问题、不实现树结构
    本函数解决 特殊一点 的实现
  }
  //公司信息初始化到组
  //只处理总公司和分公司两种关系、公司嵌套未实现
  //初始化总公司
  tvUserGroups.Items.BeginUpdate;

  AGroupRootNode := InitRootGroupTree(AClientDataSet);

  if AGroupRootNode <> nil then
  begin
    AClientDataSet.Filtered := False;
    AClientDataSet.Filter := 'sParentCompanyGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000001}');
    AClientDataSet.Filtered := True;

    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if not ExistsGroupCompany(AClientDataSet.fieldbyname('CompanyGUID').AsString) then
      begin
        AGroupCompany := TGroupCompany.Create;
        with AGroupCompany do
        begin
          GUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
          CompanyCName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
          CompanyEName := AClientDataSet.fieldbyname('sCompanyEName').AsString;
          CompanyID := AClientDataSet.fieldbyname('sCompanyID').AsString;
          ParentCompanyGUID := AClientDataSet.fieldbyname('sParentCompanyGUID').AsString;
        end;
        FGroupCompanyList.Add(AGroupCompany);
        ARootNode := tvUserGroups.Items.AddChild(AGroupRootNode, AGroupCompany.CompanyCName);

        ARootNode.ImageIndex := 16;
        ARootNode.SelectedIndex := ARootNode.ImageIndex + 1;

        ARootNode.Data := AGroupCompany;
      end;
      AClientDataSet.Next;
    end;

    AClientDataSet.Filtered := False;
  end
  else
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if not ExistsGroupCompany(AClientDataSet.fieldbyname('CompanyGUID').AsString) then
      begin
        AGroupCompany := TGroupCompany.Create;
        with AGroupCompany do
        begin
          GUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
          CompanyCName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
          CompanyEName := AClientDataSet.fieldbyname('sCompanyEName').AsString;
          CompanyID := AClientDataSet.fieldbyname('sCompanyID').AsString;
          ParentCompanyGUID := AClientDataSet.fieldbyname('sParentCompanyGUID').AsString;
        end;
        FGroupCompanyList.Add(AGroupCompany);
        ARootNode := tvUserGroups.Items.AddChild(nil, AGroupCompany.CompanyCName);

        ARootNode.ImageIndex := 16;
        ARootNode.SelectedIndex := ARootNode.ImageIndex + 1;

        ARootNode.Data := AGroupCompany;
      end;
      AClientDataSet.Next;
    end;
  end;
  //初始化部门树
  //实现部门嵌套
  InitRootDeptTree(cdsGroups);
  //嵌套二级部门
  InitDeptTree(cdsGroups);

  tvUserGroups.FullExpand;
  tvUserGroups.Items.EndUpdate;
end;

procedure TfrmGroupRights.FormShow(Sender: TObject);
begin
  inherited;
  InitGroupsTree(cdsGroups);
  InitResourcesTree(cdsResources);
end;

procedure TfrmGroupRights.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := FGroupCompanyList.Count - 1 downto 0 do
    TObject(FGroupCompanyList.Items[I]).Free;

  for I := FGroupDeptList.Count - 1 downto 0 do
    TObject(FGroupDeptList.Items[I]).Free;

  for I := FGroupUserList.Count - 1 downto 0 do
    TObject(FGroupUserList.Items[I]).Free;

  DisposeGroupRoleList;

  for I := FGroupRoleResourceList.Count - 1 downto 0 do
    TObject(FGroupRoleResourceList.Items[I]).Free; 
end;

function TfrmGroupRights.InitRootGroupTree(
  AClientDataSet: TClientDataSet): TTreeNode;
var
  AGroupCompany: TGroupCompany;
begin
  Result := nil;
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentCompanyGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000001}');
  AClientDataSet.Filtered := True;
  //集团总公司只允许存在一个，此处没有判断有且只为1的条件
  if AClientDataSet.RecordCount > 0 then
  begin
    AGroupCompany := TGroupCompany.Create;
    with AGroupCompany do
    begin
      GUID := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      CompanyCName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      CompanyEName := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      CompanyID := AClientDataSet.fieldbyname('sCompanyCName').AsString;
      ParentCompanyGUID := AClientDataSet.fieldbyname('sParentCompanyGUID').AsString;
    end;
    FGroupCompanyList.Add(AGroupCompany);
    Result := tvUserGroups.Items.AddChild(nil, AGroupCompany.CompanyCName);

    Result.ImageIndex := 12;
    Result.SelectedIndex := Result.ImageIndex + 1;

    Result.Data := AGroupCompany;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.InitRootDeptTree(
  AClientDataSet: TClientDataSet): TTreeNode;
var
  I         : Integer;
  AGroupDept: TGroupDept;
begin
  Result := nil;
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentDeptGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000002}')
                            + ' AND DeptGUID <> ' + QuotedStr('');
  AClientDataSet.Filtered := True;
  if AClientDataSet.RecordCount > 0 then
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      AGroupDept := TGroupDept.Create;
      with AGroupDept do
      begin
        DeptGUID := AClientDataSet.fieldbyname('DeptGUID').AsString;
        DeptCName := AClientDataSet.fieldbyname('sDeptCName').AsString;
        DeptEName := AClientDataSet.fieldbyname('sDeptEName').AsString;
        iOrder := AClientDataSet.fieldbyname('iDeptOrder').AsInteger;
        ParentDeptGUID := AClientDataSet.fieldbyname('sParentDeptGUID').AsString;
        CompanyGUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
      end;
      FGroupDeptList.Add(AGroupDept);
      //将部门节点挂靠到对应的公司下面
      Result := tvUserGroups.Items.AddChild(FindGroupCompany(AGroupDept.CompanyGUID),
                                            AGroupDept.DeptCName);
      Result.Data := AGroupDept;

      Result.ImageIndex := 17;
      Result.SelectedIndex := Result.ImageIndex + 1;
      
      AClientDataSet.Next;
    end;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.FindGroupCompany(ACompanyGUID: string): TTreeNode;
var
  I          : Integer;
  ATmpPointer: Pointer;
begin
  Result := nil;
  ATmpPointer := nil;
  for I := 0 to FGroupCompanyList.Count - 1 do
  begin
    if TGroupCompany(FGroupCompanyList.Items[I]).GUID = ACompanyGUID then
    begin
      ATmpPointer := FGroupCompanyList.Items[I];
      Break;
    end;
  end;
  if ATmpPointer <> nil then
  begin
    for I := 0 to tvUserGroups.Items.Count - 1 do
    begin
      if tvUserGroups.Items.Item[I].Data = ATmpPointer then
      begin
        Result := tvUserGroups.Items.Item[I];
        Break;
      end;
    end;
  end;
end;

function TfrmGroupRights.InitDeptTree(
  AClientDataSet: TClientDataSet): TTreeNode;
var
  I         : Integer;
  AGroupDept: TGroupDept;
  ATmpTreeNode: TTreeNode;
begin
  Result := nil;
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := 'sParentDeptGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000002}')
                            + ' AND DeptGUID <> ' + QuotedStr('');
  AClientDataSet.Filtered := True;
  if AClientDataSet.RecordCount > 0 then
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if FindGroupDept(AClientDataSet.fieldbyname('DeptGUID').AsString) = nil then
      begin
        AGroupDept := TGroupDept.Create;
        with AGroupDept do
        begin
          DeptGUID := AClientDataSet.fieldbyname('DeptGUID').AsString;
          DeptCName := AClientDataSet.fieldbyname('sDeptCName').AsString;
          DeptEName := AClientDataSet.fieldbyname('sDeptEName').AsString;
          iOrder := AClientDataSet.fieldbyname('iDeptOrder').AsInteger;
          ParentDeptGUID := AClientDataSet.fieldbyname('sParentDeptGUID').AsString;
          CompanyGUID := AClientDataSet.fieldbyname('CompanyGUID').AsString;
        end;
        FGroupDeptList.Add(AGroupDept);
        //将部门节点挂靠到对应的父部门节点下面  第二级
        //如果不存在父节点就直接挂靠在对应的部门下面
        ATmpTreeNode := FindGroupDept(AGroupDept.ParentDeptGUID);
        if ATmpTreeNode <> nil then
        begin
          Result := tvUserGroups.Items.AddChild(ATmpTreeNode, AGroupDept.DeptCName);
        end
        else
        begin
          Result := tvUserGroups.Items.AddChild(FindGroupCompany(AGroupDept.CompanyGUID),
                                                AGroupDept.DeptCName);
        end;
        Result.Data := AGroupDept;
      end;

      Result.ImageIndex := 17;
      Result.SelectedIndex := Result.ImageIndex + 1;

      AClientDataSet.Next;
    end;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.FindGroupDept(ADeptGUID: string): TTreeNode;
var
  I          : Integer;
  ATmpPointer: Pointer;
begin
  Result := nil;
  ATmpPointer := nil;
  for I := 0 to FGroupDeptList.Count - 1 do
  begin
    if TGroupDept(FGroupDeptList.Items[I]).DeptGUID = ADeptGUID then
    begin
      ATmpPointer := FGroupDeptList.Items[I];
      Break;
    end;
  end;
  if ATmpPointer <> nil then
  begin
    for I := 0 to tvUserGroups.Items.Count - 1 do
    begin
      if tvUserGroups.Items.Item[I].Data = ATmpPointer then
      begin
        Result := tvUserGroups.Items.Item[I];
        Break;
      end;
    end;
  end;
end;

procedure TfrmGroupRights.InitRoleTree(AClientDataSet: TClientDataSet; ADeptGUID: string);
var
  I         : Integer;
  AGroupRole: TGroupRole;
  ATmpRoleNode: TTreeNode;
begin
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := ' DeptGUID = ' + QuotedStr(ADeptGUID)
      + ' AND sParentRoleGUID = ' + QuotedStr('{00000000-0000-0000-0000-000000000004}')
      + ' AND Trim(RoleGUID) <> ' + QuotedStr('');
  AClientDataSet.Filtered := True;
  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupRole := TGroupRole.Create;
    with AGroupRole do
    begin
      RoleGUID := AClientDataSet.fieldbyname('RoleGUID').AsString;
      RoleName := AClientDataSet.fieldbyname('sRoleName').AsString;
      ParentRoleGUID := AClientDataSet.fieldbyname('sParentRoleGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iRoleOrder').AsInteger;
      Description := AClientDataSet.fieldbyname('sDiscription').AsString;
      DeptGUID := AClientDataSet.fieldbyname('DeptGUID').AsString;
    end;
    FGroupRoleList.Add(AGroupRole);
    //将角色节点挂靠到对应的部门节点下面
    ATmpRoleNode := tvUserRoles.Items.AddChild(nil, AGroupRole.RoleName);
    ATmpRoleNode.Data := AGroupRole;

    ATmpRoleNode.ImageIndex := 3;
    ATmpRoleNode.SelectedIndex := ATmpRoleNode.ImageIndex + 1;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;

  //挂靠二级角色 FindRoleNode
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := ' DeptGUID = ' + QuotedStr(ADeptGUID)
      + ' AND sParentRoleGUID <> ' + QuotedStr('{00000000-0000-0000-0000-000000000004}')
      + ' AND Trim(RoleGUID) <> ' + QuotedStr('');
  AClientDataSet.Filtered := True;
  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupRole := TGroupRole.Create;
    with AGroupRole do
    begin
      RoleGUID := AClientDataSet.fieldbyname('RoleGUID').AsString;
      RoleName := AClientDataSet.fieldbyname('sRoleName').AsString;
      ParentRoleGUID := AClientDataSet.fieldbyname('sParentRoleGUID').AsString;
      iOrder := AClientDataSet.fieldbyname('iRoleOrder').AsInteger;
      Description := AClientDataSet.fieldbyname('sDiscription').AsString;
      DeptGUID := AClientDataSet.fieldbyname('DeptGUID').AsString;
    end;
    FGroupRoleList.Add(AGroupRole);
    //将角色节点挂靠到对应的部门节点下面
    ATmpRoleNode := tvUserRoles.Items.AddChild(FindRoleNode(AGroupRole.ParentRoleGUID), AGroupRole.RoleName);
    ATmpRoleNode.Data := AGroupRole;

    ATmpRoleNode.ImageIndex := 3;
    ATmpRoleNode.SelectedIndex := ATmpRoleNode.ImageIndex + 1;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;

  tvUserRoles.FullExpand;
end;

procedure TfrmGroupRights.tvUserGroupsClick(Sender: TObject);
begin
  inherited;
  DisplayRoles(TGroupDept(tvUserGroups.Selected.Data).DeptGUID);
end;

procedure TfrmGroupRights.DisplayRoles(ADeptGUID: string);
begin
  tvUserRoles.Items.BeginUpdate;
  tvUserRoles.Items.Clear;

  //先释放之前的角色对象
  DisposeGroupRoleList;
  InitRoleTree(cdsGroups, ADeptGUID);
  
  tvUserRoles.Items.EndUpdate;
end;

procedure TfrmGroupRights.tvUserRolesClick(Sender: TObject);
begin
  inherited;
  //显示此角色下的所有用户
  DisplayUsers(TGroupRole(tvUserRoles.Selected.Data).RoleGUID);
  //显示此角色所对应的权限资源

  if TGroupRole(tvUserRoles.Selected.Data).ParentRoleGUID <> '{00000000-0000-0000-0000-000000000004}' then
    DisplayRole_Resources(TGroupRole(tvUserRoles.Selected.Data).ParentRoleGUID)
  else
    DisplayRole_Resources(TGroupRole(tvUserRoles.Selected.Data).RoleGUID);
end;

procedure TfrmGroupRights.DisplayUsers(ARoleGUID: string);
begin
  tvUsers.Items.BeginUpdate;
  tvUsers.Items.Clear;

  DisposeGroupUserList;
  InitUserTree(cdsUsers, ARoleGUID);
  tvUsers.Items.EndUpdate;
end;

procedure TfrmGroupRights.InitUserTree(AClientDataSet: TClientDataSet;
  ARoleGUID: string);
var
  I           : Integer;
  AGroupUser  : TGroupUser;
  ATmpUserNode: TTreeNode;
begin
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := ' sRoleGUID = ' + QuotedStr(ARoleGUID);
  AClientDataSet.Filtered := True;

  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupUser := TGroupUser.Create;
    with AGroupUser do
    begin
      LoginGUID := AClientDataSet.fieldbyname('LoginGUID').AsString;
      LoginName := AClientDataSet.fieldbyname('sLoginName').AsString;
      RoleGUID := AClientDataSet.fieldbyname('sRoleGUID').AsString;
      EmployeeGUID := AClientDataSet.fieldbyname('sEmployeeGUID').AsString;
      EmployeeCName := AClientDataSet.fieldbyname('sEmployeeCName').AsString;
      EmployeeEName := AClientDataSet.fieldbyname('sEmployeeEName').AsString;
      SexGUID := AClientDataSet.fieldbyname('sSexGUID').AsString;
    end;
    FGroupUserList.Add(AGroupUser);
    //将角色节点挂靠到对应的部门节点下面
    ATmpUserNode := tvUsers.Items.AddChild(nil, AGroupUser.EmployeeCName);
    ATmpUserNode.Data := AGroupUser;

    if AGroupUser.SexGUID = '{CEE37D8D-A822-459A-8352-A723C12C5294}' then
    begin
      ATmpUserNode.ImageIndex := 1;
      ATmpUserNode.SelectedIndex := ATmpUserNode.ImageIndex + 1;
    end
    else
    begin
      ATmpUserNode.ImageIndex := 0;
      ATmpUserNode.SelectedIndex := ATmpUserNode.ImageIndex + 1;
    end;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

procedure TfrmGroupRights.DisposeGroupRoleList;
var
  I: Integer;
begin
  for I := FGroupRoleList.Count - 1 downto 0 do
    TGroupRole(FGroupRoleList.Items[I]).Free;
  FGroupRoleList.Clear;
end;

procedure TfrmGroupRights.DisposeGroupUserList;
var
  I: Integer;
begin
  for I := FGroupUserList.Count - 1 downto 0 do
    TGroupUser(FGroupUserList.Items[I]).Free;
  FGroupUserList.Clear;
end;

procedure TfrmGroupRights.InitResourcesTree(AClientDataSet: TClientDataSet);
var
  I: Integer;
//  ATmpResourceNode: TTreeNode;
  AGroupResource  : TGroupRoleResource;
begin
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

//    ATmpResourceNode := tvCheckResources.Items.AddChild(nil, AGroupResource.ResourceName);
//    ATmpResourceNode.Data := AGroupResource;
    FGroupRoleResourceList.Add(AGroupResource);

//    ATmpResourceNode.ImageIndex := 15;
//    ATmpResourceNode.SelectedIndex := ATmpResourceNode.ImageIndex + 1;

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

//    ATmpResourceNode := tvCheckResources.Items.AddChild(
//                      FindResourceParentNode(AGroupResource.ParentResourceGUID),
//                      AGroupResource.ResourceName);
//    ATmpResourceNode.Data := AGroupResource;
    FGroupRoleResourceList.Add(AGroupResource);

//    ATmpResourceNode.ImageIndex := 15;
//    ATmpResourceNode.SelectedIndex := ATmpResourceNode.ImageIndex + 1;

    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

function TfrmGroupRights.FindResourceParentNode(
  AParentRightGUID: string): TTreeNode;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to tvCheckResources.Items.Count - 1 do
  begin
    if TGroupRoleResource(tvCheckResources.Items.Item[I].Data).ResourceGUID = AParentRightGUID then
    begin
      Result := tvCheckResources.Items.Item[I];
      Break;
    end;
  end;
end;

procedure TfrmGroupRights.DisplayRole_Resources(ARoleGUID: string);
var
  I: Integer;
  ATmpResourceNode: TTreeNode;
  AGroupResource  : TGroupRoleResource;
begin
  tvCheckResources.Items.BeginUpdate;
  tvCheckResources.Items.Clear;

  for I := 0 to FGroupRoleResourceList.Count - 1 do
  begin
    AGroupResource := TGroupRoleResource(FGroupRoleResourceList.Items[I]);
    if (AGroupResource.RoleGUID = ARoleGUID) and
        (AGroupResource.ParentResourceGUID = '{00000000-0000-0000-0000-000000000003}') then
    begin
      ATmpResourceNode := tvCheckResources.Items.AddChild(nil, AGroupResource.ResourceName);
      ATmpResourceNode.Data := FGroupRoleResourceList.Items[I];

      ATmpResourceNode.ImageIndex := 15;
      ATmpResourceNode.SelectedIndex := ATmpResourceNode.ImageIndex + 1;
    end;
  end;

  for I := 0 to FGroupRoleResourceList.Count - 1 do
  begin
    AGroupResource := TGroupRoleResource(FGroupRoleResourceList.Items[I]);
    if (AGroupResource.RoleGUID = ARoleGUID) and
        (AGroupResource.ParentResourceGUID <> '{00000000-0000-0000-0000-000000000003}') then
    begin
      ATmpResourceNode := tvCheckResources.Items.AddChild(
                        FindResourceParentNode(AGroupResource.ParentResourceGUID),
                        AGroupResource.ResourceName);
      ATmpResourceNode.Data := FGroupRoleResourceList.Items[I];

      ATmpResourceNode.ImageIndex := 15;
      ATmpResourceNode.SelectedIndex := ATmpResourceNode.ImageIndex + 1;
    end;
  end;
  tvCheckResources.FullExpand;
  tvCheckResources.Items.EndUpdate;
end;

procedure TfrmGroupRights.DisplayUser_Resources(AClientDataSet: TClientDataSet; ALoginName: string);
var
  I: Integer;
begin
  tvCheckResources.CascadeChecks := False;
  for I := 0 to tvCheckResources.Items.Count - 1 do
  begin
    if AClientDataSet.Locate('ResourceGUID',
      VarArrayOf([TGroupRoleResource(tvCheckResources.Items.Item[I].Data).ResourceGUID]),
                             [loCaseInsensitive]) then
      tvCheckResources.ChangeNodeCheckState(tvCheckResources.Items.Item[I], csUnchecked)
    else
      tvCheckResources.ChangeNodeCheckState(tvCheckResources.Items.Item[I], csChecked);
  end;
  tvCheckResources.CascadeChecks := True;
end;

procedure TfrmGroupRights.GetUserResources(ALoginName: string);
var
  sUserResourceSQL: string;
begin
  sUserResourceSQL := 'SELECT * FROM sysLoginUser_Resource WHERE LoginName = '
                      + QuotedStr(ALoginName);
  cdsUserResource.Data := null;

  cdsUserResource.Data := EasyRDMDisp.EasyGetRDMData(sUserResourceSQL);
  DisplayUser_Resources(cdsUserResource, ALoginName);
end;

procedure TfrmGroupRights.tvUsersClick(Sender: TObject);
begin
  inherited;
  GetUserResources(TGroupUser(tvUsers.Selected.Data).LoginName);
end;

procedure TfrmGroupRights.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsGroups.Data := null;
  cdsUserResource.Data := null;
  cdsResources.Data := null;
  cdsUsers.Data := null;
end;

function TfrmGroupRights.FindRoleNode(ARoleGUID: string): TTreeNode;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to tvUserRoles.Items.Count - 1 do
  begin
    if TGroupRole(tvUserRoles.Items[I].Data).RoleGUID = ARoleGUID then
    begin
      Result := tvUserRoles.Items[I];
      Break;
    end;
  end;      
end;

procedure TfrmGroupRights.btnAddRoleClick(Sender: TObject);
begin
  inherited;
  frmGroupRightsOperate := TfrmGroupRightsOperate.Create(Self);
  with frmGroupRightsOperate do
  begin
    FOperateType := eotAdd;
  end;  
  frmGroupRightsOperate.ShowModal;
  frmGroupRightsOperate.Free;
end;

procedure TfrmGroupRights.btnEditRoleClick(Sender: TObject);
begin
  inherited;
  frmGroupRightsOperate := TfrmGroupRightsOperate.Create(Self);
  with frmGroupRightsOperate do
  begin
    FOperateType := eotEdit;
  end;  
  frmGroupRightsOperate.ShowModal;
  frmGroupRightsOperate.Free;
end;

end.
