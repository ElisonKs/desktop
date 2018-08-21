unit unCADCON;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,Data.DB, Vcl.DBCtrls, Vcl.Mask,
  ppCtrls, Vcl.Imaging.pngimage, ppPrnabl, ppClass, ppBands, ppCache,
  ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,System.DateUtils;

type
  TfrmCADCON = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    edHora: TMaskEdit;
    edAssociado: TEdit;
    edNomeAssociado: TEdit;
    Button1: TButton;
    edMedico: TEdit;
    edNomeMedico: TEdit;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppImage2: TppImage;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppReport3: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppImage3: TppImage;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edAssociadoExit(Sender: TObject);
    procedure edMedicoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADCON: TfrmCADCON;

implementation

{$R *.dfm}

uses uDM, unCONSASS, unCONSMED;

procedure TfrmCADCON.btnSalvarClick(Sender: TObject);
var
complemento :String;
begin

DM.cdsTRAVAR.Close;
DM.cdsTRAVAR.CommandText := 'select * from consulta where idass_con = ' +
                            edAssociado.Text + ' and extract(month from data_con) = ' +
                            IntToStr(MonthOf(DateTimePicker1.Date));
DM.cdsTRAVAR.Open;
if (DM.cdsTRAVAR.RecordCount > 1) and (cdspadrao.State in [dsInsert]) then
   showmessage('Este associado j� marcou 2 consultas no referido m�s!')
else
begin



    if cdspadrao.State in [dsInsert] then
    begin
       cdspadrao.FieldByName('ID_CON').AsInteger := 0;
        complemento :=  ' order by ID_CON DESC rows 1 ';
    end
    else
       complemento := ' where ID_CON = ' + DBEdit1.Text;

       cdspadrao.FieldByName('IDASS_CON').AsString := edAssociado.Text;
       cdspadrao.FieldByName('IDMED_CON').AsString := edMedico.Text;
       cdspadrao.FieldByName('HORA_CON').AsString := edHora.Text;
       cdspadrao.FieldByName('DATA_CON').AsDateTime := DateTimePicker1.DateTime;

       inherited;

       If  MessageDlg('Deseja imprimir a ficha?',mtConfirmation,[mbyes,mbno],0)=mryes
      then
         begin
           DM.cdsRELATORIO.Close;
           DM.cdsRELATORIO.CommandText := 'select * from CONSULTA ' +
                                          ' left outer join ASSOCIADO on ASSOCIADO.id_ass = CONSULTA.idass_con ' +
                                          ' left outer join MEDICO on MEDICO.id_med = CONSULTA.idmed_con ' + complemento;

           DM.cdsRELATORIO.Open;
           case DM.cdsRELATORIO.FieldByName('TIPO_MED').AsInteger of
                 1: ppReport1.Print;
                 2: ppReport2.Print;
                 3: ppReport3.Print;
           end;

         end;
end;

end;

procedure TfrmCADCON.Button2Click(Sender: TObject);
begin
  inherited;
       Application.CreateForm(TfrmCONSMED,frmCONSMED);
         frmCONSMED.ShowModal;
         edMedico.Text := DM.cdsConsulta.FieldByName('ID_MED').AsString;
         edMedicoExit(Self);
end;

procedure TfrmCADCON.Button1Click(Sender: TObject);
begin
  inherited;
       Application.CreateForm(TfrmCONASS,frmCONASS);
         frmCONASS.ShowModal;
         edAssociado.Text := DM.cdsConsulta.FieldByName('ID_ASS').AsString;
         edAssociadoExit(Self);
end;

procedure TfrmCADCON.edAssociadoExit(Sender: TObject);
begin
  inherited;
  if edAssociado.Text <> '' then
  begin
    DM.cdsGRID.Close;
    DM.cdsGRID.CommandText := 'select * from associado where id_ass = ' + edAssociado.Text;
    DM.cdsGRID.Open;
    if not DM.cdsGRID.IsEmpty then
        edNomeAssociado.Text := DM.cdsGRID.FieldByName('NOME_ASS').AsString
    else
        edNomeAssociado.Text := 'N�o cadastrado';
  end;
end;

procedure TfrmCADCON.edMedicoExit(Sender: TObject);
begin
  inherited;
if edMedico.Text <> '' then
  begin
    DM.cdsGRID.Close;
    DM.cdsGRID.CommandText := 'select * from medico where id_med = ' + edMedico.Text;
    DM.cdsGRID.Open;
    if not DM.cdsGRID.IsEmpty then
        edNomeMedico.Text := DM.cdsGRID.FieldByName('NOME_MED').AsString
    else
        edNomeMedico.Text := 'N�o cadastrado';
  end;
end;

procedure TfrmCADCON.FormCreate(Sender: TObject);
begin
    inherited;
      cdspadrao := DM.cdsCON;

end;

procedure TfrmCADCON.FormShow(Sender: TObject);
begin
 if cdspadrao.State in [dsInsert] then
   begin
     Label7.Visible := True;
   end
   else
   begin
     edAssociadoExit(Self);
     edMedicoExit(Self);
   end;

  inherited;

end;

end.
