/*==============================================================*/
/* Table: infCompany                                            */
/*==============================================================*/
create table dbo.infCompany (
   CompanyGUID          varchar(50)          not null,
   CompanyCName         varchar(200)         not null,
   CompanyEName         varchar(200)         null,
   Corporation          varchar(20)          null,
   Tel                  varchar(50)          null,
   Fax                  varchar(20)          null,
   Email                varchar(50)          null,
   Homepage             varchar(50)          null,
   CAddr                varchar(200)         null,
   EAddr                varchar(200)         null,
   PostCode             char(6)              null,
   Tax                  varchar(50)          null,
   ChnTitle             varchar(100)         null,
   EngTitle             varchar(150)         null,
   ChnTitle2            varchar(100)         null,
   EngTitle2            varchar(150)         null,
   logo                 image                null,
   ParentGUID           varchar(50)          not null,
   Remark               varchar(100)         null,
   Flag                 int                  null,
   iOrder               int                  null,
   constraint PK_PuCompany primary key (CompanyGUID)
)
go

/*==============================================================*/
/* Index: Index_Company                                         */
/*==============================================================*/
create unique index Index_Company on dbo.infCompany (
CompanyCName ASC,
CompanyEName ASC
)
go