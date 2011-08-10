
/*==============================================================*/
/* Table: sysReportDtl                                          */
/*==============================================================*/
create table sysReportDtl (
   DataSetGUID          varchar(50)          not null,
   ReportGUID           varchar(50)          not null,
   DataSetCName         varchar(100)         not null,
   DataSetEName         varchar(100)         not null,
   CommandText          varchar(4000)        not null,
   IsEnable             bit                  not null default 1,
   iOrder               int                  null default 0,
   constraint PK_SYSREPORTDTL primary key (DataSetGUID)
)
go


/*==============================================================*/
/* Index: Index_DataSetCName                                    */
/*==============================================================*/
create unique index Index_DataSetCName on sysReportDtl (
DataSetCName ASC
)
go

/*==============================================================*/
/* Index: Index_DataSetEName                                    */
/*==============================================================*/
create unique index Index_DataSetEName on sysReportDtl (
DataSetEName ASC
)
go