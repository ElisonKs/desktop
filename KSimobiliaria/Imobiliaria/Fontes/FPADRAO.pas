Unit FPADRAO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  DB, DBClient;

type
  TFPADRAO_ = class(TForm)
    pnlBotoes: TPanel;
    stbStatus: TStatusBar;
    stbInformacao: TStatusBar;
    Panel1: TPanel;
    pnlPrincipal: TPanel;

    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnApagar: TBitBtn;
    gpFiltro: TGroupBox;
    cbContido: TCheckBox;
    edConsulta: TEdit;
    cbConsulta: TComboBox;
    btnPesquisar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    timer: TTimer;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    dbgdPadrao: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edConsultaChange(Sender: TObject);
    procedure dbgdPadraoTitleClick(Column: TColumn);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbgdPadraoDblClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  protected
    function  moverHint(form: TForm): String;
  private
    { Private declarations }
    procedure executarSQL;
    procedure executarSQL_filho;
    procedure verificarCamposComboBox;
  public
    { Public declarations }
    cdsPadrao: TClientDataSet;
    erroPadrao, manutencao: Boolean;
    tabelaPadrao, operacaoPadrao: String;

    campos, tabela, campoConsulta, join, where, orderBy: String;
    show, mostrarConfirmar, confirmou: Boolean;
    camposComboBox, descricaoComboBox: Array of String;
  end;

var
  FPADRAO_: TFPADRAO_;

implementation



{$R *.dfm}

uses unDM;



procedure TFPADRAO_.btnApagarClick(Sender: TObject);
begin
  cdsPadrao.Delete;
  erroPadrao     := (cdsPadrao.ApplyUpdates(0) > 0);
  operacaoPadrao := 'D';
  executarSQL;
end;

procedure TFPADRAO_.btnConfirmarClick(Sender: TObject);
begin
  confirmou := true;
  close;
end;

procedure TFPADRAO_.btnEditarClick(Sender: TObject);
begin
   executarSQL_filho;
   cdspadrao.Edit;
end;

procedure TFPADRAO_.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFPADRAO_.btnNovoClick(Sender: TObject);
begin
    btnPesquisarClick(Self);
end;

procedure TFPADRAO_.btnPesquisarClick(Sender: TObject);
begin
  executarSQL;
end;

procedure TFPADRAO_.dbgdPadraoDblClick(Sender: TObject);
begin
  if ((mostrarConfirmar) and (cdsConsulta.Active) and not(cdsConsulta.IsEmpty)) then
    begin
      confirmou := true;
      close;
    end;
end;

procedure TFPADRAO_.dbgdPadraoTitleClick(Column: TColumn);
begin
  cdsConsulta.IndexFieldNames := Column.FieldName;
end;

procedure TFPADRAO_.edConsultaChange(Sender: TObject);
begin
  if (cdsConsulta.Active) then
    dbgdPadrao.DataSource.DataSet.Locate(campoConsulta, edConsulta.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TFPADRAO_.executarSQL;
var
  select: String;
begin
  select := 'SELECT ' + self.campos + ' FROM ' + self.tabela;

  if (Trim(self.join) <> '') then
    select := select + ' ' + self.join;

  if not(cbContido.Checked) then
    select := select + ' WHERE UPPER(' + self.campoConsulta + ') LIKE UPPER(' + QuotedStr(edConsulta.Text + '%') + ')'
  else
    select := select + ' WHERE UPPER(' + self.campoConsulta + ') LIKE UPPER(' + QuotedStr('%' + edConsulta.Text + '%') + ')';

  if (Trim(self.where) <> '') then
    select := select + self.where;

  if (Trim(self.orderBy) <> '') then
    select := select + ' ORDER BY ' + self.orderBy;

  DM.cdsConsulta.Close;
  DM.cdsConsulta.CommandText := select;
  DM.cdsConsulta.Open;

  if (cdsConsulta.Active) then
    begin
      stbInformacao.Panels[2].Text := 'Quantidade de registros: ' + IntToStr(cdsConsulta.RecordCount);

      if not(cdsConsulta.IsEmpty) then
        begin
          cdsConsulta.First;
          dbgdPadrao.SetFocus;
        end;
    end;

end;

procedure TFPADRAO_.executarSQL_filho;
var
  select: String;
begin
  select := 'SELECT ' + self.campos + ' FROM ' + self.tabela;

  if (Trim(self.join) <> '') then
    select := select + ' ' + self.join;

  if not(cbContido.Checked) then
    select := select + ' WHERE UPPER(' + self.campoConsulta + ') LIKE UPPER(' + QuotedStr(edConsulta.Text + '%') + ')'
  else
    select := select + ' WHERE UPPER(' + self.campoConsulta + ') LIKE UPPER(' + QuotedStr('%' + edConsulta.Text + '%') + ')';

  if (Trim(self.where) <> '') then
    select := select + self.where;

  if (Trim(self.orderBy) <> '') then
    select := select + ' ORDER BY ' + self.orderBy;

  cdsPadrao.Close;
  cdspadrao.CommandText := select;
  cdspadrao.Open;
    where := '';

end;

procedure TFPADRAO_.FormCreate(Sender: TObject);
begin
  self.manutencao       := true;

  self.campos           := '';
  self.tabela           := '';
  self.join             := '';
  self.where            := '';
  self.orderBy          := '';
  self.campoConsulta    := '';
  self.show             := true;
  self.mostrarConfirmar := false;
  self.confirmou        := false;

  SetLength(camposComboBox, 0);
  SetLength(descricaoComboBox, 0);
end;

procedure TFPADRAO_.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    begin
      cdsConsulta.Close;
      Close;
    end;

  if not(dbgdPadrao.Focused) then
    begin
      if key = #13 then
        begin
          Key:= #0;
          Perform(Wm_NextDlgCtl,0,0);
        end;
    end;
end;

procedure TFPADRAO_.FormShow(Sender: TObject);
begin
  verificarCamposComboBox;

  if (self.show) then
    executarSQL;

  stbStatus.Font.Style := [fsBold];
  btnNovo.Visible      := manutencao;
  btnEditar.Visible      := manutencao;
  btnApagar.Visible      := manutencao;
  btnConfirmar.Visible := mostrarConfirmar;
end;

function TFPADRAO_.moverHint(form: TForm): String;
var
  i: Integer;
begin
  for i := 0 to form.componentcount - 1 do
    begin
      if (ActiveControl = form.components[i]) then
        begin
          if (form.components[i] is TControl) then
            begin
              if (Trim((form.components[i] as TControl).Hint) <> '') then
                Result := (form.components[i] as TControl).Hint;
            end;
        end;
    end;
end;

procedure TFPADRAO_.timerTimer(Sender: TObject);
begin
  stbInformacao.Panels[0].Text := 'Data: ' + DateToStr(Now);
  stbInformacao.Panels[1].Text := 'Hora: ' + TimeToStr(Now);
  stbStatus.SimpleText         := moverHint(Self);


  if (cdsConsulta.Active) then
    begin
      btnEditar.Enabled := not(cdsConsulta.IsEmpty);
      btnApagar.Enabled := not(cdsConsulta.IsEmpty);
      btnConfirmar.Enabled := not(cdsConsulta.IsEmpty);
    end;


end;

procedure TFPADRAO_.verificarCamposComboBox;
var
  i: Integer;
begin
  cbConsulta.Items.Clear;
  stbInformacao.Panels[2].Text := 'Quantidade de registros: 0';

  cbConsulta.Visible := ((Length(camposComboBox) > 0) and (Length(descricaoComboBox) > 0)) and (Length(descricaoComboBox) = Length(camposComboBox));

  if (cbConsulta.Visible) then
    begin
      for i := 0 to (Length(descricaoComboBox) - 1) do
        cbConsulta.Items.Add(descricaoComboBox[i]);

      cbConsulta.ItemIndex := 0;
    end;
end;

end.
