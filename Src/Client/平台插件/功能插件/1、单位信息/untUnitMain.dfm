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
    inherited pgcContainer: TEasyPageControl
      FixedDimension = 0
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
