CREATE TABLE sysFormManager(
	FormGUID VARCHAR(50) NOT NULL PRIMARY KEY,
	FormName VARCHAR(100) NOT NULL,
	FormFile Image,
	OrderNo INT DEFAULT 0,
	Flag	INT
	);
	
	CREATE UNIQUE INDEX Index_FormName ON sysFormManager(FormName);
	CREATE INDEX Index_FormGUID ON sysFormManager(FormGUID);
	
	--DROP TABLE sysFormManager;
	
	CREATE VIEW vw_sysFormManager
	AS
		SELECT * FROM sysFormManager
		
		
	