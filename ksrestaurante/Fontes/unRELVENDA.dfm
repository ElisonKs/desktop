object frmRELVENDA: TfrmRELVENDA
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio - Vendas'
  ClientHeight = 203
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 32
    Width = 113
    Height = 21
    Date = 42783.921062037040000000
    Time = 42783.921062037040000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 144
    Top = 32
    Width = 105
    Height = 21
    Date = 42783.921062037040000000
    Time = 42783.921062037040000000
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 58
    Top = 72
    Width = 121
    Height = 73
    Caption = 'Formato'
    ItemIndex = 0
    Items.Strings = (
      'Resumo'
      'Completo')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 39
    Top = 162
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 162
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 240
    Top = 104
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
    Visible = False
  end
end
