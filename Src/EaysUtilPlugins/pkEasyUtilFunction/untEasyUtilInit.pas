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
unit untEasyUtilInit;

interface

uses
  SysUtils, Classes, Windows, DB, DBClient;

type
  TLoadPkg = function (var AParamList: TStrings): Boolean; stdcall;
  
  //加载指定包
  function LoadPkg(APkgName, AFunctionName: string; var AParamList: TStrings): Integer;

  //根据编号获取可执行查询的SQL语句
  function GetSysSQL(ASQLEName: string): string;

implementation

var
  tmpLoadPkg: TLoadPkg;

  //加载指定包
  function LoadPkg(APkgName, AFunctionName: string; var AParamList: TStrings): Integer;
  begin
//    Result := -1;
    try
      if not FileExists(APkgName) then
        Result := -2
      else
      begin
        try
          Result := LoadPackage(APkgName);
        except
          Result := -3;
        end;
        if Result > 0 then
        begin
          tmpLoadPkg := GetProcAddress(Result, PChar(AFunctionName));
          if @tmpLoadPkg <> nil then
            tmpLoadPkg(AParamList);
        end;
      end;
    except
      Result := -4;
    end;
  end;

  //根据编号获取可执行查询的SQL语句
  function GetSysSQL(ASQLEName: string): string;
  var
    TmpClientDataSet: TClientDataSet;
  begin
    Result := '';
    TmpClientDataSet := TClientDataSet.Create(nil);
    try
//      TmpClientDataSet.
      with TmpClientDataSet do
      begin
        CommandText := 'SELECT sSQL FROM sysSQL WHERE iFlag = 1 AND sSQLEName = '
                       + QuotedStr(ASQLEName);
        Open;
        if TmpClientDataSet.RecordCount > 0 then
          Result := fieldbyname('sSQL').AsString;
      end;
    finally
      TmpClientDataSet.Free;
    end;
  end;
end.
