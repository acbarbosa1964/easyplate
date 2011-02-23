unit untQueryDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DBClient, DB, ADODB, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses untEasySelectDialog;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmEasySelectDialog := TfrmEasySelectDialog.Create(Application);
  with frmEasySelectDialog do
  begin
    AClientDataSet.Data := ClientDataSet1.Data;
    MultiSelect := True;
    GridFields.Add('ID');
    GridFieldsCaption.Add('ID');
    GridFieldsWidth.Add('0');

    GridFields.Add('AccountID');
    GridFieldsCaption.Add('AccountID');
    GridFieldsWidth.Add('0');

    GridFields.Add('Name');
    GridFieldsCaption.Add('Name');
    GridFieldsWidth.Add('0');

//    OleDBData := ClientDataSet1.Data;
  end;
  frmEasySelectDialog.ShowModal;
  frmEasySelectDialog.Free;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOConnection1.Close;
end;

end.
