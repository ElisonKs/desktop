inherited frmCadCLI: TfrmCadCLI
  Caption = 'Cadastro - Cliente'
  ClientHeight = 329
  ClientWidth = 616
  OnCreate = FormCreate
  ExplicitWidth = 622
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Left = 495
    Height = 279
    ExplicitLeft = 495
    ExplicitHeight = 279
    inherited Panel5: TPanel
      Height = 269
      ExplicitHeight = 269
    end
    inherited Panel6: TPanel
      Top = 269
      ExplicitTop = 269
    end
    inherited Panel7: TPanel
      Height = 269
      ExplicitHeight = 269
    end
  end
  inherited stbInformacao: TStatusBar
    Top = 291
    Width = 616
    ExplicitTop = 291
    ExplicitWidth = 616
  end
  inherited stbStatus: TStatusBar
    Top = 310
    Width = 616
    ExplicitTop = 310
    ExplicitWidth = 616
  end
  inherited Panel1: TPanel
    Width = 616
    ExplicitWidth = 616
  end
  inherited pnlPrincipal: TPanel
    Width = 495
    Height = 279
    ExplicitWidth = 495
    ExplicitHeight = 279
    object Label1: TLabel
      Left = 24
      Top = 6
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 24
      Top = 52
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 98
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 248
      Top = 98
      Width = 33
      Height = 13
      Caption = 'Celular'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 24
      Top = 152
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 24
      Top = 223
      Width = 28
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 25
      Width = 134
      Height = 21
      Hint = 'O C'#243'digo ser'#225' gerado automaticamente.'
      DataField = 'COD_CLI'
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 71
      Width = 329
      Height = 21
      DataField = 'NOME_CLI'
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 117
      Width = 199
      Height = 21
      DataField = 'TEL_CLI'
      TabOrder = 2
      OnEnter = DBEdit3Enter
    end
    object DBEdit4: TDBEdit
      Left = 229
      Top = 117
      Width = 199
      Height = 21
      DataField = 'CEL_CLI'
      TabOrder = 3
      OnEnter = DBEdit4Enter
    end
    object DBEdit5: TDBEdit
      Left = 24
      Top = 171
      Width = 464
      Height = 21
      DataField = 'ENDERECO'
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 24
      Top = 242
      Width = 394
      Height = 21
      DataField = 'BAIRRO'
      TabOrder = 5
    end
  end
end
