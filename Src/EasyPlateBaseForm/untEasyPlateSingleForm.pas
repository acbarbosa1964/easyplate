unit untEasyPlateSingleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBForm, DB, DBClient, ImgList, untEasyToolBar,
  untEasyToolBarStylers, untEasyPageControl, ExtCtrls, untEasyGroupBox;

type
  TEasyPlateSingleForm = class(TfrmEasyPlateDBForm)
    Splitter1: TSplitter;
    pnlClient: TEasyPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
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
//  MainGrid := grdSingleMain;
end;

procedure TEasyPlateSingleForm.btnSaveClick(Sender: TObject);
begin
  inherited  DoSave(Sender); 
end;

end.
