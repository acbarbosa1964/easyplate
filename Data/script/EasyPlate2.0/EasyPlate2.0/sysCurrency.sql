/*==============================================================*/
/* Table: sysCurrency                                           */
/*==============================================================*/
create table dbo.sysCurrency (
   CurrencyGUID         varchar(50)          not null,
   CurrencyCName        varchar(50)          not null,
   CurrencyEName        varchar(50)          null,
   ExchangeRate         numeric(10,4)        not null,
   TradeRate            numeric(10,4)        not null,
   CurrencySign         varchar(10)          null,
   bBase               bit                  not null,
   bVisible            bit                  not null,
   UpdateTime           datetime             null,
   Remark               varchar(255)         null,
   OrderNo              int                  null,
   constraint PK_SYSCURRENCY primary key nonclustered (CurrencyGUID)
)
go

/*==============================================================*/
/* Index: Index_CurrencyGUID                                    */
/*==============================================================*/
create unique index Index_CurrencyGUID on dbo.sysCurrency (
CurrencyGUID ASC
)
go

/*==============================================================*/
/* Index: Index_CurrencyCName                                   */
/*==============================================================*/
create unique index Index_CurrencyCName on dbo.sysCurrency (
CurrencyCName ASC
)
go

/*==============================================================*/
/* Index: Index_CurrencyEName                                   */
/*==============================================================*/
create unique index Index_CurrencyEName on dbo.sysCurrency (
CurrencyEName ASC
)
go

SELECT * FROM vw_sysCurrency
DROP TABLE sysCurrency
