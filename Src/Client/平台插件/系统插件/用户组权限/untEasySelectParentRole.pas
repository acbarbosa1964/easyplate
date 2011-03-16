unit untEasySelectParentRole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, StdCtrls, untEasyListBox, DB, DBClient,
  ComCtrls, untEasyTreeView, untGroupRightsObjects, ExtCtrls,
  untEasyGroupBox, untEasyButtons, ImgList;

type
  TfrmEasySelectParentRole = class(TfrmEasyPlateDBBaseForm)
    cdsParentRole: TClientDataSet;
    tvParentRole: TEasyTreeView;
    EasyPanel1: TEasyPanel;
    EasyBitButton1: TEasyBitButton;
    EasyBitButton2: TEasyBitButton;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure EasyBitButton2Click(Sender: TObject);
    procedure EasyBitButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FParentRoleList: TList;
    FSelected      : Boolean;
  public
    { Public declarations }
  end;

  function EasySelectParentRole(var AParentList: TStrings): Boolean;
var
  frmEasySelectParentRole: TfrmEasySelectParentRole;

implementation

{$R *.dfm}
uses
  untEasyUtilMethod, untEasyUtilConst;

function EasySelectParentRole(var AParentList: TStrings): Boolean;
begin
  Result := False;
  frmEasySelectParentRole := TfrmEasySelectParentRole.Create(nil);
  with frmEasySelectParentRole do
  begin
    BorderStyle := bsDialog;
  end;
  frmEasySelectParentRole.ShowModal;
  if frmEasySelectParentRole.FSelected then
  begin
    //·µ»ØÖµ
    AParentList.Add('ParentRoleGUID='
          + TGroupRole(frmEasySelectParentRole.tvParentRole.Selected.Data).RoleGUID);
    AParentList.Add('ParentRoleName='
          + TGroupRole(frmEasySelectParentRole.tvParentRole.Selected.Data).RoleName);
    Result := True;
  end;
  frmEasySelectParentRole.Free;
end;

procedure TfrmEasySelectParentRole.FormCreate(Sender: TObject);
var
  ASQL: string;
  I   : Integer;
  AParentRole: TGroupRole;
  ATmpNode   : TTreeNode;
begin
  inherited;
  if not Assigned(FParentRoleList) then
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
    ATmpNode := tvParentRole.Items.AddChild(nil, AParentRole.RoleName);
    ATmpNode.Data := AParentRole;
    
    ATmpNode.SelectedIndex := 0;
    ATmpNode.StateIndex := ATmpNode.SelectedIndex + 1;
    
    cdsParentRole.Next;
  end;  
end;

procedure TfrmEasySelectParentRole.EasyBitButton2Click(Sender: TObject);
begin
  inherited;
  FSelected := False;
  Close;
end;

procedure TfrmEasySelectParentRole.EasyBitButton1Click(Sender: TObject);
begin
  inherited;
  if tvParentRole.Selected = nil then
  begin
    Exit;
  end;
  FSelected := True;
  Close;
end;

procedure TfrmEasySelectParentRole.FormDestroy(Sender: TObject);
begin
  inherited;
  EasyFreeAndNilList(FParentRoleList);
end;

end.
