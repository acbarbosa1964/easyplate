/*
*返回插件目录数据集
*2011-07-15 hehf
*/
CREATE PROC sp_SysPluginsDirectory
AS
	SELECT * FROM vwSysPluginsDirectory ORDER BY IsDirectory, iOrder
	
	