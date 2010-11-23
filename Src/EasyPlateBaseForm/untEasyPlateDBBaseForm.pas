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
  Dialogs, DB, ADODB, ExtCtrls, untEasyGroupBox, untEasyWaterImage,
  untEasyPlateBaseForm, untEasyDBDevExt;

type
  TfrmEasyPlateDBBaseForm = class(TfrmEasyPlateBaseForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEasyDBConn: TADOConnection;
    function GetUtilADOConn: TADOConnection;
    procedure SetUtilADOConn(const Value: TADOConnection);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //发布ADO数据连接
    property EasyUtilADOConn: TADOConnection read GetUtilADOConn write SetUtilADOConn;
  end;

var
  frmEasyPlateDBBaseForm: TfrmEasyPlateDBBaseForm;

implementation

{$R *.dfm}

uses untEasyDBConnection;

constructor TfrmEasyPlateDBBaseForm.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmEasyPlateDBBaseForm.Destroy;
begin

  inherited;
end;

procedure TfrmEasyPlateDBBaseForm.FormCreate(Sender: TObject);
var
  I       : Integer;
begin
  inherited;
  FEasyDBConn := DMEasyDBConnection.EasyADOConn;
  for i := 0 to ComponentCount - 1 do
  begin
    if Self.Components[i] is TEasyDevDBTextEdit then
    begin
       (Components[i] as TEasyDevDBTextEdit).ImeName := '';
       (Components[i] as TEasyDevDBTextEdit).ImeMode := imDontCare
    end
    else if Components[i] is TEasyDevDBMemo then
    begin
       (Components[i] as TEasyDevDBMemo).ImeName := '';
       (Components[i] as TEasyDevDBMemo).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBDateEdit then
    begin
       (Components[i] as TEasyDevDBDateEdit).ImeName := '';
       (Components[i] as TEasyDevDBDateEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBTimeEdit then
    begin
       (Components[i] as TEasyDevDBTimeEdit).ImeName := '';
       (Components[i] as TEasyDevDBTimeEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBButtonEdit then
    begin
       (Components[i] as TEasyDevDBButtonEdit).ImeName := '';
       (Components[i] as TEasyDevDBButtonEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBImageComboBox then
    begin
       (Components[i] as TEasyDevDBImageComboBox).ImeName := '';
       (Components[i] as TEasyDevDBImageComboBox).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBLookupComboBox then
    begin
       (Components[i] as TEasyDevDBLookupComboBox).ImeName := '';
       (Components[i] as TEasyDevDBLookupComboBox).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBSpinEdit then
    begin
       (Components[i] as TEasyDevDBSpinEdit).ImeName := '';
       (Components[i] as TEasyDevDBSpinEdit).ImeMode := imDontCare;
    end
    else if Components[i] is TEasyDevDBCalcEdit then
    begin
       (Components[i] as TEasyDevDBCalcEdit).ImeName := '';
       (Components[i] as TEasyDevDBCalcEdit).ImeMode := imDontCare;
    end;
  end; 
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
