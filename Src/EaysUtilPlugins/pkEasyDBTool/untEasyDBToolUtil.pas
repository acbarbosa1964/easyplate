unit untEasyDBToolUtil;

interface

const
  //获取数据库名称
  EASY_DATABASE_USER = 'SELECT * FROM vw_sysDataBase_User ORDER BY Name';
  EASY_DATABASE_ALL = 'SELECT * FROM vw_sysDataBase ORDER BY Name';
  EASY_DATATYPES = 'SELECT * FROM vw_sysTypes';
  EASY_TABLE = 'SELECT * FROM vw_sysTables_User ORDER BY Name';
  EASY_TABLEFIELD = 'SELECT * FROM vw_sysTable_Fields '
                    +' WHERE TableName = ''%s'''
                    + ' ORDER BY FieldNo';
 { EASY_DATABASE_USER = 'Select Name, dbid, sid, crdate, filename, version FROM Master..SysDatabases '
                      + ' WHERE name NOT IN(''model'' ,''master'', ''msdb'', ''tempdb'') '
                      + ' ORDER BY Name ';
  EASY_DATABASE_ALL = 'Select Name, dbid, sid, crdate, filename, version FROM Master..SysDatabases '
                      + ' ORDER BY Name ';
  //数据类型
  EASY_DATATYPES = 'select name from systypes';

  //当前用户数据表
  EASY_TABLE = 'Select Name FROM SysObjects Where XType=''U'' ORDER BY Name';
  //指定表的字段信息
  EASY_TABLEFIELD = 'SELECT (CASE WHEN A.colorder = 1 THEN d.name ELSE '''' END) TableName, '
       +' A.colorder FieldOrder, A.name AS FieldName, '
       +' (CASE WHEN COLUMNPROPERTY(A.id, A.name,''IsIdentity'') = 1 THEN ''√'' ELSE '''' END) Flag, '
       +' (case when (SELECT count(*) FROM sysobjects '
       +' WHERE (name in '
       +'           (SELECT name '
       +'          FROM sysindexes '
       +'          WHERE (id = a.id) AND (indid in  '
       +'                    (SELECT indid '
       +'                   FROM sysindexkeys '
       +'                   WHERE (id = a.id) AND (colid in '
       +'                             (SELECT colid '
       +'                            FROM syscolumns '
       +'                            WHERE (id = a.id) AND (name = a.name))))))) AND  '
       +'        (xtype = ''PK''))>0 then ''√'' else '''' end) PrimaryKey, '
       +' b.name DataType, a.length DataByte, '
       +' COLUMNPROPERTY(a.id,a.name,''PRECISION'') as DataLong, '
       +' isnull(COLUMNPROPERTY(a.id,a.name,''Scale''),0) as DataPrecision, '
       +' (case when a.isnullable=1 then ''√'' else '''' end) AllowNULL, '
       +' isnull(e.text,'''') DefaultValue, '
       +' 1 AS FieldRemark '
       +' FROM  syscolumns  a left join systypes b '
	+' on  a.xtype=b.xusertype	inner join sysobjects d '
	+' on a.id=d.id  and  d.xtype=''U'' and  d.name<>''dtproperties'' '
	+' left join syscomments e on a.cdefault=e.id '
	+' left join sysproperties g on a.id=g.id AND a.colid = g.smallid '
  +' WHERE d.name = ''%s'''
  +' order by a.id,a.colorder ';  }
  
implementation

end.
