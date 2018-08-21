unit unCONSASS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAO, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmCONASS = class(TFPADRAO_)
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
  frmCONASS: TfrmCONASS;

implementation

{$R *.dfm}

uses uDM, unCADASS;

procedure TfrmCONASS.btnApagarClick(Sender: TObject);
begin
 DM.cdsASS.Close;
 DM.cdsASS.CommandText := 'select * from associado where id_ass = ' + DM.cdsCONSULTA.FieldByName('ID_ASS').AsString;
 DM.cdsASS.Open;
  inherited;


end;

procedure TfrmCONASS.btnEditarClick(Sender: TObject);
begin
   where := ' AND ID_ASS = ' + Dm.cdsCONSULTA.FieldByName('ID_ASS').AsString;
  inherited;
 Application.CreateForm(TfrmCADASS,frmCADASS);
 frmCADASS.DateTimePicker1.DateTime := cdsPadrao.FieldByName('DATANASC_ASS').AsDateTime;
  frmCADASS.ShowModal;
  btnPesquisarClick(Self);

end;

procedure TfrmCONASS.btnNovoClick(Sender: TObject);
begin
  inherited;

  cdspadrao.Open;
  cdspadrao.Insert;
  Application.CreateForm(TfrmCADASS,frmCADASS);
  frmCADASS.ShowModal;
    btnPesquisarClick(Self);
end;

procedure TfrmCONASS.FormCreate(Sender: TObject);
begin

inherited;
   cdsPadrao := DM.cdsASS;
   cdsConsulta := DM.cdsCONSULTA;
   tabela := 'ASSOCIADO';
   campoConsulta := 'NOME_ASS';
   campos := '*';
end;

end.
