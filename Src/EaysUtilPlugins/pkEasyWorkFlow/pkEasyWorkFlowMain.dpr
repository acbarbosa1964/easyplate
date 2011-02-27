program pkEasyWorkFlowMain;

uses
  Forms,
  untEasyWorkFlowMain in 'untEasyWorkFlowMain.pas' {frmEasyWorkFlowMain},
  untEasyWorkFlowDiagramShadow in 'untEasyWorkFlowDiagramShadow.pas' {frmEasyWorkFlowDiagramShadow},
  untEasyWorkFlowDiagramGradient in 'untEasyWorkFlowDiagramGradient.pas' {frmEasyWorkFlowDiagramGradient};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEasyWorkFlowMain, frmEasyWorkFlowMain);
  Application.CreateForm(TfrmEasyWorkFlowDiagramShadow, frmEasyWorkFlowDiagramShadow);
  Application.CreateForm(TfrmEasyWorkFlowDiagramGradient, frmEasyWorkFlowDiagramGradient);
  Application.Run;
end.
