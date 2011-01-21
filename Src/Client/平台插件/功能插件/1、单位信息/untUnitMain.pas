unit untUnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBForm, ImgList, untEasyToolBar,
  untEasyToolBarStylers, ExtCtrls, untEasyGroupBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, untEasyUtilMethod,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, cxDBEdit, untEasyDBDevExt, DBClient, StdCtrls,
  untEasyPageControl;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyUnitMain = class(TfrmEasyPlateDBForm)
    Splitter1: TSplitter;
    pnlClient: TEasyPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
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
  AddDFMFile('Unit1.dfm');
  AddDFMFile('Unit2.dfm');
  MainSQL := 'SELECT * FROM hrHumanResource';
//  MainClientDataSet := cdsMain;
//  MainDataSource := dsMain;
end;

procedure TfrmEasyUnitMain.btnSaveClick(Sender: TObject);
begin
  inherited;
//  EasyRDMDisp.EasySaveRDMData('', cdsUnit.Delta, 'GUID', 0);
end;

end.
