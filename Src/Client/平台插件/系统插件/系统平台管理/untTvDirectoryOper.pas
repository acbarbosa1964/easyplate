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
  private
    { Private declarations }
    FAData: PEasytvDirectoryRecord;
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
          rbModules.Checked;
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

end.
