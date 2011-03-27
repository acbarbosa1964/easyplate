program EasyconnDB_Server;

uses
  Forms,
  EasyADOConEditor_Server in 'EasyADOConEditor_Server.pas' {frmEasyADOConEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEasyADOConEditor, frmEasyADOConEditor);
  Application.Run;
end.
