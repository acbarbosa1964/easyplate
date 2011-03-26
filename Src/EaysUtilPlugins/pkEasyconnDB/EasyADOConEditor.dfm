object frmEasyADOConEditor: TfrmEasyADOConEditor
  Left = 326
  Top = 231
  BorderStyle = bsDialog
  ClientHeight = 185
  ClientWidth = 472
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TButton
    Left = 294
    Top = 151
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 382
    Top = 151
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object SourceofConnection: TGroupBox
    Tag = 2201
    Left = 5
    Top = 4
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
      TabOrder = 0
      OnClick = SourceButtonClick
    end
    object DataLinkFile: TComboBox
      Tag = 2206
      Left = 28
      Top = 42
      Width = 332
      Height = 21
      ItemHeight = 13
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
      TabOrder = 3
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
