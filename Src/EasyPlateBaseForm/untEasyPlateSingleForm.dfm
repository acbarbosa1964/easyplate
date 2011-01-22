inherited EasyPlateSingleForm: TEasyPlateSingleForm
  Caption = 'EasyPlateSingleForm'
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
  inherited pnlContainer: TEasyPanel
    inherited pgcContainer: TEasyPageControl
      FixedDimension = 0
    end
  end
  object pnlClient: TEasyPanel [3]
    Left = 0
    Top = 276
    Width = 862
    Height = 197
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 3
    object grdSingleMain: TcxGrid
      Left = 0
      Top = 0
      Width = 862
      Height = 197
      Align = alClient
      TabOrder = 0
      object grdSingleMainDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCanFocusRecord = grdSingleMainDBTableView1CanFocusRecord
        DataController.DataSource = dsMain
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object grdSingleMainLevel1: TcxGridLevel
        GridView = grdSingleMainDBTableView1
      end
    end
  end
end
