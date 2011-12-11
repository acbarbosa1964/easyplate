//当前登录用户GUID
function EasyGetUserGUID;
begin          
    Result := EasyGetUserGUID_at;
end;   

//当前登录用户名
function EasyGetUserName;
begin          
    Result := EasyGetUserName_at;
end;
                                                       
//生成GUID
function EasyGenerateGUID;
begin
    Result := EasyGenerateGUID_at;
end;                                                             

function EasyGenerateTrue;
begin
  Result := EasyGenerateTrue_at;
end;

function EasyGenerateFalse;
begin
  Result := EasyGenerateFalse_at;
end;

function EasyGetServerTime;
begin                                               
    Result := EasyGetServerTime_at;
end;

function EasyGenerateInt(Value);
begin
    Result := EasyGenerateInt_at(Value);
end;

function EasyGenerateFloat(Value);
begin
    Result := EasyGenerateFloat_at(Value);
end;
                                          
function EasyGenerateString(Value);
begin
    Result := EasyGenerateString_at(Value);
end;                      

//加载包
function EasyLoadPackage(Value);
begin
    Result := EasyLoadPackage_at(Value);
end;     
