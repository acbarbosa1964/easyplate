object Form3: TForm3
  Left = 335
  Top = 37
  Width = 1219
  Height = 612
  Caption = 'Form3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1211
    Height = 585
    Align = alClient
    TabOrder = 0
    object edtPartCode: TcxDBTextEdit
      Left = 99
      Top = 10
      DataBinding.DataField = 'PartCode'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Width = 506
    end
    object edtPartCName: TcxDBTextEdit
      Left = 99
      Top = 37
      DataBinding.DataField = 'PartCName'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 210
    end
    object edtPartEName: TcxDBTextEdit
      Left = 392
      Top = 37
      DataBinding.DataField = 'PartEName'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 5
      Width = 238
    end
    object cmbPartTypeGUID: TcxDBLookupComboBox
      Left = 689
      Top = 37
      DataBinding.DataField = 'PartTypeGUID'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 6
      Width = 210
    end
    object edtSpec: TcxDBTextEdit
      Left = 958
      Top = 37
      DataBinding.DataField = 'Spec'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 239
    end
    object cmbDefaultUnit: TcxDBLookupComboBox
      Left = 99
      Top = 64
      DataBinding.DataField = 'DefaultUnit'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 8
      Width = 74
    end
    object cmbWeightUnit: TcxDBLookupComboBox
      Left = 392
      Top = 64
      DataBinding.DataField = 'WeightUnit'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 10
      Width = 93
    end
    object spnUnitWeight: TcxDBSpinEdit
      Left = 232
      Top = 64
      DataBinding.DataField = 'UnitWeight'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 9
      Width = 77
    end
    object edtVolumeUnit: TcxDBLookupComboBox
      Left = 688
      Top = 64
      DataBinding.DataField = 'VolumeUnit'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 12
      Width = 85
    end
    object spnUnitVolume: TcxDBSpinEdit
      Left = 544
      Top = 64
      DataBinding.DataField = 'UnitVolume'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 11
      Width = 85
    end
    object spnNetWeight: TcxDBSpinEdit
      Left = 808
      Top = 64
      DataBinding.DataField = 'NetWeight'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 13
      Width = 91
    end
    object spnGrossWeight: TcxDBSpinEdit
      Left = 958
      Top = 64
      DataBinding.DataField = 'GrossWeight'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 14
      Width = 239
    end
    object dedtEffectiveDate: TcxDBDateEdit
      Left = 99
      Top = 91
      DataBinding.DataField = 'EffectiveDate'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 15
      Width = 210
    end
    object edtDesignDrawingNo: TcxDBTextEdit
      Left = 688
      Top = 91
      DataBinding.DataField = 'DesignDrawingNo'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 17
      Width = 210
    end
    object edtDesignType: TcxDBTextEdit
      Left = 957
      Top = 91
      DataBinding.DataField = 'DesignType'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 18
      Width = 239
    end
    object edtBarCode: TcxDBTextEdit
      Left = 664
      Top = 10
      DataBinding.DataField = 'BarCode'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 209
    end
    object cmbWarehouse: TcxDBLookupComboBox
      Left = 99
      Top = 118
      DataBinding.DataField = 'Warehouse'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 19
      Width = 210
    end
    object cmbStock: TcxDBLookupComboBox
      Left = 392
      Top = 118
      DataBinding.DataField = 'Stock'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 20
      Width = 237
    end
    object edtAbcTypeGUID: TcxDBLookupComboBox
      Left = 688
      Top = 118
      DataBinding.DataField = 'AbcTypeGUID'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 21
      Width = 213
    end
    object ckbIsEnable: TcxDBCheckBox
      Left = 887
      Top = 10
      Caption = #21551#29992
      DataBinding.DataField = 'IsEnable'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Transparent = True
      Width = 46
    end
    object spnOrderNo: TcxDBSpinEdit
      Left = 968
      Top = 10
      DataBinding.DataField = 'OrderNo'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 3
      Width = 203
    end
    object cmbInventoryWayGUID: TcxDBLookupComboBox
      Left = 99
      Top = 145
      DataBinding.DataField = 'InventoryWayGUID'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 22
      Width = 210
    end
    object spnInventoryCycle: TcxDBSpinEdit
      Left = 392
      Top = 145
      DataBinding.DataField = 'InventoryCycle'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 23
      Width = 237
    end
    object dedtInventoryDate: TcxDBDateEdit
      Left = 688
      Top = 145
      DataBinding.DataField = 'InventoryDate'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 24
      Width = 213
    end
    object dedtExpiryDate: TcxDBDateEdit
      Left = 392
      Top = 91
      DataBinding.DataField = 'ExpiryDate'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 16
      Width = 237
    end
    object edtBatchNumber: TcxDBTextEdit
      Left = 99
      Top = 172
      DataBinding.DataField = 'BatchNumber'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 25
      Width = 210
    end
    object spnBatchEffectiveDays: TcxDBSpinEdit
      Left = 392
      Top = 172
      DataBinding.DataField = 'BatchEffectiveDays'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 26
      Width = 237
    end
    object spnBatchCheckCycle: TcxDBSpinEdit
      Left = 688
      Top = 172
      DataBinding.DataField = 'BatchCheckCycle'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 27
      Width = 213
    end
    object dedtLatestInDate: TcxDBDateEdit
      Left = 99
      Top = 199
      DataBinding.DataField = 'LatestInDate'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 28
      Width = 210
    end
    object spnLatestInNumber: TcxDBSpinEdit
      Left = 392
      Top = 199
      DataBinding.DataField = 'LatestInNumber'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 29
      Width = 235
    end
    object dedtLastOutDate: TcxDBDateEdit
      Left = 710
      Top = 199
      DataBinding.DataField = 'LastOutDate'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 30
      Width = 190
    end
    object spnLastOutNumber: TcxDBSpinEdit
      Left = 971
      Top = 199
      DataBinding.DataField = 'LastOutNumber'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 31
      Width = 222
    end
    object dedtLastCheckDate: TcxDBDateEdit
      Left = 99
      Top = 226
      DataBinding.DataField = 'LastCheckDate'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 32
      Width = 210
    end
    object mmLastCheckResult: TcxDBMemo
      Left = 392
      Top = 226
      DataBinding.DataField = 'LastCheckResult'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 33
      Height = 23
      Width = 799
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 10
      Top = 255
      Caption = #21333#20214#31649#29702
      DataBinding.DataField = 'IsSingleManage'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 34
      Transparent = True
      Width = 121
    end
    object cxDBCheckBox2: TcxDBCheckBox
      Left = 137
      Top = 255
      Caption = #38480#39069#39046#26009
      DataBinding.DataField = 'IsLimitPick'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 35
      Transparent = True
      Width = 121
    end
    object cxDBCheckBox3: TcxDBCheckBox
      Left = 264
      Top = 255
      Caption = #20801#35768#36229#37319#36141#35746#21333#20837#24211
      DataBinding.DataField = 'IsAllowGreatPuchaseIn'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 36
      Transparent = True
      Width = 121
    end
    object spnAvgDayConsumeNumber: TcxDBSpinEdit
      Left = 99
      Top = 282
      DataBinding.DataField = 'AvgDayConsumeNumber'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 39
      Width = 78
    end
    object ckb: TcxDBCheckBox
      Left = 391
      Top = 255
      Caption = #26159#21542#36827#20215#25511#21046
      DataBinding.DataField = 'IsInPriceControl'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 37
      Transparent = True
      Width = 121
    end
    object spnPlanningPrice: TcxDBSpinEdit
      Left = 236
      Top = 282
      DataBinding.DataField = 'PlanningPrice'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 40
      Width = 69
    end
    object spnPriceTopLimit: TcxDBSpinEdit
      Left = 388
      Top = 282
      DataBinding.DataField = 'PriceTopLimit'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 41
      Width = 121
    end
    object cmbSupplier: TcxDBLookupComboBox
      Left = 580
      Top = 282
      DataBinding.DataField = 'Supplier'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 42
      Width = 145
    end
    object edtSuppPartCode: TcxDBTextEdit
      Left = 808
      Top = 282
      DataBinding.DataField = 'SuppPartCode'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 43
      Width = 121
    end
    object ckbIsIndependentRequire: TcxDBCheckBox
      Left = 518
      Top = 255
      Caption = #29420#31435#38656#27714
      DataBinding.DataField = 'IsIndependentRequire'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 38
      Transparent = True
      Width = 121
    end
    object spnReplenishmentCycle: TcxDBSpinEdit
      Left = 388
      Top = 309
      DataBinding.DataField = 'ReplenishmentCycle'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 45
      Width = 121
    end
    object cmbReplenishmentPolicy: TcxDBLookupComboBox
      Left = 99
      Top = 309
      DataBinding.DataField = 'ReplenishmentPolicy'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 44
      Width = 206
    end
    object spnOrderPoint: TcxDBSpinEdit
      Left = 568
      Top = 309
      DataBinding.DataField = 'OrderPoint'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 46
      Width = 133
    end
    object spnOrderQuantity: TcxDBSpinEdit
      Left = 772
      Top = 309
      DataBinding.DataField = 'OrderQuantity'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 47
      Width = 121
    end
    object spnLeadTime: TcxDBSpinEdit
      Left = 1000
      Top = 309
      DataBinding.DataField = 'LeadTime'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 48
      Width = 121
    end
    object spnSaleNumber: TcxDBSpinEdit
      Left = 99
      Top = 336
      DataBinding.DataField = 'SaleNumber'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 49
      Width = 206
    end
    object spnProductNumber: TcxDBSpinEdit
      Left = 388
      Top = 336
      DataBinding.DataField = 'ProductNumber'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 50
      Width = 121
    end
    object spnQtyMax: TcxDBSpinEdit
      Left = 580
      Top = 336
      DataBinding.DataField = 'QtyMax'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 51
      Width = 121
    end
    object cxDBSpinEdit1: TcxDBSpinEdit
      Left = 772
      Top = 336
      DataBinding.DataField = 'QtyMin'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 52
      Width = 121
    end
    object cmbDefaultRoutingGUID: TcxDBLookupComboBox
      Left = 99
      Top = 363
      DataBinding.DataField = 'DefaultRoutingGUID'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 53
      Width = 206
    end
    object cmbDefaultWorkTypeGUID: TcxDBLookupComboBox
      Left = 388
      Top = 363
      DataBinding.DataField = 'DefaultWorkTypeGUID'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 54
      Width = 245
    end
    object cmbAPAcctID: TcxDBLookupComboBox
      Left = 692
      Top = 363
      DataBinding.DataField = 'APAcctID'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 55
      Width = 145
    end
    object cmbARAcctID: TcxDBLookupComboBox
      Left = 896
      Top = 363
      DataBinding.DataField = 'ARAcctID'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 56
      Width = 145
    end
    object ckbIsCanReplace: TcxDBCheckBox
      Left = 10
      Top = 390
      Caption = #21487#20197#26367#25442
      DataBinding.DataField = 'IsCanReplace'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 57
      Transparent = True
      Width = 87
    end
    object edtReplacePartCode: TcxDBTextEdit
      Left = 192
      Top = 390
      DataBinding.DataField = 'ReplacePartCode'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 58
      Width = 849
    end
    object cxDBCheckBox4: TcxDBCheckBox
      Left = 10
      Top = 417
      Caption = #26159#21542#34394#25311#20214
      DataBinding.DataField = 'IsVirtualPart'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 59
      Transparent = True
      Width = 121
    end
    object cxDBCheckBox5: TcxDBCheckBox
      Left = 137
      Top = 417
      Caption = #26159#21542#20851#38190#20214
      DataBinding.DataField = 'IsKeyPart'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 60
      Transparent = True
      Width = 121
    end
    object cxDBCheckBox6: TcxDBCheckBox
      Left = 264
      Top = 417
      Caption = #26159#21542#21806#20215#25511#21046
      DataBinding.DataField = 'IsSalePriceControl'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 61
      Transparent = True
      Width = 121
    end
    object spnSaleLowPrice: TcxDBSpinEdit
      Left = 456
      Top = 417
      DataBinding.DataField = 'SaleLowPrice'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 62
      Width = 121
    end
    object cmbSaleLowMoneyType: TcxDBLookupComboBox
      Left = 672
      Top = 417
      DataBinding.DataField = 'SaleLowMoneyType'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 63
      Width = 145
    end
    object spnSalePrice: TcxDBSpinEdit
      Left = 876
      Top = 417
      DataBinding.DataField = 'SalePrice'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 64
      Width = 121
    end
    object cmbChecker: TcxDBLookupComboBox
      Left = 99
      Top = 444
      DataBinding.DataField = 'Checker'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 65
      Width = 204
    end
    object cmbCheckType: TcxDBLookupComboBox
      Left = 362
      Top = 444
      DataBinding.DataField = 'CheckType'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 66
      Width = 145
    end
    object cmbCheckProject: TcxDBLookupComboBox
      Left = 566
      Top = 444
      DataBinding.DataField = 'CheckProject'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 67
      Width = 145
    end
    object ckbIsKFPeriod: TcxDBCheckBox
      Left = 717
      Top = 444
      Caption = #26159#21542#36827#34892#20445#36136#26399#31649#29702
      DataBinding.DataField = 'IsKFPeriod'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 68
      Transparent = True
      Width = 121
    end
    object cxDBCheckBox7: TcxDBCheckBox
      Left = 844
      Top = 444
      Caption = #26159#21542#38144#21806
      DataBinding.DataField = 'IsSale'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 69
      Transparent = True
      Width = 121
    end
    object edtEquipmentCode: TcxDBTextEdit
      Left = 190
      Top = 471
      DataBinding.DataField = 'EquipmentCode'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 71
      Width = 202
    end
    object cmbwwCheckType: TcxDBLookupComboBox
      Left = 499
      Top = 471
      DataBinding.DataField = 'wwCheckType'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 72
      Width = 145
    end
    object spnwwHighPrice: TcxDBSpinEdit
      Left = 739
      Top = 471
      DataBinding.DataField = 'wwHighPrice'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 73
      Width = 121
    end
    object cmbwwHighPriceMoneyType: TcxDBLookupComboBox
      Left = 979
      Top = 471
      DataBinding.DataField = 'wwHighPriceMoneyType'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 74
      Width = 145
    end
    object cmbWithDrawCheckType: TcxDBLookupComboBox
      Left = 111
      Top = 548
      DataBinding.DataField = 'WithDrawCheckType'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 79
      Width = 203
    end
    object spnStandardCost: TcxDBSpinEdit
      Left = 397
      Top = 548
      DataBinding.DataField = 'StandardCost'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 80
      Width = 121
    end
    object spnStandardManHour: TcxDBSpinEdit
      Left = 631
      Top = 548
      DataBinding.DataField = 'StandardManHour'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 81
      Width = 121
    end
    object spnStdFixFeeRate: TcxDBSpinEdit
      Left = 907
      Top = 548
      DataBinding.DataField = 'StdFixFeeRate'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 82
      Width = 121
    end
    object spnStdPayRate: TcxDBSpinEdit
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'StdPayRate'
      DataBinding.DataSource = dsPart
      Properties.ValueType = vtFloat
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 75
      Visible = False
      Width = 200
    end
    object cmbDefaultSaler: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'DefaultSaler'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 76
      Visible = False
      Width = 145
    end
    object cmbDefaultCustomCode: TcxDBLookupComboBox
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'DefaultCustomCode'
      DataBinding.DataSource = dsPart
      Properties.ListColumns = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 77
      Visible = False
      Width = 145
    end
    object edtCustomPartCode: TcxDBTextEdit
      Left = 10000
      Top = 10000
      DataBinding.DataField = 'CustomPartCode'
      DataBinding.DataSource = dsPart
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 78
      Visible = False
      Width = 121
    end
    object ckbIsEquipment: TcxDBCheckBox
      Left = 10
      Top = 471
      Caption = #26159#21542#35774#22791
      DataBinding.DataField = 'IsEquipment'
      DataBinding.DataSource = dsPart
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 70
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      CaptionOptions.Text = #29289#26009#32534#30721
      Parent = dxLayoutControl1Group5
      Control = edtPartCode
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      CaptionOptions.Text = #20013#25991#21517#31216
      Parent = dxLayoutControl1Group4
      Control = edtPartCName
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      CaptionOptions.Text = #33521#25991#21517#31216
      Parent = dxLayoutControl1Group4
      Control = edtPartEName
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      CaptionOptions.Text = #29289#26009#31867#22411
      Parent = dxLayoutControl1Group4
      Control = cmbPartTypeGUID
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Group1: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      CaptionOptions.Text = #21697#31181#35268#26684
      Parent = dxLayoutControl1Group4
      Control = edtSpec
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Group2: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group4: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group1
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      CaptionOptions.Text = #40664#35748#35745#37327#21333#20301
      Parent = dxLayoutControl1Group2
      Control = cmbDefaultUnit
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      CaptionOptions.Text = #37325#37327#21333#20301
      Parent = dxLayoutControl1Group2
      Control = cmbWeightUnit
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item8: TdxLayoutItem
      CaptionOptions.Text = #21333#20301#37325#37327
      Parent = dxLayoutControl1Group2
      Control = spnUnitWeight
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item9: TdxLayoutItem
      CaptionOptions.Text = #20307#31215#21333#20301
      Parent = dxLayoutControl1Group2
      Control = edtVolumeUnit
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item10: TdxLayoutItem
      CaptionOptions.Text = #21333#20301#20307#31215
      Parent = dxLayoutControl1Group2
      Control = spnUnitVolume
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item11: TdxLayoutItem
      CaptionOptions.Text = #20928#37325
      Parent = dxLayoutControl1Group2
      Control = spnNetWeight
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item12: TdxLayoutItem
      CaptionOptions.Text = #27611#37325
      Parent = dxLayoutControl1Group2
      Control = spnGrossWeight
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutControl1Item13: TdxLayoutItem
      CaptionOptions.Text = #29983#25928#26085#26399
      Parent = dxLayoutControl1Group3
      Control = dedtEffectiveDate
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item14: TdxLayoutItem
      CaptionOptions.Text = #35774#35745#22270#21495
      Parent = dxLayoutControl1Group3
      Control = edtDesignDrawingNo
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Group3: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item15: TdxLayoutItem
      CaptionOptions.Text = #35774#35745#29256#27425
      Parent = dxLayoutControl1Group3
      Control = edtDesignType
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item16: TdxLayoutItem
      CaptionOptions.Text = #26465#24418#30721
      Parent = dxLayoutControl1Group5
      Control = edtBarCode
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group5: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group1
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item17: TdxLayoutItem
      CaptionOptions.Text = #40664#35748#20179#24211
      Parent = dxLayoutControl1Group6
      Control = cmbWarehouse
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item18: TdxLayoutItem
      CaptionOptions.Text = #24211#20301
      Parent = dxLayoutControl1Group6
      Control = cmbStock
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group6: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item19: TdxLayoutItem
      CaptionOptions.Text = 'ABC'#20998#31867' '
      Parent = dxLayoutControl1Group6
      Control = edtAbcTypeGUID
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item20: TdxLayoutItem
      CaptionOptions.Text = ' '
      Parent = dxLayoutControl1Group5
      Control = ckbIsEnable
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item21: TdxLayoutItem
      CaptionOptions.Text = #24207#21495
      Parent = dxLayoutControl1Group5
      Control = spnOrderNo
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item22: TdxLayoutItem
      CaptionOptions.Text = #30424#28857#26041#24335
      Parent = dxLayoutControl1Group8
      Control = cmbInventoryWayGUID
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item23: TdxLayoutItem
      CaptionOptions.Text = #30424#28857#21608#26399
      Parent = dxLayoutControl1Group8
      Control = spnInventoryCycle
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group8: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item24: TdxLayoutItem
      CaptionOptions.Text = #30424#28857#26085#26399
      Parent = dxLayoutControl1Group8
      Control = dedtInventoryDate
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item25: TdxLayoutItem
      CaptionOptions.Text = #22833#25928#26085#26399
      Parent = dxLayoutControl1Group3
      Control = dedtExpiryDate
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item26: TdxLayoutItem
      CaptionOptions.Text = #25209#27425#21495
      Parent = dxLayoutControl1Group7
      Control = edtBatchNumber
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item27: TdxLayoutItem
      CaptionOptions.Text = #26377#25928#22825#25968
      Parent = dxLayoutControl1Group7
      Control = spnBatchEffectiveDays
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group7: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item28: TdxLayoutItem
      CaptionOptions.Text = #26816#27979#21608#26399
      Parent = dxLayoutControl1Group7
      Control = spnBatchCheckCycle
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item29: TdxLayoutItem
      CaptionOptions.Text = #26368#26032#20837#24211#26085#26399
      Parent = dxLayoutControl1Group9
      Control = dedtLatestInDate
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item30: TdxLayoutItem
      CaptionOptions.Text = #26368#26032#20837#24211#37327
      Parent = dxLayoutControl1Group9
      Control = spnLatestInNumber
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group9: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 6
    end
    object dxLayoutControl1Item31: TdxLayoutItem
      CaptionOptions.Text = #26368#26032#20986#24211#26085#26399
      Parent = dxLayoutControl1Group9
      Control = dedtLastOutDate
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item32: TdxLayoutItem
      CaptionOptions.Text = #26368#26032#20986#24211#37327
      Parent = dxLayoutControl1Group9
      Control = spnLastOutNumber
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item33: TdxLayoutItem
      CaptionOptions.Text = #26368#26032#26816#27979#26085#26399
      Parent = dxLayoutControl1Group10
      Control = dedtLastCheckDate
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item34: TdxLayoutItem
      CaptionOptions.Text = #26368#26032#26816#27979#32467#26524
      Parent = dxLayoutControl1Group10
      Control = mmLastCheckResult
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group10: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 7
    end
    object dxLayoutControl1Item35: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox1'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group11
      Control = cxDBCheckBox1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item36: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox2'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group11
      Control = cxDBCheckBox2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group11: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 8
    end
    object dxLayoutControl1Item37: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox3'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group11
      Control = cxDBCheckBox3
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item38: TdxLayoutItem
      CaptionOptions.Text = #29289#26009#24179#22343#26085#32791#37327
      Parent = dxLayoutControl1Group12
      Control = spnAvgDayConsumeNumber
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item39: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox4'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group11
      Control = ckb
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item40: TdxLayoutItem
      CaptionOptions.Text = #35745#21010#21333#20215
      Parent = dxLayoutControl1Group12
      Control = spnPlanningPrice
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group12: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 9
    end
    object dxLayoutControl1Item41: TdxLayoutItem
      CaptionOptions.Text = #36827#20215#19978#38480#29575
      Parent = dxLayoutControl1Group12
      Control = spnPriceTopLimit
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item42: TdxLayoutItem
      CaptionOptions.Text = #20379#24212#21830
      Parent = dxLayoutControl1Group12
      Control = cmbSupplier
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item43: TdxLayoutItem
      CaptionOptions.Text = #20379#26041#23545#24212#32534#30721
      Parent = dxLayoutControl1Group12
      Control = edtSuppPartCode
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item44: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox4'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group11
      Control = ckbIsIndependentRequire
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item45: TdxLayoutItem
      CaptionOptions.Text = #34917#36135#21608#26399
      Parent = dxLayoutControl1Group13
      Control = spnReplenishmentCycle
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item46: TdxLayoutItem
      CaptionOptions.Text = #34917#36135#25919#31574
      Parent = dxLayoutControl1Group13
      Control = cmbReplenishmentPolicy
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group13: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 10
    end
    object dxLayoutControl1Item47: TdxLayoutItem
      CaptionOptions.Text = #35746#36135#28857
      Parent = dxLayoutControl1Group13
      Control = spnOrderPoint
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item48: TdxLayoutItem
      CaptionOptions.Text = #35746#36135#25209#37327
      Parent = dxLayoutControl1Group13
      Control = spnOrderQuantity
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item49: TdxLayoutItem
      CaptionOptions.Text = #37319#36141#25110#21152#24037#25552#21069#26399
      Parent = dxLayoutControl1Group13
      Control = spnLeadTime
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item50: TdxLayoutItem
      CaptionOptions.Text = #38144#21806#24050#20998#37197#25968#37327
      Parent = dxLayoutControl1Group14
      Control = spnSaleNumber
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item51: TdxLayoutItem
      CaptionOptions.Text = #29983#20135#24050#20998#37197#37327
      Parent = dxLayoutControl1Group14
      Control = spnProductNumber
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group14: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 11
    end
    object dxLayoutControl1Item52: TdxLayoutItem
      CaptionOptions.Text = #26368#22823#35746#36135#37327
      Parent = dxLayoutControl1Group14
      Control = spnQtyMax
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item53: TdxLayoutItem
      CaptionOptions.Text = #26368#23567#35746#36135#37327
      Parent = dxLayoutControl1Group14
      Control = cxDBSpinEdit1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item54: TdxLayoutItem
      CaptionOptions.Text = #40664#35748#24037#33402#36335#32447
      Parent = dxLayoutControl1Group15
      Control = cmbDefaultRoutingGUID
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item55: TdxLayoutItem
      CaptionOptions.Text = #40664#35748#29983#20135#31867#22411
      Parent = dxLayoutControl1Group15
      Control = cmbDefaultWorkTypeGUID
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group15: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 12
    end
    object dxLayoutControl1Item56: TdxLayoutItem
      CaptionOptions.Text = #24212#20184#31185#30446
      Parent = dxLayoutControl1Group15
      Control = cmbAPAcctID
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item57: TdxLayoutItem
      CaptionOptions.Text = #24212#25910#31185#30446
      Parent = dxLayoutControl1Group15
      Control = cmbARAcctID
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item58: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox4'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group16
      Control = ckbIsCanReplace
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item59: TdxLayoutItem
      CaptionOptions.Text = #21487#26367#25442#29289#26009#32534#30721
      Parent = dxLayoutControl1Group16
      Control = edtReplacePartCode
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group16: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 13
    end
    object dxLayoutControl1Item60: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox4'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group17
      Control = cxDBCheckBox4
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item61: TdxLayoutItem
      CaptionOptions.Text = #26159#21542#20851#38190#20214
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group17
      Control = cxDBCheckBox5
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group17: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 14
    end
    object dxLayoutControl1Item62: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox6'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group17
      Control = cxDBCheckBox6
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item63: TdxLayoutItem
      CaptionOptions.Text = #38144#21806#26368#20302#20215
      Parent = dxLayoutControl1Group17
      Control = spnSaleLowPrice
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item64: TdxLayoutItem
      CaptionOptions.Text = #38144#21806#26368#20302#20215#24065#21035
      Parent = dxLayoutControl1Group17
      Control = cmbSaleLowMoneyType
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item65: TdxLayoutItem
      CaptionOptions.Text = #38144#21806#21333#20215
      Parent = dxLayoutControl1Group17
      Control = spnSalePrice
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item66: TdxLayoutItem
      CaptionOptions.Text = #26816#39564#21592
      Parent = dxLayoutControl1Group18
      Control = cmbChecker
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item67: TdxLayoutItem
      CaptionOptions.Text = #26816#39564#26041#24335
      Parent = dxLayoutControl1Group18
      Control = cmbCheckType
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group18: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 15
    end
    object dxLayoutControl1Item68: TdxLayoutItem
      CaptionOptions.Text = #26816#39564#26041#26696
      Parent = dxLayoutControl1Group18
      Control = cmbCheckProject
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item69: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox7'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group18
      Control = ckbIsKFPeriod
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item70: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox7'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group18
      Control = cxDBCheckBox7
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item71: TdxLayoutItem
      CaptionOptions.Text = #35774#22791#32534#30721
      Parent = dxLayoutControl1Group19
      Control = edtEquipmentCode
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item72: TdxLayoutItem
      CaptionOptions.Text = #22996#22806#21152#24037#26816#39564#26041#24335
      Parent = dxLayoutControl1Group19
      Control = cmbwwCheckType
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Group19: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 16
    end
    object dxLayoutControl1Item73: TdxLayoutItem
      CaptionOptions.Text = #22996#22806#21152#24037#26368#39640#20215
      Parent = dxLayoutControl1Group19
      Control = spnwwHighPrice
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item74: TdxLayoutItem
      CaptionOptions.Text = #22996#22806#21152#24037#26368#39640#20215#24065#21035
      Parent = dxLayoutControl1Group19
      Control = cmbwwHighPriceMoneyType
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item75: TdxLayoutItem
      CaptionOptions.Text = #36864#36135#26816#39564#26041#24335
      Parent = dxLayoutControl1Group23
      Control = cmbWithDrawCheckType
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item76: TdxLayoutItem
      CaptionOptions.Text = #21333#20301#26631#20934#25104#26412
      Parent = dxLayoutControl1Group23
      Control = spnStandardCost
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item77: TdxLayoutItem
      CaptionOptions.Text = #21333#20301#26631#20934#24037#26102'('#23567#26102')'
      Parent = dxLayoutControl1Group23
      Control = spnStandardManHour
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item78: TdxLayoutItem
      CaptionOptions.Text = #21333#20301#26631#20934#22266#23450#21046#36896#36153#29992#37329#39069
      Parent = dxLayoutControl1Group23
      Control = spnStdFixFeeRate
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item79: TdxLayoutItem
      CaptionOptions.Text = #26631#20934#24037#36164#29575
      Parent = dxLayoutControl1Group21
      Control = spnStdPayRate
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item80: TdxLayoutItem
      CaptionOptions.Text = #40664#35748#38144#21806#20154#21592#32534#30721
      Parent = dxLayoutControl1Group21
      Control = cmbDefaultSaler
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item81: TdxLayoutItem
      CaptionOptions.Text = #40664#35748#30340#23458#25143#32534#30721
      Parent = dxLayoutControl1Group21
      Control = cmbDefaultCustomCode
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item82: TdxLayoutItem
      CaptionOptions.Text = #22312#20080#26041#20351#29992#30340#32534#30721
      Parent = dxLayoutControl1Group21
      Control = edtCustomPartCode
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item83: TdxLayoutItem
      CaptionOptions.Text = 'cxDBCheckBox8'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group19
      Control = ckbIsEquipment
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group22: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      ItemIndex = 1
      LayoutDirection = ldTabbed
      Index = 17
    end
    object dxLayoutControl1Group21: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      Parent = dxLayoutControl1Group22
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutControl1Group23: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      Parent = dxLayoutControl1Group22
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=EasyERP;Data Source=.'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 376
    Top = 416
  end
  object MasterClientDataSet1: TMasterClientDataSet
    NotNullFieldList = <>
    DetailClientDataSetList = <>
    TableName = 'cdsPart'
    SyncClientDataSet = False
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 248
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Part'
    Left = 408
    Top = 416
  end
  object dsPart: TDataSource
    DataSet = ADOTable1
    Left = 448
    Top = 416
  end
end
