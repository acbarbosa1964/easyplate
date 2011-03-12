unit untGroupRightsOperate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ComCtrls, untEasyTreeView,
  untEasyButtons, ExtCtrls, untEasyGroupBox, untEasyEdit, StdCtrls,
  untEasyUtilConst;

type
  TfrmGroupRightsOperate = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyPanel5: TEasyPanel;
    EasyBitButton1: TEasyBitButton;
    EasyBitButton2: TEasyBitButton;
    EasyBitButton3: TEasyBitButton;
    EasyBitButton4: TEasyBitButton;
    EasyCheckTree1: TEasyCheckTree;
    EasyCheckTree2: TEasyCheckTree;
    EasyBitButton5: TEasyBitButton;
    EasyBitButton6: TEasyBitButton;
    EasyLabelEdit1: TEasyLabelEdit;
    EasyButtonEdit1: TEasyButtonEdit;
    procedure EasyBitButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FOperateType: TEasyOperateType;
  end;

var
  frmGroupRightsOperate: TfrmGroupRightsOperate;

implementation

uses untGroupRightsObjects;

{$R *.dfm}

procedure TfrmGroupRightsOperate.EasyBitButton6Click(Sender: TObject);
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
end;

end.
