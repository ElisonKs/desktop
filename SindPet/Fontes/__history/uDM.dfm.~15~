object DM: TDM
  OldCreateOrder = False
  Height = 495
  Width = 777
  object Banco: TFDConnection
    Params.Strings = (
      'Database=C:\STTAR\Banco\SINDPET.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = Transacao
    Left = 40
    Top = 40
  end
  object Transacao: TFDTransaction
    Connection = Banco
    Left = 104
    Top = 40
  end
  object qryASS: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from associado')
    Left = 32
    Top = 232
  end
  object dspASS: TDataSetProvider
    DataSet = qryASS
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 232
  end
  object cdsASS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from associado'
    Params = <>
    ProviderName = 'dspASS'
    Left = 152
    Top = 232
    object cdsASSID_ASS: TIntegerField
      FieldName = 'ID_ASS'
      Required = True
    end
    object cdsASSCPF_ASS: TStringField
      FieldName = 'CPF_ASS'
      Size = 15
    end
    object cdsASSNOME_ASS: TStringField
      FieldName = 'NOME_ASS'
      Size = 100
    end
    object cdsASSENDERECO_ASS: TStringField
      FieldName = 'ENDERECO_ASS'
      Size = 500
    end
    object cdsASSTELEFONE_ASS: TStringField
      FieldName = 'TELEFONE_ASS'
    end
    object cdsASSCEL_ASS: TStringField
      FieldName = 'CEL_ASS'
    end
  end
  object dsASS: TDataSource
    DataSet = cdsASS
    Left = 200
    Top = 240
  end
  object qryCONSULTA: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from usuario')
    Left = 272
    Top = 32
  end
  object dspCONSULTA: TDataSetProvider
    DataSet = qryCONSULTA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 344
    Top = 32
  end
  object cdsCONSULTA: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspCONSULTA'
    Left = 416
    Top = 32
  end
  object dsCONSULTA: TDataSource
    DataSet = cdsCONSULTA
    Left = 488
    Top = 32
  end
  object qryTRAVAR: TFDQuery
    Connection = Banco
    Transaction = Transacao
    Left = 272
    Top = 80
  end
  object dspTRAVAR: TDataSetProvider
    DataSet = qryTRAVAR
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 344
    Top = 80
  end
  object cdsTRAVAR: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspTRAVAR'
    Left = 416
    Top = 80
  end
  object dsTRAVAR: TDataSource
    DataSet = cdsTRAVAR
    Left = 488
    Top = 80
  end
  object qryGRID: TFDQuery
    Connection = Banco
    Transaction = Transacao
    Left = 272
    Top = 136
  end
  object dspGRID: TDataSetProvider
    DataSet = qryGRID
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 328
    Top = 128
  end
  object cdsGRID: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspGRID'
    Left = 400
    Top = 128
  end
  object dsGRID: TDataSource
    DataSet = cdsGRID
    Left = 472
    Top = 128
  end
  object qryUSU: TFDQuery
    Connection = Banco
    Transaction = Transacao
    Left = 384
    Top = 256
  end
  object dspUSU: TDataSetProvider
    DataSet = qryUSU
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 448
    Top = 256
  end
  object cdsUSU: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspUSU'
    Left = 504
    Top = 256
  end
  object dsUSU: TDataSource
    DataSet = cdsUSU
    Left = 552
    Top = 264
  end
  object qryMED: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from medico')
    Left = 32
    Top = 288
  end
  object dspMED: TDataSetProvider
    DataSet = qryMED
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 288
  end
  object cdsMED: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from medico'
    Params = <>
    ProviderName = 'dspMED'
    Left = 152
    Top = 288
  end
  object dsMED: TDataSource
    DataSet = cdsMED
    Left = 200
    Top = 296
  end
  object qryCON: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from medico')
    Left = 40
    Top = 344
  end
  object dspCON: TDataSetProvider
    DataSet = qryCON
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 344
  end
  object cdsCON: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from consulta'
    Params = <>
    ProviderName = 'dspCON'
    Left = 160
    Top = 344
  end
  object dsCON: TDataSource
    DataSet = cdsCON
    Left = 208
    Top = 352
  end
  object qryRELATORIO: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from usuario')
    Left = 272
    Top = 192
  end
  object dspRELATORIO: TDataSetProvider
    DataSet = qryRELATORIO
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 328
    Top = 184
  end
  object cdsRELATORIO: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspRELATORIO'
    Left = 400
    Top = 184
  end
  object dsRELATORIO: TDataSource
    DataSet = cdsRELATORIO
    Left = 472
    Top = 184
  end
end
