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
//------------------------------------------------------------------------------}
unit untImagesSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, untEasyButtons;

type
  TfrmImagesSelect = class(TForm)
    ListView1: TListView;
    imgVW: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FControlFlag: Integer;
  end;

var
  frmImagesSelect: TfrmImagesSelect;

implementation

uses untTvDirectoryOper;

{$R *.dfm}

procedure TfrmImagesSelect.FormCreate(Sender: TObject);
var
  ABmp: TBitmap;
  I   : Integer;
  ATmpListItem: TListItem;
begin
  ListView1.Items.Clear;
  ABmp := TBitmap.Create;
  ABmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'images\Tree.bmp');
  imgVW.Add(ABmp, nil);
  ABmp.Free;
  for I := 0 to imgVW.Count - 1 do
  begin
    ATmpListItem := ListView1.Items.Add;
    ATmpListItem.Caption := IntToStr(I);
    ATmpListItem.ImageIndex := I;
  end;
end;

procedure TfrmImagesSelect.FormDeactivate(Sender: TObject);
begin
  Close;
end;

procedure TfrmImagesSelect.ListView1Click(Sender: TObject);
begin
  if ListView1.Selected = nil then Exit;
  if FControlFlag = 1 then
    frmTvDirectoryOper.edtImage1.Text := IntToStr(ListView1.Selected.Index)
  else if FControlFlag = 2 then
    frmTvDirectoryOper.edtImage2.Text := IntToStr(ListView1.Selected.Index);
  Close;
end;

end.
