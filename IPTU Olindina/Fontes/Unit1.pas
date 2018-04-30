unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Comp.DataSet, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, Vcl.StdCtrls, Vcl.Imaging.pngimage, ppPrnabl,
  ppCtrls, ppBands, ppCache, ppDesignLayer, ppParameter, ppStrtch, ppRegion,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, ppTableGrid;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1NUMERO_CADASTRO: TIntegerField;
    ClientDataSet1INSCRICAO: TStringField;
    ClientDataSet1NATUREZA: TStringField;
    ClientDataSet1PATRIMONIO: TStringField;
    ClientDataSet1TIPCON: TStringField;
    ClientDataSet1ESTRUTURA: TStringField;
    ClientDataSet1AREA_TERRENO: TBCDField;
    ClientDataSet1VALOR_TAXA_1PARC: TIntegerField;
    ClientDataSet1VALORTERRITORIAL: TBCDField;
    ClientDataSet1VALOR_IPTU: TBCDField;
    ClientDataSet1AREA_UNIDADE: TBCDField;
    ClientDataSet1VALOR_TAXA_2PARC: TIntegerField;
    ClientDataSet1VALORPREDIAL: TBCDField;
    ClientDataSet1VALOR_TAXA: TBCDField;
    ClientDataSet1TAXA_EXP: TIntegerField;
    ClientDataSet1ALIQUOTA: TIntegerField;
    ClientDataSet1VALORVENAL: TBCDField;
    ClientDataSet1TOTAL_DEBITO: TBCDField;
    ClientDataSet1DATA_PROCESSAMENTO: TSQLTimeStampField;
    ClientDataSet1SEQ: TIntegerField;
    ClientDataSet1NOME_CONTRIBUINTE_CGM: TStringField;
    ClientDataSet1ENDERECO_IMOVEL: TStringField;
    ClientDataSet1NUMERO_IMOVEL: TStringField;
    ClientDataSet1COMPLEMENTO_IMOVEL: TStringField;
    ClientDataSet1BAIRRO_IMOVEL: TStringField;
    ClientDataSet1CIDADE_IMOVEL: TStringField;
    ClientDataSet1ENDERECO_CGM: TStringField;
    ClientDataSet1NUMERO_CGM: TStringField;
    ClientDataSet1COMPLEMENTO_CGM: TStringField;
    ClientDataSet1BAIRRO_CGM: TStringField;
    ClientDataSet1CIDADE_CGM: TStringField;
    ClientDataSet1CEP_CGM: TStringField;
    ClientDataSet1NUMPAR_COTA_UNICA: TStringField;
    ClientDataSet1OBSERVACAO_COTAUNICA: TStringField;
    ClientDataSet1DATA_VENCIMENTO_COTAUNICA: TSQLTimeStampField;
    ClientDataSet1VALOR_IPTU_COTA_UNICA: TBCDField;
    ClientDataSet1VALOR_DESCONTO_COTAUNICA: TBCDField;
    ClientDataSet1VALOR_SUBSTOTAL: TBCDField;
    ClientDataSet1VALOR_TAXA_COTA_UNICA: TBCDField;
    ClientDataSet1TAXA_EXPEDIENTE_COTAUNICA: TBCDField;
    ClientDataSet1VALOR_TOTAL_COTAUNICA: TBCDField;
    ClientDataSet1LINHA_DIGITAVEL_COTAUNICA: TStringField;
    ClientDataSet1CODIGO_BARRASWN_COTAUNICA: TStringField;
    ClientDataSet1ESPACO18: TStringField;
    ClientDataSet1VALOR_M2_TERRENO: TBCDField;
    ClientDataSet1VALOR_M2_CONSTRUCAO: TBCDField;
    ClientDataSet1ESPACO: TStringField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    DataSource1: TDataSource;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppImage4: TppImage;
    ppRegion1: TppRegion;
    NOME1: TppLabel;
    endereco1: TppLabel;
    numero1: TppLabel;
    ppLabel1: TppLabel;
    bairro1: TppLabel;
    ppLabel2: TppLabel;
    cep1: TppLabel;
    ppLabel3: TppLabel;
    cidade1: TppLabel;
    ppLabel4: TppLabel;
    comp1: TppLabel;
    ppRegion2: TppRegion;
    nome2: TppLabel;
    endereco2: TppLabel;
    numero2: TppLabel;
    ppLabel8: TppLabel;
    bairro2: TppLabel;
    ppLabel10: TppLabel;
    cep2: TppLabel;
    ppLabel12: TppLabel;
    cidade2: TppLabel;
    ppLabel14: TppLabel;
    comp2: TppLabel;
    ppRegion3: TppRegion;
    nome3: TppLabel;
    endereco3: TppLabel;
    numero3: TppLabel;
    ppLabel19: TppLabel;
    bairro3: TppLabel;
    ppLabel21: TppLabel;
    cep3: TppLabel;
    ppLabel23: TppLabel;
    cidade3: TppLabel;
    ppLabel25: TppLabel;
    comp3: TppLabel;
    ppRegion4: TppRegion;
    nome4: TppLabel;
    endereco4: TppLabel;
    numero4: TppLabel;
    ppLabel30: TppLabel;
    bairro4: TppLabel;
    ppLabel32: TppLabel;
    cep4: TppLabel;
    ppLabel34: TppLabel;
    cidade4: TppLabel;
    ppLabel36: TppLabel;
    comp4: TppLabel;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ppReport2: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage5: TppImage;
    procedure Button1Click(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
ClientDataSet1.Close;
ClientDataSet1.CommandText := 'select * from dados_teste';
ClientDataSet1.Open;
ppReport1.Print;
end;

procedure TForm1.ppHeaderBand1BeforePrint(Sender: TObject);
begin

nome1.Caption := ClientDataSet1.FieldByName('NOME_CONTRIBUINTE_CGM').AsString;
endereco1.Caption := ClientDataSet1.FieldByName('ENDERECO_IMOVEL').AsString;
numero1.Caption := ClientDataSet1.FieldByName('NUMERO_IMOVEL').AsString;
bairro1.Caption := ClientDataSet1.FieldByName('BAIRRO_IMOVEL').AsString;
cep1.Caption := ClientDataSet1.FieldByName('CEP_CGM').AsString;
cidade1.Caption := ClientDataSet1.FieldByName('CIDADE_CGM').AsString;
comp1.Caption := ClientDataSet1.FieldByName('COMPLEMENTO_CGM').AsString;

    ClientDataSet1.MoveBy(1);


    nome2.Caption := ClientDataSet1.FieldByName('NOME_CONTRIBUINTE_CGM').AsString;
endereco2.Caption := ClientDataSet1.FieldByName('ENDERECO_IMOVEL').AsString;
numero2.Caption := ClientDataSet1.FieldByName('NUMERO_IMOVEL').AsString;
bairro2.Caption := ClientDataSet1.FieldByName('BAIRRO_IMOVEL').AsString;
cep2.Caption := ClientDataSet1.FieldByName('CEP_CGM').AsString;
cidade2.Caption := ClientDataSet1.FieldByName('CIDADE_CGM').AsString;
comp2.Caption := ClientDataSet1.FieldByName('COMPLEMENTO_CGM').AsString;

    ClientDataSet1.MoveBy(1);

    nome3.Caption := ClientDataSet1.FieldByName('NOME_CONTRIBUINTE_CGM').AsString;
endereco3.Caption := ClientDataSet1.FieldByName('ENDERECO_IMOVEL').AsString;
numero3.Caption := ClientDataSet1.FieldByName('NUMERO_IMOVEL').AsString;
bairro3.Caption := ClientDataSet1.FieldByName('BAIRRO_IMOVEL').AsString;
cep3.Caption := ClientDataSet1.FieldByName('CEP_CGM').AsString;
cidade3.Caption := ClientDataSet1.FieldByName('CIDADE_CGM').AsString;
comp3.Caption := ClientDataSet1.FieldByName('COMPLEMENTO_CGM').AsString;

    ClientDataSet1.MoveBy(1);

    nome4.Caption := ClientDataSet1.FieldByName('NOME_CONTRIBUINTE_CGM').AsString;
endereco4.Caption := ClientDataSet1.FieldByName('ENDERECO_IMOVEL').AsString;
numero4.Caption := ClientDataSet1.FieldByName('NUMERO_IMOVEL').AsString;
bairro4.Caption := ClientDataSet1.FieldByName('BAIRRO_IMOVEL').AsString;
cep4.Caption := ClientDataSet1.FieldByName('CEP_CGM').AsString;
cidade4.Caption := ClientDataSet1.FieldByName('CIDADE_CGM').AsString;
comp4.Caption := ClientDataSet1.FieldByName('COMPLEMENTO_CGM').AsString;

    ClientDataSet1.MoveBy(1);
end;

end.
