object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 1083
  Height = 533
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 0
    Top = 369
    Width = 1083
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1083
    Height = 369
    Align = alTop
    DataSource = DataSource1
    FixedColor = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
  end
  object DBRichEdit1: TDBRichEdit
    Left = 0
    Top = 372
    Width = 1083
    Height = 161
    Align = alClient
    DataField = 'NOTE'
    DataSource = DataSource1
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
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
    Left = 48
    Top = 56
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
      
        'SELECT b.fname, CASE WHEN b.foliostatus = '#39'T'#39' THEN '#39'Tentative'#39' W' +
        'HEN b.foliostatus = '#39'C'#39' THEN '#39'Confirm'#39' END foliostatus,'
      'a.folio, b.dateci, b.dateco,'
      
        'CASE WHEN a.status_appr = '#39'O'#39' THEN '#39'Open'#39' WHEN a.status_appr = '#39 +
        'A'#39' THEN '#39'Approved'#39' WHEN a.status_appr = '#39'R'#39' THEN '#39'Rejected'#39' END ' +
        'status_appr, a.note_id, n.note,'
      'c.name, a.date_appr, a.last_edituser FROM FO_MICE_NOTE0 a'
      'LEFT JOIN FOGUEST b ON b.folio = a.folio'
      'LEFT JOIN BQ_NOTE_ID c ON c.note_id = a.note_id'
      
        'LEFT JOIN BQ_MASTER_NOTE n ON n.folio = a.folio AND n.id = a.not' +
        'e_id'
      
        'WHERE a.note_id IN (2,4,11) AND a.status_appr IS NOT null AND b.' +
        'foliostatus IN ('#39'T'#39', '#39'C'#39')')
    Left = 80
    Top = 56
    object IBQuery1FOLIO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Folio'
      DisplayWidth = 10
      FieldName = 'FOLIO'
      Origin = 'FO_MICE_NOTE0.FOLIO'
      Required = True
    end
    object IBQuery1FNAME: TIBStringField
      DisplayLabel = 'MICE'#39's Name'
      DisplayWidth = 40
      FieldName = 'FNAME'
      Origin = 'FOGUEST.FNAME'
      Size = 40
    end
    object IBQuery1NAME: TIBStringField
      DisplayLabel = 'Note Name'
      DisplayWidth = 18
      FieldName = 'NAME'
      Origin = 'BQ_NOTE_ID.NAME'
      Size = 40
    end
    object IBQuery1STATUS_APPR: TIBStringField
      DisplayLabel = 'Note Status'
      DisplayWidth = 17
      FieldName = 'STATUS_APPR'
      OnGetText = IBQuery1STATUS_APPRGetText
      FixedChar = True
      Size = 8
    end
    object IBQuery1DATE_APPR: TDateTimeField
      DisplayLabel = 'Approval Date'
      DisplayWidth = 18
      FieldName = 'DATE_APPR'
      Origin = 'FO_MICE_NOTE0.DATE_APPR'
    end
    object IBQuery1LAST_EDITUSER: TIBStringField
      DisplayLabel = 'Update By'
      DisplayWidth = 12
      FieldName = 'LAST_EDITUSER'
      Origin = 'FO_MICE_NOTE0.LAST_EDITUSER'
      Size = 8
    end
    object IBQuery1FOLIOSTATUS: TIBStringField
      DisplayLabel = 'MICE'#39's Status'
      DisplayWidth = 16
      FieldName = 'FOLIOSTATUS'
      OnGetText = IBQuery1FOLIOSTATUSGetText
      FixedChar = True
      Size = 9
    end
    object IBQuery1DATECI: TDateTimeField
      DisplayLabel = 'In'
      DisplayWidth = 13
      FieldName = 'DATECI'
      Origin = 'FOGUEST.DATECI'
    end
    object IBQuery1DATECO: TDateTimeField
      DisplayLabel = 'Out'
      DisplayWidth = 13
      FieldName = 'DATECO'
      Origin = 'FOGUEST.DATECO'
    end
    object IBQuery1NOTE_ID: TSmallintField
      FieldName = 'NOTE_ID'
      Origin = 'FO_MICE_NOTE0.NOTE_ID'
      Required = True
      Visible = False
    end
    object IBQuery1NOTE: TBlobField
      FieldName = 'NOTE'
      Origin = 'BQ_MASTER_NOTE.NOTE'
      Size = 8
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 112
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 144
    Top = 56
  end
end
