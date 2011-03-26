unit untGroupRoleUserOperate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ComCtrls, untEasyTreeView,
  untEasyButtons, ExtCtrls, untEasyGroupBox, untEasyEdit, StdCtrls,
  untEasyUtilConst, ImgList, DB, DBClient, untEasyLabel, untGroupRightsObjects,
  Menus, untEasyMenus, untEasyMenuStylers, untEasyBallonControl;

type
  TfrmGroupRoleUserOperate = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyLabel1: TEasyLabel;
    EasyLabel2: TEasyLabel;
    edtRoleName: TEasyLabelEdit;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    tvHaveUsers: TEasyCheckTree;
    EasyPanel5: TEasyPanel;
    tvNotHaveUsers: TEasyCheckTree;
    btnAssignAll: TEasyBitButton;
    btnAssign: TEasyBitButton;
    btnRevoke: TEasyBitButton;
    btnRevokeAll: TEasyBitButton;
    btnSave: TEasyBitButton;
    btnCancel: TEasyBitButton;
    imgRR: TImageList;
    cdsUsers: TClientDataSet;
    pmNotHaveRights: TEasyPopupMenu;
    pmFullExpand2: TMenuItem;
    pmFullCollapse2: TMenuItem;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    pmHaveRights: TEasyPopupMenu;
    pmFullExpand1: TMenuItem;
    pmFullCollapse1: TMenuItem;
    cdsNotUsers: TClientDataSet;
    cdsRoleUser: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAssignClick(Sender: TObject);
    procedure btnAssignAllClick(Sender: TObject);
    procedure btnRevokeClick(Sender: TObject);
    procedure btnRevokeAllClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FGroupUserList,
    FGroupNotUserList: TList;
    procedure DisposeGroupUserList;
    procedure DisplayUsers;
    procedure InitUserTree(AClientDataSet: TClientDataSet; ADestTree: TEasyCheckTree;
                            AUserList: TList);
    //角色下增加、移除用户
    procedure AssignUser(ASrcTree, ADestTree: TEasyCheckTree; AType: Integer);
    procedure AppendClientData(AClientDataSet: TClientDataSet; AUser: TGroupUser);
    procedure DeleteClientData(AClientDataSet: TClientDataSet; AUser: TGroupUser);
  public
    { Public declarations }
    FOperateType: TEasyOperateType;
    FRoleGUID   : string;
  end;

var
  frmGroupRoleUserOperate: TfrmGroupRoleUserOperate;

implementation

{$R *.dfm}
uses
  untEasyUtilMethod;

//用户必须处于启用状态、且未过期
procedure TfrmGroupRoleUserOperate.FormShow(Sender: TObject);
var
  sUsersSQL,
  sNotUsersSQL,
  sRoleUser   : string;
  ASQLOLE,
  AResultOLE  : OleVariant;
begin
  inherited;
  sNotUsersSQL := 'SELECT A.LoginGUID, A.sLoginName, C.EmployeeGUID sEmployeeGUID, '
	                +' C.sEmployeeCName, C.sEmployeeEName, C.sSexGUID '
                  +' FROM sysLoginUser A '
                  +' LEFT JOIN hrHumanResource C ON A.sEmployeeGUID = C.EmployeeGUID'
                  +' WHERE A.LoginGUID NOT IN (SELECT LoginGUID FROM vw_InitUser '
                  +' WHERE sRoleGUID = ' + QuotedStr(Trim(edtRoleName.EditLabel.Hint)) + ')'
                  +' AND A.bEnable = 1 AND GETDATE() < A.dDisenableTime '
                  +' ORDER BY C.sEmployeeCName';
  sUsersSQL := 'SELECT  A.LoginGUID, A.sLoginName, A.sRoleGUID, A.sEmployeeGUID, A.sEmployeeCName,'
               +' A.sEmployeeEName, A.sSexGUID '
               +' FROM sysRole_user B LEFT JOIN vw_InitUser A ON B.LoginGUID = A.LoginGUID '
               +' WHERE bEnable = 1 AND GETDATE() < dDisenableTime '
               +' ORDER BY iOrderNo';
  sRoleUser := ' SELECT * FROM sysRole_user WHERE 1 = 2';
  ASQLOLE := VarArrayCreate([0, 2], varVariant);
  ASQLOLE[0] := sNotUsersSQL;
  ASQLOLE[1] := sUsersSQL;
  ASQLOLE[2] := sRoleUser;
  
  AResultOLE := EasyRDMDisp.EasyGetRDMDatas(ASQLOLE);

  cdsNotUsers.Data := AResultOLE[0];
  cdsUsers.Data := AResultOLE[1];
  cdsRoleUser.Data := AResultOLE[2];

  DisplayUsers;
end;

procedure TfrmGroupRoleUserOperate.FormCreate(Sender: TObject);
begin
  inherited;
  edtRoleName.ReadOnly := True;
  FGroupUserList := TList.Create;
  FGroupNotUserList := TList.Create;
end;

procedure TfrmGroupRoleUserOperate.DisplayUsers;
begin
  DisposeGroupUserList;

  InitUserTree(cdsUsers, tvHaveUsers, FGroupUserList);
  InitUserTree(cdsNotUsers, tvNotHaveUsers, FGroupUserList);
end;

procedure TfrmGroupRoleUserOperate.InitUserTree(AClientDataSet: TClientDataSet;
        ADestTree: TEasyCheckTree; AUserList: TList);
var
  I           : Integer;
  AGroupUser  : TGroupUser;
  ATmpUserNode: TTreeNode;
begin
  ADestTree.Items.BeginUpdate;
  
  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AGroupUser := TGroupUser.Create;
    with AGroupUser do
    begin
      LoginGUID := AClientDataSet.fieldbyname('LoginGUID').AsString;
      LoginName := AClientDataSet.fieldbyname('sLoginName').AsString;
//      RoleGUID := AClientDataSet.fieldbyname('sRoleGUID').AsString;
      EmployeeGUID := AClientDataSet.fieldbyname('sEmployeeGUID').AsString;
      EmployeeCName := AClientDataSet.fieldbyname('sEmployeeCName').AsString;
      EmployeeEName := AClientDataSet.fieldbyname('sEmployeeEName').AsString;
      SexGUID := AClientDataSet.fieldbyname('sSexGUID').AsString;
    end;
    AUserList.Add(AGroupUser);
    //将角色节点挂靠到对应的部门节点下面
    ATmpUserNode := ADestTree.Items.AddChild(nil, AGroupUser.EmployeeCName);
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
  ADestTree.Items.EndUpdate;
end;

procedure TfrmGroupRoleUserOperate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DisposeGroupUserList;
end;

procedure TfrmGroupRoleUserOperate.DisposeGroupUserList;
var
  I: Integer;
begin
  for I := FGroupUserList.Count - 1 downto 0 do
    TGroupUser(FGroupUserList.Items[I]).Free;
  FGroupUserList.Clear;

  for I := FGroupNotUserList.Count - 1 downto 0 do
    TGroupUser(FGroupNotUserList.Items[I]).Free;
  FGroupNotUserList.Clear;
end;

procedure TfrmGroupRoleUserOperate.AppendClientData(
  AClientDataSet: TClientDataSet; AUser: TGroupUser);
begin
  with AClientDataSet do
  begin
    Append;
    FieldByName('GUID').AsString := GenerateGUID;
    FieldByName('RoleGUID').AsString := Trim(edtRoleName.EditLabel.Hint);
    FieldByName('LoginGUID').AsString := AUser.LoginGUID;
    Post;
  end;
end;

procedure TfrmGroupRoleUserOperate.DeleteClientData(
  AClientDataSet: TClientDataSet; AUser: TGroupUser);
begin
  if AClientDataSet.Locate('LoginGUID', AUser.LoginGUID, [loCaseInsensitive]) then
    AClientDataSet.Delete;
end;

procedure TfrmGroupRoleUserOperate.AssignUser(ASrcTree,
  ADestTree: TEasyCheckTree; AType: Integer);
var
  I: Integer;
  ATmpNode,
  ATmpUserNode: TTreeNode;
begin
  for I := ASrcTree.Items.Count - 1 downto 0 do
  begin
    if ASrcTree.ItemState[I] = csChecked then
    begin
      ATmpUserNode := ASrcTree.Items.Item[I];
      if ATmpUserNode <> nil then
      begin
        ATmpNode := ADestTree.Items.AddChild(nil, TGroupUser(ATmpUserNode.Data).EmployeeCName);
        ATmpNode.Data := ATmpUserNode.Data;

        ATmpNode.ImageIndex := 0;
        ATmpNode.SelectedIndex := ATmpNode.ImageIndex + 1;
        if AType = 0 then
          //生成数据集
          AppendClientData(cdsRoleUser, TGroupUser(ATmpNode.Data))
        else
          DeleteClientData(cdsRoleUser, TGroupUser(ATmpNode.Data));

        ASrcTree.Items.Item[I].Delete;
      end;
    end;
  end;
end;

procedure TfrmGroupRoleUserOperate.btnAssignClick(Sender: TObject);
begin
  inherited;
  AssignUser(tvNotHaveUsers, tvHaveUsers, 0);
end;

procedure TfrmGroupRoleUserOperate.btnAssignAllClick(Sender: TObject);
begin
  inherited;
  if tvNotHaveUsers.Items.Count = 0 then Exit;
  tvNotHaveUsers.SetAllNodes(csChecked);
  AssignUser(tvNotHaveUsers, tvHaveUsers, 0);
end;

procedure TfrmGroupRoleUserOperate.btnRevokeClick(Sender: TObject);
begin
  inherited;
  AssignUser(tvHaveUsers, tvNotHaveUsers, 1);
end;

procedure TfrmGroupRoleUserOperate.btnRevokeAllClick(Sender: TObject);
begin
  inherited;
  if tvHaveUsers.Items.Count = 0 then Exit;
  tvHaveUsers.SetAllNodes(csChecked);
  AssignUser(tvHaveUsers, tvNotHaveUsers, 1);
end;

procedure TfrmGroupRoleUserOperate.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmGroupRoleUserOperate.btnSaveClick(Sender: TObject);
var
  AErrorCode: Integer;
  AResultOLE: OleVariant;
begin
  inherited;
  if cdsRoleUser.ChangeCount = 0 then
  begin
    EasyHint(EASY_SYS_DATANOCHANGE);
    Exit;
  end;
  try                    
    AResultOLE := EasyRDMDisp.EasySaveRDMData('sysRole_user', cdsRoleUser.Delta,
                                              'GUID', AErrorCode);
    EasyHint(EASY_SYS_SAVE_SUCCESS);
    Self.ModalResult := mrOk;
  except on e: Exception do
    EasyHint(EASY_SYS_SAVE_FAILED + e.Message + IntToStr(AErrorCode));
  end;
end;

end.
