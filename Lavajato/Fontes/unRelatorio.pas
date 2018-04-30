unit unRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  ppDesignLayer, ppParameter, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, Vcl.Imaging.pngimage, ppPrnabl, ppBands, ppCache, ppVar,
  Vcl.ExtCtrls;

type
  TfrmRelatorio = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppImage2: TppImage;
    ppDetailBand2: TppDetailBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses unDM;

procedure TfrmRelatorio.Button1Click(Sender: TObject);
begin

  if RadioGroup1.ItemIndex = 0 then
   begin

  Dm.cdsCONSULTA.Close;
  DM.cdsCONSULTA.CommandText := 'select movimento.*, marca_aut||'+ quotedstr(' ')+'||modelo_aut||'+QuotedStr('-') + '||ano_aut as aut,nome_cli,nome_ser from movimento' +
                                ' left outer join cliente on cliente.cod_cli = movimento.codcli_mov ' +
                                ' left outer join automovel on automovel.codcli_aut = cliente.cod_cli '+
                                ' left outer join servico on servico.cod_ser = movimento.codser_mov ' +
                                ' where data_mov = :data';
  DM.cdsCONSULTA.ParamByName('data').AsDate := DateTimePicker1.Date;
  DM.cdsCONSULTA.Open;
  ppReport1.Print;
   end
   else
   begin
       Dm.cdsCONSULTA.Close;
  DM.cdsCONSULTA.CommandText := 'select sum(valor_mov) as total,count(*) as qtd,codser_mov,nome_ser from movimento ' +
                                ' left outer join servico on servico.cod_ser = movimento.codser_mov ' +
                                ' group by codser_mov,nome_ser ' ;

  DM.cdsCONSULTA.Open;
  ppReport2.Print;
   end;
end;

procedure TfrmRelatorio.ppHeaderBand1BeforePrint(Sender: TObject);
begin
 pplabel14.Caption := DatetoStr(DateTimePicker1.DateTime);
end;

end.
