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
unit untEasyClasshrEmployee;

interface

uses
  Classes, DB, DBClient, Variants;

type

  TEasyhrEmployee = class
  private
  { Private declarations } 
    FEmployeeGUID: string;
    FEmployeeCName: string;
    FEmployeeEName: string;
    FSexGUID: string;
    FBirthday: TDateTime;
    FStature: Double;
    FBroodGUID: string;
    FNationGUID: string;
    FNativePlaceGUID: string;
    FIdentityCard: string;
    FStudyExperienceGUID: string;
    FSpeciality: string;
    FMarryGUID: string;
    FPolityStatusGUID: string;
    FGraduateInstitute: string;
//    FPhoto: EasyNULLType;
    FPersonContactTel: string;
    FFamilyContactTel: string;
    FOtherContact: string;
    FEmail: string;
    FResidence: string;
    FInServiceGUID: string;
    FPositionGUID: string;
    FOthersPositionGUID: string;
    FResidenceTypeGUID: string;
    FInsureNo: string;
    FPayMentNo: string;
    FCompanyGUID: string;
    FDepartmentGUID: string;
    FInCompanyDate: TDateTime;
    FTryoutDate: TDateTime;
    FFormalDate: TDateTime;
    FEmpContractNo: string;
    FEndDate: TDateTime;
    FEmployeeTypeGUID: string;
    FCallTitleGUID: string;
    FCallTitleDate: TDateTime;
    FForeignLangaugeLevelGUID: string;
    FComputerTechnolicGUID: string;
    FFamilyAddress: string;
    FRemark: string;
    FIsEnable: Boolean;
    FOrderNo: Integer;
    FRightNum: Integer;
    FBarCode: string;
    FICCardID: string;
    FInputDate: TDateTime;
    FUserGUID: string;
  public
  { Public declarations } 
    property EmployeeGUID: string read FEmployeeGUID write FEmployeeGUID;
    property EmployeeCName: string read FEmployeeCName write FEmployeeCName;
    property EmployeeEName: string read FEmployeeEName write FEmployeeEName;
    property SexGUID: string read FSexGUID write FSexGUID;
    property Birthday: TDateTime read FBirthday write FBirthday;
    property Stature: Double read FStature write FStature;
    property BroodGUID: string read FBroodGUID write FBroodGUID;
    property NationGUID: string read FNationGUID write FNationGUID;
    property NativePlaceGUID: string read FNativePlaceGUID write FNativePlaceGUID;
    property IdentityCard: string read FIdentityCard write FIdentityCard;
    property StudyExperienceGUID: string read FStudyExperienceGUID write FStudyExperienceGUID;
    property Speciality: string read FSpeciality write FSpeciality;
    property MarryGUID: string read FMarryGUID write FMarryGUID;
    property PolityStatusGUID: string read FPolityStatusGUID write FPolityStatusGUID;
    property GraduateInstitute: string read FGraduateInstitute write FGraduateInstitute;
//    property Photo: EasyNULLType read FPhoto write FPhoto;
    property PersonContactTel: string read FPersonContactTel write FPersonContactTel;
    property FamilyContactTel: string read FFamilyContactTel write FFamilyContactTel;
    property OtherContact: string read FOtherContact write FOtherContact;
    property Email: string read FEmail write FEmail;
    property Residence: string read FResidence write FResidence;
    property InServiceGUID: string read FInServiceGUID write FInServiceGUID;
    property PositionGUID: string read FPositionGUID write FPositionGUID;
    property OthersPositionGUID: string read FOthersPositionGUID write FOthersPositionGUID;
    property ResidenceTypeGUID: string read FResidenceTypeGUID write FResidenceTypeGUID;
    property InsureNo: string read FInsureNo write FInsureNo;
    property PayMentNo: string read FPayMentNo write FPayMentNo;
    property CompanyGUID: string read FCompanyGUID write FCompanyGUID;
    property DepartmentGUID: string read FDepartmentGUID write FDepartmentGUID;
    property InCompanyDate: TDateTime read FInCompanyDate write FInCompanyDate;
    property TryoutDate: TDateTime read FTryoutDate write FTryoutDate;
    property FormalDate: TDateTime read FFormalDate write FFormalDate;
    property EmpContractNo: string read FEmpContractNo write FEmpContractNo;
    property EndDate: TDateTime read FEndDate write FEndDate;
    property EmployeeTypeGUID: string read FEmployeeTypeGUID write FEmployeeTypeGUID;
    property CallTitleGUID: string read FCallTitleGUID write FCallTitleGUID;
    property CallTitleDate: TDateTime read FCallTitleDate write FCallTitleDate;
    property ForeignLangaugeLevelGUID: string read FForeignLangaugeLevelGUID write FForeignLangaugeLevelGUID;
    property ComputerTechnolicGUID: string read FComputerTechnolicGUID write FComputerTechnolicGUID;
    property FamilyAddress: string read FFamilyAddress write FFamilyAddress;
    property Remark: string read FRemark write FRemark;
    property IsEnable: Boolean read FIsEnable write FIsEnable;
    property OrderNo: Integer read FOrderNo write FOrderNo;
    property RightNum: Integer read FRightNum write FRightNum;
    property BarCode: string read FBarCode write FBarCode;
    property ICCardID: string read FICCardID write FICCardID;
    property InputDate: TDateTime read FInputDate write FInputDate;
    property UserGUID: string read FUserGUID write FUserGUID;


    class procedure GeneratehrEmployee(var Data: OleVariant; AResult: TList);
    class procedure AppendClientDataSet(ACds: TClientDataSet; AObj: TEasyhrEmployee; var AObjList: TList);
    class procedure EditClientDataSet(ACds: TClientDataSet; AObj: TEasyhrEmployee; var AObjList: TList);
    class procedure DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasyhrEmployee; var AObjList: TList);
    class procedure InitSinglehrEmployee(AClientDataSet: TClientDataSet; var AObj: TEasyhrEmployee);
  end;

implementation

{TEasyhrEmployee}
class procedure TEasyhrEmployee.GeneratehrEmployee(var Data: OleVariant; AResult: TList);
var
  I: Integer;
  AEasyhrEmployee: TEasyhrEmployee;
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
      AEasyhrEmployee := TEasyhrEmployee.Create;
      with AEasyhrEmployee do
      begin
      //1 EmployeeGUID
        EmployeeGUID := AClientDataSet.FieldByName('EmployeeGUID').AsString;
      //2 EmployeeCName
        EmployeeCName := AClientDataSet.FieldByName('EmployeeCName').AsString;
      //3 EmployeeEName
        EmployeeEName := AClientDataSet.FieldByName('EmployeeEName').AsString;
      //4 SexGUID
        SexGUID := AClientDataSet.FieldByName('SexGUID').AsString;
      //5 Birthday
        Birthday := AClientDataSet.FieldByName('Birthday').AsDateTime;
      //6 Stature
        Stature := AClientDataSet.FieldByName('Stature').AsFloat;
      //7 BroodGUID
        BroodGUID := AClientDataSet.FieldByName('BroodGUID').AsString;
      //8 NationGUID
        NationGUID := AClientDataSet.FieldByName('NationGUID').AsString;
      //9 NativePlaceGUID
        NativePlaceGUID := AClientDataSet.FieldByName('NativePlaceGUID').AsString;
      //10 IdentityCard
        IdentityCard := AClientDataSet.FieldByName('IdentityCard').AsString;
      //11 StudyExperienceGUID
        StudyExperienceGUID := AClientDataSet.FieldByName('StudyExperienceGUID').AsString;
      //12 Speciality
        Speciality := AClientDataSet.FieldByName('Speciality').AsString;
      //13 MarryGUID
        MarryGUID := AClientDataSet.FieldByName('MarryGUID').AsString;
      //14 PolityStatusGUID
        PolityStatusGUID := AClientDataSet.FieldByName('PolityStatusGUID').AsString;
      //15 GraduateInstitute
        GraduateInstitute := AClientDataSet.FieldByName('GraduateInstitute').AsString;
      //16 Photo
//        Photo := AClientDataSet.FieldByName('Photo').AsEasyNullType;
      //17 PersonContactTel
        PersonContactTel := AClientDataSet.FieldByName('PersonContactTel').AsString;
      //18 FamilyContactTel
        FamilyContactTel := AClientDataSet.FieldByName('FamilyContactTel').AsString;
      //19 OtherContact
        OtherContact := AClientDataSet.FieldByName('OtherContact').AsString;
      //20 Email
        Email := AClientDataSet.FieldByName('Email').AsString;
      //21 Residence
        Residence := AClientDataSet.FieldByName('Residence').AsString;
      //22 InServiceGUID
        InServiceGUID := AClientDataSet.FieldByName('InServiceGUID').AsString;
      //23 PositionGUID
        PositionGUID := AClientDataSet.FieldByName('PositionGUID').AsString;
      //24 OthersPositionGUID
        OthersPositionGUID := AClientDataSet.FieldByName('OthersPositionGUID').AsString;
      //25 ResidenceTypeGUID
        ResidenceTypeGUID := AClientDataSet.FieldByName('ResidenceTypeGUID').AsString;
      //26 InsureNo
        InsureNo := AClientDataSet.FieldByName('InsureNo').AsString;
      //27 PayMentNo
        PayMentNo := AClientDataSet.FieldByName('PayMentNo').AsString;
      //28 CompanyGUID
        CompanyGUID := AClientDataSet.FieldByName('CompanyGUID').AsString;
      //29 DepartmentGUID
        DepartmentGUID := AClientDataSet.FieldByName('DepartmentGUID').AsString;
      //30 InCompanyDate
        InCompanyDate := AClientDataSet.FieldByName('InCompanyDate').AsDateTime;
      //31 TryoutDate
        TryoutDate := AClientDataSet.FieldByName('TryoutDate').AsDateTime;
      //32 FormalDate
        FormalDate := AClientDataSet.FieldByName('FormalDate').AsDateTime;
      //33 EmpContractNo
        EmpContractNo := AClientDataSet.FieldByName('EmpContractNo').AsString;
      //34 EndDate
        EndDate := AClientDataSet.FieldByName('EndDate').AsDateTime;
      //35 EmployeeTypeGUID
        EmployeeTypeGUID := AClientDataSet.FieldByName('EmployeeTypeGUID').AsString;
      //36 CallTitleGUID
        CallTitleGUID := AClientDataSet.FieldByName('CallTitleGUID').AsString;
      //37 CallTitleDate
        CallTitleDate := AClientDataSet.FieldByName('CallTitleDate').AsDateTime;
      //38 ForeignLangaugeLevelGUID
        ForeignLangaugeLevelGUID := AClientDataSet.FieldByName('ForeignLangaugeLevelGUID').AsString;
      //39 ComputerTechnolicGUID
        ComputerTechnolicGUID := AClientDataSet.FieldByName('ComputerTechnolicGUID').AsString;
      //40 FamilyAddress
        FamilyAddress := AClientDataSet.FieldByName('FamilyAddress').AsString;
      //41 Remark
        Remark := AClientDataSet.FieldByName('Remark').AsString;
      //42 IsEnable
        IsEnable := AClientDataSet.FieldByName('IsEnable').AsBoolean;
      //43 OrderNo
        OrderNo := AClientDataSet.FieldByName('OrderNo').AsInteger;
      //44 RightNum
        RightNum := AClientDataSet.FieldByName('RightNum').AsInteger;
      //45 BarCode
        BarCode := AClientDataSet.FieldByName('BarCode').AsString;
      //46 ICCardID
        ICCardID := AClientDataSet.FieldByName('ICCardID').AsString;
      //47 InputDate
        InputDate := AClientDataSet.FieldByName('InputDate').AsDateTime;
      //48 UserGUID
        UserGUID := AClientDataSet.FieldByName('UserGUID').AsString;
      end;
      //在此添加将对象存放到指定容器的代码
      AResult.Add(AEasyhrEmployee);
      //如果要关联树也在此添加相应代码
      AClientDataSet.Next;
    end;
  finally
    AClientDataSet.Free;
  end;
end;

class procedure TEasyhrEmployee.AppendClientDataSet(ACds: TClientDataSet; AObj: TEasyhrEmployee; var AObjList: TList);
begin
  with ACds do
  begin
    Append;
      //1 EmployeeGUID
    FieldByName('EmployeeGUID').AsString := AObj.EmployeeGUID;
      //2 EmployeeCName
    FieldByName('EmployeeCName').AsString := AObj.EmployeeCName;
      //3 EmployeeEName
    FieldByName('EmployeeEName').AsString := AObj.EmployeeEName;
      //4 SexGUID
    FieldByName('SexGUID').AsString := AObj.SexGUID;
      //5 Birthday
    FieldByName('Birthday').AsDateTime := AObj.Birthday;
      //6 Stature
    FieldByName('Stature').AsFloat := AObj.Stature;
      //7 BroodGUID
    FieldByName('BroodGUID').AsString := AObj.BroodGUID;
      //8 NationGUID
    FieldByName('NationGUID').AsString := AObj.NationGUID;
      //9 NativePlaceGUID
    FieldByName('NativePlaceGUID').AsString := AObj.NativePlaceGUID;
      //10 IdentityCard
    FieldByName('IdentityCard').AsString := AObj.IdentityCard;
      //11 StudyExperienceGUID
    FieldByName('StudyExperienceGUID').AsString := AObj.StudyExperienceGUID;
      //12 Speciality
    FieldByName('Speciality').AsString := AObj.Speciality;
      //13 MarryGUID
    FieldByName('MarryGUID').AsString := AObj.MarryGUID;
      //14 PolityStatusGUID
    FieldByName('PolityStatusGUID').AsString := AObj.PolityStatusGUID;
      //15 GraduateInstitute
    FieldByName('GraduateInstitute').AsString := AObj.GraduateInstitute;
      //16 Photo
//    FieldByName('Photo').AsEasyNullType := AObj.Photo;
      //17 PersonContactTel
    FieldByName('PersonContactTel').AsString := AObj.PersonContactTel;
      //18 FamilyContactTel
    FieldByName('FamilyContactTel').AsString := AObj.FamilyContactTel;
      //19 OtherContact
    FieldByName('OtherContact').AsString := AObj.OtherContact;
      //20 Email
    FieldByName('Email').AsString := AObj.Email;
      //21 Residence
    FieldByName('Residence').AsString := AObj.Residence;
      //22 InServiceGUID
    FieldByName('InServiceGUID').AsString := AObj.InServiceGUID;
      //23 PositionGUID
    FieldByName('PositionGUID').AsString := AObj.PositionGUID;
      //24 OthersPositionGUID
    FieldByName('OthersPositionGUID').AsString := AObj.OthersPositionGUID;
      //25 ResidenceTypeGUID
    FieldByName('ResidenceTypeGUID').AsString := AObj.ResidenceTypeGUID;
      //26 InsureNo
    FieldByName('InsureNo').AsString := AObj.InsureNo;
      //27 PayMentNo
    FieldByName('PayMentNo').AsString := AObj.PayMentNo;
      //28 CompanyGUID
    FieldByName('CompanyGUID').AsString := AObj.CompanyGUID;
      //29 DepartmentGUID
    FieldByName('DepartmentGUID').AsString := AObj.DepartmentGUID;
      //30 InCompanyDate
    FieldByName('InCompanyDate').AsDateTime := AObj.InCompanyDate;
      //31 TryoutDate
    FieldByName('TryoutDate').AsDateTime := AObj.TryoutDate;
      //32 FormalDate
    FieldByName('FormalDate').AsDateTime := AObj.FormalDate;
      //33 EmpContractNo
    FieldByName('EmpContractNo').AsString := AObj.EmpContractNo;
      //34 EndDate
    FieldByName('EndDate').AsDateTime := AObj.EndDate;
      //35 EmployeeTypeGUID
    FieldByName('EmployeeTypeGUID').AsString := AObj.EmployeeTypeGUID;
      //36 CallTitleGUID
    FieldByName('CallTitleGUID').AsString := AObj.CallTitleGUID;
      //37 CallTitleDate
    FieldByName('CallTitleDate').AsDateTime := AObj.CallTitleDate;
      //38 ForeignLangaugeLevelGUID
    FieldByName('ForeignLangaugeLevelGUID').AsString := AObj.ForeignLangaugeLevelGUID;
      //39 ComputerTechnolicGUID
    FieldByName('ComputerTechnolicGUID').AsString := AObj.ComputerTechnolicGUID;
      //40 FamilyAddress
    FieldByName('FamilyAddress').AsString := AObj.FamilyAddress;
      //41 Remark
    FieldByName('Remark').AsString := AObj.Remark;
      //42 IsEnable
    FieldByName('IsEnable').AsBoolean := AObj.IsEnable;
      //43 OrderNo
    FieldByName('OrderNo').AsInteger := AObj.OrderNo;
      //44 RightNum
    FieldByName('RightNum').AsInteger := AObj.RightNum;
      //45 BarCode
    FieldByName('BarCode').AsString := AObj.BarCode;
      //46 ICCardID
    FieldByName('ICCardID').AsString := AObj.ICCardID;
      //47 InputDate
    FieldByName('InputDate').AsDateTime := AObj.InputDate;
      //48 UserGUID
    FieldByName('UserGUID').AsString := AObj.UserGUID;
    post;
  end;
  AObjList.Add(AObj);
end;

class procedure TEasyhrEmployee.EditClientDataSet(ACds: TClientDataSet; AObj: TEasyhrEmployee; var AObjList: TList);
begin
  if ACds.Locate('EmployeeGUID', VarArrayOf([AObj.EmployeeGUID]), [loCaseInsensitive]) then
  begin
    with ACds do
    begin
      Edit;
      //1 EmployeeGUID
      FieldByName('EmployeeGUID').AsString := AObj.EmployeeGUID;
      //2 EmployeeCName
      FieldByName('EmployeeCName').AsString := AObj.EmployeeCName;
      //3 EmployeeEName
      FieldByName('EmployeeEName').AsString := AObj.EmployeeEName;
      //4 SexGUID
      FieldByName('SexGUID').AsString := AObj.SexGUID;
      //5 Birthday
      FieldByName('Birthday').AsDateTime := AObj.Birthday;
      //6 Stature
      FieldByName('Stature').AsFloat := AObj.Stature;
      //7 BroodGUID
      FieldByName('BroodGUID').AsString := AObj.BroodGUID;
      //8 NationGUID
      FieldByName('NationGUID').AsString := AObj.NationGUID;
      //9 NativePlaceGUID
      FieldByName('NativePlaceGUID').AsString := AObj.NativePlaceGUID;
      //10 IdentityCard
      FieldByName('IdentityCard').AsString := AObj.IdentityCard;
      //11 StudyExperienceGUID
      FieldByName('StudyExperienceGUID').AsString := AObj.StudyExperienceGUID;
      //12 Speciality
      FieldByName('Speciality').AsString := AObj.Speciality;
      //13 MarryGUID
      FieldByName('MarryGUID').AsString := AObj.MarryGUID;
      //14 PolityStatusGUID
      FieldByName('PolityStatusGUID').AsString := AObj.PolityStatusGUID;
      //15 GraduateInstitute
      FieldByName('GraduateInstitute').AsString := AObj.GraduateInstitute;
      //16 Photo
//      FieldByName('Photo').AsEasyNullType := AObj.Photo;
      //17 PersonContactTel
      FieldByName('PersonContactTel').AsString := AObj.PersonContactTel;
      //18 FamilyContactTel
      FieldByName('FamilyContactTel').AsString := AObj.FamilyContactTel;
      //19 OtherContact
      FieldByName('OtherContact').AsString := AObj.OtherContact;
      //20 Email
      FieldByName('Email').AsString := AObj.Email;
      //21 Residence
      FieldByName('Residence').AsString := AObj.Residence;
      //22 InServiceGUID
      FieldByName('InServiceGUID').AsString := AObj.InServiceGUID;
      //23 PositionGUID
      FieldByName('PositionGUID').AsString := AObj.PositionGUID;
      //24 OthersPositionGUID
      FieldByName('OthersPositionGUID').AsString := AObj.OthersPositionGUID;
      //25 ResidenceTypeGUID
      FieldByName('ResidenceTypeGUID').AsString := AObj.ResidenceTypeGUID;
      //26 InsureNo
      FieldByName('InsureNo').AsString := AObj.InsureNo;
      //27 PayMentNo
      FieldByName('PayMentNo').AsString := AObj.PayMentNo;
      //28 CompanyGUID
      FieldByName('CompanyGUID').AsString := AObj.CompanyGUID;
      //29 DepartmentGUID
      FieldByName('DepartmentGUID').AsString := AObj.DepartmentGUID;
      //30 InCompanyDate
      FieldByName('InCompanyDate').AsDateTime := AObj.InCompanyDate;
      //31 TryoutDate
      FieldByName('TryoutDate').AsDateTime := AObj.TryoutDate;
      //32 FormalDate
      FieldByName('FormalDate').AsDateTime := AObj.FormalDate;
      //33 EmpContractNo
      FieldByName('EmpContractNo').AsString := AObj.EmpContractNo;
      //34 EndDate
      FieldByName('EndDate').AsDateTime := AObj.EndDate;
      //35 EmployeeTypeGUID
      FieldByName('EmployeeTypeGUID').AsString := AObj.EmployeeTypeGUID;
      //36 CallTitleGUID
      FieldByName('CallTitleGUID').AsString := AObj.CallTitleGUID;
      //37 CallTitleDate
      FieldByName('CallTitleDate').AsDateTime := AObj.CallTitleDate;
      //38 ForeignLangaugeLevelGUID
      FieldByName('ForeignLangaugeLevelGUID').AsString := AObj.ForeignLangaugeLevelGUID;
      //39 ComputerTechnolicGUID
      FieldByName('ComputerTechnolicGUID').AsString := AObj.ComputerTechnolicGUID;
      //40 FamilyAddress
      FieldByName('FamilyAddress').AsString := AObj.FamilyAddress;
      //41 Remark
      FieldByName('Remark').AsString := AObj.Remark;
      //42 IsEnable
      FieldByName('IsEnable').AsBoolean := AObj.IsEnable;
      //43 OrderNo
      FieldByName('OrderNo').AsInteger := AObj.OrderNo;
      //44 RightNum
      FieldByName('RightNum').AsInteger := AObj.RightNum;
      //45 BarCode
      FieldByName('BarCode').AsString := AObj.BarCode;
      //46 ICCardID
      FieldByName('ICCardID').AsString := AObj.ICCardID;
      //47 InputDate
      FieldByName('InputDate').AsDateTime := AObj.InputDate;
      //48 UserGUID
      FieldByName('UserGUID').AsString := AObj.UserGUID;
      post;
    end;
  end;
end;

class procedure TEasyhrEmployee.DeleteClientDataSet(ACds: TClientDataSet; AObj: TEasyhrEmployee; var AObjList: TList);
var
  I,
  DelIndex: Integer;
begin
  DelIndex := -1;
  if ACds.Locate('EmployeeGUID', VarArrayOf([AObj.EmployeeGUID]), [loCaseInsensitive]) then
    ACds.Delete;
  for I := 0 to AObjList.Count - 1 do
  begin
    if TEasyhrEmployee(AObjList[I]).EmployeeGUID = TEasyhrEmployee(AObj).EmployeeGUID then
    begin
      DelIndex := I;
      Break;
    end;
  end;
  if DelIndex <> -1 then
  begin
    TEasyhrEmployee(AObjList[DelIndex]).Free;
    AObjList.Delete(DelIndex);
  end; 
end;

class procedure TEasyhrEmployee.InitSinglehrEmployee(
  AClientDataSet: TClientDataSet; var AObj: TEasyhrEmployee);
begin
  with AObj do
  begin
  //1 EmployeeGUID
    EmployeeGUID := AClientDataSet.FieldByName('EmployeeGUID').AsString;
  //2 EmployeeCName
    EmployeeCName := AClientDataSet.FieldByName('EmployeeCName').AsString;
  //3 EmployeeEName
    EmployeeEName := AClientDataSet.FieldByName('EmployeeEName').AsString;
  //4 SexGUID
    SexGUID := AClientDataSet.FieldByName('SexGUID').AsString;
  //5 Birthday
    Birthday := AClientDataSet.FieldByName('Birthday').AsDateTime;
  //6 Stature
    Stature := AClientDataSet.FieldByName('Stature').AsFloat;
  //7 BroodGUID
    BroodGUID := AClientDataSet.FieldByName('BroodGUID').AsString;
  //8 NationGUID
    NationGUID := AClientDataSet.FieldByName('NationGUID').AsString;
  //9 NativePlaceGUID
    NativePlaceGUID := AClientDataSet.FieldByName('NativePlaceGUID').AsString;
  //10 IdentityCard
    IdentityCard := AClientDataSet.FieldByName('IdentityCard').AsString;
  //11 StudyExperienceGUID
    StudyExperienceGUID := AClientDataSet.FieldByName('StudyExperienceGUID').AsString;
  //12 Speciality
    Speciality := AClientDataSet.FieldByName('Speciality').AsString;
  //13 MarryGUID
    MarryGUID := AClientDataSet.FieldByName('MarryGUID').AsString;
  //14 PolityStatusGUID
    PolityStatusGUID := AClientDataSet.FieldByName('PolityStatusGUID').AsString;
  //15 GraduateInstitute
    GraduateInstitute := AClientDataSet.FieldByName('GraduateInstitute').AsString;
  //16 Photo
//        Photo := AClientDataSet.FieldByName('Photo').AsEasyNullType;
  //17 PersonContactTel
    PersonContactTel := AClientDataSet.FieldByName('PersonContactTel').AsString;
  //18 FamilyContactTel
    FamilyContactTel := AClientDataSet.FieldByName('FamilyContactTel').AsString;
  //19 OtherContact
    OtherContact := AClientDataSet.FieldByName('OtherContact').AsString;
  //20 Email
    Email := AClientDataSet.FieldByName('Email').AsString;
  //21 Residence
    Residence := AClientDataSet.FieldByName('Residence').AsString;
  //22 InServiceGUID
    InServiceGUID := AClientDataSet.FieldByName('InServiceGUID').AsString;
  //23 PositionGUID
    PositionGUID := AClientDataSet.FieldByName('PositionGUID').AsString;
  //24 OthersPositionGUID
    OthersPositionGUID := AClientDataSet.FieldByName('OthersPositionGUID').AsString;
  //25 ResidenceTypeGUID
    ResidenceTypeGUID := AClientDataSet.FieldByName('ResidenceTypeGUID').AsString;
  //26 InsureNo
    InsureNo := AClientDataSet.FieldByName('InsureNo').AsString;
  //27 PayMentNo
    PayMentNo := AClientDataSet.FieldByName('PayMentNo').AsString;
  //28 CompanyGUID
    CompanyGUID := AClientDataSet.FieldByName('CompanyGUID').AsString;
  //29 DepartmentGUID
    DepartmentGUID := AClientDataSet.FieldByName('DepartmentGUID').AsString;
  //30 InCompanyDate
    InCompanyDate := AClientDataSet.FieldByName('InCompanyDate').AsDateTime;
  //31 TryoutDate
    TryoutDate := AClientDataSet.FieldByName('TryoutDate').AsDateTime;
  //32 FormalDate
    FormalDate := AClientDataSet.FieldByName('FormalDate').AsDateTime;
  //33 EmpContractNo
    EmpContractNo := AClientDataSet.FieldByName('EmpContractNo').AsString;
  //34 EndDate
    EndDate := AClientDataSet.FieldByName('EndDate').AsDateTime;
  //35 EmployeeTypeGUID
    EmployeeTypeGUID := AClientDataSet.FieldByName('EmployeeTypeGUID').AsString;
  //36 CallTitleGUID
    CallTitleGUID := AClientDataSet.FieldByName('CallTitleGUID').AsString;
  //37 CallTitleDate
    CallTitleDate := AClientDataSet.FieldByName('CallTitleDate').AsDateTime;
  //38 ForeignLangaugeLevelGUID
    ForeignLangaugeLevelGUID := AClientDataSet.FieldByName('ForeignLangaugeLevelGUID').AsString;
  //39 ComputerTechnolicGUID
    ComputerTechnolicGUID := AClientDataSet.FieldByName('ComputerTechnolicGUID').AsString;
  //40 FamilyAddress
    FamilyAddress := AClientDataSet.FieldByName('FamilyAddress').AsString;
  //41 Remark
    Remark := AClientDataSet.FieldByName('Remark').AsString;
  //42 IsEnable
    IsEnable := AClientDataSet.FieldByName('IsEnable').AsBoolean;
  //43 OrderNo
    OrderNo := AClientDataSet.FieldByName('OrderNo').AsInteger;
  //44 RightNum
    RightNum := AClientDataSet.FieldByName('RightNum').AsInteger;
  //45 BarCode
    BarCode := AClientDataSet.FieldByName('BarCode').AsString;
  //46 ICCardID
    ICCardID := AClientDataSet.FieldByName('ICCardID').AsString;
  //47 InputDate
    InputDate := AClientDataSet.FieldByName('InputDate').AsDateTime;
  //48 UserGUID
    UserGUID := AClientDataSet.FieldByName('UserGUID').AsString;
  end;
end;

end.
