inherited frmCadSer: TfrmCadSer
  Caption = 'Tipo de Servi'#231'o - Cadastro'
  ClientHeight = 215
  ClientWidth = 647
  OnCreate = FormCreate
  ExplicitWidth = 653
  ExplicitHeight = 244
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Left = 526
    Height = 165
    inherited Panel5: TPanel
      Height = 155
    end
    inherited Panel6: TPanel
      Top = 155
    end
    inherited Panel7: TPanel
      Height = 155
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 177
    Width = 647
  end
  inherited stbStatus: TStatusBar
    Top = 196
    Width = 647
  end
  inherited Panel1: TPanel
    Width = 647
  end
  inherited pnlPrincipal: TPanel
    Width = 526
    Height = 165
    ExplicitLeft = 24
    ExplicitTop = 18
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
    object Label2: TLabel
      Left = 24
      Top = 67
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 25
      Top = 109
      Width = 24
      Height = 13
      Caption = 'Valor'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 40
      Width = 134
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'COD_SER'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 83
      Width = 394
      Height = 21
      DataField = 'NOME_SER'
      DataSource = DM.dsSER
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 125
      Width = 251
      Height = 21
      DataField = 'VALOR_SER'
      DataSource = DM.dsSER
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsSER
    Left = 328
    Top = 16
  end
end
