unit untEasyClassPluginDirectory;

interface

uses
  Classes, DB, DBClient;

type
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

    class procedure GeneratePluginDirectoryList();
  end;

var
  PluginDirectoryList: TList;

implementation

uses
  untEasyDBConnection;
  
{ TEasysysPluginsDirectory }

class procedure TEasysysPluginsDirectory.GeneratePluginDirectoryList();
var
  I: Integer;
  PluginDirectorySQL: string;
  AEasysysPluginsDirectory: TEasysysPluginsDirectory;
  AClientDataSet: TClientDataSet;
begin
  if PluginDirectoryList.Count > 0 then Exit;

  PluginDirectorySQL := 'SELECT * FROM vwSysPluginsDirectory ORDER BY IsDirectory, iOrder';
  //创建数据源，并获取数据
  AClientDataSet := TClientDataSet.Create(nil);
  AClientDataSet.Data := DMEasyDBConnection.EasyIRDMEasyPlateServerDisp.EasyGetRDMData(PluginDirectorySQL);
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

initialization
  PluginDirectoryList := TList.Create;

finalization
  while (PluginDirectoryList.Count > 0) do
  begin
    TObject(PluginDirectoryList.Items[0]).Free;
    PluginDirectoryList.Delete(0);
  end;
  PluginDirectoryList.Free;

end.
