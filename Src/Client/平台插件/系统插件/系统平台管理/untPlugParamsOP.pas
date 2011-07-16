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
//------------------------------------------------------------------------------}
unit untPlugParamsOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyEdit, untEasyButtons, untEasyPlateManager,
  untEasyClassPluginDirectory;

type
  TfrmPlugParamsOP = class(TForm)
    edtCName: TEasyLabelEdit;
    edtParam: TEasyLabelEdit;
    btnOK: TEasyBitButton;
    btnCancel: TEasyBitButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FAData: TEasysysPluginParam;
  public
    { Public declarations }
  end;

var
  frmPlugParamsOP: TfrmPlugParamsOP;

  procedure ShowfrmPlugParamsOP(var AData: TEasysysPluginParam; AFlag: string);

implementation

{$R *.dfm}

uses
  untEasyUtilMethod;

procedure ShowfrmPlugParamsOP(var AData: TEasysysPluginParam; AFlag: string);
begin
  try
    frmPlugParamsOP := TfrmPlugParamsOP.Create(Application);
    if AFlag = 'Add' then
    begin
      frmPlugParamsOP.FAData := AData;
      frmPlugParamsOP.Caption := frmPlugParamsOP.Caption + '-【新增】';
    end
    else
    if AFlag = 'Edit' then
    begin
      with frmPlugParamsOP do
      begin
        Caption := frmPlugParamsOP.Caption + '-【编辑】';
        edtCName.Text := AData.ParamName;
        edtParam.Text := AData.Value;
      end;
      frmPlugParamsOP.FAData := AData;
    end;
    frmPlugParamsOP.ShowModal;
  finally
    FreeAndNil(frmPlugParamsOP);
  end;  
end;

procedure TfrmPlugParamsOP.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlugParamsOP.btnOKClick(Sender: TObject);
begin
  if Trim(edtCName.Text) = '' then
  begin
    Application.MessageBox('参数名称不能为空!', '提示', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
  if Trim(edtParam.Text) = '' then
  begin
    Application.MessageBox('参数值不能为空!', '提示', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
  FAData.ParamName := Trim(edtCName.Text);
  FAData.ValueType := 'S';
  FAData.Value := Trim(edtParam.Text);
  Close;
end;

end.
