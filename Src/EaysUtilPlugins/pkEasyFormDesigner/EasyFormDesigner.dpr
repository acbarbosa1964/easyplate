program EasyFormDesigner;

uses
  Forms,
  untEasyFormDesigner in 'untEasyFormDesigner.pas' {frmEasyFormDesigner},
  untFrmDsnEdit in 'untFrmDsnEdit.pas' {FrmDsnEdit: TFrame},
  untStdRegComps in 'untStdRegComps.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEasyFormDesigner, frmEasyFormDesigner);
  Application.Run;
end.
