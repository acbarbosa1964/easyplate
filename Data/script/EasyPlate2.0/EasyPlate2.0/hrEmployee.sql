/*==============================================================*/
/* Table: hrEmployee                                            */
/*==============================================================*/
create table dbo.hrEmployee (
   EmployeeGUID         varchar(50)          not null,
   EmployeeCName        varchar(20)          not null,
   EmployeeEName        varchar(20)          null,
   SexGUID              varchar(50)          not null,
   Birthday             datetime             null,
   Stature              numeric(10,1)        null,
   BroodGUID            varchar(50)          null,
   NationGUID           varchar(20)          null,
   NativePlaceGUID      varchar(50)          null,
   IdentityCard         varchar(20)          null,
   StudyExperienceGUID  varchar(50)          null,
   Speciality           varchar(50)          null,
   MarryGUID            varchar(50)          null,
   PolityStatusGUID     varchar(50)          null,
   GraduateInstitute    varchar(50)          null,
   Photo                text                 null,
   PersonContactTel     varchar(50)          null,
   FamilyContactTel     varchar(50)          null,
   OtherContact         varchar(50)          null,
   Email                varchar(50)          null,
   Residence            varchar(100)         null,
   InServiceGUID        varchar(50)          null,
   PositionGUID         varchar(50)          null,
   OthersPositionGUID   varchar(255)         null,
   ResidenceTypeGUID    varchar(50)          null,
   InsureNo             varchar(50)          null,
   PayMentNo            varchar(20)          null,
   CompanyGUID          varchar(50)          not null,
   DepartmentGUID       varchar(50)          not null,
   InCompanyDate        datetime             null,
   TryoutDate           datetime             null,
   FormalDate           datetime             null,
   EmpContractNo        varchar(20)          null,
   EndDate              datetime             null,
   EmployeeTypeGUID     varchar(50)          not null,
   CallTitleGUID        varchar(50)          null,
   CallTitleDate        datetime             null,
   ForeignLangaugeLevelGUID varchar(50)          null,
   ComputerTechnolicGUID varchar(50)          null,
   FamilyAddress        varchar(255)         null,
   Remark               varchar(255)         null,
   IsEnable             bit                  not null,
   OrderNo              int                  null,
   RightNum             int                  null,
   BarCode              varchar(50)          null,
   ICCardID             varchar(50)          null,
   InputDate            datetime             not null,
   UserGUID             varchar(50)          not null,
   constraint PK_HREMPLOYEE primary key nonclustered (EmployeeGUID)
)
go

/*==============================================================*/
/* Index: Index_Employee                                        */
/*==============================================================*/
create index Index_Employee on dbo.hrEmployee (
EmployeeGUID ASC,
EmployeeCName ASC,
EmployeeEName ASC
)
go

/*==============================================================*/
/* Index: Index_EmployeeInfo                                    */
/*==============================================================*/
create index Index_EmployeeInfo on dbo.hrEmployee (
Birthday ASC,
StudyExperienceGUID ASC,
CompanyGUID ASC,
DepartmentGUID ASC,
InCompanyDate ASC,
FormalDate ASC,
EndDate ASC
)
go

ALTER TABLE hrEmployee DROP COLUMN EmployeeID;
ALTER TABLE hrEmployee ADD SpeedCode VARCHAR(20);
ALTER TABLE hrEmployee ADD EmployeeCode VARCHAR(20);

CREATE UNIQUE INDEX index_EmployeeCode ON hrEmployee(EmployeeCode);
SELECT * FROM vw_hrEmployee

