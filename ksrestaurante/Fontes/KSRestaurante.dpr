program KSRestaurante;

uses
  Vcl.Forms,
  unSenha in 'unSenha.pas' {Form1},
  uDM in 'uDM.pas' {DM: TDataModule},
  uCONSCLI in 'uCONSCLI.pas' {frmCONSCLI},
  uPrincipal in 'uPrincipal.pas' {Principal},
  uCADITE in 'uCADITE.pas' {CADITE},
  uCADCLI in 'uCADCLI.pas' {CADCLI},
  uABRIRCXA in 'uABRIRCXA.pas' {ABRIRCXA},
  unPEDIDO in 'unPEDIDO.pas' {PEDIDO},
  unVENDA in 'unVENDA.pas' {frmVENDA},
  unITENSVENDA in 'unITENSVENDA.pas' {frmITENSVENDA},
  uCONSUSU in 'uCONSUSU.pas' {CONSUSU},
  unRELVENDA in 'unRELVENDA.pas' {frmRELVENDA},
  uCADCAT in 'uCADCAT.pas' {CADCAT},
  uCONSITE in 'uCONSITE.pas' {frmCONSITE};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TABRIRCXA, ABRIRCXA);
  Application.CreateForm(TPEDIDO, PEDIDO);
  Application.CreateForm(TfrmRELVENDA, frmRELVENDA);
  Application.Run;
end.
