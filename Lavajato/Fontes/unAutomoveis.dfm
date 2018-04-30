inherited frmAutomoveis: TfrmAutomoveis
  Caption = 'Automoveis'
  ClientHeight = 320
  ClientWidth = 682
  ExplicitWidth = 688
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Left = 545
    Height = 270
    ExplicitLeft = 545
    ExplicitHeight = 270
    inherited Panel4: TPanel
      Height = 260
      ExplicitHeight = 260
    end
    inherited Panel5: TPanel
      Height = 260
      ExplicitHeight = 260
    end
    inherited Panel6: TPanel
      Top = 260
      ExplicitTop = 260
    end
    inherited Panel7: TPanel
      Height = 260
      ExplicitHeight = 260
    end
  end
  inherited stbStatus: TStatusBar
    Top = 282
    Width = 682
    ExplicitTop = 282
    ExplicitWidth = 682
  end
  inherited stbInformacao: TStatusBar
    Top = 301
    Width = 682
    ExplicitTop = 301
    ExplicitWidth = 682
  end
  inherited Panel1: TPanel
    Width = 682
    ExplicitWidth = 682
  end
  inherited pnlPrincipal: TPanel
    Width = 534
    Height = 270
    ExplicitWidth = 534
    ExplicitHeight = 270
    object Label1: TLabel [0]
      Left = 8
      Top = 224
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    inherited dbgdPadrao: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'MARCA_AUT'
          Title.Caption = 'Marca'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MODELO_AUT'
          Title.Caption = 'Modelo'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANO_AUT'
          Title.Caption = 'Ano'
          Visible = True
        end>
    end
    object edNomeCli: TEdit
      Left = 6
      Top = 241
      Width = 475
      Height = 21
      Color = clGradientInactiveCaption
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Panel3: TPanel
    Height = 270
    ExplicitHeight = 270
  end
end
