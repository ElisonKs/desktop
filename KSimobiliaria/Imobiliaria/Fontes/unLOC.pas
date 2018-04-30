unit unLOC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmLOC = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    edDESC_IMO: TEdit;
    edNOME_INQ: TEdit;
    edNOME_FIA: TEdit;
    btSalvar: TButton;
    btCancelar: TButton;
    btExcluir: TButton;
    btSair: TButton;
    edCODIMO_LOC: TEdit;
    edCODINQ_LOC: TEdit;
    edCODFIA_LOC: TEdit;
    edCOD_LOC: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edCODIMO_LOCExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edCODINQ_LOCExit(Sender: TObject);
    procedure edCODFIA_LOCExit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure edCOD_LOCExit(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edCOD_LOCEnter(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure GerarAlugueis;
    function pegarCodlocacao:integer;
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure limparCampos;
  public
    { Public declarations }
  end;

var
  frmLOC: TfrmLOC;

implementation

{$R *.dfm}

uses unCONSLOC, unIMO, unDM, unINQ, unFIA;

procedure TfrmLOC.btCancelarClick(Sender: TObject);
begin
     DM.cdsLOC.Close;
     limparCampos;

end;

procedure TfrmLOC.btExcluirClick(Sender: TObject);
begin
    DM.cdsLOC.Delete;
    DM.cdsloc.ApplyUpdates(0);
    limparCampos;
end;

procedure TfrmLOC.btSairClick(Sender: TObject);
begin
  if not DM.cdsLOC.Active then
  begin
    Close;
  end;
end;

procedure TfrmLOC.btSalvarClick(Sender: TObject);
var
   mesinicio,mesfim,anoinicio,anofim,codloc,venc,qtd:integer;
begin
   DM.cdsLOC.FieldByName('CODIMO_LOC').AsString := edCODIMO_LOC.Text;
   DM.cdsLOC.FieldByName('CODINQ_LOC').AsString := edCODINQ_LOC.Text;
   DM.cdsLOC.FieldByName('CODFIA_LOC').AsString := edCODFIA_LOC.Text;
   DM.cdsLOC.FieldByName('COD_LOC').AsString := edCOD_LOC.Text;
  





   DM.cdsLOC.ApplyUpdates(0);
   edCOD_LOC.SetFocus;




end;

procedure TfrmLOC.Button1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmCONSLOC,frmCONSLOC);
   frmCONSLOC.ShowModal;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
     edCOD_LOC.Text := DM.cdsGRAVAR.FieldByName('COD_LOC').AsString;
     edCOD_LOCExit(Self);
   end;
end;

procedure TfrmLOC.Button2Click(Sender: TObject);
begin
 Application.CreateForm(TfrmIMO,frmIMO);
   frmIMO.mostrarConfirmar := True;
   frmIMO.ShowModal;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
      edCODIMO_LOC.Text := DM.cdsCONSULTA.FieldByName('COD_IMO').AsString;
      edCODIMO_LOCExit(Self);
   end;

end;

procedure TfrmLOC.Button3Click(Sender: TObject);
begin
   Application.CreateForm(TfrmINQ,frmINQ);
   frmINQ.mostrarConfirmar := True;
   frmINQ.ShowModal;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
      edCODINQ_LOC.Text := DM.cdsCONSULTA.FieldByName('COD_INQ').AsString;
      edCODINQ_LOCExit(Self);
   end;
end;

procedure TfrmLOC.Button4Click(Sender: TObject);
begin
     Application.CreateForm(TfrmFIA,frmFIA);
   frmFIA.mostrarConfirmar := True;
   frmFIA.ShowModal;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
      edCODFIA_LOC.Text := DM.cdsCONSULTA.FieldByName('COD_FIA').AsString;
      edCODFIA_LOCExit(Self);
   end;
end;

procedure TfrmLOC.Button5Click(Sender: TObject);
var
   mesinicio,mesfim,anoinicio,anofim,codloc,venc,qtd:integer;
begin
 if Application.MessageBox('Deseja gerar os alugueis?','Gera��o de alugu�is',mb_yesno + mb_iconquestion) = id_yes then
   Begin
      mesinicio := DM.cdsloc.FieldByName('MESINICIO_LOC').AsInteger;
      mesfim := DM.cdsloc.FieldByName('MESFIM_LOC').AsInteger;
      anoinicio := DM.cdsloc.FieldByName('ANOINICIO_LOC').AsInteger;
      anofim := DM.cdsloc.FieldByName('ANOFIM_LOC').AsInteger;
      codloc :=  DM.cdsloc.FieldByName('COD_LOC').AsInteger;
      venc := DM.cdsloc.FieldByName('VENC_LOC').AsInteger;

     qtd := DM.GerarAlugueis(mesinicio,anoinicio,mesfim,anofim,codloc,venc);
     Showmessage('Gerado(s) ' + vartostr(qtd) + ' aluguel(�is)!');
   End;
end;

procedure TfrmLOC.edCODFIA_LOCExit(Sender: TObject);
begin
   if edCODFIA_LOC.Text <> '' then
  begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from fiador where cod_fia= ' + edCODFIA_LOC.Text;
    DM.cdsCONSULTA.Open;
    if DM.cdsCONSULTA.IsEmpty then
        edNOME_FIA.Text := 'Cadastro n�o encontrado'
    else
        edNOME_FIA.Text := DM.cdsCONSULTA.FieldByName('NOME_FIA').AsString;
  end;
end;

procedure TfrmLOC.edCODIMO_LOCExit(Sender: TObject);
begin
if edCODIMO_LOC.Text <> '' then
  begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from imovel where cod_imo= ' + edCODIMO_LOC.Text;
    DM.cdsCONSULTA.Open;
    if DM.cdsCONSULTA.IsEmpty then
        edDESC_IMO.Text := 'Cadastro n�o encontrado'
    else
        edDESC_IMO.Text := DM.cdsCONSULTA.FieldByName('DESC_IMO').AsString;
  end;
end;

procedure TfrmLOC.edCODINQ_LOCExit(Sender: TObject);
begin
     if edCODINQ_LOC.Text <> '' then
  begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from inquilino where cod_inq= ' + edCODINQ_LOC.Text;
    DM.cdsCONSULTA.Open;
    if DM.cdsCONSULTA.IsEmpty then
        edNOME_INQ.Text := 'Cadastro n�o encontrado'
    else
        edNOME_INQ.Text := DM.cdsCONSULTA.FieldByName('NOME_INQ').AsString;
  end;
end;

procedure TfrmLOC.edCOD_LOCEnter(Sender: TObject);
begin
   btCancelarClick(Self);
end;

procedure TfrmLOC.edCOD_LOCExit(Sender: TObject);
begin
  if edCOD_LOC.Text = '' then
     edCOD_LOC.Text := '0';

 DM.cdsLOC.Close;
 DM.cdsLOC.CommandText := 'select * from locacao where cod_loc= ' + edCOD_LOC.Text;
 DM.cdsLOC.Open;
 if DM.cdsLOC.IsEmpty then
 begin
  DM.cdsLOC.Insert;
  btSalvar.Enabled := True;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
  btSair.Enabled := False;
 end
 else
 begin
   edCODIMO_LOC.Text := DM.cdsLOC.FieldByName('CODIMO_LOC').AsString;
   edCODINQ_LOC.Text := DM.cdsLOC.FieldByName('CODINQ_LOC').AsString;
   edCODFIA_LOC.Text := DM.cdsLOC.FieldByName('CODFIA_LOC').AsString;
   edCODIMO_LOCExit(Self);
   edCODINQ_LOCExit(Self);
   edCODFIA_LOCExit(Self);
   DM.cdsLOC.Edit;
   btSalvar.Enabled := True;
   btCancelar.Enabled := True;
   btExcluir.Enabled := True;
   btSair.Enabled := False;
   Button5.Enabled := True;
 end;
end;

procedure TfrmLOC.GerarAlugueis;
begin
    DM.cdsCONSULTA.Close;

end;

procedure TfrmLOC.limparCampos;
begin
      edCODIMO_LOC.Clear;
      edCODINQ_LOC.Clear;
      edCODFIA_LOC.Clear;
      edDESC_IMO.Clear;
      edNOME_INQ.Clear;
      edNOME_FIA.Clear;
      edCOD_LOC.Clear;
      btExcluir.Enabled := false;
      Button5.Enabled := False;
end;

function TfrmLOC.pegarCodlocacao: integer;
begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select (max(cod_loc) +1) as cod from locacao';
    DM.cdsCONSULTA.Open;
    Result := DM.cdsCONSULTA.FieldByName('cod').AsInteger;
end;

end.
