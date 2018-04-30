unit unCADIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCADIMO = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DBMemo1: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADIMO: TfrmCADIMO;

implementation

{$R *.dfm}

uses unDM, unPRO;

procedure TfrmCADIMO.btnSalvarClick(Sender: TObject);
begin
  cdspadrao.FieldByName('CODPRO_IMO').AsString := Edit2.Text;
if cdspadrao.State in [dsInsert] then
   cdspadrao.FieldByName('COD_IMO').AsInteger := 0;
   inherited;
end;

procedure TfrmCADIMO.Button1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmPro,FrmPro);
  frmpro.mostrarConfirmar := True;
  frmpro.ShowModal;
  Edit2.Text := DM.cdsCONSULTA.FieldByName('COD_PRO').AsString;
  Edit2Exit(Self);
end;

procedure TfrmCADIMO.Edit2Exit(Sender: TObject);
begin
  inherited;
   if edit2.Text <> '' then
   begin
       DM.cdsCONSULTA.Close;
       DM.cdsCONSULTA.CommandText := 'select * from proprietario where cod_pro=' + Edit2.Text;
       DM.cdsCONSULTA.Open;
       if dm.cdsCONSULTA.IsEmpty then
       begin
         Edit1.Text := 'Propriet�rio n�o cadastrado';
       end
       else
       begin
          Edit1.Text := DM.cdsCONSULTA.FieldByName('NOME_PRO').AsString;
       end;
   end;
end;

procedure TfrmCADIMO.FormCreate(Sender: TObject);
begin
  inherited;
      cdspadrao := DM.cdsIMO;
end;

procedure TfrmCADIMO.FormShow(Sender: TObject);
begin
 if cdspadrao.State in [dsInsert] then
     label5.Visible := True
 else
     Edit2.Text := cdspadrao.FieldByName('CODPRO_IMO').AsString;
     Edit2Exit(Self);

  inherited;

end;

end.
