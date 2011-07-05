/*==============================================================*/
/* Table: sysPluginParams                                       */
/*==============================================================*/
create table sysPluginParams (
   PluginParamGUID      varchar(50)          not null,
   ParamName            varchar(20)          not null,
   ValueType            char                 not null,
   Value                varchar(50)          not null,
   PluginGUID           varchar(50)          not null,
   constraint PK_SYSPLUGINPARAMS primary key (PluginParamGUID)
)
go

/*==============================================================*/
/* Index: Index_PlugParams                                      */
/*==============================================================*/
create unique index Index_PlugParams on sysPluginParams (
ParamName ASC
)
go