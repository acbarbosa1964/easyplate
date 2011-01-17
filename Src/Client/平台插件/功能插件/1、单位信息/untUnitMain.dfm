inherited frmEasyUnitMain: TfrmEasyUnitMain
  Left = 272
  Top = 153
  Caption = 'frmEasyUnitMain'
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 273
    Width = 862
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object pnlClient: TEasyPanel [2]
    Left = 0
    Top = 276
    Width = 862
    Height = 197
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 3
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 862
      Height = 197
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsUnit
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'GUID'
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'sEmployeeEName'
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'sEmployeeCName'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  inherited pnlContainer: TEasyPanel
    object EasyDevDBTextEdit1: TEasyDevDBTextEdit
      Left = 120
      Top = 16
      DataBinding.DataField = 'GUID'
      DataBinding.DataSource = dsUnit
      TabOrder = 0
      EditLabel.Tag = 100
      EditLabel.Width = 103
      EditLabel.Height = 13
      EditLabel.Caption = 'EasyDevDBTextEdit1'
      LabelPosition = lpLeft
      LabelSpacing = 3
      Width = 121
    end
    object EasyDevDBTextEdit2: TEasyDevDBTextEdit
      Left = 120
      Top = 48
      DataBinding.DataField = 'sEmployeeCName'
      DataBinding.DataSource = dsUnit
      TabOrder = 1
      EditLabel.Width = 103
      EditLabel.Height = 13
      EditLabel.Caption = 'EasyDevDBTextEdit2'
      LabelPosition = lpLeft
      LabelSpacing = 3
      Width = 121
    end
    object EasyDevDBTextEdit3: TEasyDevDBTextEdit
      Left = 120
      Top = 80
      DataBinding.DataField = 'sEmployeeEName'
      DataBinding.DataSource = dsUnit
      TabOrder = 2
      EditLabel.Width = 103
      EditLabel.Height = 13
      EditLabel.Caption = 'EasyDevDBTextEdit3'
      LabelPosition = lpLeft
      LabelSpacing = 3
      Width = 121
    end
    object Button1: TButton
      Left = 560
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object cdsUnit: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM hrHumanResource'
    Params = <>
    Left = 208
    Top = 228
  end
  object dsUnit: TDataSource
    DataSet = cdsUnit
    Left = 248
    Top = 228
  end
end
