unit unCADASS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FPADRAOMANUTENCAO, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,Data.DB, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCADASS = class(TFPADRAOMANUTENCAO_)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    Label7: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADASS: TfrmCADASS;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmCADASS.btnSalvarClick(Sender: TObject);
begin

if cdspadrao.State in [dsInsert] then
   cdspadrao.FieldByName('ID_ASS').AsInteger := 0;
   cdspadrao.FieldByName('DATANASC_ASS').AsDateTime := DateTimePicker1.DateTime;
   inherited;
end;

procedure TfrmCADASS.FormCreate(Sender: TObject);
begin
    inherited;
      cdspadrao := DM.cdsASS;

end;

end.
