object frmCONSALU: TfrmCONSALU
  Left = 0
  Top = 0
  Caption = 'Consultar Alugu'#233'is'
  ClientHeight = 279
  ClientWidth = 552
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
    Left = 8
    Top = 152
    Width = 32
    Height = 13
    Caption = 'Im'#243'vel'
  end
  object Label2: TLabel
    Left = 8
    Top = 192
    Width = 40
    Height = 13
    Caption = 'Inquilino'
  end
  object Label3: TLabel
    Left = 8
    Top = 233
    Width = 39
    Height = 13
    Caption = 'Loca'#231#227'o'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 26
    Width = 537
    Height = 120
    DataSource = DM.dsCONSULTA
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
        FieldName = 'COD_ALU'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MES_ALU'
        Title.Caption = 'M'#234's'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO_ALU'
        Title.Caption = 'Ano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_IMO'
        Title.Caption = 'Im'#243'vel'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_INQ'
        Title.Caption = 'Inquilino'
        Visible = True
      end>
  end
  object edCOD_IMO: TEdit
    Left = 8
    Top = 168
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 68
    Top = 165
    Width = 42
    Height = 25
    Caption = '?'
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 116
    Top = 168
    Width = 229
    Height = 21
    Color = clInactiveBorder
    TabOrder = 3
  end
  object edCOD_INQ: TEdit
    Left = 8
    Top = 208
    Width = 57
    Height = 21
    TabOrder = 4
  end
  object Button2: TButton
    Left = 68
    Top = 205
    Width = 42
    Height = 25
    Caption = '?'
    TabOrder = 5
  end
  object Edit4: TEdit
    Left = 116
    Top = 208
    Width = 229
    Height = 21
    Color = clInactiveBorder
    TabOrder = 6
  end
  object edCOD_LOC: TEdit
    Left = 8
    Top = 249
    Width = 57
    Height = 21
    TabOrder = 7
  end
  object Button3: TButton
    Left = 68
    Top = 246
    Width = 42
    Height = 25
    Caption = '?'
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 116
    Top = 249
    Width = 229
    Height = 21
    Color = clInactiveBorder
    TabOrder = 9
  end
  object Button4: TButton
    Left = 368
    Top = 208
    Width = 131
    Height = 55
    Caption = 'Pesquisar'
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 368
    Top = 169
    Width = 89
    Height = 21
    Caption = 'Limpar Filtros'
    TabOrder = 11
  end
end
