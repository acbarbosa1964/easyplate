/*
*返回插件参数数据集
*2011-07-15 hehf
*/
CREATE PROC sp_SysPluginParams
AS
	SELECT * FROM vwSysPluginParams ORDER BY ParamName