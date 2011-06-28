unit untEasyStdCmpsReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, StdCtrls, DB,
  ComCtrls,dbcgrids, Tabs;

implementation

procedure RegisterAllClasses;
begin
  RegisterClass(TForm);
  RegisterClass(TGroupBox);
  RegisterClass(TPanel);
  RegisterClass(TScrollBox);
  RegisterClass(TLabel);
  RegisterClass(TButton);
  RegisterClass(TBitBtn);
  RegisterClass(TSpeedButton);
  RegisterClass(TStringGrid);
  RegisterClass(TImage);
  RegisterClass(TBevel);
  RegisterClass(TStaticText);
  RegisterClass(TTabControl);
  RegisterClass(TPageControl);
  RegisterClass(TTabSheet);
  RegisterClass(TDBNavigator);
  RegisterClass(TDBText);
  RegisterClass(TDBEdit);
  RegisterClass(TDBMemo);
  RegisterClass(TDBGrid);
  RegisterClass(TDBCtrlGrid);
  RegisterClass(TMemo);
  RegisterClass(TSplitter);
  RegisterClass(TCheckBox);
  RegisterClass(TEdit);
  RegisterClass(TListBox);
  RegisterClass(TComboBox);
  RegisterClass(TDateTimePicker);
  RegisterClass(TTabSet);
  RegisterClass(TTreeView);
  RegisterClass(TListView);

  RegisterClass(TDataSource);

{  RegisterClass(TEasyDevTextEdit);
  RegisterClass(TEasyDevMaskEdit);
  RegisterClass(TEasyDevMemo);
  RegisterClass(TEasyDevDateEdit);
  RegisterClass(TEasyDevTimeEdit);
  RegisterClass(TEasyDevButtonEdit);
  RegisterClass(TEasyDevComboBox);
  RegisterClass(TEasyDevImageComboBox);
  RegisterClass(TEasyDevLookupComboBox);
  RegisterClass(TEasyDevLookupComboBoxExt);
  RegisterClass(TEasyDevColorComboBox);
  RegisterClass(TEasyDevFontNameComboBox);
  RegisterClass(TEasyDevCheckComboBox);
  RegisterClass(TEasyDevShellComboBox);
  RegisterClass(TEasyDevSpinEdit);
  RegisterClass(TEasyDevCalcEdit);
  RegisterClass(TEasyDevHyperLinkEdit);
  RegisterClass(TEasyDevCurrencyEdit);
  RegisterClass(TEasyDevBlobEdit);
  RegisterClass(TEasyDevMRUEdit);
  RegisterClass(TEasyDevPopupEdit);
  RegisterClass(TEasyDevListBox);
  RegisterClass(TEasyDevCheckListBox);
  RegisterClass(TEasyDevRichEdit);
  RegisterClass(TEasyDevLabel);
  RegisterClass(TEasyDevImage);
  RegisterClass(TEasyDevCheckBox);
  RegisterClass(TEasyDevCheckGroup);
  RegisterClass(TEasyDevRadioButton);
  RegisterClass(TEasyDevRadioGroup);
  
  RegisterClass(TEasyDevDBTextEdit);
  RegisterClass(TEasyDevDBMaskEdit);
  RegisterClass(TEasyDevDBMemo);
  RegisterClass(TEasyDevDBDateEdit);
  RegisterClass(TEasyDevDBTimeEdit);
  RegisterClass(TEasyDevDBButtonEdit);
  RegisterClass(TEasyDevDBComboBox);
  RegisterClass(TEasyDevDBImageComboBox);
  RegisterClass(TEasyDevDBLookupComboBox);
  RegisterClass(TEasyDevDBLookupComboBoxExt);
  RegisterClass(TEasyDevDBColorComboBox);
  RegisterClass(TEasyDevDBFontNameComboBox);
  RegisterClass(TEasyDevDBCheckComboBox);
  RegisterClass(TEasyDevDBShellComboBox);
  RegisterClass(TEasyDevDBSpinEdit);
  RegisterClass(TEasyDevDBCalcEdit);
  RegisterClass(TEasyDevDBHyperLinkEdit);
  RegisterClass(TEasyDevDBCurrencyEdit);
  RegisterClass(TEasyDevDBBlobEdit);
  RegisterClass(TEasyDevDBMRUEdit);
  RegisterClass(TEasyDevDBPopupEdit);
  RegisterClass(TEasyDevDBListBox);
  RegisterClass(TEasyDevDBCheckListBox);
  RegisterClass(TEasyDevDBRichEdit);
  RegisterClass(TEasyDevDBLabel);
  RegisterClass(TEasyDevDBImage);
  RegisterClass(TEasyDevDBCheckBox);
  RegisterClass(TEasyDevDBCheckGroup);
  RegisterClass(TEasyDevDBRadioButton);
  RegisterClass(TEasyDevDBRadioGroup);   }
end;

procedure UnRegisterAllClasses;
begin
  UnRegisterClass(TForm);
  UnRegisterClass(TGroupBox);
  UnRegisterClass(TPanel);
  UnRegisterClass(TScrollBox);
  UnRegisterClass(TLabel);
  UnRegisterClass(TButton);
  UnRegisterClass(TBitBtn);
  UnRegisterClass(TSpeedButton);
  UnRegisterClass(TStringGrid);
  UnRegisterClass(TImage);
  UnRegisterClass(TBevel);
  UnRegisterClass(TStaticText);
  UnRegisterClass(TTabControl);
  UnRegisterClass(TPageControl);
  UnRegisterClass(TTabSheet);
  UnRegisterClass(TDBNavigator);
  UnRegisterClass(TDBText);
  UnRegisterClass(TDBEdit);
  UnRegisterClass(TDBMemo);
  UnRegisterClass(TDBGrid);
  UnRegisterClass(TDBCtrlGrid);
  UnRegisterClass(TMemo);
  UnRegisterClass(TSplitter);
  UnRegisterClass(TCheckBox);
  UnRegisterClass(TEdit);
  UnRegisterClass(TListBox);
  UnRegisterClass(TComboBox);
  UnRegisterClass(TDateTimePicker);
  UnRegisterClass(TTabSet);
  UnRegisterClass(TTreeView);
  UnRegisterClass(TListView);

  UnRegisterClass(TDataSource);

{  UnRegisterClass(TEasyDevTextEdit);
  UnRegisterClass(TEasyDevMaskEdit);
  UnRegisterClass(TEasyDevMemo);
  UnRegisterClass(TEasyDevDateEdit);
  UnRegisterClass(TEasyDevTimeEdit);
  UnRegisterClass(TEasyDevButtonEdit);
  UnRegisterClass(TEasyDevComboBox);
  UnRegisterClass(TEasyDevImageComboBox);
  UnRegisterClass(TEasyDevLookupComboBox);
  UnRegisterClass(TEasyDevLookupComboBoxExt);
  UnRegisterClass(TEasyDevColorComboBox);
  UnRegisterClass(TEasyDevFontNameComboBox);
  UnRegisterClass(TEasyDevCheckComboBox);
  UnRegisterClass(TEasyDevShellComboBox);
  UnRegisterClass(TEasyDevSpinEdit);
  UnRegisterClass(TEasyDevCalcEdit);
  UnRegisterClass(TEasyDevHyperLinkEdit);
  UnRegisterClass(TEasyDevCurrencyEdit);
  UnRegisterClass(TEasyDevBlobEdit);
  UnRegisterClass(TEasyDevMRUEdit);
  UnRegisterClass(TEasyDevPopupEdit);
  UnRegisterClass(TEasyDevListBox);
  UnRegisterClass(TEasyDevCheckListBox);
  UnRegisterClass(TEasyDevRichEdit);
  UnRegisterClass(TEasyDevLabel);
  UnRegisterClass(TEasyDevImage);
  UnRegisterClass(TEasyDevCheckBox);
  UnRegisterClass(TEasyDevCheckGroup);
  UnRegisterClass(TEasyDevRadioButton);
  UnRegisterClass(TEasyDevRadioGroup);
  
  UnRegisterClass(TEasyDevDBTextEdit);
  UnRegisterClass(TEasyDevDBMaskEdit);
  UnRegisterClass(TEasyDevDBMemo);
  UnRegisterClass(TEasyDevDBDateEdit);
  UnRegisterClass(TEasyDevDBTimeEdit);
  UnRegisterClass(TEasyDevDBButtonEdit);
  UnRegisterClass(TEasyDevDBComboBox);
  UnRegisterClass(TEasyDevDBImageComboBox);
  UnRegisterClass(TEasyDevDBLookupComboBox);
  UnRegisterClass(TEasyDevDBLookupComboBoxExt);
  UnRegisterClass(TEasyDevDBColorComboBox);
  UnRegisterClass(TEasyDevDBFontNameComboBox);
  UnRegisterClass(TEasyDevDBCheckComboBox);
  UnRegisterClass(TEasyDevDBShellComboBox);
  UnRegisterClass(TEasyDevDBSpinEdit);
  UnRegisterClass(TEasyDevDBCalcEdit);
  UnRegisterClass(TEasyDevDBHyperLinkEdit);
  UnRegisterClass(TEasyDevDBCurrencyEdit);
  UnRegisterClass(TEasyDevDBBlobEdit);
  UnRegisterClass(TEasyDevDBMRUEdit);
  UnRegisterClass(TEasyDevDBPopupEdit);
  UnRegisterClass(TEasyDevDBListBox);
  UnRegisterClass(TEasyDevDBCheckListBox);
  UnRegisterClass(TEasyDevDBRichEdit);
  UnRegisterClass(TEasyDevDBLabel);
  UnRegisterClass(TEasyDevDBImage);
  UnRegisterClass(TEasyDevDBCheckBox);
  UnRegisterClass(TEasyDevDBCheckGroup);
  UnRegisterClass(TEasyDevDBRadioButton);
  UnRegisterClass(TEasyDevDBRadioGroup); }
end;

initialization
  RegisterAllClasses();

finalization
  UnRegisterAllClasses();   

end.
