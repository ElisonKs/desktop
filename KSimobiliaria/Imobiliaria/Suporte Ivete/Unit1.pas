unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unDM;

procedure TForm1.Button1Click(Sender: TObject);
var
count : integer;
begin
count := 0;
   DM.cdsALU.Close;
   DM.cdsALU.CommandText := 'select * from locacao where mesinicio_loc is not null and anoinicio_loc is not null and mesfim_loc is not null and anofim_loc is not null';
   DM.cdsALU.Open;
   if not DM.cdsALU.IsEmpty then
   begin
     ProgressBar1.Max := DM.cdsALU.RecordCount;

     DM.cdsALU.First;

   while not DM.cdsALU.Eof do
   begin
      Label1.Caption := 'Reprocessando aluguel: ' +  DM.cdsALU.FieldByName('cod_loc').AsString;
      Edit1.Text := IntToStr(count);
      Application.ProcessMessages;
      count := count + DM.GerarAlugueis(
      DM.cdsALU.FieldByName('mesinicio_loc').AsInteger,
      DM.cdsALU.FieldByName('anoinicio_loc').AsInteger,
      DM.cdsALU.FieldByName('mesfim_loc').AsInteger,
      DM.cdsALU.FieldByName('anofim_loc').AsInteger,
      DM.cdsALU.FieldByName('cod_loc').AsInteger,
      DM.cdsALU.FieldByName('venc_loc').AsInteger

      );
      DM.cdsALU.Next;
      ProgressBar1.StepBy(1);


   end;


   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
