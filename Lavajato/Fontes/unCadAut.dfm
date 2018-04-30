inherited frmCadAut: TfrmCadAut
  Caption = 'Autom'#243'veis - Cadastro'
  ClientHeight = 223
  ClientWidth = 647
  OnCreate = FormCreate
  ExplicitWidth = 653
  ExplicitHeight = 252
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Left = 526
    Height = 173
    ExplicitLeft = 526
    ExplicitHeight = 165
    inherited Panel5: TPanel
      Height = 163
      ExplicitHeight = 155
    end
    inherited Panel6: TPanel
      Top = 163
      ExplicitTop = 155
    end
    inherited Panel7: TPanel
      Height = 163
      ExplicitHeight = 155
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 185
    Width = 647
    ExplicitTop = 177
    ExplicitWidth = 647
  end
  inherited stbStatus: TStatusBar
    Top = 204
    Width = 647
    ExplicitTop = 196
    ExplicitWidth = 647
  end
  inherited Panel1: TPanel
    Width = 647
    ExplicitWidth = 647
  end
  inherited pnlPrincipal: TPanel
    Width = 526
    Height = 173
    ExplicitWidth = 526
    ExplicitHeight = 165
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
      Width = 34
      Height = 13
      Caption = 'Modelo'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 113
      Width = 29
      Height = 13
      Caption = 'Marca'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 350
      Top = 67
      Width = 19
      Height = 13
      Caption = 'Ano'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 40
      Width = 134
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'COD_AUT'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 83
      Width = 301
      Height = 21
      DataField = 'MODELO_AUT'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 126
      Width = 301
      Height = 21
      DataField = 'MARCA_AUT'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 348
      Top = 83
      Width = 134
      Height = 21
      DataField = 'ANO_AUT'
      DataSource = DataSource1
      TabOrder = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsAUT
    Left = 328
    Top = 16
  end
end
