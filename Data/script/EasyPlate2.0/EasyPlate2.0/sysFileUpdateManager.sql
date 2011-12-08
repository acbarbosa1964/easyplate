CREATE TABLE sysFileUpdateManager(
	FUMGUID VARCHAR(50) NOT NULL PRIMARY KEY,
	FileName VARCHAR(100) NOT NULL,
	FileContext     Image,
	FUMType  INTEGER NOT NULL DEFAULT 0,--类型
	bEnable  bit NOT NULL DEFAULT 1,
	bMust    bit NOT NULL DEFAULT 0,--是否必须更新
	CreateTime DATETIME NOT NULL,
	CreateUser VARCHAR(50) NOT NULL,
	Remark VARCHAR(255)
)
	
	DROP TABLE sysFileUpdateManager;
 DROP INDEX IX_FUMGUID ON sysFileUpdateManager
CREATE INDEX IX_FUMGUID ON sysFileUpdateManager(FUMGUID, bEnable, bMust);
CREATE UNIQUE INDEX IX_FUMFileName ON sysFileUpdateManager(FileName);
ALTER TABLE sysFileUpdateManager DROP COLUMN CreateTime ;
ALTER TABLE sysFileUpdateManager DROP COLUMN bEnable ;
ALTER TABLE sysFileUpdateManager DROP COLUMN bMust ;
ALTER TABLE sysFileUpdateManager ADD CreateTime DATETIME;
ALTER TABLE sysFileUpdateManager ALTER COLUMN bEnable bit NOT NULL;
ALTER TABLE sysFileUpdateManager ADD CreateTime DATETIME;
SELECT * FROM sysFileUpdateManager ORDER BY FUMType

EXEC spInitFormResource '{5AC3314E-9B64-438D-B8BA-9DF9F809D4D3}'
	INSERT INTO sysResource(ResourceGUID, FormID, ControlID, ControlName, Checked, OrderNo) VALUES(NEWID(), '{5AC3314E-9B64-438D-B8BA-9DF9F809D4D3}','btnClear','清除配置',0 , 9)

CREATE TABLE TEST(
UDATE DATE,
UTIME TIME
)
INSERT INTO TEST VALUES(GETDATE(), GETDATE())

SELECT * FROM TEST


SELECT * FROM sysFileUpdateManager ORDER BY FUMType
exec sp_RefreshALLView
