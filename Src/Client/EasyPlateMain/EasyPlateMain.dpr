program EasyPlateMain;


uses
  Forms,
  SysUtils,
  Classes,
  Windows,
  Dialogs,
  IniFiles,
  untEasyUtilConst,
  untEasyDBConnection,
  untEasyPlateBaseForm in '..\EasyBaseForm\untEasyPlateBaseForm.pas' {frmEasyPlateBaseForm},
  untEasyPlateDBBaseForm in '..\EasyBaseForm\untEasyPlateDBBaseForm.pas' {frmEasyPlateDBBaseForm},
  EasyPlateHint in 'EasyPlateHint.pas' {Form1},
  untEasyPlateLoading in 'untEasyPlateLoading.pas' {frmEasyPlateLoading},
  untEasyPlateMain in 'untEasyPlateMain.pas' {frmEasyPlateMain},
  untEasyLoginMain in 'untEasyLoginMain.pas' {frmEasyLoginMain};

type
  TShowSplashForm = function (AHandle: THandle): Boolean; stdcall;

var
  AShowSplashForm: TShowSplashForm;         //闪窗体
  ASplashHandle  : THandle;
  {$R *.res}

begin
  Application.Initialize;

  //创建界面初始化参数
  if fileexists('Splash.ini') then
  begin
    //闪窗体
    if not FileExists('SplashForm.dll') then
    begin
      Application.MessageBox(PChar(EASY_SPLASH_NOTFILE), PChar(EASY_SYS_ERROR), MB_OK +
        MB_ICONSTOP);
      Application.Terminate;
    end;
    ASplashHandle := LoadLibrary(PChar('SplashForm.dll'));
    if ASplashHandle <> 0 then
    try
      AShowSplashForm := GetProcAddress(ASplashHandle, 'ShowSplashForm');
      if @AShowSplashForm <> nil then
        AShowSplashForm(Application.Handle);
    finally
      FreeLibrary(ASplashHandle);
    end;
  end;  

  Application.CreateForm(TfrmEasyPlateMain, frmEasyPlateMain);
  Application.Run;
end.
