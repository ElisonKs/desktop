unit unCONSCON;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmCONCON = class(TFPADRAO_)
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
  frmCONCON: TfrmCONCON;

implementation

{$R *.dfm}

uses uDM, unCADCON;

procedure TfrmCONCON.btnApagarClick(Sender: TObject);
begin
 cdsPadrao.Close;
 cdsPadrao.CommandText := 'select * from consulta where id_con = ' + DM.cdsCONSULTA.FieldByName('ID_CON').AsString;
 cdsPadrao.Open;

  inherited;

end;

procedure TfrmCONCON.btnEditarClick(Sender: TObject);
begin
   where := ' AND ID_CON = ' + Dm.cdsCONSULTA.FieldByName('ID_CON').AsString;
  inherited;
 Application.CreateForm(TfrmCADCON,frmCADCON);
 frmCADCON.edAssociado.Text := DM.cdsCONSULTA.FieldByName('IDASS_CON').AsString;
 frmCADCON.edMedico.Text := DM.cdsCONSULTA.FieldByName('IDMED_CON').AsString;
 frmCADCON.edHora.Text := DM.cdsCONSULTA.FieldByName('HORA_CON').AsString;
 frmCADCON.DateTimePicker1.DateTime := DM.cdsCONSULTA.FieldByName('DATA_CON').AsDateTime;
  frmCADCON.ShowModal;
  btnPesquisarClick(Self);

end;

procedure TfrmCONCON.btnNovoClick(Sender: TObject);
begin
  inherited;

  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADCON,frmCADCON);
  frmCADCON.ShowModal;
    btnPesquisarClick(Self);
end;

procedure TfrmCONCON.FormCreate(Sender: TObject);
begin

inherited;
   cdsPadrao := DM.cdsCON;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'CONSULTA';
   campoConsulta := 'NOME_ASS';
   campos := '*';
   join := 'left outer join ASSOCIADO on ASSOCIADO.id_ass = CONSULTA.idass_con';
end;

end.
