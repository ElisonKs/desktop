unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus,IniFiles;

type
  TPrincipal = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Movimento1: TMenuItem;
    Relatrios1: TMenuItem;
    Proprietrio1: TMenuItem;
    Inquilino1: TMenuItem;
    Fiador1: TMenuItem;
    Imvel1: TMenuItem;
    Locao1: TMenuItem;
    GerarAluguis1: TMenuItem;
    Imveis1: TMenuItem;
    Aluguel1: TMenuItem;
    procedure Proprietrio1Click(Sender: TObject);
    procedure Inquilino1Click(Sender: TObject);
    procedure Fiador1Click(Sender: TObject);
    procedure Imvel1Click(Sender: TObject);
    procedure Locao1Click(Sender: TObject);
    procedure Imveis1Click(Sender: TObject);
    procedure GerarAluguis1Click(Sender: TObject);
    procedure Aluguel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    function ConectarBanco: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses unPRO, unINQ, unFIA, unIMO, unLOC, unRELIMO, unBXAALU, unRELALU, unDM;

procedure TPrincipal.Aluguel1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmRELALU,frmRELALU);
    frmRELALU.ShowModal;
end;

function TPrincipal.ConectarBanco: Boolean;
var
ArqIni : TIniFile;
begin
     ArqIni := TIniFile.Create(GetCurrentDir +  '\config.ini');

  try

    DM.Banco.Params.Database :=   ArqIni.ReadString('BANCO', 'pasta', '');
    DM.Banco.Connected := True;
 
  finally

    ArqIni.Free;
  end;
end;

procedure TPrincipal.Fiador1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmFIA,frmFIA);
    frmFIA.ShowModal;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
 if not DM.ConectarBanco then
  begin
    showmessage('Impossível conectar ao banco de dados!');
    Application.Terminate;
  end;
end;

procedure TPrincipal.GerarAluguis1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmBXAALU,frmBXAALU);
    frmBXAALU.ShowModal;
end;

procedure TPrincipal.Imveis1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmRELIMO,frmRELIMO);
    frmRELIMO.ShowModal;
end;

procedure TPrincipal.Imvel1Click(Sender: TObject);
begin
 Application.CreateForm(TfrmIMO,frmIMO);
    frmIMO.ShowModal;
end;

procedure TPrincipal.Inquilino1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmINQ,frmINQ);
    frmINQ.ShowModal;
end;

procedure TPrincipal.Locao1Click(Sender: TObject);
begin
      Application.CreateForm(TfrmLOC,frmLOC);
    frmLOC.ShowModal;
end;

procedure TPrincipal.Proprietrio1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmPro,frmPro);
    frmPro.ShowModal;
end;

end.
