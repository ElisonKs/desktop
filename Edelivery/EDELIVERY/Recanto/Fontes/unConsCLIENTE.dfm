object fmrConsCLIENTE: TfmrConsCLIENTE
  Left = 0
  Top = 0
  Caption = 'Consultar Cliente'
  ClientHeight = 234
  ClientWidth = 603
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 593
    Height = 185
    DataSource = DM.dsCLIENTE
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
        FieldName = 'COD_CLI'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLI'
        Title.Caption = 'Nome'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Caption = 'Bairro'
        Visible = True
      end>
  end
  object edConsultar: TEdit
    Left = 8
    Top = 208
    Width = 457
    Height = 21
    TabOrder = 1
  end
  object btConsultar: TButton
    Left = 479
    Top = 206
    Width = 100
    Height = 25
    Caption = 'Consultar'
    TabOrder = 2
    OnClick = btConsultarClick
  end
end
