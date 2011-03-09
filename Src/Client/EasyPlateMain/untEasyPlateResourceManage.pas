unit untEasyPlateResourceManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateBaseForm, TypInfo, DB, DBClient, ImgList,
  untEasyToolBar, untEasyToolBarStylers, untEasyPageControl, ExtCtrls,
  untEasyGroupBox, StdCtrls, untEasyMemo, ComCtrls, untEasyTreeView;

type
  TScreenForm = class
  private
    FGUID,
    FFormName: string;
    FFormIndex: Integer;
    function GetFormIndex: Integer;
    function GetFormName: string;
    function GetGUID: string;
    procedure SetFormIndex(const Value: Integer);
    procedure SetFormName(const Value: string);
    procedure SetGUID(const Value: string);
  public
    property GUID: string read GetGUID write SetGUID;
    property FormName: string read GetFormName write SetFormName;
    property FormIndex: Integer read GetFormIndex write SetFormIndex;
  end;

  TfrmEasyPlateResourceManage = class(TfrmEasyPlateBaseForm)
    dkpDBForm: TEasyDockPanel;
    tlbDBForm: TEasyToolBar;
    btnNew: TEasyToolBarButton;
    btnEdit: TEasyToolBarButton;
    btnCancel: TEasyToolBarButton;
    btnDelete: TEasyToolBarButton;
    btnCopy: TEasyToolBarButton;
    btnFind: TEasyToolBarButton;
    btnPrint: TEasyToolBarButton;
    btnExit: TEasyToolBarButton;
    btnRefresh: TEasyToolBarButton;
    btnSave: TEasyToolBarButton;
    pnlContainer: TEasyPanel;
    tlbStyDBForm: TEasyToolBarOfficeStyler;
    imgTlbDBForm: TImageList;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    EasyPanel1: TEasyPanel;
    Splitter1: TSplitter;
    EasyPanel2: TEasyPanel;
    tvResManage: TEasyTreeView;
    mmResult: TEasyMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvResManageClick(Sender: TObject);
  private
    { Private declarations }
    FScreenFormList: TList;
    procedure InitTvResManage;
    procedure ShowFormCompsInfo_Lang(AFormIndex: Integer);
    procedure ShowFormCompsInfo_Res(AFormIndex: Integer);
  public
    { Public declarations }
  end;

var
  frmEasyPlateResourceManage: TfrmEasyPlateResourceManage;

implementation

{$R *.dfm}

procedure TfrmEasyPlateResourceManage.FormCreate(Sender: TObject);
begin
  inherited;
  FormId := '{BF3F23E6-A928-4F85-8805-437FF90211A7}';
  FScreenFormList := TList.Create;
end;

procedure TfrmEasyPlateResourceManage.btnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEasyPlateResourceManage.InitTvResManage;
var
  I: Integer;
  AScreenForm: TScreenForm;
  ATmpTreeNode: TTreeNode;
begin
  for I := 0 to Screen.FormCount - 1 do
  begin
    AScreenForm := TScreenForm.Create;
    with AScreenForm do
    begin
      GUID := TfrmEasyPlateBaseForm(Screen.Forms[I]).FormId;
      FormName := TfrmEasyPlateBaseForm(Screen.Forms[I]).Name;
      FormIndex := I;

      ATmpTreeNode := tvResManage.Items.AddChild(nil, FormName);
      ATmpTreeNode.Data := AScreenForm;
    end;
  end;                                 
end;

{ TScreenForm }

function TScreenForm.GetFormIndex: Integer;
begin
  Result := FFormIndex;
end;

function TScreenForm.GetFormName: string;
begin
  Result := FFormName;
end;

function TScreenForm.GetGUID: string;
begin
  Result := FGUID;
end;

procedure TScreenForm.SetFormIndex(const Value: Integer);
begin
  FFormIndex := Value;
end;

procedure TScreenForm.SetFormName(const Value: string);
begin
  FFormName := Value;
end;

procedure TScreenForm.SetGUID(const Value: string);
begin
  FGUID := Value;
end;

procedure TfrmEasyPlateResourceManage.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to FScreenFormList.Count - 1 do
  begin
    TScreenForm(FScreenFormList.Items[I]).Free;
  end;
  FScreenFormList.Clear;
  inherited;
end;

procedure TfrmEasyPlateResourceManage.ShowFormCompsInfo_Lang(AFormIndex: Integer);
var
  I: Integer;
begin
  mmResult.Lines.Clear;
  mmResult.Lines.Add(TfrmEasyPlateBaseForm(Screen.Forms[AFormIndex]).Name +
                     TfrmEasyPlateBaseForm(Screen.Forms[AFormIndex]).FormId);
  for I := 0 to Screen.Forms[AFormIndex].ComponentCount - 1 do
  begin
    if GetPropInfo(Screen.Forms[AFormIndex].Components[I], 'Caption') <> nil then
      mmResult.Lines.Add(Screen.Forms[AFormIndex].Components[I].Name +'.Caption='+
                         GetPropValue(Screen.Forms[AFormIndex].Components[I], 'Caption'))
    else
    if GetPropInfo(Screen.Forms[AFormIndex].Components[I], 'Text') <> nil then
      mmResult.Lines.Add(Screen.Forms[AFormIndex].Components[I].Name +'.Text='+
                          GetPropValue(Screen.Forms[AFormIndex].Components[I], 'Text'));
    if GetPropInfo(Screen.Forms[AFormIndex].Components[I], 'Hint') <> nil then
      mmResult.Lines.Add(Screen.Forms[AFormIndex].Components[I].Name +'.Hint='+
                          GetPropValue(Screen.Forms[AFormIndex].Components[I], 'Hint'));
  end;
end;

procedure TfrmEasyPlateResourceManage.ShowFormCompsInfo_Res(
  AFormIndex: Integer);
begin

end;

procedure TfrmEasyPlateResourceManage.FormShow(Sender: TObject);
begin
  inherited;
  InitTvResManage;
end;

procedure TfrmEasyPlateResourceManage.tvResManageClick(Sender: TObject);
begin
  inherited;
  ShowFormCompsInfo_Lang(TScreenForm(tvResManage.Selected.Data).FormIndex);
end;

end.
