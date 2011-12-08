/*==============================================================*/
/* Table: whPartClass                                           */
/*==============================================================*/
create table whPartClass (
   PartClassGUID        varchar(50)          not null,
   PartClassCode        varchar(50)          not null,
   PartClassEName       varchar(100)         not null,
   PartClassCName       varchar(200)         not null,
   ParentPartClassGUID  varchar(50)          not null,
   TypeGUID             varchar(50)          not null,
   IsEnable             bit            not null default 1,
   OrderNo              integer              not null default 0,
   UpdateTime           datetime             not null,
   constraint PK_WHPARTCLASS primary key (PartClassGUID)
)
go

/*==============================================================*/
/* Index: Index_PartClassGUID                                   */
/*==============================================================*/
create index Index_PartClassGUID on whPartClass (
PartClassGUID ASC,
ParentPartClassGUID ASC
)
go

/*==============================================================*/
/* Index: Index_PartClassCode                                   */
/*==============================================================*/
create index Index_PartClassCode on whPartClass (
PartClassCode ASC
)
go

/*==============================================================*/
/* Index: Index_TypeGUID                                        */
/*==============================================================*/
create index Index_TypeGUID on whPartClass (
TypeGUID ASC,
IsEnable ASC
)
go

--//
EXEC spInitFormResource '{02CEC4E5-6755-4F47-893C-288F971A8CDA}'
