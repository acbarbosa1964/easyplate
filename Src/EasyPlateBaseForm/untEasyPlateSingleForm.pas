unit untEasyPlateSingleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBForm, DB, DBClient, ImgList, untEasyToolBar,
  untEasyToolBarStylers;

type
  TEasyPlateSingleForm = class(TfrmEasyPlateDBForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EasyPlateSingleForm: TEasyPlateSingleForm;

implementation

{$R *.dfm}

end.
