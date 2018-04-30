object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 182
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 32
    Width = 186
    Height = 21
    Date = 42361.443974490750000000
    Time = 42361.443974490750000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 232
    Top = 32
    Width = 186
    Height = 21
    Date = 42361.444092268520000000
    Time = 42361.444092268520000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 88
    Width = 153
    Height = 25
    Caption = 'Vendas por Per'#237'odo'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 88
    Width = 153
    Height = 25
    Caption = 'Produtos Mais Vendidos'
    TabOrder = 3
  end
end
