inherited frmCADFIA: TfrmCADFIA
  Caption = 'Cadastro - Fiador'
  ClientHeight = 536
  ClientWidth = 605
  OnCreate = FormCreate
  ExplicitTop = -77
  ExplicitWidth = 611
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Left = 484
    Height = 486
    ExplicitLeft = 484
    ExplicitHeight = 486
    inherited Panel5: TPanel
      Height = 476
      ExplicitHeight = 476
    end
    inherited Panel6: TPanel
      Top = 476
      ExplicitTop = 476
    end
    inherited Panel7: TPanel
      Height = 476
      ExplicitHeight = 476
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 498
    Width = 605
    ExplicitTop = 498
    ExplicitWidth = 605
  end
  inherited stbStatus: TStatusBar
    Top = 517
    Width = 605
    ExplicitTop = 517
    ExplicitWidth = 605
  end
  inherited Panel1: TPanel
    Width = 605
    ExplicitWidth = 605
  end
  inherited pnlPrincipal: TPanel
    Width = 484
    Height = 486
    ExplicitWidth = 484
    ExplicitHeight = 486
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 65
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 16
      Top = 106
      Width = 66
      Height = 13
      Caption = 'Nacionalidade'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 16
      Top = 148
      Width = 61
      Height = 13
      Caption = 'Naturalidade'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 135
      Top = 237
      Width = 44
      Height = 13
      Caption = 'Profiss'#227'o'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 18
      Top = 190
      Width = 52
      Height = 13
      Caption = 'Identidade'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 223
      Top = 190
      Width = 48
      Height = 13
      Caption = 'CPF/CNPJ'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 19
      Top = 327
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label10: TLabel
      Left = 18
      Top = 400
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 249
      Top = 400
      Width = 33
      Height = 13
      Caption = 'Celular'
      FocusControl = DBEdit11
    end
    object Label12: TLabel
      Left = 19
      Top = 442
      Width = 24
      Height = 13
      Caption = 'Email'
      FocusControl = DBEdit12
    end
    object Label5: TLabel
      Left = 156
      Top = 41
      Width = 125
      Height = 13
      Caption = 'Gerado automaticamente.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label13: TLabel
      Left = 156
      Top = 190
      Width = 55
      Height = 13
      Caption = 'Org'#227'o Exp.'
      FocusControl = DBEdit5
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 38
      Width = 134
      Height = 21
      Color = clInactiveBorder
      DataField = 'COD_FIA'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 79
      Width = 394
      Height = 21
      DataField = 'NOME_FIA'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 121
      Width = 394
      Height = 21
      DataField = 'NACIONALIDADE_FIA'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 163
      Width = 394
      Height = 21
      DataField = 'NATURALIDADE_FIA'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 135
      Top = 253
      Width = 275
      Height = 21
      DataField = 'PROFISSAO_FIA'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 18
      Top = 205
      Width = 132
      Height = 21
      DataField = 'RG_FIA'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 223
      Top = 205
      Width = 187
      Height = 21
      DataField = 'CPFCNPJ_FIA'
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 18
      Top = 415
      Width = 199
      Height = 21
      DataField = 'TELEFONE_FIA'
      DataSource = DataSource1
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 248
      Top = 415
      Width = 162
      Height = 21
      DataField = 'CELULAR_FIA'
      DataSource = DataSource1
      TabOrder = 10
    end
    object DBEdit12: TDBEdit
      Left = 16
      Top = 456
      Width = 394
      Height = 21
      DataField = 'EMAIL_FIA'
      DataSource = DataSource1
      TabOrder = 11
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 16
      Top = 233
      Width = 113
      Height = 88
      Caption = 'Estado Civil'
      DataField = 'ESTCIVIL_FIA'
      DataSource = DataSource1
      Items.Strings = (
        'Solteiro'
        'Casado'
        'Divorciado')
      TabOrder = 12
      Values.Strings = (
        '0'
        '1'
        '2')
    end
    object DBEdit5: TDBEdit
      Left = 156
      Top = 205
      Width = 56
      Height = 21
      DataField = 'ORGEXP_FIA'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBMemo1: TDBMemo
      Left = 18
      Top = 340
      Width = 392
      Height = 58
      DataField = 'ENDERECO_FIA'
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsFIA
    Left = 328
    Top = 288
  end
end
