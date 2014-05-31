object Form2: TForm2
  Left = 383
  Top = 248
  BorderStyle = bsDialog
  Caption = 'MICE'#39's Note Approval'
  ClientHeight = 546
  ClientWidth = 834
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 96
    Width = 401
    Height = 441
    Caption = ' Current MICE'#39's Note '
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 249
      Height = 13
      Caption = 'Please Release (or Reject) for a MICE'#39's Note below :'
    end
    object Label4: TLabel
      Left = 8
      Top = 368
      Width = 313
      Height = 13
      Caption = 'Fill in the Remark below for additional info (if needed) :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 312
      Width = 185
      Height = 49
      Caption = 'Release'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 208
      Top = 312
      Width = 185
      Height = 49
      Caption = 'Reject'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object RichEdit1: TRichEdit
      Left = 8
      Top = 384
      Width = 385
      Height = 49
      TabOrder = 2
    end
    object RichEdit2: TRichEdit
      Left = 8
      Top = 56
      Width = 385
      Height = 249
      Color = clSkyBlue
      Lines.Strings = (
        
          '(.. .. Still loading.. please close and re-open this window agai' +
          'n..)')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
    end
    object LabeledEdit6: TLabeledEdit
      Left = 248
      Top = 16
      Width = 145
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 70
      EditLabel.Height = 13
      EditLabel.Caption = 'Current Status '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 416
    Top = 8
    Width = 409
    Height = 529
    Caption = ' See Note Tracking '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 184
      Width = 65
      Height = 13
      Caption = 'MICE'#39's Note :'
    end
    object Label2: TLabel
      Left = 8
      Top = 456
      Width = 43
      Height = 13
      Caption = 'Remark :'
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 393
      Height = 153
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'STATUS_APPR'
          Title.Alignment = taCenter
          Title.Caption = 'Note Status'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_APPR'
          Title.Alignment = taCenter
          Title.Caption = 'Approval Date'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LAST_EDITDATE'
          Title.Caption = 'Edit Date'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LAST_EDITUSER'
          Title.Caption = 'Edit By'
          Width = 60
          Visible = True
        end>
    end
    object DBRichEdit1: TDBRichEdit
      Left = 8
      Top = 200
      Width = 393
      Height = 249
      Color = clSkyBlue
      DataField = 'NOTE'
      DataSource = DataSource1
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object DBRichEdit2: TDBRichEdit
      Left = 8
      Top = 472
      Width = 393
      Height = 49
      Color = clSkyBlue
      DataField = 'STATUS_REASON'
      DataSource = DataSource1
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  object LabeledEdit1: TLabeledEdit
    Left = 61
    Top = 16
    Width = 121
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Arrival '
    EditLabel.Color = clSkyBlue
    EditLabel.ParentColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object LabeledEdit2: TLabeledEdit
    Left = 61
    Top = 40
    Width = 121
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Departure '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object LabeledEdit3: TLabeledEdit
    Left = 264
    Top = 40
    Width = 145
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'MICE'#39's Status '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object LabeledEdit4: TLabeledEdit
    Left = 42
    Top = 64
    Width = 367
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = 'Name '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object LabeledEdit5: TLabeledEdit
    Left = 264
    Top = 16
    Width = 145
    Height = 21
    Color = clBtnFace
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Folio '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
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
      
        'SELECT folio, note_id, note, status_reason, date_appr, last_edit' +
        'date, last_edituser,'
      
        'CASE WHEN status_appr = '#39'O'#39' THEN '#39'Open'#39' WHEN status_appr = '#39'A'#39' T' +
        'HEN '#39'Approved'#39' WHEN status_appr = '#39'R'#39' THEN '#39'Rejected'#39' END status' +
        '_appr'
      'FROM FO_MICE_NOTE'
      'WHERE folio = 29435 AND note_id = 4'
      'ORDER BY last_editdate')
    Left = 552
    Top = 136
    object IBQuery1FOLIO: TIntegerField
      FieldName = 'FOLIO'
      Origin = 'FO_MICE_NOTE.FOLIO'
      Required = True
    end
    object IBQuery1NOTE_ID: TSmallintField
      FieldName = 'NOTE_ID'
      Origin = 'FO_MICE_NOTE.NOTE_ID'
      Required = True
    end
    object IBQuery1NOTE: TBlobField
      FieldName = 'NOTE'
      Origin = 'FO_MICE_NOTE.NOTE'
      Size = 8
    end
    object IBQuery1STATUS_REASON: TBlobField
      FieldName = 'STATUS_REASON'
      Origin = 'FO_MICE_NOTE.STATUS_REASON'
      Size = 8
    end
    object IBQuery1DATE_APPR: TDateTimeField
      FieldName = 'DATE_APPR'
      Origin = 'FO_MICE_NOTE.DATE_APPR'
    end
    object IBQuery1LAST_EDITDATE: TDateTimeField
      FieldName = 'LAST_EDITDATE'
      Origin = 'FO_MICE_NOTE.LAST_EDITDATE'
    end
    object IBQuery1LAST_EDITUSER: TIBStringField
      FieldName = 'LAST_EDITUSER'
      Origin = 'FO_MICE_NOTE.LAST_EDITUSER'
      Size = 8
    end
    object IBQuery1STATUS_APPR: TIBStringField
      FieldName = 'STATUS_APPR'
      OnGetText = IBQuery1STATUS_APPRGetText
      FixedChar = True
      Size = 8
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 584
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 616
    Top = 136
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
    Left = 520
    Top = 136
  end
end
