program KSImobiliaria;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {Principal},
  unDM in 'unDM.pas' {DM: TDataModule},
  FPADRAO in 'FPADRAO.pas' {FPADRAO_},
  FPADRAOMANUTENCAO in 'FPADRAOMANUTENCAO.pas' {FPADRAOMANUTENCAO_},
  unIMO in 'unIMO.pas' {frmIMO},
  unCADINQ in 'unCADINQ.pas' {frmCADINQ},
  unPRO in 'unPRO.pas' {frmPRO},
  unCADFIA in 'unCADFIA.pas' {frmCADFIA},
  unCADIMO in 'unCADIMO.pas' {frmCADIMO},
  unINQ in 'unINQ.pas' {frmINQ},
  unFIA in 'unFIA.pas' {frmFIA},
  unCADPRO in 'unCADPRO.pas' {frmCADPRO},
  unLOC in 'unLOC.pas' {frmLOC},
  unCONSALU in 'unCONSALU.pas' {frmCONSALU},
  unRELALU in 'unRELALU.pas' {frmRELALU},
  unCONSLOC in 'unCONSLOC.pas' {frmCONSLOC},
  unBXAALU in 'unBXAALU.pas' {frmBXAALU},
  unRELIMO in 'unRELIMO.pas' {frmRELIMO};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFPADRAO_, FPADRAO_);
  Application.CreateForm(TFPADRAOMANUTENCAO_, FPADRAOMANUTENCAO_);
  Application.Run;
end.
