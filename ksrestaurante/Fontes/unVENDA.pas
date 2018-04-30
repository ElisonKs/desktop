unit unVENDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmVENDA = class(TForm)
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edTotal: TEdit;
    lbl: TLabel;
    btNovo: TButton;
    btFinalizar: TButton;
    Label4: TLabel;
    edCOD_PED: TEdit;
    BtConsultar: TButton;
    BtItens: TButton;
    RadioGroup1: TRadioGroup;
    Memo1: TMemo;
    edID_CLI: TEdit;
    Button1: TButton;
    edNOME_CLI: TEdit;
    Label1: TLabel;
    procedure btNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtItensClick(Sender: TObject);
    procedure btFinalizarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edID_CLIExit(Sender: TObject);
  private
    { Private declarations }
  public
  nro :String;
  procedure CalcularTotal;
  procedure GerarPedido;
  function PreencherString(s : string;tam:Integer) : string;
  procedure ImprimirPedido;
  procedure carregarDadosCliente(cod:string);
    { Public declarations }
  end;

var
  frmVENDA: TfrmVENDA;

implementation

{$R *.dfm}

uses uDM, unITENSVENDA, uCONSCLI;

procedure TfrmVENDA.CalcularTotal;
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText := 'select sum(item_pedido.qtd_ipe * item_pedido.vlruni_ipe) as total from ' +
                                 ' item_pedido where item_pedido.codped_ipe = ' + edCOD_PED.Text;
   DM.cdsCONSULTA.Open;
   if not DM.cdsCONSULTA.IsEmpty then
      edTotal.Text := 'R$' + FormatFloat(',0.00', StrToFloat(DM.cdsCONSULTA.FieldByName('total').AsString));
end;

procedure TfrmVENDA.edID_CLIExit(Sender: TObject);
begin
    if edID_CLI.Text <> '' then
    begin
       DM.cdsCONSULTA.Close;
       DM.cdsCONSULTA.CommandText := 'select * from clientes where id_cli = ' + edID_CLI.Text;
       DM.cdsCONSULTA.Open;
       if not DM.cdsCONSULTA.IsEmpty then
       begin
          edNOME_CLI.Text := DM.cdsCONSULTA.FieldByName('NOME_CLI').AsString;

       end
       else
          edNOME_CLI.Text := 'Cliente n�o cadastrado';

    BtItens.SetFocus;
    end;
end;

procedure TfrmVENDA.btFinalizarClick(Sender: TObject);
begin
   DM.cdsPEDIDO.Close;
   DM.cdsPEDIDO.CommandText := 'select * from pedido where cod_ped =' + edCOD_PED.Text;
   DM.cdsPEDIDO.Open;
   DM.cdsPEDIDO.Edit;

   DM.cdsPEDIDO.FieldByName('DATA_PED').AsDateTime := DateTimePicker1.DateTime;
   DM.cdsPEDIDO.FieldByName('MESA_PED').AsInteger := ComboBox1.ItemIndex;
   DM.cdsPEDIDO.FieldByName('FPAG_PED').AsInteger := RadioGroup1.ItemIndex;
   DM.cdsPEDIDO.FieldByName('TIPO_PED').AsString := 'N';
   DM.cdsPEDIDO.FieldByName('IDCLI_PED').AsString := edID_CLI.Text;
   DM.cdsPEDIDO.Post;
   DM.cdsPEDIDO.ApplyUpdates(0);
   GerarPedido;
   ImprimirPedido;
   btFinalizar.Enabled := false;
   btNovo.Enabled := True;
   edTotal.Clear;
   edCOD_PED.Clear;
   edID_CLI.Clear;
   edNOME_CLI.Clear;
end;

procedure TfrmVENDA.BtItensClick(Sender: TObject);
begin
    Application.CreateForm(TfrmITENSVENDA,frmITENSVENDA);
    frmITENSVENDA.edCODPED_IPE.Text := nro;
    frmITENSVENDA.ShowModal;
    CalcularTotal;
end;

procedure TfrmVENDA.btNovoClick(Sender: TObject);
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText := 'select gen_id(gen_ped, 1) as NRO from rdb$database';
   DM.cdsCONSULTA.Open;
   nro := DM.cdsCONSULTA.FieldByName('NRO').AsString;
   edCOD_PED.Text := nro;

   DM.cdsPEDIDO.Close;
   DM.cdsPEDIDO.CommandText := 'select * from pedido';
   DM.cdsPEDIDO.Open;
   DM.cdsPEDIDO.Insert;
   DM.cdsPEDIDO.FieldByName('COD_PED').AsString := nro;

   DM.cdsPEDIDO.Post;
   DM.cdsPEDIDO.ApplyUpdates(0);

   btNovo.Enabled := False;
   BtConsultar.Enabled := False;
   btFinalizar.Enabled := True;
   DateTimePicker1.Enabled := True;
   ComboBox1.Enabled := True;

   BtItens.Enabled := True;
   btFinalizar.Enabled := True;

end;



procedure TfrmVENDA.Button1Click(Sender: TObject);
begin
 Application.CreateForm(TFrmConscli,frmconscli);
   frmconscli.ShowModal;
   if NOT DM.cdscli.IsEmpty then
   begin
     edID_CLI.Text := DM.cdscli.FieldByName('id_cli').AsString;
     edID_CLIExit(Self);
   end;

end;

procedure TfrmVENDA.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := now;
end;

procedure Tfrmvenda.ImprimirPedido;
var
  Impressora: TextFile;
  StringList: TStringList;
  IX: Integer;
begin
  try
    //Texto := StringReplace(Texto, '%20', ' ', [rfReplaceAll]);
    StringList := TStringList.Create;
    StringList.Delimiter       := '|';
    StringList.StrictDelimiter := True;
    StringList.DelimitedText   := Memo1.Text;

    AssignFile(Impressora, 'LPT1');
    Rewrite(Impressora);
    for IX := 0 to (StringList.Count - 1) do
      Writeln(Impressora, StringList[IX]);
    Writeln(Impressora, '');
    Writeln(Impressora, '');
    Writeln(Impressora, '');
    CloseFile(Impressora);
  finally
    StringList.Free;
  End;


end;
procedure TfrmVENDA.carregarDadosCliente(cod:string);
begin
  DM.cdsCONSULTA.Close;
  DM.cdsCONSULTA.CommandText := 'select * from clientes where id_cli = ' + cod;
  DM.cdsCONSULTA.Open;
end;
procedure TfrmVENDA.GerarPedido;
begin
Memo1.Clear;
Memo1.Lines.Add('Saga Oriental');
Memo1.Lines.Add('');
    Memo1.Lines.Add('Pedido: ' + edCOD_PED.Text);
     Memo1.Lines.Add('Data: ' + DateTimeToStr(DateTimePicker1.DateTime));
     Memo1.Lines.Add('Cliente: ' + edNOME_CLI.Text);
     carregarDadosCliente(edID_CLI.Text);
     Memo1.Lines.Add('Tel:' + DM.cdsCONSULTA.FieldByName('TEL_CLI').AsString);
     Memo1.Lines.Add('End:' + DM.cdsCONSULTA.FieldByName('END_CLI').AsString);
     Memo1.Lines.Add('Ref:' + DM.cdsCONSULTA.FieldByName('REF_CLI').AsString);

     Memo1.Lines.Add('Mesa:' + ComboBox1.Text);
     case RadioGroup1.ItemIndex of
        0: Memo1.Lines.Add('Dinheiro');
        1: Memo1.Lines.Add('Cartao Debito');
        2: Memo1.Lines.Add('Cartao Credito');

     end;
     Memo1.Lines.Add('');

     Memo1.Lines.Add('Item                   Qtd    Vlr.Uni    Valor');
     DM.cdsCONSULTA.Close;
     DM.cdsCONSULTA.CommandText := 'select * from item_pedido ' +
                                   ' left outer join itens on itens.id_ite = item_pedido.idite_ipe' +
                                   ' where codped_ipe= ' + edCOD_PED.Text;
     DM.cdsCONSULTA.Open;
     DM.cdsCONSULTA.First;
     while not DM.cdsCONSULTA.Eof do
     begin
      Memo1.Lines.Add(PreencherString(DM.cdsCONSULTA.FieldByName('DESC_ITE').AsString,23) +
                        PreencherString(FormatFloat(',0.00', StrToFloat(vartostr(DM.cdsCONSULTA.FieldByName('QTD_IPE').AsCurrency))),8) +
                        PreencherString(FormatFloat(',0.00', StrToFloat(vartostr(DM.cdsCONSULTA.FieldByName('VLRUNI_IPE').AsCurrency))),10) +
                        PreencherString(FormatFloat(',0.00', StrToFloat(vartostr(DM.cdsCONSULTA.FieldByName('QTD_IPE').AsCurrency * DM.cdsCONSULTA.FieldByName('VLRUNI_IPE').AsCurrency)))
                        ,8));
      DM.cdsCONSULTA.Next;
     end;
     Memo1.Lines.Add('');
     Memo1.Lines.Add('');
     Memo1.Lines.Add('');
     Memo1.Lines.Add('                                Total: ' + edTotal.Text );
end;

function TfrmVenda.PreencherString(s : string;tam:Integer) : string;
begin
result := s;
if length(s) >= tam then
exit;
repeat
result := result + ' ';
until length(result) = tam;
end;


end.
