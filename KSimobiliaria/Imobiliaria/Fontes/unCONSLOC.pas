unit unCONSLOC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCONSLOC = class(TForm)
    DBGrid1: TDBGrid;
    edCOD_IMO: TEdit;
    Label1: TLabel;
    Button1: TButton;
    edDESC_IMO: TEdit;
    edCOD_INQ: TEdit;
    Label2: TLabel;
    Button2: TButton;
    edNOME_INQ: TEdit;
    edCOD_FIA: TEdit;
    Label3: TLabel;
    Button3: TButton;
    edNOME_FIA: TEdit;
    Button4: TButton;
    Button5: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edCOD_IMOExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edCOD_INQExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edCOD_FIAExit(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure carregarGrid;
  public
    { Public declarations }
  end;

var
  frmCONSLOC: TfrmCONSLOC;

implementation

{$R *.dfm}

uses unDM, unIMO, unINQ, unFIA;

{ TForm1 }

procedure TfrmCONSLOC.Button1Click(Sender: TObject);
begin
 Application.CreateForm(TfrmIMO,frmIMO);
   frmIMO.mostrarConfirmar := True;
   frmIMO.ShowModal;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
      edCOD_IMO.Text := DM.cdsCONSULTA.FieldByName('COD_IMO').AsString;
      edCOD_IMOExit(Self);
   end;
end;

procedure TfrmCONSLOC.Button2Click(Sender: TObject);
begin
   Application.CreateForm(TfrmINQ,frmINQ);
   frmINQ.mostrarConfirmar := True;
   frmINQ.ShowModal;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
      edCOD_INQ.Text := DM.cdsCONSULTA.FieldByName('COD_INQ').AsString;
      edCOD_INQExit(Self);
   end;
end;

procedure TfrmCONSLOC.Button3Click(Sender: TObject);
begin
    Application.CreateForm(TfrmFIA,frmFIA);
   frmFIA.mostrarConfirmar := True;
   frmFIA.ShowModal;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
      edCOD_FIA.Text := DM.cdsCONSULTA.FieldByName('COD_FIA').AsString;
      edCOD_FIAExit(Self);
   end;
end;

procedure TfrmCONSLOC.Button4Click(Sender: TObject);
begin
carregarGrid;
end;

procedure TfrmCONSLOC.Button5Click(Sender: TObject);
begin
edCOD_IMO.Clear;
edDESC_IMO.Clear;
edCOD_INQ.Clear;
edNOME_INQ.Clear;
edCOD_FIA.Clear;
edNOME_FIA.Clear;
end;

procedure TfrmCONSLOC.carregarGrid;
begin
   DM.cdsGRAVAR.Close;
   DM.cdsGRAVAR.CommandText := 'select * from locacao ' +
                                 ' left outer join imovel on imovel.cod_imo = locacao.codimo_loc ' +
                                 ' left outer join inquilino on inquilino.cod_inq = locacao.codinq_loc ' +
                                 ' left outer join fiador on fiador.cod_fia = locacao.codfia_loc ' +
                                 ' where 1=1';
   if edCOD_IMO.Text <> '' then
       DM.cdsGRAVAR.CommandText := DM.cdsGRAVAR.CommandText + ' AND CODIMO_LOC = ' + edCOD_IMO.Text;
   if edCOD_INQ.Text <> '' then
       DM.cdsGRAVAR.CommandText := DM.cdsGRAVAR.CommandText + ' AND CODINQ_LOC = ' + edCOD_INQ.Text;
   if edCOD_FIA.Text <> '' then
       DM.cdsGRAVAR.CommandText := DM.cdsGRAVAR.CommandText + ' AND CODFIA_LOC = ' + edCOD_FIA.Text;

   DM.cdsGRAVAR.Open;


end;

procedure TfrmCONSLOC.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCONSLOC.edCOD_FIAExit(Sender: TObject);
begin
  if edCOD_FIA.Text <> '' then
  begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from fiador where cod_fia= ' + edCOD_FIA.Text;
    DM.cdsCONSULTA.Open;
    if DM.cdsCONSULTA.IsEmpty then
        edNOME_FIA.Text := 'Cadastro n�o encontrado'
    else
        edNOME_FIA.Text := DM.cdsCONSULTA.FieldByName('NOME_FIA').AsString;
  end;
end;

procedure TfrmCONSLOC.edCOD_IMOExit(Sender: TObject);
begin
if edCOD_IMO.Text <> '' then
  begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from imovel where cod_imo= ' + edCOD_IMO.Text;
    DM.cdsCONSULTA.Open;
    if DM.cdsCONSULTA.IsEmpty then
        edDESC_IMO.Text := 'Cadastro n�o encontrado'
    else
        edDESC_IMO.Text := DM.cdsCONSULTA.FieldByName('DESC_IMO').AsString;
  end;
end;

procedure TfrmCONSLOC.edCOD_INQExit(Sender: TObject);
begin
    if edCOD_INQ.Text <> '' then
  begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from inquilino where cod_inq= ' + edCOD_INQ.Text;
    DM.cdsCONSULTA.Open;
    if DM.cdsCONSULTA.IsEmpty then
        edNOME_INQ.Text := 'Cadastro n�o encontrado'
    else
        edNOME_INQ.Text := DM.cdsCONSULTA.FieldByName('NOME_INQ').AsString;
  end;
end;

procedure TfrmCONSLOC.FormShow(Sender: TObject);
begin
   carregarGrid;
end;

end.
