unit unFIA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmFIA = class(TFPADRAO_)
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFIA: TfrmFIA;

implementation

{$R *.dfm}

uses unDM, unCADFIA;

procedure TfrmFIA.btnEditarClick(Sender: TObject);
begin
   where := ' AND COD_FIA = ' + Dm.cdsCONSULTA.FieldByName('COD_FIA').AsString;
  inherited;
 Application.CreateForm(TfrmCADFIA,frmCADFIA);
  frmCADFIA.ShowModal;
  btnPesquisarClick(Self);
end;

procedure TfrmFIA.btnNovoClick(Sender: TObject);
begin
  inherited;
  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADFIA,frmCADFIA);
  frmCADFIA.ShowModal;
    btnPesquisarClick(Self);


end;

procedure TfrmFIA.FormCreate(Sender: TObject);
begin
  inherited;
   cdsPadrao := DM.cdsFIA;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'FIADOR';
   campoConsulta := 'NOME_FIA';
   campos := '*';
end;

end.
