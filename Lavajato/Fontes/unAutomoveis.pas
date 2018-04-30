unit unAutomoveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmAutomoveis = class(TFPADRAO_)
    edNomeCli: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nome_cli : String;
    cod_cli : String;
  end;

var
  frmAutomoveis: TfrmAutomoveis;

implementation

{$R *.dfm}

uses unDM, unCadAut;

procedure TfrmAutomoveis.btnEditarClick(Sender: TObject);
begin

 where := ' AND COD_AUT = ' + Dm.cdsCONSULTA.FieldByName('COD_AUT').AsString;
  inherited;
 Application.CreateForm(TfrmCADAut,frmCADAut);
  frmCADAut.ShowModal;
  btnPesquisarClick(Self);
end;

procedure TfrmAutomoveis.btnNovoClick(Sender: TObject);
begin
  inherited;

  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADAut,frmCADAut);
  frmCadaut.codcli_aut := cod_cli;
  frmCADAut.ShowModal;
    btnPesquisarClick(Self);
end;

procedure TfrmAutomoveis.FormCreate(Sender: TObject);
begin
  inherited;

   cdsPadrao := DM.cdsAUT;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'AUTOMOVEL';
   campoConsulta := 'MODELO_AUT';
   campos := '*';

end;

procedure TfrmAutomoveis.FormShow(Sender: TObject);
begin
where := ' AND CODCLI_AUT = ' +  cod_cli;
edNomeCli.Text := nome_cli;
  inherited;

end;

end.
