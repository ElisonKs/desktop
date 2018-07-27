object DM: TDM
  OldCreateOrder = False
  Height = 495
  Width = 777
  object Banco: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Elison\Documents\GitHub\desktop\SindPet\Banco\' +
        'SINDPET.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
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
    Left = 40
    Top = 160
  end
  object dspASS: TDataSetProvider
    DataSet = qryASS
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 160
  end
  object cdsASS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from associado'
    Params = <>
    ProviderName = 'dspASS'
    Left = 160
    Top = 160
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
    Left = 208
    Top = 168
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
    Left = 256
    Top = 128
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
    Left = 360
    Top = 192
  end
  object dspUSU: TDataSetProvider
    DataSet = qryUSU
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 424
    Top = 192
  end
  object cdsUSU: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspUSU'
    Left = 480
    Top = 192
  end
  object dsUSU: TDataSource
    DataSet = cdsUSU
    Left = 528
    Top = 200
  end
end
