
/*==============================================================*/
/* Table: sysReportFile                                         */
/*==============================================================*/
create table sysReportFile (
   ReportFileGUID       varchar(50)          not null,
   ReportFileCName      varchar(100)         not null,
   ReportFileEName      varchar(100)         not null,
   ReportFile           text                 not null,
   IsEnable             bit                  not null default 1,
   constraint PK_SYSREPORTFILE primary key (ReportFileGUID)
)
go


/*==============================================================*/
/* Index: Index_ReportFileCName                                 */
/*==============================================================*/
create unique index Index_ReportFileCName on sysReportFile (
ReportFileCName ASC
)
go

/*==============================================================*/
/* Index: Index_ReportFileEName                                 */
/*==============================================================*/
create unique index Index_ReportFileEName on sysReportFile (
ReportFileEName ASC
)
go