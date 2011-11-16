/*==============================================================*/
/* Table: infCompanyDept                                        */
/*==============================================================*/
create table infCompanyDept (
   DeptGUID             varchar(50)          not null,
   DeptCName            varchar(100)         not null,
   DeptEName            varchar(50)          null,
   DeptManagerGUID      varchar(50)          not null,
   ParentDeptGUID       varchar(50)          not null,
   CompanyGUID          varchar(50)          not null,
   DeptTypeGUID         varchar(50)          not null,
   iOrder               int                  null,
   Remark               varchar(255)         null,
   constraint PK_INFCOMPANYDEPT primary key nonclustered (DeptGUID)
)
go

/*==============================================================*/
/* Index: Index_Dept                                            */
/*==============================================================*/
create index Index_Dept on infCompanyDept (
DeptCName ASC
)
go
--公司GUID外键约束
ALTER TABLE infCompanyDept ADD CONSTRAINT FK_DEPT_COMPANYGUID FOREIGN KEY(CompanyGUID)
REFERENCES infCompany(CompanyGUID)

ALTER TABLE infCompanyDept DROP COLUMN iOrder


ALTER TABLE infCompanyDept Add OrderNo INT DEFAULT 0

SELECT * FROM infCompany ORDER BY ParentCompanyGUID, OrderNo
SELECT DeptManagerGUID, DeptTypeGUID, CompanyGUID,* FROM infCompanyDept

SELECT * FROM SysDataList WHERE SysDataName LIKE '%部门%'
