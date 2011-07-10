--创建查询用户数据库视图

--返回用户数据库
CREATE VIEW [dbo].[vw_sysDataBase_User]
AS
Select Name, dbid, sid, crdate, filename, version 
FROM Master..SysDatabases 
WHERE name NOT IN('model' ,'master', 'msdb', 'tempdb') 

--返回所有数据库
CREATE VIEW [dbo].[vw_sysDataBase]
AS
Select Name, dbid, sid, crdate, filename, version 
FROM Master..SysDatabases 

--返回数据类型
CREATE VIEW vw_sysTypes
AS
select name from systypes

--返回用户数据表
CREATE VIEW vw_sysTables_User
AS
	Select Name 
	FROM SysObjects 
	Where XType='U' 

--返回表字段详细信息
--where 
--d.name='C_PARTY_SPREADER'    --如果只查询指定表,加上此条件
--DROP VIEW vw_sysTable_Fields
CREATE VIEW vw_sysTable_Fields
AS
SELECT 
    TableName       = case when a.colorder=1 then d.name else d.name end,
    --TableComment    = case when a.colorder=1 then isnull(f.value,'') else '' end,
    FieldNo   = a.colorder,
    FieldName     = a.name,
    Flag       = case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end,
    PrimaryKey       = case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in (
                     SELECT name FROM sysindexes WHERE indid in( SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid))) then '√' else '' end,
    [TYPE]       = b.name,
    sizeof = a.length,
    long       = COLUMNPROPERTY(a.id,a.name,'PRECISION'),
    [percent]   = isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0),
    [IsNull]     = case when a.isnullable=1 then '√'else '' end,
    [DefaultValue]     = isnull(e.text,'')--,
    --[Comment]   = isnull(g.[value],'')
FROM syscolumns a
	left join systypes b on a.xusertype=b.xusertype
	inner join sysobjects d on a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
	left join syscomments e on a.cdefault=e.id
	left join sys.extended_properties g on a.id=G.major_id and a.colid=g.minor_id  
    left join sys.extended_properties f on d.id=f.major_id and f.minor_id=0
