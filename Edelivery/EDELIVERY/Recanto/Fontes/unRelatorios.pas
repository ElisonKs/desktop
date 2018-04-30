unit unRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;
type
  TfrmRelatorios = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses unDM;

procedure TfrmRelatorios.Button1Click(Sender: TObject);
var
total : Currency;
begin
   Total := 0;
   DM.cdsTELASCONSULTA.Close;
   DM.cdsTELASCONSULTA.CommandText := 'select * from pedido left outer join cliente on cod_cli = codcli_ped ' +
                                               ' left outer join entregador on cod_ent = codent_ped' +
                                               ' where  data_ped between :data_ini and :data_fim ';
   DM.cdsTELASCONSULTA.Params.ParamByName('Data_INI').AsDate := DateTimePicker1.Date;
   DM.cdsTELASCONSULTA.Params.ParamByName('Data_FIM').AsDate := DateTimePicker2.Date;

   DM.cdsTELASCONSULTA.Open;
   DM.cdsTELASCONSULTA.First;
   while not DM.cdsTELASCONSULTA.Eof do
   begin
     Total := Total + (DM.cdsTELASCONSULTA.FieldByName('VALOR_PED').AsCurrency *
                       DM.cdsTELASCONSULTA.FieldByName('QTDE_PED').AsCurrency ) ;
     DM.cdsTELASCONSULTA.Next;
   end;

end;

procedure TfrmRelatorios.FormCreate(Sender: TObject);
begin
   DateTimePicker1.DateTime := now;
   DateTimePicker2.DateTime := now;
end;

end.
