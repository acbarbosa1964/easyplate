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
unit untTvDirectoryOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, untEasyEdit, untEasySpinEdit, untEasyEditExt,
  untEasyGroupBox, untEasyButtons, untEasyPlateManager, untEasyLabel,
  unEasyComboBox, ImgList;

type
  TfrmTvDirectoryOper = class(TForm)
    edtEName: TEasyLabelEdit;
    edtCName: TEasyLabelEdit;
    speOrder: TEasySpinEdit;
    edtImage1: TEasyButtonEdit;
    edtImage2: TEasyButtonEdit;
    rbDirectory: TEasyRadioButton;
    rbModules: TEasyRadioButton;
    edtFileName: TEasyFileNameEdit;
    btnSave: TEasyBitButton;
    btnCancel: TEasyBitButton;
    speFlag: TEasySpinEdit;
    lblParentNode: TEasyLabel;
    ImageList1: TImageList;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtImage1ButtonClick(Sender: TObject);
    procedure edtImage2ButtonClick(Sender: TObject);
    procedure rbDirectoryClick(Sender: TObject);
    procedure rbModulesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FAData: PEasytvDirectoryRecord;
    function CheckNotNullControl: Boolean;
  public
    { Public declarations }
  end;

var
  frmTvDirectoryOper: TfrmTvDirectoryOper;

  procedure ShowfrmTvDirectoryOper(var AData: PEasytvDirectoryRecord; AFlag: string;
                                  ParentCName: string = '');

implementation

uses untImagesSelect;

{$R *.dfm}

procedure ShowfrmTvDirectoryOper(var AData: PEasytvDirectoryRecord; AFlag: string;
                                  ParentCName: string = '');
begin
  try
    frmTvDirectoryOper := TfrmTvDirectoryOper.Create(Application);
    frmTvDirectoryOper.lblParentNode.Caption := '';
    if AFlag = 'Add' then
    begin
      frmTvDirectoryOper.Caption := frmTvDirectoryOper.Caption + '-[新增]';
      if ParentCName <> '' then
        frmTvDirectoryOper.lblParentNode.Caption := '上级节点: 【' + ParentCName +'】';
    end
    else if AFlag = 'Edit' then
    begin
      frmTvDirectoryOper.Caption := frmTvDirectoryOper.Caption + '-[编辑]';
      with frmTvDirectoryOper do
      begin
        edtEName.Text := AData^.sEName;
        edtCName.Text := AData^.sCName;
        speOrder.Value := AData^.iOrder;
        edtImage1.Text := IntToStr(AData^.iImage1);
        edtImage2.Text := IntToStr(AData^.iImage2);
        if AData^.bDir = 0 then
          rbDirectory.Checked
        else
        if AData^.bDir = 1 then
        begin
          rbModules.Checked;
          edtFileName.Text := AData^.sPluginFileName;
        end;
        speFlag.Value := AData^.iFlag;
      end;
    end;
    //引出交换数据
    frmTvDirectoryOper.FAData := AData;
    frmTvDirectoryOper.ShowModal;
  finally
    FreeAndNil(frmTvDirectoryOper);
  end;
end;
  
procedure TfrmTvDirectoryOper.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTvDirectoryOper.btnSaveClick(Sender: TObject);
begin
  if CheckNotNullControl then Exit;
  FAData^.sEName := Trim(edtEName.Text);
  FAData^.sCName := Trim(edtCName.Text);
  FAData^.iOrder := StrToInt(speOrder.Text);
  FAData^.iImage1 := StrToInt(edtImage1.Text);
  FAData^.iImage2 := StrToInt(edtImage2.Text);
  if rbDirectory.Checked then
    FAData^.bDir := 0
  else
    FAData^.bDir := 1;
  FAData^.iFlag := StrToInt(speFlag.Text);
  if not rbDirectory.Checked then
    FAData^.sPluginFileName := ExtractFileName(edtFileName.Text);
  Close;
end;

procedure TfrmTvDirectoryOper.FormCreate(Sender: TObject);
begin
  edtImage1.Text := '-1';
  edtImage2.Text := '-1';
end;

procedure TfrmTvDirectoryOper.edtImage1ButtonClick(Sender: TObject);
var
  APt: TPoint;
begin
  APt.X := edtImage1.Left;
  APt.Y := edtImage1.Top + edtImage1.Height;
  APt := ClientToScreen(APt);
  frmImagesSelect := TfrmImagesSelect.Create(frmTvDirectoryOper);
  with frmImagesSelect do
  begin
    frmImagesSelect.Top :=  APt.Y;
    frmImagesSelect.Left := APt.X;
  end;
  frmImagesSelect.Width := edtImage1.Width;
  frmImagesSelect.FControlFlag := 1;
  frmImagesSelect.Show;
end;

procedure TfrmTvDirectoryOper.edtImage2ButtonClick(Sender: TObject);
var
  APt: TPoint;
begin
  APt.X := edtImage2.Left;
  APt.Y := edtImage2.Top + edtImage2.Height;
  APt := ClientToScreen(APt);
  frmImagesSelect := TfrmImagesSelect.Create(frmTvDirectoryOper);
  with frmImagesSelect do
  begin
    frmImagesSelect.Top :=  APt.Y;
    frmImagesSelect.Left := APt.X;
  end;
  frmImagesSelect.Width := edtImage2.Width;
  frmImagesSelect.FControlFlag := 2;
  frmImagesSelect.Show;
end;

procedure TfrmTvDirectoryOper.rbDirectoryClick(Sender: TObject);
begin
  if rbDirectory.Checked then
    edtFileName.Enabled := False
  else
    edtFileName.Enabled := True
end;

procedure TfrmTvDirectoryOper.rbModulesClick(Sender: TObject);
begin
  if rbModules.Checked then
    edtFileName.Enabled := True
  else
    edtFileName.Enabled := False;
end;

function TfrmTvDirectoryOper.CheckNotNullControl: Boolean;
begin
  Result := False;
  if Trim(edtCName.Text) = '' then
  begin
    Application.MessageBox('模块中文名称不能为空!', '提示', MB_OK +
      MB_ICONWARNING);
    Result := True;
    Exit;  
  end;  
  if Trim(edtEName.Text) = '' then
  begin
    Application.MessageBox('模块英文名称不能为空!', '提示', MB_OK + 
      MB_ICONWARNING);
    Result := True;
    Exit;  
  end;  
  if Trim(speOrder.Text) = '' then
  begin
    Application.MessageBox('模块序号不能为空!', '提示', MB_OK + 
      MB_ICONWARNING);
    Result := True;
    Exit;  
  end;
  if not rbDirectory.Checked then
  begin
    if Trim(edtFileName.Text) = '' then
    begin
      Application.MessageBox('模块文件不能为空!', '提示', MB_OK +
        MB_ICONWARNING);
      Result := True;
      Exit;
    end;
  end;
  if Trim(speFlag.Text) = '' then
  begin
    Application.MessageBox('模块标志不能为空!', '提示', MB_OK + 
      MB_ICONWARNING);
    Result := True;
    Exit;  
  end;  
end;

procedure TfrmTvDirectoryOper.FormShow(Sender: TObject);
begin
  edtCName.EditLabel.Font.Color  := clBlue;
  speOrder.EditLabel.Font.Color  := clBlue;
  edtFileName.EditLabel.Font.Color  := clBlue;
  speFlag.EditLabel.Font.Color  := clBlue;
  edtEName.EditLabel.Font.Color  := clBlue;

  edtEName.EditLabel.Transparent := True;
  edtCName.EditLabel.Transparent := True;
  speFlag.EditLabel.Transparent := True;
  speOrder.EditLabel.Transparent := True;
  edtFileName.EditLabel.Transparent := True;
  //默认选中目录 置文件选择框不可用
  edtFileName.Enabled := False;
end;

end.
