unit unDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,IniFiles,
  FireDAC.Phys.IBBase;

type
  TDM = class(TDataModule)
    Banco: TFDConnection;
    Transacao: TFDTransaction;
    qryPRO: TFDQuery;
    dspPRO: TDataSetProvider;
    cdsPRO: TClientDataSet;
    dsPRO: TDataSource;
    qryCONSULTA: TFDQuery;
    dspCONSULTA: TDataSetProvider;
    cdsCONSULTA: TClientDataSet;
    dsCONSULTA: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryINQ: TFDQuery;
    dspINQ: TDataSetProvider;
    cdsINQ: TClientDataSet;
    dsINQ: TDataSource;
    qryFIA: TFDQuery;
    dspFIA: TDataSetProvider;
    cdsFIA: TClientDataSet;
    dsFIA: TDataSource;
    qryIMO: TFDQuery;
    dspIMO: TDataSetProvider;
    cdsIMO: TClientDataSet;
    dsIMO: TDataSource;
    qryLOC: TFDQuery;
    dspLOC: TDataSetProvider;
    cdsLOC: TClientDataSet;
    dsLOC: TDataSource;
    qruALU: TFDQuery;
    dspALU: TDataSetProvider;
    cdsALU: TClientDataSet;
    dsALU: TDataSource;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryGRAVAR: TFDQuery;
    dspGRAVAR: TDataSetProvider;
    cdsGRAVAR: TClientDataSet;
    dsGRAVAR: TDataSource;
  private
    { Private declarations }

  public
    function GerarAlugueis(mesinicio,anoinicio,mesfim,anofim,codloc,venc:integer):Integer;
    function AluguelGerado(Mes,ano,loc:integer):Boolean;
    function ConectarBanco:Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

function TDM.AluguelGerado(Mes, ano, loc: integer): Boolean;
begin
     cdsconsulta.Close;
     cdsconsulta.CommandText := ' select * from aluguel where codloc_alu = ' + inttostr(loc)+
                                ' and mes_alu = ' + inttostr(mes) + ' and ano_alu = ' + inttostr(ano);
     cdsconsulta.Open;
     if cdsconsulta.IsEmpty then
       Result := false
     else
        Result := True;
end;

function TDM.ConectarBanco: Boolean;
var
ArqIni : TIniFile;
begin
     ArqIni := TIniFile.Create(GetCurrentDir +  '\config.ini');

  try

    DM.Banco.Params.Database :=   ArqIni.ReadString('BANCO', 'pasta', '');

    DM.Banco.Connected := True;


  finally

    ArqIni.Free;
    Result := True;
  end;
end;

function TDM.GerarAlugueis(mesinicio, anoinicio, mesfim, anofim, codloc,
  venc: integer): Integer;
  var
   aux,mesatual,anoatual :integer;
  begin
    aux := 0;
    mesatual := mesinicio;
    anoatual := anoinicio;
    repeat
    begin

      if not AluguelGerado(mesatual,anoatual,codloc) then
      begin
      if mesatual= 2 then
       cdsCONSULTA.CommandText := ' insert into aluguel(cod_alu,codloc_alu,mes_alu,ano_alu,venc_alu,data_alu)' +
                                     ' values(0,' + inttostr(codloc) + ',' + inttostr(mesatual) + ',' +
                                      inttostr(anoatual) + ',' + '28' + ',' + quotedstr(inttostr(mesatual) + '/' + '28' + '/' + inttostr(anoatual)) + ')'
    else
          cdsCONSULTA.CommandText := ' insert into aluguel(cod_alu,codloc_alu,mes_alu,ano_alu,venc_alu,data_alu)' +
                                     ' values(0,' + inttostr(codloc) + ',' + inttostr(mesatual) + ',' +
                                      inttostr(anoatual) + ',' + inttostr(venc) + ',' + quotedstr(inttostr(mesatual) + '/' + inttostr(venc) + '/' + inttostr(anoatual)) + ')';
          cdsconsulta.Execute;
          aux := aux +1;
      end;
      if mesatual = 12 then
      begin
        mesatual:= 1;
        anoatual := anoatual + 1;
      end
      else
      begin
        mesatual := mesatual + 1;

      end;

    end;
    until  (mesatual=mesfim) and (anoatual=anofim) ;

      

      if not AluguelGerado(mesatual,anoatual,codloc) then
      begin
          cdsCONSULTA.CommandText := ' insert into aluguel(cod_alu,codloc_alu,mes_alu,ano_alu,venc_alu,data_alu)' +
                                     ' values(0,' + inttostr(codloc) + ',' + inttostr(mesatual) + ',' +
                                      inttostr(anoatual) + ',' + inttostr(venc) + ',' + quotedstr(inttostr(mesatual) + '/' + inttostr(venc) + '/' + inttostr(anoatual)) + ')';
          cdsconsulta.Execute;
          aux := aux +1;
      end;


    Result := aux;
  end;

end.
