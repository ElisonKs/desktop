unit unESTMOV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmPadrao, Data.DB, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmESTMOV = class(TfrmPadrao_)
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    RadioGroup2: TRadioGroup;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
      procedure executarSQL;
  public
    { Public declarations }
  end;

var
  frmESTMOV: TfrmESTMOV;

implementation

{$R *.dfm}

uses unCadCLI, unDM, unMOVPAGTIT;

procedure TfrmESTMOV.btnApagarClick(Sender: TObject);
var
buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Confirma a exclus�o do registro?',mtCustom,
                               [mbYes,mbNo], 0);


   if buttonSelected = mrYes    then
      begin
        cdspadrao.Close;
        cdsPadrao.CommandText := 'select * from PAGTIT where SEQ_PAGTIT = ' + cdsConsulta.FieldByName('SEQ_PAGTIT').AsString;
        cdspadrao.Open;
         inherited;
      end;

end;

procedure TfrmESTMOV.btnEditarClick(Sender: TObject);
begin
 where := where +' and SEQ_PAGTIT =' + DataModule1.cdsCONSULTA.FieldByName('SEQ_PAGTIT').AsString;
  inherited;
   Application.CreateForm(TFrmMOVPAGTIT,frmMOVPAGTIT);
   cdsPadrao.Open;
   cdsPadrao.Edit;
   frmMOVPAGTIT.DBEdit4Exit(Self);
  frmMOVPAGTIT.ShowModal;
  btnPesquisarClick(Self);


end;

procedure TfrmESTMOV.btnNovoClick(Sender: TObject);
begin

  Application.CreateForm(TFrmMOVPAGTIT,frmMOVPAGTIT);
   cdsPadrao.Open;
   cdsPadrao.Insert;
  frmMOVPAGTIT.ShowModal;
  inherited;
end;

procedure TfrmESTMOV.btnPesquisarClick(Sender: TObject);
begin
     where := '';
     if CheckBox1.Checked then
     begin
          if DateTimePicker1.Date > DateTimePicker2.Date then
          begin
                 showmessage('Data Inicial n�o pode ser maior que Data Final!');
                 Exit;
          end
          else
          begin

          if RadioGroup2.ItemIndex = 0 then
              where := where + 'and DATAEMISSAO_PAGTTIT between ' +  QuotedStr(StringReplace((DatetoStr(DateTimePicker1.Date)),'/','.', [rfReplaceAll, rfIgnoreCase])) + 'and ' + QuotedStr(StringReplace((DatetoStr(DateTimePicker2.Date)),'/','.', [rfReplaceAll, rfIgnoreCase]))
          else
              where := where + 'and DATAVENC_PAGTIT between ' + QuotedStr(StringReplace((DatetoStr(DateTimePicker1.Date)),'/','.', [rfReplaceAll, rfIgnoreCase])) + 'and ' + QuotedStr(StringReplace((DatetoStr(DateTimePicker2.Date)),'/','.', [rfReplaceAll, rfIgnoreCase]));
          end;
     end;

     if RadioGroup1.ItemIndex = 0 then
        where := where + 'and VALORPAGO_PAGTIT <> VALORTOTAL_PAGTIT '
     else if RadioGroup1.ItemIndex = 1 then
         where := where + 'and VALORPAGO_PAGTIT = VALORTOTAL_PAGTIT ';
  inherited;

end;

procedure TfrmESTMOV.executarSQL;
begin



  inherited;

end;

procedure TfrmESTMOV.FormCreate(Sender: TObject);
begin
  inherited;
    cdsPadrao := DataModule1.cdsPAGTIT;
    cdsConsulta := DataModule1.cdsCONSULTA;



    campos := ' SEQ_PAGTIT, ORIGEM_PAGTIT,DATAEMISSAO_PAGTTIT,CODFOR_PAGTIT,DATAVENC_PAGTIT,VALORTOTAL_PAGTIT,VALORPAGO_PAGTIT,' +
              ' CODFOR_PAGTIT,(VALORTOTAL_PAGTIT - VALORPAGO_PAGTIT) AS VALORABERTO ';
    tabela := 'PAGTIT';
    where := '';
    join := 'LEFT OUTER JOIN FORNECEDOR ON CODIGO_FOR = CODFOR_PAGTIT ';
    campoConsulta := 'NOME_FOR';
end;

end.
