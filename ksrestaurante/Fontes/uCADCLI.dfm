object CADCLI: TCADCLI
  Left = 0
  Top = 0
  Caption = 'Cadastro - Cliente'
  ClientHeight = 366
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = dbeNOME_CLI
  end
  object Label3: TLabel
    Left = 8
    Top = 132
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
    FocusControl = DBEdit1
  end
  object Label4: TLabel
    Left = 8
    Top = 169
    Width = 52
    Height = 13
    Caption = 'Referencia'
    FocusControl = DBEdit2
  end
  object Label5: TLabel
    Left = 7
    Top = 95
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = DBEdit3
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 238
    Width = 402
    Height = 120
    DataSource = DM.dsCONSULTA
    TabOrder = 6
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
        Width = 200
        Visible = True
      end>
  end
  object dbeNOME_CLI: TDBEdit
    Left = 8
    Top = 75
    Width = 394
    Height = 21
    DataField = 'NOME_CLI'
    DataSource = DM.dsCLI
    TabOrder = 1
  end
  object btIncluir: TButton
    Left = 8
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Incluir'
    Enabled = False
    TabOrder = 2
    OnClick = btIncluirClick
  end
  object btSalvar: TButton
    Left = 89
    Top = 207
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 3
    OnClick = btSalvarClick
  end
  object btExcluir: TButton
    Left = 170
    Top = 207
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 4
    OnClick = btExcluirClick
  end
  object btSair: TButton
    Left = 251
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 5
    OnClick = btSairClick
  end
  object edID_CLI: TEdit
    Left = 8
    Top = 35
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
    OnEnter = edID_CLIEnter
    OnExit = edID_CLIExit
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 148
    Width = 394
    Height = 21
    DataField = 'END_CLI'
    DataSource = DM.dsCLI
    TabOrder = 7
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 183
    Width = 394
    Height = 21
    DataField = 'REF_CLI'
    DataSource = DM.dsCLI
    TabOrder = 8
  end
  object DBEdit3: TDBEdit
    Left = 7
    Top = 112
    Width = 394
    Height = 21
    DataField = 'TEL_CLI'
    DataSource = DM.dsCLI
    TabOrder = 9
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsCAT
    Left = 240
    Top = 174
  end
end
