object frmEasySelectDialog: TfrmEasySelectDialog
  Left = 292
  Top = 124
  Width = 655
  Height = 548
  Caption = #26597#35810'...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object EasyNetscapeSplitter1: TEasyNetscapeSplitter
    Left = 0
    Top = 217
    Width = 647
    Height = 10
    Cursor = crVSplit
    Align = alTop
    MinSize = 1
    ResizeStyle = rsLine
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ButtonHighlightColor = clSilver
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 647
    Height = 217
    Align = alTop
    TabOrder = 0
    object EasyPanel1: TEasyPanel
      Left = 1
      Top = 1
      Width = 645
      Height = 183
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 0
      object EasyPageControl1: TEasyPageControl
        Left = 0
        Top = 0
        Width = 645
        Height = 183
        ActivePage = EasyTabSheet1
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        FixedDimension = 19
        object EasyTabSheet1: TEasyTabSheet
          Caption = #26597#35810'...'
        end
      end
    end
    object EasyPanel2: TEasyPanel
      Left = 1
      Top = 184
      Width = 645
      Height = 32
      Align = alBottom
      TabOrder = 1
      object btnRefresh: TEasyBitButton
        Left = 3
        Top = 4
        Width = 65
        Height = 25
        Caption = #21047#26032
        Color = clBtnFace
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        ModalResult = 0
        NumGlyphs = 2
        ParentColor = False
        TabOrder = 0
      end
      object btnCancel: TEasyBitButton
        Left = 152
        Top = 4
        Width = 65
        Height = 25
        Caption = #21462#28040
        Color = clBtnFace
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333FFFFF333333000033333388888833333333333F888888FFF333
          000033338811111188333333338833FFF388FF33000033381119999111833333
          38F338888F338FF30000339119933331111833338F388333383338F300003391
          13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
          33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
          33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
          000039183811193333918338F8F833F83333838F000039118111933339118338
          F3833F83333833830000339111193333391833338F33F8333FF838F300003391
          11833338111833338F338FFFF883F83300003339111888811183333338FF3888
          83FF83330000333399111111993333333388FFFFFF8833330000333333999999
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        ModalResult = 0
        NumGlyphs = 2
        ParentColor = False
        TabOrder = 2
      end
      object btnOK: TEasyBitButton
        Left = 77
        Top = 4
        Width = 65
        Height = 25
        Caption = #30830#23450
        Color = clBtnFace
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        ModalResult = 0
        NumGlyphs = 2
        ParentColor = False
        TabOrder = 1
      end
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 227
    Width = 647
    Height = 294
    Align = alClient
    TabOrder = 1
    object grdSelectMain: TcxGrid
      Left = 1
      Top = 1
      Width = 645
      Height = 292
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BorderStyle = cxcbsNone
      PopupMenu = EasyPopupMenu1
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object grdSelectMainDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.First.Visible = True
        NavigatorButtons.PriorPage.Visible = True
        NavigatorButtons.Prior.Visible = True
        NavigatorButtons.Next.Visible = True
        NavigatorButtons.NextPage.Visible = True
        NavigatorButtons.Last.Visible = True
        NavigatorButtons.Insert.Visible = True
        NavigatorButtons.Delete.Visible = True
        NavigatorButtons.Edit.Visible = True
        NavigatorButtons.Post.Visible = True
        NavigatorButtons.Cancel.Visible = True
        NavigatorButtons.Refresh.Visible = True
        NavigatorButtons.SaveBookmark.Visible = True
        NavigatorButtons.GotoBookmark.Visible = True
        NavigatorButtons.Filter.Visible = True
        OnEditing = grdSelectMainDBTableView1Editing
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 40
        Styles.ContentEven = cxStyle1
        Styles.ContentOdd = cxStyle2
        OnCustomDrawIndicatorCell = grdSelectMainDBTableView1CustomDrawIndicatorCell
      end
      object grdSelectMainLevel1: TcxGridLevel
        GridView = grdSelectMainDBTableView1
        Options.DetailFrameColor = clBackground
      end
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    AlwaysFireOnPopup = True
    Left = 256
    Top = 212
  end
  object SaveDialogExport: TSaveDialog
    Left = 216
    Top = 211
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 160
    Top = 280
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle2: TcxStyle
    end
  end
  object EasyPopupMenu1: TEasyPopupMenu
    AutoHotkeys = maManual
    MenuStyler = EasyMenuOfficeStyler1
    Left = 352
    Top = 315
    object N1: TMenuItem
      Caption = #20840#37096#36873#25321
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #28165#38500#36873#25321
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #21453#36873
      OnClick = N2Click
    end
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
    Left = 400
    Top = 315
  end
end
