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
//    字符串与流的加解密
//-----------------------------------------------------------------------------}
unit untEasyUtilCrypt;

interface

uses
  Windows, Classes, SysUtils, Forms, Controls;
  
const
  _KEYLength = 128;
  MAXBC     = (256 div 32);
  MAXKC     = (256 div 32);
  MAXROUNDS = 14;

  DIR_ENCRYPT   = 0;    { Are we encrpyting? }
  DIR_DECRYPT   = 1;    { Are we decrpyting? }
  MODE_ECB      = 1;    { Are we ciphering in ECB mode? }
  MODE_CBC      = 2;    { Are we ciphering in CBC mode? }
  MODE_CFB1     = 3;    { Are we ciphering in 1-bit CFB mode? }
  rTRUE         = 1;    { integer(true) }
  rFALSE        = 0;    { integer(false) }
  BITSPERBLOCK  = 128;  { Default number of bits in a cipher block }

{ Error Codes - CHANGE POSSIBLE: inclusion of additional error codes }
  BAD_KEY_DIR         = -1;  { Key direction is invalid, e.g., unknown value }
  BAD_KEY_MAT         = -2;  { Key material not of correct length }
  BAD_KEY_INSTANCE    = -3;  { Key passed is not valid }
  BAD_CIPHER_MODE     = -4;  { Params struct passed to cipherInit invalid }
  BAD_CIPHER_STATE    = -5;  { Cipher in wrong state (e.g., not initialized) }
  BAD_CIPHER_INSTANCE = -7;

{  CHANGE POSSIBLE:  inclusion of algorithm specific defines  }
  MAX_KEY_SIZE  = 64;                   { # of ASCII char's needed to represent a key }
  MAX_IV_SIZE = (BITSPERBLOCK div 8);   { # bytes needed to represent an IV }

type
  word8      = byte;        // unsigned 8-bit
  word16     = word;        // unsigned 16-bit
  word32     = longword;    // unsigned 32-bit
  TByteArray = array [0..MaxInt div sizeof(Byte)-1] of Byte;
  PByte      = ^TByteArray;

  TArrayK  = array [0..4-1, 0..MAXKC-1] of word8;
  PArrayK = ^TArrayK;
  TArrayRK = array [0..MAXROUNDS+1-1, 0..4-1, 0..MAXBC-1] of word8;
  TArrayBox= array [0..256-1] of word8;

  { The structure for key information }
  PkeyInstance = ^keyInstance;
  keyInstance = packed record
    direction: Byte;    { Key used for encrypting or decrypting? }
    keyLen: integer;    { Length of the key }
    keyMaterial: array [0..MAX_KEY_SIZE+1-1] of Ansichar;  { Raw key data in ASCII, e.g., user input or KAT values }
    { The following parameters are algorithm dependent, replace or add as necessary }
    blockLen: integer;  { block length }
    keySched: TArrayRK; { key schedule }
  end;  {* keyInstance *}
  TkeyInstance = keyInstance;

{ The structure for cipher information }
  PcipherInstance = ^cipherInstance;
  cipherInstance = packed record
    mode: Byte;         // MODE_ECB, MODE_CBC, or MODE_CFB1
    IV: array [0..MAX_IV_SIZE-1] of Byte; // A possible Initialization Vector for ciphering
    { Add any algorithm specific parameters needed here }
    blockLen: integer;  // Sample: Handles non-128 bit block sizes (if available)
  end;  {* cipherInstance *}
  TcipherInstance = cipherInstance;

  TEasyCrypterClass = class of TEasyCustomCrypter; 

  TEasyCustomCrypter = class(TComponent)
  private
    FStream: TStream;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Decrypt(Source: TStream; const Key: AnsiString): Boolean; virtual; abstract;
    procedure Crypt(Dest: TStream; const Key: AnsiString); virtual; abstract;
    procedure CreaEasyream;
    property Stream: TStream read FStream write FStream;
  end;

  TEasyCrypt = class(TEasyCustomCrypter)
  private
    function AskKey(const Key: AnsiString): AnsiString;
  public
    procedure Crypt(Dest: TStream; const Key: AnsiString); override;
    function Decrypt(Source: TStream; const Key: AnsiString): Boolean; override;
  end;

procedure EasyCryptStream(Source, Dest: TStream; const Key: AnsiString);
procedure EasyDecryptStream(Source, Dest: TStream; const Key: AnsiString);
function ExpandKey(sKey: AnsiString; iLength: integer): Ansistring;
function _makeKey(key: PkeyInstance; direction: Byte; keyLen: integer; keyMaterial: pAnsichar): integer;
function MakeKey(const Key: AnsiString): AnsiString;
{encode string}
function EnCryptString(const sMessage: AnsiString; sKeyMaterial: AnsiString): AnsiString;
{decode string}
function DeCryptString(const sMessage: AnsiString; sKeyMaterial: AnsiString): AnsiString;

{ Calculate the necessary round keys
  The number of calculations depends on keyBits and blockBits }
function rijndaelKeySched(k: TArrayK; keyBits, blockBits: integer;
                          var W: TArrayRK): integer;

{ Encryption of one block. }
function rijndaelEncrypt(var a: TArrayK; keyBits, blockBits: integer; rk: TArrayRK): integer;

{ Encrypt only a certain number of rounds.
  Only used in the Intermediate Value Known Answer Easy. }
function rijndaelEncryptRound(var a: TArrayK; keyBits, blockBits: integer;
                  rk: TArrayRK; var irounds: integer): integer;

{ Decryption of one block. }
function rijndaelDecrypt(var a: TArrayK; keyBits, blockBits: integer; rk: TArrayRK): integer;

{ Decrypt only a certain number of rounds.
  Only used in the Intermediate Value Known Answer Easy.
  Operations rearranged such that the intermediate values
  of decryption correspond with the intermediate values
  of encryption. }
function rijndaelDecryptRound(var a: TArrayK; keyBits, blockBits: integer;
                        rk: TArrayRK; var irounds: integer): integer;

{sergey has corrected it}
function blocksEnCrypt(cipher: PcipherInstance; key: PkeyInstance; input: PByte;
          inputLen: integer; outBuffer: PByte): integer;
{sergey has corrected it}
function blocksDeCrypt(cipher: PcipherInstance; key: PkeyInstance; input: PByte;
                      inputLen: integer; outBuffer: PByte): integer;

implementation

{
  Tables that are needed by the reference implementation.
  The tables implement the S-box and its inverse, and also
  some temporary tables needed for multiplying in the finite field GF(2^8)
}

const
  Logtable: array [0..256-1] of word8 = (
      0,   0,  25,   1,  50,   2,  26, 198,  75, 199,  27, 104,  51, 238, 223,   3,
    100,   4, 224,  14,  52, 141, 129, 239,  76, 113,   8, 200, 248, 105,  28, 193,
    125, 194,  29, 181, 249, 185,  39, 106,  77, 228, 166, 114, 154, 201,   9, 120,
    101,  47, 138,   5,  33,  15, 225,  36,  18, 240, 130,  69,  53, 147, 218, 142,
    150, 143, 219, 189,  54, 208, 206, 148,  19,  92, 210, 241,  64,  70, 131,  56,
    102, 221, 253,  48, 191,   6, 139,  98, 179,  37, 226, 152,  34, 136, 145,  16,
    126, 110,  72, 195, 163, 182,  30,  66,  58, 107,  40,  84, 250, 133,  61, 186,
     43, 121,  10,  21, 155, 159,  94, 202,  78, 212, 172, 229, 243, 115, 167,  87,
    175,  88, 168,  80, 244, 234, 214, 116,  79, 174, 233, 213, 231, 230, 173, 232,
     44, 215, 117, 122, 235,  22,  11, 245,  89, 203,  95, 176, 156, 169,  81, 160,
    127,  12, 246, 111,  23, 196,  73, 236, 216,  67,  31,  45, 164, 118, 123, 183,
    204, 187,  62,  90, 251,  96, 177, 134,  59,  82, 161, 108, 170,  85,  41, 157,
    151, 178, 135, 144,  97, 190, 220, 252, 188, 149, 207, 205,  55,  63,  91, 209,
     83,  57, 132,  60,  65, 162, 109,  71,  20,  42, 158,  93,  86, 242, 211, 171,
     68,  17, 146, 217,  35,  32,  46, 137, 180, 124, 184,  38, 119, 153, 227, 165,
    103,  74, 237, 222, 197,  49, 254,  24,  13,  99, 140, 128, 192, 247, 112,   7 );

  Alogtable: array [0..256-1] of word8 = (
      1,   3,   5,  15,  17,  51,  85, 255,  26,  46, 114, 150, 161, 248,  19,  53,
     95, 225,  56,  72, 216, 115, 149, 164, 247,   2,   6,  10,  30,  34, 102, 170,
    229,  52,  92, 228,  55,  89, 235,  38, 106, 190, 217, 112, 144, 171, 230,  49,
     83, 245,   4,  12,  20,  60,  68, 204,  79, 209, 104, 184, 211, 110, 178, 205,
     76, 212, 103, 169, 224,  59,  77, 215,  98, 166, 241,   8,  24,  40, 120, 136,
    131, 158, 185, 208, 107, 189, 220, 127, 129, 152, 179, 206,  73, 219, 118, 154,
    181, 196,  87, 249,  16,  48,  80, 240,  11,  29,  39, 105, 187, 214,  97, 163,
    254,  25,  43, 125, 135, 146, 173, 236,  47, 113, 147, 174, 233,  32,  96, 160,
    251,  22,  58,  78, 210, 109, 183, 194,  93, 231,  50,  86, 250,  21,  63,  65,
    195,  94, 226,  61,  71, 201,  64, 192,  91, 237,  44, 116, 156, 191, 218, 117,
    159, 186, 213, 100, 172, 239,  42, 126, 130, 157, 188, 223, 122, 142, 137, 128,
    155, 182, 193,  88, 232,  35, 101, 175, 234,  37, 111, 177, 200,  67, 197,  84,
    252,  31,  33,  99, 165, 244,   7,   9,  27,  45, 119, 153, 176, 203,  70, 202,
     69, 207,  74, 222, 121, 139, 134, 145, 168, 227,  62,  66, 198,  81, 243,  14,
     18,  54,  90, 238,  41, 123, 141, 140, 143, 138, 133, 148, 167, 242,  13,  23,
     57,  75, 221, 124, 132, 151, 162, 253,  28,  36, 108, 180, 199,  82, 246,   1 );

  S: TArrayBox{array [0..256-1] of word8} = (
     99, 124, 119, 123, 242, 107, 111, 197,  48,   1, 103,  43, 254, 215, 171, 118,
    202, 130, 201, 125, 250,  89,  71, 240, 173, 212, 162, 175, 156, 164, 114, 192,
    183, 253, 147,  38,  54,  63, 247, 204,  52, 165, 229, 241, 113, 216,  49,  21,
      4, 199,  35, 195,  24, 150,   5, 154,   7,  18, 128, 226, 235,  39, 178, 117,
      9, 131,  44,  26,  27, 110,  90, 160,  82,  59, 214, 179,  41, 227,  47, 132,
     83, 209,   0, 237,  32, 252, 177,  91, 106, 203, 190,  57,  74,  76,  88, 207,
     208, 239, 170, 251,  67,  77,  51, 133,  69, 249,   2, 127,  80,  60, 159, 168,
      81, 163,  64, 143, 146, 157,  56, 245, 188, 182, 218,  33,  16, 255, 243, 210,
     205,  12,  19, 236,  95, 151,  68,  23, 196, 167, 126,  61, 100,  93,  25, 115,
      96, 129,  79, 220,  34,  42, 144, 136,  70, 238, 184,  20, 222,  94,  11, 219,
     224,  50,  58,  10,  73,   6,  36,  92, 194, 211, 172,  98, 145, 149, 228, 121,
     231, 200,  55, 109, 141, 213,  78, 169, 108,  86, 244, 234, 101, 122, 174,   8,
     186, 120,  37,  46,  28, 166, 180, 198, 232, 221, 116,  31,  75, 189, 139, 138,
     112,  62, 181, 102,  72,   3, 246,  14,  97,  53,  87, 185, 134, 193,  29, 158,
     225, 248, 152,  17, 105, 217, 142, 148, 155,  30, 135, 233, 206,  85,  40, 223,
     140, 161, 137,  13, 191, 230,  66, 104,  65, 153,  45,  15, 176,  84, 187,  22 );

  Si: TArrayBox{array [0..256-1] of word8} = (
     82,   9, 106, 213,  48,  54, 165,  56, 191,  64, 163, 158, 129, 243, 215, 251,
    124, 227,  57, 130, 155,  47, 255, 135,  52, 142,  67,  68, 196, 222, 233, 203,
     84, 123, 148,  50, 166, 194,  35,  61, 238,  76, 149,  11,  66, 250, 195,  78,
      8,  46, 161, 102,  40, 217,  36, 178, 118,  91, 162,  73, 109, 139, 209,  37,
    114, 248, 246, 100, 134, 104, 152,  22, 212, 164,  92, 204,  93, 101, 182, 146,
    108, 112,  72,  80, 253, 237, 185, 218,  94,  21,  70,  87, 167, 141, 157, 132,
    144, 216, 171,   0, 140, 188, 211,  10, 247, 228,  88,   5, 184, 179,  69,   6,
    208,  44,  30, 143, 202,  63,  15,   2, 193, 175, 189,   3,   1,  19, 138, 107,
     58, 145,  17,  65,  79, 103, 220, 234, 151, 242, 207, 206, 240, 180, 230, 115,
    150, 172, 116,  34, 231, 173,  53, 133, 226, 249,  55, 232,  28, 117, 223, 110,
     71, 241,  26, 113,  29,  41, 197, 137, 111, 183,  98,  14, 170,  24, 190,  27,
    252,  86,  62,  75, 198, 210, 121,  32, 154, 219, 192, 254, 120, 205,  90, 244,
     31, 221, 168,  51, 136,   7, 199,  49, 177,  18,  16,  89,  39, 128, 236,  95,
     96,  81, 127, 169,  25, 181,  74,  13,  45, 229, 122, 159, 147, 201, 156, 239,
    160, 224,  59,  77, 174,  42, 245, 176, 200, 235, 187,  60, 131,  83, 153,  97,
     23,  43,   4, 126, 186, 119, 214,  38, 225, 105,  20,  99,  85,  33,  12, 125 );

  rcon: array [0..30-1] of word32 = (
    $01,$02, $04, $08, $10, $20, $40, $80, $1b, $36, $6c,
    $d8, $ab, $4d, $9a, $2f, $5e, $bc, $63, $c6, $97, $35,
    $6a, $d4, $b3, $7d, $fa, $ef, $c5, $91 );

  shifts: array [0..3-1, 0..4-1, 0..2-1] of word8 = (
    ((0, 0),(1, 3),(2, 2),(3, 1)),
    ((0, 0),(1, 5),(2, 4),(3, 3)),
    ((0, 0),(1, 7),(3, 5),(4, 4)));

function blocksEnCrypt(cipher: PcipherInstance; key: PkeyInstance;
                      input: PByte; inputLen: integer; outBuffer: PByte): integer;
var
  i, j, t, numBlocks: integer;
  block: TArrayK;
begin
  { check parameter consistency: }
  if (not assigned(key)) or
      (key.direction <> DIR_ENCRYPT) or
      ((key.keyLen <> 128) and (key.keyLen <> 192) and (key.keyLen <> 256)) then
    begin
      result:= BAD_KEY_MAT;
      exit;
    end;

  if (not assigned(cipher)) or
     ((cipher.mode <> MODE_ECB) and (cipher.mode <> MODE_CBC) and (cipher.mode <> MODE_CFB1)) or
     ((cipher.blockLen <> 128) and (cipher.blockLen <> 192) and (cipher.blockLen <> 256)) then
    begin
      result:= BAD_CIPHER_STATE;
      exit;
    end;

  numBlocks:= inputLen div cipher.blockLen;
  case (cipher.mode) of
    MODE_ECB:
      for i:= 0 to numBlocks-1 do
        begin
          for j:= 0 to (cipher.blockLen div 32)-1 do
            for t:= 0 to 4-1 do
              { parse input stream into rectangular array }
              block[t][j]:= input[4*j+t] and $FF;
          rijndaelEncrypt(block, key.keyLen, cipher.blockLen, key.keySched);
          for j:= 0 to (cipher.blockLen div 32)-1 do
            { parse rectangular array into output ciphertext bytes }
            for t:= 0 to 4-1 do
              outBuffer[4*j+t]:= Byte(block[t][j]);
        end;
    MODE_CBC:
      begin
        for j:= 0 to (cipher.blockLen div 32)-1 do
          for t:= 0 to 4-1 do
            { parse initial value into rectangular array }
            block[t][j]:= cipher.IV[t+4*j] and $FF;
        for i:= 0 to numBlocks-1 do
          begin
            for j:= 0 to (cipher.blockLen div 32)-1 do
              for t:= 0 to 4-1 do
                { parse input stream into rectangular array and exor with
                  IV or the previous ciphertext }
//                block[t][j]:= block[t][j] xor (input[4*j+t] and $FF);                            {!original!}
                block[t][j]:= block[t][j] xor (input[(i*(cipher.blockLen div 8))+4*j+t] and $FF);  {!sergey made it!}
            rijndaelEncrypt(block, key.keyLen, cipher.blockLen, key.keySched);
            for j:= 0 to (cipher.blockLen div 32)-1 do
              { parse rectangular array into output ciphertext bytes }
              for t:= 0 to 4-1 do
//                outBuffer[4*j+t]:= Byte(block[t][j]);                                            {!original!}
                outBuffer[(i*(cipher.blockLen div 8))+4*j+t]:= Byte(block[t][j]);                  {!sergey made it!}
          end;
        end;
    else
      begin
        result:= BAD_CIPHER_STATE;
        exit
      end;
  end;
  result:= numBlocks*cipher.blockLen;
end;

function blocksDeCrypt(cipher: PcipherInstance; key: PkeyInstance; input: PByte;
                      inputLen: integer; outBuffer: PByte): integer;
var
  i, j, t, numBlocks: integer;
  block: TArrayK;
begin
  if (not assigned(cipher)) or
     (not assigned(key)) or
     (key.direction = DIR_ENCRYPT) or
     (cipher.blockLen <> key.blockLen) then
    begin
      result:= BAD_CIPHER_STATE;
      exit;
    end;

  { check parameter consistency: }
  if (not assigned(key)) or
     (key.direction <> DIR_DECRYPT) or
     ((key.keyLen <> 128) and (key.keyLen <> 192) and (key.keyLen <> 256)) then
    begin
      result:= BAD_KEY_MAT;
      exit;
    end;

  if (not assigned(cipher)) or
     ((cipher.mode <> MODE_ECB) and (cipher.mode <> MODE_CBC) and (cipher.mode <> MODE_CFB1)) or
     ((cipher.blockLen <> 128) and (cipher.blockLen <> 192) and (cipher.blockLen <> 256)) then
    begin
      result:= BAD_CIPHER_STATE;
      exit;
    end;

  numBlocks:= inputLen div cipher.blockLen;
  case (cipher.mode) of
    MODE_ECB:
      for i:= 0 to numBlocks-1 do
        begin
          for j:= 0 to (cipher.blockLen div 32)-1 do
            for t:= 0 to 4-1 do
              { parse input stream into rectangular array }
              block[t][j]:= input[4*j+t] and $FF;
          rijndaelDecrypt (block, key.keyLen, cipher.blockLen, key.keySched);
          for j:= 0 to (cipher.blockLen div 32)-1 do
            { parse rectangular array into output ciphertext bytes }
            for t:= 0 to 4-1 do
              outBuffer[4*j+t]:= Byte(block[t][j]);
        end;
    MODE_CBC:
      {! sergey has rearranged processing blocks and
        corrected exclusive-ORing operation !}

      begin
        { blocks after first }
        for i:= numBlocks-1 downto 1 do
          begin
            for j:= 0 to (cipher.blockLen div 32)-1 do
              for t:= 0 to 4-1 do
                { parse input stream into rectangular array }
                block[t][j]:= input[(i*(cipher.blockLen div 8))+ 4*j+ t] and $FF;
            rijndaelDecrypt(block, key.keyLen, cipher.blockLen, key.keySched);

            for j:= 0 to (cipher.blockLen div 32)-1 do
              { exor previous ciphertext block and parse rectangular array
                into output ciphertext bytes }
              for t:= 0 to 4-1 do
                outBuffer[(i*(cipher.blockLen div 8))+ 4*j+t]:= Byte(block[t][j] xor
                           input[(i-1)*(cipher.blockLen div 8)+ 4*j+ t]);
          end;

        { first block }
        for j:= 0 to (cipher.blockLen div 32)-1 do
          for t:= 0 to 4-1 do
            { parse input stream into rectangular array }
            block[t][j]:= input[4*j+t] and $FF;
        rijndaelDecrypt(block, key.keyLen, cipher.blockLen, key.keySched);

        for j:= 0 to (cipher.blockLen div 32)-1 do
          { exor the IV and parse rectangular array into output ciphertext bytes }
          for t:= 0 to 4-1 do
            outBuffer[4*j+t]:= Byte(block[t][j] xor cipher.IV[t+4*j]);
      end;
    else
      begin
        result:= BAD_CIPHER_STATE;
        exit;
      end;
  end;
  result:= numBlocks*cipher.blockLen;
end;
    
function iif(bExpression: boolean; iResTrue,iResFalse: integer): integer;
begin
  if bExpression then
    result:= iResTrue
  else
    result:= iResFalse;
end;

function mul(a, b: word8): word8;
{ multiply two elements of GF(2^m)
  needed for MixColumn and InvMixColumn }
begin
  if (a<>0) and (b<>0) then
    result:= Alogtable[(Logtable[a] + Logtable[b]) mod 255]
  else
    result:= 0;
end;

procedure KeyAddition(var a: TArrayK; rk: PArrayK; BC:word8);
{ Exor corresponding text input and round key input bytes }
var
  i, j: integer;
begin
  for i:= 0 to 4-1 do
    for j:= 0 to BC-1 do
      a[i][j]:= a[i][j] xor rk[i][j];
end;

procedure ShiftRow(var a: TArrayK; d, BC: word8);
{ Row 0 remains unchanged
  The other three rows are shifted a variable amount }
var
  tmp: array [0..MAXBC-1] of word8;
  i, j: integer;
begin
  for i:= 1 to 4-1 do
    begin
      for j:= 0 to BC-1 do
        tmp[j]:= a[i][(j + shifts[((BC - 4) shr 1)][i][d]) mod BC];
      for j:= 0 to BC-1 do
        a[i][j]:= tmp[j];
    end;
end;

procedure Substitution(var a: TArrayK; const box: TArrayBox; BC: word8);
{ Replace every byte of the input by the byte at that place
 in the nonlinear S-box }
var
  i, j: integer;
begin
  for i:= 0 to 4-1 do
    for j:= 0 to BC-1 do
      a[i][j]:= box[a[i][j]];
end;

procedure MixColumn(var a: TArrayK; BC: word8);
{ Mix the four bytes of every column in a linear way }
var
  b: TArrayK;
  i, j: integer;
begin
  for j:= 0 to BC-1 do
    for i:= 0 to 4-1 do
      b[i][j]:= mul(2,a[i][j])
                 xor mul(3,a[(i + 1) mod 4][j])
                 xor a[(i + 2) mod 4][j]
                 xor a[(i + 3) mod 4][j];
  for i:= 0 to 4-1 do
    for j:= 0 to BC-1 do
      a[i][j]:= b[i][j];
end;

procedure InvMixColumn(var a: TArrayK; BC: word8);
{ Mix the four bytes of every column in a linear way
  This is the opposite operation of Mixcolumn }
var
  b: TArrayK;
  i, j: integer;
begin
  for j:= 0 to BC-1 do
    for i:= 0 to 4-1 do
      b[i][j]:= mul($e,a[i][j])
                 xor mul($b,a[(i + 1) mod 4][j])
                 xor mul($d,a[(i + 2) mod 4][j])
                 xor mul($9,a[(i + 3) mod 4][j]);
  for i:= 0 to 4-1 do
    for j:= 0 to BC-1 do
      a[i][j]:= b[i][j];
end;

function rijndaelKeySched(k: TArrayK; keyBits, blockBits: integer;
              var W: TArrayRK): integer;
{ Calculate the necessary round keys
  The number of calculations depends on keyBits and blockBits }
var
  KC, BC, ROUNDS: integer;
  i, j, t, rconpointer: integer;
  tk: array [0..4-1, 0..MAXKC-1] of word8;
begin
  rconpointer:= 0;
  case (keyBits) of
    128: KC:= 4;
    192: KC:= 6;
    256: KC:= 8;
  else
    begin
      result:= -1;
      exit;
    end;
  end;

  case (blockBits) of
    128: BC:= 4;
    192: BC:= 6;
    256: BC:= 8;
  else
    begin
      result:= -2;
      exit;
    end;
  end;

  case iif(keyBits >= blockBits, keyBits, blockBits) of
    128: ROUNDS:= 10;
    192: ROUNDS:= 12;
    256: ROUNDS:= 14;
  else
    begin
      result:= -3;  {* this cannot happen *}
      exit;
    end;
  end;

  for j:= 0 to KC-1 do
    for i:= 0 to 4-1 do
      tk[i][j]:= k[i][j];

  { copy values into round key array }
  t:= 0;
  j:= 0;
  while ((j < KC) and (t < (ROUNDS+1)*BC)) do
    begin
      for i:= 0 to 4-1 do
        W[t div BC][i][t mod BC]:= tk[i][j];
      inc(j);
      inc(t);
    end;

  while (t < (ROUNDS+1)*BC) do { while not enough round key material calculated }
    begin
      { calculate new values }
      for i:= 0 to 4-1 do
        tk[i][0]:= tk[i][0] xor S[tk[(i+1) mod 4][KC-1]];
      tk[0][0]:= tk[0][0] xor rcon[rconpointer];
      inc(rconpointer);
      if (KC <> 8) then
        begin
          for j:= 1 to KC-1 do
            for i:= 0 to 4-1 do
              tk[i][j]:= tk[i][j] xor tk[i][j-1];
        end
      else
        begin
          j:= 1;
          while j < KC/2 do
            begin
              for i:= 0 to 4-1 do
                tk[i][j]:= tk[i][j] xor tk[i][j-1];
              inc(j);
            end;
          for i:= 0 to 4-1 do
            tk[i][KC div 2]:= tk[i][KC div 2] xor S[tk[i][(KC div 2) - 1]];
          j:= (KC div 2) + 1;
          while j < KC do
            begin
              for i:= 0 to 4-1 do
                tk[i][j]:= tk[i][j] xor tk[i][j-1];
              inc(j);
            end;
        end;

      { copy values into round key array }
      j:= 0;
      while ((j < KC) and (t < (ROUNDS+1)*BC)) do
        begin
          for i:= 0 to 4-1 do
            W[t div BC][i][t mod BC]:= tk[i][j];
          inc(j);
          inc(t);
        end;
    end;
  result:= 0;
end;

function rijndaelEncrypt(var a: TArrayK; keyBits, blockBits: integer; rk: TArrayRK): integer;
{ Encryption of one block. }
var
  r, BC, ROUNDS: integer;
begin
  case (blockBits) of
    128: BC:= 4;
    192: BC:= 6;
    256: BC:= 8;
  else
    begin
      result:= -2;
      exit;
    end;
  end;

  case iif(keyBits >= blockBits, keyBits, blockBits) of
    128: ROUNDS:= 10;
    192: ROUNDS:= 12;
    256: ROUNDS:= 14;
  else
    begin
      result:= -3; { this cannot happen }
      exit;
    end;
  end;

  { begin with a key addition }
  KeyAddition(a,addr(rk[0]),BC);

  { ROUNDS-1 ordinary rounds }
  for r:= 1 to ROUNDS-1 do
    begin
      Substitution(a,S,BC);
      ShiftRow(a,0,BC);
      MixColumn(a,BC);
      KeyAddition(a,addr(rk[r]),BC);
    end;

  { Last round is special: there is no MixColumn }
  Substitution(a,S,BC);
  ShiftRow(a,0,BC);
  KeyAddition(a,addr(rk[ROUNDS]),BC);
  result:= 0;
end;

function rijndaelEncryptRound(var a: TArrayK; keyBits, blockBits: integer;
                  rk: TArrayRK; var irounds: integer): integer;
{ Encrypt only a certain number of rounds.
  Only used in the Intermediate Value Known Answer Easy. }
var
  r, BC, ROUNDS: integer;
begin
  case (blockBits) of
    128: BC:= 4;
    192: BC:= 6;
    256: BC:= 8;
   else
     begin
       result:= -2;
       exit;
     end;
   end;

   case iif(keyBits >= blockBits, keyBits, blockBits) of
     128: ROUNDS:= 10;
     192: ROUNDS:= 12;
     256: ROUNDS:= 14;
   else
     begin
       result:= -3; { this cannot happen }
       exit;
     end;
   end;

  { make number of rounds sane }
  if (irounds > ROUNDS) then
    irounds:= ROUNDS;

  { begin with a key addition }
  KeyAddition(a,addr(rk[0]),BC);

  { at most ROUNDS-1 ordinary rounds }
  r:= 1;
  while (r <= irounds) and (r < ROUNDS) do
    begin
      Substitution(a,S,BC);
      ShiftRow(a,0,BC);
      MixColumn(a,BC);
      KeyAddition(a,addr(rk[r]),BC);
      inc(r);
    end;

  { if necessary, do the last, special, round: }
  if (irounds = ROUNDS) then
    begin
      Substitution(a,S,BC);
      ShiftRow(a,0,BC);
      KeyAddition(a,addr(rk[ROUNDS]),BC);
    end;

  result:= 0;
end;

function rijndaelDecrypt(var a: TArrayK; keyBits, blockBits: integer; rk: TArrayRK): integer;
var
  r, BC, ROUNDS: integer;
begin

  case (blockBits) of
    128: BC:= 4;
    192: BC:= 6;
    256: BC:= 8;
  else
    begin
      result:= -2;
      exit;
    end;
  end;

  case iif(keyBits >= blockBits, keyBits, blockBits) of
    128: ROUNDS:= 10;
    192: ROUNDS:= 12;
    256: ROUNDS:= 14;
  else
    begin
      result:= -3; { this cannot happen }
      exit;
    end;
  end;

  { To decrypt: apply the inverse operations of the encrypt routine,
    in opposite order

    (KeyAddition is an involution: it 's equal to its inverse)
    (the inverse of Substitution with table S is Substitution with the inverse table of S)
    (the inverse of Shiftrow is Shiftrow over a suitable distance) }

  { First the special round:
    without InvMixColumn
    with extra KeyAddition }
  KeyAddition(a,addr(rk[ROUNDS]),BC);
  Substitution(a,Si,BC);
  ShiftRow(a,1,BC);

  { ROUNDS-1 ordinary rounds }
  for r:= ROUNDS-1 downto 0+1 do
    begin
      KeyAddition(a,addr(rk[r]),BC);
      InvMixColumn(a,BC);
      Substitution(a,Si,BC);
      ShiftRow(a,1,BC);
    end;

  { End with the extra key addition }

  KeyAddition(a,addr(rk[0]),BC);
  result:= 0;
end;

function rijndaelDecryptRound(var a: TArrayK; keyBits, blockBits: integer;
                        rk: TArrayRK; var irounds: integer): integer;
{ Decrypt only a certain number of rounds.
  Only used in the Intermediate Value Known Answer Easy.
  Operations rearranged such that the intermediate values
  of decryption correspond with the intermediate values
  of encryption. }
var
  r, BC, ROUNDS: integer;
begin
  case (blockBits) of
    128: BC:= 4;
    192: BC:= 6;
    256: BC:= 8;
  else
    begin
      result:= -2;
      exit;
    end;
  end;

  case iif(keyBits >= blockBits, keyBits, blockBits) of
    128: ROUNDS:= 10;
    192: ROUNDS:= 12;
    256: ROUNDS:= 14;
  else
    begin
      result:= -3; { this cannot happen }
      exit;
    end;
  end;

  { make number of rounds sane }
  if (irounds > ROUNDS) then
    irounds:= ROUNDS;

  { First the special round:
    without InvMixColumn
    with extra KeyAddition }

  KeyAddition(a,addr(rk[ROUNDS]),BC);
  Substitution(a,Si,BC);
  ShiftRow(a,1,BC);

  { ROUNDS-1 ordinary rounds }
  for r:= ROUNDS-1 downto irounds+1 do
    begin
      KeyAddition(a,addr(rk[r]),BC);
      InvMixColumn(a,BC);
      Substitution(a,Si,BC);
      ShiftRow(a,1,BC);
    end;

  if (irounds = 0) then
    { End with the extra key addition }
    KeyAddition(a,addr(rk[0]),BC);

  result:= 0;
end;

function _makeKey(key: PkeyInstance; direction: Byte; keyLen: integer; keyMaterial: pAnsichar): integer;
var
  k: TArrayK;
  i, j, t: integer;
begin
  if not assigned(key) then
    begin
      result:= BAD_KEY_INSTANCE;
      exit;
    end;

  if ((direction = DIR_ENCRYPT) or (direction = DIR_DECRYPT)) then
    key.direction:= direction
  else
    begin
      result:= BAD_KEY_DIR;
      exit;
    end;

  if ((keyLen = 128) or (keyLen = 192) or (keyLen = 256)) then
    key.keyLen:= keyLen
  else
    begin
      result:= BAD_KEY_MAT;
      exit;
    end;

  if (keyMaterial^ <> #0) then
    StrLCopy(key.keyMaterial, keyMaterial, keyLen div 4);  // strncpy

  j := 0;
  { initialize key schedule: }
  for i:= 0 to (key.keyLen div 8)-1 do
    begin
      t:= integer(key.keyMaterial[2*i]);
      if ((t >= ord('0')) and (t <= ord('9'))) then
        j:= (t - ord('0')) shl 4
      else
        if ((t >= ord('a')) and (t <= ord('f'))) then
          j:= (t - ord('a') + 10) shl 4
        else
          if ((t >= ord('A')) and (t <= ord('F'))) then
            j:= (t - ord('A') + 10) shl 4
          else
            begin
              result:= BAD_KEY_MAT;
              exit;
            end;

      t:= integer(key.keyMaterial[2*i+1]);
      if ((t >= ord('0')) and (t <= ord('9'))) then
        j:= j xor (t - ord('0'))
      else
        if ((t >= ord('a')) and (t <= ord('f'))) then
          j:= j xor (t - ord('a') + 10)
        else
          if ((t >= ord('A')) and (t <= ord('F'))) then
            j:= j xor (t - ord('A') + 10)
          else
            begin
              result:= BAD_KEY_MAT;
              exit;
            end;

      k[i mod 4][i div 4]:= word8(j);
    end;
  rijndaelKeySched(k, key.keyLen, key.blockLen, key.keySched);
  result:= rTRUE;
end;

function EnCryptString(const sMessage: AnsiString; sKeyMaterial: AnsiString): AnsiString;
var
  sres: Ansistring;
  blockLength,i: integer;
  keyInst: TkeyInstance;
  cipherInst: TcipherInstance;
begin
  keyInst.blockLen:= BITSPERBLOCK;
  sres:= ExpandKey(sKeyMaterial,_KEYLength);
  if _makeKey(addr(keyInst), DIR_ENCRYPT, _KEYLength, pAnsichar(sres))<> rTRUE then
    raise Exception.CreateFmt('Key error.',[-1]);
  cipherInst.blockLen:= BITSPERBLOCK;
  cipherInst.mode:= MODE_CBC;
  FillChar(cipherInst.IV,sizeof(cipherInst.IV),0);

  sres:= sMessage;
  blockLength:= length(sres)*8;
  if (blockLength mod BITSPERBLOCK)<> 0 then
    begin
      for i:= 1 to ((BITSPERBLOCK-(blockLength-(BITSPERBLOCK*(blockLength div BITSPERBLOCK)))) div 8) do
        sres:= sres+ ' ';
      blockLength:= length(sres)*8;
    end;

  if blocksEnCrypt(addr(cipherInst), addr(keyInst), addr(sres[1]), blockLength, addr(sres[1]))<> blockLength then
    raise Exception.CreateFmt('EnCrypt error.',[-2]);
  result:= sres;
end;

function DeCryptString(const sMessage: AnsiString; sKeyMaterial: AnsiString): AnsiString;
var
  sres: AnsiString;
  blockLength: integer;
  keyInst: TkeyInstance;
  cipherInst: TcipherInstance;
begin
  keyInst.blockLen:= BITSPERBLOCK;
  sres:= ExpandKey(sKeyMaterial,_KEYLength);
  if _makeKey(addr(keyInst), DIR_DECRYPT, _KEYLength, pAnsichar(sres))<> rTRUE then
    raise Exception.CreateFmt('Key error.',[-1]);
  cipherInst.blockLen:= BITSPERBLOCK;
  cipherInst.mode:= MODE_CBC;
  FillChar(cipherInst.IV,sizeof(cipherInst.IV),0);

  sres:= sMessage;
  blockLength:= length(sres)*8;
  if (blockLength= 0) or ((blockLength mod BITSPERBLOCK)<> 0) then
    raise Exception.CreateFmt('Wrong message length.',[-4]);

  if blocksDeCrypt(addr(cipherInst), addr(keyInst), addr(sres[1]), blockLength, addr(sres[1]))<> blockLength then
    raise Exception.CreateFmt('DeCrypt error.',[-3]);
  result:= AnsiString(trim(String(sres)));
end;

function ExpandKey(sKey: Ansistring; iLength: integer): AnsiString;
var
  ikey: array [0..(_KEYLength div 8)-1] of byte;
  i,t: integer;
  sr: Ansistring;
begin
  sr:= sKey;
  FillChar(ikey,sizeof(ikey),0);
  try
    if (length(sr) mod 2)<> 0 then
      sr:= sr+ '0';
    t:= length(sr) div 2;
    if t> (iLength div 8) then
      t:= (iLength div 8);
    for i:= 0 to t-1 do
      ikey[i]:= strtoint('$'+String(sr[i*2+1]) + String(sr[i*2+2]));
  except
  end;
  sr:= '';
  for i:= 0 to (iLength div 8)-1 do
    sr:= sr + AnsiString(IntToHex(ikey[i],2));
  result:= sr;
end;

function MakeKey(const Key: AnsiString): AnsiString;
begin
  Result := '';
  if (Key <> '') then
  begin
    SetLength(Result, Length(Key) * 2);
    BinToHex(PAnsiChar(@Key[1]), PAnsiChar(@Result[1]), Length(Key));
  end;
  Result := ExpandKey(Result, _KEYLength);
end;

procedure EasyCryptStream(Source, Dest: TStream; const Key: AnsiString);
var
  s: AnsiString;
  header: array [0..2] of byte;
begin
  Source.Position := 0;
  SetLength(s, Source.Size);
  Source.Read(s[1], Source.Size);

  s := EncryptString(s, MakeKey(Key));

  header[0] := Ord('r');
  header[1] := Ord('i');
  header[2] := Ord('j');
  Dest.Write(header, 3);
  Dest.Write(s[1], Length(s));
end;

procedure EasyDecryptStream(Source, Dest: TStream; const Key: AnsiString);
var
  s: AnsiString;
begin
  SetLength(s, Source.Size);
  Source.Read(s[1], Source.Size);

  if (s <> '') and (s[1] = 'r') and (s[2] = 'i') and (s[3] = 'j') then
  begin
    Delete(s, 1, 3);
    s := DecryptString(s, MakeKey(Key));
  end;

  Dest.Write(s[1], Length(s));
end;

{ TEasyCustomCrypter }

constructor TEasyCustomCrypter.Create(AOwner: TComponent);
begin
  inherited;
//  EasyCrypterClass := TEasyCrypterClass(ClassType);
end;

destructor TEasyCustomCrypter.Destroy;
begin
  if FStream <> nil then
    FStream.Free;
  inherited;
end;

procedure TEasyCustomCrypter.CreaEasyream;
begin
  FStream := TMemoryStream.Create;
end;

{ TEasyCrypt }

function TEasyCrypt.AskKey(const Key: AnsiString): AnsiString;
begin
  Result := Key;
  {if Result = '' then
    with TfrmEasyCryptPassw.Create(Application) do
    begin
      if ShowModal = mrOk then
        Result :=  AnsiString(PasswordE.Text);
      Free;
    end;}
end;

procedure TEasyCrypt.Crypt(Dest: TStream; const Key: AnsiString);
begin
  EasyCryptStream(Stream, Dest, Key);
end;

function TEasyCrypt.Decrypt(Source: TStream; const Key: AnsiString): Boolean;
var
  Signature: array[0..2] of Byte;
begin
  Source.Read(Signature, 3);
  Source.Seek(-3, soFromCurrent);
  Result := (Signature[0] = Ord('r')) and (Signature[1] = Ord('i')) and (Signature[2] = Ord('j'));
  if Result then
    EasyDecryptStream(Source, Stream, AskKey(Key));
  Stream.Position := 0;
end;

end.
