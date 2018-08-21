unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,MidasLib,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef;

type
  TDM = class(TDataModule)
    Banco: TFDConnection;
    Transacao: TFDTransaction;
    qryASS: TFDQuery;
    dspASS: TDataSetProvider;
    cdsASS: TClientDataSet;
    dsASS: TDataSource;
    qryCONSULTA: TFDQuery;
    dspCONSULTA: TDataSetProvider;
    cdsCONSULTA: TClientDataSet;
    dsCONSULTA: TDataSource;
    qryTRAVAR: TFDQuery;
    dspTRAVAR: TDataSetProvider;
    cdsTRAVAR: TClientDataSet;
    dsTRAVAR: TDataSource;
    qryGRID: TFDQuery;
    dspGRID: TDataSetProvider;
    cdsGRID: TClientDataSet;
    dsGRID: TDataSource;
    qryUSU: TFDQuery;
    dspUSU: TDataSetProvider;
    cdsUSU: TClientDataSet;
    dsUSU: TDataSource;
    cdsASSID_ASS: TIntegerField;
    cdsASSCPF_ASS: TStringField;
    cdsASSNOME_ASS: TStringField;
    cdsASSENDERECO_ASS: TStringField;
    cdsASSTELEFONE_ASS: TStringField;
    cdsASSCEL_ASS: TStringField;
    qryMED: TFDQuery;
    dspMED: TDataSetProvider;
    cdsMED: TClientDataSet;
    dsMED: TDataSource;
    qryCON: TFDQuery;
    dspCON: TDataSetProvider;
    cdsCON: TClientDataSet;
    dsCON: TDataSource;
    qryRELATORIO: TFDQuery;
    dspRELATORIO: TDataSetProvider;
    cdsRELATORIO: TClientDataSet;
    dsRELATORIO: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
