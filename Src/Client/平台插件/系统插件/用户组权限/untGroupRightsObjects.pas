unit untGroupRightsObjects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes;

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

  //用户组权限--用户帐号信息
  TGroupUser = class
  private
    FLoginGUID,
    FLoginName,
    FRoleGUID,
    FEmployeeGUID,
    FEmployeeCName,
    FEmployeeEName,
    FSexGUID: string;
    function GetEmployeeCName: string;
    function GetEmployeeEName: string;
    function GetEmployeeGUID: string;
    function GetLoginGUID: string;
    function GetLoginName: string;
    function GetRoleGUID: string;
    function GetSexGUID: string;
    procedure setEmployeeCName(const Value: string);
    procedure setEmployeeEName(const Value: string);
    procedure setEmployeeGUID(const Value: string);
    procedure setLoginGUID(const Value: string);
    procedure setLoginName(const Value: string);
    procedure setRoleGUID(const Value: string);
    procedure setSexGUID(const Value: string);
  public
    property LoginGUID: string read GetLoginGUID write setLoginGUID;
    property LoginName: string read GetLoginName write setLoginName;
    property RoleGUID: string read GetRoleGUID write setRoleGUID;
    property EmployeeGUID: string read GetEmployeeGUID write setEmployeeGUID;
    property EmployeeCName: string read GetEmployeeCName write setEmployeeCName;
    property EmployeeEName: string read GetEmployeeEName write setEmployeeEName;
    property SexGUID: string read GetSexGUID write setSexGUID;
  end;

  //用户组权限--权限资源信息
  TGroupRoleResource = class
  private
    FGUID,
    FRoleGUID,
    FResourceGUID,
    FResourceName,
    FParentResourceGUID: string;
    FiOrder: Integer;
    FChecked: Boolean;
    function GetGUID: string;
    function GetiOrder: Integer;
    function GetParentResourceGUID: string;
    function GetResourceGUID: string;
    function GetResourceName: string;
    procedure setGUID(const Value: string);
    procedure setiOrder(const Value: Integer);
    procedure setParentResourceGUID(const Value: string);
    procedure setResourceGUID(const Value: string);
    procedure setResourceName(const Value: string);
    function GetChecked: Boolean;
    procedure SetChecked(const Value: Boolean);
    function GetRoleGUID: string;
    procedure setRoleGUID(const Value: string);
  public
    property GUID: string read GetGUID write setGUID;
    property RoleGUID: string read GetRoleGUID write setRoleGUID;
    property ResourceGUID: string read GetResourceGUID write setResourceGUID;
    property ResourceName: string read GetResourceName write setResourceName;
    property ParentResourceGUID: string read GetParentResourceGUID write setParentResourceGUID;
    property iOrder: Integer read GetiOrder write setiOrder;
    property Checked: Boolean read GetChecked write SetChecked;
  end;

  //角色对应的资源信息
  TGroupUserResource = class
  private
    FGUID,
    FRoleGUID,
    FResourceGUID: string;
    function GetGUID: string;
    function GetResourceGUID: string;
    function GetRoleGUID: string;
    procedure setGUID(const Value: string);
    procedure setResourceGUID(const Value: string);
    procedure setRoleGUID(const Value: string);
  public
    property GUID: string read GetGUID write setGUID;
    property RoleGUID: string read GetRoleGUID write setRoleGUID;
    property ResourceGUID: string read GetResourceGUID write setResourceGUID;
  end;

implementation

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

procedure TGroupCompany.SetParentCompanyGUID(const Value: string);
begin
  FParentCompanyGUID := Value;
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
  Result := FiOrder;
end;

function TGroupRole.GetParentRoleGUID: string;
begin
  Result := FParentRoleGUID;
end;

function TGroupRole.GetRoleGUID: string;
begin
  Result := FRoleGUID;
end;

function TGroupRole.GetRoleName: string;
begin
  Result := FRoleName;
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


{ TGroupUser }

function TGroupUser.GetEmployeeCName: string;
begin
  Result := FEmployeeCName;
end;

function TGroupUser.GetEmployeeEName: string;
begin
  Result := FEmployeeEName;
end;

function TGroupUser.GetEmployeeGUID: string;
begin
  Result := FEmployeeGUID;
end;

function TGroupUser.GetLoginGUID: string;
begin
  Result := FLoginGUID;
end;

function TGroupUser.GetLoginName: string;
begin
  Result := FLoginName;
end;

function TGroupUser.GetRoleGUID: string;
begin
  Result := FRoleGUID;
end;

function TGroupUser.GetSexGUID: string;
begin
  Result := FSexGUID;
end;

procedure TGroupUser.setEmployeeCName(const Value: string);
begin
  FEmployeeCName := Value;
end;

procedure TGroupUser.setEmployeeEName(const Value: string);
begin
  FEmployeeEName := Value;
end;

procedure TGroupUser.setEmployeeGUID(const Value: string);
begin
  FEmployeeGUID := Value;
end;

procedure TGroupUser.setLoginGUID(const Value: string);
begin
  FLoginGUID := Value;
end;

procedure TGroupUser.setLoginName(const Value: string);
begin
  FLoginName := Value;
end;

procedure TGroupUser.setRoleGUID(const Value: string);
begin
  FRoleGUID := Value;
end;

procedure TGroupUser.setSexGUID(const Value: string);
begin
  FSexGUID := Value;
end;

{ TGroupRoleResource }

function TGroupRoleResource.GetChecked: Boolean;
begin
  Result := FChecked;
end;

function TGroupRoleResource.GetGUID: string;
begin
  Result := FGUID;
end;

function TGroupRoleResource.GetiOrder: Integer;
begin
  Result := FiOrder;
end;

function TGroupRoleResource.GetParentResourceGUID: string;
begin
  Result := FParentResourceGUID;
end;

function TGroupRoleResource.GetResourceGUID: string;
begin
  Result := FResourceGUID;
end;

function TGroupRoleResource.GetResourceName: string;
begin
  Result := FResourceName;
end;

function TGroupRoleResource.GetRoleGUID: string;
begin
  Result := FRoleGUID;
end;

procedure TGroupRoleResource.SetChecked(const Value: Boolean);
begin
  FChecked := Value;
end;

procedure TGroupRoleResource.setGUID(const Value: string);
begin
  FGUID := Value;
end;

procedure TGroupRoleResource.setiOrder(const Value: Integer);
begin
  FiOrder := Value;
end;

procedure TGroupRoleResource.setParentResourceGUID(const Value: string);
begin
  FParentResourceGUID := Value;
end;

procedure TGroupRoleResource.setResourceGUID(const Value: string);
begin
  FResourceGUID := Value;
end;

procedure TGroupRoleResource.setResourceName(const Value: string);
begin
  FResourceName := Value;
end;

procedure TGroupRoleResource.setRoleGUID(const Value: string);
begin
  FRoleGUID := Value;
end;

{ TGroupUserResource }

function TGroupUserResource.GetGUID: string;
begin
  Result := FGUID;
end;

function TGroupUserResource.GetResourceGUID: string;
begin
  Result := FResourceGUID;
end;

function TGroupUserResource.GetRoleGUID: string;
begin
  Result := FRoleGUID;
end;

procedure TGroupUserResource.setGUID(const Value: string);
begin
  FGUID := Value;
end;

procedure TGroupUserResource.setResourceGUID(const Value: string);
begin
  FResourceGUID := Value;
end;

procedure TGroupUserResource.setRoleGUID(const Value: string);
begin
  FRoleGUID := Value;
end;

end.
