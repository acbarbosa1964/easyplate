unit untEasyStdCmpsReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, StdCtrls, DB,
  ComCtrls,dbcgrids, Tabs, cxLabel, cxTrackBar, cxControls, cxBlobEdit,
  cxButtonEdit, cxButtons, cxCalc, cxCalendar, cxCheckBox, ADODB,
  cxContainer, cxCurrencyEdit, cxDB, cxDBEdit, cxDBLookupComboBox,
  cxDBNavigator, cxDropDownEdit, cxGroupBox, cxHyperLinkEdit, cxImage,
  cxImageComboBox, cxListBox, cxLookupDBGrid, cxTextEdit,
  cxLookupGrid, cxMaskEdit, cxMemo, cxMRUEdit, cxNavigator, 
  cxRadioGroup, cxSpinEdit, cxTimeEdit,
  cxCheckComboBox, cxCheckGroup,
  cxCheckListBox, cxColorComboBox,
  cxDBCheckComboBox, cxDBCheckGroup, cxDBCheckListBox,
  cxDBColorComboBox, cxDBFontNameComboBox, cxDBLabel, cxDBProgressBar,
  cxDBRichEdit, cxDBTrackBar, cxEdit, cxFontNameComboBox,
  cxListView, cxMCListBox, cxProgressBar,
  cxRichEdit, cxScrollBar, cxSpinButton, cxSplitter, 
  cxTreeView, cxGrid, cxDBExtLookupComboBox,
  cxGridPopupMenu, cxGridCustomPopUpMenu, dxLayoutControl,
  cxPC,  cxDBPivotGrid, cxPivotGrid, cxPivotGridSummaryDataSet,
  cxPivotGridChartConnection, cxPivotGridDrillDownDataSet,
  cxPivotGridOLAPDataSource,
  cxScheduler, cxSchedulerStorage, cxSchedulerDBStorage,
  cxSchedulercxGridConnection, cxSchedulerAggregateStorage, cxDateNavigator,
  cxSchedulerHolidays, cxTL, cxDBTL, cxTLData,
  cxVGrid, cxDBVGrid, cxOI,
  cxFilterControl,
  cxDBFilterControl, cxDBShellComboBox,
  cxShellBrowserDialog, cxShellComboBox,
  cxShellCommon, cxShellEditRepositoryItems, cxShellListView, cxShellTreeView,
  dxorgchr, dxdborgc, dxorgced, untEasyGrid, untEasyDBGrid,
  dxLayoutLookAndFeels, dxLayoutSelection;

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
  
  RegisterClass(TcxLabel);
  RegisterClass(TcxTrackBar);

  RegisterClass(TcxTextEdit);
  RegisterClass(TcxMaskEdit);
  RegisterClass(TcxMemo);
  RegisterClass(TcxDateEdit);
  RegisterClass(TcxButtonEdit);
  RegisterClass(TcxCheckBox);
  RegisterClass(TcxComboBox);
  RegisterClass(TcxImageComboBox);
  RegisterClass(TcxSpinEdit);
  RegisterClass(TcxCalcEdit);
  RegisterClass(TcxHyperLinkEdit);
  RegisterClass(TcxTimeEdit);
  RegisterClass(TcxCurrencyEdit);
  RegisterClass(TcxImage);
  RegisterClass(TcxBlobEdit);
  RegisterClass(TcxMRUEdit);
  RegisterClass(TcxPopupEdit);
  RegisterClass(TcxLookupComboBox);
  RegisterClass(TcxRadioButton);
  RegisterClass(TcxRadioGroup);
  RegisterClass(TcxListBox);
  RegisterClass(TcxNavigator);
  RegisterClass(TcxDBTextEdit);
  RegisterClass(TcxDBMaskEdit);
  RegisterClass(TcxDBMemo);
  RegisterClass(TcxDBDateEdit);
  RegisterClass(TcxDBButtonEdit);
  RegisterClass(TcxDBCheckBox);
  RegisterClass(TcxDBComboBox);
  RegisterClass(TcxDBImageComboBox);
  RegisterClass(TcxDBSpinEdit);
  RegisterClass(TcxDBCalcEdit);
  RegisterClass(TcxDBHyperLinkEdit);
  RegisterClass(TcxDBTimeEdit);
  RegisterClass(TcxDBCurrencyEdit);
  RegisterClass(TcxDBImage);
  RegisterClass(TcxDBBlobEdit);
  RegisterClass(TcxDBMRUEdit);
  RegisterClass(TcxDBPopupEdit);
  RegisterClass(TcxDBLookupComboBox);
//  RegisterClass(TcxDBRadioButton);
  RegisterClass(TcxDBRadioGroup);
  RegisterClass(TcxDBListBox);
  RegisterClass(TcxDBNavigator);
  RegisterClass(TcxButton);
  RegisterClass(TcxGroupBox);

  RegisterClass(TADOConnection);
  RegisterClass(TADOCommand);
  RegisterClass(TADODataSet);
  RegisterClass(TADOTable);
  RegisterClass(TADOQuery);
  RegisterClass(TADOStoredProc);
//  RegisterClass();
//  TADOConnection, TADOCommand, TADODataSet,
//    TADOTable, TADOQuery, TADOStoredProc, TRDSConnection

//TcxLabel, TcxProgressBar, TcxTrackBar,
//    TcxCheckListBox, TcxColorComboBox, TcxFontNameComboBox, TcxCheckComboBox,
//    TcxCheckGroup, TcxRichEdit
  RegisterClass(TcxProgressBar);
  RegisterClass(TcxTrackBar);
  RegisterClass(TcxCheckListBox);
  RegisterClass(TcxColorComboBox);
  RegisterClass(TcxFontNameComboBox);
  RegisterClass(TcxCheckComboBox);
  RegisterClass(TcxCheckGroup);
  RegisterClass(TcxRichEdit);
//TcxDBLabel, TcxDBProgressBar, TcxDBTrackBar,
//    TcxDBCheckListBox, TcxDBColorComboBox, TcxDBFontNameComboBox, TcxDBCheckComboBox,
//    TcxDBCheckGroup, TcxDBRichEdit
  RegisterClass(TcxDBLabel);
  RegisterClass(TcxDBProgressBar);
  RegisterClass(TcxDBTrackBar);
  RegisterClass(TcxDBCheckListBox);
  RegisterClass(TcxDBColorComboBox);
  RegisterClass(TcxDBFontNameComboBox);
  RegisterClass(TcxDBCheckComboBox);
  RegisterClass(TcxDBCheckGroup);
  RegisterClass(TcxDBRichEdit);
//TcxHintStyleController, TcxSpinButton,
//    TcxMCListBox, TcxListView, TcxTreeView, TcxHeader, TcxSplitter
  RegisterClass(TcxSpinButton);
  RegisterClass(TcxMCListBox);
  RegisterClass(TcxListView);
  RegisterClass(TcxTreeView);
  RegisterClass(TcxSplitter);

//  TcxGridPopupMenu
  RegisterClass(TcxGridPopupMenu);

  RegisterClass(TcxGrid);
  RegisterClass(TcxExtLookupComboBox);
  RegisterClass(TcxDBExtLookupComboBox);
  //TdxLayoutControl TdxLayoutLookAndFeelList
  RegisterClass(TdxLayoutControl);
  //TdxLayoutItem, TdxLayoutEmptySpaceItem, TdxLayoutLabeledItem, TdxLayoutSeparatorItem, TdxLayoutSplitterItem,
//    TdxLayoutGroup, TdxLayoutAlignmentConstraint,
//    TdxLayoutStandardLookAndFeel, TdxLayoutOfficeLookAndFeel, TdxLayoutWebLookAndFeel
  RegisterClass(TdxLayoutLookAndFeelList);
  RegisterClass(TdxLayoutItem);
  RegisterClass(TdxLayoutEmptySpaceItem);
  RegisterClass(TdxLayoutLabeledItem);
  RegisterClass(TdxLayoutSeparatorItem);
  RegisterClass(TdxLayoutSplitterItem);
  RegisterClass(TdxLayoutGroup);
  RegisterClass(TdxLayoutAlignmentConstraint);
  RegisterClass(TdxLayoutStandardLookAndFeel);
  RegisterClass(TdxLayoutOfficeLookAndFeel);
  RegisterClass(TdxLayoutWebLookAndFeel);
  //TcxTabControl, TcxPageControl
  RegisterClass(TcxTabControl);
  RegisterClass(TcxPageControl);
//TcxPivotGrid, TcxDBPivotGrid,
//    TcxPivotGridSummaryDataSet, TcxPivotGridDrillDownDataSet
  RegisterClass(TcxPivotGrid);
  RegisterClass(TcxDBPivotGrid);
  RegisterClass(TcxPivotGridSummaryDataSet);
  RegisterClass(TcxPivotGridDrillDownDataSet);
  RegisterClass(TcxPivotGridChartConnection);     
//TcxPivotGridOLAPDataSource
  RegisterClass(TcxPivotGridOLAPDataSource);
//TcxSchedulerAggregateStorage, TcxSchedulerStorage, TcxSchedulerDBStorage,
//    TcxScheduler, TcxDateNavigator, TcxSchedulerHolidays
  RegisterClass(TcxSchedulerAggregateStorage);
  RegisterClass(TcxSchedulerStorage);
  RegisterClass(TcxSchedulerDBStorage);
  RegisterClass(TcxScheduler);
  RegisterClass(TcxDateNavigator);
  RegisterClass(TcxSchedulerHolidays);
  //
  RegisterClass(TcxTreeList);
  RegisterClass(TcxDBTreeList);
  RegisterClass(TcxVirtualTreeList);
//TcxVerticalGrid,
//    TcxVirtualVerticalGrid, TcxDBVerticalGrid, TcxRTTIInspector
  RegisterClass(TcxVerticalGrid);
  RegisterClass(TcxVirtualVerticalGrid);
  RegisterClass(TcxDBVerticalGrid);
  RegisterClass(TcxRTTIInspector);
//  TdxOrgChart, TdxDbOrgChart
  RegisterClass(TdxOrgChart);
  RegisterClass(TdxDbOrgChart);
//  TcxShellComboBox, TcxDBShellComboBox,
//  TcxShellListView, TcxShellTreeView, TcxShellBrowserDialog
//TEasyStringGrid, TEasyDBGrid
//TcxFilterControl, TcxDBFilterControl
  RegisterClass(TcxShellComboBox);
  RegisterClass(TcxDBShellComboBox);
  RegisterClass(TcxShellListView);
  RegisterClass(TcxShellTreeView);
  RegisterClass(TcxShellBrowserDialog);
  RegisterClass(TEasyStringGrid);
  RegisterClass(TcxFilterControl);
  RegisterClass(TcxDBFilterControl);
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

  UnRegisterClass(TcxLabel);
  UnRegisterClass(TcxTrackBar);

  UnRegisterClass(TcxTextEdit);
  UnRegisterClass(TcxMaskEdit);
  UnRegisterClass(TcxMemo);
  UnRegisterClass(TcxDateEdit);
  UnRegisterClass(TcxButtonEdit);
  UnRegisterClass(TcxCheckBox);
  UnRegisterClass(TcxComboBox);
  UnRegisterClass(TcxImageComboBox);
  UnRegisterClass(TcxSpinEdit);
  UnRegisterClass(TcxCalcEdit);
  UnRegisterClass(TcxHyperLinkEdit);
  UnRegisterClass(TcxTimeEdit);
  UnRegisterClass(TcxCurrencyEdit);
  UnRegisterClass(TcxImage);
  UnRegisterClass(TcxBlobEdit);
  UnRegisterClass(TcxMRUEdit);
  UnRegisterClass(TcxPopupEdit);
  UnRegisterClass(TcxLookupComboBox);
  UnRegisterClass(TcxRadioButton);
  UnRegisterClass(TcxRadioGroup);
  UnRegisterClass(TcxListBox);
  UnRegisterClass(TcxNavigator);
  UnRegisterClass(TcxDBTextEdit);
  UnRegisterClass(TcxDBMaskEdit);
  UnRegisterClass(TcxDBMemo);
  UnRegisterClass(TcxDBDateEdit);
  UnRegisterClass(TcxDBButtonEdit);
  UnRegisterClass(TcxDBCheckBox);
  UnRegisterClass(TcxDBComboBox);
  UnRegisterClass(TcxDBImageComboBox);
  UnRegisterClass(TcxDBSpinEdit);
  UnRegisterClass(TcxDBCalcEdit);
  UnRegisterClass(TcxDBHyperLinkEdit);
  UnRegisterClass(TcxDBTimeEdit);
  UnRegisterClass(TcxDBCurrencyEdit);
  UnRegisterClass(TcxDBImage);
  UnRegisterClass(TcxDBBlobEdit);
  UnRegisterClass(TcxDBMRUEdit);
  UnRegisterClass(TcxDBPopupEdit);
  UnRegisterClass(TcxDBLookupComboBox);
//  UnRegisterClass(TcxDBRadioButton);
  UnRegisterClass(TcxDBRadioGroup);
  UnRegisterClass(TcxDBListBox);
  UnRegisterClass(TcxDBNavigator);
  UnRegisterClass(TcxButton);
  UnRegisterClass(TcxGroupBox);

  UnRegisterClass(TADOConnection);
  UnRegisterClass(TADOCommand);
  UnRegisterClass(TADODataSet);
  UnRegisterClass(TADOTable);
  UnRegisterClass(TADOQuery);
  UnRegisterClass(TADOStoredProc);
//TcxLabel, TcxProgressBar, TcxTrackBar,
//    TcxCheckListBox, TcxColorComboBox, TcxFontNameComboBox, TcxCheckComboBox,
//    TcxCheckGroup, TcxRichEdit
  UnRegisterClass(TcxProgressBar);
  UnRegisterClass(TcxTrackBar);
  UnRegisterClass(TcxCheckListBox);
  UnRegisterClass(TcxColorComboBox);
  UnRegisterClass(TcxFontNameComboBox);
  UnRegisterClass(TcxCheckComboBox);
  UnRegisterClass(TcxCheckGroup);
  UnRegisterClass(TcxRichEdit);
//TcxDBLabel, TcxDBProgressBar, TcxDBTrackBar,
//    TcxDBCheckListBox, TcxDBColorComboBox, TcxDBFontNameComboBox, TcxDBCheckComboBox,
//    TcxDBCheckGroup, TcxDBRichEdit
  UnRegisterClass(TcxDBLabel);
  UnRegisterClass(TcxDBProgressBar);
  UnRegisterClass(TcxDBTrackBar);
  UnRegisterClass(TcxDBCheckListBox);
  UnRegisterClass(TcxDBColorComboBox);
  UnRegisterClass(TcxDBFontNameComboBox);
  UnRegisterClass(TcxDBCheckComboBox);
  UnRegisterClass(TcxDBCheckGroup);
  UnRegisterClass(TcxDBRichEdit);
//TcxHintStyleController, TcxSpinButton,
//    TcxMCListBox, TcxListView, TcxTreeView, TcxHeader, TcxSplitter
  UnRegisterClass(TcxSpinButton);
  UnRegisterClass(TcxMCListBox);
  UnRegisterClass(TcxListView);
  UnRegisterClass(TcxTreeView);
  UnRegisterClass(TcxSplitter);
//  TcxGridPopupMenu
  UnRegisterClass(TcxGridPopupMenu);
  //
  UnRegisterClass(TcxGrid);
  UnRegisterClass(TcxExtLookupComboBox);
  UnRegisterClass(TcxDBExtLookupComboBox);
  //TdxLayoutControl
  UnRegisterClass(TdxLayoutControl);
  //TcxTabControl, TcxPageControl
  UnRegisterClass(TcxTabControl);
  UnRegisterClass(TcxPageControl);
//TcxPivotGrid, TcxDBPivotGrid,
//    TcxPivotGridSummaryDataSet, TcxPivotGridDrillDownDataSet
  UnRegisterClass(TcxPivotGrid);
  UnRegisterClass(TcxDBPivotGrid);
  UnRegisterClass(TcxPivotGridSummaryDataSet);
  UnRegisterClass(TcxPivotGridDrillDownDataSet);
  UnRegisterClass(TcxPivotGridChartConnection);
//TcxPivotGridOLAPDataSource
  UnRegisterClass(TcxPivotGridOLAPDataSource);
//TcxSchedulerAggregateStorage, TcxSchedulerStorage, TcxSchedulerDBStorage,
//    TcxScheduler, TcxDateNavigator, TcxSchedulerHolidays
  UnRegisterClass(TcxSchedulerAggregateStorage);
  UnRegisterClass(TcxSchedulerStorage);
  UnRegisterClass(TcxSchedulerDBStorage);
  UnRegisterClass(TcxScheduler);
  UnRegisterClass(TcxDateNavigator);
  UnRegisterClass(TcxSchedulerHolidays);
//TcxTreeList, TcxDBTreeList, TcxVirtualTreeList
  UnRegisterClass(TcxTreeList);
  UnRegisterClass(TcxDBTreeList);
  UnRegisterClass(TcxVirtualTreeList);
//TcxVerticalGrid,
//    TcxVirtualVerticalGrid, TcxDBVerticalGrid, TcxRTTIInspector
  UnRegisterClass(TcxVerticalGrid);
  UnRegisterClass(TcxVirtualVerticalGrid);
  UnRegisterClass(TcxDBVerticalGrid);
  UnRegisterClass(TcxRTTIInspector);
//  TdxOrgChart, TdxDbOrgChart
  UnRegisterClass(TdxOrgChart);
  UnRegisterClass(TdxDbOrgChart);
//  TdxOrgChart, TdxDbOrgChart
  UnRegisterClass(TdxOrgChart);
  UnRegisterClass(TdxDbOrgChart);
//  TcxShellComboBox, TcxDBShellComboBox,
//  TcxShellListView, TcxShellTreeView, TcxShellBrowserDialog
//TEasyStringGrid, TEasyDBGrid
//TcxFilterControl, TcxDBFilterControl
  UnRegisterClass(TcxShellComboBox);
  UnRegisterClass(TcxDBShellComboBox);
  UnRegisterClass(TcxShellListView);
  UnRegisterClass(TcxShellTreeView);
  UnRegisterClass(TcxShellBrowserDialog);
  UnRegisterClass(TEasyStringGrid);
  UnRegisterClass(TcxFilterControl);
  UnRegisterClass(TcxDBFilterControl);
  //TdxLayoutItem, TdxLayoutEmptySpaceItem, TdxLayoutLabeledItem, TdxLayoutSeparatorItem, TdxLayoutSplitterItem,
//    TdxLayoutGroup, TdxLayoutAlignmentConstraint,
//    TdxLayoutStandardLookAndFeel, TdxLayoutOfficeLookAndFeel, TdxLayoutWebLookAndFeel
  UnRegisterClass(TdxLayoutLookAndFeelList);
  UnRegisterClass(TdxLayoutItem);
  UnRegisterClass(TdxLayoutEmptySpaceItem);
  UnRegisterClass(TdxLayoutLabeledItem);
  UnRegisterClass(TdxLayoutSeparatorItem);
  UnRegisterClass(TdxLayoutSplitterItem);
  UnRegisterClass(TdxLayoutGroup);
  UnRegisterClass(TdxLayoutAlignmentConstraint);
  UnRegisterClass(TdxLayoutStandardLookAndFeel);
  UnRegisterClass(TdxLayoutOfficeLookAndFeel);
  UnRegisterClass(TdxLayoutWebLookAndFeel);
end;

initialization
  RegisterAllClasses();

finalization
  UnRegisterAllClasses();

end.
