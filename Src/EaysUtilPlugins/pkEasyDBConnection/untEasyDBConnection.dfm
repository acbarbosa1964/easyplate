object DMEasyDBConnection: TDMEasyDBConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 458
  Top = 176
  Height = 250
  Width = 371
  object EasyADOConn: TADOConnection
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object EasyScktConn: TSocketConnection
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
end
