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

uses
  Classes, Graphics, Controls, Forms, Dialogs, ActnList, ComCtrls,
  Menus, StdCtrls, ImgList, Buttons, ExtCtrls, Tabs, ExtDlgs, Mask,
  Grids, CheckLst, AppEvnts, MPlayer, OleCtnrs,
  StdDsnEditors, DesignEditors, DesignIntf, untEasyDevExt, untEasyDBDevExt;

procedure StandardRegister;
begin
  RegisterComponents('Easy Standard', [TEasyDevTextEdit, TEasyDevMaskEdit, TEasyDevMemo,
    TEasyDevDateEdit, TEasyDevTimeEdit, TEasyDevButtonEdit, TEasyDevComboBox,
    TEasyDevImageComboBox, TEasyDevLookupComboBox, TEasyDevLookupComboBoxExt,
    TEasyDevColorComboBox, TEasyDevFontNameComboBox, TEasyDevCheckComboBox,
    TEasyDevShellComboBox, TEasyDevSpinEdit, TEasyDevCalcEdit, TEasyDevHyperLinkEdit,
    TEasyDevCurrencyEdit, TEasyDevBlobEdit, TEasyDevMRUEdit, TEasyDevPopupEdit,
    TEasyDevListBox, TEasyDevCheckListBox, TEasyDevRichEdit, TEasyDevLabel,
    TEasyDevImage, TEasyDevCheckBox, TEasyDevCheckGroup, TEasyDevRadioButton,
    TEasyDevRadioGroup]);
  RegisterComponents('Easy DB', [TEasyDevDBTextEdit, TEasyDevDBMaskEdit, TEasyDevDBMemo,
    TEasyDevDBDateEdit, TEasyDevDBTimeEdit, TEasyDevDBButtonEdit, TEasyDevDBComboBox,
    TEasyDevDBImageComboBox, TEasyDevDBLookupComboBox, TEasyDevDBLookupComboBoxExt,
    TEasyDevDBColorComboBox, TEasyDevDBFontNameComboBox, TEasyDevDBCheckComboBox,
    TEasyDevDBShellComboBox, TEasyDevDBSpinEdit, TEasyDevDBCalcEdit, TEasyDevDBHyperLinkEdit,
    TEasyDevDBCurrencyEdit, TEasyDevDBBlobEdit, TEasyDevDBMRUEdit, TEasyDevDBPopupEdit,
    TEasyDevDBListBox, TEasyDevDBCheckListBox, TEasyDevDBRichEdit, TEasyDevDBLabel,
    TEasyDevDBImage, TEasyDevDBCheckBox, TEasyDevDBCheckGroup, TEasyDevDBRadioButton,
    TEasyDevDBRadioGroup{, TEasyDevSQL}]);

//标准控件
  RegisterComponents('Standard', [TMainMenu, TPopupMenu, TLabel, TEdit,
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
  RegisterClasses([TToolButton, TTabSheet]);
  RegisterComponents('System', [TTimer, TPaintBox, TMediaPlayer, TOleContainer]);
  RegisterComponents('Dialogs', [TOpenDialog, TSaveDialog, TOpenPictureDialog,
    TSavePictureDialog, TFontDialog, TColorDialog, TPrintDialog, TPrinterSetupDialog,
    TFindDialog, TReplaceDialog]);
                                                           
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
