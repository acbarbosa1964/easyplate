unit untEasyDBToolObject;

interface

uses
  Classes;

type
  TEasyDataBase = class
  private
    FName,
    Fdbid,
    Fsid,
    Fcrdate,
    Ffilename,
    Fversion : string;
  public
    property Name: string read FName write FName;
    property dbid: string read Fdbid write Fdbid;
    property sid: string read Fsid write Fsid;
    property crdate: string read Fcrdate write Fcrdate;
    property filename: string read Ffilename write Ffilename;
    property version: string read Fversion write Fversion;
  end;

  TEasyTableField = class
  private
    FTableName: string;
    FFieldOrder: Integer;
    FFieldName,
    FFlag     : string;
    FPrimaryKey: Boolean;
    FDataType : string;
    FDataByte,
    FDataLong,
    FDataPercimcal : Integer;
    FAllowNULL: Boolean;
    FDefaultValue,
    FFieldRemark : string;
    FIsLoad: Boolean;  //判断此表的字段是否已经获取过 如果获取过就不再获取
  public
    property TableName: string read FTableName write FTableName;
    property FieldOrder: Integer read FFieldOrder write FFieldOrder;
    property FieldName: string read FFieldName write FFieldName;
    property Flag: string read FFlag write FFlag;

    property PrimaryKey: Boolean read FPrimaryKey write FPrimaryKey;
    property DataType: string read FDataType write FDataType;
    property DataByte: Integer read FDataByte write FDataByte;
    property DataLong: Integer read FDataLong write FDataLong;
    property DataPercimcal: Integer read FDataPercimcal write FDataPercimcal;

    property AllowNULL: Boolean read FAllowNULL write FAllowNULL;
    property DefaultValue: string read FDefaultValue write FDefaultValue;
    property FieldRemark: string read FFieldRemark write FFieldRemark;
    property IsLoad: Boolean read FIsLoad write FIsLoad;
  end;

implementation

end.
