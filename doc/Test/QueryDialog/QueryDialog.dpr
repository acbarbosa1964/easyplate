program QueryDialog;

uses
  Forms,
  untQueryDialog in 'untQueryDialog.pas' {Form1},
  untEasySelectDialog in 'untEasySelectDialog.pas' {frmEasySelectDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
