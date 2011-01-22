unit untEasyPlateSingleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBForm, DB, DBClient, ImgList, untEasyToolBar,
  untEasyToolBarStylers, untEasyPageControl, ExtCtrls, untEasyGroupBox,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TEasyPlateSingleForm = class(TfrmEasyPlateDBForm)
    Splitter1: TSplitter;
    pnlClient: TEasyPanel;
    grdSingleMain: TcxGrid;
    grdSingleMainDBTableView1: TcxGridDBTableView;
    grdSingleMainLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure grdSingleMainDBTableView1CanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EasyPlateSingleForm: TEasyPlateSingleForm;

implementation

{$R *.dfm}

procedure TEasyPlateSingleForm.FormCreate(Sender: TObject);
begin
  inherited;
  MainGrid := grdSingleMain;
end;

procedure TEasyPlateSingleForm.grdSingleMainDBTableView1CanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  if (EasyDataState = edsInsert) or (EasyDataState = edsEdit) then
    AAllow := False;
end;

end.
