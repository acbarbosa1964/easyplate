
/*==============================================================*/
/* Table: sysReportDtl                                          */
/*==============================================================*/
create table sysReportDtl (
   DataSetGUID          varchar(50)          not null,
   ReportGUID           varchar(50)          not null,
   DataSetCName         varchar(100)         not null,
   DataSetEName         varchar(100)         not null,
  -- DataSetAliasesName   varchar(100)         not null,
   CommandText          varchar(4000)        not null,
   IsEnable             bit                  not null default 1,
   OrderNo               int                  null default 0,
   constraint PK_SYSREPORTDTL primary key (DataSetGUID)
)
go


/*==============================================================*/
/* Index: Index_DataSetCName                                    */
/*==============================================================*/
create unique index Index_DataSetCName on sysReportDtl (
DataSetGUID ASC, DataSetCName ASC
)
go

DROP INDEX Index_DataSetCName ON sysReportDtl
/*==============================================================*/
/* Index: Index_DataSetEName                                    */
/*==============================================================*/
create unique index Index_DataSetEName on sysReportDtl (
DataSetGUID ASC, DataSetEName ASC
)
go
DROP INDEX Index_DataSetEName ON sysReportDtl

create unique index Index_GUID on sysReportDtl (
DataSetGUID ASC, ReportGUID ASC
)
go

ALTER TABLE sysReportDtl 
ADD CONSTRAINT FK_ReportGUID FOREIGN KEY (ReportGUID)
 REFERENCES sysReportMain(ReportGUID)
 
 ALTER TABLE sysReportDtl DROP COLUMN DataSetAliasesName
 