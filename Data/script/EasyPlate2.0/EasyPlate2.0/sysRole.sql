/*==============================================================*/
/* Table: sysRole                                               */
/*==============================================================*/
create table sysRole (
   RoleGUID             varchar(50)          not null,
   RoleName             varchar(100)         not null,
   DeptGUID             varchar(50)          null,
   ParentRoleGUID       varchar(50)          null,
   Discription          varchar(255)         null,
   iOrder               int                  null,
   constraint PK_SYSROLE primary key (RoleGUID)
)
go

/*==============================================================*/
/* Index: Index_RoleGUID                                        */
/*==============================================================*/
create index Index_RoleGUID on sysRole (
RoleGUID ASC
)
go