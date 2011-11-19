USE [EasyERP]
GO

/****** Object:  View [dbo].[vw_OrgMap]    Script Date: 11/19/2011 12:05:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[vw_OrgMap]
AS
--公司
SELECT TOP 100 PERCENT CompanyGUID GUID, CompanyCName CName, ParentCompanyGUID ParentGUID, 0 Color, 0 ImageIndex, 0 OrderNo 
	FROM vw_infCompany ORDER BY ParentCompanyGUID, OrderNo
UNION ALL
--部门
SELECT TOP 100 PERCENT DeptGUID GUID, DeptCName CName, CASE ParentDeptGUID WHEN '{00000000-0000-0000-0000-000000000000}' THEN CompanyGUID ELSE ParentDeptGUID END ParentGUID,
		0 Color, 1 ImageIndex, 1 OrderNo 
	FROM vw_infCompanyDept  ORDER BY CompanyGUID, ParentDeptGUID, OrderNo
UNION ALL
--职位
SELECT TOP 100 PERCENT PostGUID GUID, PostCName CName, DeptGUID ParentGUID,
		0 Color, 2 ImageIndex, 2 OrderNo 
	FROM vw_infDeptPostion  ORDER BY DeptGUID, OrderNo
UNION ALL
--员工
SELECT TOP 100 PERCENT EmployeeGUID GUID, EmployeeCName CName, PositionGUID ParentGUID,
		0 Color, 3 ImageIndex, 3 OrderNo
	FROM vw_hrEmployee ORDER BY CompanyGUID, DepartmentGUID, PositionGUID, OrderNo
GO

--SELECT * FROM [vw_OrgMap]
SELECT * FROM sysUser
