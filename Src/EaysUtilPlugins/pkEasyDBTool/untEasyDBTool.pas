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
  Dialogs, untEasyPlateDBBaseForm, untEasyPageControl, ImgList,
  untEasyStatusBar, untEasyStatusBarStylers, untEasyToolBar,
  untEasyToolBarStylers, ActnList, ComCtrls, untEasyTreeView, ExtCtrls,
  untEasyGroupBox, DB, DBClient, untEasyDBToolObject, untEasyDBToolUtil,
  StdCtrls, Grids, untEasyBaseGrid, untEasyGrid, untEasyMemo;

  //插件导出函数
  function ShowBplForm(AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
type
  TfrmEasyDBTool = class(TfrmEasyPlateDBBaseForm)
    pnlMain: TEasyPanel;
    Splitter1: TSplitter;
    EasyPanel1: TEasyPanel;
    tvDataBase: TEasyTreeView;
    EasyPanel2: TEasyPanel;
    EasyPanel4: TEasyPanel;
    actMain: TActionList;
    actAcceptMail: TAction;
    actSendMail: TAction;
    actLinkMans: TAction;
    EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler;
    imgImportance: TImageList;
    pgcDBDetail: TEasyPageControl;
    cdsDataBases: TClientDataSet;
    cdsTableField: TClientDataSet;
    tsbTableField: TEasyTabSheet;
    sgrdTableField: TEasyStringGrid;
    EasyDockPanel1: TEasyDockPanel;
    EasyToolBar1: TEasyToolBar;
    btnNew: TEasyToolBarButton;
    EasyTabSheet1: TEasyTabSheet;
    EasyDockPanel2: TEasyDockPanel;
    EasyToolBar2: TEasyToolBar;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarButton1: TEasyToolBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tvDataBaseDblClick(Sender: TObject);
    procedure sgrdTableFieldGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgrdTableFieldGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure btnNewClick(Sender: TObject);
    procedure EasyToolBarButton3Click(Sender: TObject);
    procedure EasyToolBarButton1Click(Sender: TObject);
  private
    { Private declarations }
    FEasyDataBase,
    FEasyTableField: TList;

    procedure GenerateObject(AObject: TObject; AClientDataSet: TClientDataSet);
    procedure InitFieldGrid;
    procedure DisplayTableFieldGrid(AClientDataSet: TClientDataSet; ANode: TTreeNode);
    //根据Grid中的字段名称生成对象
    procedure GenerateObjFile(AObjPre: string);
    procedure GenerateObjValueFile(AObjPre: string);
  public
    { Public declarations }
  end;

var
  frmEasyDBTool: TfrmEasyDBTool;

implementation

{$R *.dfm}

uses
  untEasyUtilMethod, TypInfo, untEasyDBToolObjectPas;

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

procedure TfrmEasyDBTool.FormCreate(Sender: TObject);
begin
  inherited;
  FEasyDataBase := TList.Create;
  FEasyTableField := TList.Create;
end;

procedure TfrmEasyDBTool.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EasyFreeAndNilList(FEasyDataBase);
  EasyFreeAndNilList(FEasyTableField);
end;

procedure TfrmEasyDBTool.GenerateObject(AObject: TObject;
  AClientDataSet: TClientDataSet);
begin
end;

procedure TfrmEasyDBTool.FormShow(Sender: TObject);
var
  CurrDBNameSQL: string;
  ATmpRoot,
  ADBNode,
  ATableNode: TTreeNode;
  I      : Integer;
begin
  inherited;
  CurrDBNameSQL := 'SELECT DB_NAME() AS DBName';
  cdsDataBases.Data := EasyRDMDisp.EasyGetRDMData(CurrDBNameSQL);

  ATmpRoot := tvDataBase.Items.Item[0]; //第一个节点必须存在
  //当前数据库名称的节点
  ADBNode := tvDataBase.Items.AddChild(ATmpRoot, cdsDataBases.fieldbyname('DBName').AsString);
  ADBNode.ImageIndex := 1;
  ADBNode.SelectedIndex := 1;
  //取当前数据库下的所有数据表
  cdsDataBases.Data := EasyRDMDisp.EasyGetRDMData(EASY_TABLE);
  for I := 0 to cdsDataBases.RecordCount - 1 do
  begin
    ATableNode := tvDataBase.Items.AddChild(ADBNode, cdsDataBases.fieldbyname('Name').AsString);
    ATableNode.ImageIndex := 6;
    ATableNode.SelectedIndex := 7;
    cdsDataBases.Next;
  end;
  tvDataBase.FullExpand;
end;

procedure TfrmEasyDBTool.tvDataBaseDblClick(Sender: TObject);
var
  ATableName: string;
begin
  inherited;
  ATableName := tvDataBase.Selected.Text;
  if tvDataBase.Selected.Level = 2 then
  begin
    //如果未加载过，则从数据库获取数据
    if tvDataBase.Selected.Data = nil then
      cdsTableField.Data := EasyRDMDisp.EasyGetRDMData(Format(EASY_TABLEFIELD, [ATableName]));
    //刷新显示字段Grid
    DisplayTableFieldGrid(cdsTableField, tvDataBase.Selected);
  end;
end;

procedure TfrmEasyDBTool.InitFieldGrid;
begin
  with sgrdTableField do
  begin
    Clear;
    RowCount := 2;
    FixedRows := 1;

    ColumnHeaders.Add('');
    ColumnHeaders.Add('<p align="center">字段名称</p>');
    ColumnHeaders.Add('<p align="center">类型</p>');
    ColumnHeaders.Add('<p align="center">长度</p>');
    ColumnHeaders.Add('<p align="center">小数位数</p>');
    ColumnHeaders.Add('<p align="center">主键</p>');
    ColumnHeaders.Add('<p align="center">空否</p>');
    ColumnHeaders.Add('<p align="center">默认值</p>');
    ColumnHeaders.Add('<p align="center">说明</p>');
  end;  
end;

procedure TfrmEasyDBTool.DisplayTableFieldGrid(AClientDataSet: TClientDataSet; ANode: TTreeNode);
var
  I: Integer;
begin
  InitFieldGrid;
  if ANode.Data = nil then
  begin
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      if I > 0 then sgrdTableField.AddRow;
      with sgrdTableField do
      begin
        Cells[0, I + 1] := IntToStr(I + 1);
        Cells[1, I + 1] := AClientDataSet.fieldbyname('FieldName').AsString;
        Cells[2, I + 1] := AClientDataSet.fieldbyname('Type').AsString;
        Cells[3, I + 1] := AClientDataSet.fieldbyname('Long').AsString;
        Cells[4, I + 1] := AClientDataSet.fieldbyname('percent').AsString;
        Cells[5, I + 1] := AClientDataSet.fieldbyname('PrimaryKey').AsString;
        Cells[6, I + 1] := AClientDataSet.fieldbyname('IsNull').AsString;
        Cells[7, I + 1] := AClientDataSet.fieldbyname('DefaultValue').AsString;
        //Cells[8, I + 1] := AClientDataSet.fieldbyname('Comment').AsString;
      end;
      AClientDataSet.Next;
    end;  
  end;  
end;

procedure TfrmEasyDBTool.sgrdTableFieldGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  VAlign := vtaCenter;
  //列对齐方式
  if ACol in [0, 5, 6] then
    HAlign := taCenter;
end;

procedure TfrmEasyDBTool.sgrdTableFieldGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if ACol = 2 then
  begin
    AEditor := edComboList;
    with sgrdTableField do
    begin
      ClearComboString;
      AddComboString('varchar');
      AddComboString('datetime');
    end;
  end;
end;

procedure TfrmEasyDBTool.btnNewClick(Sender: TObject);
begin
  inherited;
  sgrdTableField.Options := sgrdTableField.Options + [goEditing];
end;

procedure TfrmEasyDBTool.EasyToolBarButton3Click(Sender: TObject);
begin
  inherited;
  GenerateObjValueFile('Easy');
  //
end;

procedure TfrmEasyDBTool.GenerateObjFile(AObjPre: string);
var
  I: Integer;
  ATmpResult, ATmpPublicResult: TStrings;
begin
  ATmpResult := TStringList.Create;
  ATmpPublicResult := TStringList.Create;
  ATmpResult.Add('  T' + AObjPre + tvDataBase.Selected.Text + ' = class');
  //增加私有变量
  ATmpResult.Add('  private');
  ATmpResult.Add('  { Private declarations } ');
  //增加公共属性
  ATmpPublicResult.Add('  public');
  ATmpPublicResult.Add('  { Public declarations } ');
  for I := 0 to sgrdTableField.RowCount - 1 do
  begin
    with sgrdTableField do
    begin
      //字段类型
      //varchar
      if Cells[2, I + 1] = 'varchar' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'string');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Integer');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //bit
      else if Cells[2, I + 1] = 'bit' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Boolean');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Double');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //DateTime
      else if Cells[2, I + 1] = 'DateTime' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'TDateTime');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end;
    end;
  end;
  ATmpResult.Add(ATmpPublicResult.Text);
  frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
  frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
  frmEasyDBToolObjectPas.ShowModal;
  frmEasyDBToolObjectPas.Free;
  ATmpResult.Free;
  ATmpPublicResult.Free;
end;

procedure TfrmEasyDBTool.GenerateObjValueFile(AObjPre: string);
var
  I: Integer;
  ATmpResult: TStrings;
begin
  ATmpResult := TStringList.Create;

  ATmpResult.Add(' //此句为实例化指定的对象');
  ATmpResult.Add('A' + AObjPre + tvDataBase.Selected.Text
                  + ' := T' + AObjPre + tvDataBase.Selected.Text + '.Create');
  ATmpResult.Add(' AClientDataSet.First;');
  ATmpResult.Add('for I := 0 to AClientDataSet.RecordCount - 1 do');
  ATmpResult.Add('begin');
  ATmpResult.Add('  with ' + 'A' + AObjPre + tvDataBase.Selected.Text + ' do ');
  ATmpResult.Add('  begin');

  for I := 0 to sgrdTableField.RowCount - 1 do
  begin
    with sgrdTableField do
    begin
      //varchar
      if Cells[2, I + 1] = 'varchar' then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsString;')
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsInteger;')
      //bit
      else if Cells[2, I + 1] = 'bit' then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsBoolean;')
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsFloat;')
      //DateTime
      else if Cells[2, I + 1] = 'DateTime' then
        ATmpResult.Add('    ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '' + Cells[1, I + 1] + '' +').AsDateTime;');
    end;
  end;
  ATmpResult.Add('  end;');
  ATmpResult.Add(' AClientDataSet.Next;');
  ATmpResult.Add(' //在此添加将对象存放到指定容器的代码');
  ATmpResult.Add(' //如果要关联树也在此添加相应代码');
  ATmpResult.Add('end;');
  
  frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
  frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
  frmEasyDBToolObjectPas.ShowModal;
  frmEasyDBToolObjectPas.Free;

  ATmpResult.Free;
end;

procedure TfrmEasyDBTool.EasyToolBarButton1Click(Sender: TObject);
begin
  inherited;
  GenerateObjFile('Easy');
end;

end.
