unit uCONSCLI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmCONSCLI = class(TForm)
    DBGrid1: TDBGrid;
    edConsulta: TEdit;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCONSCLI: TfrmCONSCLI;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmCONSCLI.Button1Click(Sender: TObject);
begin
       DM.cdsCLI.Close;
       DM.cdsCLI.CommandText := 'select * from clientes where nome_cli like ''%' + edConsulta.Text + '%''';
       if Edit1.Text <> '' then
          DM.cdsCLI.commandtext := DM.cdsCLI.CommandText  + ' and  tel_cli like ''%' + Edit1.Text + '%''';
     //   showmessage(DM.cdsCLI.commandtext);
       DM.cdsCLI.Open;
end;

procedure TfrmCONSCLI.DBGrid1DblClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCONSCLI.FormShow(Sender: TObject);
begin
       DM.cdsCLI.Close;
       DM.cdsCLI.CommandText := 'select * from clientes';
       DM.cdsCLI.Open;
end;

end.
