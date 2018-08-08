unit unCADCON;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,Data.DB, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCADCON = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADCON: TfrmCADCON;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmCADCON.btnSalvarClick(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
   cdspadrao.FieldByName('ID_ASS').AsInteger := 0;
   inherited;
end;

procedure TfrmCADCON.FormCreate(Sender: TObject);
begin
    inherited;
      cdspadrao := DM.cdsASS;

end;

procedure TfrmCADCON.FormShow(Sender: TObject);
begin
 if cdspadrao.State in [dsInsert] then
     Label7.Visible := True;

  inherited;

end;

end.
