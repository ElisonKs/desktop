inherited frmServico: TfrmServico
  Caption = 'Tipo de Servi'#231'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TPanel
    inherited dbgdPadrao: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_SER'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_SER'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end>
    end
  end
end
