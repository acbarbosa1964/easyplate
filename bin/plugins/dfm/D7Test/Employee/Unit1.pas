unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxDBLookupComboBox, cxContainer, dxLayoutcxEditAdapters,
  cxSpinEdit, cxDBEdit, cxCheckBox, cxMemo, cxCurrencyEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxLayoutContainer, cxTextEdit,
  dxLayoutControl, cxSplitter, DBClient, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, ADODB, dxLayoutLookAndFeels, cxLookupEdit,
  cxDBLookupEdit, cxImage, cxCheckComboBox, cxDBCheckComboBox, cxBlobEdit,
  untEasyClientDataSet;

type
  TForm1 = class(TForm)
    dsHrEmployee: TDataSource;
    grdHrEmployee: TcxGrid;
    grdTVHrEmployee: TcxGridDBTableView;
    grdTVHrEmployeeEmployeeCode: TcxGridDBColumn;
    grdTVHrEmployeeEmployeeCName: TcxGridDBColumn;
    grdTVHrEmployeeCompanyGUID: TcxGridDBColumn;
    grdTVHrEmployeeDepartmentGUID: TcxGridDBColumn;
    grdTVHrEmployeePositionGUID: TcxGridDBColumn;
    grdHrEmployeeLevel1: TcxGridLevel;
    dsCompany: TDataSource;
    dsDept: TDataSource;
    dsPostion: TDataSource;
    cdsCompany: TClientDataSet;
    cdsDept: TClientDataSet;
    cdsPostion: TClientDataSet;
    cxSplitter1: TcxSplitter;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    cxDBTextEdit2: TcxDBTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxDBTextEdit7: TcxDBTextEdit;
    dxLayoutControl1Item9: TdxLayoutItem;
    cxDBTextEdit10: TcxDBTextEdit;
    dxLayoutControl1Item12: TdxLayoutItem;
    cxDBTextEdit13: TcxDBTextEdit;
    dxLayoutControl1Item15: TdxLayoutItem;
    cxDBTextEdit14: TcxDBTextEdit;
    dxLayoutControl1Item17: TdxLayoutItem;
    cxDBTextEdit15: TcxDBTextEdit;
    dxLayoutControl1Item18: TdxLayoutItem;
    cxDBTextEdit16: TcxDBTextEdit;
    dxLayoutControl1Item19: TdxLayoutItem;
    cxDBTextEdit17: TcxDBTextEdit;
    dxLayoutControl1Item20: TdxLayoutItem;
    cxDBTextEdit18: TcxDBTextEdit;
    dxLayoutControl1Item21: TdxLayoutItem;
    cxDBTextEdit23: TcxDBTextEdit;
    dxLayoutControl1Item26: TdxLayoutItem;
    cxDBTextEdit24: TcxDBTextEdit;
    dxLayoutControl1Item27: TdxLayoutItem;
    cxDBDateEdit2: TcxDBDateEdit;
    dxLayoutControl1Item30: TdxLayoutItem;
    cxDBDateEdit3: TcxDBDateEdit;
    dxLayoutControl1Item31: TdxLayoutItem;
    cxDBDateEdit4: TcxDBDateEdit;
    dxLayoutControl1Item32: TdxLayoutItem;
    cxDBTextEdit27: TcxDBTextEdit;
    dxLayoutControl1Item33: TdxLayoutItem;
    cxDBDateEdit5: TcxDBDateEdit;
    dxLayoutControl1Item34: TdxLayoutItem;
    cxDBDateEdit6: TcxDBDateEdit;
    dxLayoutControl1Item37: TdxLayoutItem;
    cxDBTextEdit32: TcxDBTextEdit;
    dxLayoutControl1Item40: TdxLayoutItem;
    cxDBCheckBox1: TcxDBCheckBox;
    dxLayoutControl1Item42: TdxLayoutItem;
    cxDBSpinEdit1: TcxDBSpinEdit;
    dxLayoutControl1Item43: TdxLayoutItem;
    cxDBSpinEdit2: TcxDBSpinEdit;
    dxLayoutControl1Item44: TdxLayoutItem;
    cxDBTextEdit34: TcxDBTextEdit;
    dxLayoutControl1Item45: TdxLayoutItem;
    cxDBTextEdit35: TcxDBTextEdit;
    dxLayoutControl1Item46: TdxLayoutItem;
    cxDBTextEdit37: TcxDBTextEdit;
    dxLayoutControl1Item49: TdxLayoutItem;
    cxDBTextEdit38: TcxDBTextEdit;
    dxLayoutControl1Item50: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    dxLayoutControl1Group2: TdxLayoutGroup;
    dxLayoutControl1Group3: TdxLayoutGroup;
    dxLayoutControl1Group4: TdxLayoutGroup;
    dxLayoutControl1Group6: TdxLayoutGroup;
    dxLayoutControl1Group7: TdxLayoutGroup;
    dxLayoutControl1Group9: TdxLayoutGroup;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxDBSpinEdit3: TcxDBSpinEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    dxLayoutControl1Item7: TdxLayoutItem;
    cxDBMaskEdit1: TcxDBMaskEdit;
    dxLayoutControl1Item8: TdxLayoutItem;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    dxLayoutControl1Item10: TdxLayoutItem;
    cxDBImage1: TcxDBImage;
    dxLayoutControl1Item11: TdxLayoutItem;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    dxLayoutControl1Item14: TdxLayoutItem;
    cxDBLookupComboBox6: TcxDBLookupComboBox;
    dxLayoutControl1Item13: TdxLayoutItem;
    dxLayoutControl1Group8: TdxLayoutGroup;
    dxLayoutControl1Group11: TdxLayoutGroup;
    cxDBLookupComboBox7: TcxDBLookupComboBox;
    dxLayoutControl1Item16: TdxLayoutItem;
    cxDBLookupComboBox8: TcxDBLookupComboBox;
    dxLayoutControl1Item22: TdxLayoutItem;
    cxDBCheckComboBox1: TcxDBCheckComboBox;
    dxLayoutControl1Item23: TdxLayoutItem;
    cxDBLookupComboBox9: TcxDBLookupComboBox;
    dxLayoutControl1Item24: TdxLayoutItem;
    cxDBLookupComboBox10: TcxDBLookupComboBox;
    dxLayoutControl1Item25: TdxLayoutItem;
    cxDBLookupComboBox11: TcxDBLookupComboBox;
    dxLayoutControl1Item28: TdxLayoutItem;
    cxDBLookupComboBox12: TcxDBLookupComboBox;
    dxLayoutControl1Item29: TdxLayoutItem;
    cxDBLookupComboBox13: TcxDBLookupComboBox;
    dxLayoutControl1Item35: TdxLayoutItem;
    cxDBLookupComboBox14: TcxDBLookupComboBox;
    dxLayoutControl1Item36: TdxLayoutItem;
    cxDBLookupComboBox15: TcxDBLookupComboBox;
    dxLayoutControl1Item38: TdxLayoutItem;
    cxDBBlobEdit1: TcxDBBlobEdit;
    dxLayoutControl1Item39: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Group5: TdxLayoutGroup;
    dxLayoutControl1Group10: TdxLayoutGroup;
    dxLayoutControl1Group12: TdxLayoutGroup;
    dxLayoutControl1Group13: TdxLayoutGroup;
    dxLayoutControl1Group14: TdxLayoutGroup;
    dxLayoutControl1Group15: TdxLayoutGroup;
    dxLayoutControl1Group17: TdxLayoutGroup;
    dxLayoutControl1Group16: TdxLayoutGroup;
    dxLayoutControl1Group18: TdxLayoutGroup;
    dxLayoutControl1Group20: TdxLayoutGroup;
    dxLayoutControl1Group19: TdxLayoutGroup;
    dsNation: TDataSource;
    cdsNation: TClientDataSet;
    cdsSex: TClientDataSet;
    dsSex: TDataSource;
    cdsMarry: TClientDataSet;
    dsMarry: TDataSource;
    cdsBrood: TClientDataSet;
    dsBrood: TDataSource;
    cdsPolityStatus: TClientDataSet;
    dsPolityStatus: TDataSource;
    cdsStudyExperience: TClientDataSet;
    dsStudyExperience: TDataSource;
    cdsInService: TClientDataSet;
    dsInService: TDataSource;
    cdsEmployeeType: TClientDataSet;
    dsEmployeeType: TDataSource;
    cdsResidenceType: TClientDataSet;
    dsResidenceType: TDataSource;
    cdsCallTitle: TClientDataSet;
    dsCallTitle: TDataSource;
    cdsForeignLangaugeLevel: TClientDataSet;
    dsForeignLangaugeLevel: TDataSource;
    cdsComputerTechnolic: TClientDataSet;
    dsComputerTechnolic: TDataSource;
    cdsHrEmployee: TMasterClientDataSet;
    gcdsCompany: TGangedClientDataSet;
    gcdsDept: TGangedClientDataSet;
    gcdsPost: TGangedClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
