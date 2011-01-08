{ *************************************************************************** }
{                                                                             }
{ EControl Syntax Editor (MDI Application)                                    }
{                                                                             }
{ Copyright (c) 2004 - 2006 EControl Ltd., Zaharov Michael                    }
{     www.econtrol.ru                                                         }
{     support@econtrol.ru                                                     }
{                                                                             }
{ *************************************************************************** }
unit untEasySyncEditMainChildFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmEasySyncEditMainMDIChild = class(TForm)
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; Frame: TCustomFrame);
  end;

var
  frmEasySyncEditMainMDIChild: TfrmEasySyncEditMainMDIChild;

implementation

{$R *.dfm}

uses main, editFrm;

{ TMDIChild }

constructor TfrmEasySyncEditMainMDIChild.Create(AOwner: TComponent; Frame: TCustomFrame);
begin
  inherited Create(AOwner);
  Frame.Parent := Self;
end;

procedure TfrmEasySyncEditMainMDIChild.FormActivate(Sender: TObject);
begin
  SyntEditMain.CurrentFrame := TEditorFrame(Controls[0]);
end;

procedure TfrmEasySyncEditMainMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
