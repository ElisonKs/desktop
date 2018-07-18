unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Imaging.pngimage;

type
  TPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Image1: TImage;
    Cardpio1: TMenuItem;
    Categorias1: TMenuItem;
    Produtos1: TMenuItem;
    Estoque1: TMenuItem;
    ipo1: TMenuItem;
    Produtos2: TMenuItem;
    Caixa1: TMenuItem;
    Abrir1: TMenuItem;
    Encerrar1: TMenuItem;
    Venda1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Almoo1: TMenuItem;
    Jantar1: TMenuItem;
    VendasporPerodo1: TMenuItem;
    Clientes1: TMenuItem;
    Novo1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Almoo1Click(Sender: TObject);
    procedure Jantar1Click(Sender: TObject);
    procedure VendasporPerodo1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses uCADCAT, uCADITE, unPEDIDO, unVENDA, unRELVENDA, uCADCLI;

procedure TPrincipal.Almoo1Click(Sender: TObject);
begin
     Application.CreateForm(TPEDIDO,PEDIDO);
     PEDIDO.ShowModal;
end;

procedure TPrincipal.Categorias1Click(Sender: TObject);
begin
      Application.CreateForm(TCADCAT,CADCAT);
      CADCAT.ShowModal;
end;

procedure TPrincipal.Jantar1Click(Sender: TObject);
begin
      Application.CreateForm(TfrmVenda,frmVenda);
      frmVenda.ShowModal;
end;

procedure TPrincipal.Novo1Click(Sender: TObject);
begin
      Application.CreateForm(TCADCLI,CADCLI);
      CADCLI.ShowModal;
end;

procedure TPrincipal.Produtos1Click(Sender: TObject);
begin
       Application.CreateForm(TCADITE,CADITE);
      CADITE.ShowModal;
end;

procedure TPrincipal.Sair1Click(Sender: TObject);
begin
        if MessageDlg('Deseja mesmo encerrar a aplica��o?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
         begin
                 Close;
         end;
end;

procedure TPrincipal.VendasporPerodo1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelVenda,frmRelVenda);
  frmRelvenda.ShowModal;
end;

end.