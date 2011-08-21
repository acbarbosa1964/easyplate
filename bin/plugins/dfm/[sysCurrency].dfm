object Untitled1: TForm
  Left = 268
  Top = 189
  Width = 770
  Height = 565
  ActiveControl = cxgrdSysCurrency
  Caption = 'Untitled1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxgrdSysCurrency: TcxGrid
    Left = 0
    Top = 0
    Width = 754
    Height = 527
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object cxgrdSysCurrencyDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSysCurrency
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      object cxgrdSysCurrencyDBTableView1IsBase: TcxGridDBColumn
        Caption = #26412#20301#24065
        DataBinding.FieldName = 'IsBase'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderAlignmentHorz = taCenter
        Width = 50
      end
      object cxgrdSysCurrencyDBTableView1CurrencyCName: TcxGridDBColumn
        Caption = #20013#25991#21517#31216
        DataBinding.FieldName = 'CurrencyCName'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object cxgrdSysCurrencyDBTableView1CurrencyEName: TcxGridDBColumn
        Caption = #33521#25991#21517#31216
        DataBinding.FieldName = 'CurrencyEName'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object cxgrdSysCurrencyDBTableView1CurrencySign: TcxGridDBColumn
        Caption = #36135#24065#31526#21495
        DataBinding.FieldName = 'CurrencySign'
        HeaderAlignmentHorz = taCenter
      end
      object cxgrdSysCurrencyDBTableView1ExchangeRate: TcxGridDBColumn
        Caption = #22806#27719#29575
        DataBinding.FieldName = 'ExchangeRate'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object cxgrdSysCurrencyDBTableView1TradeRate: TcxGridDBColumn
        Caption = #20132#26131#29575
        DataBinding.FieldName = 'TradeRate'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object cxgrdSysCurrencyDBTableView1UpdateTime: TcxGridDBColumn
        Caption = #26356#26032#26102#38388
        DataBinding.FieldName = 'UpdateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DateButtons = [btnClear, btnNow, btnToday]
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object cxgrdSysCurrencyDBTableView1IsVisible: TcxGridDBColumn
        Caption = #21487#35265#24615
        DataBinding.FieldName = 'IsVisible'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 50
      end
      object cxgrdSysCurrencyDBTableView1Remark: TcxGridDBColumn
        Caption = #22791#27880
        DataBinding.FieldName = 'Remark'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
    end
    object cxgrdSysCurrencyLevel1: TcxGridLevel
      GridView = cxgrdSysCurrencyDBTableView1
    end
  end
  object cdsSysCurrency: TClientDataSet
    Tag = 10001
    Aggregates = <>
    CommandText = 
      'SELECT [CurrencyGUID] ,[CurrencyCName] ,[CurrencyEName] ,[Exchan' +
      'geRate] ,[TradeRate] ,[CurrencySign] ,[IsBase] ,[IsVisible] ,[Up' +
      'dateTime] ,[Remark] ,[iOrderNo] FROM [sysCurrency]'#13#10
    Params = <>
    Left = 265
    Top = 170
  end
  object dsSysCurrency: TDataSource
    DataSet = cdsSysCurrency
    Left = 303
    Top = 170
  end
end
