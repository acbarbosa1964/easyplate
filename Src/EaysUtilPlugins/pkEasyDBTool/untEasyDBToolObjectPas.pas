unit untEasyDBToolObjectPas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyToolBar, StdCtrls, untEasyMemo, untEasyToolBarStylers,
  ImgList;

type
  TfrmEasyDBToolObjectPas = class(TForm)
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    mmResult: TEasyMemo;
    btnSaveAS: TEasyToolBarButton;
    imgImportance: TImageList;
    btnCopy: TEasyToolBarButton;
    btnClose: TEasyToolBarButton;
    dlgSaveAS: TSaveDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnSaveASClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AResultList: TStrings;
  end;

var
  frmEasyDBToolObjectPas: TfrmEasyDBToolObjectPas;

implementation

{$R *.dfm}

procedure TfrmEasyDBToolObjectPas.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEasyDBToolObjectPas.btnCopyClick(Sender: TObject);
begin
  mmResult.SelectAll;
  mmResult.CopyToClipboard;
end;

procedure TfrmEasyDBToolObjectPas.btnSaveASClick(Sender: TObject);
begin
  if dlgSaveAS.Execute then
  begin
    if dlgSaveAS.FilterIndex = 1 then
      mmResult.Lines.SaveToFile(dlgSaveAS.FileName + '.txt')
    else
      mmResult.Lines.SaveToFile(dlgSaveAS.FileName + '.pas')
  end;
end;

end.
