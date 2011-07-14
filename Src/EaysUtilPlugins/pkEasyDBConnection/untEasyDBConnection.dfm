object DMEasyDBConnection: TDMEasyDBConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 432
  Top = 263
  Height = 250
  Width = 371
  object EasyADOConn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=EasyERP;Data Source=127.0.0.1;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 32
  end
  object EasyScktConn: TSocketConnection
    ObjectBroker = EasySOB
    Left = 48
    Top = 88
  end
  object EasySOB: TSimpleObjectBroker
    Left = 112
    Top = 88
  end
  object EasyQry: TADOQuery
    Connection = EasyADOConn
    Parameters = <>
    Left = 112
    Top = 32
  end
  object EasyDsp: TDataSetProvider
    DataSet = EasyQry
    Left = 160
    Top = 32
  end
  object img16: TImageList
    Left = 168
    Top = 88
  end
  object img32: TImageList
    Left = 216
    Top = 88
  end
end
