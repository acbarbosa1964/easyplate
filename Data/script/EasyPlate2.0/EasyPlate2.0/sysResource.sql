/*==============================================================*/
/* Table: sysResource                                           */
/*==============================================================*/
create table sysResource (
   ResourceID           varchar(50)          not null,
   ParentResourceGUID   varchar(50)          not null,
   ResourceName         varchar(50)          not null,
   constraint PK_SYSRESOURCE primary key (ResourceID)
)
go

/*==============================================================*/
/* Index: Index_Operation                                       */
/*==============================================================*/
create index Index_Operation on sysResource (
ResourceID ASC
)
go

/*==============================================================*/
/* Index: Index_Resource                                        */
/*==============================================================*/
create index Index_Resource on sysResource (
ResourceName ASC
)
go