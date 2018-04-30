unit unCADITE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmPadraoManutencao, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,DB,
  Vcl.Imaging.pngimage;

type
  TfrmCadITE = class(TfrmPadraoManutencao_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Image1: TImage;
    edNomeCliente: TEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
  frmCadITE: TfrmCadITE;

implementation

{$R *.dfm}

uses unDM, unConsGRP;

procedure TfrmCadITE.btnSalvarClick(Sender: TObject);
begin
  inherited;
   DataModule1.Transacao.Commit;
   cdsPadrao.Close;
   btnSalvar.Enabled := false;
end;

procedure TfrmCadITE.DBEdit4Exit(Sender: TObject);
begin
   with DataModule1.cdsTELASCONSULTA do
     begin
       close;
       CommandText := 'select * from ESTGRP where codigo_GRP = ' + dbedit4.Text;
       Open;
       if not IsEmpty then
          edNomeCliente.Text := FieldByName('DESCRICAO_GRP').AsString
       else
           edNomeCliente.Text  := 'Grupo n�o cadastrado';
     end;

end;

procedure TfrmCadITE.FormCreate(Sender: TObject);
begin
  inherited;

  cdsPadrao := DataModule1.cdsESTITE;
end;

procedure TfrmCadITE.FormShow(Sender: TObject);
begin
  inherited;
   if (cdsPadrao.State = dsInsert) then
       DataModule1.iniciarClientDataSet(cdsPadrao);
end;

procedure TfrmCadITE.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TfmrConsGRP,fmrConsGRP);
     fmrConsGRP.ShowModal;
     if not DataModule1.cdsESTGRP.IsEmpty then
     begin
          dbedit4.Text := DataModule1.cdsESTGRP.FieldByName('CODIGO_GRP').AsString;
          dbedit4Exit(Self);
        //  edSenhaUsuario.SetFocus;
     end;

end;

end.
