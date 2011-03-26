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
  主要实现：
      设置数据库连接ADO方式，返回连接字符串                             
//------------------------------------------------------------------------------}
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{ Copyright (c) 1999-2001 Borland Software Corporation  }
{                                                       }
{*******************************************************}

unit EasyADOConEditor;

{$R-}

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, DB, ADODB;

  //插件导出函数
  function ShowBplForm(var AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
  
type
  TfrmEasyADOConEditor = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    SourceofConnection: TGroupBox;
    UseDataLinkFile: TRadioButton;
    UseConnectionString: TRadioButton;
    DataLinkFile: TComboBox;
    Browse: TButton;
    ConnectionString: TEdit;
    Build: TButton;
    procedure FormCreate(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure BuildClick(Sender: TObject);
    procedure BrowseClick(Sender: TObject);
    procedure SourceButtonClick(Sender: TObject);
  public
    function Edit(ConnStr: WideString): WideString;
  end;

function EditConnectionString(Component: TComponent): Boolean;
var
  frmEasyADOConEditor: TfrmEasyADOConEditor;
  
implementation

{$R *.dfm}

uses TypInfo, OleDB, ADOInt, ActiveX, ComObj, untEasyUtilMethod, untEasyUtilConst;

const
  SConnectionString = 'ConnectionString';     { Do not localize }
  
resourcestring
  SEditConnectionStringTitle = '%s%s%s %s';

//引出函数实现
function ShowBplForm(var AParamList: TStrings): TForm;
begin
  Result := nil;
  frmEasyADOConEditor := TfrmEasyADOConEditor.Create(Application);
  frmEasyADOConEditor.ShowModal;
  frmEasyADOConEditor.Free;
end;
  
function EditConnectionString(Component: TComponent): Boolean;
var
  PropInfo: PPropInfo;
  NewConnStr,
  InitialConnStr: WideString;
begin
  Result := False;
  with TfrmEasyADOConEditor.Create(Application) do
  try
    Caption := Format(SEditConnectionStringTitle, [Component.Owner.Name, DotSep,
    Component.Name, SConnectionString]);
    PropInfo := GetPropInfo(Component.ClassInfo, SConnectionString);
    InitialConnStr := GetStrProp(Component, PropInfo);
    NewConnStr := Edit(InitialConnStr);
    if NewConnStr <> InitialConnStr then
    begin
      SetStrProp(Component, PropInfo, NewConnStr);
      Result := True;
    end;
  finally
    Free;
  end;
end;

{ TConnEditForm }

function TfrmEasyADOConEditor.Edit(ConnStr: WideString): WideString;
var
  FileName: string;
begin
  Result := ConnStr;
  UseDataLinkFile.Checked := True;
  if Pos(CT_FILENAME, ConnStr) = 1 then
  begin
    FileName := Copy(ConnStr, Length(CT_FILENAME)+1, MAX_PATH);
    if ExtractFilePath(FileName) = (DataLinkDir + '\') then
      DataLinkFile.Text := ExtractFileName(FileName) else
      DataLinkFile.Text := FileName;
  end else
  begin
    ConnectionString.Text := ConnStr;
    UseConnectionString.Checked := True;
  end;
  SourceButtonClick(nil);
  if ShowModal = mrOk then
    if UseConnectionString.Checked then
      Result := ConnectionString.Text
    else if DataLinkFile.Text <> '' then
    begin
      if ExtractFilePath(DataLinkFile.Text) = '' then
        Result := CT_FILENAME + DataLinkDir + '\' +DataLinkFile.Text else
        Result := CT_FILENAME + DataLinkFile.Text
    end
    else
      Result := '';
end;

{ Event Handlers }

procedure TfrmEasyADOConEditor.FormCreate(Sender: TObject);
begin
  HelpContext := 27270; //hcDADOConnEdit;
  GetDataLinkFiles(DataLinkFile.Items);
end;

procedure TfrmEasyADOConEditor.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TfrmEasyADOConEditor.BrowseClick(Sender: TObject);
begin
  DataLinkFile.Text := PromptDataLinkFile(Handle, DataLinkFile.Text);
end;

procedure TfrmEasyADOConEditor.BuildClick(Sender: TObject);
begin
  ConnectionString.Text := PromptDataSource(Handle, ConnectionString.Text);
end;

procedure TfrmEasyADOConEditor.SourceButtonClick(Sender: TObject);
const
  EnabledColor: array[Boolean] of TColor = (clBtnFace, clWindow);
begin
  DataLinkFile.Enabled := UseDataLinkFile.Checked;
  DataLinkFile.Color := EnabledColor[DataLinkFile.Enabled];
  Browse.Enabled := DataLinkFile.Enabled;
  ConnectionString.Enabled := UseConnectionString.Checked;
  ConnectionString.Color := EnabledColor[ConnectionString.Enabled];
  Build.Enabled := ConnectionString.Enabled;
  if DataLinkFile.Enabled then
    ActiveControl := DataLinkFile else
    ActiveControl := ConnectionString;
end;

end.
