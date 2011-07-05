/*==============================================================*/
/* Table: sysUser                                               */
/*==============================================================*/
create table sysUser (
   UserGUID             varchar(50)          not null,
   UserName             varchar(30)          not null,
   PassWord             varchar(30)          not null,
   EmployeeGUID         varchar(50)          not null,
   IsEnable             bit                  not null default 0,
   EndDate              datetime             not null,
   RoleGUID             varchar(50)          not null,
   CreateTime           datetime             not null,
   CreaterGUID          varchar(50)          not null,
   constraint PK_SYSUSER primary key nonclustered (UserGUID),
   constraint AK_KEY_SYSUSERS_SYSUSER unique (UserGUID)
)
go

/*==============================================================*/
/* Index: Index_Users                                           */
/*==============================================================*/
create index Index_Users on sysUser (
UserGUID ASC,
UserName ASC,
EmployeeGUID ASC
)
go

alter table sysUser
   add constraint FK_SYSUSER_REFERENCE_HREMPLOY foreign key (EmployeeGUID)
      references dbo.hrEmployee (EmployeeGUID)
go
