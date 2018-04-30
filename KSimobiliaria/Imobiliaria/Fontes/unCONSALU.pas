unit unCONSALU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCONSALU = class(TForm)
    DBGrid1: TDBGrid;
    edCOD_IMO: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    edCOD_INQ: TEdit;
    Label2: TLabel;
    Button2: TButton;
    Edit4: TEdit;
    edCOD_LOC: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Edit6: TEdit;
    Button4: TButton;
    Button5: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure carregarGrid;
  public
    { Public declarations }
  end;

var
  frmCONSALU: TfrmCONSALU;

implementation

{$R *.dfm}

uses unDM;

{ TForm1 }

procedure TfrmCONSALU.Button4Click(Sender: TObject);
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText := 'select * from aluguel ' +
                                 ' left outer join locacao on locacao.cod_loc = aluguel.codloc_alu ' +
                                 ' left outer join imovel on imovel.cod_imo = locacao.codimo_loc ' +
                                 ' left outer join inquilino on inquilino.cod_inq = locacao.codinq_loc ' +
                                 ' left outer join fiador on fiador.cod_fia = locacao.codfia_loc ' +
                                 ' where 1=1';
   if edCOD_IMO.Text <> '' then
       DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' AND CODIMO_LOC = ' + edCOD_IMO.Text;
   if edCOD_INQ.Text <> '' then
       DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' AND CODINQ_LOC = ' + edCOD_INQ.Text;
   if edCOD_LOC.Text <> '' then
       DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' AND CODLOC_ALU = ' + edCOD_LOC.Text;

   DM.cdsCONSULTA.Open;
end;

procedure TfrmCONSALU.carregarGrid;
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText := 'select * from aluguel ' +
                                 ' left outer join locacao on locacao.cod_loc = aluguel.codloc_alu ' +
                                 ' left outer join imovel on imovel.cod_imo = locacao.codimo_loc ' +
                                 ' left outer join inquilino on inquilino.cod_inq = locacao.codinq_loc ' +
                                 ' left outer join fiador on fiador.cod_fia = locacao.codfia_loc ' +
                                 ' where 1=1';
   if edCOD_IMO.Text <> '' then
       DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' AND CODIMO_LOC = ' + edCOD_IMO.Text;
   if edCOD_INQ.Text <> '' then
       DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' AND CODINQ_LOC = ' + edCOD_INQ.Text;
   if edCOD_LOC.Text <> '' then
       DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' AND CODLOC_ALU = ' + edCOD_LOC.Text;

   DM.cdsCONSULTA.Open;


end;

procedure TfrmCONSALU.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCONSALU.FormShow(Sender: TObject);
begin
   carregarGrid;
end;

end.
