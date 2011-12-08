USE [EasyERP]
GO
/****** Object:  StoredProcedure [dbo].[spInitFormResource]    Script Date: 11/27/2011 08:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[spInitFormResource]
	@FormGUID VARCHAR(50)
AS
BEGIN TRAN T1
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnAdd','新增',0 , 0)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnEdit','修改',0 , 1)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnDel','删除',0 , 2)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnSave','保存',0 , 3)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnRefresh','刷新',0 , 5)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnFind','查找',0 , 6)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnImport','导入',0 , 7)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnExport','导出',0 , 8)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnPrint','报表',0 , 9)
	IF @@ERROR <> 0 GOTO ERROR
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), @FormGUID,'btnClear','清除配置',0 , 9)
	IF @@ERROR <> 0 GOTO ERROR
	COMMIT TRAN T1
	RETURN
ERROR:
	ROLLBACK TRAN T1
	RETURN
SELECT * FROM sysResource
/*
DECLARE @FormID VARCHAR(50)
DECLARE @ControlID VARCHAR(50)
DECLARE @ControlName VARCHAR(50)
DECLARE @Checked integer
DECLARE @Orderno integer
DECLARE myCur CURSOR FOR
SELECT FormID, ControlID, ControlName, Checked, OrderNo FROM sysResource WHERE FormID = '{F11BC2A2-C240-475B-A0DC-B55B8D8F0F47}'
ORDER BY OrderNo
OPEN myCur
FETCH NEXT FROM myCur INTO @FormID, @ControlID, @ControlName, @Checked, @Orderno
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'INSERT INTO sysResource VALUES(NEWID(), ''''' + '' + ''',' 
		+ '''' + @ControlID + ''',' 
		+ '''' + @ControlName + ''',0 , ' 
		+ CAST(@Orderno AS VARCHAR)
		+ ')' 
	FETCH NEXT FROM myCur INTO @FormID, @ControlID, @ControlName, @Checked, @Orderno
END
CLOSE myCur
DEALLOCATE myCur
*/