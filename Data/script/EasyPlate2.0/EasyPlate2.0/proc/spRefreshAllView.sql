/*
*刷新数据库中的所有视图
*更新表结构时执行此存储过程
*2011-07-16 hehf
*EXEC sp_RefreshALLView
*/
CREATE PROC sp_RefreshALLView
	@ViewName VARCHAR(255) = ''
AS

DECLARE @TmpName VARCHAR(255)

IF @ViewName = ''
BEGIN
	DECLARE myCur CURSOR FOR
		SELECT [name] FROM sysobjects WHERE xtype = 'V'
	OPEN myCur
	FETCH NEXT FROM myCur INTO @TmpName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC sp_refreshview @TmpName
		FETCH NEXT FROM myCur INTO @TmpName
	END
	CLOSE myCur
	DEALLOCATE myCur
	RETURN
END ELSE
BEGIN
	EXEC sp_refreshview @TmpName
	RETURN
END