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
//    数据库管理工具
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyDBTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untEasyPlateDBBaseForm;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyDBTool = class(TfrmEasyPlateDBBaseForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEasyDBTool: TfrmEasyDBTool;

implementation

{$R *.dfm}

//引出函数实现
function ShowBplForm(AParamList: TStrings): TForm;
begin
  frmEasyDBTool := TfrmEasyDBTool.Create(Application);
  if frmEasyDBTool.FormStyle <> fsMDIChild then
    frmEasyDBTool.FormStyle := fsMDIChild;
  if frmEasyDBTool.WindowState <> wsMaximized then
    frmEasyDBTool.WindowState := wsMaximized;
  Result := frmEasyDBTool;
end;

end.
