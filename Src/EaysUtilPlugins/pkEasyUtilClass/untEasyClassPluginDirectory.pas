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
//    插件目录与插件参数类
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyClassPluginDirectory;

interface

uses
  Classes, DB, DBClient;

type

  { TEasysysPluginsDirectory }
  
  TEasysysPluginsDirectory = class
  private
  { Private declarations } 
    FPluginGUID: string;
    FPluginName: string;
    FiOrder: Integer;
    FPluginParamGUID: string;
    FImageIndex: Integer;
    FSelectedImageIndex: Integer;
    FIsDirectory: Boolean;
    FPluginFileName: string;
    FParentPluginGUID: string;
    FIsEnable: Boolean;
    FShowModal: Boolean;
  public
  { Public declarations } 
    property PluginGUID: string read FPluginGUID write FPluginGUID;
    property PluginName: string read FPluginName write FPluginName;
    property iOrder: Integer read FiOrder write FiOrder;
    property PluginParamGUID: string read FPluginParamGUID write FPluginParamGUID;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
    property SelectedImageIndex: Integer read FSelectedImageIndex write FSelectedImageIndex;
    property IsDirectory: Boolean read FIsDirectory write FIsDirectory;
    property PluginFileName: string read FPluginFileName write FPluginFileName;
    property ParentPluginGUID: string read FParentPluginGUID write FParentPluginGUID;
    property IsEnable: Boolean read FIsEnable write FIsEnable;
    property ShowModal: Boolean read FShowModal write FShowModal;

    class procedure GeneratePluginDirectoryList(var Data: OleVariant);
  end;

  { TEasysysPluginParam }
  
  TEasysysPluginParam = class
  private
  { Private declarations } 
    FPluginParamGUID: string;
    FParamName: string;
    FValueType: string;
    FValue: string;
    FPluginGUID: string;
  public
  { Public declarations } 
    property PluginParamGUID: string read FPluginParamGUID write FPluginParamGUID;
    property ParamName: string read FParamName write FParamName;
    property ValueType: string read FValueType write FValueType;
    property Value: string read FValue write FValue;
    property PluginGUID: string read FPluginGUID write FPluginGUID;

    class procedure GeneratePluginParam(var Data: OleVariant);
  end;

var
  PluginDirectoryList,
  PluginParamsList: TList;

implementation

{ TEasysysPluginsDirectory }

class procedure TEasysysPluginsDirectory.GeneratePluginDirectoryList(var Data: OleVariant);
var
  I: Integer;
  AEasysysPluginsDirectory: TEasysysPluginsDirectory;
  AClientDataSet: TClientDataSet;
begin
  if PluginDirectoryList.Count > 0 then Exit;

  //创建数据源，并获取数据
  AClientDataSet := TClientDataSet.Create(nil);
  AClientDataSet.Data := Data;
   //此句为实例化指定的对象
  AClientDataSet.First;
  try
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      AEasysysPluginsDirectory := TEasysysPluginsDirectory.Create;
      with AEasysysPluginsDirectory do
      begin
        PluginGUID := AClientDataSet.FieldByName('PluginGUID').AsString;
        PluginName := AClientDataSet.FieldByName('PluginName').AsString;
        iOrder := AClientDataSet.FieldByName('iOrder').AsInteger;
        PluginParamGUID := AClientDataSet.FieldByName('PluginParamGUID').AsString;
        ImageIndex := AClientDataSet.FieldByName('ImageIndex').AsInteger;
        SelectedImageIndex := AClientDataSet.FieldByName('SelectedImageIndex').AsInteger;
        IsDirectory := AClientDataSet.FieldByName('IsDirectory').AsBoolean;
        PluginFileName := AClientDataSet.FieldByName('PluginFileName').AsString;
        ParentPluginGUID := AClientDataSet.FieldByName('ParentPluginGUID').AsString;
        IsEnable := AClientDataSet.FieldByName('IsEnable').AsBoolean;
        ShowModal := AClientDataSet.FieldByName('ShowModal').AsBoolean;
      end;
     //在此添加将对象存放到指定容器的代码
      PluginDirectoryList.Add(AEasysysPluginsDirectory);
     //如果要关联树也在此添加相应代码
      AClientDataSet.Next;
    end;
  finally
    AClientDataSet.Free;
  end;
end;

{ TEasysysPluginParam }

class procedure TEasysysPluginParam.GeneratePluginParam(var Data: OleVariant);
var
  I: Integer;
  AEasysysPluginParam: TEasysysPluginParam;
  AClientDataSet: TClientDataSet;
begin
  if Assigned(PluginParamsList) then
    if PluginParamsList.Count > 0 then
      Exit;

  //创建数据源，并获取数据
  AClientDataSet := TClientDataSet.Create(nil);
  AClientDataSet.Data := Data;

   //此句为实例化指定的对象
  AClientDataSet.First;
  for I := 0 to AClientDataSet.RecordCount - 1 do
  begin
    AEasysysPluginParam := TEasysysPluginParam.Create;
    with AEasysysPluginParam do
    begin
      PluginParamGUID := AClientDataSet.FieldByName('PluginParamGUID').AsString;
      ParamName := AClientDataSet.FieldByName('ParamName').AsString;
      ValueType := AClientDataSet.FieldByName('ValueType').AsString;
      Value := AClientDataSet.FieldByName('Value').AsString;
      PluginGUID := AClientDataSet.FieldByName('PluginGUID').AsString;
    end;
    //在此添加将对象存放到指定容器的代码
    PluginParamsList.Add(AEasysysPluginParam);
    //如果要关联树也在此添加相应代码
    AClientDataSet.Next;
  end;
end;

initialization
  PluginDirectoryList := TList.Create;

finalization
  while (PluginDirectoryList.Count > 0) do
  begin
    TObject(PluginDirectoryList.Items[0]).Free;
    PluginDirectoryList.Delete(0);
  end;
  PluginDirectoryList.Free;

  if Assigned(PluginParamsList) then
  begin
    while (PluginParamsList.Count > 0) do
    begin
      TObject(PluginParamsList.Items[0]).Free;
      PluginParamsList.Delete(0);
    end;
    PluginParamsList.Free;
  end;

end.
