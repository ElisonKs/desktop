unit unCadAut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadAut = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label12: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;

    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    codcli_aut: String;
        { Public declarations }
  end;

var
  frmCadAut: TfrmCadAut;

implementation

{$R *.dfm}

uses unDM;

procedure TfrmCadAut.btnSalvarClick(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
begin
    cdspadrao.FieldByName('CODCLI_AUT').AsString := codcli_aut;
    cdspadrao.FieldByName('COD_AUT').AsInteger := 0;
end;
   inherited;
end;



procedure TfrmCadAut.FormCreate(Sender: TObject);
begin
  inherited;
 cdspadrao := DM.cdsAUT;
end;

procedure TfrmCadAut.FormShow(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
     label12.Visible := True;
  inherited;
end;

end.
