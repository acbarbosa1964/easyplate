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
    ServerGUID = '{4F1AC7AF-01E3-46AC-BB37-7C11C2D3B5E3}'
    ServerName = 'EasyPlateServer.RDMEasyPlateServer'
    Host = '127.0.0.1'
    InterceptGUID = '{01913E60-9C6D-4F35-83C3-5E7A8A41CDEB}'
    InterceptName = 'intrcpt.DataCompressor'
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
