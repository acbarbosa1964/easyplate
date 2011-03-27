program EasyconnDB;

uses
  Forms,
  EasyADOConEditor in 'EasyADOConEditor.pas' {frmEasyADOConEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEasyADOConEditor, frmEasyADOConEditor);
  Application.Run;
end.
