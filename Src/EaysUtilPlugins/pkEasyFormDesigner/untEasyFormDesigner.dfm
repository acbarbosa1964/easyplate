object frmEasyFormDesigner: TfrmEasyFormDesigner
  Left = 205
  Top = 157
  Width = 1050
  Height = 500
  Caption = 'Easy'#30028#38754#35774#35745#22120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = EasyMainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 225
    Top = 30
    Height = 424
  end
  object Splitter2: TSplitter
    Left = 825
    Top = 30
    Height = 424
    Align = alRight
  end
  object EasyDockPanel1: TEasyDockPanel
    Left = 0
    Top = 0
    Width = 1042
    Height = 30
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    ToolBarStyler = EasyToolBarOfficeStyler1
    UseRunTimeHeight = True
    object EasyToolBar1: TEasyToolBar
      Left = 3
      Top = 1
      Width = 351
      Height = 28
      AllowFloating = True
      AutoDockOnClose = True
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = []
      CompactImageIndex = -1
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ToolBarStyler = EasyToolBarOfficeStyler1
      ParentOptionPicture = True
      ToolBarIndex = -1
      object EasyToolBarButton1: TEasyToolBarButton
        Left = 9
        Top = 2
        Width = 24
        Height = 24
        Action = FileNew
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 18
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton2: TEasyToolBarButton
        Left = 33
        Top = 2
        Width = 24
        Height = 24
        Action = FileOpen
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 17
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton3: TEasyToolBarButton
        Left = 57
        Top = 2
        Width = 24
        Height = 24
        Action = FileSave
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 14
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator1: TEasyToolBarSeparator
        Left = 105
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton4: TEasyToolBarButton
        Left = 115
        Top = 2
        Width = 24
        Height = 24
        Action = DesignMode
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 12
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator2: TEasyToolBarSeparator
        Left = 139
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton5: TEasyToolBarButton
        Left = 149
        Top = 2
        Width = 24
        Height = 24
        Action = dsnCopy1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 8
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton6: TEasyToolBarButton
        Left = 173
        Top = 2
        Width = 24
        Height = 24
        Action = dsnCut1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 9
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton7: TEasyToolBarButton
        Left = 197
        Top = 2
        Width = 24
        Height = 24
        Action = dsnPaste1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 11
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton8: TEasyToolBarButton
        Left = 221
        Top = 2
        Width = 24
        Height = 24
        Action = dsnDelete1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 10
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator3: TEasyToolBarSeparator
        Left = 245
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton9: TEasyToolBarButton
        Left = 255
        Top = 2
        Width = 24
        Height = 24
        Action = dsnUndo1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 19
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton10: TEasyToolBarButton
        Left = 279
        Top = 2
        Width = 24
        Height = 24
        Action = dsnRedo1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 20
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator4: TEasyToolBarSeparator
        Left = 303
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton11: TEasyToolBarButton
        Left = 313
        Top = 2
        Width = 24
        Height = 24
        Action = dsnLockControls1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 13
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton21: TEasyToolBarButton
        Left = 81
        Top = 2
        Width = 24
        Height = 24
        Action = dsnSaveAs
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 15
        ParentFont = False
        Position = daTop
      end
    end
    object EasyToolBar2: TEasyToolBar
      Left = 356
      Top = 1
      Width = 279
      Height = 28
      AllowFloating = True
      AutoDockOnClose = True
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = []
      CompactImageIndex = -1
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ToolBarStyler = EasyToolBarOfficeStyler1
      ParentOptionPicture = True
      ToolBarIndex = -1
      object EasyToolBarButton12: TEasyToolBarButton
        Left = 9
        Top = 2
        Width = 24
        Height = 24
        Action = dsnAlignToGrid1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton13: TEasyToolBarButton
        Left = 43
        Top = 2
        Width = 24
        Height = 24
        Action = dsnBringToFront1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton14: TEasyToolBarButton
        Left = 67
        Top = 2
        Width = 24
        Height = 24
        Action = dsnSendToBack1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 2
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator5: TEasyToolBarSeparator
        Left = 33
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarSeparator6: TEasyToolBarSeparator
        Left = 91
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton15: TEasyToolBarButton
        Left = 101
        Top = 2
        Width = 24
        Height = 24
        Action = dsnAlignmentDlg1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 3
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton16: TEasyToolBarButton
        Left = 125
        Top = 2
        Width = 24
        Height = 24
        Action = dsnSizeDlg1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 4
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton17: TEasyToolBarButton
        Left = 149
        Top = 2
        Width = 24
        Height = 24
        Action = dsnScale1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 5
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator7: TEasyToolBarSeparator
        Left = 173
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton18: TEasyToolBarButton
        Left = 183
        Top = 2
        Width = 24
        Height = 24
        Action = dsnTabOrderDlg1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 6
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarButton19: TEasyToolBarButton
        Left = 207
        Top = 2
        Width = 24
        Height = 24
        Action = dsnCreationOrderDlg1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 7
        ParentFont = False
        Position = daTop
      end
      object EasyToolBarSeparator8: TEasyToolBarSeparator
        Left = 231
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton20: TEasyToolBarButton
        Left = 241
        Top = 2
        Width = 24
        Height = 24
        Action = dsnTextEditMode1
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 21
        ParentFont = False
        Position = daTop
      end
    end
    object EasyToolBar3: TEasyToolBar
      Left = 637
      Top = 1
      Width = 47
      Height = 28
      AllowFloating = True
      AutoDockOnClose = True
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = []
      CompactImageIndex = -1
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ToolBarStyler = EasyToolBarOfficeStyler1
      ParentOptionPicture = True
      ToolBarIndex = -1
      object EasyToolBarButton22: TEasyToolBarButton
        Left = 9
        Top = 2
        Width = 24
        Height = 24
        Action = FileExit
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Tahoma'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 16
        ParentFont = False
        Position = daTop
      end
    end
  end
  object pgcLeft: TEasyPageControl
    Left = 0
    Top = 30
    Width = 225
    Height = 424
    ActivePage = tbsToolBox
    Align = alLeft
    TabIndex = 0
    TabOrder = 3
    FixedDimension = 19
    object tbsToolBox: TEasyTabSheet
      Caption = #24037#20855#31665
      object PaletteFrame1: TPaletteFrame
        Left = 0
        Top = 0
        Width = 221
        Height = 401
        Align = alClient
        TabOrder = 0
        PaletteToolList.Left = 0
        PaletteToolList.Top = 27
        PaletteToolList.Width = 221
        PaletteToolList.Height = 374
        PaletteToolList.ItemHeight = 26
        PaletteToolList.FoldingIcon.Data = {
          12050000424D12050000000000003604000028000000120000000B0000000100
          080000000000DC00000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010101010101
          010101010101010101010101000007ECECECECECECEC0707ECECECECECECEC07
          0000EC07070707070707ECEC07070707070707EC0000ECF6080808080707ECEC
          F6080800080707EC0000ECF6F6F6F6F6F608ECECF6F6F600F6F608EC0000ECF6
          000000000008ECECF6000000000008EC0000ECF6F6F6F6F6F6F6ECECF6F6F600
          F6F6F6EC0000ECFFFFFFFFFFFFF6ECECFFFFFF00FFFFF6EC0000ECFFFFFFFFFF
          FFFFECECFFFFFFFFFFFFFFEC000007ECECECECECECEC0707ECECECECECECEC07
          00000101010101010101010101010101010101010000}
        PaletteToolList.HintProps.Font.Charset = DEFAULT_CHARSET
        PaletteToolList.HintProps.Font.Color = clWindowText
        PaletteToolList.HintProps.Font.Height = -11
        PaletteToolList.HintProps.Font.Name = 'Tahoma'
        PaletteToolList.HintProps.Font.Style = []
        PaletteToolList.StyleCategory.Font.Charset = DEFAULT_CHARSET
        PaletteToolList.StyleCategory.Font.Color = clWindowText
        PaletteToolList.StyleCategory.Font.Height = -11
        PaletteToolList.StyleCategory.Font.Name = 'MS Sans Serif'
        PaletteToolList.StyleCategory.Font.Style = [fsBold]
        PaletteToolList.StyleCategory.BoundPen.Color = clSilver
        PaletteToolList.StyleCategory.Brush.Color = 14540253
        PaletteToolList.StyleCategory.Alignment = taLeftJustify
        PaletteToolList.StyleCategory.Shape = isRoundRect
        PaletteToolList.StyleCategoryMouseOver.Font.Charset = DEFAULT_CHARSET
        PaletteToolList.StyleCategoryMouseOver.Font.Color = clWindowText
        PaletteToolList.StyleCategoryMouseOver.Font.Height = -11
        PaletteToolList.StyleCategoryMouseOver.Font.Name = 'MS Sans Serif'
        PaletteToolList.StyleCategoryMouseOver.Font.Style = [fsBold]
        PaletteToolList.StyleCategoryMouseOver.BoundPen.Color = clSilver
        PaletteToolList.StyleCategoryMouseOver.Brush.Color = 14540253
        PaletteToolList.StyleCategoryMouseOver.Alignment = taLeftJustify
        PaletteToolList.StyleCategoryMouseOver.Shape = isRoundRect
        PaletteToolList.StyleCategorySelected.Font.Charset = DEFAULT_CHARSET
        PaletteToolList.StyleCategorySelected.Font.Color = clWindowText
        PaletteToolList.StyleCategorySelected.Font.Height = -11
        PaletteToolList.StyleCategorySelected.Font.Name = 'MS Sans Serif'
        PaletteToolList.StyleCategorySelected.Font.Style = [fsBold]
        PaletteToolList.StyleCategorySelected.BoundPen.Color = clGray
        PaletteToolList.StyleCategorySelected.Brush.Color = 14540253
        PaletteToolList.StyleCategorySelected.Alignment = taLeftJustify
        PaletteToolList.StyleCategorySelected.Shape = isRoundRect
        PaletteToolList.StyleItem.Font.Charset = DEFAULT_CHARSET
        PaletteToolList.StyleItem.Font.Color = clWindowText
        PaletteToolList.StyleItem.Font.Height = -11
        PaletteToolList.StyleItem.Font.Name = 'MS Sans Serif'
        PaletteToolList.StyleItem.Font.Style = []
        PaletteToolList.StyleItem.BoundPen.Style = psClear
        PaletteToolList.StyleItem.Brush.Style = bsClear
        PaletteToolList.StyleItem.Alignment = taLeftJustify
        PaletteToolList.StyleItem.Shape = isRectangle
        PaletteToolList.StyleItemMouseOver.Font.Charset = DEFAULT_CHARSET
        PaletteToolList.StyleItemMouseOver.Font.Color = clWindowText
        PaletteToolList.StyleItemMouseOver.Font.Height = -11
        PaletteToolList.StyleItemMouseOver.Font.Name = 'MS Sans Serif'
        PaletteToolList.StyleItemMouseOver.Font.Style = []
        PaletteToolList.StyleItemMouseOver.BoundPen.Color = 14194036
        PaletteToolList.StyleItemMouseOver.Brush.Color = 15717318
        PaletteToolList.StyleItemMouseOver.Alignment = taLeftJustify
        PaletteToolList.StyleItemMouseOver.Shape = isRectangle
        PaletteToolList.StyleItemSelected.Font.Charset = DEFAULT_CHARSET
        PaletteToolList.StyleItemSelected.Font.Color = clWindowText
        PaletteToolList.StyleItemSelected.Font.Height = -11
        PaletteToolList.StyleItemSelected.Font.Name = 'MS Sans Serif'
        PaletteToolList.StyleItemSelected.Font.Style = []
        PaletteToolList.StyleItemSelected.BoundPen.Color = 14314110
        PaletteToolList.StyleItemSelected.Brush.Color = 15711942
        PaletteToolList.StyleItemSelected.Alignment = taLeftJustify
        PaletteToolList.StyleItemSelected.Shape = isRectangle
        PaletteToolList.Align = alClient
        PaletteToolList.Color = clWhite
        PaletteToolList.ParentColor = False
        PaletteToolList.TabOrder = 1
      end
    end
    object tbsObjectTree: TEasyTabSheet
      Caption = #23545#35937#26641
      object ObjectTreeFrame1: TObjectTreeFrame
        Left = 0
        Top = 0
        Width = 221
        Height = 372
        Align = alClient
        TabOrder = 0
        TabStop = True
      end
    end
  end
  object pgcRight: TEasyPageControl
    Left = 828
    Top = 30
    Width = 214
    Height = 424
    ActivePage = tbsInspector
    Align = alRight
    TabIndex = 0
    TabOrder = 5
    FixedDimension = 19
    object tbsInspector: TEasyTabSheet
      Caption = #23646#24615#32534#36753#22120
      object ObjectInspectorFrame1: TObjectInspectorFrame
        Left = 0
        Top = 0
        Width = 210
        Height = 401
        Align = alClient
        TabOrder = 0
        ComponnentCombo.Left = 0
        ComponnentCombo.Top = 0
        ComponnentCombo.Width = 210
        ComponnentCombo.Height = 22
        ComponnentCombo.ClassNameDelim = ': '
        ComponnentCombo.AutoHint = True
        ComponnentCombo.Align = alTop
        ComponnentCombo.ItemHeight = 16
        ComponnentCombo.Sorted = True
        ComponnentCombo.TabOrder = 0
        PropertyList.Left = 0
        PropertyList.Top = 0
        PropertyList.Width = 202
        PropertyList.Height = 332
        PropertyList.TabStop = True
        PropertyList.TabOrder = 0
        PropertyList.TypeKinds = [tkInteger, tkChar, tkEnumeration, tkFloat, tkString, tkSet, tkClass, tkWChar, tkLString, tkWString, tkVariant, tkInt64]
        PropertyList.SplitPos = 100
        PropertyList.ItemIndex = -1
        PropertyList.FoldingIcon.Data = {
          9E020000424D9E020000000000003600000028000000120000000B0000000100
          1800000000006802000000000000000000000000000000000000000080000080
          0000800000800000800000800000800000800000800000800000800000800000
          800000800000800000800000800000800000D3C2B0B59878B59878B59878B598
          78B59878B59878B59878D3C2B0D3C2B0B59878B59878B59878B59878B59878B5
          9878B59878D3C2B00000B59878BFCCD2AEBEC6A8B8C2A7B8C1A7B8C1A6B7C0AA
          BAC3B59878B59878BFCCD2AEBEC6A8B8C2A7B8C1A7B8C1A6B7C0AABAC3B59878
          0000B59878D9E1E4CFD8DCC9D3D8C7D2D7C6D1D6C0CCD2BBC8CFB59878B59878
          D9E1E4CFD8DCC9D3D8000000C6D1D6C0CCD2BBC8CFB598780000B59878EEF2F2
          ECF0F0E7EDEDE6EBECE3E9EAD9E0E3CCD6DBB59878B59878EEF2F2ECF0F0E7ED
          ED000000E3E9EAD9E0E3CCD6DBB598780000B59878F1F5F50000000000000000
          00000000000000D2DBDFB59878B59878F1F5F500000000000000000000000000
          0000D2DBDFB598780000B59878F5F7F7F5F7F7F4F7F7F4F7F7F4F6F6EBF0F1DA
          E1E5B59878B59878F5F7F7F5F7F7F4F7F7000000F4F6F6EBF0F1DAE1E5B59878
          0000B59878FBFCFCFBFDFDFBFDFDFBFDFDFBFCFCFAFCFCF3F6F7B59878B59878
          FBFCFCFBFDFDFBFDFD000000FBFCFCFAFCFCF3F6F7B598780000B59878FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB59878B59878FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB598780000D3C2B0B59878B59878B59878B598
          78B59878B59878B59878D3C2B0D3C2B0B59878B59878B59878B59878B59878B5
          9878B59878D3C2B0000000008000008000008000008000008000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          0000}
        PropertyList.cPropReadOnly = clBlue
        PropertyList.IncludeRefs = False
        PropertyList.ShowGutter = False
        PropertyList.cGutter = clBlack
        PropertyList.cGutterBnd = clBlack
        PropertyList.ShowSelFrame = False
        PropertyList.Align = alClient
        PropertyList.BevelInner = bvNone
        PropertyList.BevelKind = bkTile
        PropertyList.Color = clBtnFace
        PropertyList.Font.Charset = DEFAULT_CHARSET
        PropertyList.Font.Color = clWindowText
        PropertyList.Font.Height = 9
        PropertyList.Font.Name = 'MS Sans Serif'
        PropertyList.Font.Style = []
        PropertyList.ParentColor = False
        PropertyList.ParentFont = False
        PropertyList.PopupMenu = ObjectInspectorFrame1.PopupMenu1
        EventsList.Left = 0
        EventsList.Top = 0
        EventsList.Width = 157
        EventsList.Height = 315
        EventsList.TabStop = True
        EventsList.TabOrder = 0
        EventsList.TypeKinds = [tkMethod]
        EventsList.SplitPos = 100
        EventsList.ItemIndex = -1
        EventsList.FoldingIcon.Data = {
          12050000424D12050000000000003604000028000000120000000B0000000100
          080000000000DC00000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010101010101
          010101010101010101010101000007ECECECECECECEC0707ECECECECECECEC07
          0000EC07070707070707ECEC07070707070707EC0000ECF6080808080707ECEC
          F6080800080707EC0000ECF6F6F6F6F6F608ECECF6F6F600F6F608EC0000ECF6
          000000000008ECECF6000000000008EC0000ECF6F6F6F6F6F6F6ECECF6F6F600
          F6F6F6EC0000ECFFFFFFFFFFFFF6ECECFFFFFF00FFFFF6EC0000ECFFFFFFFFFF
          FFFFECECFFFFFFFFFFFFFFEC000007ECECECECECECEC0707ECECECECECECEC07
          00000101010101010101010101010101010101010000}
        EventsList.ShowGutter = False
        EventsList.cGutter = clBlack
        EventsList.cGutterBnd = clBlack
        EventsList.ShowSelFrame = False
        EventsList.Align = alClient
        EventsList.BevelInner = bvNone
        EventsList.BevelKind = bkTile
        EventsList.Font.Charset = DEFAULT_CHARSET
        EventsList.Font.Color = clWindowText
        EventsList.Font.Height = 9
        EventsList.Font.Name = 'MS Sans Serif'
        EventsList.Font.Style = []
        EventsList.ParentFont = False
        EventsList.PopupMenu = ObjectInspectorFrame1.PopupMenu1
        ReadOnly = False
      end
    end
  end
  object pgcCenter: TEasyPageControl
    Left = 228
    Top = 30
    Width = 597
    Height = 424
    Align = alClient
    TabOrder = 4
    OnDblClick = pgcCenterDblClick
    FixedDimension = 0
  end
  object EasyToolBarOfficeStyler1: TEasyToolBarOfficeStyler
    BorderColorHot = 14731181
    ButtonAppearance.Color = 16640730
    ButtonAppearance.ColorTo = 14986888
    ButtonAppearance.ColorChecked = 9229823
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 5149182
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 13432063
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = clNavy
    ButtonAppearance.BorderHotColor = clNavy
    ButtonAppearance.BorderCheckedColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = clHighlight
    CaptionAppearance.CaptionColorTo = clHighlight
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = 13432063
    CaptionAppearance.CaptionColorHotTo = 9556223
    CaptionAppearance.CaptionTextColorHot = clBlack
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 16640730
    Color.ColorTo = 14986888
    Color.Direction = gdVertical
    ColorHot.Color = 16773606
    ColorHot.ColorTo = 16444126
    ColorHot.Direction = gdVertical
    CompactGlowButtonAppearance.BorderColor = 14727579
    CompactGlowButtonAppearance.BorderColorHot = 10079963
    CompactGlowButtonAppearance.BorderColorDown = 4548219
    CompactGlowButtonAppearance.BorderColorChecked = clBlack
    CompactGlowButtonAppearance.Color = 15653832
    CompactGlowButtonAppearance.ColorTo = 16178633
    CompactGlowButtonAppearance.ColorChecked = 11918331
    CompactGlowButtonAppearance.ColorCheckedTo = 7915518
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 7778289
    CompactGlowButtonAppearance.ColorDownTo = 4296947
    CompactGlowButtonAppearance.ColorHot = 15465983
    CompactGlowButtonAppearance.ColorHotTo = 11332863
    CompactGlowButtonAppearance.ColorMirror = 15586496
    CompactGlowButtonAppearance.ColorMirrorTo = 16245200
    CompactGlowButtonAppearance.ColorMirrorHot = 5888767
    CompactGlowButtonAppearance.ColorMirrorHotTo = 10807807
    CompactGlowButtonAppearance.ColorMirrorDown = 946929
    CompactGlowButtonAppearance.ColorMirrorDownTo = 5021693
    CompactGlowButtonAppearance.ColorMirrorChecked = 10480637
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 16105376
    DockColor.ColorTo = 16440004
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 9516288
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 14727579
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = clBlack
    GlowButtonAppearance.Color = 15653832
    GlowButtonAppearance.ColorTo = 16178633
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 15586496
    GlowButtonAppearance.ColorMirrorTo = 16245200
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 12763842
    GroupAppearance.Color = 16640730
    GroupAppearance.ColorTo = 15851212
    GroupAppearance.ColorMirror = 15851212
    GroupAppearance.ColorMirrorTo = 16640730
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Tahoma'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clBlack
    GroupAppearance.CaptionAppearance.CaptionColor = 15915714
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15784385
    GroupAppearance.CaptionAppearance.CaptionTextColor = clBlack
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16769224
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16772566
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = clBlack
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 14086910
    GroupAppearance.PageAppearance.ColorTo = 16382457
    GroupAppearance.PageAppearance.ColorMirror = 16382457
    GroupAppearance.PageAppearance.ColorMirrorTo = 16382457
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.BorderColor = clHighlight
    GroupAppearance.TabAppearance.BorderColorHot = clHighlight
    GroupAppearance.TabAppearance.BorderColorSelected = 10534860
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 10534860
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 10412027
    GroupAppearance.TabAppearance.ColorSelectedTo = 12249340
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 13432063
    GroupAppearance.TabAppearance.ColorHotTo = 13432063
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 13432063
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 9556223
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12249340
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13955581
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = clBlack
    GroupAppearance.TabAppearance.TextColorHot = clBlack
    GroupAppearance.TabAppearance.TextColorSelected = clBlack
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.ToolBarAppearance.BorderColor = 13423059
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 15530237
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 16382457
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 15660277
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16645114
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 14922381
    PageAppearance.Color = 16640730
    PageAppearance.ColorTo = 16440004
    PageAppearance.ColorMirror = 16440004
    PageAppearance.ColorMirrorTo = 16440004
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PagerCaption.BorderColor = 15780526
    PagerCaption.Color = 14986888
    PagerCaption.ColorTo = 14986888
    PagerCaption.ColorMirror = 14986888
    PagerCaption.ColorMirrorTo = 14986888
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 9516288
    QATAppearance.Color = 16640730
    QATAppearance.ColorTo = 14986888
    QATAppearance.FullSizeBorderColor = 14986888
    QATAppearance.FullSizeColor = 14986888
    QATAppearance.FullSizeColorTo = 14986888
    RightHandleColor = 15836789
    RightHandleColorTo = 9516288
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = clHighlight
    TabAppearance.BorderColorSelected = 14922381
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16709360
    TabAppearance.ColorSelectedTo = 16445929
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 13432063
    TabAppearance.ColorHotTo = 13432063
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 13432063
    TabAppearance.ColorMirrorHotTo = 9556223
    TabAppearance.ColorMirrorSelected = 16445929
    TabAppearance.ColorMirrorSelectedTo = 16181984
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clBlack
    TabAppearance.TextColorHot = clBlack
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.BackGround.Color = 14986888
    TabAppearance.BackGround.ColorTo = 16440004
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 424
    Top = 240
  end
  object EasyMenuOfficeStyler1: TEasyMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = False
    Style = osOffice2003Blue
    Background.Position = bpCenter
    Background.Color = 16185078
    Background.ColorTo = 16185078
    ButtonAppearance.DownColor = 5149182
    ButtonAppearance.DownColorTo = 9556991
    ButtonAppearance.HoverColor = 13432063
    ButtonAppearance.HoverColorTo = 9556223
    ButtonAppearance.DownBorderColor = clNavy
    ButtonAppearance.HoverBorderColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    IconBar.Color = 16773091
    IconBar.ColorTo = 14986631
    IconBar.CheckBorder = clNavy
    IconBar.RadioBorder = clNavy
    SelectedItem.BorderColor = clNavy
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -12
    SelectedItem.Font.Name = #23435#20307
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -9
    SelectedItem.NotesFont.Name = #23435#20307
    SelectedItem.NotesFont.Style = []
    SelectedItem.CheckBorder = clNavy
    SelectedItem.RadioBorder = clNavy
    RootItem.Color = 16105118
    RootItem.ColorTo = 16240050
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -12
    RootItem.Font.Name = #23435#20307
    RootItem.Font.Style = []
    RootItem.SelectedColor = 16773091
    RootItem.SelectedColorTo = 15185299
    RootItem.SelectedBorderColor = 9841920
    RootItem.HoverColor = 13432063
    RootItem.HoverColorTo = 10147583
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.Color = 13339754
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -9
    NotesFont.Name = #23435#20307
    NotesFont.Style = []
    MenuBorderColor = 9841920
    Left = 496
    Top = 240
  end
  object EasyMainMenu1: TEasyMainMenu
    AutoHotkeys = maManual
    MenuStyler = EasyMenuOfficeStyler1
    Left = 464
    Top = 240
    object F1: TMenuItem
      Caption = #25991#20214'(&F)'
      object New1: TMenuItem
        Action = FileNew
      end
      object Open1: TMenuItem
        Action = FileOpen
      end
      object Mergewithcurrent1: TMenuItem
        Action = FileMerge
      end
      object Save1: TMenuItem
        Action = FileSave
      end
      object N13: TMenuItem
        Action = dsnSaveAs
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Action = FileClose
      end
      object CloseAll1: TMenuItem
        Action = FileCloseAll
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Action = FileExit
      end
    end
    object E1: TMenuItem
      Caption = #32534#36753'(&E)'
      object Undo1: TMenuItem
        Action = dsnUndo1
      end
      object Redo1: TMenuItem
        Action = dsnRedo1
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Copy1: TMenuItem
        Action = dsnCopy1
      end
      object Cut1: TMenuItem
        Action = dsnCut1
      end
      object Paste1: TMenuItem
        Action = dsnPaste1
      end
      object Delete1: TMenuItem
        Action = dsnDelete1
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SelectAll1: TMenuItem
        Action = dsnSelectAll1
      end
    end
    object D1: TMenuItem
      Caption = #35774#35745'(&D)'
      object Aligntogrid1: TMenuItem
        Action = dsnAlignToGrid1
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Bringtofront1: TMenuItem
        Action = dsnBringToFront1
      end
      object Sendtoback1: TMenuItem
        Action = dsnSendToBack1
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Align1: TMenuItem
        Action = dsnAlignmentDlg1
      end
      object Size1: TMenuItem
        Action = dsnSizeDlg1
      end
      object Scale1: TMenuItem
        Action = dsnScale1
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object aborder1: TMenuItem
        Action = dsnTabOrderDlg1
      end
      object CreationOrder1: TMenuItem
        Action = dsnCreationOrderDlg1
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object FlipChildren1: TMenuItem
        Caption = 'Flip Children'
        object Flipallchildren1: TMenuItem
          Action = dsnFlipChildrenAll1
        end
        object Flipchildren2: TMenuItem
          Action = dsnFlipChildren1
        end
      end
      object LockControls1: TMenuItem
        Action = dsnLockControls1
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object ReadOnly1: TMenuItem
        Action = actReadOnly
      end
      object EditText1: TMenuItem
        Action = dsnTextEditMode1
      end
    end
    object T1: TMenuItem
      Caption = #24037#20855'(&T)'
      object N11: TMenuItem
        Caption = #23646#24615#32534#36753#22120#36873#39033'...'
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object BDSStyle1: TMenuItem
        Action = actBDSStyle
        AutoCheck = True
      end
    end
    object V1: TMenuItem
      Caption = #35270#22270'(&V)'
      object N15: TMenuItem
        Action = actLeftPageControl
      end
      object N16: TMenuItem
        Action = actRightPageControl
      end
    end
    object N14: TMenuItem
      Caption = #24110#21161'(&H)'
    end
  end
  object ImageList1: TImageList
    Left = 420
    Top = 272
    Bitmap = {
      494C010116001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000000000007F7F7F000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000800000008000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000000000000000000000000000000000008080800080000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000800000008000000080000000800000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400FFFFFF00C6C6
      C60084848400C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840084848400FFFF
      FF0084848400FFFFFF0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00000000000000000000848484008484840084848400FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF00000084000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      800000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      800000808000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000800000000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000840000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      800000808000008080000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000800000008080800000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF008400000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000840000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF008400000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000800000008000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000800000000000
      0000000000000000000080000000808080000000000000000000000000000000
      0000800000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008000000080000000800000008000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080A0600040A0
      200040A020000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000080200080E0
      C00080E0A00000A0200040A04000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000080200080E0
      A00040E0800040E0800040C0600000A0200080A0800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      00000084840000000000000000000000000000000000000000000080200080E0
      A00040C0800040C0600040E0600040E0800040C0400040A04000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      00007B7B7B00000000007B7B7B00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      00000084840000000000000000000000000000000000000000000080200080E0
      800040C0800040C0600040C0600040E0600040E0800040E0800000A0200040A0
      6000000000000000000000000000000000007B7B7B000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      00000084840000000000000000000000000000000000000000000080200080C0
      800040C0600040C0600040C0600040C0600040E0600040E0800040E0800040C0
      60000080200000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00000000007B7B7B000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000000000000000000000000000000000000000000080200080C0
      800040C0600040C0600040C0600040C0600040C0600040E0600040E0600040E0
      800040E0800000802000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000084
      84000084840000000000000000000000000000000000000000000080200080C0
      800040C0600040C0600040C0600040C0600040C0600040C0600040C0600040E0
      600040E0800000802000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      00000084840000000000000000000000000000000000000000000080200080C0
      800040C0600040C0600040C0600040C0400040C0600040C0600040C0600040C0
      4000008020000000000000000000000000007B7B7B0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      00000084840000000000000000000000000000000000000000000080200080C0
      A00080C0800040C0600040C0600040C0600040C0600040C040000080200040A0
      600000000000000000000000000000000000000000007B7B7B00000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000000000000080200080C0
      A00080C0800040C0800040C0600040C0600000A0200040802000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600000000000000000000000000000000000000000000802000C0DC
      C00080C0800080C0800040A060000080200080A0800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000802000C0DC
      C00080C0A0004080400040804000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808060004080
      2000408020000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000008400
      0000000000000000000084000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000840000008400000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00840000008400000084000000FFFF
      FF008400000084000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF00840000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000084000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFFFF008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      00008400000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      84000084840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      84000084840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000008484
      840000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF000000000000FFFF0000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000FFFF000000000000FFFF0000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF000000000000FFFF0000000000000000000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000848484000000000000000000FFFF
      FF0000000000FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      840000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000FFFF0000000000000000000000000000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000FFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF000000000084848400FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00000000008484840000000000000000008484
      8400FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000000000000000000000000000084848400FFFF000000000000000000000000
      00000000000000000000FFFF00000000000084848400FFFFFF00FFFF00008484
      840000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000084848400000000000000000084848400FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF000000000084848400FFFF0000FFFFFF008484
      8400FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000000084848400FFFF000000000000000000000000
      00000000000000000000FFFF00000000000084848400FFFFFF00FFFF00008484
      840000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFFFF0084848400FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF000000000084848400FFFF0000FFFFFF008484
      8400FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000000084848400FFFF0000FFFFFF00FFFF0000FFFF
      FF000000000000000000000000000000000084848400FFFFFF00FFFF00008484
      840000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFFFF0084848400FFFFFF00FFFF0000FFFFFF00FFFF
      00000000000000000000000000000000000084848400FFFF0000FFFFFF008484
      8400848484008484840084848400848484008484840000000000000000000000
      000000000000000000000000FF00000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF000000000084848400FFFF0000FFFFFF00FFFF0000FFFF
      FF000000000000000000000000000000000084848400FFFFFF00FFFF0000FFFF
      FF00FFFF000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFFFF00848484008484840084848400848484008484
      84008484840000000000000000000000000084848400FFFF0000FFFFFF00FFFF
      0000FFFFFF0000000000000000000000000000000000000000000000FF000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840084848400000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFE300000000FFFF8C1700000000FFFFDE3700000000E7FFCE3700000000
      CF83C03700000000DFC3EC7700000000DFE3E47700000000DFD3E47700000000
      CF3BF0F700000000E07FF0F700000000FFFFF0F700000000FFFFF9F700000000
      FFFFFBF700000000FFFFFFE3000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF
      0000001FC007FFFFE007000FC007FFFFE0070007C007FFFFE0070003C007FFE7
      E0070001C007C1F3E0070000C007C3FBE007001FC007C7FBE007001FC007CBFB
      E007001FC007DCF3FFFF8FF1C007FE07F81FFFF9C00FFFFFF81FFF75C01FFFFF
      F81FFF8FC03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EC7FFFFFFC001BFFF
      C1FFFFFF8031F003C07FFFFF8031E003C03F83F18031E003C00F03F18001E003
      C00700008001E003C003000080012003C00300008FF1E002C00703FF8FF1E003
      C00F83FF8FF1E003C03FFFFF8FF1E003C07FFFFF8FF1E003C1FFFFFF8FF5FFFF
      C7FFFFFF8001BF7DFFFFFFFFFFFF7F7EFFFFFFFFFFFFFFFFFFFFF3FFFFFFFC00
      FC01ED9FFFF98000FC01ED6FE7FF0000FC01ED6FC3F300000001F16FC3E70000
      0001FD1FE1C700010001FC7FF08F00030001FEFFF81F00030003FC7FFC3F0003
      0007FD7FF81F0003000FF93FF09F000300FFFBBFC1C7000301FFFBBF83E38007
      03FFFBBF8FF1F87FFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFFFFFFFFF8F001CE01
      AAAAFFD1F2A9E67DFFFF4941F105E601BFC27FC0C289CE01FFE3F0C1C155FFFF
      BFC270C3C289C601FFCB70C70101CE7D803EF0CF0001F601803F7FDF0057CE01
      803E43FF0407FFFF803FC3FF0007EE01803E43DF229FEE7D803F43DF101FEE01
      802AFFFF001FEE01FFFF249F8FFFFFFFFFFFFFFFFFFFFFFFBFFDC3FFE00FFFFF
      DBDBE3FFE54FFFFFE3C7C200EAAFFFDDE3C78A00054FFFCDC3C3BE000AAF8001
      FFFFB000054FFFCDFE7FF2000A0FFFDDFE7FF400055FBBFFFFFFF2000A3FB3FF
      C3C3F405007D8001E3C7F20300FDB3FFE3C7F40701D1BBFFDBDBF28F03C3FFFF
      BFFDF51FFFC7FFFFFFFFF03FFFC3FFFF00000000000000000000000000000000
      000000000000}
  end
  object SD: TSaveDialog
    DefaultExt = 'dfm'
    Filter = 'Form resource (*.efd)|*.efd|All files (*.*)|*.*'
    Title = 'Save form'
    Left = 496
    Top = 304
  end
  object OD: TOpenDialog
    DefaultExt = 'dfm'
    Filter = 'Form resource (*.efd)|*.efd|All files (*.*)|*.*'
    Title = 'Open form'
    Left = 464
    Top = 304
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 464
    Top = 272
    object FileNew: TAction
      Category = 'File'
      Caption = #26032#24314
      Hint = #26032#24314
      ImageIndex = 18
      OnExecute = FileNewExecute
    end
    object dsnAlignToGrid1: TdsnAlignToGrid
      Category = 'EC Designer'
      Caption = #23545#40784#32593#26684
      Enabled = False
      Hint = #23545#40784#32593#26684
      ImageIndex = 0
    end
    object dsnBringToFront1: TdsnBringToFront
      Category = 'EC Designer'
      Caption = #21069#31227
      Enabled = False
      Hint = #21069#31227
      ImageIndex = 1
    end
    object dsnSendToBack1: TdsnSendToBack
      Category = 'EC Designer'
      Caption = #21518#31227
      Enabled = False
      Hint = #21518#31227
      ImageIndex = 2
    end
    object dsnAlignmentDlg1: TdsnAlignmentDlg
      Category = 'EC Designer'
      Caption = #23545#40784'..'
      Enabled = False
      Hint = #23545#40784'..'
      ImageIndex = 3
    end
    object dsnSizeDlg1: TdsnSizeDlg
      Category = 'EC Designer'
      Caption = #23610#23544'...'
      Enabled = False
      Hint = #23610#23544'...'
      ImageIndex = 4
    end
    object dsnScale1: TdsnScale
      Category = 'EC Designer'
      Caption = #27604#20363'...'
      Enabled = False
      Hint = #27604#20363'...'
      ImageIndex = 5
    end
    object dsnTabOrderDlg1: TdsnTabOrderDlg
      Category = 'EC Designer'
      Caption = 'Tab'#39034#24207'...'
      Enabled = False
      Hint = 'Tab'#39034#24207'...'
      ImageIndex = 6
    end
    object dsnCreationOrderDlg1: TdsnCreationOrderDlg
      Category = 'EC Designer'
      Caption = 'Tab'#39034#24207#35774#32622'...'
      Enabled = False
      Hint = 'Tab'#39034#24207#35774#32622'...'
      ImageIndex = 7
    end
    object dsnFlipChildrenAll1: TdsnFlipChildrenAll
      Category = 'EC Designer'
      Caption = #24179#31227#25152#26377#23376#25511#20214
      Hint = #24179#31227#25152#26377#23376#25511#20214
    end
    object dsnFlipChildren1: TdsnFlipChildren
      Category = 'EC Designer'
      Caption = #24179#31227#23376#25511#20214
      Hint = #24179#31227#23376#25511#20214
    end
    object dsnCopy1: TdsnCopy
      Category = 'EC Designer'
      Caption = #22797#21046
      Enabled = False
      Hint = #22797#21046
      ImageIndex = 8
    end
    object dsnCut1: TdsnCut
      Category = 'EC Designer'
      Caption = #21098#20999
      Enabled = False
      Hint = #21098#20999
      ImageIndex = 9
    end
    object dsnDelete1: TdsnDelete
      Category = 'EC Designer'
      Caption = #21024#38500
      Enabled = False
      Hint = #21024#38500
      ImageIndex = 10
      ShortCut = 16430
    end
    object dsnPaste1: TdsnPaste
      Category = 'EC Designer'
      Caption = #31896#36148
      Enabled = False
      Hint = #31896#36148
      ImageIndex = 11
    end
    object dsnLockControls1: TdsnLockControls
      Category = 'EC Designer'
      Caption = #38145#23450#25511#20214
      Enabled = False
      Hint = #38145#23450#25511#20214
      ImageIndex = 13
      OnUpdate = dsnLockControls1Update
    end
    object dsnSelectAll1: TdsnSelectAll
      Category = 'EC Designer'
      Caption = #20840#36873
      Hint = #20840#36873
      ShortCut = 16449
    end
    object FileOpen: TAction
      Category = 'File'
      Caption = #25171#24320
      Hint = #25171#24320
      ImageIndex = 17
      OnExecute = FileOpenExecute
    end
    object FileSave: TAction
      Category = 'File'
      Caption = #20445#23384
      Hint = #20445#23384
      ImageIndex = 14
      OnExecute = FileSaveExecute
      OnUpdate = FileSaveUpdate
    end
    object FileExit: TAction
      Category = 'File'
      Caption = #36864#20986
      Hint = #36864#20986
      ImageIndex = 16
      OnExecute = FileExitExecute
    end
    object FileMerge: TAction
      Category = 'File'
      Caption = #25991#20214#21512#24182'...'
      OnExecute = FileMergeExecute
    end
    object DesignMode: TAction
      Category = 'EC Designer'
      Caption = #36816#34892#25928#26524
      ImageIndex = 12
      OnExecute = DesignModeExecute
    end
    object FileClose: TAction
      Category = 'File'
      Caption = #20851#38381
      OnExecute = FileCloseExecute
      OnUpdate = FileCloseUpdate
    end
    object FileCloseAll: TAction
      Category = 'File'
      Caption = #20851#38381#25152#26377
      OnExecute = FileCloseAllExecute
      OnUpdate = FileCloseUpdate
    end
    object actBDSStyle: TAction
      Category = 'EC Designer'
      AutoCheck = True
      Caption = 'BDS'#26679#24335
      OnExecute = actBDSStyleExecute
      OnUpdate = actBDSStyleUpdate
    end
    object actReadOnly: TAction
      Category = 'EC Designer'
      Caption = #21482#35835
    end
    object dsnUndo1: TdsnUndo
      Category = 'EC Designer'
      Caption = #25764#38144
      Enabled = False
      Hint = #25764#38144
      ImageIndex = 19
      ShortCut = 16474
    end
    object dsnRedo1: TdsnRedo
      Category = 'EC Designer'
      Caption = #37325#20570
      Enabled = False
      Hint = #37325#20570
      ImageIndex = 20
      ShortCut = 24666
    end
    object dsnTextEditMode1: TdsnTextEditMode
      Category = 'EC Designer'
      Caption = #25991#26412#32534#36753#27169#24335
      Enabled = False
      Hint = #25991#26412#32534#36753#27169#24335
      ImageIndex = 21
    end
    object dsnSaveAs: TAction
      Category = 'EC Designer'
      Caption = #21478#23384#20026
      Hint = #21478#23384#20026
      ImageIndex = 15
      OnExecute = dsnSaveAsExecute
      OnUpdate = dsnSaveAsUpdate
    end
    object actRightPageControl: TAction
      Category = 'View'
      Caption = #23646#24615#26597#30475#22120
      OnExecute = actRightPageControlExecute
      OnUpdate = actRightPageControlUpdate
    end
    object actLeftPageControl: TAction
      Category = 'View'
      Caption = #24037#20855#31665'/'#23545#35937#26641
      OnExecute = actLeftPageControlExecute
      OnUpdate = actLeftPageControlUpdate
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 420
    Top = 308
    object N2: TMenuItem
      Caption = '-'
    end
    object Copy2: TMenuItem
      Action = dsnCopy1
    end
    object Cut2: TMenuItem
      Action = dsnCut1
    end
    object Paste2: TMenuItem
      Action = dsnPaste1
      SubMenuImages = ImageList1
    end
  end
end
