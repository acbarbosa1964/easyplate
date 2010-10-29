unit untEasyRWIniMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyEdit, untEasyEditExt, untEasyMemo,
  untEasyButtons, untEasyLabel;

type
  TfrmEasyRWIniMain = class(TForm)
    edtFileName: TEasyFileNameEdit;
    MemContext: TEasyMemo;
    btnExit: TEasyBitButton;
    btnSave: TEasyBitButton;
    edtSeed: TEasyMaskEdit;
    EasyLabel1: TEasyLabel;
    EasyLabel2: TEasyLabel;
    procedure btnExitClick(Sender: TObject);
    procedure edtFileNameDialogExit(Sender: TObject; ExitOK: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    IniFileName: string;
    procedure ReadIniFile(AFileName, ASeed: string);
    procedure WriteIniFile(AFileName, ASeed: string);
  public
    { Public declarations }
  end;

var
  frmEasyRWIniMain: TfrmEasyRWIniMain;

implementation

uses untEasyUtilRWIni;

{$R *.dfm}

procedure TfrmEasyRWIniMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEasyRWIniMain.edtFileNameDialogExit(Sender: TObject;
  ExitOK: Boolean);
begin
  if Trim(edtFileName.FileName) = '' then Exit;
  if Trim(edtSeed.Text) = '' then
  begin
    Application.MessageBox('请输入打开文件密码!', '提示', MB_OK +
      MB_ICONWARNING);
    edtFileName.FileName := '';
    Exit;
  end;
  IniFileName := edtFileName.FileName;
  if FileExists(IniFileName) then
    ReadIniFile(IniFileName, edtSeed.Text);
end;

procedure TfrmEasyRWIniMain.ReadIniFile(AFileName, ASeed: string);
var
  Ini      : TEasyXorIniFile;
  Sections,
  Values   : TStrings;
  I, J     : Integer;
begin
  Ini := nil;
  Sections := nil;
  Values := nil;
  MemContext.Lines.Clear;

  try
    Ini := TEasyXorIniFile.Create(IniFileName, ASeed);

    Sections := TStringList.Create;
    Values := TStringList.Create;

    Ini.ReadSections(Sections);
    for I := 0 to Sections.Count - 1 do
    begin
      MemContext.Lines.Add('[' + Sections[I] + ']');
      Ini.ReadSection(Sections[I], Values);
      for J := 0 to Values.Count - 1 do
        MemContext.Lines.Add(Values[J] + '=' + Ini.ReadString(Sections[I], Values[J], ''));
    end;      
  finally
    Sections.Free;
    Ini.Free;
    Values.Free;
  end;
end;

procedure TfrmEasyRWIniMain.WriteIniFile(AFileName, ASeed: string);
var
  Ini: TEasyXorIniFile;
begin
  Ini := TEasyXorIniFile.Create(IniFileName, ASeed);
  try
    ini.SetStrings(MemContext.Lines);
    if not FileExists(AFileName) then
      Ini.SaveToFile(AFileName)
    else
    begin
      if Application.MessageBox('文件已存在,是否覆盖?', '提示', MB_OKCANCEL + 
        MB_ICONQUESTION) = IDOK then
      begin
        ini.SaveToFile(AFileName);
        Application.MessageBox(PChar('保存成功!'), '提示', MB_OK +
          MB_ICONINFORMATION);
      end;
    end; 
  finally
    Ini.Free;
  end;
end;

procedure TfrmEasyRWIniMain.btnSaveClick(Sender: TObject);
begin
  if Trim(edtSeed.Text) = '' then
  begin
    Application.MessageBox('请输入打开文件密码!', '提示', MB_OK +
      MB_ICONWARNING);
    Exit;
  end;
  if FileExists(edtFileName.FileName) then
    WriteIniFile(edtFileName.FileName, edtSeed.Text);
end;

procedure TfrmEasyRWIniMain.FormCreate(Sender: TObject);
begin
  edtFileName.InitialDir := ParamStr(0);
end;

end.
