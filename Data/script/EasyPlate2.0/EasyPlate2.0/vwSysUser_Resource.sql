CREATE VIEW vwSysUser_Resource
AS
	SELECT * FROM sysUser_Resource
	
	
	SELECT * FROM sysRole
	SELECT RoleGUID, RoleName, ParentRoleGUID FROM vw_sysRole