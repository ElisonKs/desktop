unit unCONSMED;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmCONSMED = class(TFPADRAO_)
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCONSMED: TfrmCONSMED;

implementation

{$R *.dfm}

uses uDM, unCADASS, unCADMED;

procedure TfrmCONSMED.btnApagarClick(Sender: TObject);
begin
 cdsPadrao.Close;
 cdsPadrao.CommandText := 'select * from medico where id_med = ' + DM.cdsCONSULTA.FieldByName('ID_MED').AsString;
 cdsPadrao.Open;
  inherited;

end;

procedure TfrmCONSMED.btnEditarClick(Sender: TObject);
begin
   where := ' AND ID_MED = ' + Dm.cdsCONSULTA.FieldByName('ID_MED').AsString;
  inherited;
 Application.CreateForm(TfrmCADMED,frmCADMED);
  frmCADMED.ShowModal;
  btnPesquisarClick(Self);

end;

procedure TfrmCONSMED.btnNovoClick(Sender: TObject);
begin
  inherited;

  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADMED,frmCADMED);
  frmCADMED.ShowModal;
    btnPesquisarClick(Self);
end;

procedure TfrmCONSMED.FormCreate(Sender: TObject);
begin

inherited;
   cdsPadrao := DM.cdsMED;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'MEDICO';
   campoConsulta := 'NOME_MED';
   campos := '*';
end;

end.
