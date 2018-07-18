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
    qryUSU: TFDQuery;
    dspUSU: TDataSetProvider;
    cdsUSU: TClientDataSet;
    dsUSU: TDataSource;
    qryCONSULTA: TFDQuery;
    dspCONSULTA: TDataSetProvider;
    cdsCONSULTA: TClientDataSet;
    dsCONSULTA: TDataSource;
    qryCAT: TFDQuery;
    dspCAT: TDataSetProvider;
    cdsCAT: TClientDataSet;
    dsCAT: TDataSource;
    qryTRAVAR: TFDQuery;
    dspTRAVAR: TDataSetProvider;
    cdsTRAVAR: TClientDataSet;
    dsTRAVAR: TDataSource;
    qryITE: TFDQuery;
    dspITE: TDataSetProvider;
    cdsITE: TClientDataSet;
    dsITE: TDataSource;
    qryCXA: TFDQuery;
    dspCXA: TDataSetProvider;
    cdsCXA: TClientDataSet;
    dsCXA: TDataSource;
    qryPEDIDO: TFDQuery;
    dspPEDIDO: TDataSetProvider;
    cdsPEDIDO: TClientDataSet;
    dsPEDIDO: TDataSource;
    qryITEM_PEDIDO: TFDQuery;
    dspITEM_PEDIDO: TDataSetProvider;
    cdsITEM_PEDIDO: TClientDataSet;
    dsITEM_PEDIDO: TDataSource;
    qryGRID: TFDQuery;
    dspGRID: TDataSetProvider;
    cdsGRID: TClientDataSet;
    dsGRID: TDataSource;
    qryCLI: TFDQuery;
    dspCLI: TDataSetProvider;
    cdsCLI: TClientDataSet;
    dsCLI: TDataSource;
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
