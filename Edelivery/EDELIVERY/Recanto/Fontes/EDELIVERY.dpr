program EDELIVERY;

uses
  Vcl.Forms,
  MidasLib,
  unDM in 'unDM.pas' {DM: TDataModule},
  unENT in 'unENT.pas' {frmENT},
  unCadEnt in 'unCadEnt.pas' {frmCadEnt},
  unConsCLIENTE in 'unConsCLIENTE.pas' {fmrConsCLIENTE},
  unCLI in 'unCLI.pas' {frmCLI},
  unCadPro in 'unCadPro.pas' {frmCadPro},
  unPRO in 'unPRO.pas' {frmPRO},
  unCardapio in 'unCardapio.pas' {frmCardapio},
  unPedido in 'unPedido.pas' {frmPedido},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unFinanceiro in 'unFinanceiro.pas' {frmFinanceiro},
  unRelatorios in 'unRelatorios.pas' {frmRelatorios},
  FrmPADRAO in 'FrmPADRAO.pas' {frmPadrao_},
  FrmPADRAOMANUTENCAO in 'FrmPADRAOMANUTENCAO.pas' {FrmPADRAOMANUTENCAO_};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TMDELIVERY';


  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmFinanceiro, frmFinanceiro);
  Application.CreateForm(TfrmRelatorios, frmRelatorios);
  Application.Run;
end.
