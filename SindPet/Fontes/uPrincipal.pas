unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TPrincipal = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Sair1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses unCONSASS;



procedure TPrincipal.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Application.CreateForm(TfrmCONASS,frmCONASS);
   frmCONASS.ShowModal;
end;

procedure TPrincipal.Sair1Click(Sender: TObject);
begin
        if MessageDlg('Deseja mesmo encerrar a aplicação?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
         begin
                 Close;
         end;
end;

end.
