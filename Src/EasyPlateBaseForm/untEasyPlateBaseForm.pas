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
//    本单元是工程的最基本单元，本框架下的所有窗体都必须从此基窗体继承
//
//主要实现：
//    1、回车->Tab
//       设置KeyPreView为True，则在按下回车键等同于按下Tab键
//    2、FormId
//       所有继承的窗体都必须指定一个FormId做为Bpl包导出时的唯一身份标识
//
//       注：(Ctrl+Shift+G 组合键生成GUID) {} {合计38位长度 }
//       '{00000000-0000-0000-0000-000000000000}'  {表示基窗体 }
//       '{11111111-1111-1111-1111-111111111111}'  {表示查询窗体}
//    3、开发商信息发布
//       LegalCompanyName : String;     //公司名称   W
//       FileDescription  : String;     //文件描述   RW
//       FileVersion      : String;     //文件版本   RW
//       LegalCopyright   : String;     //合法版权描述 RW
//      4、TO-DO
//         多语言功能：
//         从Login界面根据用户选择的语言编号，传递到DMEasyConnection公共属性
//         EasyLangID中，由各界面在Create时动态从Lang配置文件INI下读取Caption
//      5、初始化配置ClientDataSet、Provider等属性，两层下将Provider动态创建
//-----------------------------------------------------------------------------}
unit untEasyPlateBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShlObj, IniFiles, DB, DBClient, TypInfo,
  Provider, ExtCtrls, untEasyGroupBox, untEasyWaterImage;

type
  TfrmEasyPlateBaseForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFormId      : String;
    FLangID      : string;           //语言类别
    FEasyAppPath : string;           //应用程序运行路径
    FEasyPlugPath: string;           //插件存放路径
    FEasyImagePath: string;          //系统所使用的图片存放路径
    FIsKeyPreView: Boolean;
    FEasyRootGUID    : string;           //根节点和根窗体的GUID
    FLegalCompanyName : String;     //公司名称
    FFileDescription  : String;     //文件描述
    FFileVersion      : String;     //文件版本
    FLegalCopyright   : String;     //合法版权描述
    procedure SetFormId(const Value: string);
    procedure SetIsKeyPreView(const Value: Boolean);
    procedure SetFileDescription(const Value: string);
    function GetFormId: string;
    function GetKeyPreView: Boolean;
    function GetFileDescription: string;
    function GetFileVersion: string;
    function GetLegalCopyright: string;
    procedure SetFileVersion(const Value: string);
    procedure SetLegalCopyright(const Value: string);
    function GetLangID: string;
    procedure SetLangID(const Value: string);
    //设置控件的显示属性
    procedure SetControlCaption(ALangINIFile: TStrings);
  protected
    procedure DoShow; override;
    procedure DoClose(var Action: TCloseAction); override;
    procedure KeyPress(var Key: Char); override;
    procedure CreateParams(var Params:TCreateParams);override;
    //改变界面语言
    procedure ChangeLang(LanguageId: string); virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property FormId: string read GetFormId write SetFormId;
    property IsKeyPreView: Boolean read GetKeyPreView write SetIsKeyPreView;
    //系统提示信息
    function EasyErrorHint(AHint: string): Integer; virtual;
    function EasyConfirmHint(AHint: string): Integer; virtual;
    function EasyWarningHint(AHint: string): Integer; virtual;
    function EasyHint(AHint: string): Integer; virtual;
    function EasySelectHint(AHint: string): Integer; virtual;
    //获取用户指定模块指定操作的权限
    function GetUserRight: Boolean; virtual;
    //语言代码
    property LangID: string read GetLangID write SetLangID;
    //以下为公司版权信息
    property LegalCompanyName: string read FLegalCompanyName write FLegalCompanyName;
    property FileDescription: string read GetFileDescription write SetFileDescription;
    property FileVersion: string read GetFileVersion write SetFileVersion;
    property LegalCopyright: string read GetLegalCopyright write SetLegalCopyright;
    //系统路径属性
    property EasyApplicationPath: string read FEasyAppPath write FEasyAppPath;
    property EasyPlugPath: string read FEasyPlugPath write FEasyPlugPath;
    property EasyRootGUID: string read FEasyRootGUID write FEasyRootGUID;
    property EasyImagePath: string read FEasyImagePath write FEasyImagePath;
  end;

var
  frmEasyPlateBaseForm: TfrmEasyPlateBaseForm;

implementation

{$R *.dfm}

uses untEasyDBConnection;

{ TfrmEasyBaseFormExt }

function TfrmEasyPlateBaseForm.GetFormId: string;
begin
  Result := FFormId;
end;

function TfrmEasyPlateBaseForm.GetKeyPreView: Boolean;
begin
  Result := FIsKeyPreView;
end;

procedure TfrmEasyPlateBaseForm.SetFormId(const Value: string);
begin
  FFormId := Value;
end;

procedure TfrmEasyPlateBaseForm.SetIsKeyPreView(const Value: Boolean);
begin
  FIsKeyPreView := Value;
  if FIsKeyPreView then
    KeyPreview := FIsKeyPreView;
end;      

procedure TfrmEasyPlateBaseForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
//  if BorderStyle = bsNone then
//    Params.Style := Params.Style Xor WS_CAPTION ;
//  if BorderStyle <> bsNone then
//    Params.Style := WS_THICKFRAME or WS_POPUP or WS_BORDER;
end;

procedure TfrmEasyPlateBaseForm.DoClose(var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
end;

procedure TfrmEasyPlateBaseForm.DoShow;
begin
  inherited;

end;

procedure TfrmEasyPlateBaseForm.KeyPress(var Key: Char);
begin
  if ActiveControl <> nil then
  begin
    if (Key = #13) and KeyPreview then
    begin
      //如果控件Tag值被30求余5、不移动焦点到下一个控件
      if (ActiveControl.Tag mod 30)=5 then
        Exit;

      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
  end;
  inherited KeyPress(Key);
end;

function TfrmEasyPlateBaseForm.GetFileDescription: string;
begin
  Result := FFileDescription;
end;

procedure TfrmEasyPlateBaseForm.SetFileDescription(const Value: string);
begin
  FFileDescription := Value;
end;

constructor TfrmEasyPlateBaseForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsKeyPreView := True;
  FFormId := '{00000000-0000-0000-0000-000000000000}';
  FLegalCompanyName := '一轩软件研发有限公司';
end;

function TfrmEasyPlateBaseForm.GetFileVersion: string;
begin
  Result := FileVersion;
end;

function TfrmEasyPlateBaseForm.GetLegalCopyright: string;
begin
  Result := LegalCopyright;
end;

procedure TfrmEasyPlateBaseForm.SetFileVersion(const Value: string);
begin
  FFileVersion := Value;
end;

procedure TfrmEasyPlateBaseForm.SetLegalCopyright(const Value: string);
begin
  FLegalCopyright := Value;
end;

procedure TfrmEasyPlateBaseForm.FormCreate(Sender: TObject);
var
  I       : Integer;
  cdsName,
  dspName : String;
  ATmpDsp : TDataSetProvider;
begin
  FEasyAppPath := ExtractFilePath(Application.ExeName);
  FEasyPlugPath := FEasyAppPath + 'plugins\';
  FEasyImagePath := FEasyAppPath + 'images\';
  FEasyRootGUID := '{00000000-0000-0000-0000-000000000000}';
  for i := 0 to ComponentCount - 1 do
  begin
    //创建ClientDataSet的相关设置
    //EasyAppType当前程序运行模式：CS两层 CAS三层
    if DMEasyDBConnection.EasyAppType = 'CS' then
    begin
      if (Components[I] is TClientDataSet) then
      begin
        cdsName := TClientDataSet(Components[I]).Name;
        dspName := TClientDataSet(Components[I]).ProviderName;
        //如果TWaxDataSetProvider不存在才自动创建
        if FindComponent(dspName) = nil then
        begin
          if Trim(dspName) = '' then
            dspName := 'EasyDSP' + cdsName;
          ATmpDsp := TDataSetProvider.Create(Self);
          ATmpDsp.Name := dspName;
          ATmpDsp.DataSet := DMEasyDBConnection.EasyQry;
          ATmpDsp.Options := ATmpDsp.Options + [poAllowCommandText];
        end;

        (Components[I] as TClientDataSet).ProviderName := ATmpDsp.Name;
      end;
//    end
//    else if DMEasyDBConnection.EasyAppType = 'CAS' then
//    begin
//      if Components[I] is TClientDataSet then     
//      begin
//        with Components[I] as TClientDataSet do
//        begin
//          RemoteServer := DMEasyDBConnection.EasyScktConn;
//          ProviderName := 'EasyRDMDsp';
//        end;
//      end;
    end;                                               
  end;
end;

procedure TfrmEasyPlateBaseForm.ChangeLang(LanguageId: string);
var
  TmpCaptionList: TStrings;
  LangINIPath   : string;
begin
  LangINIPath := EasyApplicationPath + 'lang\' + LanguageId + '\' + FormId + '.ini';
  TmpCaptionList := TStringList.Create;
  if FileExists(LangINIPath) then
  begin
    TmpCaptionList.LoadFromFile(LangINIPath);
    SetControlCaption(TmpCaptionList);
  end;  
  TmpCaptionList.Free;
end;

function TfrmEasyPlateBaseForm.GetLangID: string;
var
  ATmpList: TStrings;
begin
  ATmpList := TStringList.Create;
  if FileExists(EasyApplicationPath + 'lang\lang.ini') then
  begin
    ATmpList.LoadFromFile(EasyApplicationPath + 'lang\lang.ini');
    if ATmpList.IndexOfName('lang') <> -1 then
      Result := ATmpList.Values['lang']
    else
      Result := 'Chinese';
  end
  else
    Result := 'Chinese';
  ATmpList.Free;
end;

procedure TfrmEasyPlateBaseForm.SetLangID(const Value: string);
begin
  FLangID := Value;
end;

procedure TfrmEasyPlateBaseForm.SetControlCaption(ALangINIFile: TStrings);
var
  I: Integer;
begin
  if ALangINIFile.IndexOfName(Self.Name) <> -1 then
    Self.Caption := ALangINIFile.Values[Self.Name];
  for I := 0 to ComponentCount - 1 do
  begin
    if GetPropInfo(Components[I], 'Caption') <> nil then
    begin
      if ALangINIFile.IndexOfName(Components[I].Name) <> -1 then
        SetPropValue(Components[I], 'Caption', ALangINIFile.Values[Components[I].Name]);
    end
    else
    if GetPropInfo(Components[I], 'Text') <> nil then
    begin
      if ALangINIFile.IndexOfName(Components[I].Name) <> -1 then
        SetPropValue(Components[I], 'Text', ALangINIFile.Values[Components[I].Name]);
    end;
  end;
end;

function TfrmEasyPlateBaseForm.EasyConfirmHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title),
                                    MB_OKCANCEL + MB_ICONQUESTION);
end;

function TfrmEasyPlateBaseForm.EasyErrorHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title), MB_OK + 
    MB_ICONSTOP);
end;

function TfrmEasyPlateBaseForm.EasyHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title), MB_OK + 
    MB_ICONINFORMATION);
end;

function TfrmEasyPlateBaseForm.EasySelectHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title),
    MB_YESNOCANCEL + MB_ICONQUESTION); 
end;

function TfrmEasyPlateBaseForm.EasyWarningHint(AHint: string): Integer;
begin
  Result := Application.MessageBox(PChar(AHint), PChar(Application.Title), MB_OK + 
    MB_ICONWARNING);
end;

function TfrmEasyPlateBaseForm.GetUserRight: Boolean;
begin
  Result := True;
end;

procedure TfrmEasyPlateBaseForm.FormShow(Sender: TObject);
begin
  //改变语言设置
  ChangeLang(LangID);
end;

end.
