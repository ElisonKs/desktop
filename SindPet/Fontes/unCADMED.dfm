inherited frmCADMED: TfrmCADMED
  Caption = 'Cadastro de M'#233'dico'
  ClientHeight = 306
  OnCreate = FormCreate
  ExplicitWidth = 603
  ExplicitHeight = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Height = 256
    ExplicitHeight = 200
    inherited Panel5: TPanel
      Height = 246
      ExplicitHeight = 190
    end
    inherited Panel6: TPanel
      Top = 246
      ExplicitTop = 190
    end
    inherited Panel7: TPanel
      Height = 246
      ExplicitHeight = 190
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 268
    ExplicitTop = 212
  end
  inherited stbStatus: TStatusBar
    Top = 287
    ExplicitTop = 231
  end
  inherited pnlPrincipal: TPanel
    Height = 256
    ExplicitHeight = 200
    object Label1: TLabel
      Left = 14
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 14
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 14
      Top = 96
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label7: TLabel
      Left = 156
      Top = 26
      Width = 121
      Height = 13
      Caption = 'Gerado automaticamente'
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 14
      Top = 24
      Width = 134
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'ID_MED'
      DataSource = DM.dsMED
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 14
      Top = 72
      Width = 442
      Height = 21
      DataField = 'NOME_MED'
      DataSource = DM.dsMED
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 14
      Top = 110
      Width = 442
      Height = 75
      DataField = 'ENDERECO_MED'
      DataSource = DM.dsMED
      TabOrder = 2
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 32
      Top = 195
      Width = 416
      Height = 55
      Caption = 'Especialidade'
      Columns = 3
      DataField = 'TIPO_MED'
      DataSource = DM.dsMED
      Items.Strings = (
        'Odontologista'
        'Ginecologista'
        'Dermatologista')
      TabOrder = 3
      Values.Strings = (
        '1'
        '2'
        '3')
    end
  end
end
