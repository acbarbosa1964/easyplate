USE [EasyERP]
GO

/****** Object:  View [dbo].[vw_OrgMap]    Script Date: 11/18/2011 23:53:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vw_OrgMap]
AS
SELECT TOP 100 PERCENT CompanyGUID GUID, CompanyCName CName, ParentCompanyGUID ParentGUID, 0 Color, 1 ImageIndex, 0 OrderNo FROM infCompany ORDER BY ParentCompanyGUID, OrderNo
UNION ALL
SELECT TOP 100 PERCENT DeptGUID GUID, DeptCName CName, CASE ParentDeptGUID WHEN '{00000000-0000-0000-0000-000000000000}' THEN CompanyGUID ELSE ParentDeptGUID END ParentGUID,
		0 Color, 2 ImageIndex, 1 OrderNo FROM infCompanyDept  ORDER BY CompanyGUID, ParentDeptGUID, OrderNo

GO


--SELECT * FROM vw_OrgMap

--SELECT * FROM infCompanyDept WHERE 