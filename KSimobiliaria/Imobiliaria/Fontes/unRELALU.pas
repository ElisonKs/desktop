unit unRELALU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Vcl.StdCtrls, ppVar, ppPrnabl, ppCtrls,
  ppBands, ppCache, ppDesignLayer, ppParameter, Vcl.ExtCtrls, myChkBox,
  Vcl.ComCtrls,DateUtils;

type
  TfrmRELALU = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    lblMes: TppLabel;
    lblAno: TppLabel;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    lblDataPagamento: TppLabel;
    lblDataRepasse: TppLabel;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel11: TppLabel;
    lblOpcao: TppLabel;
    ppLabel12: TppLabel;
    lblRecebido: TppLabel;
    lblEstimado: TppLabel;
    ppLabel13: TppLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRELALU: TfrmRELALU;

implementation

{$R *.dfm}

uses unDM;

procedure TfrmRELALU.Button1Click(Sender: TObject);
var
datainicial,datafinal:string;
begin

datainicial := FormatDatetime('MM/dd/yyyy',DateTimePicker1.DateTime);
datafinal := FormatDatetime('MM/dd/yyyy',DateTimePicker2.DateTime);
lblMes.Text := FormatDatetime('dd/MM/yyyy',DateTimePicker1.DateTime);
lblAno.Text := FormatDatetime('dd/MM/yyyy',DateTimePicker2.DateTime);

    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := ' select inquilino.nome_inq as LOCATARIO,proprietario.nome_pro  as PROPRIETARIO, ' +
                                  '  locacao.valor_loc as VALOR, aluguel.data_alu as VCTO,aluguel.datapag_alu as DATAPAGTO, ' +
                                  '  aluguel.datarep_alu as DATAREPASSE, aluguel.valorpago_alu as VALORPAGO ' +
                                  '   from aluguel ' +
                                  '  left outer join locacao on aluguel.codloc_alu = locacao.cod_loc ' +
                                  '  left outer join inquilino on inquilino.cod_inq = locacao.codinq_loc ' +
                                  '  left outer join imovel on imovel.cod_imo = locacao.codimo_loc ' +
                                  '  left outer join proprietario on proprietario.cod_pro = imovel.codpro_imo ' +
                                  '  where aluguel.data_alu between ' + QuotedStr(datainicial)  + ' and ' + QuotedStr(datafinal) ;

     if RadioGroup1.ItemIndex = 0 then
        DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' and aluguel.valorpago_alu is null'
     else if RadioGroup1.ItemIndex = 1 then
        DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + ' and aluguel.valorpago_alu is not null';





    DM.cdsCONSULTA.CommandText := DM.cdsCONSULTA.CommandText + '  order by aluguel.data_alu';
    DM.cdsCONSULTA.Open;
    if not DM.cdsCONSULTA.IsEmpty then
    begin

         ppReport1.Print

    end
    else
      showmessage('Nenhum aluguel encontrado!');
end;

procedure TfrmRELALU.Button2Click(Sender: TObject);
begin
       Close;
end;

procedure TfrmRELALU.ppDetailBand1BeforePrint(Sender: TObject);
begin
     if DM.cdsCONSULTA.FieldByName('DATAREPASSE').AsString = '30/12/1899' then
        lblDataRepasse.Text := ''
     else
        lblDataRepasse.Text := DM.cdsCONSULTA.FieldByName('DATAREPASSE').AsString ;
 if DM.cdsCONSULTA.FieldByName('DATAPAGTO').AsString = '30/12/1899' then
        lblDataPagamento.Text := ''
     else
        lblDataPagamento.Text := DM.cdsCONSULTA.FieldByName('DATAPAGTO').AsString;

end;

procedure TfrmRELALU.ppFooterBand1BeforePrint(Sender: TObject);
var
datainicial,datafinal : String;
begin
  if RadioGroup1.ItemIndex = 0 then
     lblOpcao.Text := 'Em aberto'
  else if RadioGroup1.ItemIndex = 1 then
     lblOpcao.Text := 'Pagos'
  else
  lblOpcao.Text := 'Todos';

  //Totais
  datainicial := FormatDatetime('MM/dd/yyyy',DateTimePicker1.DateTime);
  datafinal := FormatDatetime('MM/dd/yyyy',DateTimePicker2.DateTime);
  DM.cdsGRAVAR.Close;
  DM.cdsGRAVAR.CommandText :=  ' select sum(aluguel.valorpago_alu) as TOTALRECEBIDO, sum(locacao.valor_loc) as TOTALESTIMADO ' +
                               '  from aluguel ' +
                               ' left outer join locacao on aluguel.codloc_alu = locacao.cod_loc ' +
                               '  left outer join inquilino on inquilino.cod_inq = locacao.codinq_loc ' +
                               '  left outer join imovel on imovel.cod_imo = locacao.codimo_loc ' +
                               '  left outer join proprietario on proprietario.cod_pro = imovel.codpro_imo ' +
                              '  where aluguel.data_alu between ' + QuotedStr(datainicial)  + ' and ' + QuotedStr(datafinal) ;
  DM.cdsGRAVAR.Open;
  if not DM.cdsGRAVAR.IsEmpty then
  begin
    lblEstimado.Caption := DM.cdsGRAVAR.FieldByName('TOTALESTIMADO').AsString;
    lblRecebido.Caption := DM.cdsGRAVAR.FieldByName('TOTALRECEBIDO').AsString;
  end;


end;

end.
