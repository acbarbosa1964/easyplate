object frmImagesSelect: TfrmImagesSelect
  Left = 377
  Top = 261
  BorderStyle = bsNone
  Caption = #22270#24418#36873#25321
  ClientHeight = 198
  ClientWidth = 149
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 149
    Height = 198
    Align = alClient
    Columns = <>
    SmallImages = imgVW
    TabOrder = 0
    ViewStyle = vsSmallIcon
    OnClick = ListView1Click
  end
  object imgVW: TImageList
    Left = 64
    Top = 64
  end
end
