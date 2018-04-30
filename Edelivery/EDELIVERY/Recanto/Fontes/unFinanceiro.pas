unit unFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ExtCtrls,  Data.DB;

type
  TfrmFinanceiro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    edCOD_CLI: TEdit;
    Label1: TLabel;
    Button1: TButton;
    edNOME_CLI: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    Button2: TButton;
    Label2: TLabel;
    edTotal: TEdit;
    Button3: TButton;
    procedure edCOD_CLIExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Totalstr : String;
  public
    { Public declarations }
  end;

var
  frmFinanceiro: TfrmFinanceiro;

implementation

{$R *.dfm}

uses unDM, unConsCLIENTE;

procedure TfrmFinanceiro.Button1Click(Sender: TObject);
begin

                   Application.CreateForm(TFmrconscliente,Fmrconscliente);
     Fmrconscliente.ShowModal;
     if not DM.cdsCLIENTE.IsEmpty then
     begin
          edCOD_CLI.Text := DM.cdsCLIENTE.FieldByName('COD_CLI').AsString;
          edCOD_CLIExit(Self);

     end;
end;

procedure TfrmFinanceiro.Button2Click(Sender: TObject);
var
total : Currency;
begin
   Total := 0;
   DM.cdsTELASCONSULTA.Close;
   DM.cdsTELASCONSULTA.CommandText := 'select * from pedido left outer join cliente on cod_cli = codcli_ped ' +
                                               ' where codcli_ped = ' + edCOD_CLI.Text + ' and data_ped between :data_ini and :data_fim ';
   DM.cdsTELASCONSULTA.Params.ParamByName('Data_INI').AsDate := DateTimePicker1.Date;
   DM.cdsTELASCONSULTA.Params.ParamByName('Data_FIM').AsDate := DateTimePicker2.Date;
   if RadioGroup1.ItemIndex <> 2 then
   begin
     if RadioGroup1.ItemIndex = 0 then
        DM.cdsTELASCONSULTA.CommandText := DM.cdsTELASCONSULTA.CommandText + ' AND PAGO_PED = 1'
     else
     DM.cdsTELASCONSULTA.CommandText := DM.cdsTELASCONSULTA.CommandText + ' AND PAGO_PED <> 1'
   end;
   DM.cdsTELASCONSULTA.Open;
   DM.cdsTELASCONSULTA.First;
   while not DM.cdsTELASCONSULTA.Eof do
   begin
     Total := Total + DM.cdsTELASCONSULTA.FieldByName('VALOR_PED').AsCurrency;
     DM.cdsTELASCONSULTA.Next;
   end;
     edTotal.Text := 'R$' + CurrtoStr(Total);
     Totalstr :=  'R$' + CurrtoStr(Total);
end;

procedure TfrmFinanceiro.Button3Click(Sender: TObject);
begin
  if not DM.cdsTELASCONSULTA.IsEmpty then
    // ppReport1.Print;
end;

procedure TfrmFinanceiro.edCOD_CLIExit(Sender: TObject);
begin
     if edCOD_CLI.Text <> '' then
     begin
              with DM.cdsCONSULTA do
              begin
               close;
               CommandText := 'select * from cliente where cod_cli = ' + edCOD_CLI.Text;
               Open;
               if not IsEmpty then
                edNOME_CLI.Text := FieldByName('NOME_cli').AsString
               else
                 edNome_Cli.Text  := 'Cliente não cadastrado';
             end;
     end;
end;

end.
