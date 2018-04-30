object DM: TDM
  OldCreateOrder = False
  Height = 532
  Width = 679
  object Banco: TFDConnection
    Params.Strings = (
      'Database=C:\KSLavajato\Banco\LAVAJATO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = Transacao
    Left = 48
    Top = 40
  end
  object Transacao: TFDTransaction
    Connection = Banco
    Left = 128
    Top = 40
  end
  object qryCONSULTA: TFDQuery
    Connection = Banco
    SQL.Strings = (
      'select * from movimento')
    Left = 296
    Top = 40
  end
  object dspCONSULTA: TDataSetProvider
    DataSet = qryCONSULTA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 360
    Top = 40
  end
  object cdsCONSULTA: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from movimento'
    Params = <>
    ProviderName = 'dspCONSULTA'
    Left = 416
    Top = 40
  end
  object dsCONSULTA: TDataSource
    DataSet = cdsCONSULTA
    Left = 472
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 592
    Top = 48
  end
  object qryCLI: TFDQuery
    Connection = Banco
    SQL.Strings = (
      'select * from cliente')
    Left = 56
    Top = 172
  end
  object dspCLI: TDataSetProvider
    DataSet = qryCLI
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 172
  end
  object cdsCLI: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    CommandText = 'select * from cliente'
    Params = <>
    ProviderName = 'dspCLI'
    Left = 176
    Top = 172
    object cdsCLICOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCLINOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Size = 50
    end
    object cdsCLICPFCNPJ_CLI: TStringField
      FieldName = 'CPFCNPJ_CLI'
      Origin = 'CPFCNPJ_CLI'
    end
    object cdsCLIIDEND_CLI: TIntegerField
      FieldName = 'IDEND_CLI'
      Origin = 'IDEND_CLI'
    end
    object cdsCLIIDENTIDADE_CLI: TIntegerField
      FieldName = 'IDENTIDADE_CLI'
      Origin = 'IDENTIDADE_CLI'
    end
    object cdsCLINUM_END: TStringField
      FieldName = 'NUM_END'
      Origin = 'NUM_END'
      Size = 10
    end
    object cdsCLICOMP_END: TStringField
      FieldName = 'COMP_END'
      Origin = 'COMP_END'
      Size = 30
    end
    object cdsCLITEL_CLI: TStringField
      FieldName = 'TEL_CLI'
      Origin = 'TEL_CLI'
    end
    object cdsCLICEL_CLI: TStringField
      FieldName = 'CEL_CLI'
      Origin = 'CEL_CLI'
    end
  end
  object dsCLI: TDataSource
    DataSet = cdsCLI
    Left = 232
    Top = 172
  end
  object qrySER: TFDQuery
    Connection = Banco
    SQL.Strings = (
      'select * from servico')
    Left = 56
    Top = 220
  end
  object dspSER: TDataSetProvider
    DataSet = qrySER
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 220
  end
  object cdsSER: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from servico'
    Params = <>
    ProviderName = 'dspSER'
    Left = 176
    Top = 220
  end
  object dsSER: TDataSource
    DataSet = cdsSER
    Left = 232
    Top = 220
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 400
    Top = 396
  end
  object qryGRAVAR: TFDQuery
    Connection = Banco
    SQL.Strings = (
      'select * from imovel')
    Left = 296
    Top = 96
  end
  object dspGRAVAR: TDataSetProvider
    DataSet = qryGRAVAR
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 360
    Top = 96
  end
  object cdsGRAVAR: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from imovel'
    Params = <>
    ProviderName = 'dspGRAVAR'
    Left = 416
    Top = 96
  end
  object dsGRAVAR: TDataSource
    DataSet = cdsGRAVAR
    Left = 472
    Top = 96
  end
  object qryAUT: TFDQuery
    Connection = Banco
    SQL.Strings = (
      'select * from automovel')
    Left = 56
    Top = 276
  end
  object dspAUT: TDataSetProvider
    DataSet = qryAUT
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 276
  end
  object cdsAUT: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from automovel'
    Params = <>
    ProviderName = 'dspAUT'
    Left = 176
    Top = 276
  end
  object dsAUT: TDataSource
    DataSet = cdsAUT
    Left = 232
    Top = 276
  end
  object qryMOVIMENTO: TFDQuery
    Connection = Banco
    SQL.Strings = (
      'select * from movimento')
    Left = 48
    Top = 340
  end
  object dspMOVIMENTO: TDataSetProvider
    DataSet = qryMOVIMENTO
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 340
  end
  object cdsMOVIMENTO: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from movimento'
    Params = <>
    ProviderName = 'dspMOVIMENTO'
    Left = 168
    Top = 340
  end
  object dsMOVIMENTO: TDataSource
    DataSet = cdsMOVIMENTO
    Left = 224
    Top = 340
  end
end
