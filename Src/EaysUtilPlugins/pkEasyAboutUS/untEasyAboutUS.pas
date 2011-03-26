unit untEasyAboutUS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, untEasyLabel, untEasyButtons;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;

type
  TfrmEasyAboutUS = class(TForm)
    Image1: TImage;
    EasyLabel1: TEasyLabel;
    EasyLabel2: TEasyLabel;
    EasyLabel3: TEasyLabel;
    EasyLabel4: TEasyLabel;
    EasyLabel5: TEasyLabel;
    btnCancel: TEasyBitButton;
    lblHost: TEasyLabel;
    lblSystemVersion: TEasyLabel;
    EasyLabel6: TEasyLabel;
    EasyLabel7: TEasyLabel;
    EasyLabel8: TEasyLabel;
    EasyLabel9: TEasyLabel;
    EasyLabel10: TEasyLabel;
    EasyLabel11: TEasyLabel;
    EasyLabel12: TEasyLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EasyLabel10Click(Sender: TObject);
    procedure EasyLabel12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyAboutUS: TfrmEasyAboutUS;

implementation

uses untEasyUtilDLL, ShellAPI;

{$R *.dfm}

function ShowBplForm(AParamList: TStrings): TForm;
begin
  Result := nil;
  frmEasyAboutUS := TfrmEasyAboutUS.Create(Application);
  frmEasyAboutUS.ShowModal;
  frmEasyAboutUS.Free;
end;  

procedure TfrmEasyAboutUS.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEasyAboutUS.FormShow(Sender: TObject);
begin
//  StaticText1.Caption := GetSystemUserName;
//  StaticText2.Caption := GetWindowsVersion;
end;

procedure TfrmEasyAboutUS.EasyLabel10Click(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), 'mailto:yixuan-software@hotmail.com', nil,
               nil, SW_NORMAL);
end;

procedure TfrmEasyAboutUS.EasyLabel12Click(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), 'www.yixuan-software.com', nil,
               nil, SW_NORMAL);
end;

procedure TfrmEasyAboutUS.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered := True;
end;

end.
