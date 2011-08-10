/*==============================================================*/
/* Table: SysConst                                              */
/*==============================================================*/
create table SysConst (
   ConstGUID            varchar(50)          not null,
   CName                varchar(50)          null,
   EName                varchar(50)          not null,
   Value                varchar(100)         not null,
   CreateTime           datetime             null,
   Creater              varchar(50)          null,
   Updater              varchar(50)          null,
   UpdateTime           datetime             null,
   constraint PK_SYSCONST primary key (ConstGUID)
)
go
/*==============================================================*/
/* Index: Index_ConstCName                                      */
/*==============================================================*/
create unique index Index_ConstCName on SysConst (
CName ASC
)
go

/*==============================================================*/
/* Index: Index_ConstEName                                      */
/*==============================================================*/
create unique index Index_ConstEName on SysConst (
EName ASC
)
go

alter table SysConst
   add constraint FK_SYSCONST_REFERENCE_CREATER foreign key (Creater)
      references dbo.hrEmployee (EmployeeGUID)
go

alter table SysConst
   add constraint FK_SYSCONST_REFERENCE_UPDATER foreign key (Updater)
      references dbo.hrEmployee (EmployeeGUID)
go