inherited EasyPlateSingleForm: TEasyPlateSingleForm
  Caption = 'EasyPlateSingleForm'
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 273
    Width = 854
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
    Width = 854
    Height = 186
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 3
  end
end
