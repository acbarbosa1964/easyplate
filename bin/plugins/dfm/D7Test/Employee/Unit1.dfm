object Form1: TForm1
  Left = 174
  Top = 28
  Width = 1157
  Height = 714
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grdHrEmployee: TcxGrid
    Left = 0
    Top = 0
    Width = 230
    Height = 676
    Align = alLeft
    TabOrder = 0
    object grdTVHrEmployee: TcxGridDBTableView
      DataController.DataSource = dsHrEmployee
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object grdTVHrEmployeeEmployeeCode: TcxGridDBColumn
        Caption = #21592#24037#32534#21495
        DataBinding.FieldName = 'EmployeeCode'
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object grdTVHrEmployeeEmployeeCName: TcxGridDBColumn
        Caption = #20013#25991#21517#31216
        DataBinding.FieldName = 'EmployeeCName'
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object grdTVHrEmployeeCompanyGUID: TcxGridDBColumn
        Caption = #20844#21496
        DataBinding.FieldName = 'CompanyGUID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'CompanyGUID'
        Properties.ListColumns = <
          item
            FieldName = 'CompanyCName'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsCompany
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object grdTVHrEmployeeDepartmentGUID: TcxGridDBColumn
        Caption = #37096#38376
        DataBinding.FieldName = 'DepartmentGUID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'DeptGUID'
        Properties.ListColumns = <
          item
            FieldName = 'DeptCName'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsDept
        Visible = False
        GroupIndex = 1
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object grdTVHrEmployeePositionGUID: TcxGridDBColumn
        Caption = #32844#20301
        DataBinding.FieldName = 'PositionGUID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'PostGUID'
        Properties.ListColumns = <
          item
            FieldName = 'PostCName'
          end>
        Properties.ListSource = dsPostion
        Visible = False
        GroupIndex = 2
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
    end
    object grdHrEmployeeLevel1: TcxGridLevel
      GridView = grdTVHrEmployee
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 230
    Top = 0
    Width = 6
    Height = 676
    Control = grdHrEmployee
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 236
    Top = 0
    Width = 905
    Height = 676
    Align = alClient
    TabOrder = 2
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 111
      Top = 57
      DataBinding.DataField = 'EmployeeCName'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clMaroon
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 151
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 321
      Top = 57
      DataBinding.DataField = 'EmployeeEName'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 121
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 111
      Top = 84
      DataBinding.DataField = 'Birthday'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clMaroon
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 5
      Width = 121
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 321
      Top = 165
      DataBinding.DataField = 'NativePlaceGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Width = 121
    end
    object cxDBTextEdit10: TcxDBTextEdit
      Left = 321
      Top = 219
      DataBinding.DataField = 'Speciality'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 16
      Width = 121
    end
    object cxDBTextEdit13: TcxDBTextEdit
      Left = 111
      Top = 219
      DataBinding.DataField = 'GraduateInstitute'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 121
    end
    object cxDBTextEdit14: TcxDBTextEdit
      Left = 111
      Top = 305
      DataBinding.DataField = 'PersonContactTel'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 18
      Width = 121
    end
    object cxDBTextEdit15: TcxDBTextEdit
      Left = 111
      Top = 386
      DataBinding.DataField = 'FamilyContactTel'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 21
      Width = 121
    end
    object cxDBTextEdit16: TcxDBTextEdit
      Left = 111
      Top = 332
      DataBinding.DataField = 'OtherContact'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 19
      Width = 121
    end
    object cxDBTextEdit17: TcxDBTextEdit
      Left = 111
      Top = 278
      DataBinding.DataField = 'Email'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 17
      Width = 121
    end
    object cxDBTextEdit18: TcxDBTextEdit
      Left = 111
      Top = 359
      DataBinding.DataField = 'Residence'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 20
      Width = 121
    end
    object cxDBTextEdit23: TcxDBTextEdit
      Left = 315
      Top = 499
      DataBinding.DataField = 'InsureNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 27
      Width = 142
    end
    object cxDBTextEdit24: TcxDBTextEdit
      Left = 111
      Top = 499
      DataBinding.DataField = 'PayMentNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 26
      Width = 121
    end
    object cxDBDateEdit2: TcxDBDateEdit
      Left = 315
      Top = 580
      DataBinding.DataField = 'InCompanyDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 35
      Width = 121
    end
    object cxDBDateEdit3: TcxDBDateEdit
      Left = 111
      Top = 580
      DataBinding.DataField = 'TryoutDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 34
      Width = 121
    end
    object cxDBDateEdit4: TcxDBDateEdit
      Left = 495
      Top = 580
      DataBinding.DataField = 'FormalDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 36
      Width = 170
    end
    object cxDBTextEdit27: TcxDBTextEdit
      Left = 111
      Top = 607
      DataBinding.DataField = 'EmpContractNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 37
      Width = 121
    end
    object cxDBDateEdit5: TcxDBDateEdit
      Left = 315
      Top = 607
      DataBinding.DataField = 'EndDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 38
      Width = 121
    end
    object cxDBDateEdit6: TcxDBDateEdit
      Left = 111
      Top = 634
      DataBinding.DataField = 'CallTitleDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 40
      Width = 121
    end
    object cxDBTextEdit32: TcxDBTextEdit
      Left = 111
      Top = 413
      DataBinding.DataField = 'FamilyAddress'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 22
      Width = 121
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 442
      Top = 661
      Caption = #21551#29992
      DataBinding.DataField = 'IsEnable'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TextColor = clRed
      TabOrder = 45
      Width = 121
    end
    object cxDBSpinEdit1: TcxDBSpinEdit
      Left = 315
      Top = 661
      DataBinding.DataField = 'OrderNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 44
      Width = 121
    end
    object cxDBSpinEdit2: TcxDBSpinEdit
      Left = 495
      Top = 688
      DataBinding.DataField = 'RightNum'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 48
      Width = 170
    end
    object cxDBTextEdit34: TcxDBTextEdit
      Left = 315
      Top = 688
      DataBinding.DataField = 'BarCode'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 47
      Width = 121
    end
    object cxDBTextEdit35: TcxDBTextEdit
      Left = 111
      Top = 688
      DataBinding.DataField = 'ICCardID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 46
      Width = 121
    end
    object cxDBTextEdit37: TcxDBTextEdit
      Left = 111
      Top = 661
      DataBinding.DataField = 'SpeedCode'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 43
      Width = 121
    end
    object cxDBTextEdit38: TcxDBTextEdit
      Left = 39
      Top = 10
      DataBinding.DataField = 'EmployeeCode'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 111
      Top = 111
      DataBinding.DataField = 'SexGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsSex
      Style.BorderColor = clMaroon
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 7
      Width = 145
    end
    object cxDBLookupComboBox2: TcxDBLookupComboBox
      Left = 111
      Top = 165
      DataBinding.DataField = 'BroodGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsBrood
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 11
      Width = 145
    end
    object cxDBSpinEdit3: TcxDBSpinEdit
      Left = 111
      Top = 138
      DataBinding.DataField = 'Stature'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 9
      Width = 121
    end
    object cxDBLookupComboBox3: TcxDBLookupComboBox
      Left = 321
      Top = 84
      DataBinding.DataField = 'NationGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsNation
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 6
      Width = 145
    end
    object cxDBMaskEdit1: TcxDBMaskEdit
      Left = 321
      Top = 138
      DataBinding.DataField = 'IdentityCard'
      DataBinding.DataSource = dsHrEmployee
      Properties.EditMask = '!999999999999999999;1;_'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 10
      Width = 121
    end
    object cxDBLookupComboBox4: TcxDBLookupComboBox
      Left = 321
      Top = 192
      DataBinding.DataField = 'StudyExperienceGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsStudyExperience
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 14
      Width = 145
    end
    object cxDBImage1: TcxDBImage
      Left = 484
      Top = 10
      DataBinding.DataField = 'Photo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Height = 239
      Width = 189
    end
    object cxDBLookupComboBox5: TcxDBLookupComboBox
      Left = 111
      Top = 192
      DataBinding.DataField = 'PolityStatusGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPolityStatus
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 13
      Width = 145
    end
    object cxDBLookupComboBox6: TcxDBLookupComboBox
      Left = 321
      Top = 111
      DataBinding.DataField = 'MarryGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsMarry
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 8
      Width = 145
    end
    object cxDBLookupComboBox7: TcxDBLookupComboBox
      Left = 111
      Top = 472
      DataBinding.DataField = 'InServiceGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsInService
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 23
      Width = 145
    end
    object cxDBLookupComboBox8: TcxDBLookupComboBox
      Left = 519
      Top = 526
      DataBinding.DataField = 'PositionGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'PostGUID'
      Properties.ListColumns = <
        item
          FieldName = 'PostCName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPostion
      Style.BorderColor = clMaroon
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 30
      Width = 145
    end
    object cxDBCheckComboBox1: TcxDBCheckComboBox
      Left = 111
      Top = 553
      DataBinding.DataField = 'OthersPositionGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.Items = <>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 33
      Text = 'None selected'
      Width = 121
    end
    object cxDBLookupComboBox9: TcxDBLookupComboBox
      Left = 519
      Top = 472
      DataBinding.DataField = 'ResidenceTypeGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsResidenceType
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 25
      Width = 145
    end
    object cxDBLookupComboBox10: TcxDBLookupComboBox
      Left = 111
      Top = 526
      DataBinding.DataField = 'CompanyGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'CompanyGUID'
      Properties.ListColumns = <
        item
          FieldName = 'CompanyCName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsCompany
      Style.BorderColor = clMaroon
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 28
      Width = 145
    end
    object cxDBLookupComboBox11: TcxDBLookupComboBox
      Left = 315
      Top = 526
      DataBinding.DataField = 'DepartmentGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DeptGUID'
      Properties.ListColumns = <
        item
          FieldName = 'DeptCName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsDept
      Style.BorderColor = clMaroon
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 29
      Width = 145
    end
    object cxDBLookupComboBox12: TcxDBLookupComboBox
      Left = 315
      Top = 472
      DataBinding.DataField = 'EmployeeTypeGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsEmployeeType
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 24
      Width = 145
    end
    object cxDBLookupComboBox13: TcxDBLookupComboBox
      Left = 495
      Top = 607
      DataBinding.DataField = 'CallTitleGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsCallTitle
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 39
      Width = 170
    end
    object cxDBLookupComboBox14: TcxDBLookupComboBox
      Left = 315
      Top = 634
      DataBinding.DataField = 'ForeignLangaugeLevelGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsForeignLangaugeLevel
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 41
      Width = 118
    end
    object cxDBLookupComboBox15: TcxDBLookupComboBox
      Left = 504
      Top = 634
      DataBinding.DataField = 'ComputerTechnolicGUID'
      DataBinding.DataSource = dsHrEmployee
      Properties.KeyFieldNames = 'DataListGUID'
      Properties.ListColumns = <
        item
          FieldName = 'SysDataName'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsComputerTechnolic
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 42
      Width = 161
    end
    object cxDBBlobEdit1: TcxDBBlobEdit
      Left = 111
      Top = 715
      DataBinding.DataField = 'Remark'
      DataBinding.DataSource = dsHrEmployee
      Properties.BlobEditKind = bekMemo
      Properties.BlobPaintStyle = bpsText
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 49
      Width = 121
    end
    object dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      CaptionOptions.Text = #20013#25991#21517#31216
      LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
      Parent = dxLayoutControl1Group3
      Control = cxDBTextEdit2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      CaptionOptions.Text = #33521#25991#21517#31216
      Parent = dxLayoutControl1Group4
      Control = cxDBTextEdit3
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      CaptionOptions.Text = #20986#29983#26085#26399
      LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
      Parent = dxLayoutControl1Group3
      Control = cxDBDateEdit1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item9: TdxLayoutItem
      CaptionOptions.Text = #31821#36143
      Parent = dxLayoutControl1Group4
      Control = cxDBTextEdit7
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item12: TdxLayoutItem
      CaptionOptions.Text = #19987#19994
      Parent = dxLayoutControl1Group11
      Control = cxDBTextEdit10
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item15: TdxLayoutItem
      CaptionOptions.Text = #27605#19994#23398#26657
      Parent = dxLayoutControl1Group3
      Control = cxDBTextEdit13
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutControl1Item17: TdxLayoutItem
      CaptionOptions.Text = #32852#31995#30005#35805
      Parent = dxLayoutControl1Group6
      Control = cxDBTextEdit14
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item18: TdxLayoutItem
      CaptionOptions.Text = #23478#24237#32852#31995#30005#35805
      Parent = dxLayoutControl1Group6
      Control = cxDBTextEdit15
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item19: TdxLayoutItem
      CaptionOptions.Text = #20854#23427#32852#31995#26041#24335
      Parent = dxLayoutControl1Group6
      Control = cxDBTextEdit16
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item20: TdxLayoutItem
      CaptionOptions.Text = #37038#31665
      Parent = dxLayoutControl1Group6
      Control = cxDBTextEdit17
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item21: TdxLayoutItem
      CaptionOptions.Text = #29616#23621#22320#22336
      Parent = dxLayoutControl1Group6
      Control = cxDBTextEdit18
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item26: TdxLayoutItem
      CaptionOptions.Text = #31038#20250#20445#38505#24080#21495
      Parent = dxLayoutControl1Group14
      Control = cxDBTextEdit23
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item27: TdxLayoutItem
      CaptionOptions.Text = #20844#31215#37329#36134#21495
      Parent = dxLayoutControl1Group14
      Control = cxDBTextEdit24
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item30: TdxLayoutItem
      CaptionOptions.Text = #20837#20844#21496#26085#26399
      Parent = dxLayoutControl1Group12
      Control = cxDBDateEdit2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item31: TdxLayoutItem
      CaptionOptions.Text = #35797#29992#26399#24320#22987#26085#26399
      Parent = dxLayoutControl1Group12
      Control = cxDBDateEdit3
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item32: TdxLayoutItem
      CaptionOptions.Text = #36716#27491#26085#26399
      Parent = dxLayoutControl1Group12
      Control = cxDBDateEdit4
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item33: TdxLayoutItem
      CaptionOptions.Text = #21512#21516#21495
      Parent = dxLayoutControl1Group15
      Control = cxDBTextEdit27
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item34: TdxLayoutItem
      CaptionOptions.Text = #21512#21516#21040#26399#26085#26399
      Parent = dxLayoutControl1Group15
      Control = cxDBDateEdit5
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item37: TdxLayoutItem
      CaptionOptions.Text = #32844#31216#21462#24471#26085#26399
      Parent = dxLayoutControl1Group16
      Control = cxDBDateEdit6
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item40: TdxLayoutItem
      CaptionOptions.Text = #23478#24237#22320#22336
      Parent = dxLayoutControl1Group6
      Control = cxDBTextEdit32
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item42: TdxLayoutItem
      CaptionOptions.Text = 'IsEnable'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group1
      Control = cxDBCheckBox1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item43: TdxLayoutItem
      CaptionOptions.Text = #24207#21495
      Parent = dxLayoutControl1Group1
      Control = cxDBSpinEdit1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item44: TdxLayoutItem
      CaptionOptions.Text = #26435#37325
      Parent = dxLayoutControl1Group18
      Control = cxDBSpinEdit2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item45: TdxLayoutItem
      CaptionOptions.Text = #26465#24418#30721
      Parent = dxLayoutControl1Group10
      Control = cxDBTextEdit34
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item46: TdxLayoutItem
      CaptionOptions.Text = #21345#21495
      Parent = dxLayoutControl1Group10
      Control = cxDBTextEdit35
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item49: TdxLayoutItem
      CaptionOptions.Text = #24555#36895#30721
      Parent = dxLayoutControl1Group1
      Control = cxDBTextEdit37
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item50: TdxLayoutItem
      CaptionOptions.Text = #32534#21495
      Parent = dxLayoutControl1Group19
      Control = cxDBTextEdit38
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group2: TdxLayoutGroup
      CaptionOptions.Text = #22522#26412#20449#24687
      Parent = dxLayoutControl1Group19
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutControl1Group3: TdxLayoutGroup
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Group'
      Parent = dxLayoutControl1Group2
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group4: TdxLayoutGroup
      CaptionOptions.Text = 'New Group'
      Parent = dxLayoutControl1Group8
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group6: TdxLayoutGroup
      CaptionOptions.Text = #32852#31995#26041#24335
      Parent = dxLayoutControl1Group9
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 1
    end
    object dxLayoutControl1Group7: TdxLayoutGroup
      CaptionOptions.Text = #35814#32454#20449#24687
      Parent = dxLayoutControl1Group9
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 2
    end
    object dxLayoutControl1Group9: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutGroup1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      CaptionOptions.Text = #24615#21035
      LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
      Parent = dxLayoutControl1Group3
      Control = cxDBLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      CaptionOptions.Text = #34880#22411
      Parent = dxLayoutControl1Group3
      Control = cxDBLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      CaptionOptions.Text = #36523#39640
      Parent = dxLayoutControl1Group3
      Control = cxDBSpinEdit3
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      CaptionOptions.Text = #27665#26063
      Parent = dxLayoutControl1Group4
      Control = cxDBLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item8: TdxLayoutItem
      CaptionOptions.Text = #36523#20221#35777
      Parent = dxLayoutControl1Group4
      Control = cxDBMaskEdit1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item10: TdxLayoutItem
      CaptionOptions.Text = #23398#21382
      Parent = dxLayoutControl1Group8
      Control = cxDBLookupComboBox4
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item11: TdxLayoutItem
      CaptionOptions.AlignHorz = taCenter
      CaptionOptions.Layout = clBottom
      Parent = dxLayoutControl1Group13
      Control = cxDBImage1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item14: TdxLayoutItem
      CaptionOptions.Text = #25919#27835#38754#35980
      Parent = dxLayoutControl1Group3
      Control = cxDBLookupComboBox5
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item13: TdxLayoutItem
      CaptionOptions.Text = #23130#23035#29366#20917
      Parent = dxLayoutControl1Group4
      Control = cxDBLookupComboBox6
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Group8: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group11
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group11: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group2
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item16: TdxLayoutItem
      CaptionOptions.Text = #22312#32844#29366#24577
      Parent = dxLayoutControl1Group5
      Control = cxDBLookupComboBox7
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item22: TdxLayoutItem
      CaptionOptions.Text = #32844#20301
      LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
      Parent = dxLayoutControl1Group17
      Control = cxDBLookupComboBox8
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item23: TdxLayoutItem
      CaptionOptions.Text = #20854#23427#32844#20301
      Parent = dxLayoutControl1Group7
      Control = cxDBCheckComboBox1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item24: TdxLayoutItem
      CaptionOptions.Text = #25143#21475#31867#22411
      Parent = dxLayoutControl1Group5
      Control = cxDBLookupComboBox9
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item25: TdxLayoutItem
      CaptionOptions.Text = #25152#23646#20844#21496
      LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
      Parent = dxLayoutControl1Group17
      Control = cxDBLookupComboBox10
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item28: TdxLayoutItem
      CaptionOptions.Text = #25152#23646#37096#38376
      LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
      Parent = dxLayoutControl1Group17
      Control = cxDBLookupComboBox11
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item29: TdxLayoutItem
      CaptionOptions.Text = #20154#21592#31867#22411
      Parent = dxLayoutControl1Group5
      Control = cxDBLookupComboBox12
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item35: TdxLayoutItem
      CaptionOptions.Text = #32844#31216
      Parent = dxLayoutControl1Group15
      Control = cxDBLookupComboBox13
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item36: TdxLayoutItem
      CaptionOptions.Text = #22806#35821#27700#24179
      Parent = dxLayoutControl1Group16
      Control = cxDBLookupComboBox14
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item38: TdxLayoutItem
      CaptionOptions.Text = #35745#31639#26426#27700#24179
      Parent = dxLayoutControl1Group20
      Control = cxDBLookupComboBox15
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item39: TdxLayoutItem
      CaptionOptions.Text = #22791#27880
      Parent = dxLayoutControl1Group7
      Control = cxDBBlobEdit1
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutControl1Group1: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 7
    end
    object dxLayoutControl1Group5: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group10: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group18
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group12: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Group13: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group9
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group14: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group15: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Group17: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Group16: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group20
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group18: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 8
    end
    object dxLayoutControl1Group20: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group7
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 6
    end
    object dxLayoutControl1Group19: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group13
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
  end
  object dsHrEmployee: TDataSource
    DataSet = cdsHrEmployee
    Left = 666
    Top = 384
  end
  object dsCompany: TDataSource
    DataSet = cdsCompany
    Left = 490
    Top = 384
  end
  object dsDept: TDataSource
    Left = 530
    Top = 384
  end
  object dsPostion: TDataSource
    Left = 570
    Top = 384
  end
  object cdsCompany: TClientDataSet
    Aggregates = <>
    CommandText = 'select *  from vw_infCompany'
    Params = <>
    Left = 490
    Top = 352
  end
  object cdsDept: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from vw_infCompanyDept'
    Params = <>
    Left = 530
    Top = 352
  end
  object cdsPostion: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from vw_infDeptPostion'
    Params = <>
    Left = 570
    Top = 352
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 626
    Top = 392
    object dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel
      ItemOptions.CaptionOptions.TextColor = clRed
      ItemOptions.ControlBorderColor = clMaroon
    end
  end
  object dsNation: TDataSource
    DataSet = cdsNation
    Left = 940
    Top = 320
  end
  object cdsNation: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{293DBCA9-2B26-4685-A2CF-DF9FBF351994}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 940
    Top = 288
  end
  object cdsSex: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{00000000-0000-0000-0000-000000000001}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 980
    Top = 288
  end
  object dsSex: TDataSource
    DataSet = cdsSex
    Left = 980
    Top = 320
  end
  object cdsMarry: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{C256574A-4CE2-4193-B950-F163F0D20CF4}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 1020
    Top = 288
  end
  object dsMarry: TDataSource
    DataSet = cdsMarry
    Left = 1020
    Top = 320
  end
  object cdsBrood: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{00000000-0000-0000-0000-000000000002}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 940
    Top = 360
  end
  object dsBrood: TDataSource
    DataSet = cdsBrood
    Left = 940
    Top = 392
  end
  object cdsPolityStatus: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{9120DFDD-56F4-4EE8-9CAD-9D6BE534ECF5}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 980
    Top = 360
  end
  object dsPolityStatus: TDataSource
    DataSet = cdsPolityStatus
    Left = 980
    Top = 392
  end
  object cdsStudyExperience: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{4A0E4082-18BE-4A80-B6EC-27E99B1DD850}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 1020
    Top = 360
  end
  object dsStudyExperience: TDataSource
    DataSet = cdsStudyExperience
    Left = 1020
    Top = 392
  end
  object cdsInService: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{D15F165A-31D4-4D9C-A441-6C3D71258DF0}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 1060
    Top = 360
  end
  object dsInService: TDataSource
    DataSet = cdsInService
    Left = 1060
    Top = 392
  end
  object cdsEmployeeType: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{40CB5AD0-41E9-4DAE-998B-FA0A53DC9B59}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 940
    Top = 432
  end
  object dsEmployeeType: TDataSource
    DataSet = cdsEmployeeType
    Left = 940
    Top = 464
  end
  object cdsResidenceType: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{7184C59A-75BB-4EB6-A3D7-21D81D5F94DD}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 980
    Top = 432
  end
  object dsResidenceType: TDataSource
    DataSet = cdsResidenceType
    Left = 980
    Top = 464
  end
  object cdsCallTitle: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{C5FFE21A-D7BE-4F37-9EA5-35161816AD53}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 1020
    Top = 432
  end
  object dsCallTitle: TDataSource
    DataSet = cdsCallTitle
    Left = 1020
    Top = 464
  end
  object cdsForeignLangaugeLevel: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{729AAB66-16F7-4863-A554-B1ECE891B405}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 1060
    Top = 432
  end
  object dsForeignLangaugeLevel: TDataSource
    DataSet = cdsForeignLangaugeLevel
    Left = 1060
    Top = 464
  end
  object cdsComputerTechnolic: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT DataListGUID, SysDataName FROM vw_SysDataList WHERE Paren' +
      'tDataListGUID = '#39'{2F9E89C3-1445-4B76-97F6-9B709DF4C3A5}'#39' ORDER B' +
      'Y OrderNo'
    Params = <>
    Left = 940
    Top = 504
  end
  object dsComputerTechnolic: TDataSource
    DataSet = cdsComputerTechnolic
    Left = 980
    Top = 504
  end
  object cdsHrEmployee: TMasterClientDataSet
    NotNullFieldList = <
      item
        NotNullFieldName = 'EmployeeCName'
        HintInfo = #21592#24037#20013#25991#21517#31216
      end
      item
        NotNullFieldName = 'Birthday'
        HintInfo = #20986#29983#26085#26399
      end
      item
        NotNullFieldName = 'SexGUID'
        HintInfo = #24615#21035
      end
      item
        NotNullFieldName = 'CompanyGUID'
        HintInfo = #25152#23646#20844#21496
      end
      item
        NotNullFieldName = 'DepartmentGUID'
        HintInfo = #25152#23646#37096#38376
      end
      item
        NotNullFieldName = 'PositionGUID'
        HintInfo = #32844#20301
      end>
    DetailClientDataSetList = <>
    TableName = 'hrEmployee'
    KeyMasterFieldName = 'EmployeeGUID'
    SyncClientDataSet = False
    DeleteConfirmFieldName = 'EmployeeCName'
    Aggregates = <>
    CommandText = 'SELECT * FROM vw_hrEmployee'
    Params = <>
    Left = 668
    Top = 344
  end
  object gcdsCompany: TGangedClientDataSet
    NotNullFieldList = <>
    DetailClientDataSetList = <
      item
      end>
    SyncClientDataSet = False
    Aggregates = <>
    CommandText = 'select *  from vw_infCompany'
    Params = <>
    FirstGanged = False
    Left = 532
    Top = 320
  end
  object gcdsDept: TGangedClientDataSet
    NotNullFieldList = <>
    DetailClientDataSetList = <
      item
      end>
    SyncClientDataSet = False
    Aggregates = <>
    CommandText = 'select * from vw_infCompanyDept'
    Params = <>
    FirstGanged = False
    Left = 572
    Top = 320
  end
  object gcdsPost: TGangedClientDataSet
    NotNullFieldList = <>
    DetailClientDataSetList = <>
    SyncClientDataSet = False
    Aggregates = <>
    CommandText = 'select * from vw_infDeptPostion'
    Params = <>
    FirstGanged = False
    Left = 612
    Top = 320
  end
end
