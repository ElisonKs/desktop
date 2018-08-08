inherited frmCONCON: TfrmCONCON
  Caption = 'Consultas'
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
          FieldName = 'ID_CON'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_ASS'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CON'
          Title.Caption = 'Data'
          Visible = True
        end>
    end
  end
end
