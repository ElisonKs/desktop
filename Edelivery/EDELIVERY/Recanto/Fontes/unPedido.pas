unit unPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,  Vcl.DBCtrls;

type
  TfrmPedido = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    edCodUsuario: TEdit;
    Image1: TImage;
    edNomeCli: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Memo1: TMemo;
    Image2: TImage;
    Image3: TImage;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edOBSERVACAO: TEdit;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Image4: TImage;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edCodUsuarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    nroPedido :String;
    Impressos : TStringList;
    procedure PrepararPrincipais;
    procedure PrepararAcompanhamentos;
    procedure GerarPedido;
    procedure GravarPedido;
    procedure GravarItemPedido(seqped,codpro:String);
    function RetornarSeqPedido:String;
    procedure ImprimirDireto(Porta, Texto: String);
    procedure GerarItensPedido;
    procedure ImprimirPedido;

    function ItemGravado(codpro:String):Boolean;
    function GravarPagamentoPedido(seq_ped:string): Boolean;
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses unConsCLIENTE, unDM;

procedure TfrmPedido.DBGrid1DblClick(Sender: TObject);
begin
    if nroPedido <> '0' then
    begin
      if ItemGravado(DM.cdsPRODIAP.FieldByName('CODPRO_PRODIA').AsString) then
       begin
          GravarItemPedido(nroPedido,DM.cdsPRODIAP.FieldByName('CODPRO_PRODIA').AsString);

          GerarPedido;
       end
       else
          showmessage('Item j� gravado!');
    end
    else
       Showmessage('Nenhum pedido gerado');
end;

procedure TfrmPedido.DBGrid2DblClick(Sender: TObject);
begin
  if nroPedido <> '0' then
    begin
      if ItemGravado(DM.cdsPRODIAA.FieldByName('CODPRO_PRODIA').AsString) then
       begin
          GravarItemPedido(nroPedido,DM.cdsPRODIAA.FieldByName('CODPRO_PRODIA').AsString);

          GerarPedido;
       end
       else
          showmessage('Item j� gravado!');
    end
    else
       Showmessage('Nenhum pedido gerado');
end;

procedure TfrmPedido.edCodUsuarioExit(Sender: TObject);
begin
             with DM.cdsCONSULTA do
     begin
       close;
       CommandText := 'select * from cliente where cod_cli = ' + edCodUsuario.Text;
       Open;
       if not IsEmpty then
          edNomeCli.Text := FieldByName('NOME_cli').AsString
       else
           edNomeCli.Text  := 'Cliente n�o cadastrado';
     end;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  DateTimePicker1.DateTime := now;
   PrepararPrincipais;
   PrepararAcompanhamentos;
   nroPedido := '0';
   DM.cdsENT.Open;
   ;
end;

procedure TfrmPedido.GerarItensPedido;
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText:= 'select * from produto_pedido left outer join produtos on codpro_pxp = cod_pro where seqped_pxp = ' + nroPedido;
   DM.cdsCONSULTA.Open;
   if not DM.cdsCONSULTA.IsEmpty then
   begin
      DM.cdsCONSULTA.First;
      while not DM.cdsCONSULTA.Eof do
      begin

             Memo1.Lines.Add(DM.cdsCONSULTA.FieldByName('NOME_PRO').AsString);


        DM.cdsCONSULTA.Next;
      end;


   end;
end;

procedure TfrmPedido.GerarPedido;
begin
 Memo1.Clear;
 Memo1.Lines.Add('TiaMaluca Marmitaria');
 Memo1.Lines.Add('Nr Pedido:'  + nroPedido);
 Memo1.Lines.Add('Data:' + DatetoStr(DateTimePicker1.Date));
 Memo1.Lines.Add('Cliente: ' + edNomeCli.Text);
 Memo1.Lines.Add('');
 Memo1.Lines.Add('Produtos');
 GerarItensPedido;



end;

procedure TfrmPedido.GravarItemPedido(seqped,codpro:string);
begin
      DM.cdsGRAVAR.Close;
   DM.cdsGRAVAR.CommandText := 'select * from produto_pedido where seqped_pxp = ' + seqped;
   DM.cdsGRAVAR.Open;
   DM.cdsGRAVAR.Insert;
   DM.cdsGRAVAR.FieldByName('seqped_pxp').AsString := seqped;
   DM.cdsGRAVAR.FieldByName('codpro_pxp').AsString := codpro;
   DM.cdsGRAVAR.Post;
   DM.cdsGRAVAR.ApplyUpdates(0);
    DM.Transacao.Commit;

end;

procedure TFrmPedido.ImprimirDireto(Porta, Texto: String);
var
  Impressora: TextFile;
  StringList: TStringList;
  IX: Integer;
begin
  try
    Texto := StringReplace(Texto, '%20', ' ', [rfReplaceAll]);
    StringList := TStringList.Create;
    StringList.Delimiter       := '|';
    StringList.StrictDelimiter := True;
    StringList.DelimitedText   := Texto;

    AssignFile(Impressora, Porta);
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

procedure TfrmPedido.ImprimirPedido;
begin
   DM.cdsRELATORIO.Close;
   DM.cdsRELATORIO.CommandText := ' select * from pedido left outer join produto_pedido on seqped_pxp = seq_ped ' +
                                           ' left outer join entregador on entregador.cod_ent = pedido.codent_ped ' +
                                           ' left outer join produtos on cod_pro = codpro_pxp ' +
                                           '  left outer join cliente on cod_cli = codcli_ped  where seq_ped =' + nroPedido;
   DM.cdsRELATORIO.Open;
   //ppReport1.Print;
end;

function TfrmPedido.ItemGravado(codpro: String): Boolean;
begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := ' select * from produto_pedido where codpro_pxp = ' + codpro + ' and seqped_pxp = ' + nroPedido;
    DM.cdsCONSULTA.Open;
    Result := DM.cdsCONSULTA.IsEmpty;
end;



function TfrmPedido.GravarPagamentoPedido(seq_ped:string): Boolean;
begin
   DM.cdsGRAVAR.Close;
   DM.cdsGRAVAR.CommandText := 'select * from pedido where seq_ped =' + seq_ped;
   DM.cdsGRAVAR.Open;
   DM.cdsGRAVAR.Edit;
   if RadioGroup1.ItemIndex = 0 then
   begin
        DM.cdsGravar.FieldByName('FPAG_PED').AsString := 'V';
        DM.cdsGravar.FieldByName('PAGO_PED').AsInteger := 1;
   end
   else
   begin
          DM.cdsGravar.FieldByName('FPAG_PED').AsString := 'P';
        DM.cdsGravar.FieldByName('PAGO_PED').AsInteger := 0;
   end;
   DM.cdsGRAVAR.FieldByName('OBSERVACAO_PED').AsString := edOBSERVACAO.Text;
   DM.cdsGRAVAR.FieldByName('QTDE_PED').AsString := ComboBox1.Text;

   DM.cdsGRAVAR.Post;
   DM.cdsGRAVAR.ApplyUpdates(0);
   DM.Transacao.Commit;
end;

procedure TfrmPedido.GravarPedido;
begin
   DM.cdsGRAVAR.Close;
   DM.cdsGRAVAR.CommandText := 'select * from pedido';
   DM.cdsGRAVAR.Open;
   DM.cdsGRAVAR.Insert;
   DM.cdsGravar.FieldByName('SEQ_PED').AsString := RetornarSeqPedido;
   nroPedido := DM.cdsGravar.FieldByName('SEQ_PED').AsString;
   DM.cdsGRAVAR.FieldByName('DATA_PED').AsString := (FormatDateTime('dd/MM/yyyy',DateTimePicker1.Date));
   DM.cdsGRAVAR.FieldByName('CODCLI_PED').AsString := edCodUsuario.Text;
   DM.cdsGRAVAR.FieldByName('VALOR_PED').AsCurrency := 8.00 * Strtoint(ComboBox1.Text);
   DM.cdsGRAVAR.FieldByName('CODENT_PED').AsInteger := DM.cdsENT.FieldByName('COD_ENT').AsInteger;
   DM.cdsGRAVAR.Post;
   DM.cdsGRAVAR.ApplyUpdates(0);
   DM.Transacao.Commit;
end;

procedure TfrmPedido.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
                   Application.CreateForm(TFmrconscliente,Fmrconscliente);
     Fmrconscliente.ShowModal;
     if not DM.cdsCLIENTE.IsEmpty then
     begin
          edCodUsuario.Text := DM.cdsCLIENTE.FieldByName('COD_CLI').AsString;
          edCodUsuarioExit(Self);

     end;
end;




procedure TfrmPedido.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
buttonSelected : Integer;
begin
  if nroPedido <> '0' then
   begin

        buttonSelected := MessageDlg('Finalizar e Imprimir o pedido ?',mtCustom,
                                     [mbYes,mbNo], 0);


         if buttonSelected = mrYes    then
         begin
             GravarPagamentoPedido(nroPedido);
 //            ImprimirPedido;
           //ImprimirDireto('LPT1',Memo1.Lines.GetText);
           Memo1.Clear;
           edOBSERVACAO.Clear;
           ComboBox1.Text := '1';
           edNomeCli.Clear;
           edCodUsuario.Clear;
         end;

   end;
end;

procedure TfrmPedido.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if (edNomeCli.Text = '') or (edNomeCli.Text = 'Cliente n�o cadastrado') then
       showmessage('Informe cliente para gerar pedido!')
   else
   begin
    GravarPedido;
    GerarPedido;
   end;
end;

procedure TfrmPedido.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
buttonSelected : Integer;
begin
GravarPagamentoPedido(nroPedido);
  if nroPedido <> '0' then
   begin

        buttonSelected := MessageDlg('Imprimir o pedido ?',mtCustom,
                                     [mbYes,mbNo], 0);


         if buttonSelected = mrYes    then
         begin

   //          ImprimirPedido;
           ImprimirDireto('LPT1',Memo1.Lines.GetText);

         end;

   end;
           Memo1.Clear;
           edOBSERVACAO.Clear;
           ComboBox1.Text := '1';
           edNomeCli.Clear;
           edCodUsuario.Clear;
end;

procedure TfrmPedido.PrepararPrincipais;
begin
  DM.cdsPRODIAP.Close;
  dM.cdsPRODIAP.CommandText := 'select * from produto_dia left outer join produtos on cod_pro = codpro_prodia ' +
                                        ' where tipo_pro = 1 and data_prodia =' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));

  DM.cdsPRODIAP.Open;

end;

function TfrmPedido.RetornarSeqPedido: String;
begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := ' select  gen_id(ge_seqped,1) as seq from rdb$database';
    DM.cdsCONSULTA.Open;
    Result := DM.cdsCONSULTA.FieldByName('seq').AsString;
end;

procedure TfrmPedido.PrepararAcompanhamentos;
begin
  DM.cdsPRODIAA.Close;
  dM.cdsPRODIAA.CommandText := 'select * from produto_dia left outer join produtos on cod_pro = codpro_prodia' +
                                        ' where tipo_pro = 0  and data_prodia =' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
  DM.cdsPRODIAA.Open;

end;

end.
