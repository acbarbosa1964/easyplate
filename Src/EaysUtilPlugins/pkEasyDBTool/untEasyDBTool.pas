{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7
//                         һ�����е�����������                         
//                         @Copyright 2010 hehf                      
//                   ------------------------------------                       
//                                                                              
//           ���������ǹ�˾�ڲ�ʹ��,��Ϊ��������ʹ���κ�,�κ�����˸��𿪷�,�κ�
//       �˲�����й,�������Ը�.        
//
//            ʹ��Ȩ���Լ���ؽ�������ϵ�κ���  
//                
//                                                               
//            ��վ��ַ��http://www.YiXuan-SoftWare.com                                  
//            �����ʼ���hehaifeng1984@126.com 
//                      YiXuan-SoftWare@hotmail.com    
//            QQ      ��383530895
//            MSN     ��YiXuan-SoftWare@hotmail.com                                   
//------------------------------------------------------------------------------
//��Ԫ˵����
//    ���ݿ��������
//��Ҫʵ�֣�
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

  //�����������
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
    EasyToolBarButton3: TEasyToolBarButton;
    EasyToolBarButton1: TEasyToolBarButton;
    EasyToolBarButton2: TEasyToolBarButton;
    EasyToolBarButton4: TEasyToolBarButton;
    EasyToolBarButton5: TEasyToolBarButton;
    EasyToolBarButton6: TEasyToolBarButton;
    SaveDialog1: TSaveDialog;
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
    procedure EasyToolBarButton4Click(Sender: TObject);
    procedure EasyToolBarButton2Click(Sender: TObject);
    procedure EasyToolBarButton5Click(Sender: TObject);
    procedure EasyToolBarButton6Click(Sender: TObject);
  private
    { Private declarations }
    FEasyDataBase,
    FEasyTableField: TList;
    FUnitContext   : TStrings;

    procedure InitFieldGrid;
    procedure DisplayTableFieldGrid(AClientDataSet: TClientDataSet; ANode: TTreeNode);
    //����Grid�е��ֶ��������ɶ���
    procedure GenerateObjFile(AObjPre: string; AType: Integer = 0);
    procedure GenerateObjValueFile(AObjPre: string; AType: Integer = 0);
    procedure AppendObjValueFile(AObjPre: string; AType: Integer = 0);
    procedure EditObjValueFile(AObjPre: string; AType: Integer = 0);
    procedure DeleteObjValueFile(AObjPre: string; AType: Integer = 0);
  public
    { Public declarations }
  end;

var
  frmEasyDBTool: TfrmEasyDBTool;

implementation

{$R *.dfm}

uses
  untEasyUtilMethod, TypInfo, untEasyDBToolObjectPas;

//��������ʵ��
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

  FUnitContext := TStringList.Create;
end;

procedure TfrmEasyDBTool.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EasyFreeAndNilList(FEasyDataBase);
  EasyFreeAndNilList(FEasyTableField);

  FUnitContext.Free;
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

  ATmpRoot := tvDataBase.Items.Item[0]; //��һ���ڵ�������
  //��ǰ���ݿ����ƵĽڵ�
  ADBNode := tvDataBase.Items.AddChild(ATmpRoot, cdsDataBases.fieldbyname('DBName').AsString);
  ADBNode.ImageIndex := 1;
  ADBNode.SelectedIndex := 1;
  //ȡ��ǰ���ݿ��µ��������ݱ�
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
    //���δ���ع���������ݿ��ȡ����
    if tvDataBase.Selected.Data = nil then
      cdsTableField.Data := EasyRDMDisp.EasyGetRDMData(Format(EASY_TABLEFIELD, [ATableName]));
    //ˢ����ʾ�ֶ�Grid
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
    ColumnHeaders.Add('<p align="center">�ֶ�����</p>');
    ColumnHeaders.Add('<p align="center">����</p>');
    ColumnHeaders.Add('<p align="center">����</p>');
    ColumnHeaders.Add('<p align="center">С��λ��</p>');
    ColumnHeaders.Add('<p align="center">����</p>');
    ColumnHeaders.Add('<p align="center">�շ�</p>');
    ColumnHeaders.Add('<p align="center">Ĭ��ֵ</p>');
    ColumnHeaders.Add('<p align="center">˵��</p>');
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
  //�ж��뷽ʽ
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
  DeleteObjValueFile('Easy');
end;

procedure TfrmEasyDBTool.GenerateObjFile(AObjPre: string; AType: Integer = 0);
var
  I: Integer;
  ATmpResult, ATmpPublicResult: TStrings;
begin
  if tvDataBase.Selected = nil then Exit;
  ATmpResult := TStringList.Create;
  ATmpPublicResult := TStringList.Create;
  ATmpResult.Add('  T' + AObjPre + tvDataBase.Selected.Text + ' = class');
  //����˽�б���
  ATmpResult.Add('  private');
  ATmpResult.Add('  { Private declarations } ');
  //���ӹ�������
  ATmpPublicResult.Add('  public');
  ATmpPublicResult.Add('  { Public declarations } ');
  for I := 0 to sgrdTableField.RowCount - 2 do
  begin
    with sgrdTableField do
    begin
      //�ֶ�����
      //varchar
      if Cells[2, I + 1] = 'varchar' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'string;');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'string'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Integer;');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'Integer'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //bit
      else if Cells[2, I + 1] = 'bit' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Boolean;');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'Boolean'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Double;');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'Double'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //numeric
      else if (Cells[2, I + 1] = 'numeric') then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'Double;');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'Double'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //DateTime
      else if Cells[2, I + 1] = 'datetime' then
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'TDateTime;');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'TDateTime'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
      //
      else
      begin
        ATmpResult.Add('    F' + Cells[1, I + 1] + ': ' + 'EasyNULLType;');
        ATmpPublicResult.Add('    property ' + Cells[1, I + 1] + ': ' + 'EasyNULLType'
                            + ' read F' + Cells[1, I + 1] + ' write F' + Cells[1, I + 1] +';');
      end
    end;
  end;
  ATmpResult.Add(ATmpPublicResult.Text);
  
  if AType = 1 then
  begin
    FUnitContext.Add('');
    FUnitContext.AddStrings(ATmpResult);
  end else
  begin
    frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
    frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
    frmEasyDBToolObjectPas.ShowModal;
    frmEasyDBToolObjectPas.Free;
  end;
  
  ATmpResult.Free;
  ATmpPublicResult.Free;
end;

procedure TfrmEasyDBTool.GenerateObjValueFile(AObjPre: string; AType: Integer = 0);
var
  I: Integer;
  ATmpResult: TStrings;
begin
  if tvDataBase.Selected = nil then Exit;
  ATmpResult := TStringList.Create;

  ATmpResult.Add('class procedure T' + AObjPre + tvDataBase.Selected.Text + '.Generate' + tvDataBase.Selected.Text
                 +'(var Data: OleVariant; AResult: TList)');
  ATmpResult.Add('var');
  ATmpResult.Add('  I: Integer;');
  ATmpResult.Add('  A' + AObjPre + tvDataBase.Selected.Text + ': T' + AObjPre + tvDataBase.Selected.Text + ';');
  ATmpResult.Add('  AClientDataSet: TClientDataSet;');
  ATmpResult.Add('begin');
  ATmpResult.Add('  //��������Դ������ȡ����');
  ATmpResult.Add('  AClientDataSet := TClientDataSet.Create(nil);');
  ATmpResult.Add('  AClientDataSet.Data := Data;');
  ATmpResult.Add('  AClientDataSet.First;');
  ATmpResult.Add('  try');
  ATmpResult.Add('    for I := 0 to AClientDataSet.RecordCount - 1 do');
  ATmpResult.Add('    begin');
  ATmpResult.Add('      //�˾�Ϊʵ����ָ���Ķ���');
  ATmpResult.Add('      A' + AObjPre + tvDataBase.Selected.Text
                  + ' := T' + AObjPre + tvDataBase.Selected.Text + '.Create;');
  ATmpResult.Add('      with ' + 'A' + AObjPre + tvDataBase.Selected.Text + ' do ');
  ATmpResult.Add('      begin');

  for I := 0 to sgrdTableField.RowCount - 2 do
  begin
    with sgrdTableField do
    begin
       ATmpResult.Add('      ' + '//' + IntToStr(I + 1) + ' ' + Cells[1, I + 1]);
      //varchar
      if Cells[2, I + 1] = 'varchar' then
        ATmpResult.Add('        ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '''' + Cells[1, I + 1] + '''' +').AsString;')
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
        ATmpResult.Add('        ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '''' + Cells[1, I + 1] + '''' +').AsInteger;')
      //bit
      else if Cells[2, I + 1] = 'bit' then
        ATmpResult.Add('        ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '''' + Cells[1, I + 1] + '''' +').AsBoolean;')
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
        ATmpResult.Add('        ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '''' + Cells[1, I + 1] + '''' +').AsFloat;')
      //DateTime
      else if Cells[2, I + 1] = 'datetime' then
        ATmpResult.Add('        ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '''' + Cells[1, I + 1] + '''' +').AsDateTime;')
      //numeric
      else if (Cells[2, I + 1] = 'numeric') then
        ATmpResult.Add('        ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '''' + Cells[1, I + 1] + '''' +').AsFloat;')
      else
        ATmpResult.Add('        ' + Cells[1, I + 1] + ' := ' + 'AClientDataSet.FieldByName('
                              + '''' + Cells[1, I + 1] + '''' +').AsEasyNullType;');
    end;
  end;
  ATmpResult.Add('      end;');
  ATmpResult.Add('      //�ڴ����ӽ������ŵ�ָ�������Ĵ���');
  ATmpResult.Add('      AResult.Add(A' + AObjPre + tvDataBase.Selected.Text + ');');
  ATmpResult.Add('      //���Ҫ������Ҳ�ڴ�������Ӧ����');
  ATmpResult.Add('      AClientDataSet.Next;');
  ATmpResult.Add('    end;');
  ATmpResult.Add('  finally');
  ATmpResult.Add('    AClientDataSet.Free;');
  ATmpResult.Add('  end;');
  ATmpResult.Add('end;');

  if AType = 1 then
  begin
//    FUnitContext.Add('');
    FUnitContext.AddStrings(ATmpResult);
  end else
  begin
    frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
    frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
    frmEasyDBToolObjectPas.ShowModal;
    frmEasyDBToolObjectPas.Free;
  end;

  ATmpResult.Free;
end;

procedure TfrmEasyDBTool.EasyToolBarButton1Click(Sender: TObject);
begin
  inherited;
  GenerateObjFile('Easy');
end;

procedure TfrmEasyDBTool.AppendObjValueFile(AObjPre: string; AType: Integer = 0);
var
  I: Integer;
  ATmpResult: TStrings;
  ObjClassName: string;
begin
  if tvDataBase.Selected = nil then Exit;
  ATmpResult := TStringList.Create;

  ObjClassName := 'T' + AObjPre + tvDataBase.Selected.Text;
  ATmpResult.Add('class procedure ' + ObjClassName + '.AppendClientDataSet'
                 + '(ACds: TClientDataSet; AObj: ' + ObjClassName + '; var AObjList: TList);');
  ATmpResult.Add('begin');
  ATmpResult.Add('  with ACds do');
  ATmpResult.Add('  begin');
  ATmpResult.Add('    Append;');
  //
  for I := 0 to sgrdTableField.RowCount - 2 do
  begin
    with sgrdTableField do
    begin
       ATmpResult.Add('      ' + '//' + IntToStr(I + 1) + ' ' + Cells[1, I + 1]);
      //varchar
      if Cells[2, I + 1] = 'varchar' then
        ATmpResult.Add('    ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsString := AObj.' + Cells[1, I + 1] + ';')
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
        ATmpResult.Add('    ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsInteger := AObj.' + Cells[1, I + 1] + ';')
      //bit
      else if Cells[2, I + 1] = 'bit' then
        ATmpResult.Add('    ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsBoolean := AObj.' + Cells[1, I + 1] + ';')
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
        ATmpResult.Add('    ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsFloat := AObj.' + Cells[1, I + 1] + ';')
      //DateTime
      else if Cells[2, I + 1] = 'datetime' then
        ATmpResult.Add('    ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsDateTime := AObj.' + Cells[1, I + 1] + ';')
      //numeric
      else if (Cells[2, I + 1] = 'numeric') then
        ATmpResult.Add('    ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsFloat := AObj.' + Cells[1, I + 1] + ';')
      else
        ATmpResult.Add('    ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsEasyNullType := AObj.' + Cells[1, I + 1] + ';');
    end;
  end;
  ATmpResult.Add('    post;');
  ATmpResult.Add('  end;');
  ATmpResult.Add('  AObjList.Add(AObj);');
  ATmpResult.Add('end;');

  if AType = 1 then
  begin
    FUnitContext.Add('');
    FUnitContext.AddStrings(ATmpResult);
  end else
  begin
    frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
    frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
    frmEasyDBToolObjectPas.ShowModal;
    frmEasyDBToolObjectPas.Free;
  end;

  ATmpResult.Free;
end;

procedure TfrmEasyDBTool.DeleteObjValueFile(AObjPre: string; AType: Integer = 0);
var
  ATmpResult: TStrings;
  ObjClassName: string;
  KeyField: string;
begin
  if tvDataBase.Selected = nil then Exit;
  ATmpResult := TStringList.Create;
  KeyField := sgrdTableField.Cells[1, 1];
  ObjClassName := 'T' + AObjPre + tvDataBase.Selected.Text;
  ATmpResult.Add('class procedure ' + ObjClassName + '.DeleteClientDataSet'
                 + '(ACds: TClientDataSet; AObj: ' + ObjClassName + ';'
                 + ' var AObjList: TList);');
  ATmpResult.Add('var');
  ATmpResult.Add('  I,');
  ATmpResult.Add('  DelIndex: Integer;');
  ATmpResult.Add('begin');
  ATmpResult.Add('  DelIndex := -1;');
  ATmpResult.Add('  if ACds.Locate(''' + KeyField + ''', VarArrayOf([AObj.' + KeyField + ']), [loCaseInsensitive]) then');
  ATmpResult.Add('    ACds.Delete;');
  ATmpResult.Add('  for I := 0 to AObjList.Count - 1 do');
  ATmpResult.Add('  begin');
  ATmpResult.Add('    if ' + ObjClassName + '(AObjList[I]).' + KeyField + ' = ' + ObjClassName + '(AObj).' + KeyField + ' then');
  ATmpResult.Add('    begin');
  ATmpResult.Add('      DelIndex := I;');
  ATmpResult.Add('      Break;');
  ATmpResult.Add('    end;');
  ATmpResult.Add('  end;');
  ATmpResult.Add('  if DelIndex <> -1 then');
  ATmpResult.Add('  begin');
  ATmpResult.Add('    ' + ObjClassName + '(AObjList[DelIndex]).Free;');
  ATmpResult.Add('    AObjList.Delete(DelIndex);');
  ATmpResult.Add('  end; ');
  ATmpResult.Add('end; ');

  if AType = 1 then
  begin
    FUnitContext.Add('');
    FUnitContext.AddStrings(ATmpResult);
  end else
  begin
    frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
    frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
    frmEasyDBToolObjectPas.ShowModal;
    frmEasyDBToolObjectPas.Free;
  end;
  
  ATmpResult.Free;
end;

procedure TfrmEasyDBTool.EditObjValueFile(AObjPre: string; AType: Integer = 0);
var
  I: Integer;
  ATmpResult: TStrings;
  ObjClassName: string;
  KeyField: string;
begin
  if tvDataBase.Selected = nil then Exit;
  ATmpResult := TStringList.Create;
  KeyField := sgrdTableField.Cells[1, 1];
  ObjClassName := 'T' + AObjPre + tvDataBase.Selected.Text;
  ATmpResult.Add('class procedure ' + ObjClassName + '.EditClientDataSet'
                 + '(ACds: TClientDataSet; AObj: ' + ObjClassName + ';'
                 + ' var AObjList: TList);');
  ATmpResult.Add('begin');
  ATmpResult.Add('  if ACds.Locate(''' + KeyField + ''', VarArrayOf([AObj.' + KeyField + ']), [loCaseInsensitive]) then');
  ATmpResult.Add('  begin');
  ATmpResult.Add('    with ACds do');
  ATmpResult.Add('    begin');
  ATmpResult.Add('      Edit;');
  //
  for I := 0 to sgrdTableField.RowCount - 2 do
  begin
    with sgrdTableField do
    begin
       ATmpResult.Add('      ' + '//' + IntToStr(I + 1) + ' ' + Cells[1, I + 1]);
      //varchar
      if Cells[2, I + 1] = 'varchar' then
        ATmpResult.Add('      ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsString := AObj.' + Cells[1, I + 1] + ';')
      //int bigint
      else if (Cells[2, I + 1] = 'int') or (Cells[2, I + 1] = 'bigint') then
        ATmpResult.Add('      ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsInteger := AObj.' + Cells[1, I + 1] + ';')
      //bit
      else if Cells[2, I + 1] = 'bit' then
        ATmpResult.Add('      ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsBoolean := AObj.' + Cells[1, I + 1] + ';')
      //decimal numeric
      else if (Cells[2, I + 1] = 'decimal') then
        ATmpResult.Add('      ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsFloat := AObj.' + Cells[1, I + 1] + ';')
      //DateTime
      else if Cells[2, I + 1] = 'DateTime' then
        ATmpResult.Add('      ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsDateTime := AObj.' + Cells[1, I + 1] + ';')
      //numeric
      else if (Cells[2, I + 1] = 'numeric') then
        ATmpResult.Add('      ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsFloat := AObj.' + Cells[1, I + 1] + ';')
      else
        ATmpResult.Add('      ' + 'FieldByName(' + '''' + Cells[1, I + 1] + ''''
                                +').AsEasyNullType := AObj.' + Cells[1, I + 1] + ';');
    end;
  end;
  ATmpResult.Add('      post;');
  ATmpResult.Add('    end;');
  ATmpResult.Add('  end;');
  ATmpResult.Add('end;');

  if AType = 1 then
  begin
    FUnitContext.Add('');
    FUnitContext.AddStrings(ATmpResult);
  end else
  begin
    frmEasyDBToolObjectPas := TfrmEasyDBToolObjectPas.Create(Self);
    frmEasyDBToolObjectPas.mmResult.Lines.Text := ATmpResult.Text;
    frmEasyDBToolObjectPas.ShowModal;
    frmEasyDBToolObjectPas.Free;
  end;

  ATmpResult.Free;
end;

procedure TfrmEasyDBTool.EasyToolBarButton4Click(Sender: TObject);
begin
  inherited;
  AppendObjValueFile('Easy');
end;


procedure TfrmEasyDBTool.EasyToolBarButton2Click(Sender: TObject);
begin
  inherited;
  EditObjValueFile('Easy');
end;

procedure TfrmEasyDBTool.EasyToolBarButton5Click(Sender: TObject);
begin
  inherited;
  GenerateObjValueFile('Easy');
end;

procedure TfrmEasyDBTool.EasyToolBarButton6Click(Sender: TObject);
var
  ObjClassName: string;
begin
  inherited;
  if tvDataBase.Selected = nil then Exit;

  FUnitContext.Clear;
  ObjClassName := 'T' + 'Easy' + tvDataBase.Selected.Text;
  SaveDialog1.FileName := 'untEasyClass' + tvDataBase.Selected.Text;
  if SaveDialog1.Execute then
  begin
    FUnitContext.Add('{-------------------------------------------------------------------------------');
    FUnitContext.Add('//                       EasyComponents For Delphi 7                            ');
    FUnitContext.Add('//                         һ�����е�����������                                 ');
    FUnitContext.Add('//                         @Copyright 2010 hehf                                 ');
    FUnitContext.Add('//                   ------------------------------------                       ');
    FUnitContext.Add('//                                                                              ');
    FUnitContext.Add('//           ���������ǹ�˾�ڲ�ʹ��,��Ϊ��������ʹ���κ�,�κ�����˸��𿪷�,�κ�');
    FUnitContext.Add('//       �˲�����й,�������Ը�.                                               ');
    FUnitContext.Add('//                                                                              ');
    FUnitContext.Add('//            ʹ��Ȩ���Լ���ؽ�������ϵ�κ���                                  ');
    FUnitContext.Add('//                                                                              ');
    FUnitContext.Add('//                                                                              ');
    FUnitContext.Add('//            ��վ��ַ��http://www.YiXuan-SoftWare.com                          ');
    FUnitContext.Add('//            �����ʼ���hehaifeng1984@126.com                                   ');
    FUnitContext.Add('//                      YiXuan-SoftWare@hotmail.com                             ');
    FUnitContext.Add('//            QQ      ��383530895                                               ');
    FUnitContext.Add('//            MSN     ��YiXuan-SoftWare@hotmail.com                             ');
    FUnitContext.Add('//------------------------------------------------------------------------------');
    FUnitContext.Add('//��Ԫ˵����                                                                    ');
    FUnitContext.Add('//                                                                              ');
    FUnitContext.Add('//��Ҫʵ�֣�                                                                    ');
    FUnitContext.Add('//-----------------------------------------------------------------------------}');
    FUnitContext.Add('unit untEasyClass' + tvDataBase.Selected.Text + ';');
    FUnitContext.Add('');
    FUnitContext.Add('interface');
    FUnitContext.Add('');
    FUnitContext.Add('uses');
    FUnitContext.Add('  Classes, DB, DBClient, Variants;');
    FUnitContext.Add('');
    FUnitContext.Add('type');
    //class type
    GenerateObjFile('Easy', 1);
    FUnitContext.Add('');
    //Append, edit, delete, Generate
    FUnitContext.Add('    class procedure Generate' + tvDataBase.Selected.Text
                   +'(var Data: OleVariant; AResult: TList);');
    FUnitContext.Add('    class procedure AppendClientDataSet'
                   + '(ACds: TClientDataSet; AObj: ' + ObjClassName + '; var AObjList: TList);');
    FUnitContext.Add('    class procedure EditClientDataSet'
                   + '(ACds: TClientDataSet; AObj: ' + ObjClassName + ';'
                   + ' var AObjList: TList);');
    FUnitContext.Add('    class procedure DeleteClientDataSet'
                   + '(ACds: TClientDataSet; AObj: ' + ObjClassName + ';'
                   + ' var AObjList: TList);');
    FUnitContext.Add('  end;');
    FUnitContext.Add('');
    FUnitContext.Add('implementation');
    FUnitContext.Add('');
    FUnitContext.Add('{' + ObjClassName +'}');
    GenerateObjValueFile('Easy', 1);
    //Append, edit, delete
    AppendObjValueFile('Easy', 1);
    EditObjValueFile('Easy', 1);
    DeleteObjValueFile('Easy', 1);
    FUnitContext.Add('');
    FUnitContext.Add('end.');
    if pos('.pas', SaveDialog1.FileName) > 0 then
      FUnitContext.SaveToFile(SaveDialog1.FileName)
    else
      FUnitContext.SaveToFile(SaveDialog1.FileName + '.pas');
  end;
end;

end.