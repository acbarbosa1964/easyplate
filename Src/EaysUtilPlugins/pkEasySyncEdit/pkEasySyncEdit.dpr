program pkEasySyncEdit;

uses
  Forms,
  untEasySyncEditMain in 'untEasySyncEditMain.pas' {frmEasySyncEditMain},
  untEditFrm in 'untEditFrm.pas' {frmEditorFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'EControl Syntax Editor';
  Application.HelpFile := 'ec_edit.hlp';
  Application.CreateForm(TfrmEasySyncEditMain, frmEasySyncEditMain);
  Application.Run;
end.
