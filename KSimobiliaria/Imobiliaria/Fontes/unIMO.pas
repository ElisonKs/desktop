unit unIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmIMO = class(TFPADRAO_)
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIMO: TfrmIMO;

implementation

{$R *.dfm}

uses unDM, unCADIMO;

procedure TfrmIMO.btnEditarClick(Sender: TObject);
begin
   where := ' AND COD_IMO = ' + Dm.cdsCONSULTA.FieldByName('COD_IMO').AsString;
  inherited;
 Application.CreateForm(TfrmCADIMO,frmCADIMO);
  frmCADIMO.ShowModal;
  btnPesquisarClick(Self);
end;

procedure TfrmIMO.btnNovoClick(Sender: TObject);
begin
  inherited;
  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADIMO,frmCADIMO);
  frmCADIMO.ShowModal;
    btnPesquisarClick(Self);


end;

procedure TfrmIMO.FormCreate(Sender: TObject);
begin
  inherited;
   cdsPadrao := DM.cdsIMO;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'IMOVEL';
   campoConsulta := 'DESC_IMO';
   campos := '*';
end;

end.
