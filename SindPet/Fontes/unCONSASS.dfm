inherited frmCONASS: TfrmCONASS
  Caption = 'Associados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    inherited Panel7: TPanel
      inherited btnNovo: TBitBtn
        Left = 7
        ExplicitLeft = 7
      end
    end
  end
  inherited pnlPrincipal: TPanel
    inherited dbgdPadrao: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_ASS'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_ASS'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end>
    end
  end
end
