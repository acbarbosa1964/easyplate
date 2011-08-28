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
//    公司信息设置
//主要实现：
//    公司信息设置
//-----------------------------------------------------------------------------}
unit untEasyCompanySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBFormExt, atScript, atScripter, ActnList, ImgList,
  untEasyToolBar, untEasyToolBarStylers, ExtCtrls, untEasyGroupBox;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyCompanySet = class(TfrmEasyPlateDBFormExt)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyCompanySet: TfrmEasyCompanySet;

implementation

{$R *.dfm}

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyCompanySet := TfrmEasyCompanySet.Create(Application);
  if frmEasyCompanySet.FormStyle <> fsMDIChild then
    frmEasyCompanySet.FormStyle := fsMDIChild;
  if frmEasyCompanySet.WindowState <> wsMaximized then
    frmEasyCompanySet.WindowState := wsMaximized;
  Result := frmEasyCompanySet;
end;

end.
