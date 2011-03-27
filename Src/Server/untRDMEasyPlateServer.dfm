object RDMEasyPlateServer: TRDMEasyPlateServer
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 515
  Top = 220
  Height = 428
  Width = 282
  object EasyRDMADOConn: TADOConnection
    Left = 56
    Top = 24
  end
  object EasyRDMQry: TADOQuery
    Connection = EasyRDMADOConn
    OnDeleteError = EasyRDMQryDeleteError
    OnEditError = EasyRDMQryEditError
    OnPostError = EasyRDMQryPostError
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
  object EasyRDMDsp_Update: TDataSetProvider
    DataSet = EasyRDMQry_Update
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = EasyRDMDspUpdateError
    BeforeUpdateRecord = EasyRDMDspBeforeUpdateRecord
    Left = 56
    Top = 144
  end
  object EasyRDMQry_Update: TADOQuery
    Connection = EasyRDMADOConn
    Parameters = <>
    Left = 56
    Top = 200
  end
  object EasyRDMCds_Update: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 144
  end
  object EasyRDMDsp_WhereAll: TDataSetProvider
    DataSet = EasyRDMQry_WhereAll
    Options = [poAllowCommandText]
    OnUpdateError = EasyRDMDspUpdateError
    BeforeUpdateRecord = EasyRDMDspBeforeUpdateRecord
    Left = 56
    Top = 256
  end
  object EasyRDMQry_WhereAll: TADOQuery
    Connection = EasyRDMADOConn
    Parameters = <>
    Left = 56
    Top = 312
  end
  object EasyRDMCds_WhereAll: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 256
  end
end
