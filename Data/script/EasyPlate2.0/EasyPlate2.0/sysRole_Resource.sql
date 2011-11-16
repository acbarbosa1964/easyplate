/*==============================================================*/
/* Table: sysRole_Resource                                      */
/*==============================================================*/
create table sysRole_Resource (
   GUID                 VARCHAR(50)          not null,
   RoleGUID             VARCHAR(50)          not null,
   ResourceGUID         VARCHAR(50)          not null,
   constraint PK_SYSROLE_RESOURCE primary key (GUID)
)
go

/*==============================================================*/
/* Index: Index_RoleGUID                                        */
/*==============================================================*/
create index Index_RoleGUID on sysRole_Resource (
RoleGUID ASC,
ResourceGUID ASC
)
go

alter table sysRole_Resource
   add constraint FK_SYSROLEGUID foreign key (RoleGUID)
      references sysRole (RoleGUID)
go

alter table sysRole_Resource
   add constraint FK_SYSRESOURCEGUID foreign key (ResourceGUID)
      references sysResource (ResourceGUID)
go