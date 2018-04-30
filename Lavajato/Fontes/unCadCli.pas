unit unCadCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadCli = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    edtCEP: TEdit;
    Label10: TLabel;
    edtENDERECO: TEdit;
    Label11: TLabel;
    edtBAIRRO: TEdit;
    Label12: TLabel;
    btnAutomoveis: TButton;
    procedure edtCEPExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAutomoveisClick(Sender: TObject);
  private
    { Private declarations }
    cod_end: Integer;
  public
    { Public declarations }
  end;

var
  frmCadCli: TfrmCadCli;

implementation

{$R *.dfm}

uses unDM, unAutomoveis;

procedure TfrmCadCli.btnAutomoveisClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmAutomoveis,frmAutomoveis);
  frmAutomoveis.cod_cli := cdspadrao.FieldByName('cod_cli').AsString;
  frmAutomoveis.nome_cli := cdsPadrao.FieldByName('nome_cli').AsString;
  frmAutomoveis.ShowModal;
end;

procedure TfrmCadCli.btnSalvarClick(Sender: TObject);
begin
cdspadrao.FieldByName('IDEND_CLI').AsInteger := cod_end;
if cdspadrao.State in [dsInsert] then
   cdspadrao.FieldByName('COD_CLI').AsInteger := 0;
   inherited;
 btnAutomoveis.Enabled := True;
end;

procedure TfrmCadCli.edtCEPExit(Sender: TObject);
begin
  inherited;
     DM.cdsGravar.Close;
     DM.cdsGRAVAR.CommandText := 'select * from endereco left outer join bairro on cod_bai = codbai_end where cep_end = ' + edtCEP.Text;
     DM.cdsGRAVAR.Open;
     if NOT  DM.cdsGRAVAR.IsEmpty then
     begin
       edtENDERECO.Text := DM.cdsGRAVAR.FieldByName('LOGRADOURO_END').AsString;
       edtBAIRRO.Text := DM.cdsGRAVAR.FieldByName('NOME_BAI').AsString;
       cod_end := DM.cdsGRAVAR.FieldByName('COD_END').AsInteger;
     end;
end;

procedure TfrmCadCli.FormCreate(Sender: TObject);
begin
  inherited;
 cdspadrao := DM.cdsCLI;
end;

procedure TfrmCadCli.FormShow(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
begin
     label12.Visible := True;

end
else
begin
  btnAutomoveis.Enabled := True;
  DM.cdsGRAVAR.Close;
  DM.cdsGRAVAR.CommandText := 'select * from endereco where cod_end = ' + cdspadrao.FieldByName('IDEND_CLI').AsString;
  DM.cdsGRAVAR.Open;
  if not Dm.cdsGRAVAR.IsEmpty then
  begin
    edtCEP.Text := DM.cdsGRAVAR.FieldByName('CEP_END').AsString;
    edtCEPExit(Self);
  end;
end;


  inherited;
end;

end.
