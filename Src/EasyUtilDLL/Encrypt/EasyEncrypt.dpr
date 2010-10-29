library EasyEncrypt;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  SysUtils,
  Classes,
  untEIAES in 'untEIAES.pas',
  untAES in 'untAES.pas',
  untMD5 in 'untMD5.pas',
  untBase64 in 'untBase64.pas',
  untCRC16 in 'untCRC16.pas',
  untCRC32 in 'untCRC32.pas';

{$R *.res}
  exports
    //DES
    StrToHex,
    HexToStr,
    EncryptString,
    DecryptString,
    EncryptStream,
    DecryptStream,
    EncryptFile,
    DecryptFile,
    //MD5
    transfer,
    GetCode,
    //Base64
    StrToBase64,
    Base64ToStr,
    //CRC16
    CalcCRC16,
    CalcFileCRC16,
    //CRC32
    CalcCRC32,
    CalcFileCRC32;

begin
end.
