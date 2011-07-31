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
//    系统常量表
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyClassSysConst;

interface

uses
  Classes, DB, DBClient, Variants;

type
  TEasySysConst = class
  private
  { Private declarations } 
    FConstGUID: string;
    FCName: string;
    FEName: string;
    FValue: string;
    FCreateTime: TDateTime;
    FCreater: string;
    FUpdater: string;
    FUpdateTime: TDateTime;
  public
  { Public declarations } 
    property ConstGUID: string read FConstGUID write FConstGUID;
    property CName: string read FCName write FCName;
    property EName: string read FEName write FEName;
    property Value: string read FValue write FValue;
    property CreateTime: TDateTime read FCreateTime write FCreateTime;
    property Creater: string read FCreater write FCreater;
    property Updater: string read FUpdater write FUpdater;
    property UpdateTime: TDateTime read FUpdateTime write FUpdateTime;
    
    class procedure AppendClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
    class procedure EditClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
    class procedure DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
  end;
  
implementation

class procedure TEasySysConst.AppendClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
begin
  with ACds do
  begin
    Append;
      //1 ConstGUID
    FieldByName('ConstGUID').AsString := AObj.ConstGUID;
      //2 CName
    FieldByName('CName').AsString := AObj.CName;
      //3 EName
    FieldByName('EName').AsString := AObj.EName;
      //4 Value
    FieldByName('Value').AsString := AObj.Value;
      //5 CreateTime
    FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //6 Creater
    FieldByName('Creater').AsString := AObj.Creater;
      //7 Updater
    FieldByName('Updater').AsString := AObj.Updater;
      //8 UpdateTime
    FieldByName('UpdateTime').AsDateTime := AObj.UpdateTime;
    post;
  end;
  AObjList.Add(AObj);
end;

class procedure TEasySysConst.EditClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
begin
  if ACds.Locate('ConstGUID', VarArrayOf([AObj.ConstGUID]), [loCaseInsensitive]) then
  begin
    with ACds do
    begin
      Edit;
      //1 ConstGUID
      FieldByName('ConstGUID').AsString := AObj.ConstGUID;
      //2 CName
      FieldByName('CName').AsString := AObj.CName;
      //3 EName
      FieldByName('EName').AsString := AObj.EName;
      //4 Value
      FieldByName('Value').AsString := AObj.Value;
      //5 CreateTime
      FieldByName('CreateTime').AsDateTime := AObj.CreateTime;
      //6 Creater
      FieldByName('Creater').AsString := AObj.Creater;
      //7 Updater
      FieldByName('Updater').AsString := AObj.Updater;
      //8 UpdateTime
      FieldByName('UpdateTime').AsDateTime := AObj.UpdateTime;
      post;
    end;
  end;
end;

class procedure TEasySysConst.DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasySysConst; var AObjList: TList);
var
  I,
  DelIndex: Integer;
begin
  DelIndex := -1;
  if ACds.Locate('ConstGUID', VarArrayOf([AObj.ConstGUID]), [loCaseInsensitive]) then
    ACds.Delete;
  for I := 0 to AObjList.Count - 1 do
  begin
    if TEasySysConst(AObjList[I]).ConstGUID = TEasySysConst(AObj).ConstGUID then
    begin
      DelIndex := I;
      Break;
    end;
  end;
  if DelIndex <> -1 then
  begin
    TEasySysConst(AObjList[DelIndex]).Free;
    AObjList.Delete(DelIndex);
  end; 
end; 

end.
