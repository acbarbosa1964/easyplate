unit untStrConvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes;

  //¼òÌåºÍ·±Ìå»¥»»
  function GB2Big(GB: string): string; stdcall;
  function Big2GB(Big: string): string; stdcall;
  
implementation

function GB2Big(GB: string): string;
var
  Len: Integer;
begin
  Len := Length(GB);
  SetLength(Result, Len);
  LCMapString(GetUserDefaultLCID, LCMAP_TRADITIONAL_CHINESE, PChar(GB), Len,
              PChar(Result), Len);
end;

function Big2GB(Big: string): string;
var
  Len: Integer;
begin
  Len := Length(Big);
  SetLength(Result, Len);
  LCMapString(GetUserDefaultLCID, LCMAP_SIMPLIFIED_CHINESE, PChar(Big), Len,
              PChar(Result), Len);
end;

end.
