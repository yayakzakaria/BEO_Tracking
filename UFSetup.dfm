object Frame2: TFrame2
  Left = 0
  Top = 0
  Width = 514
  Height = 241
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 297
    Height = 185
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_ID'
        Title.Alignment = taRightJustify
        Title.Caption = 'User ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTE_ID'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MANAGER_ACCESS'
        Title.Alignment = taCenter
        Title.Caption = 'Manager Access'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REVIEW_ACCESS'
        Title.Alignment = taCenter
        Title.Caption = 'Review Only'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ADMIN_ACCESS'
        Title.Alignment = taCenter
        Title.Caption = 'Admin Access'
        Width = 100
        Visible = True
      end>
  end
  object CheckListBox1: TCheckListBox
    Left = 296
    Top = -1
    Width = 217
    Height = 242
    Enabled = False
    Flat = False
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 200
    Width = 65
    Height = 25
    Caption = 'Add'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 80
    Top = 200
    Width = 65
    Height = 25
    Caption = 'Edit'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 144
    Top = 200
    Width = 65
    Height = 25
    Caption = 'Delete'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 216
    Top = 200
    Width = 65
    Height = 25
    Caption = 'Log'
    TabOrder = 5
    OnClick = BitBtn4Click
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
    Left = 32
    Top = 64
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterScroll = IBQuery1AfterScroll
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM fo_mice_cfg ORDER BY user_id')
    Left = 64
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 96
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 128
    Top = 64
  end
end
