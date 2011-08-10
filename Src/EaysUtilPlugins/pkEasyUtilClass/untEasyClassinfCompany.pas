{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7                            
//                         一轩软研第三方开发包                                 
//                         @Copyright 2010 hehf                                 
//                   ------------------------------------                       
//                                                                              
//           本开发包是公司内部使用,作为开发工具使用任何,何海锋个人负责开发,任何
//       人不得外泄,否则后果自负.                                               
//                                                                              
//            使用权限以及相关解释请联系何海锋                                  
//                                                                              
//                                                                              
//            网站地址：http://www.YiXuan-SoftWare.com                          
//            电子邮件：hehaifeng1984@126.com                                   
//                      YiXuan-SoftWare@hotmail.com                             
//            QQ      ：383530895                                               
//            MSN     ：YiXuan-SoftWare@hotmail.com                             
//------------------------------------------------------------------------------
//单元说明：                                                                    
//                                                                              
//主要实现：                                                                    
//-----------------------------------------------------------------------------}
unit untEasyClassinfCompany;

interface

uses
  Classes, DB, DBClient, Variants;

type

  TEasyinfCompany = class
  private
  { Private declarations } 
    FCompanyGUID: string;
    FCompanyCName: string;
    FCompanyEName: string;
    FCorporation: string;
    FTel: string;
    FFax: string;
    FEmail: string;
    FHomepage: string;
    FCAddr: string;
    FEAddr: string;
    FPostCode: string;
    FTax: string;
    FChnTitle: string;
    FEngTitle: string;
    FChnTitle2: string;
    FEngTitle2: string;
//    Flogo: EasyNULLType;
    FParentGUID: string;
    FRemark: string;
    FFlag: Integer;
    FiOrder: Integer;
  public
  { Public declarations } 
    property CompanyGUID: string read FCompanyGUID write FCompanyGUID;
    property CompanyCName: string read FCompanyCName write FCompanyCName;
    property CompanyEName: string read FCompanyEName write FCompanyEName;
    property Corporation: string read FCorporation write FCorporation;
    property Tel: string read FTel write FTel;
    property Fax: string read FFax write FFax;
    property Email: string read FEmail write FEmail;
    property Homepage: string read FHomepage write FHomepage;
    property CAddr: string read FCAddr write FCAddr;
    property EAddr: string read FEAddr write FEAddr;
    property PostCode: string read FPostCode write FPostCode;
    property Tax: string read FTax write FTax;
    property ChnTitle: string read FChnTitle write FChnTitle;
    property EngTitle: string read FEngTitle write FEngTitle;
    property ChnTitle2: string read FChnTitle2 write FChnTitle2;
    property EngTitle2: string read FEngTitle2 write FEngTitle2;
//    property logo: EasyNULLType read Flogo write Flogo;
    property ParentGUID: string read FParentGUID write FParentGUID;
    property Remark: string read FRemark write FRemark;
    property Flag: Integer read FFlag write FFlag;
    property iOrder: Integer read FiOrder write FiOrder;


    class procedure GenerateinfCompany(var Data: OleVariant; AResult: TList);
    class procedure AppendClientDataSet(ACds: TClientDataSet; AObj: TEasyinfCompany; var AObjList: TList);
    class procedure EditClientDataSet(ACds: TClientDataSet; AObj: TEasyinfCompany; var AObjList: TList);
    class procedure DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasyinfCompany; var AObjList: TList);
  end;

implementation

{TEasyinfCompany}
class procedure TEasyinfCompany.GenerateinfCompany(var Data: OleVariant; AResult: TList);
var
  I: Integer;
  AEasyinfCompany: TEasyinfCompany;
  AClientDataSet: TClientDataSet;
begin
  //创建数据源，并获取数据
  AClientDataSet := TClientDataSet.Create(nil);
  AClientDataSet.Data := Data;
  AClientDataSet.First;
  try
    for I := 0 to AClientDataSet.RecordCount - 1 do
    begin
      //此句为实例化指定的对象
      AEasyinfCompany := TEasyinfCompany.Create;
      with AEasyinfCompany do 
      begin
      //1 CompanyGUID
        CompanyGUID := AClientDataSet.FieldByName('CompanyGUID').AsString;
      //2 CompanyCName
        CompanyCName := AClientDataSet.FieldByName('CompanyCName').AsString;
      //3 CompanyEName
        CompanyEName := AClientDataSet.FieldByName('CompanyEName').AsString;
      //4 Corporation
        Corporation := AClientDataSet.FieldByName('Corporation').AsString;
      //5 Tel
        Tel := AClientDataSet.FieldByName('Tel').AsString;
      //6 Fax
        Fax := AClientDataSet.FieldByName('Fax').AsString;
      //7 Email
        Email := AClientDataSet.FieldByName('Email').AsString;
      //8 Homepage
        Homepage := AClientDataSet.FieldByName('Homepage').AsString;
      //9 CAddr
        CAddr := AClientDataSet.FieldByName('CAddr').AsString;
      //10 EAddr
        EAddr := AClientDataSet.FieldByName('EAddr').AsString;
      //11 PostCode
        PostCode := AClientDataSet.FieldByName('PostCode').AsString;
      //12 Tax
        Tax := AClientDataSet.FieldByName('Tax').AsString;
      //13 ChnTitle
        ChnTitle := AClientDataSet.FieldByName('ChnTitle').AsString;
      //14 EngTitle
        EngTitle := AClientDataSet.FieldByName('EngTitle').AsString;
      //15 ChnTitle2
        ChnTitle2 := AClientDataSet.FieldByName('ChnTitle2').AsString;
      //16 EngTitle2
        EngTitle2 := AClientDataSet.FieldByName('EngTitle2').AsString;
      //17 logo
//        logo := AClientDataSet.FieldByName('logo').AsEasyNullType;
      //18 ParentGUID
        ParentGUID := AClientDataSet.FieldByName('ParentGUID').AsString;
      //19 Remark
        Remark := AClientDataSet.FieldByName('Remark').AsString;
      //20 Flag
        Flag := AClientDataSet.FieldByName('Flag').AsInteger;
      //21 iOrder
        iOrder := AClientDataSet.FieldByName('iOrder').AsInteger;
      end;
      //在此添加将对象存放到指定容器的代码
      AResult.Add(AEasyinfCompany);
      //如果要关联树也在此添加相应代码
      AClientDataSet.Next;
    end;
  finally
    AClientDataSet.Free;
  end;
end;

class procedure TEasyinfCompany.AppendClientDataSet(ACds: TClientDataSet; AObj: TEasyinfCompany; var AObjList: TList);
begin
  with ACds do
  begin
    Append;
      //1 CompanyGUID
    FieldByName('CompanyGUID').AsString := AObj.CompanyGUID;
      //2 CompanyCName
    FieldByName('CompanyCName').AsString := AObj.CompanyCName;
      //3 CompanyEName
    FieldByName('CompanyEName').AsString := AObj.CompanyEName;
      //4 Corporation
    FieldByName('Corporation').AsString := AObj.Corporation;
      //5 Tel
    FieldByName('Tel').AsString := AObj.Tel;
      //6 Fax
    FieldByName('Fax').AsString := AObj.Fax;
      //7 Email
    FieldByName('Email').AsString := AObj.Email;
      //8 Homepage
    FieldByName('Homepage').AsString := AObj.Homepage;
      //9 CAddr
    FieldByName('CAddr').AsString := AObj.CAddr;
      //10 EAddr
    FieldByName('EAddr').AsString := AObj.EAddr;
      //11 PostCode
    FieldByName('PostCode').AsString := AObj.PostCode;
      //12 Tax
    FieldByName('Tax').AsString := AObj.Tax;
      //13 ChnTitle
    FieldByName('ChnTitle').AsString := AObj.ChnTitle;
      //14 EngTitle
    FieldByName('EngTitle').AsString := AObj.EngTitle;
      //15 ChnTitle2
    FieldByName('ChnTitle2').AsString := AObj.ChnTitle2;
      //16 EngTitle2
    FieldByName('EngTitle2').AsString := AObj.EngTitle2;
      //17 logo
//    FieldByName('logo').AsEasyNullType := AObj.logo;
      //18 ParentGUID
    FieldByName('ParentGUID').AsString := AObj.ParentGUID;
      //19 Remark
    FieldByName('Remark').AsString := AObj.Remark;
      //20 Flag
    FieldByName('Flag').AsInteger := AObj.Flag;
      //21 iOrder
    FieldByName('iOrder').AsInteger := AObj.iOrder;
    post;
  end;
  AObjList.Add(AObj);
end;

class procedure TEasyinfCompany.EditClientDataSet(ACds: TClientDataSet; AObj: TEasyinfCompany; var AObjList: TList);
begin
  if ACds.Locate('CompanyGUID', VarArrayOf([AObj.CompanyGUID]), [loCaseInsensitive]) then
  begin
    with ACds do
    begin
      Edit;
      //1 CompanyGUID
      FieldByName('CompanyGUID').AsString := AObj.CompanyGUID;
      //2 CompanyCName
      FieldByName('CompanyCName').AsString := AObj.CompanyCName;
      //3 CompanyEName
      FieldByName('CompanyEName').AsString := AObj.CompanyEName;
      //4 Corporation
      FieldByName('Corporation').AsString := AObj.Corporation;
      //5 Tel
      FieldByName('Tel').AsString := AObj.Tel;
      //6 Fax
      FieldByName('Fax').AsString := AObj.Fax;
      //7 Email
      FieldByName('Email').AsString := AObj.Email;
      //8 Homepage
      FieldByName('Homepage').AsString := AObj.Homepage;
      //9 CAddr
      FieldByName('CAddr').AsString := AObj.CAddr;
      //10 EAddr
      FieldByName('EAddr').AsString := AObj.EAddr;
      //11 PostCode
      FieldByName('PostCode').AsString := AObj.PostCode;
      //12 Tax
      FieldByName('Tax').AsString := AObj.Tax;
      //13 ChnTitle
      FieldByName('ChnTitle').AsString := AObj.ChnTitle;
      //14 EngTitle
      FieldByName('EngTitle').AsString := AObj.EngTitle;
      //15 ChnTitle2
      FieldByName('ChnTitle2').AsString := AObj.ChnTitle2;
      //16 EngTitle2
      FieldByName('EngTitle2').AsString := AObj.EngTitle2;
      //17 logo
//      FieldByName('logo').AsEasyNullType := AObj.logo;
      //18 ParentGUID
      FieldByName('ParentGUID').AsString := AObj.ParentGUID;
      //19 Remark
      FieldByName('Remark').AsString := AObj.Remark;
      //20 Flag
      FieldByName('Flag').AsInteger := AObj.Flag;
      //21 iOrder
      FieldByName('iOrder').AsInteger := AObj.iOrder;
      post;
    end;
  end;
end;

class procedure TEasyinfCompany.DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasyinfCompany; var AObjList: TList);
var
  I,
  DelIndex: Integer;
begin
  DelIndex := -1;
  if ACds.Locate('CompanyGUID', VarArrayOf([AObj.CompanyGUID]), [loCaseInsensitive]) then
    ACds.Delete;
  for I := 0 to AObjList.Count - 1 do
  begin
    if TEasyinfCompany(AObjList[I]).CompanyGUID = TEasyinfCompany(AObj).CompanyGUID then
    begin
      DelIndex := I;
      Break;
    end;
  end;
  if DelIndex <> -1 then
  begin
    TEasyinfCompany(AObjList[DelIndex]).Free;
    AObjList.Delete(DelIndex);
  end; 
end;

end.
