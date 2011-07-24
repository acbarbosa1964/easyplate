unit untEasyDesignerGridPopuMenuReg;

{$I cxGridUtils.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes;

procedure DesignerGridPopuMenuRegRegister;

implementation

uses
{$IFDEF DELPHI6}
  Types, DesignIntf, DesignEditors,
{$ELSE}
  DsgnIntf,
{$ENDIF}
  cxGridPopupMenu, cxGridCustomPopUpMenu, cxGridReg, TypInfo, Dialogs;

type
  TcxGridPopupMenuEditor = class(TComponentEditor)
  public
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TcxGridPopupMenuProperty = class(TComponentProperty)
  private
    FGetValuesStrProc: TGetStrProc;
  protected
    procedure ReceiveComponentNames(const S: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure DesignerGridPopuMenuRegRegister;
begin
  RegisterPropertyEditor(TypeInfo(TComponent), TcxPopupMenuInfo, 'PopupMenu', TcxGridPopupMenuProperty);
  RegisterComponentEditor(TcxGridPopupMenu, TcxGridPopupMenuEditor);
  RegisterComponents('Easy Grid', [TcxGridPopupMenu]);
end;

{ TcxGridPopupMenuEditor }

function TcxGridPopupMenuEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'ExpressQuantumGrid Suite v' + cxGridVersion;
    1: Result := 'www.devexpress.com';
  end;
end;

function TcxGridPopupMenuEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

{ TcxGridPopupMenuProperty }

procedure TcxGridPopupMenuProperty.GetValues(Proc: TGetStrProc);
begin
  FGetValuesStrProc := Proc;
  try
    Designer.GetComponentNames(GetTypeData(GetPropType), ReceiveComponentNames);
  finally
    FGetValuesStrProc := nil;
  end;
end;

procedure TcxGridPopupMenuProperty.ReceiveComponentNames(const S: string);
var
  AComponent: TComponent;
  Intf: IUnknown;
begin
  AComponent := Designer.GetComponent(S);
  if Assigned(FGetValuesStrProc) and
     Assigned(AComponent) and
     (
      {$IFDEF DELPHI5}
      Supports(AComponent, IDoPopup, Intf)
      {$ELSE}
      (AComponent.GetInterface(IDoPopup, Intf) and (Intf <> nil))
      {$ENDIF}
      or
     (AComponent.ClassName = 'TPopupMenu') or (AComponent.ClassName = 'TdxBarPopupMenu')) then
      FGetValuesStrProc(S);
end;

initialization
  DesignerGridPopuMenuRegRegister;

end.
