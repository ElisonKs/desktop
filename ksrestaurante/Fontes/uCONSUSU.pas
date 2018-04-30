unit uCONSUSU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCONSUSU = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CONSUSU: TCONSUSU;

implementation

{$R *.dfm}

uses uDM;

procedure TCONSUSU.DBGrid1DblClick(Sender: TObject);
begin
      Close;
end;

procedure TCONSUSU.FormShow(Sender: TObject);
begin
       DM.cdsUSU.Close;
       DM.cdsUSU.CommandText := 'select * from usuario';
       DM.cdsUSU.Open;
end;

end.
