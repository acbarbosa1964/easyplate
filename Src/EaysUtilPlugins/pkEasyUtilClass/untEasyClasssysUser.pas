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
//                                                                              
//主要实现：                                                                    
//-----------------------------------------------------------------------------}
unit untEasyClasssysUser;

interface

uses
  Classes, DB, DBClient, Variants;

type

  TEasysysUser = class
  private
  { Private declarations } 
    FUserGUID: string;
    FUserName: string;
    FPassWord: string;
    FEmployeeGUID: string;
    FIsEnable: Boolean;
    FEndDate: TDateTime;
    FRoleGUID: string;
    FCreateTime: TDateTime;
    FCreaterGUID: string;
  public
  { Public declarations } 
    property UserGUID: string read FUserGUID write FUserGUID;
    property UserName: string read FUserName write FUserName;
    property PassWord: string read FPassWord write FPassWord;
    property EmployeeGUID: string read FEmployeeGUID write FEmployeeGUID;
    property IsEnable: Boolean read FIsEnable write FIsEnable;
    property EndDate: TDateTime read FEndDate write FEndDate;
    property RoleGUID: string read FRoleGUID write FRoleGUID;
    property CreateTime: TDateTime read FCreateTime write FCreateTime;
    property CreaterGUID: string read FCreaterGUID write FCreaterGUID;


    class procedure GeneratesysUser(var Data: OleVariant; AResult: TList);
    class procedure AppendClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
    class procedure EditClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
    class procedure DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
    class procedure InitSingleSysUser(AClientDataSet: TClientDataSet; AObj: TEasysysUser);
  end;

implementation

{TEasysysUser}
class procedure TEasysysUser.GeneratesysUser(var Data: OleVariant; AResult: TList);
var
  I: Integer;
  AEasysysUser: TEasysysUser;
  AClientDataSet: TClientDataSet;
begin
  //创建数据源，并获取数据
  AClientDataSet := TClientDataSet.Create(nil);
  AClientDataSet.Data := Data;
  AClientDataSet.First;
  try
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      //此句为实例化指定的对象
      AEasysysUser := TEasysysUser.Create;
      with AEasysysUser do
      begin
      //1 UserGUID
        UserGUID := AClientDataSet.FieldByName('UserGUID').AsString;
      //2 UserName
        UserName := AClientDataSet.FieldByName('UserName').AsString;
      //3 PassWord
        PassWord := AClientDataSet.FieldByName('PassWord').AsString;
      //4 EmployeeGUID
        EmployeeGUID := AClientDataSet.FieldByName('EmployeeGUID').AsString;
      //5 IsEnable
        IsEnable := AClientDataSet.FieldByName('IsEnable').AsBoolean;
      //6 EndDate
        EndDate := AClientDataSet.FieldByName('EndDate').AsDateTime;
      //7 RoleGUID
        RoleGUID := AClientDataSet.FieldByName('RoleGUID').AsString;
      //8 CreateTime
        CreateTime := AClientDataSet.FieldByName('CreateTime').AsDateTime;
      //9 CreaterGUID
        CreaterGUID := AClientDataSet.FieldByName('CreaterGUID').AsString;
      end;
      //在此添加将对象存放到指定容器的代码
      AResult.Add(AEasysysUser);
      //如果要关联树也在此添加相应代码
      AClientDataSet.Next;
    end;
  finally
    AClientDataSet.Free;
  end;
end;

class procedure TEasysysUser.AppendClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
begin
  with ACds do
  begin
    Append;
      //1 UserGUID
    FieldByName('UserGUID').AsString := AObj.UserGUID;
      //2 UserName
    FieldByName('UserName').AsString := AObj.UserName;
      //3 PassWord
    FieldByName('PassWord').AsString := AObj.PassWord;
      //4 EmployeeGUID
    FieldByName('EmployeeGUID').AsString := AObj.EmployeeGUID;
      //5 IsEnable
    FieldByName('IsEnable').AsBoolean := AObj.IsEnable;
      //6 EndDate
    FieldByName('EndDate').AsDateTime := AObj.EndDate;
      //7 RoleGUID
    FieldByName('RoleGUID').AsString := AObj.RoleGUID;
      //8 CreateTime
    FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //9 CreaterGUID
    FieldByName('CreaterGUID').AsString := AObj.CreaterGUID;
    post;
  end;
  AObjList.Add(AObj);
end;

class procedure TEasysysUser.EditClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
begin
  if ACds.Locate('UserGUID', VarArrayOf([AObj.UserGUID]), [loCaseInsensitive]) then
  begin
    with ACds do
    begin
      Edit;
      //1 UserGUID
      FieldByName('UserGUID').AsString := AObj.UserGUID;
      //2 UserName
      FieldByName('UserName').AsString := AObj.UserName;
      //3 PassWord
      FieldByName('PassWord').AsString := AObj.PassWord;
      //4 EmployeeGUID
      FieldByName('EmployeeGUID').AsString := AObj.EmployeeGUID;
      //5 IsEnable
      FieldByName('IsEnable').AsBoolean := AObj.IsEnable;
      //6 EndDate
      FieldByName('EndDate').AsDateTime := AObj.EndDate;
      //7 RoleGUID
      FieldByName('RoleGUID').AsString := AObj.RoleGUID;
      //8 CreateTime
      FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //9 CreaterGUID
      FieldByName('CreaterGUID').AsString := AObj.CreaterGUID;
      post;
    end;
  end;
end;

class procedure TEasysysUser.DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasysysUser; var AObjList: TList);
var
  I,
  DelIndex: Integer;
begin
  DelIndex := -1;
  if ACds.Locate('UserGUID', VarArrayOf([AObj.UserGUID]), [loCaseInsensitive]) then
    ACds.Delete;
  for I := 0 to AObjList.Count - 1 do
  begin
    if TEasysysUser(AObjList[I]).UserGUID = TEasysysUser(AObj).UserGUID then
    begin
      DelIndex := I;
      Break;
    end;
  end;
  if DelIndex <> -1 then
  begin
    TEasysysUser(AObjList[DelIndex]).Free;
    AObjList.Delete(DelIndex);
  end; 
end;

class procedure TEasysysUser.InitSingleSysUser(AClientDataSet: TClientDataSet;
  AObj: TEasysysUser);
begin
  with AObj do
  begin
  //1 UserGUID
    UserGUID := AClientDataSet.FieldByName('UserGUID').AsString;
  //2 UserName
    UserName := AClientDataSet.FieldByName('UserName').AsString;
  //3 PassWord
    PassWord := AClientDataSet.FieldByName('PassWord').AsString;
  //4 EmployeeGUID
    EmployeeGUID := AClientDataSet.FieldByName('EmployeeGUID').AsString;
  //5 IsEnable
    IsEnable := AClientDataSet.FieldByName('IsEnable').AsBoolean;
  //6 EndDate
    EndDate := AClientDataSet.FieldByName('EndDate').AsDateTime;
  //7 RoleGUID
    RoleGUID := AClientDataSet.FieldByName('RoleGUID').AsString;
  //8 CreateTime
    CreateTime := AClientDataSet.FieldByName('CreateTime').AsDateTime;
  //9 CreaterGUID
    CreaterGUID := AClientDataSet.FieldByName('CreaterGUID').AsString;
  end;
end;

end.
