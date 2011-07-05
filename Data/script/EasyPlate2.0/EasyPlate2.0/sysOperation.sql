/*==============================================================*/
/* Table:sysOperation                                          */
/*==============================================================*/
create table sysOperation (
   OperationGUID          varchar(50)          not null,
   OperationName          varchar(50)          not null,
   constraint PK_SYSOPERATION primary key (OperationGUID)
)
go

/*==============================================================*/
/* Index: Index_Operation                                       */
/*==============================================================*/
create index Index_Operation on sysOperation (
OperationName ASC
)
go
