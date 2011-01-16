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
unit untFrmDsnEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ed_DsnBase, ed_Designer, ed_dsncont, untEasyPageControl;

type
  TFrmDsnEdit = class(TFrame)
    DesignSurface1: TDesignSurface;
    FormDesigner: TzFormDesigner;
    procedure FormDesignerCanRename(Sender: TObject; Component: TComponent;
      const NewName: String; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
  end;

implementation

uses untEasyFormDesigner;

{$R *.dfm}

destructor TFrmDsnEdit.Destroy;
begin
  if FormDesigner.Target <> nil then
    FormDesigner.Target.Free;
  inherited;
end;

procedure TFrmDsnEdit.FormDesignerCanRename(Sender: TObject;
  Component: TComponent; const NewName: String; var Accept: Boolean);
begin
  if (Component = FormDesigner.Root) or (Component = nil) then
    (Parent as TEasyTabSheet).Caption := NewName;
end;

end.
