unit unTER;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmPadrao, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmTER = class(TfrmPadrao_)
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTER: TfrmTER;

implementation

{$R *.dfm}

uses unCadCLI, unDM, unCadTER;

procedure TfrmTER.btnApagarClick(Sender: TObject);
var
buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Confirma a exclus�o do registro?',mtCustom,
                               [mbYes,mbNo], 0);


   if buttonSelected = mrYes    then
      begin
        cdspadrao.Close;
        cdsPadrao.CommandText := 'select * from hoster where codigo_ter = ' + cdsConsulta.FieldByName('CODIGO_ter').AsString;
        cdspadrao.Open;
         inherited;
      end;

end;

procedure TfrmTER.btnEditarClick(Sender: TObject);
begin
   where  := where + 'AND CODIGO_TER = ' + DataModule1.cdsCONSULTA.FieldByName('CODIGO_TER').AsString;
   inherited;
   Application.CreateForm(TfrmCadTER,frmCadTER);
   cdsPadrao.Open;
   cdsPadrao.Edit;
  frmCadTer.ShowModal;


end;

procedure TfrmTER.btnNovoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmCADTER,frmCadTER);
   cdsPadrao.Open;
   cdsPadrao.Insert;
  frmCadTer.ShowModal;

end;

procedure TfrmTER.FormCreate(Sender: TObject);
begin
  inherited;
    cdsPadrao := DataModule1.cdsHOSTER;
    cdsConsulta := DataModule1.cdsCONSULTA;

    campos := '*';
    tabela := 'HOSTER';
    where := '';
    join := '';
    campoConsulta := 'NOME_TER';
end;

end.
