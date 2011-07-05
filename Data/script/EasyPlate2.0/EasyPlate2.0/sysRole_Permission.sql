/*==============================================================*/
/* Table: sysRole_Permission                                    */
/*==============================================================*/
create table sysRole_Permission (
   GUID                 varchar(50)          not null,
   RoleGUID             varchar(50)          not null,
   PermissionGUID       varchar(50)          not null,
   constraint PK_SYSROLE_PERMISSION primary key (GUID)
)
go

/*==============================================================*/
/* Index: Index_Role_Permission                                 */
/*==============================================================*/
create index Index_Role_Permission on sysRole_Permission (
PermissionGUID ASC,
RoleGUID ASC
)
go

--Íâ¼üÔ¼Êø
ALTER TABLE sysRole_Permission
	ADD CONSTRAINT FK_Role_Permission_ROLE_GUID FOREIGN KEY(RoleGUID)
	REFERENCES sysRole(RoleGUID) 
	
ALTER TABLE sysRole_Permission
	ADD CONSTRAINT FK_Role_Permission_Permission_GUID FOREIGN KEY(PermissionGUID)
	REFERENCES sysPermission(PermissionGUID) 