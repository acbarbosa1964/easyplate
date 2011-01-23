inherited frmEasyUnitMain: TfrmEasyUnitMain
  Left = 183
  Top = 120
  Caption = 'frmEasyUnitMain'
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlContainer: TEasyPanel
    inherited pgcContainer: TEasyPageControl
      FixedDimension = 0
    end
  end
  inherited pnlClient: TEasyPanel
    inherited grdSingleMain: TcxGrid
      inherited grdSingleMainDBTableView1: TcxGridDBTableView
        object grdSingleMainDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'GUID'
        end
        object grdSingleMainDBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'sEmployeeCName'
        end
        object grdSingleMainDBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'sEmployeeEName'
        end
      end
    end
  end
end
