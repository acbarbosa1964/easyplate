inherited frmEasyDBTool: TfrmEasyDBTool
  Left = 202
  Top = 134
  Caption = 'frmEasyDBTool'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TEasyPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 473
    Align = alClient
    BorderOuter = fsNone
    BorderColor = clNone
    FlatColor = clMoneyGreen
    FullRepaint = False
    GradientColorStop = clSkyBlue
    GridColor = clGradientActiveCaption
    TabOrder = 1
    VisualStyle = vsGradient
    object Splitter1: TSplitter
      Left = 185
      Top = 0
      Height = 473
    end
    object EasyPanel1: TEasyPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 473
      Align = alLeft
      BorderOuter = fsFlat
      TabOrder = 0
      object tvDataBase: TEasyTreeView
        Left = 1
        Top = 1
        Width = 183
        Height = 471
        SelectionPen.Color = clBtnShadow
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = False
        Images = imgImportance
        Indent = 19
        ParentCtl3D = False
        TabOrder = 0
        OnDblClick = tvDataBaseDblClick
        Items.Data = {
          01000000250000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          0CCAFDBEDDBFE2B8F9BDDAB5E3}
      end
    end
    object EasyPanel2: TEasyPanel
      Left = 188
      Top = 0
      Width = 674
      Height = 473
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 1
      object EasyPanel4: TEasyPanel
        Left = 0
        Top = 0
        Width = 674
        Height = 473
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 0
        object pgcDBDetail: TEasyPageControl
          Left = 0
          Top = 0
          Width = 674
          Height = 473
          ActivePage = tsbTableField
          Align = alClient
          TabIndex = 0
          TabOrder = 0
          FixedDimension = 19
          object tsbTableField: TEasyTabSheet
            Caption = 'TableField'
            object sgrdTableField: TEasyStringGrid
              Left = 0
              Top = 28
              Width = 670
              Height = 422
              Cursor = crDefault
              Align = alClient
              ColCount = 9
              RowCount = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 1
              OnGetAlignment = sgrdTableFieldGetAlignment
              OnGetEditorType = sgrdTableFieldGetEditorType
              DragDropSettings.ShowCells = False
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = clBtnFace
              ActiveCellColorTo = clBtnFace
              ColumnHeaders.Strings = (
                ''
                '<p align="center">'#23383#27573#21517#31216'</p>'
                '<p align="center">'#31867#22411'</p>'
                '<p align="center">'#38271#24230'</p>'
                '<p align="center">'#23567#25968#20301#25968'</p>'
                '<p align="center">'#20027#38190'</p>'
                '<p align="center">'#31354#21542'</p>'
                '<p align="center">'#40664#35748#20540'</p>'
                '<p align="center">'#35828#26126'</p>')
              ControlLook.FixedGradientFrom = clWhite
              ControlLook.FixedGradientTo = clBtnFace
              ControlLook.FixedGradientHoverFrom = 16775139
              ControlLook.FixedGradientHoverTo = 16775139
              ControlLook.FixedGradientHoverMirrorFrom = 16772541
              ControlLook.FixedGradientHoverMirrorTo = 16508855
              ControlLook.FixedGradientDownFrom = 16377020
              ControlLook.FixedGradientDownTo = 16377020
              ControlLook.FixedGradientDownMirrorFrom = 16242317
              ControlLook.FixedGradientDownMirrorTo = 16109962
              ControlLook.FixedGradientDownBorder = 11440207
              Filter = <>
              FixedColWidth = 21
              FixedRowHeight = 22
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = []
              FloatFormat = '%.2f'
              Look = glXP
              PrintSettings.DateFormat = 'dd/mm/yyyy'
              PrintSettings.Font.Charset = DEFAULT_CHARSET
              PrintSettings.Font.Color = clWindowText
              PrintSettings.Font.Height = -11
              PrintSettings.Font.Name = 'MS Sans Serif'
              PrintSettings.Font.Style = []
              PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
              PrintSettings.FixedFont.Color = clWindowText
              PrintSettings.FixedFont.Height = -11
              PrintSettings.FixedFont.Name = 'MS Sans Serif'
              PrintSettings.FixedFont.Style = []
              PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
              PrintSettings.HeaderFont.Color = clWindowText
              PrintSettings.HeaderFont.Height = -11
              PrintSettings.HeaderFont.Name = 'MS Sans Serif'
              PrintSettings.HeaderFont.Style = []
              PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
              PrintSettings.FooterFont.Color = clWindowText
              PrintSettings.FooterFont.Height = -11
              PrintSettings.FooterFont.Name = 'MS Sans Serif'
              PrintSettings.FooterFont.Style = []
              PrintSettings.PageNumSep = '/'
              ScrollWidth = 16
              SearchFooter.Color = clBtnFace
              SearchFooter.FindNextCaption = 'Find &next'
              SearchFooter.FindPrevCaption = 'Find &previous'
              SearchFooter.Font.Charset = DEFAULT_CHARSET
              SearchFooter.Font.Color = clWindowText
              SearchFooter.Font.Height = -11
              SearchFooter.Font.Name = 'MS Sans Serif'
              SearchFooter.Font.Style = []
              SearchFooter.HighLightCaption = 'Highlight'
              SearchFooter.HintClose = 'Close'
              SearchFooter.HintFindNext = 'Find next occurence'
              SearchFooter.HintFindPrev = 'Find previous occurence'
              SearchFooter.HintHighlight = 'Highlight occurences'
              SearchFooter.MatchCaseCaption = 'Match case'
              SelectionTextColor = clWhite
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              ColWidths = (
                21
                101
                64
                64
                64
                48
                38
                86
                161)
            end
            object EasyDockPanel1: TEasyDockPanel
              Left = 0
              Top = 0
              Width = 670
              Height = 28
              MinimumSize = 3
              LockHeight = False
              Persistence.Location = plRegistry
              Persistence.Enabled = False
              ToolBarStyler = EasyToolBarOfficeStyler1
              UseRunTimeHeight = True
              object EasyToolBar1: TEasyToolBar
                Left = 3
                Top = 1
                Width = 664
                Height = 26
                AllowFloating = True
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'MS Sans Serif'
                CaptionFont.Style = []
                CompactImageIndex = -1
                FullSize = True
                TextAutoOptionMenu = 'Add or Remove Buttons'
                TextOptionMenu = 'Options'
                ToolBarStyler = EasyToolBarOfficeStyler1
                Images = imgImportance
                ParentOptionPicture = True
                ToolBarIndex = -1
                object btnNew: TEasyToolBarButton
                  Left = 9
                  Top = 2
                  Width = 48
                  Height = 22
                  Appearance.CaptionFont.Charset = DEFAULT_CHARSET
                  Appearance.CaptionFont.Color = clWindowText
                  Appearance.CaptionFont.Height = -11
                  Appearance.CaptionFont.Name = 'Tahoma'
                  Appearance.CaptionFont.Style = []
                  Caption = #26032#24314
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ImageIndex = 12
                  ParentFont = False
                  Position = daTop
                  ShowCaption = True
                  OnClick = btnNewClick
                end
                object EasyToolBarButton3: TEasyToolBarButton
                  Left = 133
                  Top = 2
                  Width = 76
                  Height = 24
                  Appearance.CaptionFont.Charset = DEFAULT_CHARSET
                  Appearance.CaptionFont.Color = clWindowText
                  Appearance.CaptionFont.Height = -11
                  Appearance.CaptionFont.Name = 'Tahoma'
                  Appearance.CaptionFont.Style = []
                  Caption = #36171#20540#23545#35937
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ImageIndex = 13
                  ParentFont = False
                  Position = daTop
                  ShowCaption = True
                  OnClick = EasyToolBarButton3Click
                end
                object EasyToolBarButton1: TEasyToolBarButton
                  Left = 57
                  Top = 2
                  Width = 76
                  Height = 24
                  Appearance.CaptionFont.Charset = DEFAULT_CHARSET
                  Appearance.CaptionFont.Color = clWindowText
                  Appearance.CaptionFont.Height = -11
                  Appearance.CaptionFont.Name = 'Tahoma'
                  Appearance.CaptionFont.Style = []
                  Caption = #29983#25104#23545#35937
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ImageIndex = 13
                  ParentFont = False
                  Position = daTop
                  ShowCaption = True
                  OnClick = EasyToolBarButton1Click
                end
              end
            end
          end
          object EasyTabSheet1: TEasyTabSheet
            Caption = 'EasyTabSheet1'
            object EasyDockPanel2: TEasyDockPanel
              Left = 0
              Top = 0
              Width = 670
              Height = 28
              MinimumSize = 3
              LockHeight = False
              Persistence.Location = plRegistry
              Persistence.Enabled = False
              ToolBarStyler = EasyToolBarOfficeStyler1
              UseRunTimeHeight = True
              object EasyToolBar2: TEasyToolBar
                Left = 3
                Top = 1
                Width = 664
                Height = 26
                AllowFloating = True
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'MS Sans Serif'
                CaptionFont.Style = []
                CompactImageIndex = -1
                FullSize = True
                TextAutoOptionMenu = 'Add or Remove Buttons'
                TextOptionMenu = 'Options'
                ToolBarStyler = EasyToolBarOfficeStyler1
                ParentOptionPicture = True
                ToolBarIndex = -1
                object EasyToolBarButton2: TEasyToolBarButton
                  Left = 9
                  Top = 2
                  Width = 15
                  Height = 22
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
                  ParentFont = False
                  Position = daTop
                end
              end
            end
          end
        end
      end
    end
  end
  object actMain: TActionList
    Left = 288
    Top = 200
    object actAcceptMail: TAction
      Caption = #25910#20449
      ImageIndex = 38
    end
    object actSendMail: TAction
      Caption = #20889#20449
      ImageIndex = 25
    end
    object actLinkMans: TAction
      Caption = #32852#31995#20154
      ImageIndex = 43
    end
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
    Left = 352
    Top = 200
  end
  object imgImportance: TImageList
    Left = 424
    Top = 200
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
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
      0000000000006D332700853C130095440D0096450D00873D1200703425000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007037
      2A0070372A00CD772700E8AD7000F3CCA100F4CDA300E9B17600D07C2C006F35
      29006F3529000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB670300CB670300CB670300CB67
      0300CB670300CB670300CB670300CB670300CB67030000000000000000000000
      000000000000000000000000000000000000000000000000000086411D00C062
      0B00F0C29200FFFEFA00FDFAF600F5E3D100F5E2D000FDF8F400FFFFFD00F2C9
      9E00C66911007B3A210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFBF800FEF8F000FEF4
      E800FEF1E100FEEDDA00FEEAD300FDE7CD00CB67030000000000000000000000
      000000000000000000000000000000000000000000008C451C00C1610700F7DB
      BD00FFFEFE00E0A46B00CE6D1300C75C0000C9610000CE6E1200DE9D5F00FDFA
      F700FAE5CC00C6680D006F352800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEF9F300FEF6
      ED00FEF2E400FEEEDC00FEEBD400FDE7CD00CB67030000000000000000000000
      000000000000000000000000000000000000000000008C451C00ECBD8B00FFFF
      FF00DA8F4300C6560000FFFFFF00DC975100C75B0000CA620000C75B0000D583
      3300FDFAF800F3CB9F006F352800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF7
      EE00FEF3E600FEF0DF00FEECD700FDE9D100CB67030000000000000000000000
      000000000000000000000000000000000000A04D1000CE772100FFFDFB00E8B6
      8400D06B0400D06B0700FFFFFF00FFFFFF00E1A87000C95E0000CA630000C75B
      0000DFA06100FFFFFF00CF7B2800703525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A3400009A3400009A3400009A34
      00009A3400009A3400009A3400009A3400009A3400009A3400009A340000CB67
      030000000000036203000000000000000000AF550700E5AA6F00FFFFFF00DD8F
      3F00DA812800D87B1E00FFFFFF00FFFFFF00FFFFFF00EAC19800CC670800C95F
      0000CE6E0D00FDFAF600E9B17500703525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF8
      F000FEF5EA00FEF2E400FEF0DF00FEECD800FEEAD300FDE7CD00FCE6CB00CB67
      030000000000036203000362030000000000BB5F0A00F0CAA100FCF4ED00E193
      4300E2924200DF8A3400FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3DEC600CF70
      1700C95F0000F5E3D000F3CEA400703525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF9
      F300FEF6ED00FEF3E600FEF1E100FEEDDA00FEEBD400FDE8CF00FCE6CB00CB67
      030000000000036203009A9A9A0003620300C1650F00F2CDA600FDF7F000E9A1
      5800E9A05600E6994A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBC39B00CD6A
      0D00C9610000F6E6D400F3CCA100703525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFBF800FEF9
      F300FEF7EE00FEF4E800FEF1E100FEEEDC00FEEBD400FDE9D100FDE7CD00CB67
      030000000000036203000362030000000000C1640D00EEBC8800FFFFFF00F1B8
      7C00F0AE6900EEA75F00FFFFFF00FFFFFF00FFFFFF00E7B17A00CE690200C961
      0000CF711100FEFCFA00E7AC6D00703525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A3400009A3400009A3400009A34
      00009A3400009A3400009A3400009A3400009A3400009A3400009A340000CB67
      030000000000036203000000000000000000BF600600E5A05900FFFDFA00FBE0
      C400F8BA7B00F4B47100FFFFFF00FFFFFF00E8AB6D00D87B1D00D2741400C85C
      0000E2AA7100FFFFFE00CC752000703525000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF7
      EE00FEF2E400FEEEDC00FEEBD400FDE7CD00CB67030000000000000000000000
      00000000000000000000000000000000000000000000C3620400FAD9B800FFFF
      FF00FEDCB800F7B87700FFFFFF00EBAD6D00E08D3700DA822800D06B0500DB92
      4A00FFFFFF00EFC08C006B342C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFBF800FEF8
      F000FEF4E800FEF0DF00FEECD700FDE8CF00CB67030000000000000000000000
      00000000000000000000000000000000000000000000C3620400E79E5500FEEB
      D700FFFFFF00FBDFC300F1B57800E89F5500E2944500DE914200E8B78600FFFF
      FF00F6D8B700BE5F06006B342C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFCF900FEFA
      F600FEF6ED00FEF2E400FEEDDA00FEEBD400CB67030000000000000000000000
      0000000000000000000000000000000000000000000000000000C6670C00E69E
      5500FAD9B600FFFBF600FFFFFF00FEF8F200FDF6EF00FFFFFF00FEF9F200ECB8
      8400BE5F09007538260000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB670300CB670300CB670300CB67
      0300CB670300CB670300CB670300CB670300CB67030000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C060
      0500C0600500E49F5A00EEBA8600F2CAA000F0C59900E4A76800CC741E00783A
      2700783A27000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B65C0A00B8601200B9611300B25A0F00A24F0E008E451A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000732DE000732DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE0025A1D10072C7E70085D7
      FA0066CDF90065CDF90065CDF90065CDF90065CDF80065CDF90065CDF80066CE
      F90039ADD800078DBE000000000000000000000000000732DE000732DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000732DE000732DE0000000000CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE004CBCE70039A8D100A0E2
      FB006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D90084D7EB00078DBE0000000000000000000732DE000732DE000732
      DE00000000000000000000000000000000000000000000000000000000000000
      00000732DE000732DE000000000000000000FEFAF500FEF9F200FEF4E800FEEE
      DC00FEEAD300FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900AEF1F900078DBE0000000000000000000732DE000732DD000732
      DE000732DE000000000000000000000000000000000000000000000000000732
      DE000732DE00000000000000000000000000FEFAF500FEFAF500FEF6EC00FEF2
      E300FEECD800FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0079DDFB001899C7009ADF
      F30092E7FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00B3F4F900078DBE000000000000000000000000000534ED000732
      DF000732DE000732DE00000000000000000000000000000000000732DE000732
      DE0000000000000000000000000000000000FEFAF500FEFAF500FEF8F100FEF4
      E800FEEEDC00FEEAD300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE0082E3FC0043B7DC0065C3
      E000ACF0FD008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD000C85
      18004CBBDA00B6F7F9006DCAE000078DBE000000000000000000000000000000
      00000732DE000732DE000732DD00000000000732DD000732DE000732DE000000
      0000000000000000000000000000000000009835000098350000983500009835
      00009835000098350000CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF3E900FEF7F000FEF7F000FEF3E900FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE008AEAFC0077DCF300229C
      C600FDFFFF00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE000C8518003CBC
      5D000C851800DEF9FB00D6F6F900078DBE000000000000000000000000000000
      0000000000000732DD000633E6000633E6000633E9000732DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000364000000000000CB6601009835
      0000983500009835000098350000983500000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A4000000000000000000078DBE0093F0FE0093F0FD001697
      C500078DBE00078DBE00078DBE00078DBE00078DBE000C85180052D97F0062ED
      970041C465000C851800078DBE00078DBE000000000000000000000000000000
      000000000000000000000633E3000732E3000534EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000036400000364000000000000CB660100FEF9
      F200FEF4E800FEEEDC00FEEAD300FEE7D3000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A4000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE000C85180046CE6C0059E4880058E1
      880061EB940040C165000C851800000000000000000000000000000000000000
      0000000000000732DD000534ED000533E9000434EF000434F500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000003640000A28B73000364000000000000CB660100FEFA
      F500FEF6EC00FEF2E300FEECD800FEE7D3000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A4000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE000C8518000C8518000C8518000C85180056E1
      840047CD6E000C8518000C8518000C8518000000000000000000000000000000
      00000434F4000534EF000533EB0000000000000000000434F4000335F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000036400000364000000000000CB660100FEFA
      F500FEF8F100FEF4E800FEEEDC00FEEAD3000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A400000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078CB60043B7DC0043B7DC0043B7DC000C8518004EDD
      790036BA54000C85180000000000000000000000000000000000000000000335
      FC000534EF000434F800000000000000000000000000000000000335FC000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000364000000000000CB6601009835
      0000983500009835000098350000983500000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000000000000C85180040D0
      65000C85180000000000000000000000000000000000000000000335FB000335
      FB000335FC000000000000000000000000000000000000000000000000000335
      FB000335FB000000000000000000000000009835000098350000983500009835
      00009835000098350000CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C8518002AB743002DBA
      49000C851800000000000000000000000000000000000335FB000335FB000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000335FB000000000000000000FEFAF500FEF9F200FEF4E800FEEE
      DC00FEEAD300FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C85180021B538000C85
      1800000000000000000000000000000000000335FB000335FB000335FB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFAF500FEFAF500FEF6EC00FEF2
      E300FEECD800FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C8518000C8518000C8518000C8518000000
      0000000000000000000000000000000000000335FB000335FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFAF500FEFAF500FEF8F100FEF4
      E800FEEEDC00FEEAD300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C8518000C8518000C8518000C85180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E80AA000E80
      AA0066666600FDFEFD00D6CCCB00D6CCCB006666660000000000000000000000
      00000000000000000000000000000000000000000000000000000E80AA000E80
      AA000E80AA000E80AA0099330000FDFEFE00FDFEFE00FDFEFE008EA4FD00B8C6
      FD00FDFEFE009933000000000000000000000000000000000000D5820000D582
      0000D5820000D5820000D5820000D5820000D5820000D5820000D5820000D582
      0000D5820000D582000000000000000000000000000000000000D5820000D582
      0000D5820000D5820000D5820000D5820000D5820000D5820000D5820000D582
      0000D5820000D5820000000000000000000000000000078DBB0049D5EE0023D7
      FE0066666600B0ACAC00FDFEFD00D6CCCB006666660000000000000000000000
      00000000000000000000000000000000000000000000078DBB0049D5EE0023D7
      FE0036D9FE006FE6FF0099330000FDFEFE00FDFEFE007E98FC000335FB00597A
      FC00FDFEFE0099330000000000000000000000000000D5820000FEEEDA00FEEB
      D500FEE8CF00FEE6CA00FEE3C400FEE2C200FEDFBC00FEDDB800FDDBB400FDDB
      B400FDDBB400FDDBB400D58200000000000000000000D5820000FEEEDB00FEEB
      D500FEE8CF00FEE7CC00FEE3C500FEE2C200FEDFBC00FEDDB800FDDBB500FDDB
      B500FDDBB500FDDBB500D582000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE0058585800B9B7B600F2F0EF009A97960066666600666666000000
      000000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF0099330000D6DEFE004368FC000335FB004368FC000335
      FB00D9E0FE0099330000000000000000000000000000D5820000FEF1E100FEED
      DA00FEEBD500FEE9D100FEE6CA00FEE3C400FEE2C200FEDFBC00FEDDB800FDDB
      B400FDDBB400FDDBB400D58200000000000000000000D5820000FEF0DE00FEED
      DA00FEEBD500FEE9D100FEE5C900FEE3C500FEE2C200FEDFBD00FEDDB800FDDB
      B500FDDBB500FDDBB500D582000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF0058585800BFBEBE00F2F0F000CDC9C700D6CCCB006666
      660066666600666666006666660000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF00993300005274FC001442FB00BCC9FD00EFF2FE001A47
      FB004F72FC0097330400000000000000000000000000D5820000FEF2E3000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FDDBB400D58200000000000000000000D5820000FEF2E4000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FDDBB500D582000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0058585800C2C1C100F2F0EF00E0DCDC00E9E2
      E100C0B9B700A69F9D00C2B6B40066666600078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF0099330000E4EAFE00D9E0FE00FDFEFE00FDFEFE0098AC
      FD000335FB0064345900000000000000000000000000D5820000FEF5EA00FEF3
      E500FEEFDE00FEEEDA00FEEBD500FEE8CF00FEE6CA00FEE3C400FEE1C100FEDF
      BC00FEDDB800FDDBB400D58200000000000000000000D5820000FEF5EA00FEF2
      E400FEF0DE00FEEEDB00FEEBD500FEE8CF00FEE7CC00FEE3C500FEE1C000FEDF
      BC00FEDDB800FDDBB500D582000000000000078DBB00B3FCFE00B6F6FF00C6F5
      FF00E2F9FE00EBFBFF00E2F9FE00AFE4F30058585800C2C1C100F2F0F000C2C1
      C10066666600BFBEBE00B9ADAB0066666600078DBB00B3FCFE00B6F6FF00C6F5
      FF00E3FAFF00EBFBFF0099330000FDFEFE00FDFEFE00FDFEFE00FDFEFE00FDFE
      FE005274FC000335FB00000000000000000000000000D5820000FEF7EE00FEF5
      EA00FEF3E500FEF1E100FEEDDA00009800000098000000980000009800000098
      000000980000FEDDB800D58200000000000000000000D5820000FEF7EE000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FEDDB800D582000000000000078DBB00BAEEF60030BCDD0011A7
      D200129FCB0020A2CB0035A7CD002692BF0058585800BFBEBE00D6CCCB006666
      6600BFBEBE00666666009A97960066666600078DBB00BAEEF60030BCDD0011A7
      D200129FCB0020A2CB0099330000993300009933000099330000993300009933
      00008F3311002235C8000335FB000000000000000000D5820000FEF9F200FEF7
      EE00FEF5EA00FEF3E500FEF1E100FEEEDB00FEEBD500FEE8CF00FEE6CA00FEE4
      C800FEE1C100FEDFBC00D58200000000000000000000D5820000FEF9F200FEF7
      EE00FEF5EA00FEF3E600FEF0DE00FEEEDB00FEEBD500FEE8CF00FEE5C900FEE3
      C500FEE1C000FEDFBC00D582000000000000078DBB004AC5DD0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E30058585800C2C1C10066666600D6CC
      CB0066666600000000009A97960066666600078DBB004AC5DD0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E3000682B6000E80AA00000000000000
      000000000000000000000335FB000335FB0000000000D5820000FEFBF7000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FEE1C100D58200000000000000000000D5820000FEFBF7000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FEE1C000D582000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E30058585800C2C1C100D5D2D100E0DC
      DC009A9796009D989700B9B7B60066666600078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      00000000000000000000000000000335FB0000000000D5820000FEFCFA00FEFB
      F700FEF9F200FEF7EE00FEF4E800FEF2E300FEF1E100FEEEDB00FEEBD500FEE8
      CF00FEE6CA00FEE4C800D58200000000000000000000D5820000FEFCFA00FEFB
      F700FEF9F200FEF7EE00FEF4E900FEF2E400FEF0DE00FEEEDB00FEEBD500FEE8
      CF00FEE7CC00FEE3C500D582000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF0066666600666666006666
      660066666600666666006666660000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      00000000000000000000000000000000000000000000D5820000FEFCFA00FEFC
      FA00FEFBF700FEF9F200FEF6ED00009800000098000000980000009800000098
      000000980000FEE6CA00D58200000000000000000000D5820000FEFCFA000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FEE5C900D582000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      000000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D9FE006FE6FF008DE7FA0049C1E300089DCF000E80AA00000000000000
      00000000000000000000000000000000000000000000D5820000FEFCFA00FEFC
      FA00FEFCF900FEFBF700FEF9F200FEF7EE00FEF5EA00FEF3E500FEEFDE00FEEE
      DB00FEEBD500FEE8CF00D58200000000000000000000D5820000FEFCFA00FEFC
      FA00FEFCF900FEFBF700FEF9F200FEF7EE00FEF5EA00FEF3E600FEEFDD00FEEE
      DB00FEEBD500FEE8CF00D582000000000000078DBB0091FCFE0082F8FF006FF8
      FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000E80AA00000000000000
      000000000000000000000000000000000000078DBB0091FCFE0082F8FF006FF8
      FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000E80AA00000000000000
      00000000000000000000000000000000000000000000D5820000FEFCFA000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FEEBD500D58200000000000000000000D5820000FEFCFA000098
      0000009800000098000000980000009800000098000000980000009800000098
      000000980000FEEBD500D582000000000000078DBB00FDFEFD00F4FFFF00D3FF
      FF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000E80AA00000000000000
      000000000000000000000000000000000000078DBB00FDFEFE00F4FFFF00D3FF
      FF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000E80AA00000000000000
      00000000000000000000000000000000000000000000D5820000FEFCFA00FEFC
      FA00FEFCFA00FEFCFA00FEFCF900FEFBF700FEF9F200FEF7EE00FEF5EA00FEF3
      E500FEEFDE00FEEEDA00D58200000000000000000000D5820000FEFCFA00FEFC
      FA00FEFCFA00FEFCFA00FEFCF900FEFBF700FEF9F200FEF7EE00FEF5EA00FEF3
      E600FEF0DE00FEEEDB00D582000000000000000000000C92C000F4FFFF00E2F9
      FE00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF0000000000000000000000
      000000000000000000000000000000000000000000000C92C000F4FFFF00E3FA
      FF00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF0000000000000000000000
      0000000000000000000000000000000000000000000000000000D5820000D582
      0000D5820000D5820000D5820000D5820000D5820000D5820000D5820000D582
      0000D5820000D582000000000000000000000000000000000000D5820000D582
      0000D5820000D5820000D5820000D5820000D5820000D5820000D5820000D582
      0000D5820000D582000000000000000000000000000000000000078DBB00078D
      BB00078DBB00078DBB00078DBB00078DBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000078DBB00078D
      BB00078DBB00078DBB00078DBB00078DBB000000000000000000000000000000
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
      000000000000000000006D7C94006F7C88000000000000000000000000000000
      0000000000000000000000000000000000000000000008750D0008750D000875
      0D0008750D000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000009C3B0C009C3B0C009C3B0C009C3B
      0C009C3B0C000000000000000000000000000000000000000000000000000D80
      AA000D80AA000D80AA000D80AA000D80AA000D80AA0000000000000000000000
      00000000000000000000000000000000000000000000000000000D7FA9000E80
      AA000D7FA9000E80AA000E80AA001081AB000000000000000000000000000000
      000000000000788295001F89E00059A9DC0000000000000000000E80AA000E80
      AA000E80AA000E80AA000E80AA000E80AA000000000008750D0013AA220010A6
      1D0008750D000000000000000000000000000000000000000000000000000000
      0000CC680200CC680200CC680200CD6904009C3B0C00F89A9400EBA15E00DA84
      2C009C3B0C000000000000000000000000000000000000000000078DBB0049D5
      EE0023D6FD0036D9FE006FE6FF008DE7FA0044BADD000D80AA00000000000000
      00000000000000000000000000000000000000000000048CB90048D5EE0022D7
      FC0035D8FD006FE6FF008DE6FA0044BADD000E80AA0000000000000000000000
      0000788295002087DE004EB7FF0057AEF40000000000078DBB0049D5EE0023D7
      FE0036D8FD006FE6FF008DE7FA0044BADD000E80AA0008750D001AB12D0013AA
      220008750D000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000009B3A0C009C3B0C009C3A0C009B3A
      0C009C3B0C0000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0035D3F70000009A0000009A0000009A0000009A0000009A000000
      9A0000009A0000009A000000000000000000048CB9008CFAFD0058E9FD0022D7
      FC0035D8FD0070E6FF008DE6FA004ABFE0000F9DCE001180A700000000008B86
      97001F7ECE004EB7FF0057AEF40000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF0008750D0008750D0008750D0008750D0025BD3E001CB4
      310008750D0008750D0008750D0008750D000000000000000000000000000000
      0000CC6802000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0035D3F70000009A003E6EFF00285BFF001248FF000236FF000029
      F900001DEC0000009A000000000000000000088EBC008CFAFD0058E9FD0022D7
      FC0035D8FD0075D3E900B1979400C2A69A00C6AEA000AE877C008C6B6C006092
      BD004EB7FF004EB7FF000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF0008750D003CD4620035CE590030C952002CC3490026BE
      410025BD3E001AB12D0017AF2A0008750D000000000000000000000000000000
      0000CC6802000000000000000000000000009C3B0C009C3B0C009C3B0C009C3B
      0C009C3B0C0000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0035D4F80000009A004474FF003264FF001B50FF00083CFF000029
      F9000022F10000009A000000000000000000088EBC008CFAFD0058E9FD0024D8
      FD0046C6E400AB939500ECDDCC00FEFED600FFFFE400F7F2D900CFB7A100AD85
      80004EB7FF00000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF0008750D0041DA6D0041DA6D0038D15E0035CE59002CC3
      49002AC1470025BD3E0020B8360008750D000000000000000000000000000000
      0000CC680200CC680200CC680200CC6802009C3B0C00F89A9400EBA15E00DA84
      2C009C3B0C0000000000000000000000000000000000078DBB00B3FCFE00B6F6
      FF00C6F5FF00E1F8FD0000009A0000009A0000009A0000009A0000009A000000
      9A0000009A0000009A000000000000000000048CB900B4FFFF00B6F6FF00C6F5
      FF00B5A09F00E8DDD600FFFFF400FEFED600FFFEDD00FEFED600FFF2BA00CAA0
      8C0000000000000000000000000000000000078DBB00B3FCFE00B6F6FF00C6F5
      FF00E3FAFF00E9F9FD0008750D0008750D0008750D0008750D003FD868003CD4
      620008750D0008750D0008750D0008750D000000000000000000000000000000
      0000CC6802000000000000000000000000009B3A0C009C3B0C009C3A0C009B3A
      0C009C3B0C0000000000000000000000000000000000078DBB00BAEEF60030BC
      DD0011A7D200129ECA0020A2CB0035A7CD002692BF0092CEE4000D80AA000000
      000000000000000000000000000000000000048CB900B8EDF60030BCDC0011A7
      D1009C919000FFFFE400FFFEDD00FEFED600FFFEDD00FCF5CD00F8D09800ECD1
      AC00AD858000000000000000000000000000078DBB00BAEEF60030BCDD0011A7
      D200129FCB0020A1CA0035A7CD002692BF0092CEE40008750D0045DD710041DA
      6D0008750D000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBB004AC5DD0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E3000682B6000D80AA000000
      000000000000000000000000000000000000088EBC004BC6DC0058E9FD0022D7
      FC00A49E9900FFFEDD00FFFEDD00FFFEDD00FFFEDD00F6DAAB00F3BE8000F5DE
      B500AD858000000000000000000000000000078DBB004AC5DD0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E3000682B60008750D004DE67F004DE6
      7F0008750D000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000009C3B0C009C3B0C009C3B0C009C3B
      0C009C3B0C0000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E300089DCF000D80AA000000
      000000000000000000000000000000000000048CB9008CFAFD0058E9FD0024D8
      FD0096959400FAF6D600FFFEDD00FAF6D600F9E1B100F5CB9A00FEEAB900E4CC
      A900AD858000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E300089CCE0008750D0008750D000875
      0D0008750D000000000000000000000000000000000000000000000000000000
      0000CC680200CC680200CC680200CC6802009C3B0C00F89A9400EBA15E00DA84
      2C009C3B0C0000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E300089DCF000D80AA000000
      000000000000000000000000000000000000048CB9008CFAFD0058E9FD0024D8
      FD005EA8BE00D3BBA200FFF7C600F8D09800F4C88E00FEF7E000F9F6F200AD85
      800000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E300089CCE000E7FA900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC6802000000000000000000000000009B3A0C009C3B0C009C3A0C009B3A
      0C009C3B0C0000000000000000000000000000000000078DBB008CFBFE0059EA
      FE0023D6FD0036D9FE006FE6FF008DE7FA0049C1E300089DCF000D80AA000000
      000000000000000000000000000000000000048CB9008CFAFD0058E9FD0024D8
      FD0039D7FB008AA5AD00CDAC9300ECD1AC00F5E1B600DAC5B700AD858000AD85
      800000000000000000000000000000000000078DBB008CFBFE0059EAFE0023D7
      FE0036D8FD006FE6FF008DE7FA0049C1E300089CCE000E80AA00000000000000
      00000000000000000000000000000000000000000000000000009C3B0C009C3B
      0C009C3B0C009C3B0C009C3B0C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBB0091FCFE0082F8
      FF006FF8FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000D80AA000000
      000000000000000000000000000000000000088EBC008CFAFD0081F8FE0071F9
      FE007BFFFF0097FCFD00A1C6C8008F989B008683880087707000000000000000
      000000000000000000000000000000000000078DBB0091FCFE0082F8FF006FF8
      FF007AFEFF0091FCFE00A0FCFE0063DAF5000DA2D4000E80AA00000000000000
      00000000000000000000000000000000000000000000000000009C3B0C00F89A
      9400EBA15E00DA842C009C3B0C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBB00FCFFFF00F4FF
      FF00D3FFFF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000D80AA000000
      000000000000000000000000000000000000048CB900FBFFFF00F5FFFE00D2FF
      FF00B4FFFF00ADFFFE00ADFFFE00ADFFFE0071F9FE000E80AA00000000000000
      000000000000000000000000000000000000078DBB00FCFFFF00F4FFFF00D3FF
      FF00B3FCFE00B3FCFE00ADFFFF00ADFFFF006FF8FF000E80AA00000000000000
      00000000000000000000000000000000000000000000000000009B3A0C009C3B
      0C009C3A0C009B3A0C009C3B0C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C92C000F4FF
      FF00E1F8FD00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF00000000000000
      000000000000000000000000000000000000000000000A91C100F5FFFE00E3FE
      FF00C6FEFF00ADFFFE00A7FFFF009BFBFD001285B00000000000000000000000
      000000000000000000000000000000000000000000000C92C000F4FFFF00E3FA
      FF00C7FFFF00ADFFFF00A0FCFE009BFBFC001385AF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000078D
      BB00078DBB00078DBB00078DBB00078DBB00078DBB0000000000000000000000
      0000000000000000000000000000000000000000000000000000088EBC00088E
      BC00048CB900088EBC00088EBC00088EBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000078DBB00078D
      BB00078DBB00078DBB00078DBB00078DBB000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF81F00000000FFFFE00700000000
      007FC00300000000007F800100000000007F800100000000007F000000000000
      000B000000000000000900000000000000080000000000000009000000000000
      000B000000000000007F800100000000007F800100000000007FC00300000000
      007FE00700000000FFFFF81F00000000C0038003FFFCFFFFC00300039FF901FF
      C00300018FF301FFC003000187E701FFC0030001C3CF01FFC0030000F11F01FF
      C0030000F83FFF40C0030000FC7FFE40C0030001F83FFC40C0030000F19FFE40
      C0038003E3CFFF40C003C3C7C7E701FFC007FF878FFB01FFC00FFF8F1FFF01FF
      C01FFE1F3FFF01FFC03FF87FFFFF01FFF8FFFC03FFFFFFFFC07FC003C003C003
      807F800380018001001F00038001800100010003800180010000000380018001
      000000038001800100000001800180010004003C800180010000003E80018001
      0001003F80018001003F003F80018001003F003F80018001003F003F80018001
      807F807FC003C003C0FFC0FFFFFFFFFFFFFFFFFFFFFCFF87F707E07FC0F8C087
      F007C03F80708007F707800300210000F7FF800300030000F707800300070000
      F0078003000F0000F707801F00070007F7FF801F00070007F707801F00070007
      F007801F000F003FF707801F000F003FC1FF801F003F003FC1FF801F003F003F
      C1FFC03F807F807FFFFFE07FC0FFC0FF}
  end
  object cdsDataBases: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 284
    Top = 164
  end
  object cdsTableField: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 316
    Top = 164
  end
end
