unit uCADCLI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,Datasnap.DBClient;

type
  TCADCLI = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    dbeNOME_CLI: TDBEdit;
    btIncluir: TButton;
    btSalvar: TButton;
    btExcluir: TButton;
    btSair: TButton;
    edID_CLI: TEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    procedure edID_CLIExit(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edID_CLIEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cds_padrao:TClientDataSet;
   procedure CarregarGrid;
   function TestarCampos:Boolean;
   function registroTravado:Boolean;

  public
    { Public declarations }
  end;

var
  CADCLI: TCADCLI;

implementation

{$R *.dfm}

uses uDM;

{ TCADCAT }

procedure TCADCLI.btExcluirClick(Sender: TObject);
begin
        if MessageDlg('Deseja excluir este cliente?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
         begin
                 if registroTravado then
                  begin
                    showmessage('Existem pedidos deste cliente!');
                  end
                  else
                  begin
                     DM.cdsCLI.Delete;
                     cds_padrao.ApplyUpdates(0);
                     CarregarGrid;
                     edID_CLI.SetFocus;
                  end;
         end;


end;

procedure TCADCLI.btIncluirClick(Sender: TObject);
begin
       if TestarCampos then
       begin
           cds_padrao.FieldByName('ID_CLI').AsString := edID_CLI.Text;
           DM.cdsCLI.ApplyUpdates(0);
        //   DM.Transacao.Commit;
           CarregarGrid;
           edID_CLI.SetFocus;
       end;
end;

procedure TCADCLI.btSairClick(Sender: TObject);
begin
      if btIncluir.Enabled or btExcluir.Enabled then
      begin
        showmessage('Registro em aberto!');
      end
      else

          Close;
end;

procedure TCADCLI.btSalvarClick(Sender: TObject);
begin
      if TestarCampos then
       begin
           cds_padrao.FieldByName('ID_CLI').AsString := edID_CLI.Text;
           cds_padrao.ApplyUpdates(0);
       //    DM.Transacao.Commit;
           CarregarGrid;
           edID_CLI.SetFocus;
       end;
end;

procedure TCADCLI.CarregarGrid;
begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from clientes';
    DM.cdsCONSULTA.Open;
end;

procedure TCADCLI.DBGrid1DblClick(Sender: TObject);
begin
        edID_CLI.Text := DM.cdsCONSULTA.FieldByName('ID_CLI').AsString;
        edID_CLIExit(Self);
end;

procedure TCADCLI.edID_CLIEnter(Sender: TObject);
begin
        edID_CLI.Text := '0';
        btIncluir.Enabled := False;
        btSalvar.Enabled := False;
        btExcluir.Enabled := False;
        cds_padrao.Close;
end;

procedure TCADCLI.edID_CLIExit(Sender: TObject);
begin
      if (edID_CLI.Text <> '') and (not btSair.Focused) then
      begin
           cds_padrao.Close;
           cds_padrao.CommandText := 'select * from clientes where id_cli = ' + edID_CLI.Text;
           cds_padrao.Open;
           if cds_padrao.IsEmpty then
           begin
                cds_padrao.Insert;
                btIncluir.Enabled := True;
                btSalvar.Enabled := False;
                btSair.Enabled := True;
                btExcluir.Enabled := False;
                dbeNOME_CLI.SetFocus;
           end
           else
           begin
                cds_padrao.Edit;
                btIncluir.Enabled := False;
                btSalvar.Enabled := True;
                btExcluir.Enabled := True;
                btSair.Enabled := True;
                dbeNOME_CLI.SetFocus;
           end;
      end;
end;

procedure TCADCLI.FormCreate(Sender: TObject);
begin
        cds_padrao := DM.cdsCLI;
end;

procedure TCADCLI.FormShow(Sender: TObject);
begin

      CarregarGrid;
      edID_CLI.SetFocus;
end;

function TCADCLI.registroTravado: Boolean;
begin
       DM.cdsTRAVAR.Close;
       Dm.cdsTRAVAR.CommandText := 'select * from pedido where idcli_ped = ' + cds_padrao.FieldByName('ID_CLI').AsString;
       DM.cdsTRAVAR.Open;
       if DM.cdsTRAVAR.IsEmpty then
           Result := False
       else
           Result := True;
end;

function TCADCLI.TestarCampos: Boolean;
var
erro :String;
begin
     erro := '';
     if dbeNOME_CLI.Text = '' then
         erro := erro + 'Nome não informado!';


      if erro = '' then
      begin
         Result := True;
      end
      else
      begin
        showmessage(erro);
        Result := False;
      end;
end;

end.
