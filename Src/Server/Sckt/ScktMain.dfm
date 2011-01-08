object SocketForm: TSocketForm
  Left = 272
  Top = 202
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'EasyPlate'#24037#20316#24179#21488'--'#12304#26381#21153#31471#12305
  ClientHeight = 432
  ClientWidth = 556
  Color = clBtnFace
  Constraints.MinHeight = 478
  Constraints.MinWidth = 437
  ParentFont = True
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pages: TPageControl
    Left = 89
    Top = 0
    Width = 467
    Height = 432
    ActivePage = StatPage
    Align = alClient
    TabOrder = 1
    object PropPage: TTabSheet
      Caption = #23646#24615
      DesignSize = (
        459
        404)
      object PortGroup: TGroupBox
        Left = 8
        Top = 8
        Width = 448
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Caption = #31471#21475
        TabOrder = 0
        DesignSize = (
          448
          97)
        object Label1: TLabel
          Left = 42
          Top = 20
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = '     '#30417#21548#31471#21475':'
          FocusControl = PortNo
        end
        object PortDesc: TLabel
          Left = 8
          Top = 40
          Width = 431
          Height = 49
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #31471#21475#30456#20851#30340#35768#22810#20215#20540#65292#25353#29031#24815#20363#65292#19968#20010#22914'FTP'#25110'HTTP'#29305#23450#30340#26381#21153#12290#31471#21475#26159#36830#25509#30340#26381#21153#22120#19978#20390#21548#23458#25143#31471#35831#27714#30340'ID'#12290
          WordWrap = True
        end
        object PortNo: TEdit
          Left = 120
          Top = 16
          Width = 73
          Height = 21
          TabOrder = 0
          Text = '211'
          OnExit = IntegerExit
        end
        object PortUpDown: TUpDown
          Left = 193
          Top = 16
          Width = 12
          Height = 21
          Associate = PortNo
          Min = 1
          Max = 32767
          Position = 211
          TabOrder = 1
          Thousands = False
          OnClick = UpDownClick
        end
      end
      object ThreadGroup: TGroupBox
        Left = 8
        Top = 112
        Width = 448
        Height = 81
        Anchors = [akLeft, akTop, akRight]
        Caption = #32447#31243#32531#23384
        TabOrder = 1
        DesignSize = (
          448
          81)
        object Label4: TLabel
          Left = 17
          Top = 16
          Width = 93
          Height = 13
          Alignment = taRightJustify
          Caption = '      '#32447#31243#32531#23384#22823#23567':'
          FocusControl = ThreadSize
        end
        object ThreadDesc: TLabel
          Left = 8
          Top = 40
          Width = 432
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #32447#31243#32531#23384#22823#23567#26159#21487#20197#37325#22797#20351#29992#30340#26032#23458#25143#31471#36830#25509#32447#31243#30340#26368#22823#25968#30446#12290
          WordWrap = True
        end
        object ThreadSize: TEdit
          Left = 120
          Top = 12
          Width = 73
          Height = 21
          TabOrder = 0
          Text = '10'
          OnExit = IntegerExit
        end
        object ThreadUpDown: TUpDown
          Left = 193
          Top = 12
          Width = 12
          Height = 21
          Associate = ThreadSize
          Max = 1000
          Position = 10
          TabOrder = 1
          Thousands = False
          OnClick = UpDownClick
        end
      end
      object InterceptGroup: TGroupBox
        Left = 8
        Top = 288
        Width = 448
        Height = 81
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #25318#25130'GUID'
        TabOrder = 3
        DesignSize = (
          448
          81)
        object Label5: TLabel
          Left = 16
          Top = 20
          Width = 30
          Height = 13
          Caption = '&GUID:'
        end
        object GUIDDesc: TLabel
          Left = 16
          Top = 40
          Width = 424
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #25318#25130'GUID'#26159#19968#20010'COM'#23545#35937#30340'GUID'#25968#25454#25318#25130#12290#26597#30475#24110#21161#65292#35814#24773'TSocketConnection'#12290
          WordWrap = True
        end
        object InterceptGUID: TEdit
          Left = 56
          Top = 16
          Width = 257
          Height = 21
          TabOrder = 0
        end
      end
      object TimeoutGroup: TGroupBox
        Left = 8
        Top = 200
        Width = 448
        Height = 81
        Anchors = [akLeft, akTop, akRight]
        Caption = #36229#26102
        TabOrder = 2
        DesignSize = (
          448
          81)
        object Label7: TLabel
          Left = 37
          Top = 16
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = '      '#36229#26102#26102#38271':'
          FocusControl = Timeout
        end
        object TimeoutDesc: TLabel
          Left = 16
          Top = 36
          Width = 424
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #38750#27963#21160#36229#26102'specifes'#30340#20998#38047#25968#65292#23458#25143#21487#20197#22312#26029#24320#36830#25509#20043#21069#26080#25928#12290' '#65288'0'#34920#31034#26080#38480#65289
          WordWrap = True
        end
        object Timeout: TEdit
          Left = 120
          Top = 12
          Width = 73
          Height = 21
          TabOrder = 0
          Text = '0'
          OnExit = IntegerExit
        end
        object TimeoutUpDown: TUpDown
          Left = 193
          Top = 12
          Width = 12
          Height = 21
          Associate = Timeout
          Max = 32767
          Increment = 30
          TabOrder = 1
          OnClick = UpDownClick
        end
      end
      object ApplyButton: TButton
        Tag = -1
        Left = 8
        Top = 375
        Width = 75
        Height = 25
        Action = ApplyAction
        Anchors = [akLeft, akBottom]
        Caption = #20445#23384'(&S)'
        TabOrder = 4
      end
    end
    object StatPage: TTabSheet
      Caption = #29992#25143
      object ConnectionList: TListView
        Left = 0
        Top = 0
        Width = 459
        Height = 385
        Align = alClient
        Columns = <
          item
            Caption = #31471#21475
          end
          item
            AutoSize = True
            Caption = 'IP'#22320#22336
          end
          item
            AutoSize = True
            Caption = #20027#26426
          end
          item
            AutoSize = True
            Caption = #36830#25509#24320#22987#26102#38388
          end>
        HideSelection = False
        MultiSelect = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = ConnectionListColumnClick
        OnCompare = ConnectionListCompare
      end
      object UserStatus: TStatusBar
        Left = 0
        Top = 385
        Width = 459
        Height = 19
        Panels = <>
        SimplePanel = True
      end
    end
    object TabSheet1: TTabSheet
      Caption = #36816#34892#26085#24535
      ImageIndex = 2
      object mmServerlog: TMemo
        Left = 0
        Top = 0
        Width = 459
        Height = 404
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 89
    Height = 432
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object PortList: TListBox
      Left = 0
      Top = 17
      Width = 89
      Height = 415
      Align = alClient
      BorderStyle = bsNone
      ItemHeight = 13
      TabOrder = 1
      OnClick = PortListClick
    end
    object HeaderControl1: THeaderControl
      Left = 0
      Top = 0
      Width = 89
      Height = 17
      Sections = <
        item
          AllowClick = False
          AutoSize = True
          ImageIndex = -1
          Text = #31471#21475#21015#34920
          Width = 89
        end>
    end
  end
  object PopupMenu: TPopupMenu
    Left = 8
    Top = 72
    object miClose: TMenuItem
      Caption = #20851#38381#26381#21153'(&C)'
      OnClick = miCloseClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miProperties: TMenuItem
      Caption = #26174#31034#31383#21475'(&P)'
      Default = True
      OnClick = miPropertiesClick
    end
  end
  object UpdateTimer: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = UpdateTimerTimer
    Left = 8
    Top = 104
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 8
    Top = 136
    object miPorts: TMenuItem
      Caption = #31471#21475'(&P)'
      object miAdd: TMenuItem
        Caption = #28155#21152'(&A)'
        OnClick = miAddClick
      end
      object miRemove: TMenuItem
        Action = RemovePortAction
        Caption = #31227#38500'(&R)'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = #20851#38381#31383#21475'(&E)'
        OnClick = miExitClick
      end
    end
    object Connections1: TMenuItem
      Caption = #36830#25509#31649#29702'(&C)'
      object miShowHostName: TMenuItem
        Action = ShowHostAction
        Caption = #26174#31034#20027#26426#21517
      end
      object ExportedObjectOnly1: TMenuItem
        Action = RegisteredAction
        Caption = #21482#26174#31034#24050#27880#20876#23545#35937
      end
      object XMLPacket1: TMenuItem
        Action = AllowXML
        Caption = #20801#35768'XML'#26684#24335#25968#25454#21253
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miDisconnect: TMenuItem
        Action = DisconnectAction
        Caption = #26029#24320#36830#25509
      end
    end
    object N4: TMenuItem
      Caption = #24110#21161
      object N5: TMenuItem
        Caption = #20851#20110
        OnClick = N5Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 168
    object ApplyAction: TAction
      Caption = '&Apply'
      OnExecute = ApplyActionExecute
      OnUpdate = ApplyActionUpdate
    end
    object DisconnectAction: TAction
      Caption = '&Disconnect'
      OnExecute = miDisconnectClick
      OnUpdate = DisconnectActionUpdate
    end
    object ShowHostAction: TAction
      Caption = '&Show Host Name'
      Checked = True
      OnExecute = ShowHostActionExecute
    end
    object RemovePortAction: TAction
      Caption = '&Remove'
      OnExecute = RemovePortActionExecute
      OnUpdate = RemovePortActionUpdate
    end
    object RegisteredAction: TAction
      Caption = '&Registered Objects Only'
      Checked = True
      OnExecute = RegisteredActionExecute
    end
    object AllowXML: TAction
      Caption = '&Allow XML Packets'
      Checked = True
      OnExecute = AllowXMLExecute
    end
  end
end
