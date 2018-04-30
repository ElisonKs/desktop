object frmRELIMO: TfrmRELIMO
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio - Im'#243'veis'
  ClientHeight = 148
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 96
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 225
    Top = 8
    Width = 185
    Height = 73
    Caption = 'Modelo'
    ItemIndex = 1
    Items.Strings = (
      'Anal'#237'tico'
      'Sint'#233'tico')
    TabOrder = 2
  end
end
