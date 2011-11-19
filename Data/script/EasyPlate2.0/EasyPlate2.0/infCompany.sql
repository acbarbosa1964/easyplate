/*==============================================================*/
/* Table: infCompany                                            */
/*==============================================================*/
create table dbo.infCompany (
   CompanyGUID          varchar(50)          not null,
   CompanyCName         varchar(255)         not null,
   CompanyEName         varchar(255)         null,
   Corporation          varchar(50)          null,
   Tel                  varchar(255)         null,
   Fax                  varchar(255)         null,
   Email                varchar(255)         null,
   Homepage             varchar(255)         null,
   CAddr                varchar(255)         null,
   EAddr                varchar(255)         null,
   PostCode             char(6)              null,
   Tax                  varchar(50)          null,
   logo                 image                null,
   ParentCompanyGUID    varchar(50)          not null,
   CompanyTypeGUID      varchar(50)          null,
   Remark               varchar(255)         null,
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

ALTER TABLE infCompany DROP COLUMN iOrder


ALTER TABLE infCompany Add OrderNo INT DEFAULT 0

SELECT * FROM infCompany

