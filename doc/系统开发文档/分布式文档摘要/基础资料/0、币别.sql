/*==============================================================*/
/* Table: sysCurrencyInfo                                       */
/*==============================================================*/
create table sysCurrencyInfo 
(
   GUID                 uniqueidentifier               not null,
   sCurrencyID          varchar(20)                    not null,
   sCurrencyEName       varchar(20)                    not null,
   sCurrencyCName       varchar(20)                    not null,
   fExchangeRate        float                          not null default 1,
   bExchangeRateType    bit                            not null default 0,
   bStandardCoin        bit                            not null default 0,
   constraint PK_SYSCURRENCYINFO primary key clustered (GUID)
);

/*==============================================================*/
/* Index: Index_Currency                                        */
/*==============================================================*/
create index Index_Currency on sysCurrencyInfo (
sCurrencyEName ASC,
sCurrencyCName ASC,
sCurrencyID ASC
);