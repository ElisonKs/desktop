unit unPRO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmPRO = class(TFPADRAO_)
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRO: TfrmPRO;

implementation

{$R *.dfm}

uses unDM, unCADPRO;

procedure TfrmPRO.btnEditarClick(Sender: TObject);
begin
  where := ' AND COD_PRO = ' + Dm.cdsCONSULTA.FieldByName('COD_PRO').AsString;
  inherited;
 Application.CreateForm(TfrmCADPRO,frmCADPRO);
  frmCADPRO.ShowModal;
  btnPesquisarClick(Self);
end;

procedure TfrmPRO.btnNovoClick(Sender: TObject);
begin
  inherited;
  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADPRO,frmCADPRO);
  frmCADPRO.ShowModal;
    btnPesquisarClick(Self);


end;

procedure TfrmPRO.FormCreate(Sender: TObject);
begin
  inherited;
   cdsPadrao := DM.cdsPRO;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'PROPRIETARIO';
   campoConsulta := 'NOME_PRO';
   campos := '*';
end;

end.
