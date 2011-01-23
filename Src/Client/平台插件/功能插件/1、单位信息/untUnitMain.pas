unit untUnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBForm, ImgList, untEasyToolBar, untEasyPlateSingleForm,
  untEasyToolBarStylers, ExtCtrls, untEasyGroupBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, untEasyUtilMethod,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, cxDBEdit, untEasyDBDevExt, DBClient, StdCtrls,
  untEasyPageControl, untEasyDBConnection;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyUnitMain = class(TEasyPlateSingleForm)
    grdSingleMainDBTableView1Column1: TcxGridDBColumn;
    grdSingleMainDBTableView1Column2: TcxGridDBColumn;
    grdSingleMainDBTableView1Column3: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyUnitMain: TfrmEasyUnitMain;

implementation

{$R *.dfm}

function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyUnitMain := TfrmEasyUnitMain.Create(Application);
  if frmEasyUnitMain.FormStyle <> fsMDIChild then
    frmEasyUnitMain.FormStyle := fsMDIChild;
  if frmEasyUnitMain.WindowState <> wsMaximized then
    frmEasyUnitMain.WindowState := wsMaximized;
  frmEasyUnitMain.FormId := '{0A5467EE-7E2B-4177-A6AB-C5D9B2F38FE9}';
  Result := frmEasyUnitMain;
end;

procedure TfrmEasyUnitMain.FormCreate(Sender: TObject);
begin
  inherited;
  AddNotNullField('GUID');
  AddDFMFile('puUnit.dfm');
  MainSQL := 'SELECT * FROM puUnit';
//  MainClientDataSet := cdsMain;
//  MainDataSource := dsMain;
end;

procedure TfrmEasyUnitMain.btnSaveClick(Sender: TObject);
var
  AErrorCode: Integer;
begin
  inherited;
  EasyRDMDisp.EasySaveRDMData('puUnit', cdsMain.Delta, 'GUID', AErrorCode);
  if AErrorCode > 0 then
    ShowMessage('Error');
end;

procedure TfrmEasyUnitMain.btnNewClick(Sender: TObject);
begin
  inherited;
  cdsMain.FieldByName('GUID').AsString := GenerateGUID;
  cdsMain.FieldByName('tInputDate').AsDateTime := Now;
  cdsMain.FieldByName('sUserID').AsString := '1111111';
//  grdSingleMainDBTableView1.OptionsData.Editing := False;
end;

end.
