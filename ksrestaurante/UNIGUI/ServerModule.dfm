object UniServerModule: TUniServerModule
  OldCreateOrder = False
  TempFolder = 'temp\'
  Title = 'New Application'
  CharSet = 'utf-8'
  SuppressErrors = []
  UnavailableErrMsg = 'Communication Error'
  LoadingMessage = 'Loading...'
  Bindings = <>
  ServerMessages.ExceptionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    
      '<p style="text-align:center;color:#A05050">An Exception has occu' +
      'red in application:</p>'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.TerminateTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionMessage = 'Invalid session or session Timeout.'
  ServerMessages.TerminateMessage = 'Web session terminated.'
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 369
  Width = 413
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Larissa\Documents\GitHub\ksrestaurante\Banco\B' +
        'ANCO.FDB'
      'DriverID=FB'
      'User_Name=SYSDBA'
      'Password=masterkey')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 152
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 136
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 136
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from itens'
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 176
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 240
    Top = 136
  end
end
