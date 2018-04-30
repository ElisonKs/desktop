object FrmPADRAOMANUTENCAO_: TFrmPADRAOMANUTENCAO_
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmPADRAOMANUTENCAO_'
  ClientHeight = 220
  ClientWidth = 597
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 476
    Top = 12
    Width = 121
    Height = 170
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object Panel5: TPanel
      Left = 112
      Top = 0
      Width = 9
      Height = 160
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 0
      Top = 160
      Width = 121
      Height = 10
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 112
      Height = 160
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      object btnFechar: TBitBtn
        Left = 7
        Top = 113
        Width = 94
        Height = 25
        Caption = '&Fechar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnFecharClick
      end
      object btnSalvar: TBitBtn
        Left = 7
        Top = 5
        Width = 94
        Height = 25
        Caption = '&Salvar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnSalvarClick
      end
    end
  end
  object stbInformacao: TStatusBar
    Left = 0
    Top = 182
    Width = 597
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 150
      end>
  end
  object stbStatus: TStatusBar
    Left = 0
    Top = 201
    Width = 597
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 12
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 12
    Width = 476
    Height = 170
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
  end
  object timer: TTimer
    Interval = 50
    OnTimer = timerTimer
    Left = 419
    Top = 24
  end
end
