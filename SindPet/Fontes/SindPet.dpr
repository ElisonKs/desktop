program SindPet;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uCONSUSU in 'uCONSUSU.pas' {CONSUSU},
  uDM in 'uDM.pas' {DM: TDataModule},
  unSenha in 'unSenha.pas' {Form1},
  uPrincipal in 'uPrincipal.pas' {Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.UseMetropolisUI;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Metropolis UI Application';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCONSUSU, CONSUSU);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
