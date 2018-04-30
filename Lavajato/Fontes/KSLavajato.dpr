program KSLavajato;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {Form1},
  FPADRAO in 'FPADRAO.pas' {FPADRAO_},
  FPADRAOMANUTENCAO in 'FPADRAOMANUTENCAO.pas' {FPADRAOMANUTENCAO_},
  unDM in 'unDM.pas' {DM: TDataModule},
  unCadAut in 'unCadAut.pas' {frmCadAut},
  unAutomoveis in 'unAutomoveis.pas' {frmAutomoveis},
  unCadCli in 'unCadCli.pas' {frmCadCli},
  unCliente in 'unCliente.pas' {frmCliente},
  unServico in 'unServico.pas' {frmServico},
  unCadSer in 'unCadSer.pas' {frmCadSer},
  unMovimento in 'unMovimento.pas' {frmMovimento},
  unRelatorio in 'unRelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFPADRAO_, FPADRAO_);
  Application.CreateForm(TFPADRAOMANUTENCAO_, FPADRAOMANUTENCAO_);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMovimento, frmMovimento);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.Run;
end.
