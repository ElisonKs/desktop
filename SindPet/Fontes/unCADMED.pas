unit unCADMED;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,Data.DB, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCADMED = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADMED: TfrmCADMED;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmCADMED.btnSalvarClick(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
   cdspadrao.FieldByName('ID_MED').AsInteger := 0;
   inherited;
end;

procedure TfrmCADMED.FormCreate(Sender: TObject);
begin
    inherited;
      cdspadrao := DM.cdsMED;

end;

procedure TfrmCADMED.FormShow(Sender: TObject);
begin
 if cdspadrao.State in [dsInsert] then
     Label7.Visible := True;

  inherited;

end;

end.
