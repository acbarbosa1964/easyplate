/*==============================================================*/
/* Table: sysUnit                                               */
/*==============================================================*/
create table dbo.sysUnit (
   UnitGUID               varchar(50)          not null,
   UnitCName            varchar(50)          not null,
   UnitEName            varchar(50)          null,
   ParentUnitGUID         varchar(50)          not null,
   bEnable              bit                  not null default 1,
   fRatio               float                not null,
   OrderNO             INT                  DEFAULT 0,
   Remark              varchar(255)         null,
   constraint PK_SYSUNIT primary key nonclustered (UnitGUID)
)
go

/*==============================================================*/
/* Index: Index_UnitID                                          */
/*==============================================================*/
create unique index Index_UnitID on dbo.sysUnit (
UnitGUID ASC
)
go

/*==============================================================*/
/* Index: Index_UnitCName                                       */
/*==============================================================*/
create unique index Index_UnitCName on dbo.sysUnit (
UnitCName ASC
)
go

/*==============================================================*/
/* Index: Index_UnitEName                                       */
/*==============================================================*/
create unique index Index_UnitEName on dbo.sysUnit (
UnitEName ASC
)
go
