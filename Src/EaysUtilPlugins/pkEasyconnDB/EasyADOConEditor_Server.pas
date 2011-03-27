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

unit EasyADOConEditor_Server;

{$R-}

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, DB, ADODB, ExtCtrls, Mask, DBClient,
  MConnect, SConnect;

  //插件导出函数
  function ShowBplForm(var AParamList: TStrings): TForm; stdcall; exports ShowBplForm;
  
type
  TStep = (spDefault, spConnSet, spMidasSet);
  
  TfrmEasyADOConEditor = class(TForm)
    btnNext: TButton;
    nbkMain: TNotebook;
    GroupBox1: TGroupBox;
    csStyle: TRadioButton;
    midasStyle: TRadioButton;
    SourceofConnection: TGroupBox;
    UseDataLinkFile: TRadioButton;
    DataLinkFile: TComboBox;
    Browse: TButton;
    UseConnectionString: TRadioButton;
    ConnectionString: TEdit;
    Build: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtGUID: TEdit;
    Label4: TLabel;
    edtServerName: TEdit;
    btnPrev: TButton;
    Label5: TLabel;
    edtIP: TEdit;
    edtPort: TEdit;
    ADOTest: TADOConnection;
    scktTest: TSocketConnection;
    procedure FormCreate(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure BuildClick(Sender: TObject);
    procedure BrowseClick(Sender: TObject);
    procedure SourceButtonClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure edtPortExit(Sender: TObject);
    procedure edtIPKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortKeyPress(Sender: TObject; var Key: Char);
  private
    FStep: TStep;

    FAppType,
    FHost,
    FPort,
    FGUID,
    FServerName,
    FConnectString: string;
    function GetDBStep: TStep;
    procedure SetDBStep(const Value: TStep);
    procedure ChangeNBK(ADBStep: TStep);
    procedure LoadConnectString;
  public
    function Edit(ConnStr: WideString): WideString;
    property DBStep: TStep read GetDBStep write SetDBStep;
  end;

function EditConnectionString(Component: TComponent): Boolean;
var
  frmEasyADOConEditor: TfrmEasyADOConEditor;
  
implementation

{$R *.dfm}

uses
  TypInfo, OleDB, ADOInt, ActiveX, ComObj, untEasyUtilMethod, untEasyUtilConst,
  ZLib, ZLibConst;

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

  FStep := spDefault;
  ChangeNBK(DBStep);

  csStyle.Checked := True;
  nbkMain.PageIndex := 1;
  
  LoadConnectString;
  
  DBStep := spConnSet;
  ConnectionString.Text := FConnectString;
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

function TfrmEasyADOConEditor.GetDBStep: TStep;
begin
  Result := FStep;
end;

procedure TfrmEasyADOConEditor.SetDBStep(const Value: TStep);
begin
  if FStep <> Value then
  begin
    FStep := Value;
    ChangeNBK(Value);
  end;
end;

procedure TfrmEasyADOConEditor.ChangeNBK(ADBStep: TStep);
begin
  case ADBStep of
    spDefault:
      begin
        nbkMain.PageIndex := 0;
        btnNext.Caption := '下一步';
        btnPrev.Visible := False;
      end;
    spConnSet:
      begin
        nbkMain.PageIndex := 1;
        btnNext.Caption := '确定';
        btnPrev.Caption := '上一步';
        btnPrev.Visible := False;
      end;
    spMidasSet:
      begin
        nbkMain.PageIndex := 2;
        btnNext.Caption := '确定';
        btnPrev.Caption := '上一步';
        btnPrev.Visible := False;
      end;
  end;
end;

procedure TfrmEasyADOConEditor.btnNextClick(Sender: TObject);
var
  AList: TStrings;
  ATmpMMStream: TMemoryStream;
  AFile: string;
begin
  case DBStep of
    spDefault:
      begin
        if csStyle.Checked then
        begin
          DBStep := spConnSet;

          ConnectionString.Text := FConnectString;
        end else
        if midasStyle.Checked then
        begin
          DBStep := spMidasSet;

          edtIP.Text := FHost;
          edtPort.Text := FPort;
          edtGUID.Text := FGUID;
          edtServerName.Text := FServerName;
        end;
      end;
    spConnSet, spMidasSet:
      begin
        AList := TStringList.Create;
        ATmpMMStream := TMemoryStream.Create;
        //二层CS 三层CAS
        if csStyle.Checked then
        begin
          if Trim(ConnectionString.Text) = '' then
            Exit;

          AList.Add('APPTYPE=CS');
          AList.Add('CONNECTSTRING=' + ConnectionString.Text);
        end else
        if midasStyle.Checked then
        begin
          if (Trim(edtIP.Text) = '') or (Trim(edtPort.Text) = '')
            or (Trim(edtServerName.Text) = '') then Exit;
          AList.Add('APPTYPE=CAS');
          AList.Add('HOST=' + edtIP.Text);
          AList.Add('PORT=' + edtPort.Text);
          AList.Add('IGUID=' + edtGUID.Text);
          AList.Add('SNAME=' + edtServerName.Text);
        end;
        try
          if csStyle.Checked then
          begin
            ADOTest.LoginPrompt := False;
            ADOTest.ConnectionString := ConnectionString.Text;
            try
              ADOTest.Connected := True;
            except on e:Exception do
              Application.MessageBox(PChar(e.Message), EASY_SYS_HINT,
                MB_OK + MB_ICONINFORMATION);
            end;
          end else
          if midasStyle.Checked then
          begin
            with scktTest do
            begin
              Host := edtIP.Text;
              Port := StrToInt(edtPort.Text);
              InterceptGUID := edtGUID.Text;
              ServerName := edtServerName.Text;
            end;
            try
              scktTest.Connected;
            except on e:Exception do
              Application.MessageBox(PChar(e.Message), EASY_SYS_HINT,
                MB_OK + MB_ICONINFORMATION);
            end;
          end;
          AFile := ExtractFilePath(Application.ExeName) + 'ConnectString.dll';
          AList.SaveToFile(AFile);
          CompressFile_Easy(AFile, ATmpMMStream, clMax);
          ATmpMMStream.SaveToFile(AFile);
          Application.MessageBox(EASY_DBCONNECT_SUCCESS, EASY_SYS_HINT,
            MB_OK + MB_ICONINFORMATION);
        finally
          AList.Free;
          ATmpMMStream.Free;
        end;
        Close;
      end;
  end;
end;

procedure TfrmEasyADOConEditor.btnPrevClick(Sender: TObject);
begin
  case DBStep of
    spConnSet, spMidasSet:
      begin
        DBStep := spDefault;
      end;
  end;
end;

procedure TfrmEasyADOConEditor.LoadConnectString;
var
  AList: TStrings;
  ATmpMMStream,
  ADestMMStream: TMemoryStream;
  AFile: string;
begin
  AFile := ExtractFilePath(Application.ExeName) + 'ConnectString.dll';
  AList := TStringList.Create;
  if FileExists(AFile) then
  begin
    ATmpMMStream := TMemoryStream.Create;
    ADestMMStream := TMemoryStream.Create;
    try
      ATmpMMStream.LoadFromFile(AFile);
      DeCompressFile_Easy(ATmpMMStream, ADestMMStream, AFile);
      AList.LoadFromStream(ADestMMStream);
      FAppType := AList.Values['APPTYPE'];
      FHost := AList.Values['HOST'];
      FPort := AList.Values['PORT'];
      FGUID := AList.Values['IGUID'];
      FServerName := AList.Values['SNAME'];
      FConnectString := AList.Values['CONNECTSTRING'];
    finally
      ATmpMMStream.Free;
      ADestMMStream.Free;
    end;
  end;
  AList.Free;
  if FAppType = 'CAS' then
    midasStyle.Checked := True
  else
    csStyle.Checked := True;
end;

procedure TfrmEasyADOConEditor.edtPortExit(Sender: TObject);
var
  APort: Integer;
begin
  if TryStrToInt(edtPort.Text, APort) then
  begin
    if (APort > 65535) or (APort < 211) then
      edtPort.Text := '211';
  end;  
end;

procedure TfrmEasyADOConEditor.edtIPKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', '.']) then
    Key := #0;
end;

procedure TfrmEasyADOConEditor.edtPortKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0;
end;

initialization
  CoInitialize(nil);

finalization
  CoUninitialize;
  
end.
