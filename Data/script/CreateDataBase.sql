-- =============================================
-- 创建数据库
-- =============================================
USE master

-- 数据库文件存放路径
DECLARE @data_path nvarchar(256)
SET @data_path = 'E:\MyProject\E1Dev\Data\'

-- 如果数据库已经存在提示退出
IF  EXISTS (SELECT name	FROM sys.databases	WHERE name = 'EasyERP')
BEGIN
	PRINT 'EasyERP已在数据库中存在!'
	RETURN
END
-- =============================================
-- 创建EasyERP数据库文件组
-- =============================================
EXECUTE ('CREATE DATABASE EasyERP
ON 
( NAME = EasyERP_dat,
    FILENAME = '''+ @data_path + 'EasyERP_dat.mdf'',
    SIZE = 100MB,
    FILEGROWTH = 20% )
LOG ON
( NAME = Sales_log,
    FILENAME = '''+ @data_path + 'EasyERP_log.ldf'',
    SIZE = 50MB,
    FILEGROWTH = 20% )'
);
GO

