object Form1: TForm1
  Left = 159
  Top = 171
  Width = 870
  Height = 500
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
    Height = 462
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
    Height = 462
    Control = grdHrEmployee
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 236
    Top = 0
    Width = 618
    Height = 462
    Align = alClient
    TabOrder = 2
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 151
      Top = 10
      DataBinding.DataField = 'EmployeeGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 151
      Top = 37
      DataBinding.DataField = 'EmployeeCName'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 151
      Top = 64
      DataBinding.DataField = 'EmployeeEName'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 151
      Top = 91
      DataBinding.DataField = 'SexGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 121
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 151
      Top = 118
      DataBinding.DataField = 'Birthday'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 5
      Width = 121
    end
    object cxDBCurrencyEdit1: TcxDBCurrencyEdit
      Left = 151
      Top = 145
      DataBinding.DataField = 'Stature'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 6
      Width = 121
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 151
      Top = 172
      DataBinding.DataField = 'BroodGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 121
    end
    object cxDBTextEdit6: TcxDBTextEdit
      Left = 151
      Top = 199
      DataBinding.DataField = 'NationGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 121
    end
    object cxDBTextEdit7: TcxDBTextEdit
      Left = 151
      Top = 226
      DataBinding.DataField = 'NativePlaceGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 9
      Width = 121
    end
    object cxDBTextEdit8: TcxDBTextEdit
      Left = 151
      Top = 253
      DataBinding.DataField = 'IdentityCard'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Width = 121
    end
    object cxDBTextEdit9: TcxDBTextEdit
      Left = 151
      Top = 280
      DataBinding.DataField = 'StudyExperienceGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 13
      Width = 121
    end
    object cxDBTextEdit10: TcxDBTextEdit
      Left = 151
      Top = 307
      DataBinding.DataField = 'Speciality'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 14
      Width = 121
    end
    object cxDBTextEdit11: TcxDBTextEdit
      Left = 151
      Top = 334
      DataBinding.DataField = 'MarryGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 121
    end
    object cxDBTextEdit12: TcxDBTextEdit
      Left = 151
      Top = 361
      DataBinding.DataField = 'PolityStatusGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 16
      Width = 121
    end
    object cxDBTextEdit13: TcxDBTextEdit
      Left = 151
      Top = 388
      DataBinding.DataField = 'GraduateInstitute'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 17
      Width = 121
    end
    object cxDBMemo1: TcxDBMemo
      Left = 151
      Top = 415
      DataBinding.DataField = 'Photo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 18
      Height = 89
      Width = 185
    end
    object cxDBTextEdit14: TcxDBTextEdit
      Left = 151
      Top = 510
      DataBinding.DataField = 'PersonContactTel'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 19
      Width = 121
    end
    object cxDBTextEdit15: TcxDBTextEdit
      Left = 151
      Top = 537
      DataBinding.DataField = 'FamilyContactTel'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 20
      Width = 121
    end
    object cxDBTextEdit16: TcxDBTextEdit
      Left = 151
      Top = 564
      DataBinding.DataField = 'OtherContact'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 21
      Width = 121
    end
    object cxDBTextEdit17: TcxDBTextEdit
      Left = 151
      Top = 591
      DataBinding.DataField = 'Email'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 22
      Width = 121
    end
    object cxDBTextEdit18: TcxDBTextEdit
      Left = 151
      Top = 618
      DataBinding.DataField = 'Residence'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 23
      Width = 121
    end
    object cxDBTextEdit19: TcxDBTextEdit
      Left = 151
      Top = 645
      DataBinding.DataField = 'InServiceGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 24
      Width = 121
    end
    object cxDBTextEdit20: TcxDBTextEdit
      Left = 151
      Top = 672
      DataBinding.DataField = 'PositionGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 25
      Width = 121
    end
    object cxDBTextEdit21: TcxDBTextEdit
      Left = 151
      Top = 699
      DataBinding.DataField = 'OthersPositionGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 26
      Width = 121
    end
    object cxDBTextEdit22: TcxDBTextEdit
      Left = 151
      Top = 726
      DataBinding.DataField = 'ResidenceTypeGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 27
      Width = 121
    end
    object cxDBTextEdit23: TcxDBTextEdit
      Left = 151
      Top = 753
      DataBinding.DataField = 'InsureNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 28
      Width = 121
    end
    object cxDBTextEdit24: TcxDBTextEdit
      Left = 151
      Top = 780
      DataBinding.DataField = 'PayMentNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 29
      Width = 121
    end
    object cxDBTextEdit25: TcxDBTextEdit
      Left = 151
      Top = 807
      DataBinding.DataField = 'CompanyGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 30
      Width = 121
    end
    object cxDBTextEdit26: TcxDBTextEdit
      Left = 151
      Top = 834
      DataBinding.DataField = 'DepartmentGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 31
      Width = 121
    end
    object cxDBDateEdit2: TcxDBDateEdit
      Left = 151
      Top = 861
      DataBinding.DataField = 'InCompanyDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 32
      Width = 121
    end
    object cxDBDateEdit3: TcxDBDateEdit
      Left = 151
      Top = 888
      DataBinding.DataField = 'TryoutDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 33
      Width = 121
    end
    object cxDBDateEdit4: TcxDBDateEdit
      Left = 151
      Top = 915
      DataBinding.DataField = 'FormalDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 34
      Width = 121
    end
    object cxDBTextEdit27: TcxDBTextEdit
      Left = 151
      Top = 942
      DataBinding.DataField = 'EmpContractNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 35
      Width = 121
    end
    object cxDBDateEdit5: TcxDBDateEdit
      Left = 151
      Top = 969
      DataBinding.DataField = 'EndDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 36
      Width = 121
    end
    object cxDBTextEdit28: TcxDBTextEdit
      Left = 151
      Top = 996
      DataBinding.DataField = 'EmployeeTypeGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 37
      Width = 121
    end
    object cxDBTextEdit29: TcxDBTextEdit
      Left = 151
      Top = 1023
      DataBinding.DataField = 'CallTitleGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 38
      Width = 121
    end
    object cxDBDateEdit6: TcxDBDateEdit
      Left = 151
      Top = 1050
      DataBinding.DataField = 'CallTitleDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 39
      Width = 121
    end
    object cxDBTextEdit30: TcxDBTextEdit
      Left = 151
      Top = 1077
      DataBinding.DataField = 'ForeignLangaugeLevelGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 40
      Width = 121
    end
    object cxDBTextEdit31: TcxDBTextEdit
      Left = 151
      Top = 1104
      DataBinding.DataField = 'ComputerTechnolicGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 41
      Width = 121
    end
    object cxDBTextEdit32: TcxDBTextEdit
      Left = 151
      Top = 1131
      DataBinding.DataField = 'FamilyAddress'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 42
      Width = 121
    end
    object cxDBTextEdit33: TcxDBTextEdit
      Left = 151
      Top = 1158
      DataBinding.DataField = 'Remark'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 43
      Width = 121
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 10
      Top = 1185
      Caption = 'IsEnable'
      DataBinding.DataField = 'IsEnable'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 44
      Width = 121
    end
    object cxDBSpinEdit1: TcxDBSpinEdit
      Left = 151
      Top = 1212
      DataBinding.DataField = 'OrderNo'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 45
      Width = 121
    end
    object cxDBSpinEdit2: TcxDBSpinEdit
      Left = 151
      Top = 1239
      DataBinding.DataField = 'RightNum'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 46
      Width = 121
    end
    object cxDBTextEdit34: TcxDBTextEdit
      Left = 151
      Top = 1266
      DataBinding.DataField = 'BarCode'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 47
      Width = 121
    end
    object cxDBTextEdit35: TcxDBTextEdit
      Left = 151
      Top = 1293
      DataBinding.DataField = 'ICCardID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 48
      Width = 121
    end
    object cxDBDateEdit7: TcxDBDateEdit
      Left = 151
      Top = 1320
      DataBinding.DataField = 'InputDate'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 49
      Width = 121
    end
    object cxDBTextEdit36: TcxDBTextEdit
      Left = 151
      Top = 1347
      DataBinding.DataField = 'UserGUID'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 50
      Width = 121
    end
    object cxDBTextEdit37: TcxDBTextEdit
      Left = 151
      Top = 1374
      DataBinding.DataField = 'SpeedCode'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 51
      Width = 121
    end
    object cxDBTextEdit38: TcxDBTextEdit
      Left = 151
      Top = 1401
      DataBinding.DataField = 'EmployeeCode'
      DataBinding.DataSource = dsHrEmployee
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 52
      Width = 121
    end
    object dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      CaptionOptions.Text = 'EmployeeGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      CaptionOptions.Text = 'EmployeeCName'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      CaptionOptions.Text = 'EmployeeEName'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit3
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      CaptionOptions.Text = 'SexGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit4
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      CaptionOptions.Text = 'Birthday'
      Parent = dxLayoutGroup1
      Control = cxDBDateEdit1
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      CaptionOptions.Text = 'Stature'
      Parent = dxLayoutGroup1
      Control = cxDBCurrencyEdit1
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      CaptionOptions.Text = 'BroodGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit5
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutControl1Item8: TdxLayoutItem
      CaptionOptions.Text = 'NationGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit6
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutControl1Item9: TdxLayoutItem
      CaptionOptions.Text = 'NativePlaceGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit7
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutControl1Item10: TdxLayoutItem
      CaptionOptions.Text = 'IdentityCard'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit8
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutControl1Item11: TdxLayoutItem
      CaptionOptions.Text = 'StudyExperienceGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit9
      ControlOptions.ShowBorder = False
      Index = 10
    end
    object dxLayoutControl1Item12: TdxLayoutItem
      CaptionOptions.Text = 'Speciality'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit10
      ControlOptions.ShowBorder = False
      Index = 11
    end
    object dxLayoutControl1Item13: TdxLayoutItem
      CaptionOptions.Text = 'MarryGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit11
      ControlOptions.ShowBorder = False
      Index = 12
    end
    object dxLayoutControl1Item14: TdxLayoutItem
      CaptionOptions.Text = 'PolityStatusGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit12
      ControlOptions.ShowBorder = False
      Index = 13
    end
    object dxLayoutControl1Item15: TdxLayoutItem
      CaptionOptions.Text = 'GraduateInstitute'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit13
      ControlOptions.ShowBorder = False
      Index = 14
    end
    object dxLayoutControl1Item16: TdxLayoutItem
      CaptionOptions.Text = 'Photo'
      Parent = dxLayoutGroup1
      Control = cxDBMemo1
      ControlOptions.ShowBorder = False
      Index = 15
    end
    object dxLayoutControl1Item17: TdxLayoutItem
      CaptionOptions.Text = 'PersonContactTel'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit14
      ControlOptions.ShowBorder = False
      Index = 16
    end
    object dxLayoutControl1Item18: TdxLayoutItem
      CaptionOptions.Text = 'FamilyContactTel'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit15
      ControlOptions.ShowBorder = False
      Index = 17
    end
    object dxLayoutControl1Item19: TdxLayoutItem
      CaptionOptions.Text = 'OtherContact'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit16
      ControlOptions.ShowBorder = False
      Index = 18
    end
    object dxLayoutControl1Item20: TdxLayoutItem
      CaptionOptions.Text = 'Email'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit17
      ControlOptions.ShowBorder = False
      Index = 19
    end
    object dxLayoutControl1Item21: TdxLayoutItem
      CaptionOptions.Text = 'Residence'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit18
      ControlOptions.ShowBorder = False
      Index = 20
    end
    object dxLayoutControl1Item22: TdxLayoutItem
      CaptionOptions.Text = 'InServiceGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit19
      ControlOptions.ShowBorder = False
      Index = 21
    end
    object dxLayoutControl1Item23: TdxLayoutItem
      CaptionOptions.Text = 'PositionGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit20
      ControlOptions.ShowBorder = False
      Index = 22
    end
    object dxLayoutControl1Item24: TdxLayoutItem
      CaptionOptions.Text = 'OthersPositionGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit21
      ControlOptions.ShowBorder = False
      Index = 23
    end
    object dxLayoutControl1Item25: TdxLayoutItem
      CaptionOptions.Text = 'ResidenceTypeGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit22
      ControlOptions.ShowBorder = False
      Index = 24
    end
    object dxLayoutControl1Item26: TdxLayoutItem
      CaptionOptions.Text = 'InsureNo'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit23
      ControlOptions.ShowBorder = False
      Index = 25
    end
    object dxLayoutControl1Item27: TdxLayoutItem
      CaptionOptions.Text = 'PayMentNo'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit24
      ControlOptions.ShowBorder = False
      Index = 26
    end
    object dxLayoutControl1Item28: TdxLayoutItem
      CaptionOptions.Text = 'CompanyGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit25
      ControlOptions.ShowBorder = False
      Index = 27
    end
    object dxLayoutControl1Item29: TdxLayoutItem
      CaptionOptions.Text = 'DepartmentGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit26
      ControlOptions.ShowBorder = False
      Index = 28
    end
    object dxLayoutControl1Item30: TdxLayoutItem
      CaptionOptions.Text = 'InCompanyDate'
      Parent = dxLayoutGroup1
      Control = cxDBDateEdit2
      ControlOptions.ShowBorder = False
      Index = 29
    end
    object dxLayoutControl1Item31: TdxLayoutItem
      CaptionOptions.Text = 'TryoutDate'
      Parent = dxLayoutGroup1
      Control = cxDBDateEdit3
      ControlOptions.ShowBorder = False
      Index = 30
    end
    object dxLayoutControl1Item32: TdxLayoutItem
      CaptionOptions.Text = 'FormalDate'
      Parent = dxLayoutGroup1
      Control = cxDBDateEdit4
      ControlOptions.ShowBorder = False
      Index = 31
    end
    object dxLayoutControl1Item33: TdxLayoutItem
      CaptionOptions.Text = 'EmpContractNo'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit27
      ControlOptions.ShowBorder = False
      Index = 32
    end
    object dxLayoutControl1Item34: TdxLayoutItem
      CaptionOptions.Text = 'EndDate'
      Parent = dxLayoutGroup1
      Control = cxDBDateEdit5
      ControlOptions.ShowBorder = False
      Index = 33
    end
    object dxLayoutControl1Item35: TdxLayoutItem
      CaptionOptions.Text = 'EmployeeTypeGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit28
      ControlOptions.ShowBorder = False
      Index = 34
    end
    object dxLayoutControl1Item36: TdxLayoutItem
      CaptionOptions.Text = 'CallTitleGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit29
      ControlOptions.ShowBorder = False
      Index = 35
    end
    object dxLayoutControl1Item37: TdxLayoutItem
      CaptionOptions.Text = 'CallTitleDate'
      Parent = dxLayoutGroup1
      Control = cxDBDateEdit6
      ControlOptions.ShowBorder = False
      Index = 36
    end
    object dxLayoutControl1Item38: TdxLayoutItem
      CaptionOptions.Text = 'ForeignLangaugeLevelGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit30
      ControlOptions.ShowBorder = False
      Index = 37
    end
    object dxLayoutControl1Item39: TdxLayoutItem
      CaptionOptions.Text = 'ComputerTechnolicGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit31
      ControlOptions.ShowBorder = False
      Index = 38
    end
    object dxLayoutControl1Item40: TdxLayoutItem
      CaptionOptions.Text = 'FamilyAddress'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit32
      ControlOptions.ShowBorder = False
      Index = 39
    end
    object dxLayoutControl1Item41: TdxLayoutItem
      CaptionOptions.Text = 'Remark'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit33
      ControlOptions.ShowBorder = False
      Index = 40
    end
    object dxLayoutControl1Item42: TdxLayoutItem
      CaptionOptions.Text = 'IsEnable'
      CaptionOptions.Visible = False
      Parent = dxLayoutGroup1
      Control = cxDBCheckBox1
      ControlOptions.ShowBorder = False
      Index = 41
    end
    object dxLayoutControl1Item43: TdxLayoutItem
      CaptionOptions.Text = 'OrderNo'
      Parent = dxLayoutGroup1
      Control = cxDBSpinEdit1
      ControlOptions.ShowBorder = False
      Index = 42
    end
    object dxLayoutControl1Item44: TdxLayoutItem
      CaptionOptions.Text = 'RightNum'
      Parent = dxLayoutGroup1
      Control = cxDBSpinEdit2
      ControlOptions.ShowBorder = False
      Index = 43
    end
    object dxLayoutControl1Item45: TdxLayoutItem
      CaptionOptions.Text = 'BarCode'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit34
      ControlOptions.ShowBorder = False
      Index = 44
    end
    object dxLayoutControl1Item46: TdxLayoutItem
      CaptionOptions.Text = 'ICCardID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit35
      ControlOptions.ShowBorder = False
      Index = 45
    end
    object dxLayoutControl1Item47: TdxLayoutItem
      CaptionOptions.Text = 'InputDate'
      Parent = dxLayoutGroup1
      Control = cxDBDateEdit7
      ControlOptions.ShowBorder = False
      Index = 46
    end
    object dxLayoutControl1Item48: TdxLayoutItem
      CaptionOptions.Text = 'UserGUID'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit36
      ControlOptions.ShowBorder = False
      Index = 47
    end
    object dxLayoutControl1Item49: TdxLayoutItem
      CaptionOptions.Text = 'SpeedCode'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit37
      ControlOptions.ShowBorder = False
      Index = 48
    end
    object dxLayoutControl1Item50: TdxLayoutItem
      CaptionOptions.Text = 'EmployeeCode'
      Parent = dxLayoutGroup1
      Control = cxDBTextEdit38
      ControlOptions.ShowBorder = False
      Index = 49
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=EasyERP;Data Source=.'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 355
    Top = 49
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'vw_hrEmployee'
    Left = 400
    Top = 54
  end
  object dsHrEmployee: TDataSource
    DataSet = ADOTable1
    Left = 459
    Top = 58
  end
  object dsCompany: TDataSource
    DataSet = ADOTable2
    Left = 458
    Top = 163
  end
  object dsDept: TDataSource
    DataSet = ADOTable3
    Left = 504
    Top = 168
  end
  object dsPostion: TDataSource
    DataSet = ADOTable4
    Left = 543
    Top = 166
  end
  object ADOTable2: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'vw_infCompany'
    Left = 459
    Top = 117
  end
  object ADOTable3: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'infCompanyDept'
    Left = 498
    Top = 117
  end
  object ADOTable4: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'infDeptPostion'
    Left = 541
    Top = 119
  end
  object cdsCompany: TClientDataSet
    Aggregates = <>
    CommandText = 'select *  from vw_infCompany'
    Params = <>
    Left = 460
    Top = 205
  end
  object cdsDept: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from vw_infCompanyDept'
    Params = <>
    Left = 509
    Top = 203
  end
  object cdsPostion: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from vw_infDeptPostion'
    Params = <>
    Left = 551
    Top = 204
  end
end
