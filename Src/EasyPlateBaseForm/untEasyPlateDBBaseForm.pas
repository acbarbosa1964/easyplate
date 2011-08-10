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
//    本单元是工程数据集窗体的基本单元
//
//主要实现：
//      1、EasyUtilADOConn
//         发布数据连接：所有与数据库通信的模块均从此单元获得ADO连接
//      2、初始化指定控件的IME
//-----------------------------------------------------------------------------}
unit untEasyPlateDBBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, untEasyGroupBox, untEasyWaterImage, DBClient,
  untEasyPlateBaseForm, EasyPlateServer_TLB, untEasyClasssysUser, untEasyClasshrEmployee;

type
  TfrmEasyPlateDBBaseForm = class(TfrmEasyPlateBaseForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEasyDBConn: TADOConnection;
    function GetUtilADOConn: TADOConnection;
    procedure SetUtilADOConn(const Value: TADOConnection);
    function GetRDMEasyPlateServerDisp: IRDMEasyPlateServerDisp;
    function GetEasyCurrLoginSysUser: TEasysysUser;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //发布ADO数据连接
    property EasyUtilADOConn: TADOConnection read GetUtilADOConn write SetUtilADOConn;
    //发布远程数据服务接口
    //客户端调用服务端函数均使用此属性
    property EasyRDMDisp: IRDMEasyPlateServerDisp read GetRDMEasyPlateServerDisp;
    //当前登录用户
    property EasyCurrLoginSysUser: TEasysysUser read GetEasyCurrLoginSysUser;
  end;

var
  frmEasyPlateDBBaseForm: TfrmEasyPlateDBBaseForm;

implementation

{$R *.dfm}

uses untEasyDBConnection;

constructor TfrmEasyPlateDBBaseForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TfrmEasyPlateDBBaseForm.Destroy;
begin
  inherited;
end;

procedure TfrmEasyPlateDBBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  FEasyDBConn := DMEasyDBConnection.EasyADOConn;
end;

function TfrmEasyPlateDBBaseForm.GetEasyCurrLoginSysUser: TEasysysUser;
begin
  Result := DMEasyDBConnection.EasyCurrLoginSysUser;
end;

function TfrmEasyPlateDBBaseForm.GetRDMEasyPlateServerDisp: IRDMEasyPlateServerDisp;
begin
  //获取COM接口
  Result := DMEasyDBConnection.EasyIRDMEasyPlateServerDisp;
end;

function TfrmEasyPlateDBBaseForm.GetUtilADOConn: TADOConnection;
begin
  Result := FEasyDBConn;
end;

procedure TfrmEasyPlateDBBaseForm.SetUtilADOConn(
  const Value: TADOConnection);
begin
  FEasyDBConn := Value;
end;

end.
