program RWIniManager;

uses
  Forms,
  untEasyRWIniMain in 'untEasyRWIniMain.pas' {frmEasyRWIniMain},
  untEasyUtilRWIni in 'untEasyUtilRWIni.pas',
  untEasyUtilStream in 'untEasyUtilStream.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '数据库连接配置工具';
  Application.CreateForm(TfrmEasyRWIniMain, frmEasyRWIniMain);
  Application.Run;
end.
