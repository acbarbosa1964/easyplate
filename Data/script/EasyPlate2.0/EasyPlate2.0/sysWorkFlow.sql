/*==============================================================*/
/* Table: sysWorkFlow                                           */
/*==============================================================*/
create table sysWorkFlow (
   wfGUID               varchar(50)          not null,
   wfName               varchar(300)         not null,
   FormGUID             varchar(50)          not null,
   ParentwfGUID         varchar(50)          not null,
   NextwfGUID           varchar(50)          not null,
   RigthTypeGUID        varchar(50)          not null,
   Opers                text                 not null,
   Status               bit                  not null default 1,
   constraint AK_KEY_WFGUID_SYSWORKF unique (wfGUID)
)
go

/*==============================================================*/
/* Index: Index_wfname                                          */
/*==============================================================*/
create unique index Index_wfname on sysWorkFlow (
wfName ASC
)
go

/*==============================================================*/
/* Index: Index_wfGUID                                          */
/*==============================================================*/
create index Index_wfGUID on sysWorkFlow (
wfGUID ASC,
ParentwfGUID ASC,
NextwfGUID ASC
)
go


 SELECT   sRoleGUID, sEmployeeGUID, sEmployeeCName, 
 sEmployeeEName, sSexGUID FROM vw_InitUser  ORDER BY iOrderNo
 SELECT UserGUID, UserName from vw_InitUser ORDER BY OrderNo
 exec sp_RefreshALLView
 SELECT * FROM vw_InitUser
  SELECT A.UserGUID, A.UserName 
  FROM vw_InitUser A LEFT JOIN sysOrg_Role 
  ORDER BY A.OrderNo
 
 SELECT * FROM infCompany
 select * from infCompanyDept
 UPDATE infCompany 
 SET CompanyGUID = '{00000000-0000-0000-0000-000000000000}' 
 WHERE CompanyGUID = '{00000000-0000-0000-0000-000000000002}'
 INSERT INTO infCompanyDept VALUES('{00000000-0000-0000-0000-000000000000}',
 '»À ¬≤ø', 'PersonDept', '{00000000-0000-0000-0000-000000000000}', '{00000000-0000-0000-0000-000000000000}',
 '{00000000-0000-0000-0000-000000000000}', '{00000000-0000-0000-0000-000000000000}', 0, '')
 
 
 SELECT UserGUID, UserName, RoleGUID, RoleName, CompanyCName, DeptCName FROM vw_InitUser
 
 SELECT * FROM sysUser
 
 CREATE VIEW vw_sysRole
 AS
	SELECT * FROM sysRole
	
	SELECT RoleGUID, RoleName FROM vw_sysRole
	 CREATE VIEW vw_hrEmployee
 AS
	SELECT * FROM hrEmployee
	
 
 SELECT EmployeeGUID, EmployeeCName FROM vw_hrEmployee
 
	SELECT * FROM hrEmployee
 ALTER TABLE hrEmployee ALTER COLUMN EmployeeID VARCHAR(20) NOT NULL
 CREATE UNIQUE INDEX index_employeeid ON hrEmployee(EmployeeID)
 UPDATE a SET a.EmployeeID = b.rownum
 from
 hrEmployee a left join
 (SELECT ROW_NUMBER() over(ORDER BY EmployeeGUID) AS 'ROWNUM', EmployeeGUID FROM hremployee) b on a.employeeguid=b.employeeguid
 
 select * from infCompanyDept
 