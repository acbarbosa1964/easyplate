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
    BeforeUpdateRecord = EasyRDMDspBeforeUpdateRecord
    BeforeApplyUpdates = EasyRDMDspBeforeApplyUpdates
    BeforeGetRecords = EasyRDMDspBeforeGetRecords
    BeforeRowRequest = EasyRDMDspBeforeRowRequest
    BeforeExecute = EasyRDMDspBeforeExecute
    BeforeGetParams = EasyRDMDspBeforeGetParams
    Left = 56
    Top = 80
  end
  object cdsOutPutInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 80
  end
end
