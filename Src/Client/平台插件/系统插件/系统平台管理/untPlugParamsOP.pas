unit untPlugParamsOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyEdit, untEasyButtons, untEasyPlateManager;

type
  TfrmPlugParamsOP = class(TForm)
    edtEName: TEasyLabelEdit;
    edtCName: TEasyLabelEdit;
    edtParam: TEasyLabelEdit;
    btnOK: TEasyBitButton;
    btnCancel: TEasyBitButton;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FAData: PEasytvDirectoryRecord;
  public
    { Public declarations }
  end;

var
  frmPlugParamsOP: TfrmPlugParamsOP;

  procedure ShowfrmPlugParamsOP(var AData: PEasytvDirectoryRecord; AFlag: string);
  
implementation

{$R *.dfm}

procedure ShowfrmPlugParamsOP(var AData: PEasytvDirectoryRecord; AFlag: string);
begin
  try
    frmPlugParamsOP := TfrmPlugParamsOP.Create(Application);
    if AFlag = 'Add' then
    begin
      frmPlugParamsOP.Caption := frmPlugParamsOP.Caption + '-¡¾ÐÂÔö¡¿';
    end
    else
    if AFlag = 'Edit' then
    begin
      with frmPlugParamsOP do
      begin
        Caption := frmPlugParamsOP.Caption + '-¡¾±à¼­¡¿';
        edtEName.Text := AData^.sParamEName;
        edtCName.Text := AData^.sParamCName;
        edtParam.Text := AData^.sValue;
      end;
      frmPlugParamsOP.FAData := AData;
    end;
    frmPlugParamsOP.ShowModal;
  finally
    FreeAndNil(frmPlugParamsOP);
  end;
end;
  
procedure TfrmPlugParamsOP.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
