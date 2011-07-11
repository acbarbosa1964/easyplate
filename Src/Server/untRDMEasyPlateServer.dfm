object RDMEasyPlateServer: TRDMEasyPlateServer
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 341
  Top = 185
  Height = 428
  Width = 574
  object EasyRDMADOConn: TADOConnection
    LoginPrompt = False
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
    Left = 232
    Top = 24
  end
  object EasyRDMCds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'EasyRDMDsp'
    Left = 320
    Top = 24
  end
  object EasyRDMDsp_Update: TDataSetProvider
    DataSet = EasyRDMQry_Update
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = EasyRDMDspUpdateError
    BeforeUpdateRecord = EasyRDMDspBeforeUpdateRecord
    Left = 232
    Top = 88
  end
  object EasyRDMQry_Update: TADOQuery
    Connection = EasyRDMADOConn
    Parameters = <>
    Left = 144
    Top = 88
  end
  object EasyRDMCds_Update: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'EasyRDMDsp_Update'
    Left = 320
    Top = 88
  end
  object EasyRDMDsp_WhereAll: TDataSetProvider
    DataSet = EasyRDMQry_WhereAll
    Options = [poAllowCommandText]
    OnUpdateError = EasyRDMDspUpdateError
    BeforeUpdateRecord = EasyRDMDspBeforeUpdateRecord
    Left = 232
    Top = 152
  end
  object EasyRDMQry_WhereAll: TADOQuery
    Connection = EasyRDMADOConn
    Parameters = <>
    Left = 144
    Top = 152
  end
  object EasyRDMCds_WhereAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'EasyRDMDsp_WhereAll'
    Left = 320
    Top = 152
  end
  object dspTable: TDataSetProvider
    DataSet = QryTable
    Options = [poAllowCommandText]
    Left = 240
    Top = 216
  end
  object cdsTable: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTable'
    Left = 320
    Top = 216
  end
  object QryTable: TADOQuery
    Connection = EasyRDMADOConn
    Parameters = <>
    Left = 144
    Top = 216
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 56
    Top = 88
  end
end
