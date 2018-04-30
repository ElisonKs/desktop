unit FPADRAOMANUTENCAO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DB, DBClient, StdCtrls, Buttons;

type
  TFPADRAOMANUTENCAO_ = class(TForm)
    stbInformacao: TStatusBar;
    stbStatus: TStatusBar;
    timer: TTimer;
    Panel1: TPanel;
    btnSalvar: TBitBtn;
    pnlPrincipal: TPanel;
    procedure timerTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  protected
    function  moverHint(form: TForm): String;
  private
    { Private declarations }
  public
    { Public declarations }
    cdsPadrao: TClientDataSet;
    erroPadrao: Boolean;
    tabelaPadrao, operacaoPadrao: String;
  end;

var
  FPADRAOMANUTENCAO_: TFPADRAOMANUTENCAO_;

implementation



{$R *.dfm}

procedure TFPADRAOMANUTENCAO_.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFPADRAOMANUTENCAO_.btnSalvarClick(Sender: TObject);
begin
  cdsPadrao.Post;
  erroPadrao := (cdsPadrao.ApplyUpdates(0) > 0);

end;

procedure TFPADRAOMANUTENCAO_.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    begin
      if (cdsPadrao.State in [dsInsert, dsEdit]) then
        begin
          Key := #0;
          Perform(Wm_NextDlgCtl,1,0);
        end
      else
        Close;
    end;

  if (key = #13) then
    begin
      Key := #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TFPADRAOMANUTENCAO_.FormShow(Sender: TObject);
begin
  stbStatus.Font.Style := [fsBold];


end;

function TFPADRAOMANUTENCAO_.moverHint(form: TForm): String;
var
  i: Integer;
begin
  for i := 0 to form.componentcount - 1 do
    begin
      if (ActiveControl = form.components[i]) then
        begin
          if (form.components[i] is TControl) then
            begin
              if (Trim((form.components[i] as TControl).Hint) <> '') then
                Result := (form.components[i] as TControl).Hint;
            end;
        end;
    end;
end;

procedure TFPADRAOMANUTENCAO_.timerTimer(Sender: TObject);
begin
  stbInformacao.Panels[0].Text := 'Data: ' + DateToStr(Now);
  stbInformacao.Panels[1].Text := 'Hora: ' + TimeToStr(Now);
  stbStatus.SimpleText         := moverHint(Self);

//  util_.corNoElementoEmFoco(Self);
end;

end.
