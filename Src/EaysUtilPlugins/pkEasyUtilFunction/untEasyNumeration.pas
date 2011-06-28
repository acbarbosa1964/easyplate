unit untEasyNumeration;

interface

uses
  SysUtils, Math;

type
  TEasyNumeration = class
  public
    //10 进制 to 2,8,16 进制
    class function IntToBin(Value: Integer): string;
    class function IntToHex(Value: Integer): String;//10 = 2
    class function IntToO(Value: Integer): string;

    //2进制 to 10,8,16 进制
    class function BinToHex(Value: String): String;
    class function BinToO(Value: String): String;
    class function BinToInt(Value: String): LongInt;// 2 = 10

    //16 > 10 2   8 进制
    class function HexToBin(Value: string): string;
    class function HexToInt(Value: string): LongInt;
    class function HexToO(Value: string): string;

    //八进制转换成二进制字符串
    class function OToBin(Value: string): string;
    class function OToHex(Value: string): string;
    class function OToInt(Value: string): LongInt;
  end;

implementation

{ TEasyNumeration }

class function TEasyNumeration.BinToHex(Value: String): String;
var
  vD       : Byte;
  I        : Integer;
  vHextStr : String;
  vP       : PChar;
  vLen     : Integer;
begin
  vLen := Length(Value);
  if vLen mod 4 > 0 then
  begin
    SetLength(vHextStr,  vLen div 4 + 1);
    vLen := vlen div 4 + 1;
  end
  else
  begin
    SetLength(vHextStr, vLen div 4);
    vLen := vlen div 4 ;
  end;

  //初始化
  vD := 0;
  vP := PChar(Value) + length(Value) - 1;
  I := 0;   //开始计数

  while vP^ <> #0 do
  begin
    if vp^ = '1' then
    begin
      case I of
        0:
          vD :=vd +1 ;
        1:
          vD :=vd + 2;
        2:
          vD :=vd + 4;
        3:
          vD :=vd + 8;
      end;
    end;

    Dec(vP);
    Inc(I);
    if I = 4 then
    begin
      case vD of
        0..9 : vHextStr[vLen] := Chr(vD + $30);
        10..15 : vHextStr[vLen] := Chr(vD - 10 + $41);
      end;
      Dec(vLen);
      I   :=   0;
      vD   :=   0;
    end;
  end;

  if I > 0then
  begin
    case vD of
      0..9 : vHextStr[vLen] := Chr(vD + $30);
      10..15 : vHextStr[vLen] := Chr(vD + $41);
    end;
  end;

  Result := vHextStr;
end;

class function TEasyNumeration.BinToInt(Value: String): LongInt;
var
  i, Size: Integer;
begin
  Result:=0;
  Size:=Length(Value);
  for i := Size downto 1 do
  begin
    //例如 1010
    if Copy(Value,i,1) = '1' then
      Result := Result + (1 shl (Size - i));
  end;
end;

class function TEasyNumeration.BinToO(Value: String): String;
var
  vD       : Byte;
  I        : Integer;
  vHextStr : String;
  vP       : PChar;
  vLen     : Integer;
begin
  vLen := Length(Value);
  if vLen mod 3 > 0 then
  begin
    SetLength(vHextStr, vLen div 3 + 1);
    vLen := vlen div 3 + 1;
  end
  else
  begin
    SetLength(vHextStr, vLen div 3);
    vLen := vlen div 3 ;
  end;

  //初始化
  vD := 0;
  vP := PChar(Value) + length(Value) - 1;
  I := 0;   //开始计数

  while vP^ <> #0 do
  begin
    if vp^ = '1' then
    begin
      case I of
        0:
          vD := vd + 1;
        1:
          vD := vd + 2;
        2:
          vD := vd + 4;
      end;
    end;

    Dec(vP);
    Inc(I);
    if I = 3 then
    begin
      case vD of
        0..9 :
          vHextStr[vLen] := Chr(vD + $30);
      end;
      Dec(vLen);
      I := 0;
      vD := 0;
    end;
  end;

  if I > 0then
  begin
    case vD of
    0..9:
      vHextStr[vLen] := Chr(vD + $30);
    end;
  end;

  Result := vHextStr;
end;

class function TEasyNumeration.HexToBin(Value: string): string;
const
  cBitStrings: array[0..15] of string =
                              (
                              '0000',   '0001',   '0010',   '0011',
                              '0100',   '0101',   '0110',   '0111',
                              '1000',   '1001',   '1010',   '1011',
                              '1100',   '1101',   '1110',   '1111'
                              );
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
      Result := Result + cBitStrings[StrToIntDef('$' + Value[I], 0)];
  while Pos('0', Result) = 1 do
    Delete(Result, 1, 1);
end;

class function TEasyNumeration.HexToInt(Value: string): LongInt;
begin
  Result := StrToInt('$' + Value);
end;

class function TEasyNumeration.HexToO(Value: string): string;
begin
  Result := BinToO(HexToBin(Value));
end;

class function TEasyNumeration.IntToBin(Value: Integer): string;
begin
  Result := '';
  while (Value <> 0) do
  begin
    Result := Format('%d' + Result, [Value mod 2]);
    Value := Value div 2;
  end;  
end;

class function TEasyNumeration.IntToHex(Value: Integer): String;
begin
  Result := BinToHex(IntToBin(Value));
end;

class function TEasyNumeration.IntToO(Value: Integer): string;
begin
  Result := BinToO(IntToBin(Value));
end;

class function TEasyNumeration.OToInt(Value: string): LongInt;
begin
  Result := BinToInt(OToBin(Value));
end;

class function TEasyNumeration.OToBin(Value: string): string;
const
  cBitStrings: array[0..7] of string =
                              (
                              '000',   '001',   '010',   '011',
                              '100',   '101',   '110',   '111'
                              );
var
  i, j: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
  begin
    j:=strtoint(Value[i]);
    Result := Result + cBitStrings[j];
  end;
  while Pos('0', Result) = 1 do
    Delete(Result, 1, 1);
end;

class function TEasyNumeration.OToHex(Value: string): string;
begin
  Result := BinToHex(OToBin(Value));
end;

end.
