unit untformPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxLayoutContainer, dxLayoutControl, cxContainer,
  cxEdit, dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, StdCtrls, Mask,
  DBCtrls, cxMaskEdit, cxSpinEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox, DBClient,
  untEasyClientDataSet, cxCalendar, cxPCdxBarPopupMenu, cxPC, cxMemo;

type
  TForm3 = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    ADOConnection1: TADOConnection;
    MasterClientDataSet1: TMasterClientDataSet;
    ADOTable1: TADOTable;
    dsPart: TDataSource;
    edtPartCode: TcxDBTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edtPartCName: TcxDBTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtPartEName: TcxDBTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    cmbPartTypeGUID: TcxDBLookupComboBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    edtSpec: TcxDBTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutGroup;
    dxLayoutControl1Group4: TdxLayoutGroup;
    cmbDefaultUnit: TcxDBLookupComboBox;
    dxLayoutControl1Item6: TdxLayoutItem;
    cmbWeightUnit: TcxDBLookupComboBox;
    dxLayoutControl1Item7: TdxLayoutItem;
    spnUnitWeight: TcxDBSpinEdit;
    dxLayoutControl1Item8: TdxLayoutItem;
    edtVolumeUnit: TcxDBLookupComboBox;
    dxLayoutControl1Item9: TdxLayoutItem;
    spnUnitVolume: TcxDBSpinEdit;
    dxLayoutControl1Item10: TdxLayoutItem;
    spnNetWeight: TcxDBSpinEdit;
    dxLayoutControl1Item11: TdxLayoutItem;
    spnGrossWeight: TcxDBSpinEdit;
    dxLayoutControl1Item12: TdxLayoutItem;
    dedtEffectiveDate: TcxDBDateEdit;
    dxLayoutControl1Item13: TdxLayoutItem;
    edtDesignDrawingNo: TcxDBTextEdit;
    dxLayoutControl1Item14: TdxLayoutItem;
    dxLayoutControl1Group3: TdxLayoutGroup;
    edtDesignType: TcxDBTextEdit;
    dxLayoutControl1Item15: TdxLayoutItem;
    edtBarCode: TcxDBTextEdit;
    dxLayoutControl1Item16: TdxLayoutItem;
    dxLayoutControl1Group5: TdxLayoutGroup;
    cmbWarehouse: TcxDBLookupComboBox;
    dxLayoutControl1Item17: TdxLayoutItem;
    cmbStock: TcxDBLookupComboBox;
    dxLayoutControl1Item18: TdxLayoutItem;
    dxLayoutControl1Group6: TdxLayoutGroup;
    edtAbcTypeGUID: TcxDBLookupComboBox;
    dxLayoutControl1Item19: TdxLayoutItem;
    ckbIsEnable: TcxDBCheckBox;
    dxLayoutControl1Item20: TdxLayoutItem;
    spnOrderNo: TcxDBSpinEdit;
    dxLayoutControl1Item21: TdxLayoutItem;
    cmbInventoryWayGUID: TcxDBLookupComboBox;
    dxLayoutControl1Item22: TdxLayoutItem;
    spnInventoryCycle: TcxDBSpinEdit;
    dxLayoutControl1Item23: TdxLayoutItem;
    dxLayoutControl1Group8: TdxLayoutGroup;
    dedtInventoryDate: TcxDBDateEdit;
    dxLayoutControl1Item24: TdxLayoutItem;
    dedtExpiryDate: TcxDBDateEdit;
    dxLayoutControl1Item25: TdxLayoutItem;
    edtBatchNumber: TcxDBTextEdit;
    dxLayoutControl1Item26: TdxLayoutItem;
    spnBatchEffectiveDays: TcxDBSpinEdit;
    dxLayoutControl1Item27: TdxLayoutItem;
    dxLayoutControl1Group7: TdxLayoutGroup;
    spnBatchCheckCycle: TcxDBSpinEdit;
    dxLayoutControl1Item28: TdxLayoutItem;
    dedtLatestInDate: TcxDBDateEdit;
    dxLayoutControl1Item29: TdxLayoutItem;
    spnLatestInNumber: TcxDBSpinEdit;
    dxLayoutControl1Item30: TdxLayoutItem;
    dxLayoutControl1Group9: TdxLayoutGroup;
    dedtLastOutDate: TcxDBDateEdit;
    dxLayoutControl1Item31: TdxLayoutItem;
    spnLastOutNumber: TcxDBSpinEdit;
    dxLayoutControl1Item32: TdxLayoutItem;
    dedtLastCheckDate: TcxDBDateEdit;
    dxLayoutControl1Item33: TdxLayoutItem;
    mmLastCheckResult: TcxDBMemo;
    dxLayoutControl1Item34: TdxLayoutItem;
    dxLayoutControl1Group10: TdxLayoutGroup;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutControl1Item35: TdxLayoutItem;
    cxDBCheckBox2: TcxDBCheckBox;
    dxLayoutControl1Item36: TdxLayoutItem;
    dxLayoutControl1Group11: TdxLayoutGroup;
    cxDBCheckBox3: TcxDBCheckBox;
    dxLayoutControl1Item37: TdxLayoutItem;
    spnAvgDayConsumeNumber: TcxDBSpinEdit;
    dxLayoutControl1Item38: TdxLayoutItem;
    ckb: TcxDBCheckBox;
    dxLayoutControl1Item39: TdxLayoutItem;
    spnPlanningPrice: TcxDBSpinEdit;
    dxLayoutControl1Item40: TdxLayoutItem;
    dxLayoutControl1Group12: TdxLayoutGroup;
    spnPriceTopLimit: TcxDBSpinEdit;
    dxLayoutControl1Item41: TdxLayoutItem;
    cmbSupplier: TcxDBLookupComboBox;
    dxLayoutControl1Item42: TdxLayoutItem;
    edtSuppPartCode: TcxDBTextEdit;
    dxLayoutControl1Item43: TdxLayoutItem;
    ckbIsIndependentRequire: TcxDBCheckBox;
    dxLayoutControl1Item44: TdxLayoutItem;
    spnReplenishmentCycle: TcxDBSpinEdit;
    dxLayoutControl1Item45: TdxLayoutItem;
    cmbReplenishmentPolicy: TcxDBLookupComboBox;
    dxLayoutControl1Item46: TdxLayoutItem;
    dxLayoutControl1Group13: TdxLayoutGroup;
    spnOrderPoint: TcxDBSpinEdit;
    dxLayoutControl1Item47: TdxLayoutItem;
    spnOrderQuantity: TcxDBSpinEdit;
    dxLayoutControl1Item48: TdxLayoutItem;
    spnLeadTime: TcxDBSpinEdit;
    dxLayoutControl1Item49: TdxLayoutItem;
    spnSaleNumber: TcxDBSpinEdit;
    dxLayoutControl1Item50: TdxLayoutItem;
    spnProductNumber: TcxDBSpinEdit;
    dxLayoutControl1Item51: TdxLayoutItem;
    dxLayoutControl1Group14: TdxLayoutGroup;
    spnQtyMax: TcxDBSpinEdit;
    dxLayoutControl1Item52: TdxLayoutItem;
    cxDBSpinEdit1: TcxDBSpinEdit;
    dxLayoutControl1Item53: TdxLayoutItem;
    cmbDefaultRoutingGUID: TcxDBLookupComboBox;
    dxLayoutControl1Item54: TdxLayoutItem;
    cmbDefaultWorkTypeGUID: TcxDBLookupComboBox;
    dxLayoutControl1Item55: TdxLayoutItem;
    dxLayoutControl1Group15: TdxLayoutGroup;
    cmbAPAcctID: TcxDBLookupComboBox;
    dxLayoutControl1Item56: TdxLayoutItem;
    cmbARAcctID: TcxDBLookupComboBox;
    dxLayoutControl1Item57: TdxLayoutItem;
    ckbIsCanReplace: TcxDBCheckBox;
    dxLayoutControl1Item58: TdxLayoutItem;
    edtReplacePartCode: TcxDBTextEdit;
    dxLayoutControl1Item59: TdxLayoutItem;
    dxLayoutControl1Group16: TdxLayoutGroup;
    cxDBCheckBox4: TcxDBCheckBox;
    dxLayoutControl1Item60: TdxLayoutItem;
    cxDBCheckBox5: TcxDBCheckBox;
    dxLayoutControl1Item61: TdxLayoutItem;
    dxLayoutControl1Group17: TdxLayoutGroup;
    cxDBCheckBox6: TcxDBCheckBox;
    dxLayoutControl1Item62: TdxLayoutItem;
    spnSaleLowPrice: TcxDBSpinEdit;
    dxLayoutControl1Item63: TdxLayoutItem;
    cmbSaleLowMoneyType: TcxDBLookupComboBox;
    dxLayoutControl1Item64: TdxLayoutItem;
    spnSalePrice: TcxDBSpinEdit;
    dxLayoutControl1Item65: TdxLayoutItem;
    cmbChecker: TcxDBLookupComboBox;
    dxLayoutControl1Item66: TdxLayoutItem;
    cmbCheckType: TcxDBLookupComboBox;
    dxLayoutControl1Item67: TdxLayoutItem;
    dxLayoutControl1Group18: TdxLayoutGroup;
    cmbCheckProject: TcxDBLookupComboBox;
    dxLayoutControl1Item68: TdxLayoutItem;
    ckbIsKFPeriod: TcxDBCheckBox;
    dxLayoutControl1Item69: TdxLayoutItem;
    cxDBCheckBox7: TcxDBCheckBox;
    dxLayoutControl1Item70: TdxLayoutItem;
    edtEquipmentCode: TcxDBTextEdit;
    dxLayoutControl1Item71: TdxLayoutItem;
    cmbwwCheckType: TcxDBLookupComboBox;
    dxLayoutControl1Item72: TdxLayoutItem;
    dxLayoutControl1Group19: TdxLayoutGroup;
    spnwwHighPrice: TcxDBSpinEdit;
    dxLayoutControl1Item73: TdxLayoutItem;
    cmbwwHighPriceMoneyType: TcxDBLookupComboBox;
    dxLayoutControl1Item74: TdxLayoutItem;
    cmbWithDrawCheckType: TcxDBLookupComboBox;
    dxLayoutControl1Item75: TdxLayoutItem;
    spnStandardCost: TcxDBSpinEdit;
    dxLayoutControl1Item76: TdxLayoutItem;
    dxLayoutControl1Group20: TdxLayoutGroup;
    spnStandardManHour: TcxDBSpinEdit;
    dxLayoutControl1Item77: TdxLayoutItem;
    spnStdFixFeeRate: TcxDBSpinEdit;
    dxLayoutControl1Item78: TdxLayoutItem;
    spnStdPayRate: TcxDBSpinEdit;
    dxLayoutControl1Item79: TdxLayoutItem;
    cmbDefaultSaler: TcxDBLookupComboBox;
    dxLayoutControl1Item80: TdxLayoutItem;
    dxLayoutControl1Group21: TdxLayoutGroup;
    cmbDefaultCustomCode: TcxDBLookupComboBox;
    dxLayoutControl1Item81: TdxLayoutItem;
    edtCustomPartCode: TcxDBTextEdit;
    dxLayoutControl1Item82: TdxLayoutItem;
    ckbIsEquipment: TcxDBCheckBox;
    dxLayoutControl1Item83: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

end.
