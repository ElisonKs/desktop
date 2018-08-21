inherited frmCADASS: TfrmCADASS
  Caption = 'Cadastro de Associado'
  ClientHeight = 359
  OnCreate = FormCreate
  ExplicitWidth = 603
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel [0]
    Left = 14
    Top = 279
    Width = 41
    Height = 13
    Caption = 'Fazenda'
    FocusControl = DBEdit4
  end
  inherited pnlBotoes: TPanel
    Height = 309
    ExplicitHeight = 326
    inherited Panel5: TPanel
      Height = 299
      ExplicitHeight = 316
    end
    inherited Panel6: TPanel
      Top = 299
      ExplicitTop = 316
    end
    inherited Panel7: TPanel
      Height = 299
      ExplicitHeight = 316
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 321
    ExplicitTop = 338
  end
  inherited stbStatus: TStatusBar
    Top = 340
    ExplicitTop = 357
  end
  inherited pnlPrincipal: TPanel
    Height = 309
    ExplicitHeight = 326
    object Label1: TLabel
      Left = 14
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 14
      Top = 48
      Width = 17
      Height = 13
      Caption = 'Cpf'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 14
      Top = 88
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 14
      Top = 128
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 14
      Top = 223
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 246
      Top = 223
      Width = 33
      Height = 13
      Caption = 'Celular'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 232
      Top = 48
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object DBEdit1: TDBEdit
      Left = 14
      Top = 24
      Width = 134
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'ID_ASS'
      DataSource = DM.dsASS
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 14
      Top = 64
      Width = 199
      Height = 21
      DataField = 'CPF_ASS'
      DataSource = DM.dsASS
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 14
      Top = 104
      Width = 442
      Height = 21
      DataField = 'NOME_ASS'
      DataSource = DM.dsASS
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 12
      Top = 239
      Width = 171
      Height = 21
      DataField = 'TELEFONE_ASS'
      DataSource = DM.dsASS
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 246
      Top = 239
      Width = 171
      Height = 21
      DataField = 'CEL_ASS'
      DataSource = DM.dsASS
      TabOrder = 4
    end
    object DBMemo1: TDBMemo
      Left = 14
      Top = 142
      Width = 442
      Height = 75
      DataField = 'ENDERECO_ASS'
      DataSource = DM.dsASS
      TabOrder = 5
    end
    object DateTimePicker1: TDateTimePicker
      Left = 232
      Top = 63
      Width = 186
      Height = 21
      Date = 43333.449259884260000000
      Time = 43333.449259884260000000
      TabOrder = 6
    end
  end
  object DBEdit4: TDBEdit [6]
    Left = 12
    Top = 294
    Width = 357
    Height = 21
    DataField = 'FAZENDA_ASS'
    DataSource = DM.dsASS
    TabOrder = 5
  end
end
