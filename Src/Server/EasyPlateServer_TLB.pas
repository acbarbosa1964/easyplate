unit EasyPlateServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2011-1-20 13:37:31 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\MyProject\E1Dev\Src\Server\EasyPlateServer.tlb (1)
// LIBID: {68108DF3-F50C-4562-B427-FCFD5C7DC626}
// LCID: 0
// Helpfile: 
// HelpString: EasyPlateServer Library
// DepndLst: 
//   (1) v1.0 Midas, (E:\0Hg\客维护记录\1、福州明视\Client_fz\Client\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  EasyPlateServerMajorVersion = 1;
  EasyPlateServerMinorVersion = 0;

  LIBID_EasyPlateServer: TGUID = '{68108DF3-F50C-4562-B427-FCFD5C7DC626}';

  IID_IRDMEasyPlateServer: TGUID = '{B7C21EDC-8A63-4176-9AEF-44D70F179AA5}';
  CLASS_RDMEasyPlateServer: TGUID = '{4F1AC7AF-01E3-46AC-BB37-7C11C2D3B5E3}';
  CLASS_RDMEasyPlatePoolerServer: TGUID = '{33D7ABF2-98E8-4EB8-933A-65CC6E3DF6B1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRDMEasyPlateServer = interface;
  IRDMEasyPlateServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RDMEasyPlateServer = IRDMEasyPlateServer;
  RDMEasyPlatePoolerServer = IRDMEasyPlateServer;


// *********************************************************************//
// Interface: IRDMEasyPlateServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B7C21EDC-8A63-4176-9AEF-44D70F179AA5}
// *********************************************************************//
  IRDMEasyPlateServer = interface(IAppServer)
    ['{B7C21EDC-8A63-4176-9AEF-44D70F179AA5}']
    function EasyGetRDMData(const ASQL: WideString): OleVariant; safecall;
    function EasySaveRDMData(const ATableName: WideString; ADelta: OleVariant; 
                             const AKeyField: WideString; AMaxErrors: SYSINT): OleVariant; safecall;
    function EasySaveRDMDatas(ATableNameOLE: OleVariant; ADelta: OleVariant; 
                              AKeyFieldOLE: OleVariant; AMaxErrors: SYSINT): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDMEasyPlateServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B7C21EDC-8A63-4176-9AEF-44D70F179AA5}
// *********************************************************************//
  IRDMEasyPlateServerDisp = dispinterface
    ['{B7C21EDC-8A63-4176-9AEF-44D70F179AA5}']
    function EasyGetRDMData(const ASQL: WideString): OleVariant; dispid 301;
    function EasySaveRDMData(const ATableName: WideString; ADelta: OleVariant; 
                             const AKeyField: WideString; AMaxErrors: SYSINT): OleVariant; dispid 302;
    function EasySaveRDMDatas(ATableNameOLE: OleVariant; ADelta: OleVariant; 
                              AKeyFieldOLE: OleVariant; AMaxErrors: SYSINT): OleVariant; dispid 303;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoRDMEasyPlateServer provides a Create and CreateRemote method to          
// create instances of the default interface IRDMEasyPlateServer exposed by              
// the CoClass RDMEasyPlateServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDMEasyPlateServer = class
    class function Create: IRDMEasyPlateServer;
    class function CreateRemote(const MachineName: string): IRDMEasyPlateServer;
  end;

// *********************************************************************//
// The Class CoRDMEasyPlatePoolerServer provides a Create and CreateRemote method to          
// create instances of the default interface IRDMEasyPlateServer exposed by              
// the CoClass RDMEasyPlatePoolerServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDMEasyPlatePoolerServer = class
    class function Create: IRDMEasyPlateServer;
    class function CreateRemote(const MachineName: string): IRDMEasyPlateServer;
  end;

implementation

uses ComObj;

class function CoRDMEasyPlateServer.Create: IRDMEasyPlateServer;
begin
  Result := CreateComObject(CLASS_RDMEasyPlateServer) as IRDMEasyPlateServer;
end;

class function CoRDMEasyPlateServer.CreateRemote(const MachineName: string): IRDMEasyPlateServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDMEasyPlateServer) as IRDMEasyPlateServer;
end;

class function CoRDMEasyPlatePoolerServer.Create: IRDMEasyPlateServer;
begin
  Result := CreateComObject(CLASS_RDMEasyPlatePoolerServer) as IRDMEasyPlateServer;
end;

class function CoRDMEasyPlatePoolerServer.CreateRemote(const MachineName: string): IRDMEasyPlateServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDMEasyPlatePoolerServer) as IRDMEasyPlateServer;
end;

end.
