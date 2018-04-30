unit Mainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  Data.DB, Datasnap.DBClient, uniButton, unimButton, uniGUIBaseClasses,
  uniBasicGrid, uniDBGrid, unimDBListGrid, unimDBGrid, Vcl.Imaging.pngimage,
  uniImage, unimImage;

type
  TMainmForm = class(TUnimForm)
    UnimButton1: TUnimButton;
    UnimImage1: TUnimImage;
    procedure UnimButton1Click(Sender: TObject);
    procedure UnimImage1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainmForm: TMainmForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule, unConfig;

function MainmForm: TMainmForm;
begin
  Result := TMainmForm(UniMainModule.GetFormInstance(TMainmForm));
end;

procedure TMainmForm.UnimButton1Click(Sender: TObject);
begin
   UniServerModule.ClientDataSet1.Open;
end;

procedure TMainmForm.UnimImage1Click(Sender: TObject);
var
form : TfrmConfig;
begin
  form := TfrmConfig.Create(UniApplication);
  form.Show();
end;

initialization
  RegisterAppFormClass(TMainmForm);

end.
