object Frame3: TFrame3
  Left = 0
  Top = 0
  Width = 701
  Height = 266
  Align = alClient
  TabOrder = 0
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 701
    Height = 266
    Align = alClient
    DataSource = DataSource1
    FixedColor = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '10.234.16.3:D:\Powerpro\Data\PowerFO.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 96
    Top = 48
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    AutoCalcFields = False
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      'SELECT DISTINCT b.fname, b.foliostatus,'
      'a.folio, b.dateci, b.dateco, a.status_appr '
      'FROM FO_MICE_NOTE0 a'
      'LEFT JOIN FOGUEST b ON b.folio = a.folio'
      
        'WHERE a.status_appr IS NOT null AND b.foliostatus IN ('#39'T'#39', '#39'C'#39', ' +
        #39'I'#39')')
    Left = 128
    Top = 48
    object IBQuery1FOLIO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
      Origin = 'FO_MICE_NOTE0.FOLIO'
      Required = True
    end
    object IBQuery1FNAME: TIBStringField
      DisplayLabel = 'MICE'#39's Name'
      FieldName = 'FNAME'
      Origin = 'FOGUEST.FNAME'
      Size = 40
    end
    object IBQuery1STATUS_APPR: TIBStringField
      DisplayLabel = 'Manager Status'
      FieldName = 'STATUS_APPR'
      Origin = 'FO_MICE_NOTE0.STATUS_APPR'
      OnGetText = IBQuery1STATUS_APPRGetText
      FixedChar = True
      Size = 1
    end
    object IBQuery1DATECI: TDateTimeField
      DisplayLabel = 'In'
      FieldName = 'DATECI'
      Origin = 'FOGUEST.DATECI'
    end
    object IBQuery1DATECO: TDateTimeField
      DisplayLabel = 'Out'
      FieldName = 'DATECO'
      Origin = 'FOGUEST.DATECO'
    end
    object IBQuery1FOLIOSTATUS: TIBStringField
      DisplayLabel = 'MICE'#39's Status'
      FieldName = 'FOLIOSTATUS'
      OnGetText = IBQuery1FOLIOSTATUSGetText
      FixedChar = True
      Size = 9
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 160
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 192
    Top = 48
  end
end
