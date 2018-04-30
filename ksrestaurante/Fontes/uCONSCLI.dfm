object frmCONSCLI: TfrmCONSCLI
  Left = 0
  Top = 0
  Caption = 'Consulta - Clientes'
  ClientHeight = 201
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 293
    Top = 176
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label2: TLabel
    Left = 19
    Top = 174
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 601
    Height = 120
    DataSource = DM.dsCLI
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CLI'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLI'
        Title.Caption = 'Nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_CLI'
        Width = 200
        Visible = True
      end>
  end
  object edConsulta: TEdit
    Left = 52
    Top = 172
    Width = 232
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 504
    Top = 168
    Width = 89
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 344
    Top = 172
    Width = 129
    Height = 21
    TabOrder = 3
  end
end
