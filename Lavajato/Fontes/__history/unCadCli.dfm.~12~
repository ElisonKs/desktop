inherited frmCadCli: TfrmCadCli
  Caption = 'CLiente - Cadastro'
  ClientHeight = 387
  ClientWidth = 558
  OnCreate = FormCreate
  ExplicitWidth = 564
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Left = 437
    Height = 337
    ExplicitLeft = 526
    ExplicitHeight = 337
    inherited Panel5: TPanel
      Height = 327
      ExplicitHeight = 327
    end
    inherited Panel6: TPanel
      Top = 327
      ExplicitTop = 327
    end
    inherited Panel7: TPanel
      Height = 327
      ExplicitHeight = 327
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 349
    Width = 558
    ExplicitTop = 349
    ExplicitWidth = 647
  end
  inherited stbStatus: TStatusBar
    Top = 368
    Width = 558
    ExplicitTop = 368
    ExplicitWidth = 647
  end
  inherited Panel1: TPanel
    Width = 558
    ExplicitWidth = 647
  end
  inherited pnlPrincipal: TPanel
    Width = 437
    Height = 337
    ExplicitWidth = 526
    ExplicitHeight = 337
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 43
      Height = 13
      Caption = 'Cpf/Cnpj'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 24
      Top = 147
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label5: TLabel
      Left = 263
      Top = 106
      Width = 52
      Height = 13
      Caption = 'Identidade'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 284
      Top = 188
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 284
      Top = 228
      Width = 65
      Height = 13
      Caption = 'Complemento'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 23
      Top = 280
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 303
      Top = 280
      Width = 33
      Height = 13
      Caption = 'Celular'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 24
      Top = 186
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label11: TLabel
      Left = 24
      Top = 229
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label12: TLabel
      Left = 164
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
    object DBEdit1: TDBEdit
      Left = 24
      Top = 40
      Width = 134
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'COD_CLI'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 80
      Width = 353
      Height = 21
      DataField = 'NOME_CLI'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 120
      Width = 233
      Height = 21
      DataField = 'CPFCNPJ_CLI'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 263
      Top = 120
      Width = 134
      Height = 21
      DataField = 'IDENTIDADE_CLI'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 284
      Top = 204
      Width = 134
      Height = 21
      DataField = 'NUM_END'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 284
      Top = 244
      Width = 149
      Height = 21
      DataField = 'COMP_END'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 23
      Top = 296
      Width = 264
      Height = 21
      DataField = 'TEL_CLI'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 303
      Top = 296
      Width = 130
      Height = 21
      DataField = 'CEL_CLI'
      DataSource = DataSource1
      TabOrder = 7
    end
    object edtCEP: TEdit
      Left = 24
      Top = 162
      Width = 121
      Height = 21
      TabOrder = 8
      OnExit = edtCEPExit
    end
    object edtENDERECO: TEdit
      Left = 24
      Top = 204
      Width = 233
      Height = 21
      Color = clGradientInactiveCaption
      ReadOnly = True
      TabOrder = 9
    end
    object edtBAIRRO: TEdit
      Left = 23
      Top = 245
      Width = 234
      Height = 21
      Color = clGradientInactiveCaption
      TabOrder = 10
    end
    object btnAutomoveis: TButton
      Left = 328
      Top = 30
      Width = 103
      Height = 31
      Caption = 'Autom'#243'veis'
      Enabled = False
      TabOrder = 11
      OnClick = btnAutomoveisClick
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsCLI
    Left = 328
    Top = 16
  end
end
