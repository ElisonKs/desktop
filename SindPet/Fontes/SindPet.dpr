program SindPet;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uCONSUSU in 'uCONSUSU.pas' {CONSUSU},
  uDM in 'uDM.pas' {DM: TDataModule},
  unSenha in 'unSenha.pas' {Form1},
  uPrincipal in 'uPrincipal.pas' {Principal},
  FPADRAO in 'FPADRAO.pas' {FPADRAO_},
  FPADRAOMANUTENCAO in 'FPADRAOMANUTENCAO.pas' {FPADRAOMANUTENCAO_},
  unCONSMED in 'unCONSMED.pas' {frmCONSMED},
  unCADMED in 'unCADMED.pas' {frmCADMED},
  unCONSCON in 'unCONSCON.pas' {frmCONCON},
  unCADCON in 'unCADCON.pas' {frmCADCON},
  unCONSASS in 'unCONSASS.pas' {frmCONASS},
  unCADASS in 'unCADASS.pas' {frmCADASS};

{$R *.res}

begin
  Application.Initialize;
  Application.UseMetropolisUI;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Metropolis UI Application';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCONSUSU, CONSUSU);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
