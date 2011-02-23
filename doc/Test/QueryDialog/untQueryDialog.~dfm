object Form1: TForm1
  Left = 310
  Top = 210
  Width = 480
  Height = 443
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 136
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 64
    Top = 288
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=Easy;Data Source=.'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 184
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 224
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 168
    Top = 112
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM TEST1'
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 208
    Top = 112
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADOQuery1
    Options = [poAllowCommandText]
    Left = 264
    Top = 80
  end
end
