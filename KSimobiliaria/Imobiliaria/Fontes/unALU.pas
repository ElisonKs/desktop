unit unALU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmALU = class(TForm)
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    Button2: TButton;
    Button3: TButton;
    edMesInicial: TEdit;
    Label2: TLabel;
    edMesFinal: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmALU: TfrmALU;

implementation

{$R *.dfm}

uses unCONSLOC, unDM;

procedure TfrmALU.Button2Click(Sender: TObject);
begin
   dm.cds
end;

end.
