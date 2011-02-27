object frmEasyWorkFlowMain: TfrmEasyWorkFlowMain
  Left = 276
  Top = 186
  Width = 870
  Height = 500
  Caption = 'frmEasyWorkFlowMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 119
    Height = 335
  end
  object EasyDockPanel1: TEasyDockPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 119
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    ToolBarStyler = EasyToolBarOfficeStyler1
    UseRunTimeHeight = True
    object EasyToolBar1: TEasyToolBar
      Left = 159
      Top = 1
      Width = 548
      Height = 26
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
      object EasyToolBarSeparator1: TEasyToolBarSeparator
        Left = 350
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object DgrColorSelector2: TDgrColorSelector
        Left = 9
        Top = 2
        Width = 36
        Height = 22
        Hint = 'Shape color'
        TabOrder = 0
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        SelectedColor = clWhite
        ShowRGBHint = True
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        DropDownButton = True
        Glyph.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          1800000000000802000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFF0000007B7B7B000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0000007B7B7B7B7B7B7B7B7B00
          0000FFFFFFFFFFFFFFFFFF7B7B7BFFFFFF00FFFFFFFFFFFF000000BDBDBDBDBD
          BDBDBDBD7B7B7B7B7B7B000000FFFFFFFFFFFF7B00007B7B7B00FFFFFF000000
          FFFFFFBDBDBDBDBDBDBDBDBDBDBDBD7B7B7B7B7B7B000000FFFFFF7B00007B00
          0000000000BDBDBDFFFFFFFFFFFFBDBDBDBDBDBDBDBDBDBDBDBD7B7B7B7B7B7B
          7B00007B00007B000000FFFFFF000000BDBDBDFFFFFFFFFFFFBDBDBD000000BD
          BDBDBDBDBD7B7B7B7B00007B00007B000000FFFFFFFFFFFF000000BDBDBDFFFF
          FF0000007B0000000000BDBDBD7B00007B00007B00007B000000FFFFFFFFFFFF
          FFFFFF000000BDBDBDFFFFFF7B0000BDBDBD7B7B7B7B00007B00007B0000FFFF
          FF00FFFFFFFFFFFFFFFFFF7B0000000000BDBDBD7B00007B7B7B0000007B7B7B
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF7B0000FFFFFF0000007B000000
          00007B7B7BFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF7B0000FFFF
          FFFFFFFF7B00007B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFF7B7B7B7B00007B00007B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00}
        Style = ssButton
        ShowMoreColors = False
      end
      object DgrGradientDirectionSelector2: TDgrGradientDirectionSelector
        Left = 45
        Top = 2
        Width = 36
        Height = 22
        Hint = 'Gradient'
        TabOrder = 1
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        ShowSelectedGradient = True
        StartColor = clWhite
        EndColor = clGray
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        DropDownButton = True
        Style = ssButton
        SelectedIndex = -1
      end
      object DgrBrushStyleSelector2: TDgrBrushStyleSelector
        Left = 81
        Top = 2
        Width = 23
        Height = 22
        Hint = 'Brush style'
        TabOrder = 2
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        BrushAutoColor = True
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        Glyph.Data = {
          B6030000424DB603000000000000360000002800000012000000100000000100
          18000000000080030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFA2B0B5575F6763757CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96ADB750
          68704078902038408E98A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EB2BC60708060B8D040A8C03090B0
          2038408F99A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFF98B3C37090A080D0E070D0E060B8D040A8C03090B0203840919A
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFAFCDD280B8
          C090D8E080E0F080D8F070D0E060B8D040A8C03090B0304050BCBDC0FFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFBDD8E490C0D0B0E8F0C0F8FFA0E8F090
          E0F080D8F070D0E060B8D06098A0605850504840B3B4B3FFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFF90D0E0B0E8F0C0FFFFC0FFFFB0F8FFB0F0FF90E0F080D8F0
          80B8C0606060808080606060504840FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          A0D8E0C0F8FFC0FFFFC0FFFFC0FFFFC0FFFFB0F8FF90C8D0807880A098A08078
          70707070505040FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF9AC4D380B8
          C0B0F0F0C0FFFFC0FFFFB0E0E0A0A0A0E0E0E0908880B0A8B0505050918993E5
          E9EBFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDFE6E992BAC880B0C0B0
          D8E0B0B0B0F0E8F0D0C8C0E0D8E0808080806060674A4AB6B4B6E6EAECFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDD8DDB0B0B0E0E0E0D0C8D0
          E0E0E0A0A0A0C09890D06060903840684A4AB8B5B6FFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D4D5B0B0B0B0B0B0B0B0B0CFC7C4B088
          90D09090D06060903840684A4AFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAC9CBC09090E09090B0
          6870806870FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D8D7C29595C08890FFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        Style = ssButton
        SelectedIndex = -1
      end
      object DgrShadowSelector2: TDgrShadowSelector
        Left = 104
        Top = 2
        Width = 36
        Height = 22
        Hint = 'Shadow'
        TabOrder = 3
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        ShowSettingsOption = True
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        DropDownButton = True
        Glyph.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          18000000000008020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFF509050607060607060506050304030202820101810101810101810
          101810101810FFFFFF00FFFFFF50905070C08060A86060A06050986050905050
          8850508050507850407040101810FFFFFF00FFFFFF60986080C08070C08070B8
          7060B07060A86060A060509850509040507850101810FFFFFF00FFFFFF609860
          80C89080C08070C08070B87060B07060A86060A060509850508050101810FFFF
          FF00FFFFFF60987090D09080C89080C08070C08070B87060B07060A86060A060
          508850101810FFFFFF00FFFFFF70A070A0D0A090D09080C89080C08070C08070
          B87060B07060A860509050202820FFFFFF00FFFFFF70A880B0D8B0A0D0A090D0
          9080C89080C08070C08070B87060B070509860304030FFFFFF00FFFFFF80B080
          B0E0C0B0D8B0A0D0A090D09080C89080C08070C08070B87060A060506050FFFF
          FF00FFFFFF80B890C0E0C0B0E0C0B0D8B0A0D0A090D09080C89080C08070C080
          60A860607060FFFFFF00FFFFFF80C090C0E0C0C0E0C0B0E0C0B0D8B0A0D0A090
          D09080C89080C08070C080607060FFFFFF00FFFFFF90C8A080C09080B89080B0
          8070A88070A070609870609860609860509050509050FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00}
        Style = ssButton
        SelectedIndex = -1
      end
      object DgrPenStyleSelector2: TDgrPenStyleSelector
        Left = 140
        Top = 2
        Width = 23
        Height = 22
        Hint = 'Line style'
        TabOrder = 4
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        Glyph.Data = {
          7E030000424D7E030000000000003600000028000000130000000E0000000100
          18000000000048030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFF
          FF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFF000000000000FFFFFFFF
          FFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFF000000000000000000FFFFFF0000000000000000
          00FFFFFF000000000000000000FFFFFF000000000000000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF0000
          00FFFFFF000000FFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000}
        Style = ssButton
        SelectedIndex = -1
      end
      object DgrPenColorSelector2: TDgrPenColorSelector
        Left = 163
        Top = 2
        Width = 36
        Height = 22
        Hint = 'Line color'
        TabOrder = 5
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        DropDownButton = True
        Glyph.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          1800000000000802000000000000000000000000000000000000FF00FF000000
          7B00007B00007B00007B7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF00FF00FFFF00FF000000FFFFFF7B00007B00007B0000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF000000FFFFFF7B00007B00007B
          0000FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF000000FFFF
          FF7B00007B00007B00007B0000FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
          FF00FFFF00FF000000FFFFFF7B00007B00007B00007B0000FF00FFFF00FFFF00
          FF00FF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFF7B00007B00007B0000
          FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFF
          FFFF7B00007B0000FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF000000000000000000000000FF00FFFF00FFFF00FF00FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF7B7B7B00000000FFFF00FFFF000000FF00FFFF00
          FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000FFFF00FFFF
          000000FF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF00000000FFFF00FFFF000000FF00FF00FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF00}
        SelectedColor = clBlack
        Style = ssButton
        ShowMoreColors = False
      end
      object DgrTransparencySelector2: TDgrTransparencySelector
        Left = 199
        Top = 2
        Width = 36
        Height = 22
        Hint = 'Transparency'
        TabOrder = 6
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        DropDownButton = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA05020A05020A0
          5020A05020A05020A05020A05020A05020A05020A05020FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFA05020FFA880FFA870FFA070FFA070FF9870FF9860FF98
          60FF9060A05020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA05020FFB080FF
          A880FFA870FFA070FFA070FF9870FF9860FF9860A05020FF00FFFF00FFFF00FF
          CDE2E71088C01088C01088C01088C01088C01088C0F0A880FFA070FFA070FFA0
          70FF9860A05020FF00FFFF00FFC1DFE61088C070D8F060D0F07098A090C0D090
          C0C090B8C01088C0E0A890FFA070FFA070FFA070A05020FF00FFE2EDE91088C0
          80E0F080E0F070D8F080A0A0A0C8D090C0D090C0C090C0C01088C0F0A880FFA8
          70FFA070A05020FF00FF45A7C790E8F090E0F080E0F080E0F080A0A0A0C8D0A0
          C8D0A0C0D090C0C090C0C01088C0FFA880FFA870A05020FF00FF1088C0A0E8F0
          90E8F090E8F080E0F090A0A0B0D0D0A0C8D0A0C8D0A0C0D090C0C01088C0FFB0
          80FFA880A05020FF00FF1088C0A0F0F0A0E8F090E8F090E8F090A8A0B0D0D0B0
          D0D0A0C8D0A0C8D0A0C8D01088C0FFB080FFB080A05020FF00FF1088C0B0F0F0
          A0F0F0A0E8F0A0E8F090A8A090A8A090A8A080A0A080A0A080A0A01088C0A050
          20A05020A05020FF00FF1088C0B0F0F0B0F0F0A0F0F0A0E8F0A0E8F090E8F090
          E0F080E0F070D8F070D8F01088C0FF00FFFF00FFFF00FFFF00FF39A2C4B0F0F0
          B0F0F0B0F0F0A0F0F0A0E8F0A0E8F090E8F090E0F080E0F080E0F045A7C7FF00
          FFFF00FFFF00FFFF00FFD3E3E71088C0B0F0F0B0F0F0B0F0F0A0F0F0A0F0F0A0
          E8F090E8F090E0F01088C0CDE2E7FF00FFFF00FFFF00FFFF00FFFF00FFC6E4E6
          1088C0B0F0F0B0F0F0B0F0F0B0F0F0A0F0F0A0E8F01088C0C1E2E6FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFD3E3E7399BC41088C01088C01088C010
          88C039A2C4D0E3E7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Style = ssButton
        SelectedIndex = -1
      end
      object DgrZoomSelector2: TDgrZoomSelector
        Left = 235
        Top = 2
        Width = 56
        Height = 22
        Button.Color = 16572875
        Button.ColorTo = 14722429
        Button.ColorHot = 14483455
        Button.ColorHotTo = 6013175
        Button.ColorDown = 557032
        Button.ColorDownTo = 8182519
        Button.Width = 12
        DisplayRecentSelection = False
        DropDownCount = 8
        BorderColor = clNone
        BorderHotColor = clBlack
        LookUp = False
        SelectionColor = 14722429
        Text = '100%'
        Version = '1.1.0.0'
        DropDownListColor = clWindow
        Diagram = WorkflowDiagramMain
      end
      object DgrPenWidthSelector2: TDgrPenWidthSelector
        Left = 291
        Top = 2
        Width = 23
        Height = 22
        Hint = 'Line width'
        TabOrder = 8
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        Glyph.Data = {
          A6020000424DA6020000000000003600000028000000110000000C0000000100
          18000000000070020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFF000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00}
        Style = ssButton
        SelectedIndex = -1
      end
      object DgrTextColorSelector2: TDgrTextColorSelector
        Left = 314
        Top = 2
        Width = 36
        Height = 22
        Hint = 'Text color'
        TabOrder = 9
        Version = '2.0.0.0'
        Diagram = WorkflowDiagramMain
        AutoThemeAdapt = False
        BorderDownColor = 7021576
        BorderHotColor = clBlack
        Color = 16440774
        ColorDown = 11900292
        ColorHot = 14073525
        ColorDropDown = 16251129
        ColorSelected = 14604246
        ColorSelectedTo = clNone
        DropDownButton = True
        Glyph.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          18000000000008020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFA87D6885513A766049FFFFFFFFFFFFFFFFFFFFFFFF603820704020
          70402067422BFFFFFF00FFFFFFDCDDDD94603AFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF70382076422BFFFFFFFFFFFF00FFFFFFFFFFFFB58A74A47B5DFFFF
          FFFFFFFFFFFFFFFFFFFF804830704020936E5EFFFFFFFFFFFF00FFFFFFFFFFFF
          DBD6D4A058409F6C529265529F6C5294583A804830703820FFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFAC795FFFFFFFFFFFFFFFFFFF95603B905030986F5E
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFCBB9ABAC795FFFFFFFD4C5BC90
          5830905030D0C3BCFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFA468
          4AE3E2E2A073529050309A6246FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFC59980BB9480A06040905030CDBBB2FFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E5B07050B07050A4684AFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC08870B07050E3
          D5CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFBF8F77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00}
        SelectedColor = clWindowText
        Style = ssButton
        ShowMoreColors = False
      end
      object DgrFontSizeSelector1: TDgrFontSizeSelector
        Left = 360
        Top = 2
        Width = 47
        Height = 22
        Button.Color = 16572875
        Button.ColorTo = 14722429
        Button.ColorHot = 14483455
        Button.ColorHotTo = 6013175
        Button.ColorDown = 557032
        Button.ColorDownTo = 8182519
        Button.Width = 12
        DisplayRecentSelection = False
        DropDownCount = 8
        BorderColor = clNone
        BorderHotColor = clBlack
        LookUp = False
        SelectionColor = 14722429
        Text = '8'
        Version = '1.1.0.0'
        DropDownListColor = clWindow
        Diagram = WorkflowDiagramMain
      end
      object DgrFontSelector1: TDgrFontSelector
        Left = 407
        Top = 2
        Width = 127
        Height = 22
        Button.Color = 16572875
        Button.ColorTo = 14722429
        Button.ColorHot = 14483455
        Button.ColorHotTo = 6013175
        Button.ColorDown = 557032
        Button.ColorDownTo = 8182519
        Button.Width = 12
        DropDownCount = 8
        BorderColor = clNone
        BorderHotColor = clBlack
        SelectionColor = 14722429
        Text = 'MS Sans Serif'
        Version = '1.1.0.0'
        DropDownListColor = clWindow
        Diagram = WorkflowDiagramMain
        FontGlyphTT.Data = {
          D6000000424DD60000000000000076000000280000000D0000000C0000000100
          0400000000006000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD000000D
          D000DDDDDDD00DDDD000DDDDDDD00DDDD000D77777700DDDD000DDD77DD00DDD
          D000DDD70DD00DD0D000DDD70DD00DD0D000DDD700D00D00D0007DD700000000
          D0007DD77DD7DDDDD00077D77D77DDDDD00077777777DDDDD000}
        FontGlyphPS.Data = {
          D6000000424DD60000000000000076000000280000000D0000000C0000000100
          0400000000006000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          D000D9997DD997DDD0009999979979DDD000997D7999D79DD000997DD7997DDD
          D000997DDD799DDDD000799DDDD997DDD000D997DDD799DDD000D799DDDD997D
          D000DD799DDD799DD000DDD799DD7997D000DDDDD9999779D000}
        FontGlyphPRN.Data = {
          D6000000424DD60000000000000076000000280000000D0000000C0000000100
          0400000000006000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000000
          D00007777777AA7700000888888888870000D00000000000D000DD07FFFFF70D
          D000DD0F00000F0DD000DD07FFFFF70DD000DD0F00000F0DD000DD07FFFFF70D
          D000DD0F00000F0DD000DD07FFFFF70DD000DD000000000DD000}
        FontGlyphBMP.Data = {
          D6000000424DD60000000000000076000000280000000D0000000C0000000100
          0400000000006000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          D000DDDDDD99DD99D000DDDDDD99DD99D000D11DD199DD99D000D11DD1999999
          D000D11DD199DD99D000D1111199DD99D000D11DD199DD99D000D11DD119999D
          D000D11DD11D99DDD000DD1111DDDDDDD000DDD11DDDDDDDD000}
        FontHeight = 12
        TabOrder = 11
      end
    end
    object EasyToolBar2: TEasyToolBar
      Left = 3
      Top = 59
      Width = 856
      Height = 59
      AllowFloating = True
      AutoDockOnClose = True
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
      object TabControl1: TTabControl
        Left = 0
        Top = 0
        Width = 856
        Height = 59
        Align = alClient
        TabOrder = 0
        Tabs.Strings = (
          'All objects')
        TabIndex = 0
        object DiagramToolBar1: TDiagramToolBar
          Left = 4
          Top = 24
          Width = 848
          Height = 29
          Diagram = WorkflowDiagramMain
          KeepInsertingMode = kmNever
          Mode = tmObjects
          ButtonSize = 29
        end
      end
    end
    object EasyToolBar3: TEasyToolBar
      Left = 3
      Top = 1
      Width = 153
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
        Action = actWFNew
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
      object EasyToolBarButton2: TEasyToolBarButton
        Left = 33
        Top = 2
        Width = 24
        Height = 24
        Action = actWFOpen
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
      object EasyToolBarButton3: TEasyToolBarButton
        Left = 57
        Top = 2
        Width = 24
        Height = 24
        Action = actWFSave
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
      object EasyToolBarSeparator3: TEasyToolBarSeparator
        Left = 81
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton4: TEasyToolBarButton
        Left = 91
        Top = 2
        Width = 24
        Height = 24
        Action = actPrint
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
      object EasyToolBarButton5: TEasyToolBarButton
        Left = 115
        Top = 2
        Width = 24
        Height = 24
        Action = actPreview
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
    end
    object EasyToolBar4: TEasyToolBar
      Left = 6
      Top = 30
      Width = 603
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
      object EasyToolBarButton6: TEasyToolBarButton
        Left = 173
        Top = 2
        Width = 24
        Height = 24
        Action = acAlignLeft
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
      object EasyToolBarButton7: TEasyToolBarButton
        Left = 197
        Top = 2
        Width = 24
        Height = 24
        Action = acAlignCenter
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
      object EasyToolBarButton8: TEasyToolBarButton
        Left = 221
        Top = 2
        Width = 24
        Height = 24
        Action = acAlignRight
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
      object EasyToolBarSeparator2: TEasyToolBarSeparator
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
        Action = acBold
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
      object EasyToolBarButton10: TEasyToolBarButton
        Left = 279
        Top = 2
        Width = 24
        Height = 24
        Action = acItalic
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
      object EasyToolBarButton11: TEasyToolBarButton
        Left = 303
        Top = 2
        Width = 24
        Height = 24
        Action = acUnderline
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
      object EasyToolBarSeparator4: TEasyToolBarSeparator
        Left = 327
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton12: TEasyToolBarButton
        Left = 337
        Top = 2
        Width = 24
        Height = 24
        Action = acVertAlignTop
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
      object EasyToolBarButton13: TEasyToolBarButton
        Left = 361
        Top = 2
        Width = 24
        Height = 24
        Action = acVertAlignMiddle
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
      object EasyToolBarButton14: TEasyToolBarButton
        Left = 385
        Top = 2
        Width = 24
        Height = 24
        Action = acVertAlignBottom
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
      object EasyToolBarSeparator5: TEasyToolBarSeparator
        Left = 409
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton15: TEasyToolBarButton
        Left = 419
        Top = 2
        Width = 15
        Height = 24
        Action = actWFGroup
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
      object EasyToolBarButton16: TEasyToolBarButton
        Left = 434
        Top = 2
        Width = 15
        Height = 24
        Action = actWFUnGroup
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
      object EasyToolBarSeparator6: TEasyToolBarSeparator
        Left = 105
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton17: TEasyToolBarButton
        Left = 9
        Top = 2
        Width = 24
        Height = 24
        Action = actWFCut
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
      object EasyToolBarButton18: TEasyToolBarButton
        Left = 33
        Top = 2
        Width = 24
        Height = 24
        Action = actWFCopy
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
      object EasyToolBarButton19: TEasyToolBarButton
        Left = 57
        Top = 2
        Width = 24
        Height = 24
        Action = actWFPaste
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
      object EasyToolBarButton20: TEasyToolBarButton
        Left = 81
        Top = 2
        Width = 24
        Height = 24
        Action = actWFDelete
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
      object EasyToolBarButton21: TEasyToolBarButton
        Left = 459
        Top = 2
        Width = 24
        Height = 24
        Action = actWFGradientSetting
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
      object EasyToolBarSeparator7: TEasyToolBarSeparator
        Left = 449
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton22: TEasyToolBarButton
        Left = 483
        Top = 2
        Width = 24
        Height = 24
        Action = actWFBlockPicture
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
      object EasyToolBarButton23: TEasyToolBarButton
        Left = 507
        Top = 2
        Width = 24
        Height = 24
        Action = actWFShadow
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
      object EasyToolBarSeparator8: TEasyToolBarSeparator
        Left = 531
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
      object EasyToolBarButton24: TEasyToolBarButton
        Left = 541
        Top = 2
        Width = 24
        Height = 24
        Action = actBringToFront
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
      object EasyToolBarButton25: TEasyToolBarButton
        Left = 565
        Top = 2
        Width = 24
        Height = 24
        Action = actWFSendToBack
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
      object EasyToolBarButton26: TEasyToolBarButton
        Left = 115
        Top = 2
        Width = 24
        Height = 24
        Action = actWFUndo
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
      object EasyToolBarButton27: TEasyToolBarButton
        Left = 139
        Top = 2
        Width = 24
        Height = 24
        Action = actWFRedo
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
      object EasyToolBarSeparator9: TEasyToolBarSeparator
        Left = 163
        Top = 2
        Width = 10
        Height = 23
        LineColor = clBtnShadow
      end
    end
  end
  object EasyPanel1: TEasyPanel
    Left = 0
    Top = 119
    Width = 185
    Height = 335
    Align = alLeft
    TabOrder = 3
    object WorkDefListView1: TWorkDefListView
      Left = 2
      Top = 2
      Width = 181
      Height = 331
      Align = alClient
      Columns = <>
      TabOrder = 0
    end
  end
  object EasyStatusBar1: TEasyStatusBar
    Left = 0
    Top = 454
    Width = 862
    Height = 19
    AnchorHint = False
    Panels = <
      item
        AppearanceStyle = psLight
        DateFormat = 'yyyy-M-d'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'h:mm:ss'
        Width = 80
      end
      item
        AppearanceStyle = psLight
        DateFormat = 'yyyy-M-d'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'h:mm:ss'
        Width = 100
      end
      item
        AppearanceStyle = psLight
        DateFormat = 'yyyy-M-d'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'h:mm:ss'
        Width = 130
      end
      item
        AppearanceStyle = psLight
        DateFormat = 'yyyy-M-d'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'h:mm:ss'
        Width = 50
      end>
    SimplePanel = False
    URLColor = clBlue
    Styler = EasyStatusBarOfficeStyler1
    Version = '0.0.0.0'
  end
  object EasyPanel2: TEasyPanel
    Left = 188
    Top = 119
    Width = 674
    Height = 335
    Align = alClient
    TabOrder = 4
    object WorkflowDiagramMain: TWorkflowDiagram
      Left = 2
      Top = 2
      Width = 670
      Height = 331
      NettoExportOffset = 3
      AutomaticNodes = False
      AutoScroll = True
      AutoPage = False
      Background.Scroll = True
      Background.Style = biTile
      Background.Visible = False
      Background.Gradient.Direction = grTopBottom
      Background.Gradient.StartColor = clWhite
      Background.Gradient.EndColor = clYellow
      Background.Gradient.Visible = False
      Background.PrintGradient = False
      SnapGrid.Active = False
      SnapGrid.Force = False
      SnapGrid.Visible = True
      SnapGrid.SizeX = 7.559055118110236000
      SnapGrid.SizeY = 7.559055118110236000
      SnapGrid.Style = gsDots
      SnapGrid.SnapToRuler = True
      ShowLinkPoints = True
      LeftRuler.Visible = True
      LeftRuler.Divisions = 5
      LeftRuler.Font.Charset = DEFAULT_CHARSET
      LeftRuler.Font.Color = clWindowText
      LeftRuler.Font.Height = -9
      LeftRuler.Font.Name = 'Arial'
      LeftRuler.Font.Style = []
      LeftRuler.Units = unCenti
      LeftRuler.MinorTickLength = 4
      LeftRuler.MajorTickLength = 6
      LeftRuler.Color = clWhite
      LeftRuler.TickColor = clBlack
      LeftRuler.Size = 16
      LeftRuler.AutoFactor = True
      LeftRuler.GridColor = clBlack
      TopRuler.Visible = True
      TopRuler.Divisions = 5
      TopRuler.Font.Charset = DEFAULT_CHARSET
      TopRuler.Font.Color = clWindowText
      TopRuler.Font.Height = -9
      TopRuler.Font.Name = 'Arial'
      TopRuler.Font.Style = []
      TopRuler.Units = unCenti
      TopRuler.MinorTickLength = 4
      TopRuler.MajorTickLength = 6
      TopRuler.Color = clWhite
      TopRuler.TickColor = clBlack
      TopRuler.Size = 16
      TopRuler.AutoFactor = True
      TopRuler.GridColor = clBlack
      Zoom = 100
      BorderColor = clGray
      MouseWheelMode = mwOff
      ActiveLayers = 0
      LinkCursor = crHandPoint
      PanCursor = crHandPoint
      ZoomCursor = crDefault
      IgnoreScreenDPI = False
      ShowCrossIndicators = False
      PageLines.Visible = False
      PageLines.Pen.Style = psDot
      KeyActions = [kaEscape, kaMove, kaPage, kaResize, kaSelect]
      HandlesStyle = hsClassic
      SmoothMode = smAntiAlias
      TextRenderingMode = tmAntiAlias
      SelectionMode = slmMultiple
      CanMoveOutOfBounds = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      BiDiMode = bdLeftToRight
      BorderStyle = bsSingle
      Color = clWhite
      ParentColor = False
      PopupMenu = PopupMenu1
      ShowHint = False
      TabOrder = 0
      IdlePercent = 30
      RunColor = clWhite
      Variables = <>
      Attachments = <>
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
    Left = 424
    Top = 240
  end
  object EasyStatusBarOfficeStyler1: TEasyStatusBarOfficeStyler
    BorderColor = 14986888
    PanelAppearanceLight.BorderColor = 14922381
    PanelAppearanceLight.BorderColorHot = clGray
    PanelAppearanceLight.BorderColorDown = 10240783
    PanelAppearanceLight.Color = 16440774
    PanelAppearanceLight.ColorTo = 14854530
    PanelAppearanceLight.ColorHot = 13958143
    PanelAppearanceLight.ColorHotTo = 6538487
    PanelAppearanceLight.ColorDown = 9232890
    PanelAppearanceLight.ColorDownTo = 1940207
    PanelAppearanceLight.ColorMirror = 14854530
    PanelAppearanceLight.ColorMirrorTo = 14854530
    PanelAppearanceLight.ColorMirrorHot = 6538487
    PanelAppearanceLight.ColorMirrorHotTo = 6538487
    PanelAppearanceLight.ColorMirrorDown = 1940207
    PanelAppearanceLight.ColorMirrorDownTo = 1940207
    PanelAppearanceLight.TextColor = clBlack
    PanelAppearanceLight.TextColorHot = clBlack
    PanelAppearanceLight.TextColorDown = clBlack
    PanelAppearanceLight.TextStyle = []
    PanelAppearanceDark.BorderColor = clNone
    PanelAppearanceDark.BorderColorHot = clGray
    PanelAppearanceDark.BorderColorDown = 10240783
    PanelAppearanceDark.Color = 13861717
    PanelAppearanceDark.ColorTo = 10240783
    PanelAppearanceDark.ColorHot = 13958143
    PanelAppearanceDark.ColorHotTo = 6538487
    PanelAppearanceDark.ColorDown = 9232890
    PanelAppearanceDark.ColorDownTo = 1940207
    PanelAppearanceDark.ColorMirror = 10240783
    PanelAppearanceDark.ColorMirrorTo = 10240783
    PanelAppearanceDark.ColorMirrorHot = 6538487
    PanelAppearanceDark.ColorMirrorHotTo = 6538487
    PanelAppearanceDark.ColorMirrorDown = 1940207
    PanelAppearanceDark.ColorMirrorDownTo = 1940207
    PanelAppearanceDark.TextColor = clWhite
    PanelAppearanceDark.TextColorHot = clWhite
    PanelAppearanceDark.TextColorDown = clWhite
    PanelAppearanceDark.TextStyle = []
    Left = 640
    Top = 256
  end
  object WorkflowADODB1: TWorkflowADODB
    Left = 308
    Top = 116
  end
  object WorkflowDB1: TWorkflowDB
    WorkInsBindary.TableName = 'wsworkflowinstance'
    WorkInsBindary.KeyField = 'id'
    WorkInsBindary.WorkflowField = 'workflow'
    WorkInsBindary.WorkDefKeyField = 'workflowdefinitionkey'
    WorkInsBindary.CreatedOnField = 'createdon'
    WorkDefBindary.TableName = 'wsworkflowdefinition'
    WorkDefBindary.KeyField = 'id'
    WorkDefBindary.WorkflowField = 'workflow'
    WorkDefBindary.NameField = 'name'
    TaskInsBindary.TableName = 'wstaskinstance'
    TaskInsBindary.KeyField = 'id'
    TaskInsBindary.TaskField = 'task'
    TaskInsBindary.UserIdField = 'userid'
    TaskInsBindary.NameField = 'name'
    TaskInsBindary.WorkInsKeyField = 'workflowinstancekey'
    TaskInsBindary.WorkDefKeyField = 'workflowdefinitionkey'
    TaskInsBindary.CompletedField = 'completed'
    TaskInsBindary.CreatedOnField = 'createdon'
    TaskInsBindary.ModifiedOnField = 'modifiedon'
    TaskInsBindary.ModifiedUserIdField = 'modifieduserid'
    TaskLogBindary.TableName = 'wstasklog'
    TaskLogBindary.KeyField = 'id'
    TaskLogBindary.TaskInsKeyField = 'taskinstancekey'
    TaskLogBindary.EventDateField = 'eventdate'
    TaskLogBindary.OperationField = 'operation'
    TaskLogBindary.UserIdField = 'userid'
    TaskLogBindary.InfoField = 'info'
    TaskLogBindary.Info2Field = 'info2'
    AttachmentBindary.TableName = 'wsattachment'
    AttachmentBindary.KeyField = 'id'
    AttachmentBindary.ContentField = 'filecontent'
    AttachmentBindary.WorkKeyField = 'workkey'
    AttachmentBindary.CreatedOnField = 'createdon'
    AttachmentBindary.ObjectTypeField = 'objecttype'
    DestroyQueries = False
    Left = 348
    Top = 116
  end
  object ImageList1: TImageList
    Left = 304
    Top = 192
    Bitmap = {
      494C010115001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000804040008040400080404000804040008040
      4000804040000000000000000000000000000000000000000000000000000000
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
      0000000000008040400000000000000000000000000000000000000000000000
      0000000000000000000080404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008040400000000000000000000000000000000000000000000000
      0000000000000000000080404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008040
      4000804040008040400000000000000000000000000000000000000000000000
      0000000000000000000080404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008040400000000000000000000000000000000000000000000000
      0000000000000000000080404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      0000000000008040400000000000000000000000000000000000000000000000
      0000000000000000000080404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      0000000000000000000000000000804040008040400080404000804040008040
      4000804040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008040
      4000804040008040400080404000804040000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000A03D07000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A23F080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A13E0800B04D0600A13E
      0800000000000000000000000000000000000000000000000000000000000000
      0000A13E0800B04D0600A13E0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A13E0800BF5B0300BD58
      0400A13E0800000000000000000000000000000000000000000000000000A13E
      0800BD580400BF5B0300A13E0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008040400080404000804040008040400080404000804040008040
      4000804040000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A13E0800A4410800C864
      0100B34F0500A13E080000000000000000000000000000000000A13D0800B34F
      0500C8640100A13E0800A13E0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008040400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      800080808000808080000000000000000000A03D0700A03D0700A03D0700A03D
      0700A03D0700A03D0700A03D0700A13E0800A13E080000000000A13E0800A441
      0800C8640100AD490600A13E08000000000000000000A13D0800AE4C0900C965
      0200A4410800A13E080000000000A13E0800A13E0800A03D0800A03D0800A03D
      0800A03D0800A03D0800A13E0800A13E08000000000000000000000000000000
      0000000000008040400000000000000000000000000000000000000000000000
      0000000000000000000080404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000808080000000000000000000A03D0700E18B2F00D3761900C664
      0600C45E0100C5600200C6600200C6610200B04D0600A03D070000000000A13E
      0800A9470700C8640100A44108000000000000000000A4420900D97E1C00AA48
      0900A13E080000000000A13E0800B04D0600C6610200C6600200C5600200C560
      0300C45F0300C45F0300C5600300A03E08000000000000000000000000000000
      0000000000008040400000000000000000000000000000000000000000000000
      000000000000000000008040400000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000080808000808080000000000000000000A03D0700FFB95100E9943300E186
      2000A03D0700A03D0700A03D0700A03D0700A03D070000000000000000000000
      0000A13E0800B9550500B9550500A13E0800A03C0600CE762600C96F1F00A03C
      0700000000000000000000000000A13E0800A13E0800A13E0800A13E0800AD4B
      0600CC680000C9640200D06B0000A03D08000000000080404000804040008040
      4000804040008040400080404000804040008040400080404000000000000000
      000000000000000000008040400000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000080808000808080000000000000000000A03D0700FFBC5300E9943300E692
      3300CF741F009E3A060000000000000000000000000000000000000000000000
      000000000000A6430700C6600200A03E08009F3B0600ED9D4000A13E08000000
      00000000000000000000000000000000000000000000000000009F3C0800BD59
      0400C6620200AA460600D06B0000A03D08000000000080404000000000000000
      0000000000008040400000000000000000000000000080404000000000000000
      000000000000000000008040400000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000080808000808080000000000000000000A03D0700FFBC5300B4551600A13F
      0800F8A94200BE6119009E3B0600000000000000000000000000000000000000
      000000000000A03D0800D16C0000A03D08009E3A0500FFBF55009D3905000000
      00000000000000000000000000000000000000000000A03D0800B24E0500CD69
      0000A23F0900A13E0800D06B0000A03D08000000000080404000000000000000
      0000000000008040400000000000000000000000000080404000000000000000
      000000000000000000008040400000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000080808000808080000000000000000000A03D0700FFBD5400A03D07009D39
      0500B1521400FBAD4700D07623009E3B06000000000000000000000000000000
      0000A13E0800A9460700CB660100A03D08009E3B0500FAAE4B00B15114009F3C
      060000000000000000000000000000000000A03D0800BC570300CE690000A946
      0700A03D0800A13E0800D16C0000A03D08000000000080404000000000000000
      0000000000008040400000000000000000000000000080404000000000000000
      000000000000000000008040400000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000080808000808080000000000000000000A03D0700FFBD5400A03D07000000
      00009F3B0600B2521400F0A04000DC862D00A4400800A03C070000000000A13D
      0800A03D0800C25E0200B9550500A13E08009F3C0600D27C2D00E6953C009D39
      0500A13E0800000000009F3C0600A3410900CC6D1300CB680600A6420700A13E
      080000000000A13E0800D16C0000A03D08000000000080404000000000000000
      0000000000008040400080404000804040008040400080404000804040008040
      400080404000804040008040400000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000080808000808080000000000000000000A03D0700FFBE5400A03D07000000
      000000000000A03C0600A5420A00DF8A3400EF9D3900BD5E1500AF4D0A00AC48
      0600C25E0200C6600200A44108000000000000000000A5430A00EE9E4100E795
      3C00B85A1800B95A1900C56A2100ED9A3700CA6E1B00A4410900A13E08000000
      000000000000A13E0800D16C0000A03D08000000000080404000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000808080008080800000000000000000009F3B0600FCB04C00A03D07000000
      00000000000000000000A03D07009F3B0600B85A1900D77F2800D77B1E00C361
      0A00AF4C0600A03D0800A13E08000000000000000000A03D07009F3B0600BF63
      1E00E08E3800EE9E4100DA853200B1521300A03C0700A13E0800000000000000
      000000000000A13E0800C9640100A13E08000000000080404000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000A03C0600000000000000
      000000000000000000000000000000000000A03D0700A03C0700A03D0700A03D
      0800A13E0800000000000000000000000000000000000000000000000000A03C
      06009F3C06009F3B06009F3C0600A03D07000000000000000000000000000000
      00000000000000000000A13E0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080404000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008040
      4000804040008040400080404000804040008040400080404000000000000000
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
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF000000FFFF0000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000007B7B7B007B7B7B00000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF00000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FF000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000007B7B7B007B7B7B00000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FF000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FF000000FF0000000000000000000000000000007B7B7B007B7B
      7B000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FF0000000000000000000000000000007B7B7B007B7B
      7B0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FF000000FF0000000000000000000000000000007B7B7B007B7B
      7B000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FF0000000000000000000000000000007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FF000000FF0000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000636E7B0000000000C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E98C7003489D0007F859D00C2A6
      A400FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00FEFCFB00C2A6A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004BB6FF00288BE0008584
      9800FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00FEFCFB00C2A6A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B7B0000000000000000
      0000000000007B0000007B0000007B0000007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000007B0000007B0000000000000000000000000000000000004DB5FF00278B
      DE0079819A00FEFBF700FEFBF700FEFBF700FEFBF700FEFBF700FEFBF700FEFB
      F700FEFBF700FEFBF700C2A6A400000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B7B00000000
      00000000000000000000FFFFFF007B0000007B0000007B000000000000000000
      0000000000000000000000000000000000007B7B7B00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000004CB9
      FF005A91BF00E0CCC800C4A39F00B0878300C4A39F00E0CCC800FEF9F400FEF9
      F400FEF9F400FEF9F400C2A6A400000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF007B0000007B0000007B0000000000
      0000000000000000000000000000000000007B7B7B00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000007B0000007B0000007B0000007B
      0000007B0000007B00000000000000000000000000000000000000000000C2A6
      A400D1B7B200B8908A00D3B5A800EFDBC300D2B1A000B78E8600E0CBC500FEF7
      F000FEF7F000FEF7F000C2A6A400000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B0000000000000000000000
      00007B0000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF007B0000007B0000007B0000007B00
      0000000000000000000000000000000000007B7B7B00FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B00000000000000000000000000000000000000000000C2A6
      A400C4A29D00D4B9B100F9EADA00F8E7D200FFFFF700D2B0A000C4A29D00FEF5
      EC00FEF5EC00FEF5EC00C2A6A40000000000000000000000000000000000FFFF
      FF00BDBDBD00BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B00000000000000
      00007B0000007B00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B0000007B0000007B00
      00007B0000000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000007B0000007B0000007B0000007B
      0000007B0000007B00000000000000000000000000000000000000000000C2A6
      A400B0868200F5EAE300F9EFE300F8EADA00FFFFF000F0DAC400B0868200FEF3
      E900FEF3E900FEF3E900C2A6A400000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF007B0000007B00
      00007B0000000000000000000000000000007B7B7B00FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00007B0000007B
      0000007B0000007B00000000000000000000000000000000000000000000C2A6
      A400C4A19B00D6BFBA00FBF3EB00FAEFE200FFFFDE00D3B5A800C4A19B00FFF1
      E500FFF1E500FFF1E500C2A6A40000000000000000000000000000000000BDBD
      BD00FFFFFF00FFFFFF00BDBDBD0000000000BDBDBD00BDBDBD007B7B7B007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007B00
      00007B0000000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000007B0000007B00000000000000000000000000000000000000000000C2A6
      A400E0C7BC00B8928F00D6BFBA00F5EAE200D4B9B100B8908A00CBB2A800DDCF
      C200DDCFC200DDCFC200C2A6A400000000000000000000000000000000000000
      0000BDBDBD00FFFFFF00000000007B00000000000000BDBDBD007B0000007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00FFFFFF00FFFF0000FFFF
      FF00BDBDBD00BDBDBD00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000007B00000000000000000000000000000000000000000000C2A6
      A400FFEEDE00E0C5BA00C4A09900B0868200C4A09900E0C5BA00C5B5A900C3B4
      A800C2B3A700C1B2A600C2A6A400000000000000000000000000000000000000
      000000000000BDBDBD00FFFFFF007B000000BDBDBD007B7B7B007B0000007B00
      00007B0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B000000000000FF
      FF0000FFFF000000000000000000000000007B7B7B00FFFFFF00FFFFFF00BDBD
      BD00FFFFFF0000FFFF00BDBDBD00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF00000000000000000000000000000000000000000000C2A6
      A400FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00B0A29600B0A2
      9600B0A29600B0A29600C2A6A400000000000000000000000000000000000000
      00007B00000000000000BDBDBD007B0000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000007B7B7B00FFFFFF00FFFF0000BDBD
      BD0000FFFF00FFFFFF00BDBDBD00FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF000000000000000000000000000000000000000000C2A6
      A400FFEAD700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FBF8F400FBF8
      F400E6DAD900C2A6A40000000000000000000000000000000000000000000000
      00007B00000000000000000000007B000000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF00000000000000000000000000000000000000000000C2A6
      A400FFE8D300FFE8D300FFE8D300FFE8D300FFE8D300C9B9AC00FBF8F400DFCE
      C700C2A6A4000000000000000000000000000000000000000000000000000000
      00007B00000000000000000000007B0000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF000000000000000000000000000000000000000000C2A6
      A400FFE6D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DFCEC700C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B0000007B0000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000868484008684840000000000000000008684840086848400000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE0025A1D10072C7E70085D7
      FA0066CDF90065CDF90065CDF90065CDF90065CDF80065CDF90065CDF80066CE
      F90039ADD800078DBE000000000000000000000000000000000097433F009743
      3F00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B009330
      300097433F000000000000000000000000000000000000000000000000008684
      8400BCBABA00B5B3B300868484008684840086848400EBEAEA00868484008684
      8400868484000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE004CBCE70039A8D100A0E2
      FB006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D90084D7EB00078DBE00000000000000000097433F00D6686800C660
      6000E5DEDF0092292A0092292A00E4E7E700E0E3E600D9DFE000CCC9CC008F20
      1F00AF46460097433F000000000000000000000000000000000086848400E3E2
      E200B5B3B300B5B3B300B5B3B300515050004F4F4F0086878700CDCDCD00E8E9
      E900C7C6C6008684840086848400868484000000000000000000C2A6A400FEFA
      F500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900AEF1F900078DBE00000000000000000097433F00D0656600C25F
      5F00E9E2E20092292A0092292A00E2E1E300E2E6E800DDE2E400CFCCCF008F22
      2200AD46460097433F0000000000000000000000000086848400DEDDDD00D6D6
      D600A4A3A300A4A3A300A4A3A300565555001615160012121200181818001212
      120093939300CACACA0086848400000000000000000000000000C2A6A400FEFA
      F500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0079DDFB001899C7009ADF
      F30092E7FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00B3F4F900078DBE00000000000000000097433F00D0656500C15D
      5D00ECE4E40092292A0092292A00DFDDDF00E1E6E800E0E5E700D3D0D2008A1E
      1E00AB44440097433F00000000000000000086848400D6D6D600D6D6D600A4A3
      A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D9D00797677001212
      12001414140013131300868484008F8C8C000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE0082E3FC0043B7DC0065C3
      E000ACF0FD008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD000C85
      18004CBBDA00B6F7F9006DCAE000078DBE000000000097433F00D0656500C15B
      5C00EFE6E600EDE5E500E5DEDF00E0DDDF00DFE0E200E0E1E300D6D0D200962A
      2A00B24A4A0097433F00000000000000000086848400D6D6D600A4A3A300F3F2
      F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBD
      BD00A2A0A00073717100939191008E8C8C000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF3E900FEF7F000FEF7F000FEF3E900FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE008AEAFC0077DCF300229C
      C600FDFFFF00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE000C8518003CBC
      5D000C851800DEF9FB00D6F6F900078DBE000000000097433F00CD626300C860
      6000C9676700CC727200CA727100C6696900C4646400CC6D6C00CA666700C55D
      5D00CD65650097433F00000000000000000086848400A4A3A300FFFFFF00FEFD
      FD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CECF00E0E0E000E1E1
      E100D4D3D300C7C6C600A7A5A500868383000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A4000000000000000000078DBE0093F0FE0093F0FD001697
      C500078DBE00078DBE00078DBE00078DBE00078DBE000C85180052D97F0062ED
      970041C465000C851800078DBE00078DBE000000000097433F00B6555300C27B
      7800D39D9C00D7A7A500D8A7A600D8A6A500D7A09F00D5A09F00D7A9A700D8AB
      AB00CC66670097433F000000000000000000000000008684840086848400F1F0
      F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2AD
      AE00CAC9C900DCDCDC00D0D0D000868484000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A4000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE000C85180046CE6C0059E4880058E1
      880061EB940040C165000C851800000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000008684
      8400CAA09700BA9E8700A2897E0095817B00897C7F00928C9200A5A2A400BBB6
      B700D7D6D600CFCFCF0086848400000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A4000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE000C8518000C8518000C8518000C85180056E1
      840047CD6E000C8518000C8518000C8518000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      0000CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A78600CC9A99009895
      9600868484008684840000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A400000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078CB60043B7DC0043B7DC0043B7DC000C8518004EDD
      790036BA54000C85180000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      0000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD39F00CC9A99000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000000000000C85180040D0
      65000C8518000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F000000000000000000000000000000000000000000CE9D
      9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C8518002AB743002DBA
      49000C8518000000000000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F000000000000000000000000000000000000000000CC9A
      9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C85180021B538000C85
      1800000000000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000CC9A9900FFFF
      F500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C8518000C8518000C8518000C8518000000
      000000000000000000000000000000000000000000000000000097433F00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F90097433F000000000000000000000000000000000000000000CC9A9900CC9A
      9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A990000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C8518000C8518000C8518000C85180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900CC9A9900CC9A99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5420800A7440700A23F080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900B8898900B8898900B8898900B8898900B8898900B889
      8900B8898900B8898900B889890000000000000000000000000000669A000066
      9A0000669A00B8898900B8898900B8898900B8898900B8898900B8898900B889
      8900B8898900B8898900B8898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A23F0800A5420800A23F0800A542080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900FEFEFD00FEFEFE00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00B8898900000000000000000000669A003CBEE30036BA
      E10030B6DF00B8898900FEFEFD00FEFEFE00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00B8898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F0800A23F080000000000A23F
      0800A74407000000000000000000000000000000000000000000000000000000
      000000000000B8898900FEFBF800B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEFBF800B8898900000000000000000000669A0045C4E6003FC0
      E40038BCE200B8898900FEFBF800B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEFBF800B8898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F080000000000A23F0800A23F
      0800A23F0800A542080000000000000000000000000000000000000000000000
      000000000000B8898900FEF8F300FEFAF600FEF8F300FEF8F300FEF8F300FEF8
      F300FEF8F300FEF8F300B8898900000000000000000000669A004DC9E90047C4
      E70041C0E500B8898900FEF8F300FFF4EC00FEF6EE00FEF8F100FFF9F400FEFB
      F600FEFCF900FEF8F300B8898900000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000A5420800A23F0800A23F0800A23F080000000000A23F08000000
      000000000000A64307000000000000000000B8898900B8898900B8898900B889
      8900B8898900B8898900FEF6ED00B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEF6ED00B8898900000000000000000000669A0056CDED0050C9
      EA004AC5E800B8898900FEF6ED00B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEF6ED00B8898900000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000A23F0800A7440700A5420800A23F0800A54208000000
      000000000000A23F08000000000000000000B8898900FEFEFD00FEFEFE00FEFE
      FD00FEFEFD00B8898900FEF3E800FFF4EA00FEF3E800FEF3E800FEF3E800FEF3
      E800FEF3E800FEF3E800B8898900000000000000000000669A005ED2F00058CF
      ED0052CBEB00B8898900FFF0E300FFF0E300FFF0E300FFF1E500FFF2E600FFF3
      E900FFF5EB00FFF0E300B8898900000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009E410D00A14E2200A23F0800A7440700A542
      0800A5420800A23F08000000000000000000B8898900FEFBF800B27E7300B27E
      7300B27E7300B8898900FFF0E300B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FFF0E300B8898900000000000000000000669A0066D7F30060D4
      F1005AD0EE00B8898900FFEDDD00B27E7300B27E7300B27E7300B27E7300CDA9
      9E00CCAA9E00D7C5BA00B8898900000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000957D75008D766C00A55E3900A23F0800A23F
      0800A23F0800000000000000000000000000B8898900FEF8F300FEFAF600FEF8
      F300FEF8F300B8898900FFEDDD00FFEDDD00FFEDDD00FFEDDD00FFEDDD00E9D5
      C900E7D6C900D7C5BA00B8898900000000000000000000669A006DDBF60067D8
      F30062D4F200B8898900FFEBD800FFEAD700FFEBD800FFEBD800FFEBD800C4AA
      A700C5ABA800CDB5B000CD999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E7C7200AC928E008E7C72008E7C7200000000000000
      000000000000000000000000000000000000B8898900FEF6ED00B27E7300B27E
      7300B27E7300B8898900FFEBD800FFEAD700FFEBD800FFEBD800FFEBD800C4AA
      A700C5ABA800CDB5B000CD999900000000000000000000669A0074DFF8006FDC
      F6006ADAF400B8898900FFE8D200FFE8D200FFE8D200FFE8D200FBE4CF00C6AC
      A900FEFEFE00CD99990000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E7C7200D3BDBD008E7C7200AD938F008E7C7200000000000000
      000000000000000000000000000000000000B8898900FEF3E800FFF4EA00FEF3
      E800FEF3E800B8898900FFE8D200FFE8D200FFE8D200FFE8D200FBE4CF00C6AC
      A900FEFEFE00CD99990000000000000000000000000000669A007AE3FA0076E1
      F80070DDF600B8898900FFE6CF00FFE6CF00FFE6CF00FFE6CF00E9CFBF00D2BA
      B400CD99990000669A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008E7C7200E9DEDE008E7C7200A9958F00D2BABA008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFF0E300B27E7300B27E
      7300B27E7300B8898900FFE6CF00FFE6CF00FFE6CF00FFE6CF00E9CFBF00D2BA
      B400CD9999000000000000000000000000000000000000669A007FE6FC007BE4
      FA0077E1F900B8898900B8898900B8898900B8898900B8898900B8898900CD99
      990052CAEB0000669A0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008E7C
      7200FCFAFA008E7C7200000000008E7C7200DFCECE008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFEDDD00FFEDDD00FFED
      DD00FFEDDD00B8898900B8898900B8898900B8898900B8898900B8898900CD99
      9900000000000000000000000000000000000000000000669A0083E8FE0080E6
      FC007DE5FC007DE5FC0078E2FA0072DFF8006BDAF50064D5F2005DD0EF0056CD
      ED0052CAEB0000669A0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000008E7C
      72008E7C720000000000000000008E7C7200ECE2E2008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFEBD800FFEAD700FFEB
      D800FFEBD800FFEBD800C4AAA700C5ABA800CDB5B000CD999900000000000000
      0000000000000000000000000000000000000000000000669A0084E9FE0084E9
      FE007373730073737300737373007373730073737300737373007373730060D4
      F0005ACFEE0000669A0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008E7C
      72000000000000000000000000008E7C7200F9F5F5008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFE8D200FFE8D200FFE8
      D200FFE8D200FBE4CF00C6ACA900FEFEFE00CD99990000000000000000000000
      0000000000000000000000000000000000000000000000669A0084E9FE0084E9
      FE0073737300CFC1BC00CFC1BB00CFC1BB00CFC1BB00CEBEB7007373730068D8
      F40062D4F10000669A000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000008E7C72008E7C720000000000000000000000
      000000000000000000000000000000000000B8898900FFE6CF00FFE6CF00FFE6
      CF00FFE6CF00E9CFBF00D2BAB400CD9999000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000669A000066
      9A0073737300E2D8D300FAF9F800F9F8F700F9F8F700D0C5BF00737373000066
      9A0000669A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E7C72000000000000000000000000000000
      000000000000000000000000000000000000B8898900B8898900B8898900B889
      8900B8898900B8898900CD999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373007373730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000F1F8000000000000
      F000000000000000F1F8000000000000FBFD0000000000001BFD000000000000
      03FD0000000000001BFD000000000000BBFD000000000000B1F8000000000000
      B000000000000000B1B8000000000000BFBF0000000000001F1F000000000000
      001F0000000000001F1F000000000000FFFFFFDFFBFFFFFFFFFFFF8FF1FF1FF8
      FFFFFF87E1FF1800F003FF83C1FF1BF8F00300418200FBFDC00300218400FBFD
      C00300700E00803DC00303F81FC0BBBDC00301F81F80BBBDC00300F00F00BBBD
      C00310200408B801C00318018018BFBFC0031C018038BFBFC00FBF07E0FD1FB8
      C00FFFFFFFFF0038FFFFFFFFFFFF1FF8FF80FF80FFFFFFFFFF80FF80FFFF0000
      FF80FF8087010000F000F000EFC70000F000F000EF870000F000F000F00F0000
      F000F000F70F000080078007F71F000080078007FA1F000080078007FA3F0000
      80078007FC3F000080078007FC7F000080FF80FFFC7F000080FF80FFFEFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA001FFFFFFFFFFFF0001FFFFFFFF0001
      8001FDFF307F0001C001F8FF183F0001E001F077FC1F0001E001E033FC0F0001
      E001C013FE070001E0018003FE070001E001C003FF070001E001E003FF870001
      E001F007FF830001E001F01FFFC30001E003F43FFFE10001E007F67FFFFF0001
      E00FF0FFFFFF0001E01FFFFFFFFF0001C0038003FFFFF33FC0030003C007E007
      C00300018003C000C003000180038001C003000180030000C003000080030000
      C003000080030000C003000080038000C00300018003E001C00300008003F003
      C00380038003F01FC003C3C78003E03FC007FF878003E03FC00FFF8F8003C03F
      C01FFE1FC007C07FC03FF87FFFFFF8FFFC7FF801C001FFFFF87FF8018001FFF9
      FB27F8018001FFF9FB43F8018001C3F3F85B00018001C3F3FC1B00018001E1C7
      FE0300018001F08FFE0700018001F81FFC3F00018003FC3FF83F00038003F81F
      F03F00078003F09FE23F000F8003C1C7E63F003F800383E3EE3F007F80038FF1
      FE7F00FFC007FFFFFEFF01FFF83FFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 340
    Top = 191
    object actWFNew: TAction
      Caption = #26032#24314
      Hint = #26032#24314
      ImageIndex = 4
      OnExecute = actWFNewExecute
    end
    object actWFSave: TAction
      Caption = #20445#23384
      Hint = #20445#23384
      ImageIndex = 6
      OnExecute = actWFSaveExecute
    end
    object actWFOpen: TAction
      Caption = #25171#24320
      Hint = #25171#24320
      ImageIndex = 5
      OnExecute = actWFOpenExecute
    end
    object actPreview: TAction
      Caption = #39044#35272
      Hint = #39044#35272
      ImageIndex = 8
      OnExecute = actPreviewExecute
    end
    object actPrint: TAction
      Caption = #25171#21360
      Hint = #25171#21360
      ImageIndex = 7
      OnExecute = actPrintExecute
    end
    object actWFGroup: TAction
      Caption = #32452#21512
      Hint = #32452#21512
      ImageIndex = 19
      OnExecute = actWFGroupExecute
      OnUpdate = actWFGroupUpdate
    end
    object actWFUnGroup: TAction
      Caption = #21462#28040#32452#21512
      Hint = #21462#28040#32452#21512
      ImageIndex = 20
      OnExecute = actWFUnGroupExecute
      OnUpdate = actWFUnGroupUpdate
    end
    object actWFCopy: TAction
      Category = 'popmenu'
      Caption = #22797#21046
      Hint = #22797#21046
      ImageIndex = 1
      ShortCut = 16451
      OnExecute = actWFCopyExecute
      OnUpdate = actWFCopyUpdate
    end
    object actWFCut: TAction
      Category = 'popmenu'
      Caption = #21098#20999
      Hint = #21098#20999
      ImageIndex = 0
      ShortCut = 16472
      OnExecute = actWFCutExecute
      OnUpdate = actWFCutUpdate
    end
    object actWFPaste: TAction
      Category = 'popmenu'
      Caption = #31896#36148
      Hint = #31896#36148
      ImageIndex = 2
      ShortCut = 16470
      OnExecute = actWFPasteExecute
      OnUpdate = actWFPasteUpdate
    end
    object actWFSelectAll: TAction
      Category = 'popmenu'
      Caption = #20840#36873
      Hint = #20840#36873
      ShortCut = 16449
      OnExecute = actWFSelectAllExecute
      OnUpdate = actWFSelectAllUpdate
    end
    object actWFDelete: TAction
      Category = 'popmenu'
      Caption = #21024#38500
      Hint = #21024#38500
      ImageIndex = 3
      ShortCut = 46
      OnExecute = actWFDeleteExecute
      OnUpdate = actWFDeleteUpdate
    end
    object actWFEditText: TAction
      Category = 'popmenu'
      Caption = #32534#36753#25991#26412
      Hint = #32534#36753#25991#26412
      OnExecute = actWFEditTextExecute
      OnUpdate = actWFEditTextUpdate
    end
    object actWFUndo: TAction
      Category = 'popmenu'
      Caption = #25764#38144
      Hint = #25764#38144
      ImageIndex = 17
      ShortCut = 16474
      OnExecute = actWFUndoExecute
      OnUpdate = actWFUndoUpdate
    end
    object actWFRedo: TAction
      Category = 'popmenu'
      Caption = #37325#20570
      Hint = #37325#20570
      ImageIndex = 18
      OnExecute = actWFRedoExecute
      OnUpdate = actWFRedoUpdate
    end
    object actWFViewTopRuler: TAction
      Category = 'popmenu'
      Caption = #19978#26631#23610
      Checked = True
      Hint = #19978#26631#23610
      OnExecute = actWFViewTopRulerExecute
      OnUpdate = actWFViewTopRulerUpdate
    end
    object actWFViewLeftRuler: TAction
      Category = 'popmenu'
      Caption = #24038#26631#23610
      Checked = True
      Hint = #24038#26631#23610
      OnExecute = actWFViewLeftRulerExecute
      OnUpdate = actWFViewLeftRulerUpdate
    end
    object actWFGrid: TAction
      Category = 'popmenu'
      Caption = #26174#31034#32593#26684
      Checked = True
      Hint = #26174#31034#32593#26684
      OnExecute = actWFGridExecute
      OnUpdate = actWFGridUpdate
    end
    object actWFBlockPicture: TAction
      Category = 'popmenu'
      Caption = #22270#29255
      Hint = #22270#29255
      ImageIndex = 11
      OnExecute = actWFBlockPictureExecute
      OnUpdate = actWFBlockPictureUpdate
    end
    object actWFShapeColor: TAction
      Category = 'popmenu'
      Caption = #24418#29366#39068#33394
      Hint = #24418#29366#39068#33394
      OnExecute = actWFShapeColorExecute
      OnUpdate = actWFShapeColorUpdate
    end
    object actWFLineColor: TAction
      Category = 'popmenu'
      Caption = #32447#26465#39068#33394
      Hint = #32447#26465#39068#33394
      OnExecute = actWFLineColorExecute
      OnUpdate = actWFLineColorUpdate
    end
    object actWFArrowShape: TAction
      Category = 'popmenu'
      Caption = #31661#22836#24418#29366
      Hint = #31661#22836#24418#29366
      OnExecute = actWFArrowShapeExecute
      OnUpdate = actWFArrowShapeUpdate
    end
    object actBringToFront: TAction
      Category = 'popmenu'
      Caption = #21069#31227
      Hint = #21069#31227
      ImageIndex = 12
      OnExecute = actBringToFrontExecute
      OnUpdate = actBringToFrontUpdate
    end
    object actWFSendToBack: TAction
      Category = 'popmenu'
      Caption = #21518#31227
      Hint = #21518#31227
      ImageIndex = 13
      OnExecute = actWFSendToBackExecute
      OnUpdate = actWFSendToBackUpdate
    end
    object actWFControlFont: TAction
      Category = 'popmenu'
      Caption = #25511#20214#23383#20307
      Hint = #25511#20214#23383#20307
      ImageIndex = 14
      OnExecute = actWFControlFontExecute
      OnUpdate = actWFControlFontUpdate
    end
    object actWFGradientSetting: TAction
      Category = 'popmenu'
      Caption = #28176#21464#33394
      Hint = #28176#21464#33394
      ImageIndex = 15
      OnExecute = actWFGradientSettingExecute
      OnUpdate = actWFGradientSettingUpdate
    end
    object actWFShadow: TAction
      Category = 'popmenu'
      Caption = #38452#24433
      Hint = #38452#24433
      ImageIndex = 16
      OnExecute = actWFShadowExecute
      OnUpdate = actWFShadowUpdate
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.dgr'
    Filter = 'Diagram files (*.dgr)|*.dgr|All files (*.*)|*.*'
    Title = 'Select diagram file'
    Left = 328
    Top = 296
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.dgr'
    Filter = 'Diagram files (*.dgr)|*.dgr|All files (*.*)|*.*'
    Title = 'Select diagram file'
    Left = 376
    Top = 296
  end
  object PrintDialog1: TPrintDialog
    Left = 488
    Top = 296
  end
  object ActionList3: TActionList
    Images = ImageList3
    Left = 376
    Top = 192
    object acBold: TAction
      Category = 'Font'
      Caption = #21152#31895
      Hint = #21152#31895
      ImageIndex = 0
      OnExecute = acBoldExecute
      OnUpdate = acBoldUpdate
    end
    object acItalic: TAction
      Category = 'Font'
      Caption = #20542#26012
      Hint = #20542#26012
      ImageIndex = 1
      OnExecute = acItalicExecute
      OnUpdate = acItalicUpdate
    end
    object acUnderline: TAction
      Category = 'Font'
      Caption = #19979#21010#32447
      Hint = #19979#21010#32447
      ImageIndex = 2
      OnExecute = acUnderlineExecute
      OnUpdate = acUnderlineUpdate
    end
    object acAlignLeft: TAction
      Category = 'Font'
      Caption = #24038#23545#40784
      Hint = #24038#23545#40784
      ImageIndex = 3
      OnExecute = acAlignLeftExecute
      OnUpdate = acAlignLeftUpdate
    end
    object acAlignCenter: TAction
      Category = 'Font'
      Caption = #23621#20013
      Hint = #23621#20013
      ImageIndex = 4
      OnExecute = acAlignCenterExecute
      OnUpdate = acAlignCenterUpdate
    end
    object acAlignRight: TAction
      Category = 'Font'
      Caption = #21491#23545#40784
      Hint = #21491#23545#40784
      ImageIndex = 5
      OnExecute = acAlignRightExecute
      OnUpdate = acAlignRightUpdate
    end
    object acVertAlignTop: TAction
      Category = 'Font'
      Caption = #22402#30452#23621#19978
      Hint = #22402#30452#23621#19978
      ImageIndex = 6
      OnExecute = acVertAlignTopExecute
      OnUpdate = acVertAlignTopUpdate
    end
    object acVertAlignMiddle: TAction
      Category = 'Font'
      Caption = #22402#30452#23621#20013
      Hint = #22402#30452#23621#20013
      ImageIndex = 7
      OnExecute = acVertAlignMiddleExecute
      OnUpdate = acVertAlignMiddleUpdate
    end
    object acVertAlignBottom: TAction
      Category = 'Font'
      Caption = #22402#30452#23621#19979
      Hint = #22402#30452#23621#19979
      ImageIndex = 8
      OnExecute = acVertAlignBottomExecute
      OnUpdate = acVertAlignBottomUpdate
    end
  end
  object ImageList3: TImageList
    Left = 448
    Top = 200
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
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
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000A4A0A000C0DC
      C000000000000000000000000000000000000000000000000000000000004020
      2000402020004020200040202000402020004020200000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0DCC0004060600000000000000000000000000040606000C0DCC0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      A00000000000404040000000000000000000C0C0A0000000000040202000A4A0
      A000000000000000000000000000000000000000000000000000000000000000
      0000C0DCC0004020200040202000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004040400000000000C0C0C00000000000C0C0C00000000000404040000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004020200000000000000000000000000000000000402020004020
      2000000000000000000000000000000000000000000000000000000000000000
      000000000000A4A0A00040202000A4A0A0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000402020000000000000000000C0C0C0000000000000000000A4A0
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000040202000402020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008060600040404000000000004020200000000000806060000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00080606000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000406060004060600000000000000000000000000040606000406060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000806060000000000000000000C0C0C0004020200040404000A4A0
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000806060008060600000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000406060004060600000000000000000000000000040606000406060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008060600000000000000000000000000000000000406060004020
      2000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C00040406000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404060004040600000000000000000000000000040406000404060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00040202000406060000000000000000000C0C0C0004020200040404000A4A0
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0DCC0004040400040404000C0DCC0000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0004060600040606000C0C0C00000000000C0C0C0004060600040606000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040202000A4A0A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000404040004040400040404000404040004040
      4000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000000000000000000000
      7FFE00000000000040020000000000007FFE0000000000007006000000000000
      7FFE00000000000040020000000000007FFE0000000000007FFE000000000000
      7FFE0000000000007FFE0000000000007FFE0000000000007FFE000000000000
      7FFE0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
      FFFFFFFF7FFE7FFEE007F8017FFE7FFEFFFFFFFF7FFE7FFE800180017FFE7FFE
      FFFFFFFF7FFE4002E007F8017FFE7FFEFFFFFFFF7FFE70068001800140027FFE
      FFFFFFFF7FFE4002E007F80170067FFEFFFFFFFF7FFE7FFE8001800140027FFE
      FFFFFFFF7FFE7FFEFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE00FFFFFFFFFFFFFFFFF801FE00FE07FF01FFFFFE10FF0FFF11F8001
      F18FF8FFF39FFFFFF10FFCFFF39F801FF01FFC7FF39FFFFFF10FFE7FF39F8001
      F18FFE3FF39FFFFFE10FFE1FE10F801FE01FFE0FE10FFFFFFFFFFFFFFFFF8001
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 492
    Top = 199
    object N1: TMenuItem
      Action = actWFSelectAll
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = actWFCopy
    end
    object N4: TMenuItem
      Action = actWFCut
    end
    object N5: TMenuItem
      Action = actWFPaste
    end
    object N7: TMenuItem
      Action = actWFDelete
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = actBringToFront
    end
    object N8: TMenuItem
      Action = actWFSendToBack
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N11: TMenuItem
      Action = actWFGroup
    end
    object N12: TMenuItem
      Action = actWFUnGroup
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N14: TMenuItem
      Action = actWFGrid
    end
    object N15: TMenuItem
      Action = actWFViewTopRuler
    end
    object N16: TMenuItem
      Action = actWFViewLeftRuler
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 556
    Top = 191
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 604
    Top = 191
  end
  object ColorDialog1: TColorDialog
    Left = 644
    Top = 191
  end
end
