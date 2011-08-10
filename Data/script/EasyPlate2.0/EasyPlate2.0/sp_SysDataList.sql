/*
*系统参数字典表
*hehf 2011-07-24 22:18
*EXEC sp_SysDataList
*/
CREATE PROC sp_SysDataList
AS
	SELECT * FROM vw_SysDataList