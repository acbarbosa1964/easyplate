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
  private
    { Private declarations }
  public
    { Public declarations }
    FOperateType: TEasyOperateType;
    FRoleGUID   : string;
  end;

var
  frmGroupRoleUserOperate: TfrmGroupRoleUserOperate;

implementation

{$R *.dfm}

end.
