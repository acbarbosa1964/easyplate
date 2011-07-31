unit untEasyInputQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyButtons, StdCtrls, untEasyEdit;

type
  TfrmEasyInputQuery = class(TForm)
    edtRemark: TEasyLabelEdit;
    btnOK: TEasyBitButton;
    btnCancel: TEasyBitButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function EasyInputQuery(ACaption, APrompt: string; var Value: string): Boolean;
  
var
  frmEasyInputQuery: TfrmEasyInputQuery;

implementation

{$R *.dfm}

  function EasyInputQuery(ACaption, APrompt: string; var Value: string): Boolean;
  begin
    Result := False;
    frmEasyInputQuery := TfrmEasyInputQuery.Create(Application);
    try
      with frmEasyInputQuery do
      begin
        Caption := ACaption;
        edtRemark.EditLabel.Caption := APrompt;
        ShowModal;
        if ModalResult = mrOK then
        begin
          if Trim(edtRemark.Text) <> '' then
          begin
            Value := Trim(edtRemark.Text);
            Result := True;
          end;  
        end;  
      end;
    finally
      frmEasyInputQuery.Free;
    end;
  end;
end.
