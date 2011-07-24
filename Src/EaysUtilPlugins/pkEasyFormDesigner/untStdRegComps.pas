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
unit untStdRegComps;

interface

{$DEFINE FD_REGISTER_STD}
{$DEFINE FD_REGISTER_STD_EDITORS}
{$DEFINE FD_REGISTER_DDE}
{$DEFINE FD_REGISTER_DB}
{$DEFINE FD_REGISTER_BDE}
{$DEFINE FD_REGISTER_ADO}
{$DEFINE FD_REGISTER_ECONTROL_SYNTEDIT}
{$DEFINE FD_REGISTER_ECONTROL_FORMDESIGNER}
{.$DEFINE FD_REGISTER_DEVEX_GRIDS}
{.$DEFINE FD_REGISTER_DEVEX_EDITS}

implementation
{$R DclStd.res}
{$R ./dcr/cxGridReg.dcr}
uses
  Classes, Graphics, Controls, Forms, Dialogs, ActnList, ComCtrls,
  Menus, StdCtrls, ImgList, Buttons, ExtCtrls, Tabs, ExtDlgs, Mask,
  Grids, CheckLst, AppEvnts, MPlayer, OleCtnrs, ADODB, DB, DBClient, 
  StdDsnEditors, DesignEditors, DesignIntf, untEasyGrid, untEasyDBGrid, 
  cxControls, cxBlobEdit, cxButtonEdit, cxButtons, cxCalc, cxCalendar, cxCheckBox,
  cxContainer, cxCurrencyEdit, cxDB, cxDBEdit, cxDBEditRepository, cxDBLookupComboBox,
  cxDBNavigator, cxDropDownEdit, cxEditConsts, cxEditRepositoryEditor,
  cxEditRepositoryItems, cxGraphics, cxGroupBox, cxHyperLinkEdit, cxImage,
  cxImageComboBox, cxLibraryReg, cxListBox, cxLookAndFeels, cxLookupDBGrid,
  cxLookupGrid, cxMaskEdit, cxMemo, cxMRUEdit, cxNavigator, cxPropEditors,
  cxRadioGroup, cxSpinEdit, cxTextEdit, cxTimeEdit, dxtree, dxDBTree, dxDBTrel,
  cxCheckComboBox, cxCheckGroup,
  cxCheckGroupStatesEditor, cxCheckListBox, cxClasses, cxColorComboBox,
  cxDBCheckComboBox, cxDBCheckGroup, cxDBCheckListBox,
  cxDBColorComboBox, cxDBFontNameComboBox, cxDBLabel, cxDBProgressBar,
  cxDBRichEdit, cxDBTrackBar, cxEdit, 
  cxExtEditConsts, cxExtEditRepositoryItems, cxFontNameComboBox, cxHeader, cxHint,
  cxHintEditor, cxLabel, cxListView, cxMCListBox, cxProgressBar,
  cxRichEdit, cxScrollBar, cxSpinButton, cxSplitter, cxSplitterEditor,
  cxTrackBar, cxTreeView,
  cxFilterControl,
  cxDBFilterControl, cxEditPropEditors,
  dxCore, cxDBShellComboBox,
  cxShellBrowserDialog, cxShellComboBox,
  cxShellCommon, cxShellEditRepositoryItems, cxShellListView, cxShellTreeView,
  cxGrid, cxGridBandedTableView,
  cxGridCardView, cxGridCommon, cxGridCustomTableView, cxGridCustomView, cxGridChartView,
  cxGridEditor, cxGridLevel, cxGridStrs, cxGridStructureNavigator,
  cxGridTableView, cxBandedTableViewEditor, cxCardViewEditor,
  cxChartViewEditor, cxGridPredefinedStyles, cxGridStyleSheetsPreview, cxGridExportLink,
  cxDBData, cxDBExtLookupComboBox, cxGridDBBandedTableView,
  cxGridDBCardView, cxGridDBDataDefinitions, cxGridDBTableView, cxGridDBChartView,
  dxLayoutCommon, dxLayoutLookAndFeels, dxLayoutEditForm, dxLayoutControl,
  dxLayoutLookAndFeelListDesignForm, dxLayoutSelection, dxLayoutImport,
  untStdRegEditors, dxorgchr, dxdborgc, dxorgced, cxGridPopupMenu, cxGridCustomPopUpMenu,
  untEasyADOReg, TreeIntf, DiagramSupport, DsnDb,
  untEasyDesignerGridPopuMenuReg;

procedure RegisterEditRepositoryItems;
begin
  RegisterEditRepositoryItem(TcxEditRepositoryTextItem, scxSEditRepositoryTextItem);
  RegisterEditRepositoryItem(TcxEditRepositoryButtonItem, scxSEditRepositoryButtonItem);
  RegisterEditRepositoryItem(TcxEditRepositoryImageItem, scxSEditRepositoryImageItem);
  RegisterEditRepositoryItem(TcxEditRepositoryComboBoxItem, scxSEditRepositoryComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMaskItem, scxSEditRepositoryMaskItem);
  RegisterEditRepositoryItem(TcxEditRepositoryPopupItem, scxSEditRepositoryPopupItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCalcItem, scxSEditRepositoryCalcItem);
  RegisterEditRepositoryItem(TcxEditRepositoryDateItem, scxSEditRepositoryDateItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCurrencyItem, scxSEditRepositoryCurrencyItem);
  RegisterEditRepositoryItem(TcxEditRepositorySpinItem, scxSEditRepositorySpinItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMemoItem, scxSEditRepositoryMemoItem);
  RegisterEditRepositoryItem(TcxEditRepositoryImageComboBoxItem, scxSEditRepositoryImageComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryBlobItem, scxSEditRepositoryBlobItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCheckBoxItem, scxSEditRepositoryCheckBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryTimeItem, scxSEditRepositoryTimeItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMRUItem, scxSEditRepositoryMRUItem);
  RegisterEditRepositoryItem(TcxEditRepositoryHyperLinkItem, scxSEditRepositoryHyperLinkItem);
  RegisterEditRepositoryItem(TcxEditRepositoryLookupComboBoxItem, scxSEditRepositoryLookupComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryRadioGroupItem, scxSEditRepositoryRadioGroupItem);
end;

procedure StandardRegister;
begin
  RegisterComponents('Easy Standard', [{TcxTextEdit, TcxMaskEdit, TcxMemo,
    TcxDateEdit, TcxButtonEdit, TcxCheckBox, TcxComboBox, TcxImageComboBox,
    TcxSpinEdit, TcxCalcEdit, TcxHyperLinkEdit, TcxTimeEdit, TcxCurrencyEdit,
    TcxImage, TcxBlobEdit, TcxMRUEdit, TcxPopupEdit, TcxLookupComboBox,
    TcxRadioButton, TcxRadioGroup, TcxListBox, TcxNavigator,
    TcxLabel, TcxProgressBar, TcxTrackBar,
    TcxCheckListBox, TcxColorComboBox, TcxFontNameComboBox, TcxCheckComboBox,
    TcxCheckGroup, TcxRichEdit, TcxExtLookupComboBox}]);
  RegisterComponents('Easy DB', [{TcxDBTextEdit, TcxDBMaskEdit, TcxDBMemo,
    TcxDBDateEdit, TcxDBButtonEdit, TcxDBCheckBox, TcxDBComboBox, TcxDBImageComboBox,
    TcxDBSpinEdit, TcxDBCalcEdit, TcxDBHyperLinkEdit, TcxDBTimeEdit, TcxDBCurrencyEdit,
    TcxDBImage, TcxDBBlobEdit, TcxDBMRUEdit, TcxDBPopupEdit, TcxDBLookupComboBox,
    TcxDBRadioGroup, TcxDBListBox, TcxDBNavigator,
    TcxDBLabel, TcxDBProgressBar, TcxDBTrackBar,
    TcxDBCheckListBox, TcxDBColorComboBox, TcxDBFontNameComboBox, TcxDBCheckComboBox,
    TcxDBCheckGroup, TcxDBRichEdit, TcxDBExtLookupComboBox}]);
  RegisterComponents('Easy Utilities', [{TcxButton, TcxGroupBox,
    TcxHintStyleController, TcxSpinButton,
    TcxMCListBox, TcxListView, TcxTreeView, TcxHeader, TcxSplitter}]);
  RegisterComponents('Easy Filter', [TcxFilterControl, TcxDBFilterControl]);

  RegisterComponents('Easy Shell', [TcxShellComboBox, TcxDBShellComboBox,
                                    TcxShellListView, TcxShellTreeView, TcxShellBrowserDialog]);
  RegisterComponentEditor(TcxShellBrowserDialog, TcxShellBrowserEditor);
  RegisterPropertyEditor(TypeInfo(Boolean), TcxDragDropSettings, 'Scroll', nil);
  RegisterPropertyEditor(TypeInfo(Boolean), TcxCustomShellTreeView, 'RightClickSelect', nil);

//  RegisterComponents('Easy TreeView', [TdxTreeView, TdxDBTreeView, TdxTreeViewEdit,
//                      TdxDBTreeViewEdit, TdxLookUpTreeView, TdxDBLookUpTreeView]);
  //Grid
  RegisterComponents('Easy Grid', [ TEasyStringGrid, TEasyDBGrid]);

  //ADO                                  
  // Restrict these components to only be used with VCL components.
  GroupDescendentsWith(TADOConnection, Controls.TControl);
  GroupDescendentsWith(TADOCommand, Controls.TControl);
  GroupDescendentsWith(TCustomADODataSet, Controls.TControl);
  GroupDescendentsWith(TRDSConnection, Controls.TControl);
  RegisterComponents('Easy dbGo', [TADOConnection, TADOQuery, TADOTable, TADOCommand,
                                   TADODataSet, TADOStoredProc, {TDataSource, }TClientDataSet]);
  RegisterPropertyEditor(TypeInfo(WideString), TADOConnection, 'Provider', TProviderProperty);
  RegisterPropertyEditor(TypeInfo(WideString), TADOConnection, 'ConnectionString', TConnectionStringProperty);
  RegisterPropertyEditor(TypeInfo(WideString), TADOCommand, 'ConnectionString', TConnectionStringProperty);
  RegisterPropertyEditor(TypeInfo(WideString), TCustomADODataSet, 'ConnectionString', TConnectionStringProperty);
  RegisterPropertyEditor(TypeInfo(WideString), TADODataSet, 'CommandText', TCommandTextProperty);
  RegisterPropertyEditor(TypeInfo(WideString), TADOCommand, 'CommandText', TCommandTextProperty);
  RegisterPropertyEditor(TypeInfo(WideString), TADOTable, 'TableName', TTableNameProperty);
  RegisterPropertyEditor(TypeInfo(WideString), TADOStoredProc, 'ProcedureName', TProcedureNameProperty);
  RegisterPropertyEditor(TypeInfo(TParameters), TCustomADODataSet, 'Parameters', TParametersProperty);
  RegisterPropertyEditor(TypeInfo(TParameters), TADOCommand, 'Parameters', TParametersProperty);
  RegisterPropertyEditor(TypeInfo(string), TCustomADODataSet, 'IndexName', TADOIndexNameProperty);
  RegisterComponentEditor(TADOConnection, TADOConnectionEditor);
  RegisterComponentEditor(TADOCommand, TADOCommandEditor);
  RegisterComponentEditor(TADODataSet, TADODataSetEditor);

  RegisterPropertyEditor(TypeInfo(string), TADODataSet, 'MasterFields', TADODataSetFieldLinkProperty);
  RegisterPropertyEditor(TypeInfo(string), TADOTable, 'MasterFields', TADOTableFieldLinkProperty);

  RegisterPropertiesInCategory(sDatabaseCategoryName, TADOConnection,
      ['Attributes','Command*','Connect*','DefaultDatabase','IsolationLevel',
       'LoginPrompt','Mode','Provider']);

  RegisterPropertiesInCategory(sDatabaseCategoryName, TADOCommand,
      ['Command*','Connect*','Cursor*','ExecuteOptions','Param*','Prepared']);

  RegisterPropertiesInCategory(sDatabaseCategoryName, TCustomADODataSet,
      ['CacheSize', 'ConnectionString', 'ExecuteOptions', 'MarshalOptions',
       'MaxRecords', 'Prepared', 'ProcedureName', 'Command*']);

  RegisterSprigType(TADOConnection, TADOConnectionSprig);
  RegisterSprigType(TRDSConnection, TRDSConnectionSprig);
  RegisterSprigType(TADOCommand, TADOCommandSprig);

  RegisterSprigType(TCustomADODataSet, TCustomADODataSetSprig);
  RegisterSprigType(TADODataSet, TADODataSetSprig);
  RegisterSprigType(TADOTable, TADOTableSprig);
  RegisterSprigType(TADOStoredProc, TADOStoredProcSprig);
  RegisterSprigType(TADOQuery, TADOQuerySprig);

  RegisterIslandType(TADOCommandSprig, TADOCommandIsland);
  RegisterIslandType(TCustomADODataSetSprig, TCustomADODataSetIsland);
  RegisterIslandType(TADODataSetSprig, TADODataSetIsland);
  RegisterIslandType(TADOTableSprig, TADOTableIsland);
  RegisterIslandType(TADOQuerySprig, TADOQueryIsland);

  RegisterBridgeType(TDataSetIsland, TADODataSetIsland, TADODataSetMasterDetailBridge);
  RegisterBridgeType(TDataSetIsland, TADOTableIsland, TADOTableMasterDetailBridge);
  RegisterBridgeType(TDataSetIsland, TADOQueryIsland, TADOQueryMasterDetailBridge);

  RegisterComponents('Easy LayOut', []);

  RegisterComponents('Easy OrgChart', [TdxOrgChart, TdxDbOrgChart]);
  RegisterComponentEditor(TdxOrgChart,TdxOrgChartEditor);
  RegisterPropertyEditor(TypeInfo(String),TdxDbOrgChart,'KeyFieldName',TFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),TdxDbOrgChart,'ParentFieldName',TFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),TdxDbOrgChart,'TextFieldName',TFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),TdxDbOrgChart,'OrderFieldName',TFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),TdxDbOrgChart,'ImageFieldName',TFieldProperty);
  RegisterComponentEditor(TdxDBOrgChart,TdxDBOrgChartEditor);

//  RegisterNoIcon([TcxGridLevel,
//    TcxGridTableView, {$IFNDEF NONDB}TcxGridDBTableView,{$ENDIF}
//    TcxGridBandedTableView, {$IFNDEF NONDB}TcxGridDBBandedTableView,{$ENDIF}
//    TcxGridCardView{$IFNDEF NONDB}, TcxGridDBCardView{$ENDIF}]);
//  RegisterNoIcon([
//    TcxGridColumn, {$IFNDEF NONDB}TcxGridDBColumn,{$ENDIF}
//    TcxGridBandedColumn, {$IFNDEF NONDB}TcxGridDBBandedColumn,{$ENDIF}
//    TcxGridCardViewRow{$IFNDEF NONDB}, TcxGridDBCardViewRow{$ENDIF}]);
//  RegisterNoIcon([TcxGridTableViewStyleSheet, TcxGridBandedTableViewStyleSheet, TcxGridCardViewStyleSheet]);
//  
//标准控件
 { RegisterComponents('Standard', [TMainMenu, TPopupMenu, TLabel, TEdit,
    TMemo, TButton, TCheckBox, TRadioButton, TListBox, TComboBox, TScrollBar,
    TGroupBox, TRadioGroup, TPanel, TActionList]);
  RegisterNoIcon([TMenuItem]);
  RegisterComponents('Additional', [TBitBtn, TSpeedButton, TMaskEdit, TStringGrid,
    TDrawGrid, TImage, TShape, TBevel, TScrollBox, TCheckListBox, TSplitter,
    TStaticText, TControlBar, TApplicationEvents]);
  RegisterComponents('Win32', [TTabControl, TPageControl, TImageList, TRichEdit,
    TTrackBar, TProgressBar, TUpDown, THotKey, TAnimate, TDateTimePicker,
    TMonthCalendar, TTreeView, TListView, THeaderControl, TStatusBar, TToolBar,
    TCoolBar, TPageScroller]);
  RegisterClasses([TToolButton, TTabSheet]); }
//  RegisterComponents('System', [TTimer, TPaintBox, TMediaPlayer, TOleContainer]);
//  RegisterComponents('Dialogs', [TOpenDialog, TSaveDialog, TOpenPictureDialog,
//    TSavePictureDialog, TFontDialog, TColorDialog, TPrintDialog, TPrinterSetupDialog,
//    TFindDialog, TReplaceDialog]);

  RegisterPropertiesInCategory('Action',
      ['Action', 'Caption', 'Checked', 'Enabled', 'HelpContext', 'Hint', 'ImageIndex',
       'ShortCut', 'Visible']);
  RegisterPropertiesInCategory('Drag, Drop and Docking',
      ['Drag*', 'Dock*', 'UseDockManager', 'OnDockOver', 'OnGetSiteInfo', 'OnDragOver', 'On*Drop',
       'On*Drag', 'On*Dock']);
  RegisterPropertiesInCategory('Help and Hints', ['Help*', '*Help', 'Hint*', '*Hint']);
  RegisterPropertiesInCategory('Layout', ['Left', 'Top', 'Width', 'Height', 'TabOrder',
        'TabStop', 'Align', 'Anchors', 'Constraints', 'AutoSize', 'AutoScroll', 'Scaled',
        'OnResize', 'OnConstrained', 'OnCanResize']);
  RegisterPropertiesInCategory('Legacy', ['Ctl3d', 'ParentCtl3d', 'OldCreateOrder']);
  RegisterPropertiesInCategory('Linkage', TypeInfo(TComponent), ['']);
  RegisterPropertiesInCategory('Linkage', TypeInfo(IInterface), ['']);
  RegisterPropertiesInCategory('Visual', ['Left','Top','Width','Height','Visible',
        'Enabled','Caption','Align','Alignment','ParentColor','ParentFont','Bevel*',
        'Border*','ClientHeight','ClientWidth','Scaled','AutoSize','EditMask','OnShow',
        'OnPaint','OnClose','OnCloseQuery','OnResize','OnConstrained','OnActivate',
        'OnDeactivate','OnCanResize','OnHide']);
  RegisterPropertiesInCategory('Visual', TypeInfo(TFont), ['']);
  RegisterPropertiesInCategory('Visual', TypeInfo(TColor), ['']);
  RegisterPropertiesInCategory('Visual', TypeInfo(TBrush), ['']);
  RegisterPropertiesInCategory('Visual', TypeInfo(TPen), ['']);
  RegisterPropertiesInCategory('Visual', TypeInfo(TCursor), ['']);
  RegisterPropertiesInCategory('Visual', TypeInfo(TGraphic), ['']);
  RegisterPropertiesInCategory('Input', ['AutoScroll','KeyPreview','ReadOnly',
        'Enabled','OnClick','OnDblClick','OnShortCut','OnKey*','OnMouse*']);

  RegisterPropertiesInCategory('Localizable', ['BiDiMode','Caption','Constraints',
        'EditMask','Glyph','Height','Hint','Icon','ImeMode','ImeName','Left',
        'ParentBiDiMode','ParentFont','Picture','Text','Top','Width']);
  RegisterPropertiesInCategory('Localizable', TCustomForm, ['ClientHeight',
        'ClientWidth','HelpFile']);
  RegisterPropertiesInCategory('Localizable', THotKey, ['Hotkey']);
  RegisterPropertiesInCategory('Localizable', TMainMenu, ['Items']);
  RegisterPropertiesInCategory('Localizable', TPopupMenu, ['Hotkey']);
  RegisterPropertiesInCategory('Localizable', TSplitter, ['MinSize']);
  RegisterPropertiesInCategory('Localizable', TCustomEdit, ['PasswordChar']);
  RegisterPropertiesInCategory('Localizable', TStatusBar, ['SimpleText']);
  RegisterPropertiesInCategory('Localizable', TMenuItem, ['ShortCut']);
  RegisterPropertiesInCategory('Localizable', TSpeedButton, ['Margin','Spacing']);
  RegisterPropertiesInCategory('Localizable', TAction, ['Category','ShortCut']);
  RegisterPropertiesInCategory('Localizable', TRadioGroup, ['Columns']);
  RegisterPropertiesInCategory('Localizable', TToolBar, ['ButtonHeight','ButtonWidth']);
  RegisterPropertiesInCategory('Localizable', TCustomMemo, ['Lines']);
  RegisterPropertiesInCategory('Localizable', TCustomRadioGroup, ['Items']);
  RegisterPropertiesInCategory('Localizable', TCustomComboBox, ['Items']);
  RegisterPropertiesInCategory('Localizable', TCustomListBox, ['Items']);
  RegisterPropertiesInCategory('Localizable', TCustomTabControl, ['Tabs']);
  RegisterPropertiesInCategory('Localizable', TTabSet, ['Tabs']);

  RegisterPropertiesInCategory('Localizable', TypeInfo(TListColumns), ['']);
  RegisterPropertiesInCategory('Localizable', TypeInfo(TListItems), ['']);
  RegisterPropertiesInCategory('Localizable', TypeInfo(TStatusPanels), ['']);
  RegisterPropertiesInCategory('Localizable', TypeInfo(TTreeNodes), ['']);
  RegisterPropertiesInCategory('Localizable', TypeInfo(THeaderSections), ['']);
  RegisterPropertiesInCategory('Localizable', TypeInfo(TImageList), ['']);
  RegisterPropertiesInCategory('Localizable', TypeInfo(TSizeConstraints), ['']);
  RegisterPropertiesInCategory('Localizable', TypeInfo(TFont), ['']);

  RegisterPropertiesInCategory('Localizable', TFindDialog, ['FindText']);
  RegisterPropertiesInCategory('Localizable', TReplaceDialog, ['FindText']);
  RegisterPropertiesInCategory('Localizable', TReplaceDialog, ['ReplaceText']);
  RegisterPropertiesInCategory('Localizable', TOpenDialog, ['Filter']);
  RegisterPropertiesInCategory('Localizable', TOpenDialog, ['Title']);
  RegisterPropertiesInCategory('Localizable', TSaveDialog, ['Filter']);
  RegisterPropertiesInCategory('Localizable', TSaveDialog, ['Title']);
  RegisterPropertiesInCategory('Localizable', TOpenPictureDialog, ['Filter']);
  RegisterPropertiesInCategory('Localizable', TOpenPictureDialog, ['Title']);
  RegisterPropertiesInCategory('Localizable', TSavePictureDialog, ['Filter']);
  RegisterPropertiesInCategory('Localizable', TSavePictureDialog, ['Title']); 

end;

initialization
  StandardRegister;

end.
