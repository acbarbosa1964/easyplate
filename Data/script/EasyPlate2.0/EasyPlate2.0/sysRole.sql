/*==============================================================*/
/* Table: sysRole                                               */
/*==============================================================*/
create table sysRole (
   RoleGUID             varchar(50)          not null,
   RoleName             varchar(100)         not null,
   DeptGUID             varchar(50)          null,
   ParentRoleGUID       varchar(50)          null,
   Discription          varchar(255)         null,
   iOrder               int                  null,
   constraint PK_SYSROLE primary key (RoleGUID)
)
go

/*==============================================================*/
/* Index: Index_RoleGUID                                        */
/*==============================================================*/
create index Index_RoleGUID on sysRole (
RoleGUID ASC
)
go

ALTER TABLE sysRole DROP COLUMN DeptGUID

ALTER TABLE sysRole DROP COLUMN Discription
ALTER TABLE sysRole DROP COLUMN iOrder

INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{5821DC79-B062-44E4-8569-1E7015CDE6EE}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnAdd','新增',0, 0);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{D34348EB-B564-4453-B20F-7A4ACF12A7DF}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnEdit','修改',0, 1);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{57086A6B-3603-4B23-8F42-CDCF3442F045}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnDel','删除',0, 2);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{58176A3C-2099-41B8-82EE-DCFCB2F5BF35}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnSave','保存',0, 3);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{5603095F-34E2-4393-B041-10F35EFB9F48}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnCancel','撤销',0, 4);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{E1FE0E00-87F4-4703-9C13-81C35522DC63}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnRefresh','刷新',0, 5);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{948F4E6A-83C2-4288-8B0F-94083B0D284A}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnFind','查找',0, 6);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{AEAFDED2-D48F-445C-9F13-BF0A156A1434}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnImport','导入',0, 7);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{06135A5F-03FF-4291-8AF5-A08584901371}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnExport','导出',0, 8);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{660289D6-8BB5-4B8B-8415-A854CEE9788A}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnPrint','报表',0, 9);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{CA707927-0031-457B-B70A-36BCDAC78C0A}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnExit','关闭',0, 10);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{498D46DA-53E9-4487-92A2-734DF6C8ED36}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnExportExcel','Excel文档',0, 19);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{F6ACDB6B-BF49-4172-8BE5-2D279354AAF6}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnExportHTML','HTML网页',0, 20);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{AB173A47-C3A9-442A-8070-862C1FD6843D}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnExportXML','XML数据',0, 21);
INSERT INTO sysResource(ResourceGUID, FormID ,ControlID, ControlName, Checked, OrderNo) VALUES ('{2F4BCFAA-08CA-45E5-A9A8-A0354907A8E5}','{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}','btnExportText','文本文件',0, 22);

INSERT INTO sysforminfo values ('{EE1D4573-A66B-4E1F-BCF5-EEFD169A2E36}', '系统常量维护')

