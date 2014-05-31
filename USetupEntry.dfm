object Form4: TForm4
  Left = 546
  Top = 482
  BorderStyle = bsDialog
  Caption = 'Form4'
  ClientHeight = 176
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 42
    Height = 13
    Caption = 'User ID :'
  end
  object ComboBox1: TComboBox
    Left = 58
    Top = 7
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnSelect = ComboBox1Select
  end
  object CheckListBox1: TCheckListBox
    Left = 206
    Top = 7
    Width = 217
    Height = 162
    Flat = False
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 144
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 193
    Height = 89
    Caption = ' Option '
    TabOrder = 4
    object CheckBox2: TCheckBox
      Left = 16
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Admin Access'
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Review Only'
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Manager Access'
      TabOrder = 2
    end
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '10.234.16.3:D:\Powerpro\Data\FO-Rpt.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 232
    Top = 64
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      'SELECT userid FROM userid'
      'WHERE userid = '#39'YAYAK'#39' AND pswd = '#39#39)
    Left = 264
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 296
    Top = 64
  end
end
