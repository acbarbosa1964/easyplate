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
unit untEasySysCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm, untEasyToolBar, untEasyToolBarStylers,
  DB, ImgList, DBClient, ActnList, Grids, untEasyBaseGrid, untEasyGrid,
  untEasyDBGrid;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyReportCenter = class(TfrmEasyPlateDBBaseForm)
    edpMain: TEasyDockPanel;
    tlbMain: TEasyToolBar;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton1: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarSeparator1: TEasyToolBarSeparator;
    EasyToolBarSeparator2: TEasyToolBarSeparator;
    EasyToolBarButton9: TEasyToolBarButton;
    EasyToolBarButton11: TEasyToolBarButton;
    EasyToolBarButton15: TEasyToolBarButton;
    EasyToolBarButton7: TEasyToolBarButton;
    EasyToolBarButton4: TEasyToolBarButton;
    EasyDBGrid1: TEasyDBGrid;
    actDataList: TActionList;
    actNewMst: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actRedo: TAction;
    actUndo: TAction;
    actFind: TAction;
    actPrint: TAction;
    actExit: TAction;
    actAddDtl: TAction;
    actEditDtl: TAction;
    actDeleteDtl: TAction;
    actCopyDtl: TAction;
    actRedoDtl: TAction;
    actUndoDtl: TAction;
    actSave: TAction;
    actRefresh: TAction;
    cdsSysConstMain: TClientDataSet;
    imgToolBar: TImageList;
    dsSysConstMain: TDataSource;
    tbosMain: TEasyToolBarOfficeStyler;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyReportCenter: TfrmEasyReportCenter;

implementation

{$R *.dfm}

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyReportCenter := TfrmEasyReportCenter.Create(Application);
  if frmEasyReportCenter.FormStyle <> fsMDIChild then
    frmEasyReportCenter.FormStyle := fsMDIChild;
  if frmEasyReportCenter.WindowState <> wsMaximized then
    frmEasyReportCenter.WindowState := wsMaximized;
  Result := frmEasyReportCenter;
end;

end.
