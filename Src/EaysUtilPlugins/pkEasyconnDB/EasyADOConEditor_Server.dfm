object frmEasyADOConEditor: TfrmEasyADOConEditor
  Left = 326
  Top = 231
  BorderStyle = bsDialog
  ClientHeight = 217
  ClientWidth = 472
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 9
    Top = 190
    Width = 108
    Height = 13
    Caption = #32418#33394#20026#24517#22635#39033'            '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnNext: TButton
    Left = 382
    Top = 183
    Width = 75
    Height = 25
    Caption = #19979#19968#27493
    Default = True
    TabOrder = 2
    OnClick = btnNextClick
  end
  object nbkMain: TNotebook
    Left = 0
    Top = 0
    Width = 472
    Height = 169
    Align = alTop
    PageIndex = 2
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 16
        Width = 449
        Height = 137
        Caption = #24212#29992#31243#24207#31867#22411
        TabOrder = 0
        object csStyle: TRadioButton
          Tag = 2203
          Left = 122
          Top = 37
          Width = 226
          Height = 20
          Caption = #26631#20934#23458#25143#31471'/'#26381#21153#22120#27169#24335
          TabOrder = 0
        end
        object midasStyle: TRadioButton
          Tag = 2203
          Left = 122
          Top = 77
          Width = 226
          Height = 20
          Caption = #19977#23618#27169#24335'(Midas)'
          TabOrder = 1
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'ConnSet'
      object SourceofConnection: TGroupBox
        Tag = 2201
        Left = 5
        Top = 17
        Width = 461
        Height = 136
        Caption = #25968#25454#24211#36830#25509#35774#32622'(ADO) '
        TabOrder = 0
        object UseDataLinkFile: TRadioButton
          Tag = 2203
          Left = 10
          Top = 21
          Width = 226
          Height = 20
          Caption = #25968#25454#36830#25509#37197#32622#25991#20214
          Enabled = False
          TabOrder = 0
          OnClick = SourceButtonClick
        end
        object DataLinkFile: TComboBox
          Tag = 2206
          Left = 28
          Top = 42
          Width = 332
          Height = 21
          Color = clScrollBar
          Enabled = False
          ItemHeight = 0
          Sorted = True
          TabOrder = 2
        end
        object Browse: TButton
          Tag = 2209
          Left = 370
          Top = 39
          Width = 75
          Height = 25
          Caption = #27983#35272'...'
          Enabled = False
          TabOrder = 1
          OnClick = BrowseClick
        end
        object UseConnectionString: TRadioButton
          Tag = 2202
          Left = 10
          Top = 73
          Width = 226
          Height = 20
          Caption = #36830#25509#23383#31526#20018
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          TabStop = True
          OnClick = SourceButtonClick
        end
        object ConnectionString: TEdit
          Tag = 2205
          Left = 28
          Top = 94
          Width = 332
          Height = 21
          TabOrder = 5
        end
        object Build: TButton
          Tag = 2208
          Left = 370
          Top = 92
          Width = 75
          Height = 25
          Caption = #26032#24314'...'
          TabOrder = 4
          OnClick = BuildClick
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 2
      Caption = 'MidasSet'
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 449
        Height = 145
        Caption = #24212#29992#31243#24207#26381#21153#22120#35774#32622
        TabOrder = 0
        object Label1: TLabel
          Left = 111
          Top = 61
          Width = 33
          Height = 13
          Caption = #31471#21475'   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 83
          Top = 32
          Width = 61
          Height = 13
          Caption = #26381#21153#22120'IP     '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 81
          Top = 91
          Width = 63
          Height = 13
          Caption = #25318#25130'GUID    '
        end
        object Label4: TLabel
          Left = 81
          Top = 120
          Width = 63
          Height = 13
          Caption = #26381#21153#21517#31216'     '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edtGUID: TEdit
          Left = 152
          Top = 86
          Width = 223
          Height = 21
          TabOrder = 2
        end
        object edtServerName: TEdit
          Left = 152
          Top = 115
          Width = 223
          Height = 21
          TabOrder = 3
        end
        object edtIP: TEdit
          Left = 152
          Top = 28
          Width = 223
          Height = 21
          TabOrder = 0
          OnKeyPress = edtIPKeyPress
        end
        object edtPort: TEdit
          Left = 152
          Top = 57
          Width = 223
          Height = 21
          TabOrder = 1
          OnExit = edtPortExit
          OnKeyPress = edtPortKeyPress
        end
      end
    end
  end
  object btnPrev: TButton
    Left = 294
    Top = 183
    Width = 75
    Height = 25
    Caption = #19978#19968#27493
    Default = True
    TabOrder = 1
    OnClick = btnPrevClick
  end
  object ADOTest: TADOConnection
    Left = 128
    Top = 184
  end
  object scktTest: TSocketConnection
    Left = 160
    Top = 184
  end
end
