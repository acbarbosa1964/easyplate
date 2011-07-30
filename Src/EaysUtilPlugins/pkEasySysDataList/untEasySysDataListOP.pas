unit untEasySysDataListOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyButtons, StdCtrls, untEasyLabel, untEasyClassSysDataList,
  untEasyUtilConst, untEasyEdit, untEasyUtilMethod, ExtCtrls,
  untEasyGroupBox, untEasySpinEdit;

type
  TfrmEasySysDataListOP = class(TForm)
    edtCName: TEasyLabelEdit;
    edtRemark: TEasyLabelEdit;
    btnOK: TEasyBitButton;
    btnCancel: TEasyBitButton;
    rgEnable: TEasyRadioGroup;
    speOrder: TEasySpinEdit;
    procedure btnOKClick(Sender: TObject);
    procedure speOrderKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FSysDataList: TEasySysDataList;
    FOPType     : TEasyOperateType;
  end;

var
  frmEasySysDataListOP: TfrmEasySysDataListOP;
  
  procedure ShowfrmuntEasySysDataListOP(var ASysDataList: TEasySysDataList; OPType: TEasyOperateType);

implementation

{$R *.dfm}

  procedure ShowfrmuntEasySysDataListOP(var ASysDataList: TEasySysDataList; OPType: TEasyOperateType);
  begin
    try
      frmEasySysDataListOP := TfrmEasySysDataListOP.Create(Application);
      if OPType = eotAdd then
      begin
        frmEasySysDataListOP.FSysDataList := ASysDataList;
        frmEasySysDataListOP.speOrder.Text := IntToStr(ASysDataList.iOrder);
        frmEasySysDataListOP.Caption := frmEasySysDataListOP.Caption + '-【新增】';
      end else
      if OPType = eotEdit then
      begin
        with frmEasySysDataListOP do
        begin
          edtCName.Text := ASysDataList.SysDataName;
          if ASysDataList.bEnable then
            rgEnable.ItemIndex := 0
          else
            rgEnable.ItemIndex := 1;
          speOrder.Text := IntToStr(ASysDataList.iOrder);
          edtRemark.Text := ASysDataList.Remark;
          Caption := frmEasySysDataListOP.Caption + '-【编辑】';
        end;
        frmEasySysDataListOP.FSysDataList := ASysDataList;
      end;
      frmEasySysDataListOP.FOPType := OPType;
      frmEasySysDataListOP.ShowModal;
    finally
      FreeAndNil(frmEasySysDataListOP);
    end;
  end;
  
procedure TfrmEasySysDataListOP.btnOKClick(Sender: TObject);
begin
  if Trim(edtCName.Text) = '' then
  begin
    Application.MessageBox('名称不能为空!', '提示', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
  //新增
  if FOPType = eotAdd then
  begin
    FSysDataList.DataListGUID := GenerateGUID;
    FSysDataList.SysDataValue := '';
    FSysDataList.ParentDataListGUID := '{00000000-0000-0000-0000-000000000000}';
  end;

  FSysDataList.SysDataName := Trim(edtCName.Text);
  if rgEnable.ItemIndex = 0 then
    FSysDataList.bEnable := True
  else
    FSysDataList.bEnable := False;
  FSysDataList.iOrder := StrToInt(speOrder.Text);
  FSysDataList.Remark := Trim(edtRemark.Text);
  close;
end;

procedure TfrmEasySysDataListOP.speOrderKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #27]) then
    Key := #0;
end;

procedure TfrmEasySysDataListOP.btnCancelClick(Sender: TObject);
begin
  close;
end;

end.
