inherited frmCADCON: TfrmCADCON
  Caption = 'Cadastro de Consulta'
  ClientHeight = 331
  OnCreate = FormCreate
  ExplicitWidth = 603
  ExplicitHeight = 360
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Height = 281
    ExplicitHeight = 281
    inherited Panel5: TPanel
      Height = 271
      ExplicitHeight = 271
    end
    inherited Panel6: TPanel
      Top = 271
      ExplicitTop = 271
    end
    inherited Panel7: TPanel
      Height = 271
      ExplicitHeight = 271
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 293
    ExplicitTop = 293
  end
  inherited stbStatus: TStatusBar
    Top = 312
    ExplicitTop = 312
  end
  inherited pnlPrincipal: TPanel
    Height = 281
    ExplicitLeft = -6
    ExplicitTop = -12
    ExplicitHeight = 281
    object Label1: TLabel
      Left = 14
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
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
      DataField = 'ID_ASS'
      DataSource = DM.dsASS
      TabOrder = 0
    end
  end
end
