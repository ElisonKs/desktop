unit unMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls,DB;

type
  TfrmMovimento = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure DBLookupComboBox3DropDown(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBLookupComboBox3Exit(Sender: TObject);
  private
    { Private declarations }
    procedure carregarClientes;
    procedure carregarServicos;
  public
    { Public declarations }
  end;

var
  frmMovimento: TfrmMovimento;

implementation

{$R *.dfm}

uses unDM;

{ TForm2 }

procedure TfrmMovimento.carregarClientes;
begin
     DM.cdsCLI.Close;
     DM.cdsCLI.CommandText := 'select * from cliente';
     DM.cdsCLI.Open;
end;

procedure TfrmMovimento.carregarServicos;
begin
     DM.cdsSER.Close;
     DM.cdsSER.CommandText := 'select * from servico';
     DM.cdsSER.Open;
end;

procedure TfrmMovimento.DBLookupComboBox1DropDown(Sender: TObject);
begin
 DM.cdsAUT.Close;
     DM.cdsAUT.CommandText := 'select cod_aut,marca_aut||'+ quotedstr(' ')+'||modelo_aut||'+QuotedStr('-') + '||ano_aut as aut from automovel where CODCLI_AUT = ' + DM.cdsCLI.FieldByName('COD_CLI').AsString;
     DM.cdsAUT.Open;
end;

procedure TfrmMovimento.DBLookupComboBox1Exit(Sender: TObject);
begin
 DM.cdsAUT.Close;
     DM.cdsAUT.CommandText := 'select cod_aut,marca_aut||'+ quotedstr(' ')+'||modelo_aut||'+QuotedStr('-') + '||ano_aut as aut from automovel where CODCLI_AUT = ' + DM.cdsCLI.FieldByName('COD_CLI').AsString;
     DM.cdsAUT.Open;
end;

procedure TfrmMovimento.DBLookupComboBox3DropDown(Sender: TObject);
begin
   Edit1.Text := FormatFloat('R$ ###,###,##0.00',DM.cdsSER.FieldByName('VALOR_SER').AsCurrency) ;
end;

procedure TfrmMovimento.DBLookupComboBox3Exit(Sender: TObject);
begin
   Edit1.Text := FormatFloat('R$ ###,###,##0.00',DM.cdsSER.FieldByName('VALOR_SER').AsCurrency) ;
end;

procedure TfrmMovimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     DM.cdsCLI.Close;
     DM.cdsSER.Close;
     DM.cdsAUT.Close;
end;

procedure TfrmMovimento.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   carregarClientes;
    carregarServicos;
    DM.cdsMOVIMENTO.Close;
    DM.cdsMOVIMENTO.Commandtext := 'select * from movimento';
    DM.cdsMOVIMENTO.Open;
    DM.cdsMOVIMENTO.Insert;
end;

procedure TfrmMovimento.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      if DM.cdsMOVIMENTO.State in [dsInsert] then
      begin
        DM.cdsMOVIMENTO.FieldByName('VALOR_MOV').AsCurrency := DM.cdsSER.FieldByName('VALOR_SER').AsCurrency;
        DM.cdsMOVIMENTO.FieldByName('DATA_MOV').AsDateTime := DateTimePicker1.DateTime;
        DM.cdsMOVIMENTO.FieldByName('COD_MOV').AsInteger := 0;

        DM.cdsMOVIMENTO.Post;
        DM.cdsMOVIMENTO.ApplyUpdates(0);

        DM.cdsMOVIMENTO.Close;
        DM.cdsAUT.Close;
        DM.cdsCLI.Close;
        DM.cdsSER.Close;

      end
      else
      begin
        Showmessage('Nenhum movimento informado!');
      end;

end;

end.
