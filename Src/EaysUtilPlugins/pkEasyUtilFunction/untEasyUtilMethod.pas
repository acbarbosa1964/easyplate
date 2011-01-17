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
//    EasyPlate程序的公共方法单元
//主要实现：
//-----------------------------------------------------------------------------}
unit untEasyUtilMethod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, ActiveX, FileCtrl, UrlMon, TlHelp32, ExtCtrls,
  ComObj, WinSock, ComCtrls, DB, ADODB, IdGlobal, ImageHlp, untEasyTabSet,
  Menus, DBClient, untEasyProgressBar;

type

  //数据打开类方式
  TOpenClientDataSetStyle = (ocdOpen, ocdExecute);
   
  //关闭子窗体事件类
  TMDICloseNotify = procedure (Sender: TObject; var Action: TCloseAction) of object;
  //插件导出函数
  TShowBplForm = function (AParamList: TStrings): TForm; stdcall;

  TSearchType = (stCurrent, stSub, stAll);
  
  TCPUID = array[1..4] of Longint;
  TVendor = array [0..11] of char;
  
  TInformationStrings = ( isCompanyName,  isFileDescription, isFileVersion,
                          isInternalName, isLegalCopyright,  isOriginalFilename,
                          isProductName,  isProductVersion,  isComments,
                          isLegalTrademarks );

  TFileTimeComparision = ( ftError, ftFileOneIsOlder, ftFileTimesAreEqual, ftFileTwoIsOlder );


  TDriveType = (dtUnknown, dtNoDrive, dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM);

  TVolumeInfo = record
     Name               : String;
     SerialNumber       : DWORD;
     MaxComponentLength : DWORD;
     FileSystemFlags    : DWORD;
     FileSystemName     : String;
  end; // TVolumeInfo
  
  PFixedFileInfo = ^TFixedFileInfo;
  TFixedFileInfo = record
     dwSignature       : DWORD;
     dwStrucVersion    : DWORD;
     wFileVersionMS    : WORD;  // Minor Version
     wFileVersionLS    : WORD;  // Major Version
     wProductVersionMS : WORD;  // Build Number
     wProductVersionLS : WORD;  // Release Version
     dwFileFlagsMask   : DWORD;
     dwFileFlags       : DWORD;
     dwFileOS          : DWORD;
     dwFileType        : DWORD;
     dwFileSubtype     : DWORD;
     dwFileDateMS      : DWORD;
     dwFileDateLS      : DWORD;
  end; // TFixedFileInfo

  TSrbIoControl = packed record 
    HeaderLength : ULONG;
    Signature : Array[0..7] of Char;
    Timeout : ULONG;
    ControlCode : ULONG;
    ReturnCode : ULONG;
    Length : ULONG;
  end;
  SRB_IO_CONTROL = TSrbIoControl;
  PSrbIoControl = ^TSrbIoControl; 

  TIDERegs = packed record
    bFeaturesReg : Byte; // Used for specifying SMART "commands".
    bSectorCountReg : Byte; // IDE sector count register
    bSectorNumberReg : Byte; // IDE sector number register
    bCylLowReg : Byte; // IDE low order cylinder value
    bCylHighReg : Byte; // IDE high order cylinder value
    bDriveHeadReg : Byte; // IDE drive/head register
    bCommandReg : Byte; // Actual IDE command.
    bReserved : Byte; // reserved. Must be zero.
  end;
    IDEREGS = TIDERegs;
    PIDERegs = ^TIDERegs;
    
  TSendCmdInParams = packed record
    cBufferSize : DWORD;
    irDriveRegs : TIDERegs;
    bDriveNumber : Byte;
    bReserved : Array[0..2] of Byte;
    dwReserved : Array[0..3] of DWORD;
    bBuffer : Array[0..0] of Byte;
  end;
  SENDCMDINPARAMS = TSendCmdInParams;
  PSendCmdInParams = ^TSendCmdInParams;

  TIdSector = packed record
    wGenConfig : Word;
    wNumCyls : Word;
    wReserved : Word;
    wNumHeads : Word;
    wBytesPerTrack : Word;
    wBytesPerSector : Word;
    wSectorsPerTrack : Word;
    wVendorUnique : Array[0..2] of Word;
    sSerialNumber : Array[0..19] of Char;
    wBufferType : Word;
    wBufferSize : Word;
    wECCSize : Word;
    sFirmwareRev : Array[0..7] of Char;
    sModelNumber : Array[0..39] of Char;
    wMoreVendorUnique : Word;
    wDoubleWordIO : Word;
    wCapabilities : Word;
    wReserved1 : Word;
    wPIOTiming : Word;
    wDMATiming : Word;
    wBS : Word;
    wNumCurrentCyls : Word;
    wNumCurrentHeads : Word;
    wNumCurrentSectorsPerTrack : Word;
    ulCurrentSectorCapacity : ULONG;
    wMultSectorStuff : Word;
    ulTotalAddressableSectors : ULONG;
    wSingleWordDMA : Word;
    wMultiWordDMA : Word;
    bReserved : Array[0..127] of Byte;
  end;
    PIdSector = ^TIdSector; 

const
  NumberArray: array[0..9] of string =
    ('零', '壹','貳','叁','肆','伍','陆','柒','捌','玖');
  //加密解密
  C1 = 888888;
  C2 = 999999;
  {* 字符串加密用 }
  XorKey:array[0..7] of Byte=(8,8,8,8,8,8,8,8); //$B2,$09,$AA,$55,$93,$6D,$84,$47
  //CPU
  IDE_ID_FUNCTION = $EC;
  IDENTIFY_BUFFER_SIZE = 512;
  DFP_RECEIVE_DRIVE_DATA = $0007c088;
  IOCTL_SCSI_MINIPORT = $0004d008;
  IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
  DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
  BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
  W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
  
   PROCESSOR_INTEL_386     = 386;
   PROCESSOR_INTEL_486     = 486;
   PROCESSOR_INTEL_PENTIUM = 586;
   PROCESSOR_MIPS_R4000    = 4000;
   PROCESSOR_ALPHA_21064   = 21064;

   //XML
   //从XML文件提取模块信息 ./plugins/plugins-config.xml
  {*********************  数字转换成人民币大写 ************}          //***********  数字转换成人民币大写
  // 数字转与大写
  function NumToRMB_0(AMoney: string): string;
  // 数字转换成RMB 转换不超过千亿
  function NumToRMB(const S:WideString):WideString;
  
  //得到系统当前星期几
  function GetSystemWeek : string;
  
  //查找指定文件夹下的所有文件
  //Flag为0 --查找文件 1--查找文件夹
  procedure SearchFile(path: string; var AList : TStrings; AFileType: string = '*.*'; Flag: Integer = 0);
  //注意,path后面要有'\';
  //获取目录下的文件夹
  procedure GetDirs(dirName: string; List: TStrings; ASerachType: TSearchType = stCurrent);

  //查找窗体
  function FindForm(FormClass: TFormClass): TForm;
  //查找显示窗体
  function FindShowForm(FormClass: TFormClass; const Caption: string): TForm;
  //查找指定CAPTION的窗体
  function InternalFindShowForm(FormClass: TFormClass;const Caption: string; Restore: Boolean): TForm;

  //加载插件
  //AType = 0表示不添加到MDITab
  function LoadPkg(APluginFile: string; ATmpStrings: TStrings; AMDITabSet: TEasyMDITabSet;
                  AEasyProgressBar: TEasyProgressBar;
                  AMDICloseNotify: TMDICloseNotify; AType: Integer = 0): Boolean; overload;
  //ShowModel加载插件
  function LoadPkg(APluginFile: string; ATmpStrings: TStrings): Boolean; overload;

  //获取硬盘序列号
  function GetIdeDiskSerialNumber(i:Integer) : String;
  function GetCPUID : TCPUID; assembler; register;
  function GetCPUVendor : TVendor; assembler; register;
  
  //字符加密  解密
  //s 表示要加密的字符串，KEY是密钥
  function Encrypt(const S: String; Key: Word): String;
  function Decrypt(const S: String; Key: Word): String;
  function EncStr(Str:String):String;//字符加密函數 這是用的一個異或加密
  function DecStr(Str:String):String;//字符解密函數
  
  //创建文件夹
  function CreateDir_H(APath: string): Boolean;
  //写入日志文档内容
  //存成文本文件、以Base64编码
  procedure WriteLog_H(ALogPath: String; AContent: String);

  //生成GUID
  function GenerateGUID: string;

  //2010-11-06 16:19:43 +打开数据集能用方法
  //失败返回 -1 成功返回 1
  function OpenClientDataSet(AClientDataSet: TClientDataSet;
                              AOpenClientDataSetStyle: TOpenClientDataSetStyle = ocdOpen): string;
  //获取用户模块权限
  function getUserModuleRight(FormId, CurrUserID: string): string;

  //获取指定对象是否具有某个属性 引用typinfo
  function FindProperty(AClass: TObject; sPropertyName: String): Boolean;
  //设置指定控件BondLabel的字体颜色
  function SetEditLabelColor(AClass: TObject; AColor: TColor): Boolean;
  //获取指定控件BondLabel的标题
  function GetEditLabelCaption(AClass: TObject): string;

  //获取控件的绑定数据字段
  function GetDBDataBinding(AClass: TObject; var ABondLabelCaption: string): string;
  //获取控件的绑定数据集
  function GetDBDataBindingDataSet(AClass: TObject): TDataSet;

  //设置指定控件所有子控件的BonLabel的字体颜色
  procedure SetEditLabelsColor(AParentControl: TControl;
                              AColor: TColor; var ASetControlList: TList);
implementation

uses untEasyUtilConst, TypInfo, cxDBEdit;

function GenerateGUID: string;
var
  ATmp: TGUID;
begin
  Result := '';
  if CoCreateGuid(ATmp) = S_OK then
    Result := GUIDToString(ATmp);
end;

procedure ChangeByteOrder( var Data; Size : Integer );
var
  ptr : PChar;
  i : Integer;
  c : Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1)-1 do
  begin
    c := ptr^;
    ptr^ := (ptr+1)^;
    (ptr+1)^ := c;
    Inc(ptr,2);
  end;
end;

function GetSystemWeek : string;
begin
  Result := FormatDateTime('ddd',Date);
end;

//字符加密
//s 表示要加密的字符串，KEY是密钥
function Encrypt(const S: String; Key: Word): String;
var
   I: Integer;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
  end;
end;

//字符解密
//s 表示要未解密的字符串，KEY是密钥
function Decrypt(const S: String; Key: Word): String;
var
   I: Integer;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;

function EncStr(Str:String):String;//字符加密函數 這是用的一個異或加密
var
  i,j:Integer;
begin
  Result:='';
  j:=0;
  for i:=1 to Length(Str) do
  begin
    Result:=Result+IntToHex(Byte(Str[i]) xor XorKey[j],2);
    j:=(j+1) mod 8;
  end;
end;

function DecStr(Str:String):String;//字符解密函數
var
  i,j:Integer;
begin
  Result:='';
  j:=0;
  for i:=1 to Length(Str) div 2 do
  begin
    Result:=Result+Char(StrToInt('$'+Copy(Str,i*2-1,2)) xor XorKey[j]);
    j:=(j+1) mod 8;
  end;
end;

// 数字转与大写
function NumToRMB_0(AMoney: string): string;
  // 去除所有分隔符
  procedure ClearComma(var AValue: string);
  begin
    while Pos(',', AValue) > 0 do
      Delete(AValue, Pos(',', AValue), 1);
  end;
  // 测试如果为零将不返回值
  function FiltrateValue(const AValue, AStr: string): string;
  var
    IntValue: Integer;
  begin
    IntValue:= StrToIntDef(AValue, 0);
    if IntValue > 0 then Result:= AStr; 
  end;
  // 直接将数字翻译成大写
  function Direct(const AValue: string): string;
  var
    ResultStr: string;
    iCount: Integer;
  begin
    for iCount:= 1 to Length(AValue) do
      ResultStr:= ResultStr + NumberArray[StrToInt(AValue[iCount])];
    Result:= ResultStr;
  end;
  // 将四位长度的数字翻译与大写
  function FourBit(const AValue: string): string;
  var
    i, x, j: Integer;
    IntValue: Integer;
    ResultStr: string;
  begin
    IntValue:= StrToIntDef(AValue, 0);
    x:= IntValue;
    i := x div 1000;
    j := x mod 1000;
    if i <> 0 then ResultStr:= NumberArray[i] + '仟'
    else begin
      if Length(AValue) > 3 then ResultStr:= '零';
    end;
    i := j div 100;
    j := j mod 100;
    if i <> 0 then  ResultStr:= ResultStr + NumberArray[i] + '佰'
    else begin
      if (ResultStr <> '') and (Length(AValue) > 2) and
        (Copy(ResultStr, Length(ResultStr)-1, 2) <> '零') then
        ResultStr:= ResultStr + '零';
    end;
    i := j div 10;
    j := j mod 10;
    if i <> 0 then ResultStr := ResultStr + NumberArray[i] + '拾'
    else begin
      if (ResultStr <> '') and (Length(AValue) > 1) and
        (Copy(ResultStr, Length(ResultStr)-1, 2) <> '零') then
        ResultStr:= ResultStr + '零';
    end;
    ResultStr := ResultStr + NumberArray[j];
    while Copy(ResultStr, Length(ResultStr)-1, 2) = '零' do
      Delete(ResultStr, Length(ResultStr)-1, 2);
    Result := ResultStr;
  end;
var
  IntegerValue: string;   // 整数部分的值
  KilomegaValue: string;  // 存储大于千兆的数字
  AccountValue: string;   // 在千兆以内的整数部分
  DecimalValue: string;   // 存在小数点后的值

  ResultKilomega: string; // 大于千兆并翻译后的大写字符
  ResultAccount: string;  // 在千兆以内的整数部分并翻译后的大写字符
  ResultDecimal: string;  // 小数点后的值并翻译后的大写字符

  FourBitStr: string;     // 最大四位值的字符
begin
  // 清除分隔符
  ClearComma(AMoney);
  // 验证字符串是否合法
  try
    AMoney:= FloatToStr(StrToFloat(AMoney));
  except
    raise Exception.Create('无效的数值字符串');
  end;

  // 取到小数据点后的值
  // 取出整数部分的值
  if Pos('.', AMoney) > 0 then
  begin
    DecimalValue:= Copy(AMoney, Pos('.', AMoney) + 1, Length(AMoney));
    IntegerValue:= Copy(AMoney, 0, Pos('.', AMoney)-1);
    ResultDecimal:= '.' + Direct(DecimalValue);
  end
  else IntegerValue:= AMoney;

  // 取到大于千兆的数字
  // 取到在千兆以内的整数部分
  if Length(IntegerValue) > 16 then
  begin
    KilomegaValue:= Copy(IntegerValue, 0, Length(IntegerValue) - 12);
    AccountValue:= Copy(IntegerValue,
      Length(IntegerValue) - 11, Length(IntegerValue));
    ResultKilomega:= Direct(KilomegaValue) + '兆';
  end
  else AccountValue:= IntegerValue;

  { 翻译在千兆以内的整数部分 }

  // 翻译在兆与仟兆之间的部份
  if Length(AccountValue) > 12 then
  begin
    FourBitStr:= Copy(AccountValue, 0, Length(AccountValue) - 12);
    ResultAccount:= ResultAccount +
      FourBit(FourBitStr) + FiltrateValue(FourBitStr, '兆');
    Delete(AccountValue, 1, Length(AccountValue) - 12);
  end;
  // 翻译在亿与仟亿之间的部份
  if Length(AccountValue) >= 8 then
  begin
    FourBitStr:= Copy(AccountValue, 0, Length(AccountValue) - 8);
    ResultAccount:= ResultAccount +
      FourBit(FourBitStr) + FiltrateValue(FourBitStr, '亿');
    Delete(AccountValue, 1, Length(AccountValue) - 8);
  end;
  // 翻译在万与仟万之间的部份
  if Length(AccountValue) >= 5 then
  begin
    FourBitStr:= Copy(AccountValue, 0, Length(AccountValue) - 4);
    ResultAccount:= ResultAccount +
      FourBit(FourBitStr) + FiltrateValue(FourBitStr, '万');
    Delete(AccountValue, 1, Length(AccountValue) - 4);
  end;
  // 翻译万以下的部份
  if Length(AccountValue) > 0 then
  begin
    ResultAccount:= ResultAccount +
      FourBit(Copy(AccountValue, 0, Length(AccountValue)));
  end;

  // 组合字符串
  Result:= ResultKilomega + ResultAccount + ResultDecimal;
  
end;

function NumToRMB(const S:WideString):WideString;
//[====防止出现000001的情况
  procedure DeleZero(var S:WideString);
  begin
    if s[1]='0' then
    begin
      Delete(s,1,1);
      if Length(s)>1 then
        DeleZero(s);   //递归
    end;
  end;
//=======]
const
  ARmbUnits:WideString='仟佰拾万仟佰拾亿仟佰拾万仟佰拾元元角分厘';
  AUpper:WideString='零壹贰叁肆伍陆柒捌玖';
  AYuanPos=16;
  AKeyWordPos=[4,8,12,16];  //万亿万元的位置
var
  dotPos,Len,nUnitLen:integer;
  Amount,RMB,sNum,sUnit:WideString;
  i,n,k:integer;
begin
  Amount:=Trim(S);
  try
    DeleZero(Amount);   //调用内部过程
    len:=Length(Amount);
    dotPos:=pos('.',Amount);  //小数点的位置
    //===[判断数字长度有否越界
    if dotPos>0 then
    begin
      if dotPos>AYuanPos+1 then
      begin
        Application.MessageBox('数值超过千亿位!', '提示', MB_OK +
          MB_ICONWARNING);
        Exit;
      end else nUnitLen:=AYuanPos-dotPos+1; //对齐元
    end else
    begin
      if Len>AYuanPos then
      begin
        Application.MessageBox('数值超过千亿位!', '提示', MB_OK +
          MB_ICONWARNING);
        Exit;
      end else nUnitLen:=AYuanPos-Len; //对齐元
    end; //======]
    RMB:='';
//    if dotPos>0 then
//      nUnitLen:=AYuanPos-dotPos+1     //对齐元
//    else nUnitLen:=AYuanPos-Len;
    i:=1;
    while i<=Len do
    begin
      if i=dotPos then inc(i);  //碰到小数点挪到下位
      n:=nUnitLen+i;             //计算金额单位的位置
      k:=strtoint(Amount[i]);
      sNum:=AUpper[k+1];      //数字数值
      sUnit:=ARmbUnits[n];    //单位
      if k=0 then             //为零的大写习惯
      begin
        if i<Len then
        begin
          if i+1<>dotPos then
          begin
            k:=strtoint(Amount[i+1]);
            if (k=0) or (n in AKeyWordPos) then sNum:='';
          end else sNum:='';
        end else sNum:='';
        if not(n in AKeyWordPos)
          or (dotPos=2) then sUnit:='';
      end;
      RMB:=RMB+sNum+sUnit;
      inc(i);
    end;
    if Pos('零',RMB)=1 then Delete(RMB,1,1);//解决0.09类的问题
    k:=Pos('亿万',RMB);   //解决亿万问题
    if k>0 then Delete(RMB,k+1,1);
    if RMB[1]='元' then
      Result:=' ' //排除0000只出现一个元字的问题
    else
      Result:=RMB; //输出
  except
    Application.MessageBox('输入非法数值，请重新输入!', '提示', MB_OK +
      MB_ICONWARNING);
  end;
end;

function FindForm(FormClass: TFormClass): TForm;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I] is FormClass then
    begin
      Result := Screen.Forms[I];
      Break;
    end;
  end;
end;

function InternalFindShowForm(FormClass: TFormClass;
  const Caption: string; Restore: Boolean): TForm;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I].ClassNameIs(FormClass.ClassName) then
      if (Caption = '') or (Caption = Screen.Forms[I].Caption) then
      begin
        Result := Screen.Forms[I];
        Break;
      end;
  end;
  if Result = nil then
  begin
    Application.CreateForm(FormClass, Result);
    if Caption <> '' then
      Result.Caption := Caption;
  end;
  with Result do begin
    if Restore and (WindowState = wsMinimized) then
      WindowState := wsNormal;
    Show;
  end;
end;

function FindShowForm(FormClass: TFormClass; const Caption: string): TForm;
begin
  Result := InternalFindShowForm(FormClass, Caption, True);
end;

//注意,path后面要有'\';
procedure searchfile(path: string; var AList : TStrings; AFileType: string = '*.*'; Flag: Integer = 0);
var
  SearchRec : TSearchRec;
  found   : integer;      //,I
begin
  AList.Clear;
  found := FindFirst(path + AFileType, faAnyFile, SearchRec);
  while found = 0 do
  begin
    if Flag = 1 then
    begin
      if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') and (SearchRec.Attr = faDirectory) then
        AList.Add(SearchRec.Name);
    end else if Flag = 2 then
    begin
      if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') and (SearchRec.Attr <> faDirectory) then
        AList.Add(SearchRec.Name);
    end;
    found:=FindNext(SearchRec);
  end;
  FindClose(SearchRec);
end;

//获取硬盘序列号
function GetIdeDiskSerialNumber(i:Integer) : String;
var
  Buffer : Array[0..BufferSize - 1] of Byte;
  hDevice : THandle;
  srbControl : TSrbIoControl absolute Buffer;
  pInData : PSendCmdInParams; 
  pOutData : Pointer; // PSendCmdOutParams
  cbBytesReturned : DWORD; 
begin
   Result := '';
   FillChar(Buffer,BufferSize,#0);
   if Win32Platform=VER_PLATFORM_WIN32_NT then
   begin // Windows NT, Windows 2000
   // Get SCSI port handle
      hDevice := CreateFile( pchar('\\.\Scsi'+inttostr(i)+':'),
                           GENERIC_READ or GENERIC_WRITE,
                           FILE_SHARE_READ or FILE_SHARE_WRITE,
                           nil, OPEN_EXISTING, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
         srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
         System.Move('SCSIDISK',srbControl.Signature,8);
         srbControl.Timeout := 2;
         srbControl.Length := DataSize;
         srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
         pInData := PSendCmdInParams(PChar(@Buffer)
                     +SizeOf(SRB_IO_CONTROL));
         pOutData := pInData;
         with pInData^ do
         begin
            cBufferSize := IDENTIFY_BUFFER_SIZE;
            bDriveNumber := 0;
            with irDriveRegs do
            begin
               bFeaturesReg := 0;
               bSectorCountReg := 1;
               bSectorNumberReg := 1;
               bCylLowReg := 0;
               bCylHighReg := 0;
               bDriveHeadReg := $A0;
               bCommandReg := IDE_ID_FUNCTION;
            end;
         end;
         if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT,
         @Buffer, BufferSize, @Buffer, BufferSize,
         cbBytesReturned, nil ) then Exit;
      finally
         CloseHandle(hDevice);
      end;
   end
   else
   begin // Windows 95 OSR2, Windows 98
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil,
      CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
         pInData := PSendCmdInParams(@Buffer);
         pOutData := @pInData^.bBuffer;
         with pInData^ do
         begin
            cBufferSize := IDENTIFY_BUFFER_SIZE;
            bDriveNumber := 0;
            with irDriveRegs do
            begin
               bFeaturesReg := 0;
               bSectorCountReg := 1;
               bSectorNumberReg := 1;
               bCylLowReg := 0;
               bCylHighReg := 0;
               bDriveHeadReg := $A0;
               bCommandReg := IDE_ID_FUNCTION;
            end;
         end;
         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA,
                                 pInData, SizeOf(TSendCmdInParams)-1, pOutData,
                                 W9xBufferSize, cbBytesReturned, nil ) then Exit;
      finally
         CloseHandle(hDevice);
      end;
   end;
   with PIdSector(PChar(pOutData)+16)^ do
   begin
      ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
      SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
   end;
end;

function GetCPUID : TCPUID; assembler; register;
asm
  PUSH    EBX         {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX     {@Resukt}
  MOV     EAX,1
  DW      $A20F       {CPUID Command}
  STOSD           {CPUID[1]}
  MOV     EAX,EBX
  STOSD               {CPUID[2]}
  MOV     EAX,ECX
  STOSD               {CPUID[3]}
  MOV     EAX,EDX
  STOSD               {CPUID[4]}
  POP     EDI {Restore registers}
  POP     EBX
end;

function GetCPUVendor : TVendor; assembler; register;
asm
  PUSH    EBX {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX {@Result (TVendor)}
  MOV     EAX,0
  DW      $A20F {CPUID Command}
  MOV     EAX,EBX
  XCHG EBX,ECX     {save ECX result}
  MOV ECX,4
@1:
  STOSB
  SHR     EAX,8
  LOOP    @1
  MOV     EAX,EDX
  MOV ECX,4
@2:
  STOSB
  SHR     EAX,8
  LOOP    @2
  MOV     EAX,EBX
  MOV ECX,4
@3:
  STOSB
  SHR     EAX,8
  LOOP    @3
  POP     EDI {Restore registers}
  POP     EBX
end;

procedure GetDirs(dirName: string; List: TStrings; ASerachType: TSearchType = stCurrent);
const
 attr: Integer = faDirectory; {文件属性常量, 表示这是文件夹}
var
 SRec: TSearchRec;           {定义 TSearchRec 结构变量}
 dir : string;
begin
  dirName := ExcludeTrailingBackslash(dirName) + '\'; {不知道最后是不是 \; 先去掉, 再加上}
  dir := dirName + '*.*'; {加上 \; *.* 或 * 表示所有文件, 系统会把目录也当作一个文件}
  if FindFirst(dir, attr, SRec) = 0 then {开始搜索,并给 SRec 赋予信息, 返回0表示找到第一个}
  begin
    repeat
      if (SRec.Attr = attr) and             {如果是文件夹}
          (SRec.Name <> '.') and             {排除上层目录}
          (SRec.Name <> '..') then           {排除根目录}
      begin
        case ASerachType of
          stCurrent:
             begin
               List.Add(dirName + SRec.Name);     {用List记下结果}
             end;
          stSub:
             begin
               List.Add(dirName + SRec.Name);     {用List记下结果}
               GetDirs(dirName + SRec.Name, List); {这句就是递归调用, 如果没有这句, 只能搜索当前目录}
             end;
          stAll:
             begin
               List.Add(dirName + SRec.Name);     {用List记下结果}
               GetDirs(dirName + SRec.Name, List); {这句就是递归调用, 如果没有这句, 只能搜索当前目录}
             end;
        end;
      end;
    until(FindNext(SRec)<>0);               {找下一个, 返回0表示找到}
  end;
  FindClose(SRec);                           {结束搜索}
end;

//加载插件
function LoadPkg(APluginFile: string; ATmpStrings: TStrings; AMDITabSet: TEasyMDITabSet;
                  AEasyProgressBar: TEasyProgressBar;
                  AMDICloseNotify: TMDICloseNotify; AType: Integer = 0): Boolean;
var
  BplHandle   : THandle;
  AShowBplForm: TShowBplForm;
  TmpForm     : TForm;
  ATmpMenuItem: TMenuItem;
  AExitsForm  : TForm; //判断一个窗体是否存在
//  I           : Integer;
begin
  if not FileExists(APluginFile) then
  begin
    Application.MessageBox(PChar(Format(EASY_BPL_NOTFOUND, [APluginFile])),
                           PChar(EASY_SYS_ERROR), MB_OK + MB_ICONSTOP);
    Result := False;
    Exit;
  end;
  BplHandle := LoadPackage(APluginFile);
  //进度窗体进度
  AEasyProgressBar.Position := 30;
  if BplHandle > 0 then
  begin
    try
      AShowBplForm := GetProcAddress(BplHandle, PChar('ShowBplForm'));
      //进度窗体进度
      AEasyProgressBar.Position := 40;
      if @AShowBplForm = nil then
        raise Exception.Create('不能加载插件:'+ APluginFile + ' 原因：未找到插件入口函数!')
      else
      begin
        TmpForm := AShowBplForm(ATmpStrings);
      end;
      //判断此窗体是否已经加载过
//      for I := 0 to AMDITabSet.EasyOfficeTabCount - 1 do
//      begin
//        if TmpForm.Caption = TForm(AMDITabSet.GetChildForm(AMDITabSet.EasyOfficeTabs[I])).Caption then
//        begin
//          AExitsForm := AMDITabSet.GetChildForm(AMDITabSet.EasyOfficeTabs[I]);
//          Break;
//        end;
//      end;
//      if AExitsForm <> nil then
//      begin
//        Application.FreeNotification(TmpForm);
//        FreeAndNil(TmpForm);
//        AMDITabSet.ActiveTabIndex := I;
//        进度窗体进度
//        AEasyProgressBar.Position := 80;
//      end
//      else
      begin                       //找不到就呈现新建的
        //进度窗体进度
        AEasyProgressBar.Position := 60;
        Application.FreeNotification(TmpForm);
        if AType <> 0 then
        begin
          //增加MDITabSet
          AMDITabSet.AddTab(TmpForm);
          TmpForm.OnClose := AMDICloseNotify;
        end;
        //进度窗体进度
        AEasyProgressBar.Position := 80;
        TmpForm.Show;
      end;
    finally
//      UnloadPackage(BplHandle);
    end;
  end;
  Result := True;
end;

//ShowModel加载插件
function LoadPkg(APluginFile: string; ATmpStrings: TStrings): Boolean;
var
  BplHandle   : THandle;
  AShowBplForm: TShowBplForm;
  TmpForm     : TForm;
begin
  if not FileExists(APluginFile) then
  begin
    Application.MessageBox(PChar(Format(EASY_BPL_NOTFOUND, [APluginFile])),
                           PChar(EASY_SYS_ERROR), MB_OK + MB_ICONSTOP);
    Result := False;
    Exit;
  end;
  BplHandle := LoadPackage(APluginFile);
  if BplHandle > 0 then
  begin
    try
      AShowBplForm := GetProcAddress(BplHandle, PChar('ShowBplForm'));
      if @AShowBplForm = nil then
        raise Exception.Create('cannot load:'+ APluginFile)
      else
      begin
         TmpForm := AShowBplForm(ATmpStrings);
      end;
      Application.FreeNotification(TmpForm);
      TmpForm.ShowModal;
    finally
//      UnloadPackage(BplHandle);
    end;
  end;
  Result := True;
end;

//创建文件夹
function CreateDir_H(APath: string): Boolean;
begin
  Result := False;
  if not DirectoryExists(APath) then
  begin
    try
      Result := ForceDirectories(APath);
    except on E: Exception do
      raise Exception.Create('创建文件夹:' + APath + ' 失败!');
    end;
  end;
end;
  
//写入日志文档内容
//存成文本文件、以Base64编码
procedure WriteLog_H(ALogPath: String; AContent: String);
var
  TmpPath,
  TmpLogFile: string;
  TmpFileLog: TextFile;
begin
  TmpPath := ALogPath;
  if not DirectoryExists(TmpPath) then
    CreateDir_H(TmpPath);
  if DirectoryExists(TmpPath) then
  begin
    TmpLogFile := TmpPath + '\' + FormatDateTime('YYYY-MM-DD', Date) + '.log';
    AssignFile(TmpFileLog, TmpLogFile);
    if not FileExists(TmpLogFile) then
      Rewrite(TmpFileLog)
    else
      Append(TmpFileLog);             

    Writeln(TmpFileLog, AContent);

    Flush(TmpFileLog);
    CloseFile(TmpFileLog);
  end;
end;

function OpenClientDataSet(AClientDataSet: TClientDataSet;
          AOpenClientDataSetStyle: TOpenClientDataSetStyle = ocdOpen): string;
begin
  Result := '-1';
  try
    if AOpenClientDataSetStyle = ocdExecute then
      AClientDataSet.Execute
    else
    if AOpenClientDataSetStyle = ocdOpen then
      AClientDataSet.Open;
    Result := '1';
  except on e:Exception do
    //
  end;
end;

//获取用户模块权限
function getUserModuleRight(FormId, CurrUserID: string): string;
begin
  Result := '';
end;

//获取指定对象是否具有某个属性  引用typinfo
function FindProperty(AClass: TObject; sPropertyName: String): Boolean;
var
  PropList     : PPropList;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i            : integer;
begin
  Result := False;
  ClassTypeInfo := aClass.ClassType.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  if ClassTypeData.PropCount <> 0 then
  begin
    GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
    try
      GetPropInfos(AClass.ClassInfo, PropList);
      for i := 0 to ClassTypeData.PropCount - 1 do
        if (PropList[i]^.PropType^.Kind <> tkMethod)
          and (UpperCase(PropList[i]^.Name) = UpperCase(sPropertyName)) then
        begin
          Result := True;
          Break;
        end;
    finally
      FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
    end;
  end;
end;

//设置指定控件BondLabel的字体颜色
function SetEditLabelColor(AClass: TObject; AColor: TColor): Boolean;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TBoundLabel;
begin
  Result := False;
  PropInfoPtr:=GetPropInfo(AClass,'EditLabel');
  if PropInfoPtr=nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TBoundLabel then
    begin
      BoundLabel := TBoundLabel(GetObjectProp(AClass, PropInfoPtr));
      BoundLabel.Font.Color := AColor;
      Result := True;
    end;
  end;
end;

//设置指定控件所有子控件的BonLabel的字体颜色
procedure SetEditLabelsColor(AParentControl: TControl;
                            AColor: TColor; var ASetControlList: TList);
var
  I: Integer;
  TmpComponent: TComponent;
begin
  ASetControlList.Clear;
  for I := 0 to AParentControl.ComponentCount - 1 do
  begin
    TmpComponent := AParentControl.Components[I];
    if SetEditLabelColor(TmpComponent, AColor) then
      ASetControlList.Add(TmpComponent);
  end;
end;

//获取控件的绑定数据集
function GetDBDataBindingDataSet(AClass: TObject): TDataSet;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TcxDBTextEditDataBinding;
begin
  Result := nil;
  PropInfoPtr := GetPropInfo(AClass,'DataBinding');
  if PropInfoPtr=nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TcxDBTextEditDataBinding then
    begin
      BoundLabel := TcxDBTextEditDataBinding(GetObjectProp(AClass, PropInfoPtr));
      Result := BoundLabel.DataSource.DataSet;
    end;
  end;
end;

//获取控件的绑定数据字段
function GetDBDataBinding(AClass: TObject; var ABondLabelCaption: string): string;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TcxDBTextEditDataBinding;
begin
  Result := '';
  PropInfoPtr := GetPropInfo(AClass,'DataBinding');
  if PropInfoPtr=nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TcxDBTextEditDataBinding then
    begin
      BoundLabel := TcxDBTextEditDataBinding(GetObjectProp(AClass, PropInfoPtr));
      ABondLabelCaption := GetEditLabelCaption(AClass);
      Result := BoundLabel.DataField;
    end;
  end;
end;

//获取指定控件BondLabel的标题
function GetEditLabelCaption(AClass: TObject): string;
var
  PropInfoPtr: PPropInfo;
  BoundLabel : TBoundLabel;
begin
  Result := '';
  PropInfoPtr := GetPropInfo(AClass,'EditLabel');
  if PropInfoPtr = nil then exit;
  if PropInfoPtr^.PropType^.Kind = tkClass then
  begin
    if GetObjectPropClass(AClass, PropInfoPtr) = TBoundLabel then
    begin
      BoundLabel := TBoundLabel(GetObjectProp(AClass, PropInfoPtr));
      Result := BoundLabel.Caption;
    end;
  end;
end;  

end.
