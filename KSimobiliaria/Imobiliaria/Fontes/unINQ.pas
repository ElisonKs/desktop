unit unINQ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmINQ = class(TFPADRAO_)
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmINQ: TfrmINQ;

implementation

{$R *.dfm}

uses unDM, unCADINQ;

procedure TfrmINQ.btnEditarClick(Sender: TObject);
begin
  where := ' AND COD_INQ = ' + Dm.cdsCONSULTA.FieldByName('COD_INQ').AsString;
  inherited;
 Application.CreateForm(TfrmCADINQ,frmCADINQ);

  frmCADINQ.ShowModal;
  btnPesquisarClick(Self);
end;

procedure TfrmINQ.btnNovoClick(Sender: TObject);
begin
  inherited;
  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADINQ,frmCADINQ);
  frmCADINQ.ShowModal;
    btnPesquisarClick(Self);


end;

procedure TfrmINQ.FormCreate(Sender: TObject);
begin
  inherited;
   cdsPadrao := DM.cdsINQ;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'INQUILINO';
   campoConsulta := 'NOME_INQ';
   campos := '*';
end;

end.
