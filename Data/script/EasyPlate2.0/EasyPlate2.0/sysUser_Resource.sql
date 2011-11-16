CREATE table sysUser_Resource(
	GUID VARCHAR(50) NOT NULL PRIMARY KEY,
	UserGUID VARCHAR(50) NOT NULL,
	ResourceGUID VARCHAR(50) NOT NULL
)
	
	CREATE INDEX ix_UserGUID ON sysUser_Resource(UserGUID);
	CREATE INDEX ix_ResourceGUID ON sysUser_Resource(ResourceGUID);
	
	ALTER TABLE sysUser_Resource
	ADD CONSTRAINT FK_UserGUID FOREIGN KEY(UserGUID) REFERENCES sysUser(UserGUID);
	
	ALTER TABLE sysUser_Resource
	ADD CONSTRAINT FK_ResourceGUID FOREIGN KEY(ResourceGUID) REFERENCES sysResource(ResourceGUID);