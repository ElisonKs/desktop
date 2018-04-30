unit unRELIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Vcl.StdCtrls, ppVar, ppPrnabl, ppCtrls,
  ppBands, ppCache, ppDesignLayer, ppParameter, Vcl.ExtCtrls, myChkBox;

type
  TfrmRELIMO = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    RadioGroup1: TRadioGroup;
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
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel5: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLabel9: TppLabel;
    ppDBText5: TppDBText;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLabel11: TppLabel;
    ppDBText7: TppDBText;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText9: TppDBText;
    ppLine3: TppLine;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRELIMO: TfrmRELIMO;

implementation

{$R *.dfm}

uses unDM;

procedure TfrmRELIMO.Button1Click(Sender: TObject);
begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from imovel';
    DM.cdsCONSULTA.Open;
    if not DM.cdsCONSULTA.IsEmpty then
    begin
      if RadioGroup1.ItemIndex = 1 then
         ppReport1.Print
      else
         ppReport2.Print;
    end
    else
      showmessage('Nenhum imóvel encontrado!');
end;

procedure TfrmRELIMO.Button2Click(Sender: TObject);
begin
       Close;
end;

end.
