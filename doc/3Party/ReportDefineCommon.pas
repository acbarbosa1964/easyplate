unit ReportDefineCommon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBOperateExFrm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxContainer, Menus, DBClient, dxBar, cxClasses, ActnList, StdCtrls,
  cxButtons, cxGroupBox, cxGridLevel, cxGridCustomView, Global,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxBlobEdit, cxCheckBox, cxMemo, frxClass, frxDBSet, frxDesgn,
  cxDropDownEdit, cxCurrencyEdit, cxDBExtLookupComboBox, MConnect, SConnect,
  Grids, DBGrids;

type
  TReportShowType = (rstPreview, rstPrint, rstDesign);

  TCommonReport = class(TComponent)
  private
    procedure __frxReportEndDoc(Sender: TObject);  
  public
    TmpModifiedStream : TMemoryStream;
    ArrayReportCds  : array of TClientDataSet;
    ArrayReportfrxDB: array of TfrxDBDataset;
    CdsMst,
    CdsDtl          : TClientDataSet;
    AfrxReportMain,
    ExternalFrxReport: TfrxReport;
    function __frxReportUserFunction(const MethodName: String; var Params: Variant): Variant;
    //创建ClientDataSet交由frxDBDataSet处理数据集
    //动态绑定ClientDataSet的Server和provider
    procedure GenerateReportDataSet(ADataSetName, sSQL: string; AIndex: Integer;
             var ArrayReportCds: array of TClientDataSet; var ArrayReportfrxDB: array of TfrxDBDataset;
             var ASQLVariant: OleVariant);
    //将更改的报表直接更新进数据库
    procedure _CompressReport2DB(ASrcStream: TMemoryStream; ATmpReportFileId: string);
  public
    ModuleID      : string;
    Params        : OleVariant;
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AReportID: string; AReport: TfrxReport = nil); reintroduce; overload;
    destructor Destroy; override;
    //根据单据类型和报表编号生成相应的数据集
    procedure GenerateReportDataSets(ADtlClientDataSet: TClientDataSet; sBillType, sReportId: string);
  end;

function showBillCommonRep(aRepId: WideString; aParam: Olevariant; aPreview: TReportShowType;
                            aFrxReport: TfrxReport): Integer; //overload;

implementation

uses
  HgSoftClientDM, ZLib, Printers;

var
  ACommonReport: TCommonReport;
  
//创建ClientDataSet交由frxDBDataSet处理数据集
//动态绑定ClientDataSet的Server和provider
procedure TCommonReport.GenerateReportDataSet(ADataSetName, sSQL: string; AIndex: Integer;
         var ArrayReportCds: array of TClientDataSet; var ArrayReportfrxDB: array of TfrxDBDataset;
         var ASQLVariant: OleVariant);
var
  AClientDataSet: TClientDataSet;
  AfrxDataSet   : TfrxDBDataset;
begin
  AClientDataSet := TClientDataSet.Create(nil);
  with AClientDataSet do
    Name := 'cds' + ADataSetName;

  ArrayReportCds[AIndex] := AClientDataSet;

  ASQLVariant[AIndex] := sSQL;
  AfrxDataSet := TfrxDBDataset.Create(nil);
  with AfrxDataSet do
  begin
    Name := ADataSetName;
    DataSet := AClientDataSet;
  end;
  ArrayReportfrxDB[AIndex] := AfrxDataSet;

  if ExternalFrxReport = nil then
    AfrxReportMain.DataSets.Add(AfrxDataSet)
  else
    ExternalFrxReport.DataSets.Add(AfrxDataSet);
end;

function showBillCommonRep(aRepId: WideString; aParam: Olevariant; aPreview: TReportShowType;
                            aFrxReport: TfrxReport): Integer;
var
  AReport_file_id: string;
  ds            : TDecompressionStream;
  DestStream,
  srcStream     : TMemoryStream;
  num           : Integer;
  billtype      : string;
begin
  if aFrxReport <> nil then
  begin
    ACommonReport := TCommonReport.Create(aFrxReport, aRepId, aFrxReport);
    aFrxReport.OnEndDoc := ACommonReport.__frxReportEndDoc;
  end
  else
    ACommonReport := TCommonReport.Create(Application, aRepId, aFrxReport);
  with ACommonReport do
  begin
    if CdsMst.Locate('rep_id', VarArrayOf([aRepId]), [loCaseInsensitive]) then
    begin
      AReport_file_id := CdsMst.fieldbyname('report_file_id').AsString;
      billtype := CdsMst.fieldbyname('bill_type_id').AsString;
    end
    else
    begin
      Result := -1;
      Exit;
    end;

    ModuleID := billtype;
    Params := aParam;
    GenerateReportDataSets(CdsDtl, ModuleID, aRepId);

    DestStream := TMemoryStream.Create;
    srcStream := TMemoryStream.Create;

    TBlobField(CdsMst.FieldByName('report')).SaveToStream(srcStream);
    srcStream.Position := 0;
    srcStream.ReadBuffer(num, SizeOf(num));
    DestStream.SetSize(num);

    ds := TDecompressionStream.Create(srcStream);
    ds.Read(DestStream.Memory^, num);
    if ExternalFrxReport = nil then
      AfrxReportMain.LoadFromStream(DestStream)
    else
      ExternalFrxReport.LoadFromStream(DestStream);

    if ExternalFrxReport = nil then
    begin
      if aPreview = rstPreview then
        AfrxReportMain.ShowReport()
      else if aPreview = rstPrint then
      begin
        AfrxReportMain.PrepareReport;
        if Printer.Printers.Count = 1 then
          AfrxReportMain.PrintOptions.ShowDialog := False;
        AfrxReportMain.Print;
      end else
      if aPreview = rstDesign then
      begin
        AfrxReportMain.DesignReport();
        TmpModifiedStream.Clear;
        AfrxReportMain.SaveToStream(TmpModifiedStream);
        if Application.MessageBox('是否将设计后的报表更新到数据库?', '提示',
          MB_YESNO + MB_ICONQUESTION) = IDYES then
          _CompressReport2DB(TmpModifiedStream, AReport_file_id)
        else
          TmpModifiedStream.Clear;
      end;
    end else
    begin
      ExternalFrxReport.ShowReport();
    end;
    ds.Free;
    srcStream.Free;
    DestStream.Free;
  end;
  if ACommonReport.ExternalFrxReport = nil then
    ACommonReport.Free;
  Result := 0;
end;

destructor TCommonReport.Destroy;
var
  I: Integer;
begin
  if AfrxReportMain <> nil then
    AfrxReportMain.Free;
  if CdsMst <> nil then
  begin
    CdsMst.Close;
    CdsMst.Free;
  end;
  if CdsDtl <> nil then
  begin
    CdsDtl.Close;
    CdsDtl.Free;
  end;
  if Length(ArrayReportCds) > 0 then
  begin
    for I := Low(ArrayReportCds) to High(ArrayReportCds) do
      TClientDataSet(ArrayReportCds[I]).Free;
  end;
  SetLength(ArrayReportCds, 0);

  if Length(ArrayReportfrxDB) > 0 then
  begin
    for I := Low(ArrayReportfrxDB) to High(ArrayReportfrxDB) do
      TfrxDBDataset(ArrayReportfrxDB[I]).Free;
  end;
  SetLength(ArrayReportfrxDB, 0);

  TmpModifiedStream.Free;
  inherited Destroy;
end;

constructor TCommonReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TCommonReport.GenerateReportDataSets(ADtlClientDataSet: TClientDataSet; sBillType, sReportId: string);
var
  I, J,
  ARecordCout: Integer;
  ABookMark: TBookmark;
  TmpSQL   : string;
  vSQLVariant,
  vReturnData: OleVariant;
begin
  ABookMark := ADtlClientDataSet.GetBookmark;
  with ADtlClientDataSet do
  begin
    Filtered := False;
    Filter := ' rep_id = ' + QuotedStr(sReportId);
    Filtered := True;
  end;

  if Length(ArrayReportCds) > 0 then
  begin
    for I := Low(ArrayReportCds) to High(ArrayReportCds) do
      TClientDataSet(ArrayReportCds[I]).Free;
  end;
  SetLength(ArrayReportCds, 0);

  if Length(ArrayReportfrxDB) > 0 then
  begin
    for I := Low(ArrayReportfrxDB) to High(ArrayReportfrxDB) do
      TfrxDBDataset(ArrayReportfrxDB[I]).Free;
  end;
  SetLength(ArrayReportfrxDB, 0);

  ARecordCout := ADtlClientDataSet.RecordCount;
  if ARecordCout <> 0 then
  begin
    SetLength(ArrayReportCds, ARecordCout);
    SetLength(ArrayReportfrxDB, ARecordCout);

    vSQLVariant := VarArrayCreate([0, ARecordCout - 1], varVariant);
    ADtlClientDataSet.First;
    for I := 0 to ADtlClientDataSet.RecordCount - 1 do
    begin
      if ADtlClientDataSet.FieldByName('status').AsBoolean then
      begin
        TmpSQL := '';
        TmpSQL := ADtlClientDataSet.fieldbyname('sq_cmd').AsString;
        for J := VarArrayLowBound(Params, 1) to VarArrayHighBound(Params, 1) do
        begin
          TmpSQL := StringReplace(TmpSQL, Params[J][0], QuotedStr(Params[J][1]), [rfReplaceAll]);
        end;
        GenerateReportDataSet(ADtlClientDataSet.fieldbyname('dataset_name').AsString,
              TmpSQL, I, ArrayReportCds, ArrayReportfrxDB, vSQLVariant);
      end;
      ADtlClientDataSet.Next;
    end;
    ADtlClientDataSet.Filtered := False;
    ADtlClientDataSet.GotoBookmark(ABookMark);
    ADtlClientDataSet.FreeBookmark(ABookMark);

    vReturnData := DMHgSoftClient.FServerInterface.getClientDatas(vSQLVariant, null);
    for I := VarArrayLowBound(vReturnData, 1) to VarArrayHighBound(vReturnData, 1) do
      ArrayReportCds[I].Data := vReturnData[I];
  end;
end;

constructor TCommonReport.Create(AOwner: TComponent; AReportID: string; AReport: TfrxReport = nil);
var
  sSQLMst, sSQLDtl: string;
begin
  inherited Create(AOwner);
  TmpModifiedStream := TMemoryStream.Create;
  if AReport = nil then
  begin
    AfrxReportMain := TfrxReport.Create(Self);
    AfrxReportMain.AddFunction('function getBigMoney(aMoney: Extended): string;','getBigMoney','小写金额转大写的函数');
    AfrxReportMain.OnUserFunction := __frxReportUserFunction;
  end else
  begin
    ExternalFrxReport := AReport;
    ExternalFrxReport.AddFunction('function getBigMoney(aMoney: Extended): string;','getBigMoney','小写金额转大写的函数');
    ExternalFrxReport.OnUserFunction := __frxReportUserFunction;
  end;

  CdsMst := TClientDataSet.Create(Self);
  CdsDtl := TClientDataSet.Create(Self);

  CdsMst.RemoteServer := HgSoftClientDM.DMHgSoftClient.SktConnection;
  CdsMst.ProviderName := 'dspReportDefineMst'; //DSPCommon  DataSetProvider1
  CdsDtl.RemoteServer := HgSoftClientDM.DMHgSoftClient.SktConnection;
  CdsDtl.ProviderName := 'dspReportDefineDtl'; //DSPCommon

  sSQLMst := 'SELECT A.rep_id, A.name, A.bill_type_id, B.billname, A.report_file_id, C.name AS report_file,'
            +' C.report_file AS report,'
            +' A.is_default, A.status'
            +' FROM st_bill_commonrep_mst A'
			      +' LEFT JOIN st_codebaseinfo B ON A.bill_type_id = B.id'
			      +' LEFT JOIN st_report_file C ON A.report_file_id = C.id'
            +' WHERE 1 = 1'
            +' AND rep_id = ' + QuotedStr(AReportID)
            +' ORDER BY A.bill_type_id';
  sSQLDtl := ' SELECT * FROM st_bill_commonrep_dtl WHERE rep_id = ' + QuotedStr(AReportID);

  CdsMst.CommandText := sSQLMst;
  CdsDtl.CommandText := sSQLDtl;
  CdsMst.Open;
  CdsDtl.Open;
end;

function TCommonReport.__frxReportUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = UpperCase('getBigMoney') then
    Result := getBigMoney(Params[0]);
end;

procedure TCommonReport._CompressReport2DB(ASrcStream: TMemoryStream;
  ATmpReportFileId: string);
var
  ADestStream: TMemoryStream;
  cs         : TCompressionStream;
  num        : Integer;
  ACds       : TClientDataSet;
begin
  ADestStream := TMemoryStream.Create;
  num := ASrcStream.Size;
  ADestStream.Write(num, SizeOf(num));

  cs := TCompressionStream.Create(clMax, ADestStream);
  ASrcStream.SaveToStream(cs);
  cs.Free;

  ACds := TClientDataSet.Create(nil);
  ACds.RemoteServer := DMHgSoftClient.SktConnection;
  ACds.ProviderName := 'dspReportFileExt';      //DspCommon
  OpenClientDataSet(ACds, ' SELECT * FROM st_report_file WHERE id = '
                    + QuotedStr(ATmpReportFileId));
  try
    if ACds.RecordCount > 0 then
    begin
      ACds.Edit;
      TBlobField(ACds.FieldByName('report_file')).LoadFromStream(ADestStream);
      ACds.ApplyUpdates(0);
      Application.MessageBox('保存成功!', '提示', MB_OK + MB_ICONINFORMATION);
    end;
  finally
    ADestStream.Clear;
    ACds.Free;
    ADestStream.Free;
  end;
end;

procedure TCommonReport.__frxReportEndDoc(Sender: TObject);
begin
  if ExternalFrxReport <> nil then
    FreeAndNil(ACommonReport); 
end;

end.
