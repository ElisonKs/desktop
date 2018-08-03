inherited frmCADMED: TfrmCADMED
  Caption = 'Cadastro de M'#233'dico'
  ClientHeight = 250
  OnCreate = FormCreate
  ExplicitWidth = 603
  ExplicitHeight = 279
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Height = 200
    ExplicitHeight = 281
    inherited Panel5: TPanel
      Height = 190
      ExplicitHeight = 271
    end
    inherited Panel6: TPanel
      Top = 190
      ExplicitTop = 271
    end
    inherited Panel7: TPanel
      Height = 190
      ExplicitHeight = 271
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 212
    ExplicitTop = 293
  end
  inherited stbStatus: TStatusBar
    Top = 231
    ExplicitTop = 312
  end
  inherited pnlPrincipal: TPanel
    Height = 200
    ExplicitLeft = 48
    ExplicitTop = 92
    ExplicitHeight = 240
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
  end
end
