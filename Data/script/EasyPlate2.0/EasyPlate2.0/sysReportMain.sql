/*==============================================================*/
/* Table: sysReportMain                                         */
/*==============================================================*/
create table sysReportMain (
   ReportGUID           varchar(50)          not null,
   ReportCName          varchar(100)         not null,
   ReportEName          varchar(100)         not null,
   FormID               varchar(50)          not null,
   ReportFile           iMAGE                not null,
   IsEnable             bit                  not null default 1,
   IsDefault            bit                  not null default 0,
   OrderNo               int                  null default 0,
   constraint PK_SYSREPORTMAIN primary key (ReportGUID)
)
go

/*==============================================================*/
/* Index: Index_ReportCName                                     */
/*==============================================================*/
create unique index Index_ReportCName on sysReportMain (
ReportCName ASC
)
go

/*==============================================================*/
/* Index: Index_ReportEName                                     */
/*==============================================================*/
create unique index Index_ReportEName on sysReportMain (
ReportEName ASC
)
go

create unique index Index_ReportGUID on sysReportMain (
ReportGUID ASC, FormID ASC
)
go
/*
ALTER TABLE sysReportMain DROP COLUMN ReportFileGUID
DROP TABLE sysReportFile
DROP TABLE sysReportDtl
DROP TABLE sysReportMain
sysReportDtl.sql*/