/*==============================================================*/
/* Table: sysResource                                         */
/*==============================================================*/
create table sysResource (
   ResourceGUID           varchar(50)          not null,
   FormID               varchar(50)          not null,
   ControlID            varchar(50)          not null,
   constraint PK_SYSRESOURCE primary key (ResourceGUID)
)
go

/*==============================================================*/
/* Index: Index_Operation                                       */
/*==============================================================*/
create index Index_Operation on sysResource (
ResourceGUID ASC
)
go

CREATE INDEX Index_Res_FormID ON sysResource(FormID);

/*==============================================================*/
/* Index: Index_Resource                                        */
/*==============================================================*/
create index Index_Resource on sysResource (
ControlID ASC
)
go
select * from sysResource
DELETE from sysResource
ALTER TABLE sysresource add    FormName             varchar(100)         null
 ALTER TABLE sysresource add    ControlName          varchar(100)         null
  ALTER TABLE sysresource add    Checked          integer  default 0
  
  ALTER TABLE sysresource DROP COLUMN    FormName 
  --排序
  ALTER TABLE sysresource add OrderNo INT DEFAULT 0  
  ALTER TABLE sysresource add Remark VARCHAR(50)  
 EXEC sp_RefreshALLView
 --窗体信息表
 CREATE TABLE sysFormInfo(
	FormGUID VARCHAR(50) NOT NULL PRIMARY KEY,
	Caption VARCHAR(100) NOT NULL
	)
CREATE UNIQUE INDEX IX_FormGUID ON sysFormInfo(FormGUID);

DELETE FROM sysRole_Resource

SELECT * FROM vwSysRole ORDER BY RoleName
SELECT * FROM vwSysResource ORDER BY FormID, ControlID
SELECT * FROM vwSysRole_Resource ORDER BY RoleGUID, ResourceGUID

SELECT * FROM vwSysResource
SELECT * FROM SysResource

SELECT * FROM vwSysUser_Resource ORDER BY UserGUID, ResourceGUID
--FormID外键约束
ALTER TABLE sysResource ADD CONSTRAINT FK_Res_FormID
FOREIGN KEY (FormID) REFERENCES sysFormInfo(FormGUID);
