unit untEasySelectParentRole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, StdCtrls, untEasyListBox, DB, DBClient,
  ComCtrls, untEasyTreeView, untGroupRightsObjects;

type
  TfrmEasySelectParentRole = class(TfrmEasyPlateDBBaseForm)
    cdsParentRole: TClientDataSet;
    tvParentRole: TEasyTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FParentRoleList: TList;
  public
    { Public declarations }
  end;

var
  frmEasySelectParentRole: TfrmEasySelectParentRole;

implementation

{$R *.dfm}
uses
  untEasyUtilMethod;

procedure TfrmEasySelectParentRole.FormCreate(Sender: TObject);
var
  ASQL: string;
  I   : Integer;
  AParentRole: TGroupRole;
begin
  inherited;
  FParentRoleList := TList.Create;
  
  ASQL := ' SELECT RoleGUID, sRoleName, sParentRoleGUID FROM sysRole ORDER BY iOrder';
  cdsParentRole.Data := EasyRDMDisp.EasyGetRDMData(ASQL);
  for I := 0 to cdsParentRole.RecordCount - 1 do
  begin
    AParentRole := TGroupRole.Create;
    with AParentRole do
    begin
      RoleGUID := cdsParentRole.fieldbyname('RoleGUID').AsString;
      RoleName := cdsParentRole.fieldbyname('sRoleName').AsString;
      ParentRoleGUID := cdsParentRole.fieldbyname('sParentRoleGUID').AsString;
    end;
    FParentRoleList.Add(AParentRole);
    tvParentRole.Items.AddChild(nil, AParentRole.RoleName);
    cdsParentRole.Next;
  end;  
end;

procedure TfrmEasySelectParentRole.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EasyFreeAndNilList(FParentRoleList);
end;

end.
