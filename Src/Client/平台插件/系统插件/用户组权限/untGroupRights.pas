unit untGroupRights;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ExtCtrls, untEasyGroupBox,
  untEasyToolBar, untEasyToolBarStylers, ComCtrls, untEasyTreeView, ImgList,
  DB, DBClient, StdCtrls;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  //用户组权限--公司信息
  TGroupCompany = class
  private
    FGUID,
    FCompanyCName,
    FCompanyEName,
    FCompanyID,
    FParentCompanyGUID: string;
    function GetCompanyCName: string;
    function GetCompanyEName: string;
    function GetCompanyID: string;
    function GetGUID: string;
    procedure SetCompanyCName(const Value: string);
    procedure SetCompanyEName(const Value: string);
    procedure SetCompanyID(const Value: string);
    procedure SetGUID(const Value: string);
    function GetParentCompanyGUID: string;
    procedure SetParentCompanyGUID(const Value: string);
  public
    property GUID: string read GetGUID write SetGUID;
    property CompanyCName: string read GetCompanyCName write SetCompanyCName;
    property CompanyEName: string read GetCompanyEName write SetCompanyEName;
    property CompanyID: string read GetCompanyID write SetCompanyID;
    property ParentCompanyGUID: string read GetParentCompanyGUID write SetParentCompanyGUID;
  end;

  //用户组权限--部门信息
  TGroupDept = class
  private
    FDeptGUID,
    FDeptCName,
    FDeptEName,
    FParentDeptGUID,
    FCompanyGUID: string;
    FiOrder: Integer;
    function GetDeptCName: string;
    function GetDeptEName: string;
    function GetDeptGUID: string;
    function GetiOrder: Integer;
    function GetParentDeptGUID: string;
    procedure SetDeptCName(const Value: string);
    procedure SetDeptEName(const Value: string);
    procedure SetDeptGUID(const Value: string);
    procedure SetiOrder(const Value: Integer);
    procedure SetParentDeptGUID(const Value: string);
    function GetCompanyGUID: string;
    procedure SetCompanyGUID(const Value: string);
  public
    property DeptGUID: string read GetDeptGUID write SetDeptGUID;
    property DeptCName: string read GetDeptCName write SetDeptCName;
    property DeptEName: string read GetDeptEName write SetDeptEName;
    property ParentDeptGUID: string read GetParentDeptGUID write SetParentDeptGUID;
    property iOrder: Integer read GetiOrder write SetiOrder;
    property CompanyGUID: string read GetCompanyGUID write SetCompanyGUID;
  end;

  //用户组权限--角色信息
  TGroupRole = class
  private
    FRoleGUID,
    FRoleName,
    FParentRoleGUID,
    FDescription,
    FDeptGUID : string;
    FiOrder      : Integer;
    function GetDescription: string;
    function GetiOrder: Integer;
    function GetParentRoleGUID: string;
    function GetRoleGUID: string;
    function GetRoleName: string;
    procedure SetDescription(const Value: string);
    procedure SetiOrder(const Value: Integer);
    procedure SetParentRoleGUID(const Value: string);
    procedure SetRoleGUID(const Value: string);
    procedure SetRoleName(const Value: string);
    function GetDeptGUID: string;
    procedure SetDeptGUID(const Value: string);
  public
    property RoleGUID: string read GetRoleGUID write SetRoleGUID;
    property RoleName: string read GetRoleName write SetRoleName;
    property ParentRoleGUID: string read GetParentRoleGUID write SetParentRoleGUID;
    property Description: string read GetDescription write SetDescription;
    property iOrder: Integer read GetiOrder write SetiOrder;
    property DeptGUID: string read GetDeptGUID write SetDeptGUID;
  end;

  TfrmGroupRights = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    Splitter1: TSplitter;
    EasyPanel2: TEasyPanel;
    EasyPanel5: TEasyPanel;
    Splitter2: TSplitter;
    EasyPanel6: TEasyPanel;
    tvUserGroups: TEasyTreeView;
    tvUserRoles: TEasyTreeView;
    tvUsers: TEasyTreeView;
    EasyToolBarButton1: TEasyToolBarButton;
    imgUserGroup: TImageList;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarButton4: TEasyToolBarButton;
    EasyToolBarButton5: TEasyToolBarButton;
    cdsGroups: TClientDataSet;
    cdsUsers: TClientDataSet;
    cdsModules: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvUserGroupsClick(Sender: TObject);
  private
    { Private declarations }
    FGroupCompanyList,
    FGroupDeptList,
    FGroupRoleList: TList;
//    procedure GenerateTree(ATree: TEasyTreeView; AClientDataSet: TClientDataSet;
//                            ARoot)
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

    //显示部门下的角色信息
    function GetDeptGUID(APointer: Pointer): string;
    procedure DisplayRoles(ADeptGUID: string);
  public
    { Public declarations }
  end;

var
  frmGroupRights: TfrmGroupRights;

implementation

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
  sGroupsSQL: string;
begin
  inherited;
  if not Assigned(FGroupCompanyList) then
    FGroupCompanyList := TList.Create;

  if not Assigned(FGroupDeptList) then
    FGroupDeptList := TList.Create;

  if not Assigned(FGroupRoleList) then
    FGroupRoleList := TList.Create;
    
  sGroupsSQL := 'SELECT * FROM vw_Groups ORDER BY sCompanyID, iDeptOrder, iRoleOrder';
  FormId := '{3477B007-80AE-414E-BF67-9709FEEB3DD8}';
  cdsGroups.Data := EasyRDMDisp.EasyGetRDMData(sGroupsSQL);
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

        ARootNode.ImageIndex := 4;
        ARootNode.SelectedIndex := 4;

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

        ARootNode.ImageIndex := 4;
        ARootNode.SelectedIndex := 4;

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

  tvUserGroups.Items.EndUpdate;
end;

procedure TfrmGroupRights.FormShow(Sender: TObject);
begin
  inherited;

  InitGroupsTree(cdsGroups);
end;

{ TGroupCompany }

function TGroupCompany.GetCompanyCName: string;
begin
  Result := FCompanyCName;
end;

function TGroupCompany.GetCompanyEName: string;
begin
  Result := FCompanyEName;
end;

function TGroupCompany.GetCompanyID: string;
begin
  Result := FCompanyID;
end;

function TGroupCompany.GetGUID: string;
begin
  Result := FGUID;
end;

function TGroupCompany.GetParentCompanyGUID: string;
begin
  Result := FParentCompanyGUID;
end;

procedure TGroupCompany.SetCompanyCName(const Value: string);
begin
  FCompanyCName := Value;
end;

procedure TGroupCompany.SetCompanyEName(const Value: string);
begin
  FCompanyEName := Value;
end;

procedure TGroupCompany.SetCompanyID(const Value: string);
begin
  FCompanyID := Value;
end;

procedure TGroupCompany.SetGUID(const Value: string);
begin
  FGUID := Value;
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

  for I := FGroupRoleList.Count - 1 downto 0 do
    TObject(FGroupRoleList.Items[I]).Free;

end;

procedure TGroupCompany.SetParentCompanyGUID(const Value: string);
begin
  FParentCompanyGUID := Value;
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

    Result.ImageIndex := 4;
    Result.SelectedIndex := 4;

    Result.Data := AGroupCompany;
  end;
  AClientDataSet.Filtered := False;
end;

{ TGroupDept }

function TGroupDept.GetCompanyGUID: string;
begin
  Result := FCompanyGUID;
end;

function TGroupDept.GetDeptCName: string;
begin
  Result := FDeptCName;
end;

function TGroupDept.GetDeptEName: string;
begin
  Result := FDeptEName;
end;

function TGroupDept.GetDeptGUID: string;
begin
  Result := FDeptGUID;
end;

function TGroupDept.GetiOrder: Integer;
begin
  Result := FiOrder;
end;

function TGroupDept.GetParentDeptGUID: string;
begin
  Result := FDeptGUID;
end;

procedure TGroupDept.SetCompanyGUID(const Value: string);
begin
  FCompanyGUID := Value;
end;

procedure TGroupDept.SetDeptCName(const Value: string);
begin
  FDeptCName := Value;
end;

procedure TGroupDept.SetDeptEName(const Value: string);
begin
  FDeptEName := Value;
end;

procedure TGroupDept.SetDeptGUID(const Value: string);
begin
  FDeptGUID := Value;
end;

procedure TGroupDept.SetiOrder(const Value: Integer);
begin
  FiOrder := Value;
end;

procedure TGroupDept.SetParentDeptGUID(const Value: string);
begin
  FParentDeptGUID := Value;
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
//    ShowMessage(TGroupCompany(FGroupCompanyList.Items[I]).GUID);
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
  ATmpTreeNode := nil;
  
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

{ TGroupRole }

function TGroupRole.GetDeptGUID: string;
begin
  Result := FDeptGUID;
end;

function TGroupRole.GetDescription: string;
begin
  Result := FDescription;
end;

function TGroupRole.GetiOrder: Integer;
begin
  Result := iOrder;
end;

function TGroupRole.GetParentRoleGUID: string;
begin
  Result := FParentRoleGUID;
end;

function TGroupRole.GetRoleGUID: string;
begin
  Result := RoleGUID;
end;

function TGroupRole.GetRoleName: string;
begin
  Result := RoleName;
end;

procedure TGroupRole.SetDeptGUID(const Value: string);
begin
  FDeptGUID := Value;
end;

procedure TGroupRole.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TGroupRole.SetiOrder(const Value: Integer);
begin
  FiOrder := Value;
end;

procedure TGroupRole.SetParentRoleGUID(const Value: string);
begin
  FParentRoleGUID := Value;
end;

procedure TGroupRole.SetRoleGUID(const Value: string);
begin
  FRoleGUID := Value;
end;

procedure TGroupRole.SetRoleName(const Value: string);
begin
  FRoleName := Value;
end;

procedure TfrmGroupRights.InitRoleTree(AClientDataSet: TClientDataSet; ADeptGUID: string);
var
  I         : Integer;
  AGroupRole: TGroupRole;
begin
  AClientDataSet.Filtered := False;
  AClientDataSet.Filter := ' DeptGUID = ' + QuotedStr(ADeptGUID) + ' AND RoleGUID <> ' + QuotedStr('');
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
    tvUserRoles.Items.AddChild(nil, AGroupRole.RoleName);
//    tvUserGroups.Items.AddChild(FindGroupDept(AGroupRole.DeptGUID),
//                                          AGroupRole.RoleName);
    AClientDataSet.Next;
  end;
  AClientDataSet.Filtered := False;
end;

procedure TfrmGroupRights.tvUserGroupsClick(Sender: TObject);
begin
  inherited;
  DisplayRoles(GetDeptGUID(tvUserGroups.Selected.Data));
end;

procedure TfrmGroupRights.DisplayRoles(ADeptGUID: string);
begin
  InitRoleTree(cdsGroups, ADeptGUID);
end;

function TfrmGroupRights.GetDeptGUID(APointer: Pointer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to FGroupDeptList.Count - 1 do
  begin
    if APointer = FGroupDeptList.Items[I] then
      Result := TGroupDept(FGroupDeptList.Items[I]).DeptGUID;
  end;
end;

end.
