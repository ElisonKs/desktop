unit uDMGERENCIADOR;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet;

type
  TdmGerenciador = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    qryUSU: TFDQuery;
    dspUSU: TDataSetProvider;
    cdsUSU: TClientDataSet;
    dsUSU: TDataSource;
    qryCONSULTA: TFDQuery;
    dspCONSULTA: TDataSetProvider;
    cdsCONSULTA: TClientDataSet;
    dsCONSULTA: TDataSource;
    cdsUSUID_USU: TIntegerField;
    cdsUSUNOME_USU: TStringField;
    cdsUSUSENHA_USU: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGerenciador: TdmGerenciador;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
