object frmRELALU: TfrmRELALU
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio - Im'#243'veis'
  ClientHeight = 187
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 63
    Top = 8
    Width = 13
    Height = 13
    Caption = 'De'
  end
  object Label2: TLabel
    Left = 179
    Top = 8
    Width = 17
    Height = 13
    Caption = 'At'#233
  end
  object Button1: TButton
    Left = 74
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 186
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 60
    Top = 24
    Width = 97
    Height = 21
    Date = 42669.990336944440000000
    Time = 42669.990336944440000000
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 177
    Top = 24
    Width = 97
    Height = 21
    Date = 42669.990336944440000000
    Time = 42669.990336944440000000
    TabOrder = 3
  end
  object RadioGroup1: TRadioGroup
    Left = 52
    Top = 64
    Width = 227
    Height = 49
    Caption = 'Op'#231#227'o'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Em aberto'
      'Pagos'
      'Todos')
    TabOrder = 4
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = DM.dsCONSULTA
    UserName = 'BDEPipeline1'
    Left = 328
    Top = 136
    object ppBDEPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_IMO'
      FieldName = 'COD_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPO_IMO'
      FieldName = 'TIPO_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOBILIADO_IMO'
      FieldName = 'MOBILIADO_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = 'DESC_IMO'
      FieldName = 'DESC_IMO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 3
    end
    object ppBDEPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSC_IMO'
      FieldName = 'INSC_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppBDEPipeline1ppField6: TppField
      FieldAlias = 'MATCOMPESA_IMO'
      FieldName = 'MATCOMPESA_IMO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppBDEPipeline1ppField7: TppField
      FieldAlias = 'MATCELPE_IMO'
      FieldName = 'MATCELPE_IMO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppBDEPipeline1ppField8: TppField
      FieldAlias = 'CONDOMINIO_IMO'
      FieldName = 'CONDOMINIO_IMO'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 10
      Position = 7
    end
    object ppBDEPipeline1ppField9: TppField
      FieldAlias = 'END_IMO'
      FieldName = 'END_IMO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object ppBDEPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPRO_IMO'
      FieldName = 'CODPRO_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 312
    Top = 80
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Caption = 'KS IMOBILIARIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 3440
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 178330
        mmTop = 10054
        mmWidth = 16933
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
        Caption = 'Alugu'#233'is'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 12171
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label3'
        Caption = 'LOCAT'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 2906
        mmTop = 21431
        mmWidth = 19314
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label4'
        Caption = 'PROPRIET'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 46032
        mmTop = 21431
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Weight = 1.000000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 25928
        mmWidth = 201084
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label5'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 164307
        mmTop = 21433
        mmWidth = 11641
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label6'
        Caption = 'VCTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 96044
        mmTop = 21431
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label7'
        Caption = 'PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 114565
        mmTop = 21431
        mmWidth = 21960
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label8'
        Caption = 'REPASSE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 139965
        mmTop = 21431
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground1
      end
      object lblMes: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblMes'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 108215
        mmTop = 12171
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground1
      end
      object lblAno: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblAno'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 130993
        mmTop = 12171
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblMes1'
        AutoSize = False
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 127026
        mmTop = 12168
        mmWidth = 2646
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label10'
        Caption = 'VALOR PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 179383
        mmTop = 21433
        mmWidth = 22754
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        DataField = 'LOCATARIO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4498
        mmLeft = 3169
        mmTop = 265
        mmWidth = 36513
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        DataField = 'PROPRIETARIO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4498
        mmLeft = 47092
        mmTop = 265
        mmWidth = 41804
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText3'
        DataField = 'VALOR'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '$###,##0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4498
        mmLeft = 164307
        mmTop = 265
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText4'
        DataField = 'VCTO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4498
        mmLeft = 95249
        mmTop = 530
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 5273
        mmWidth = 201084
        BandType = 4
        LayerName = Foreground1
      end
      object lblDataPagamento: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label9'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 116101
        mmTop = 791
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground1
      end
      object lblDataRepasse: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblDataRepasse'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 139925
        mmTop = 794
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        DataField = 'VALORPAGO'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '$###,##0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4498
        mmLeft = 183621
        mmTop = 265
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 44450
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 92412
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 113801
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 136558
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 160637
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 181269
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 200582
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5555
        mmLeft = 457
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand1: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 265
        mmWidth = 201084
        BandType = 8
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label11'
        Caption = 'Op'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 19844
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground1
      end
      object lblOpcao: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblOpcao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 146579
        mmTop = 19844
        mmWidth = 794
        BandType = 8
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label12'
        Caption = 'Total Estimado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 8467
        mmWidth = 25929
        BandType = 8
        LayerName = Foreground1
      end
      object lblRecebido: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblRecebido'
        Caption = 'Total Recebido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 78056
        mmTop = 8467
        mmWidth = 23813
        BandType = 8
        LayerName = Foreground1
      end
      object lblEstimado: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblEstimado'
        Caption = 'lblEstimado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 32281
        mmTop = 8451
        mmWidth = 17992
        BandType = 8
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblRecebido1'
        Caption = 'Total Recebido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 8467
        mmWidth = 26458
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
