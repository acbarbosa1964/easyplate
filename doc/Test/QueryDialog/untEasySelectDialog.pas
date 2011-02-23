unit untEasySelectDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, cxClasses, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, 
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, ADODB, cxBlobEdit,
  cxCheckBox, DBClient, Grids, DBGrids, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxImage, cxTextEdit, Menus, untEasyButtons,
  untEasyPageControl, untEasyGroupBox, untEasySplitter, untEasyMenus,
  untEasyMenuStylers;

type
  //选择框样式 ssSimple可附属到其它控件 ssNormal 弹出模态对话框
  TSelectStyle = (ssSimple, ssNormal);
  //选择框返回值事件 resDoubleClick又再Grid时返回值并关闭
  //resButtonClic 单击指定按钮时返回值并关闭
  TReturnEventStyle = (resDoubleClick, resButtonClick, resAllClick);
  
  TfrmEasySelectDialog = class(TForm)
    pnlTop: TPanel;
    pnlClient: TPanel;
    grdSelectMain: TcxGrid;
    grdSelectMainDBTableView1: TcxGridDBTableView;
    grdSelectMainLevel1: TcxGridLevel;
    cxGridPopupMenu1: TcxGridPopupMenu;
    EasyNetscapeSplitter1: TEasyNetscapeSplitter;
    EasyPanel1: TEasyPanel;
    EasyPageControl1: TEasyPageControl;
    EasyTabSheet1: TEasyTabSheet;
    EasyPanel2: TEasyPanel;
    btnRefresh: TEasyBitButton;
    btnCancel: TEasyBitButton;
    SaveDialogExport: TSaveDialog;
    btnOK: TEasyBitButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    EasyPopupMenu1: TEasyPopupMenu;
    EasyMenuOfficeStyler1: TEasyMenuOfficeStyler;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdSelectMainDBTableView1CustomDrawIndicatorCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);
    procedure grdSelectMainDBTableView1Editing(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    FMultiSelect     : Boolean;
    FSelectStyle     : TSelectStyle;
    FReturnEventStyle: TReturnEventStyle;
    FOleDBData       : OleVariant;       //数据集
    FGridFields,                         //Grid显示列字段
    FGridFieldsCaption,                  //Grid显示列标题
    FGridFieldsWidth : TStrings;         //Grid显示列宽度

    ADataSource      : TDataSource;
    ATmpClientDataSet: TClientDataSet;
    function GetMultiSelect: Boolean;
    procedure SetMultiSelect(const Value: Boolean);
    function GetSelectStyle: TSelectStyle;
    procedure SetSelectStyle(const Value: TSelectStyle);
    function GetReturnEventStyle: TReturnEventStyle;
    procedure SetReturnEventStyle(const Value: TReturnEventStyle);
    function GetOleDBData: OleVariant;
    procedure SetOleDBData(const Value: OleVariant);
    function GetGridFields: TStrings;
    function GetGridFieldsCaption: TStrings;
    procedure SetGridFields(const Value: TStrings);
    procedure SetGridFieldsCaption(const Value: TStrings);
    function GetGridFieldsWidth: TStrings;
    procedure SetGridFieldsWidth(const Value: TStrings); //

    //动态创建Grid列
    procedure GenerateColumns(AGridView: TcxGridDBTableView);
    procedure GenerateTmpDataSet(ASrcClientDataSet, ADestClientDataSet: TClientDataSet);
    procedure SelectedSet(ACds: TClientDataSet; AType: Integer);
  public
    { Public declarations }
    AClientDataSet   : TClientDataSet;
    property MultiSelect: Boolean read GetMultiSelect write SetMultiSelect;
    property SelectStyle: TSelectStyle read GetSelectStyle write SetSelectStyle;
    property ReturnEventStyle: TReturnEventStyle read GetReturnEventStyle write SetReturnEventStyle;
    property OleDBData: OleVariant read GetOleDBData write SetOleDBData;
    //用Assign赋值
    property GridFields: TStrings read GetGridFields write SetGridFields;
    property GridFieldsCaption: TStrings read GetGridFieldsCaption write SetGridFieldsCaption;
    property GridFieldsWidth: TStrings read GetGridFieldsWidth write SetGridFieldsWidth;
  end;

var
  frmEasySelectDialog: TfrmEasySelectDialog;

implementation

{$R *.dfm}

{ TfrmEasySelectDialog }

function TfrmEasySelectDialog.GetMultiSelect: Boolean;
begin
  Result := FMultiSelect;
end;

procedure TfrmEasySelectDialog.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
end;

procedure TfrmEasySelectDialog.FormCreate(Sender: TObject);
begin
  FMultiSelect := False;
  FSelectStyle := ssNormal;
  FReturnEventStyle := resButtonClick;

  FGridFields := TStringList.Create;
  FGridFieldsCaption := TStringList.Create;
  FGridFieldsWidth := TStringList.Create;

  AClientDataSet := TClientDataSet.Create(Self);
  ATmpClientDataSet := TClientDataSet.Create(Self);
  
  ADataSource := TDataSource.Create(Self);
end;

function TfrmEasySelectDialog.GetSelectStyle: TSelectStyle;
begin
  Result := FSelectStyle;
end;

procedure TfrmEasySelectDialog.SetSelectStyle(const Value: TSelectStyle);
begin
  FSelectStyle := Value;
end;

function TfrmEasySelectDialog.GetReturnEventStyle: TReturnEventStyle;
begin
  Result := FReturnEventStyle;
end;

procedure TfrmEasySelectDialog.SetReturnEventStyle(const Value: TReturnEventStyle);
begin
  FReturnEventStyle := Value;
end;

function TfrmEasySelectDialog.GetOleDBData: OleVariant;
begin
  Result := FOleDBData;
end;

procedure TfrmEasySelectDialog.SetOleDBData(const Value: OleVariant);
begin
  FOleDBData := Value;
end;

procedure TfrmEasySelectDialog.FormDestroy(Sender: TObject);
begin
  AClientDataSet.Free;
  ATmpClientDataSet.Free;
  ADataSource.DataSet := nil;
  ADataSource.Free;
  FGridFields.Free;
  FGridFieldsCaption.Free;
  FGridFieldsWidth.Free;
end;

function TfrmEasySelectDialog.GetGridFields: TStrings;
begin
  Result := FGridFields;
end;

function TfrmEasySelectDialog.GetGridFieldsCaption: TStrings;
begin
  Result := FGridFieldsCaption;
end;

procedure TfrmEasySelectDialog.SetGridFields(const Value: TStrings);
begin
  FGridFields := Value;
end;

procedure TfrmEasySelectDialog.SetGridFieldsCaption(const Value: TStrings);
begin
  FGridFieldsCaption := Value;
end;

function TfrmEasySelectDialog.GetGridFieldsWidth: TStrings;
begin
  Result := FGridFieldsWidth;
end;

procedure TfrmEasySelectDialog.SetGridFieldsWidth(const Value: TStrings);
begin
  FGridFieldsWidth := Value;
end;

procedure TfrmEasySelectDialog.grdSelectMainDBTableView1CustomDrawIndicatorCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);
var
  AIndicatorViewInfo: TcxGridIndicatorRowItemViewInfo;
  ATextRect         : TRect;
  ACV               : TcxCanvas;
begin
  if not (AViewInfo is TcxGridIndicatorRowItemViewInfo) then
    Exit;
    
  aCV := ACanvas;
  ATextRect := AViewInfo.ContentBounds;
  AIndicatorViewInfo := AViewInfo as TcxGridIndicatorRowItemViewInfo;
  InflateRect(ATextRect, -2, -1);

  //这个if段是为了在行号处把把选中的行号跟别的区分开，可不用
  if AIndicatorViewInfo.GridRecord.Selected then
  begin
    aCV.Font.Style := Canvas.Font.Style + [fsBold];
    aCV.Font.Color := clRed;
  end
  else
  begin
    aCV.Font.Style := Canvas.Font.Style - [fsBold];
    acv.Font.Color := Canvas.Font.Color;
  end;

  Sender.LookAndFeelPainter.DrawHeader(ACanvas, AViewInfo.ContentBounds,
    ATextRect, [], cxBordersAll, cxbsNormal, taCenter, cxClasses.vaCenter,
    False, False, IntToStr(AIndicatorViewInfo.GridRecord.Index + 1),
//    AStyle.Font, AStyle.TextColor, AStyle.Color);
  acv.Font,acv.font.Color,acv.Brush.color );
  ADone := True;
end;

procedure TfrmEasySelectDialog.grdSelectMainDBTableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  if MultiSelect then
  begin
    if grdSelectMainDBTableView1.Controller.FocusedColumnIndex <> 0 then
      AAllow := False
    else
      AAllow := True;
  end
  else
    AAllow := False;
end;

procedure TfrmEasySelectDialog.GenerateTmpDataSet(ASrcClientDataSet, ADestClientDataSet: TClientDataSet);
var
  I, J        : Integer;
  ATmpName    : string;
  ATmpFieldDef: TFieldDef;
  AFieldNameList: TStrings;
begin
  if ASrcClientDataSet.FieldDefs.Count = 0 then Exit;
  AFieldNameList := TStringList.Create;
  ADestClientDataSet.Close;
  ADestClientDataSet.FieldDefs.Clear;
  if MultiSelect then
  begin
    ATmpFieldDef := ADestClientDataSet.FieldDefs.AddFieldDef;
    with ATmpFieldDef do
    begin
      Name := 'myselected';
      DataType := ftBoolean;
    end;
    for I := 0 to ASrcClientDataSet.FieldDefs.Count - 1 do
    begin
      ATmpName := ASrcClientDataSet.FieldDefs[I].Name;
      AFieldNameList.Add(ATmpName);
      ATmpFieldDef := ASrcClientDataSet.FieldDefs[I];
      ADestClientDataSet.FieldDefs.AddFieldDef;
      ADestClientDataSet.FieldDefs[I + 1].Assign(ATmpFieldDef);
    end;
    ADestClientDataSet.CreateDataSet;
    ASrcClientDataSet.First;
    for I := 0 to  ASrcClientDataSet.RecordCount - 1 do
    begin
      ADestClientDataSet.Append;
      ADestClientDataSet.Fields[0].Value := False;
      for J := 0 to AFieldNameList.Count - 1 do
        ADestClientDataSet.Fields[J + 1].Value := ASrcClientDataSet.Fields[J].Value;
      ASrcClientDataSet.Next;
    end;
    ADestClientDataSet.First; 
  end
  else
  begin
    for I := 0 to ASrcClientDataSet.FieldDefs.Count - 1 do
    begin
      ATmpName := ASrcClientDataSet.FieldDefs[I].Name;
      AFieldNameList.Add(ATmpName);
      ATmpFieldDef := ASrcClientDataSet.FieldDefs[I];
      ADestClientDataSet.FieldDefs.AddFieldDef;
      ADestClientDataSet.FieldDefs[I].Assign(ATmpFieldDef);
    end;
    ADestClientDataSet.CreateDataSet;
    ASrcClientDataSet.First;
    for I := 0 to  ASrcClientDataSet.RecordCount - 1 do
    begin
      ADestClientDataSet.Append;
      ADestClientDataSet.Fields[0].Value := False;
      for J := 0 to AFieldNameList.Count - 1 do
        ADestClientDataSet.Fields[J].Value := ASrcClientDataSet.Fields[J].Value;
      ASrcClientDataSet.Next;
    end;
    ADestClientDataSet.First; 
  end;  
end;

procedure TfrmEasySelectDialog.GenerateColumns(
  AGridView: TcxGridDBTableView);
var
  ATmpColumn: TcxGridDBColumn;
  I         : Integer;
begin
  //如果允许多选就增加复选框列
  if MultiSelect then
  begin
    ATmpColumn := AGridView.CreateColumn;
    with ATmpColumn do
    begin
      PropertiesClass := TcxCheckBoxProperties;
      Width := 30;
      Options.Sorting := False;
      DataBinding.FieldName := 'myselected';
      Caption := '';
    end;
  end;
  for I := 0 to GridFields.Count - 1 do
  begin
    ATmpColumn := AGridView.CreateColumn;
    with ATmpColumn do
    begin
      DataBinding.FieldName := GridFields.Strings[I];
      if GridFieldsCaption.Count - 1 >= I then
        Caption := GridFieldsCaption.Strings[I];
      HeaderAlignmentHorz := taCenter;
      if GridFieldsWidth.Count - 1 >= I then
      begin
        if StrToInt(GridFieldsWidth.Strings[I]) > 0 then
          Width := StrToInt(GridFieldsWidth.Strings[I]);
      end;
    end;
  end;
  AGridView.DataController.DataSource := ADataSource;
end;

procedure TfrmEasySelectDialog.FormShow(Sender: TObject);
begin
  GenerateTmpDataSet(AClientDataSet, ATmpClientDataSet);
  ADataSource.DataSet := ATmpClientDataSet;
  //生成Grid列
  GenerateColumns(grdSelectMainDBTableView1);
end;

procedure TfrmEasySelectDialog.SelectedSet(ACds: TClientDataSet;
  AType: Integer);
var
  ABookMark: TBookmark;
  I: Integer;
begin
  ACds.DisableControls;
  ABookMark := ACds.GetBookmark;
  ACds.First;
  if AType = 0 then      //全选
  begin
    for I := 0 to ACds.RecordCount - 1 do
    begin
      ACds.Edit;
      ACds.FieldByName('myselected').AsBoolean := True;
      ACds.Next;
    end;
  end
  else if AType = 1 then  //全不选
  begin
    for I := 0 to ACds.RecordCount - 1 do
    begin
      ACds.Edit;
      ACds.FieldByName('myselected').AsBoolean := False;
      ACds.Next;
    end;
  end
  else if AType = 2 then //反选
  begin
    for I := 0 to ACds.RecordCount - 1 do
    begin
      ACds.Edit;
      ACds.FieldByName('myselected').AsBoolean := not ACds.FieldByName('myselected').AsBoolean;
      ACds.Next;
    end;
  end;
  ACds.GotoBookmark(ABookMark);
  ACds.FreeBookmark(ABookMark);
  ACds.EnableControls;
end;

procedure TfrmEasySelectDialog.N1Click(Sender: TObject);
begin
  SelectedSet(ATmpClientDataSet, 0);
end;

procedure TfrmEasySelectDialog.N3Click(Sender: TObject);
begin
  SelectedSet(ATmpClientDataSet, 1);
end;

procedure TfrmEasySelectDialog.N2Click(Sender: TObject);
begin
  SelectedSet(ATmpClientDataSet, 2);
end;

end.
