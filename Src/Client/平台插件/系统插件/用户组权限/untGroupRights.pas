unit untGroupRights;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, ExtCtrls, untEasyGroupBox,
  untEasyToolBar, untEasyToolBarStylers, ComCtrls, untEasyTreeView, ImgList;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmGroupRights = class(TfrmEasyPlateDBBaseForm)
    EasyPanel1: TEasyPanel;
    EasyPanel3: TEasyPanel;
    EasyPanel4: TEasyPanel;
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    Splitter1: TSplitter;
    EasyPanel2: TEasyPanel;
    EasyPanel5: TEasyPanel;
    Splitter2: TSplitter;
    EasyPanel6: TEasyPanel;
    tvUserGroups: TEasyTreeView;
    tvUsers: TEasyTreeView;
    tvModules: TEasyTreeView;
    EasyToolBarButton1: TEasyToolBarButton;
    imgUserGroup: TImageList;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarButton4: TEasyToolBarButton;
    EasyToolBarButton5: TEasyToolBarButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupRights: TfrmGroupRights;

implementation

{$R *.dfm}

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmGroupRights := TfrmGroupRights.Create(Application);
  if frmGroupRights.FormStyle <> fsMDIChild then
    frmGroupRights.FormStyle := fsMDIChild;
  if frmGroupRights.WindowState <> wsMaximized then
    frmGroupRights.WindowState := wsMaximized;
  frmGroupRights.FormId := '{3477B007-80AE-414E-BF67-9709FEEB3DD8}';
  Result := frmGroupRights;
end;

end.
