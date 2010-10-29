library EasyCalendar;

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
  untCalendar in 'untCalendar.pas';

{$R *.res}
  exports
    WeekDay,
//    WeekNum,
    WeekNum(const   TDT:TDateTime) name 'WeekNum_A',
    WeekNum(const   iYear,iMonth,iDay:Word) name 'WeekNum_B',
    MonthDays,
    LunarMonthDays,
    LunarYearDays,
    GetLeapMonth,
//    FormatLunarYear,
    FormatLunarYear(iYear:Word;var   pBuffer:string) name 'FormatLunarYear_A',
    FormatLunarYear(iYear:Word) name 'FormatLunarYear_B',
//    FormatMonth,
    FormatMonth(iMonth:Word; var pBuffer: string;bLunar:Boolean=True) name 'FormatMonth_A',
    FormatMonth(iMonth:Word;bLunar:Boolean=True) name 'FormatMonth_B',
//    FormatLunarDay,
    FormatLunarDay(iDay:Word;var   pBuffer:string) name 'FormatLunarDay_A',
    FormatLunarDay(iDay:Word) name 'FormatLunarDay_B',
//    CalcDateDiff,
    CalcDateDiff(iEndYear,iEndMonth,iEndDay:Word;iStartYear:Word=START_YEAR;
             iStartMonth:Word=1;iStartDay:Word=1) name 'CalcDateDiff_A',
    CalcDateDiff(EndDate,StartDate:TDateTime) name 'CalcDateDiff_B',
//    GetLunarDate,
    GetLunarDate(iYear,iMonth,iDay:Word;
             var iLunarYear,iLunarMonth,iLunarDay:Word) name 'GetLunarDate_A',
    GetLunarDate(InDate:TDateTime;
             var iLunarYear,iLunarMonth,iLunarDay:Word) name 'GetLunarDate_B',
//    GetLunarHolDay,
    GetLunarHolDay(InDate:TDateTime) name 'GetLunarHolDay_A',
    GetLunarHolDay(iYear,iMonth,iDay:Word) name 'GetLunarHolDay_B',
    l_CalcLunarDate,
    l_GetLunarHolDay;

begin
end.
