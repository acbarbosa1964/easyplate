program EasyPlateMain;


uses
  ShareMem,
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
  untEasyLoginMain in 'untEasyLoginMain.pas' {frmEasyLoginMain},
  untEasyPlateLoading in 'untEasyPlateLoading.pas' {frmEasyPlateLoading},
  untEasyPlateMain in 'untEasyPlateMain.pas' {frmEasyPlateMain};

type
  TShowSplashForm = function (AHandle: THandle): Boolean; stdcall;
  TShowfrmEasyLogin = function(AHandle: THandle): Integer; stdcall;

var
  AShowSplashForm: TShowSplashForm;         //闪窗体
  ASplashHandle  : THandle;
  AShowfrmLogin  : TShowfrmEasyLogin;
  ATmpHanle      : THandle;
  {$R *.res}

begin
  Application.Initialize;

  //创建界面初始化参数
  {if fileexists('Splash.ini') then
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
  end;  }

    //初始化数据模块  在数据模块单元初始化时自动创建
  //登录窗体创建
 { if not FileExists('pkEasyLogin.bpl') then
  begin
    Application.MessageBox(PChar(EASY_LOGIN_NOTFILE), PChar(EASY_SYS_ERROR), MB_OK +
      MB_ICONSTOP);
    Application.Terminate;
  end;
  ATmpHanle := LoadPackage(PChar('pkEasyLogin.bpl'));
  if ATmpHanle <> 0 then
  try
    AShowfrmLogin := GetProcAddress(ATmpHanle, 'ShowfrmEasyLogin');
    if @AShowfrmLogin <> nil then
      AShowfrmLogin(Application.Handle);
  finally
    //交由主窗体释放
//    FreeLibrary(ATmpHanle);
  end;      }

  Application.CreateForm(TfrmEasyPlateMain, frmEasyPlateMain);
  Application.Run;
end.
