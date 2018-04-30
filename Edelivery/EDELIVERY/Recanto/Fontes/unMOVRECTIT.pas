unit unMOVRECTIT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmPadraoManutencao, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,DB,
  Vcl.Imaging.pngimage;

type
  TfrmMOVRECTIT = class(TfrmPadraoManutencao_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Image1: TImage;
    edNomeCliente: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMOVRECTIT: TfrmMOVRECTIT;

implementation

{$R *.dfm}

uses unDM,  unConsCLIENTE;

procedure TfrmMOVRECTIT.btnSalvarClick(Sender: TObject);
begin
  inherited;
   DataModule1.Transacao.Commit;
   cdsPadrao.Close;
   btnSalvar.Enabled := false;
end;

procedure TfrmMOVRECTIT.DBEdit4Exit(Sender: TObject);
begin
   with DataModule1.cdsTELASCONSULTA do
     begin
       close;
       CommandText := 'select * from cliente where codigo_cli = ' + dbedit4.Text;
       Open;
       if not IsEmpty then
          edNomeCliente.Text := FieldByName('NOME_CLI').AsString
       else
           edNomeCliente.Text  := 'Cliente n�o cadastrado';
     end;

end;

procedure TfrmMOVRECTIT.FormCreate(Sender: TObject);
begin
  inherited;

  cdsPadrao := DataModule1.cdsRECTIT;
end;

procedure TfrmMOVRECTIT.FormShow(Sender: TObject);
begin
  inherited;
   if (cdsPadrao.State = dsInsert) then
       DataModule1.iniciarClientDataSet(cdsPadrao);
end;

procedure TfrmMOVRECTIT.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TfmrConsCLIENTE,fmrConsCLIENTE);
     fmrConsCLIENTE.ShowModal;
     if not DataModule1.cdsCLIENTE.IsEmpty then
     begin
          dbedit4.Text := DataModule1.cdsCLIENTE.FieldByName('CODIGO_CLI').AsString;
          dbedit4Exit(Self);
        //  edSenhaUsuario.SetFocus;
     end;

end;

end.
