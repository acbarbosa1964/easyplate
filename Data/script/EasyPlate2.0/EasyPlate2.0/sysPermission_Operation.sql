/*==============================================================*/
/* Table: sysPermission_Operation                               */
/*==============================================================*/
create table sysPermission_Operation (
   GUID                 varchar(50)          not null,
   PermissionGUID       varchar(50)          not null,
   OperationGUID        varchar(50)          not null,
   constraint PK_SYSPERMISSION_OPERATION primary key (GUID)
)
go

/*==============================================================*/
/* Index: Index_Permission_Operation                            */
/*==============================================================*/
create index Index_Permission_Operation on sysPermission_Operation (
OperationGUID ASC,
PermissionGUID ASC
)
go

--Íâ¼üÔ¼Êø
ALTER TABLE sysPermission_Operation 
	ADD CONSTRAINT FK_Permission_Operation_Permission_GUID FOREIGN KEY(PermissionGUID)
	REFERENCES sysPermission(PermissionGUID)
	
ALTER TABLE sysPermission_Operation 
	ADD CONSTRAINT FK_Permission_Operation_Operation_GUID FOREIGN KEY(OperationGUID)
	REFERENCES sysOperation(OperationGUID)
