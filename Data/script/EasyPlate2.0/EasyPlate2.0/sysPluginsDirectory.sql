/*==============================================================*/
/* Table: sysPluginsDirectory                                   */
/*==============================================================*/
create table sysPluginsDirectory (
   PluginGUID           varchar(50)          not null,
   PluginName           varchar(100)         not null,
   iOrder               int                  not null,
   PluginParamGUID      varchar(50)          null,
   ImageIndex           int                  null default -1,
   SelectedImageIndex   int                  null default -1,
   IsDirectory          bit                  not null default 0,
   PluginFileName       varchar(255)         null,
   PluginFile           text                 null,
   ParentPluginGUID     varchar(50)          not null,
   IsEnable             bit                  not null,
   constraint PK_SYSPLUGINSDIRECTORY primary key (PluginGUID)
)
go

/*==============================================================*/
/* Index: Index_PluginDirectory                                 */
/*==============================================================*/
create unique index Index_PluginDirectory on sysPluginsDirectory (
PluginName ASC
)
go

alter table sysPluginsDirectory
   add constraint FK_SYSPLUGI_REFERENCE_SYSPLUGI foreign key (PluginParamGUID)
      references sysPluginParams (PluginParamGUID)
go
--插件显示样式
ALTER TABLE sysPluginsDirectory ADD ShowModal BIT NOT NULL DEFAULT 0

--删除PluginParamGUID不应当存在此表中
ALTER TABLE sysPluginsDirectory DROP COLUMN PluginParamGUID
