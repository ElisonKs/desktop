unit unCardapio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCardapio = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    DateTimePicker1: TDateTimePicker;
    Image3: TImage;
    Image4: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure CarregarProdutosPrincipais;
    procedure CarregarProdutosAcompanhamento;
    procedure PrepararPrincipais;
    procedure PrepararAcompanhamentos;
    procedure GravarPrincipal;
    procedure GravarAcompanhamentos;
    procedure ExcluirPrincipal;
    procedure ExcluirAcompanhamento;
    function  PrincipalGravado:Boolean;
    function  AcompanhamentoGravado:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCardapio: TfrmCardapio;

implementation

{$R *.dfm}

uses unDM;

procedure TfrmCardapio.FormShow(Sender: TObject);
begin
  DateTimePicker1.DateTime := now;
  CarregarProdutosPrincipais;
  CarregarProdutosAcompanhamento;
  PrepararPrincipais;
  PrepararAcompanhamentos;



end;

procedure TfrmCardapio.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if PrincipalGravado then
      showmessage('Produto já gravado!')
  else
  begin
     GravarPrincipal;
     PrepararPrincipais;
  end;

end;

procedure TfrmCardapio.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if AcompanhamentoGravado then
      showmessage('Produto já gravado!')
   else
   begin
      GravarAcompanhamentos;
      PrepararAcompanhamentos;
   end;
end;

procedure TfrmCardapio.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Deseja excluir o produto selecionado ?',mtCustom,
                               [mbYes,mbNo], 0);


   if buttonSelected = mrYes    then
   begin
     ExcluirPrincipal;
     PrepararPrincipais;
   end;

end;

procedure TfrmCardapio.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Deseja excluir o produto selecionado ?',mtCustom,
                               [mbYes,mbNo], 0);


   if buttonSelected = mrYes    then
   begin
     ExcluirAcompanhamento;
     PrepararAcompanhamentos;
   end;


end;

procedure TfrmCardapio.CarregarProdutosPrincipais;
begin
  DM.cdsPRO.Close;
  DM.cdsPRO.CommandText := 'select * from produtos where tipo_pro = 1';
  DM.cdspro.open;
end;

procedure TfrmCardapio.DateTimePicker1Change(Sender: TObject);
begin
    PrepararPrincipais;
    PrepararAcompanhamentos;
end;

procedure TfrmCardapio.ExcluirAcompanhamento;
begin
   DM.cdsGRAVAR.Close;
   DM.cdsGRAVAR.CommandText := 'delete from produto_dia where codpro_prodia = ' +
                                         DM.cdsPRODIAA.FieldByName('codpro_prodia').AsString +
                                         ' and data_prodia = ' +  quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
  // DataModule1.cdsGRAVAR.Open;
   DM.cdsGRAVAR.Execute;

end;

procedure TfrmCardapio.ExcluirPrincipal;
begin
   DM.cdsGRAVAR.Close;
   DM.cdsGRAVAR.CommandText := 'delete from produto_dia where codpro_prodia = ' +
                                         DM.cdsPRODIAP.FieldByName('codpro_prodia').AsString +
                                         ' and data_prodia = ' +  quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
  // DataModule1.cdsGRAVAR.Open;
   DM.cdsGRAVAR.Execute;

end;

function TfrmCardapio.AcompanhamentoGravado: Boolean;
begin
 DM.cdsCONSULTA.Close;
     dM.cdsCONSULTA.CommandText := 'select * from produto_dia ' +
                                            '  where codpro_prodia = ' +DM.cdsTELASCONSULTA.FieldByName('cod_pro').AsString +
                                            ' and data_prodia = ' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
     DM.cdsCONSULTA.Open;
     Result := not DM.cdsCONSULTA.IsEmpty;
end;

procedure TfrmCardapio.CarregarProdutosAcompanhamento;
begin
  DM.cdsTELASCONSULTA.Close;
  DM.cdsTELASCONSULTA.CommandText := ' select * from produtos where tipo_pro = 0';
  DM.cdsTELASCONSULTA.Open;
end;

procedure TfrmCardapio.PrepararPrincipais;
begin
  DM.cdsPRODIAP.Close;
  DM.cdsPRODIAP.CommandText := 'select * from produto_dia left outer join produtos on cod_pro = codpro_prodia ' +
                                        ' where tipo_pro = 1 and data_prodia =' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));

  DM.cdsPRODIAP.Open;

end;

function TfrmCardapio.PrincipalGravado: Boolean;
begin
     DM.cdsCONSULTA.Close;
     DM.cdsCONSULTA.CommandText := 'select * from produto_dia ' +
                                            '  where codpro_prodia = ' +DM.cdsPRO.FieldByName('cod_pro').AsString +
                                            ' and data_prodia = ' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
     DM.cdsCONSULTA.Open;
     Result := not DM.cdsCONSULTA.IsEmpty;
end;

procedure TfrmCardapio.PrepararAcompanhamentos;
begin
  DM.cdsPRODIAA.Close;
  DM.cdsPRODIAA.CommandText := 'select * from produto_dia left outer join produtos on cod_pro = codpro_prodia' +
                                        ' where tipo_pro = 0  and data_prodia =' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
  DM.cdsPRODIAA.Open;

end;

procedure TfrmCardapio.GravarAcompanhamentos;
begin
  DM.cdsGRAVAR.Close;
  DM.cdsGRAVAR.CommandText  := 'select * from produto_dia where data_prodia =' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
  DM.cdsGRAVAR.Open;
  DM.cdsgravar.Insert;
  DM.cdsGRAVAR.FieldByName('codpro_prodia').Asinteger := DM.cdsTELASCONSULTA.FieldByName('cod_pro').AsInteger;
  DM.cdsGRAVAR.FieldByName('data_prodia').AsString := (FormatDateTime('dd/MM/yyyy',DateTimePicker1.Date));
  DM.cdsGRAVAR.Post;
  DM.cdsGRAVAR.ApplyUpdates(0);
end;

procedure TfrmCardapio.GravarPrincipal;
begin
  DM.cdsGRAVAR.Close;
  DM.cdsGRAVAR.CommandText  := 'select * from produto_dia where data_prodia =' + quotedstr(FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date));
  DM.cdsGRAVAR.Open;
  DM.cdsgravar.Insert;
  DM.cdsGRAVAR.FieldByName('codpro_prodia').Asinteger := DM.cdsPRO.FieldByName('cod_pro').AsInteger;
  DM.cdsGRAVAR.FieldByName('data_prodia').AsString := (FormatDateTime('dd/MM/yyyy',DateTimePicker1.Date));
  DM.cdsGRAVAR.Post;
  DM.cdsGRAVAR.ApplyUpdates(0);
end;

end.
