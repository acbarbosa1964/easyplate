{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7
//                         一轩软研第三方开发包                         
//                         @Copyright 2010 hehf                      
//                   ------------------------------------                       
//                                                                              
//           本开发包是公司内部使用,作为开发工具使用任何,何海锋个人负责开发,任何
//       人不得外泄,否则后果自负.        
//
//            使用权限以及相关解释请联系何海锋  
//                
//                                                               
//            网站地址：http://www.YiXuan-SoftWare.com                                  
//            电子邮件：hehaifeng1984@126.com 
//                      YiXuan-SoftWare@hotmail.com    
//            QQ      ：383530895
//            MSN     ：YiXuan-SoftWare@hotmail.com                                   
//------------------------------------------------------------------------------
//单元说明：
//     定义系统经常使用的一此类，常驻内存
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyUtilClasses;

interface

uses
  Windows, Classes, DB, DBClient;

type

  TEasyUpdateMode = (eumWhereKeyOnly, eumWhereUpdated, eumWhereAll);

  //插件类
  PPLugin = ^TPlugin;
  TPlugin = record
    FileName: string; //插件文件
    EName: string;   //英文名
    CName: string;   //中文名
    image1: string;  //图片
    image2: string;  //点击时图片
    iOrder: Integer; //序号
    Flag  : string; //标志符
  end;

  TEasyObject = class
  private
    FGUID         : string;
    FClientDataSet: TClientDataSet;
    FRecordList   : TStrings;
    FKeyField     : string;
    FUpdateMode   : TEasyUpdateMode;
    FTag          : Integer;
    FFlag         : string;
    FData         : Pointer;
    function GetClientDataSet: TClientDataSet;
    function GetEasyUpdateMode: TEasyUpdateMode;
    function GetFlag: string;
    function GetGUID: string;
    function GetKeyField: string;
    function GetRecordList: TStrings;
    function GetTag: Integer;
    procedure SetClientDataSet(const Value: TClientDataSet);
    procedure SetEasyUpdateMode(const Value: TEasyUpdateMode);
    procedure SetFlag(const Value: string);
    procedure SetGUID(const Value: string);
    procedure SetKeyField(const Value: string);
    procedure SetRecordList(const Value: TStrings);
    procedure SetTag(const Value: Integer);
    function GetData: Pointer;
    procedure SetData(const Value: Pointer);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure GenerateListByRecord(var AClientDataSet: TClientDataSet); virtual;
    property GUID: string read GetGUID write SetGUID;
    property ClientDataSet: TClientDataSet read GetClientDataSet write SetClientDataSet;
    property RecordList: TStrings read GetRecordList write SetRecordList;
    property KeyField: string read GetKeyField write SetKeyField;
    property UpdateMode: TEasyUpdateMode read GetEasyUpdateMode write SetEasyUpdateMode;
    property Tag: Integer read GetTag write SetTag;
    property Flag: string read GetFlag write SetFlag;
    property Data: Pointer read GetData write SetData;
  end;

implementation

{ TEasyObject }

constructor TEasyObject.Create;
begin
  inherited;
  FRecordList := TStringList.Create;
end;

destructor TEasyObject.Destroy;
begin
  FRecordList.Free;
  if FData <> nil then
    TObject(FData).Free;
  inherited;
end;

procedure TEasyObject.GenerateListByRecord(var AClientDataSet: TClientDataSet);
var
  J: Integer;
begin
  for J := 0 to AClientDataSet.FieldCount - 1 do
    FRecordList.Add(AClientDataSet.Fields[J].FieldName + '=' + AClientDataSet.Fields[J].Value);
end;

function TEasyObject.GetClientDataSet: TClientDataSet;
begin
  Result := FClientDataSet;
end;

function TEasyObject.GetData: Pointer;
begin
  Result := FData;
end;

function TEasyObject.GetEasyUpdateMode: TEasyUpdateMode;
begin
  Result := FUpdateMode;
end;

function TEasyObject.GetFlag: string;
begin
  Result := FFlag;
end;

function TEasyObject.GetGUID: string;
begin
  Result := FGUID;
end;

function TEasyObject.GetKeyField: string;
begin
  Result := FKeyField;
end;

function TEasyObject.GetRecordList: TStrings;
begin
  Result := FRecordList;
end;

function TEasyObject.GetTag: Integer;
begin
  Result := FTag;
end;

procedure TEasyObject.SetClientDataSet(const Value: TClientDataSet);
begin
  FClientDataSet := Value;
end;

procedure TEasyObject.SetData(const Value: Pointer);
begin
  FData := Value;
end;

procedure TEasyObject.SetEasyUpdateMode(const Value: TEasyUpdateMode);
begin
  FUpdateMode := Value;
end;

procedure TEasyObject.SetFlag(const Value: string);
begin
  FFlag := Value;
end;

procedure TEasyObject.SetGUID(const Value: string);
begin
  FGUID := Value;
end;

procedure TEasyObject.SetKeyField(const Value: string);
begin
  FKeyField := Value;
end;

procedure TEasyObject.SetRecordList(const Value: TStrings);
begin
  FRecordList := Value;
end;

procedure TEasyObject.SetTag(const Value: Integer);
begin
  FTag := Value;
end;

end.
