object RDMEasyPlateServer: TRDMEasyPlateServer
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 284
  Top = 198
  Height = 185
  Width = 282
  object EasyRDMADOConn: TADOConnection
    Left = 56
    Top = 24
  end
  object EasyRDMQry: TADOQuery
    Connection = EasyRDMADOConn
    Parameters = <>
    Left = 144
    Top = 24
  end
  object EasyRDMDsp: TDataSetProvider
    DataSet = EasyRDMQry
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = EasyRDMDspUpdateError
    BeforeUpdateRecord = EasyRDMDspBeforeUpdateRecord
    Left = 56
    Top = 80
  end
  object EasyRDMCds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 80
  end
end
