unit unCadSer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadSer = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label12: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;

    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cod_end: Integer;
  public
    { Public declarations }
  end;

var
  frmCadSer: TfrmCadSer;

implementation

{$R *.dfm}

uses unDM;

procedure TfrmCadSer.btnSalvarClick(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
   cdspadrao.FieldByName('COD_SER').AsInteger := 0;
   inherited;
end;



procedure TfrmCadSer.FormCreate(Sender: TObject);
begin
  inherited;
 cdspadrao := DM.cdsSER;
end;

procedure TfrmCadSer.FormShow(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
     label12.Visible := True;
  inherited;
end;

end.
