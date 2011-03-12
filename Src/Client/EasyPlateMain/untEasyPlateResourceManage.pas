{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7
//                         一轩软研第三方开发包                         
//                         @Copyright 2010 hehf                      
//                   ------------------------------------                       
//                                                                              
//           本开发包是公司内部使用,作为开发工具使用任何,何海锋个人负责开发,任何
//       人不得外泄,否则后果自负.        
//
//            使用权限以及相关解释请联系何海锋  
//                
//                                                               
//            网站地址：http://www.YiXuan-SoftWare.com                                  
//            电子邮件：hehaifeng1984@126.com 
//                      YiXuan-SoftWare@hotmail.com    
//            QQ      ：383530895
//            MSN     ：YiXuan-SoftWare@hotmail.com                                   
//------------------------------------------------------------------------------
//单元说明：
//    系统工作平台的资源管理
//主要实现：
      主要生成各模块的权限资源、和多语言文件
//-----------------------------------------------------------------------------}
unit untEasyPlateResourceManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateBaseForm, TypInfo, DB, DBClient, ImgList,
  untEasyToolBar, untEasyToolBarStylers, untEasyPageControl, ExtCtrls,
  untEasyGroupBox, StdCtrls, untEasyMemo, ComCtrls, untEasyTreeView, Menus,
  untEasyMenus, untEasyMenuStylers;

type
  TScreenForm = class
  private
    FGUID,
    FFormName: string;
    FCaption : string;
    FFormIndex: Integer;
    FFormCaption: string;
    function GetFormIndex: Integer;
    function GetFormName: string;
    function GetGUID: string;
    procedure SetFormIndex(const Value: Integer);
    procedure SetFormName(const Value: string);
    procedure SetGUID(const Value: string);
    procedure SetFormCaption(const Value: string);
    function GetFormCaption: string;
  public
    property GUID: string read GetGUID write SetGUID;
    property FormCaption: string read GetFormCaption write SetFormCaption;
    property FormName: string read GetFormName write SetFormName;
    property FormIndex: Integer read GetFormIndex write SetFormIndex;
  end;

  TfrmEasyPlateResourceManage = class(TfrmEasyPlateBaseForm)
    dkpDBForm: TEasyDockPanel;
    tlbDBForm: TEasyToolBar;
    btnLang: TEasyToolBarButton;
    btnResource: TEasyToolBarButton;
    btnExit: TEasyToolBarButton;
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
    EasyPopupMenu1: TEasyPopupMenu;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    pmShowHint: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pmShowHintClick(Sender: TObject);
    procedure btnLangClick(Sender: TObject);
    procedure btnResourceClick(Sender: TObject);
  private
    { Private declarations }
    FScreenFormList: TList;
    procedure InitTvResManage;
    procedure ShowFormCompsInfo_Lang(AForm: TForm);
    procedure ShowFormCompsInfo_Res(AForm: TForm);
    function FindResForm(ACaption: string): TForm;
  public
    { Public declarations }
  end;

var
  frmEasyPlateResourceManage: TfrmEasyPlateResourceManage;

implementation

{$R *.dfm}

uses
  untEasyUtilMethod;

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
      FormCaption := TfrmEasyPlateBaseForm(Screen.Forms[I]).Caption;

      ATmpTreeNode := tvResManage.Items.AddChild(nil, FormCaption);
      ATmpTreeNode.Data := AScreenForm;
    end;
  end;
end;

{ TScreenForm }

function TScreenForm.GetFormCaption: string;
begin
  Result := FFormCaption;
end;

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

procedure TScreenForm.SetFormCaption(const Value: string);
begin
  FFormCaption := Value;
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

procedure TfrmEasyPlateResourceManage.ShowFormCompsInfo_Lang(AForm: TForm);
var
  I: Integer;
begin
  if AForm = nil then Exit;
  mmResult.Lines.Clear;
  mmResult.Lines.Add(TfrmEasyPlateBaseForm(AForm).Name +
                     TfrmEasyPlateBaseForm(AForm).FormId);
  for I := 0 to AForm.ComponentCount - 1 do
  begin
    if GetPropInfo(AForm.Components[I], 'Caption') <> nil then
      mmResult.Lines.Add(AForm.Components[I].Name +'.Caption='+
                         GetPropValue(AForm.Components[I], 'Caption'))
    else
    if GetPropInfo(AForm.Components[I], 'Text') <> nil then
      mmResult.Lines.Add(AForm.Components[I].Name +'.Text='+
                          GetPropValue(AForm.Components[I], 'Text'));
    if pmShowHint.Checked then
    begin
      if GetPropInfo(AForm.Components[I], 'Hint') <> nil then
        mmResult.Lines.Add(AForm.Components[I].Name +'.Hint='+
                            GetPropValue(AForm.Components[I], 'Hint'));
    end;
  end;
end;

procedure TfrmEasyPlateResourceManage.ShowFormCompsInfo_Res(AForm: TForm);
var
  I       : Integer;
  ATmpGUID,
  ARootSQL,
  ASQL    : string;
begin
  if AForm = nil then Exit;
  mmResult.Lines.Clear;
  ATmpGUID := TfrmEasyPlateBaseForm(AForm).FormId;
  mmResult.Lines.Add(TfrmEasyPlateBaseForm(AForm).Name + ATmpGUID);
  ASQL := ' INSERT INTO sysResource([GUID], ResourceGUID, sResourceID, sResourceName,'
          + 'sParentResourceGUID, iOrder) VALUES (';
  ARootSQL := ASQL + QuotedStr(GenerateGUID) + ',' + QuotedStr(GenerateGUID) + ','
              + QuotedStr(ATmpGUID) + ','
              + QuotedStr(AForm.Caption) + ','
              + QuotedStr('{00000000-0000-0000-0000-000000000003}') + ', 0);';
  mmResult.Lines.Add(ARootSQL);
  for I := 0 to AForm.ComponentCount - 1 do
  begin
    if (AForm.Components[I] is TEasyToolBarButton) then
    begin
      ASQL := ' INSERT INTO sysResource ([GUID], ResourceGUID, sResourceID, sResourceName,'
          + 'sParentResourceGUID, iOrder) VALUES (';
      ASQL := ASQL + QuotedStr(GenerateGUID) + ',';
      ASQL := ASQL + QuotedStr(GenerateGUID) + ',';
      ASQL := ASQL + QuotedStr(AForm.Components[I].Name) + ',';
//      if GetPropInfo(AForm.Components[I], 'Caption') <> nil then
      ASQL := ASQL + QuotedStr(GetPropValue(AForm.Components[I], 'Caption')) + ',';
//      else
//      if GetPropInfo(AForm.Components[I], 'Text') <> nil then
//        ASQL := ASQL + QuotedStr(GetPropValue(AForm.Components[I], 'Text')) + ','
//      else
      ASQL := ASQL + QuotedStr(ATmpGUID) + ', 0);';
      mmResult.Lines.Add(ASQL);
    end;
  end;
end;

procedure TfrmEasyPlateResourceManage.FormShow(Sender: TObject);
begin
  inherited;
  InitTvResManage;
  pmShowHint.Checked := True;
end;

function TfrmEasyPlateResourceManage.FindResForm(ACaption: string): TForm;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I].Caption = ACaption then
    begin
      Result := Screen.Forms[I];
      Break;
    end;  
  end;
end;

procedure TfrmEasyPlateResourceManage.pmShowHintClick(Sender: TObject);
begin
  inherited;
  pmShowHint.Checked := not pmShowHint.Checked;
end;

procedure TfrmEasyPlateResourceManage.btnLangClick(Sender: TObject);
begin
  inherited;
  if tvResManage.Selected <> nil then
    ShowFormCompsInfo_Lang(FindResForm(TScreenForm(tvResManage.Selected.Data).FormCaption));
end;

procedure TfrmEasyPlateResourceManage.btnResourceClick(Sender: TObject);
begin
  inherited;
  if tvResManage.Selected <> nil then
    ShowFormCompsInfo_Res(FindResForm(TScreenForm(tvResManage.Selected.Data).FormCaption));
end;

end.
