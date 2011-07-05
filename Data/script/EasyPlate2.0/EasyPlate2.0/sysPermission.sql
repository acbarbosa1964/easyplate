
/*==============================================================*/
/* Table: sysPermission                                         */
/*==============================================================*/
create table sysPermission (
   PermissionGUID       varchar(50)          not null,
   PermissionName       varchar(50)          not null,
   constraint PK_SYSPERMISSION primary key (PermissionGUID)
)
go

/*==============================================================*/
/* Index: Index_PermissionGUID                                  */
/*==============================================================*/
create index Index_PermissionGUID on sysPermission (
PermissionGUID ASC
)
go