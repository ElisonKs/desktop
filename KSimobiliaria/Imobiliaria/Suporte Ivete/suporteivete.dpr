program suporteivete;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unDM in '..\Documents\E\Projetos\Imobiliaria\Fontes\unDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
