object frmLOC: TfrmLOC
  Left = 0
  Top = 0
  Caption = 'Loca'#231#227'o'
  ClientHeight = 323
  ClientWidth = 449
  Color = clGradientInactiveCaption
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
    Left = 20
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 21
    Top = 58
    Width = 32
    Height = 13
    Caption = 'Im'#243'vel'
  end
  object Label3: TLabel
    Left = 21
    Top = 104
    Width = 40
    Height = 13
    Caption = 'Inquilino'
  end
  object Label4: TLabel
    Left = 200
    Top = 200
    Width = 27
    Height = 13
    Caption = 'Prazo'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 23
    Top = 241
    Width = 47
    Height = 13
    Caption = 'M'#234's In'#237'cio'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 119
    Top = 240
    Width = 47
    Height = 13
    Caption = 'Ano In'#237'cio'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 104
    Top = 200
    Width = 24
    Height = 13
    Caption = 'Valor'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 21
    Top = 200
    Width = 55
    Height = 13
    Caption = 'Vencimento'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 21
    Top = 147
    Width = 30
    Height = 13
    Caption = 'Fiador'
  end
  object Label10: TLabel
    Left = 222
    Top = 241
    Width = 60
    Height = 13
    Caption = 'M'#234's T'#233'rmino'
    FocusControl = DBEdit1
  end
  object Label11: TLabel
    Left = 318
    Top = 240
    Width = 60
    Height = 13
    Caption = 'Ano T'#233'rmino'
    FocusControl = DBEdit2
  end
  object DBEdit4: TDBEdit
    Left = 200
    Top = 213
    Width = 57
    Height = 21
    DataField = 'PRAZO_LOC'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 20
    Top = 256
    Width = 77
    Height = 21
    DataField = 'MESINICIO_LOC'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit6: TDBEdit
    Left = 119
    Top = 256
    Width = 81
    Height = 21
    DataField = 'ANOINICIO_LOC'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit7: TDBEdit
    Left = 100
    Top = 213
    Width = 69
    Height = 21
    DataField = 'VALOR_LOC'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit8: TDBEdit
    Left = 21
    Top = 214
    Width = 60
    Height = 21
    DataField = 'VENC_LOC'
    DataSource = DataSource1
    TabOrder = 4
  end
  object Button1: TButton
    Left = 84
    Top = 29
    Width = 42
    Height = 25
    Caption = '?'
    TabOrder = 13
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 83
    Top = 73
    Width = 42
    Height = 25
    Caption = '?'
    TabOrder = 14
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 84
    Top = 117
    Width = 42
    Height = 25
    Caption = '?'
    TabOrder = 15
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 84
    Top = 159
    Width = 42
    Height = 25
    Caption = '?'
    TabOrder = 16
    OnClick = Button4Click
  end
  object edDESC_IMO: TEdit
    Left = 131
    Top = 75
    Width = 309
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 17
  end
  object edNOME_INQ: TEdit
    Left = 132
    Top = 119
    Width = 309
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 18
  end
  object edNOME_FIA: TEdit
    Left = 132
    Top = 161
    Width = 309
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 19
  end
  object btSalvar: TButton
    Left = 44
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 9
    OnClick = btSalvarClick
  end
  object btCancelar: TButton
    Left = 125
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 10
    OnClick = btCancelarClick
  end
  object btExcluir: TButton
    Left = 206
    Top = 290
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 12
    OnClick = btExcluirClick
  end
  object btSair: TButton
    Left = 287
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 11
    OnClick = btSairClick
  end
  object edCODIMO_LOC: TEdit
    Left = 19
    Top = 76
    Width = 61
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnExit = edCODIMO_LOCExit
  end
  object edCODINQ_LOC: TEdit
    Left = 19
    Top = 120
    Width = 62
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    OnExit = edCODINQ_LOCExit
  end
  object edCODFIA_LOC: TEdit
    Left = 19
    Top = 160
    Width = 62
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    OnExit = edCODFIA_LOCExit
  end
  object edCOD_LOC: TEdit
    Left = 24
    Top = 31
    Width = 54
    Height = 21
    BiDiMode = bdLeftToRight
    NumbersOnly = True
    ParentBiDiMode = False
    TabOrder = 0
    OnEnter = edCOD_LOCEnter
    OnExit = edCOD_LOCExit
  end
  object DBEdit1: TDBEdit
    Left = 219
    Top = 256
    Width = 77
    Height = 21
    DataField = 'MESFIM_LOC'
    DataSource = DataSource1
    TabOrder = 20
  end
  object DBEdit2: TDBEdit
    Left = 318
    Top = 256
    Width = 81
    Height = 21
    DataField = 'ANOFIM_LOC'
    DataSource = DataSource1
    TabOrder = 21
  end
  object Button5: TButton
    Left = 336
    Top = 188
    Width = 83
    Height = 46
    Caption = 'Gerar Alugu'#233'is'
    Enabled = False
    TabOrder = 22
    OnClick = Button5Click
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsLOC
    Left = 320
    Top = 160
  end
end
