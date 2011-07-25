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
//    报表中心
//主要实现：
//    报表的增加、设计等
//    系统的所有报表均在此管理
//-----------------------------------------------------------------------------}
unit untEasySysDataList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, untEasyToolBar, untEasyToolBarStylers,
  ExtCtrls, untEasyGroupBox, ComCtrls, DB, DBClient,
  Grids, untEasyBaseGrid, untEasyGrid, untEasyDBGrid, untEasyUtilConst,
  untEasyTreeView, ImgList;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasySysDataList = class(TfrmEasyPlateDBBaseForm)
    edpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    tbosMain: TEasyToolBarOfficeStyler;
    EasyPanel1: TEasyPanel;
    EasyPanel2: TEasyPanel;
    EasyPanel3: TEasyPanel;
    Splitter1: TSplitter;
    cdsDataListMain: TClientDataSet;
    dsDataListMain: TDataSource;
    EasyDBGrid1: TEasyDBGrid;
    tvDataListMain: TEasyTreeView;
    imgDataList: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvDataListMainChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
    FSysDataListList: TList;
    procedure InitDataSet;
    procedure InitSysDataListTreeView;
  public
    { Public declarations }
  end;

var
  frmEasySysDataList: TfrmEasySysDataList;

implementation

{$R *.dfm}

uses
  untEasyClassSysDataList;

var
  SysDataListRoot : string = '{00000000-0000-0000-0000-000000000000}';
//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasySysDataList := TfrmEasySysDataList.Create(Application);
  if frmEasySysDataList.FormStyle <> fsMDIChild then
    frmEasySysDataList.FormStyle := fsMDIChild;
  if frmEasySysDataList.WindowState <> wsMaximized then
    frmEasySysDataList.WindowState := wsMaximized;
  Result := frmEasySysDataList;
end;

{ TfrmEasySysDataList }

procedure TfrmEasySysDataList.InitDataSet;
var
  ASysDataList: string;
begin
  ASysDataList := ' Exec sp_SysDataList ';
  cdsDataListMain.Data := EasyRDMDisp.EasyGetRDMData(ASysDataList);
end;

procedure TfrmEasySysDataList.FormShow(Sender: TObject);
var
  AOle: OleVariant;
begin
  inherited;
  //初始化数据
  InitDataSet;
  AOle := cdsDataListMain.Data;
  TEasySysDataList.GenerateSysDataList(AOle, FSysDataListList);
  //初始化树
  InitSysDataListTreeView;
end;

procedure TfrmEasySysDataList.FormCreate(Sender: TObject);
begin
  inherited;
  FSysDataListList := TList.Create;
end;

procedure TfrmEasySysDataList.FormDestroy(Sender: TObject);
begin
  while (FSysDataListList.Count > 0) do
  begin
    TEasySysDataList(FSysDataListList[0]).Free;
    FSysDataListList.Delete(0);
  end;
  FSysDataListList.Free;
  inherited;
end;

procedure TfrmEasySysDataList.InitSysDataListTreeView;
var
  I: Integer;
  ATreeNode: TTreeNode;
begin
  for I := 0 to FSysDataListList.Count - 1 do
  begin
    if TEasySysDataList(FSysDataListList[I]).ParentDataListGUID = SysDataListRoot then
    begin
      ATreeNode := tvDataListMain.Items.AddChild(nil,
                 IntToStr(I + 1) + '、' + TEasySysDataList(FSysDataListList[I]).SysDataName);
      ATreeNode.Data := FSysDataListList[I];

      ATreeNode.ImageIndex := 2;
      ATreeNode.SelectedIndex := 1;
//      ATreeNode.StateIndex := 2;
    end;
  end;  
end;

procedure TfrmEasySysDataList.tvDataListMainChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  with cdsDataListMain do
  begin
    Filtered := False;
    Filter := 'ParentDataListGUID = ' + QuotedStr(TEasySysDataList(Node.Data).DataListGUID);
    Filtered := True;
  end;
  EasyDBGrid1.AutoNumberCol(0);
end;

end.
