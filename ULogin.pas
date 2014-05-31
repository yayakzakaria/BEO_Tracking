unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBDatabase, IBCustomDataSet, IBQuery,
  DBCtrls, IniFiles, jpeg;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    IBQuery1: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Image1: TImage;
    Image2: TImage;
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure LabeledEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Database, dBTemplate: String;
    procedure LoadDBConfig;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses UTracking;

{$R *.dfm}

procedure TForm3.LoadDBConfig;
var
  AppINI: TIniFile;
begin
  AppINI := TIniFile.Create('.\PowerFO.ini');
  try
    Database := AppINI.ReadString('Application', 'Database', '');
    dBTemplate := AppINI.ReadString('Application', 'dBTemplate', '');
    Form1.Database := Database;
    Form1.dBTemplate := dBTemplate;
  finally
    AppINI.Free;
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IBDatabase1.Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  Button1.Enabled := False;
  LabeledEdit1.Clear;
  LabeledEdit2.Clear;
  LabeledEdit1.SetFocus;
  IBQuery1.Close;
end;

procedure TForm3.LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['a'..'z'] then Key := UpCase(Key);
  if (ord(Key) = VK_RETURN) AND Button1.Enabled then
  begin
    Key := #0;
    Button1.Click;
  end;
end;

procedure TForm3.LabeledEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (ord(Key) = VK_RETURN) AND Button1.Enabled then
  begin
    Key := #0;
    Button1.Click;
  end;
end;

procedure TForm3.LabeledEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Button1.Enabled := (Length(LabeledEdit1.Text) > 0) AND (Length(LabeledEdit2.Text) > 0);
end;

procedure TForm3.LabeledEdit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Button1.Enabled := (Length(LabeledEdit1.Text) > 0) AND (Length(LabeledEdit2.Text) > 0);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  LoadDBConfig;
  IBDatabase1.Close;
  IBDatabase1.DatabaseName := dBTemplate;
  IBQuery1.SQL.Text := 'SELECT userid FROM userid ' +
    'WHERE userid = ''' + LabeledEdit1.Text + ''' AND pswd = ''' + LabeledEdit2.Text + ''' AND useractive = 1';
  IBDatabase1.Open;
  IBQuery1.Open;
  if IBQuery1.RecordCount = 0 then
  begin
    MessageDlg('Access denied.'#13'Please check your ID and Password !!.', mtError, [mbOK], 0);
    IBQuery1.Close;
  end
  else
  begin
    Form1.Username := IBQuery1.FieldByName('userid').AsString;
    Form1.StatusBar1.Panels[0].Text := Form1.Username;
    IBQuery1.Close;
    IBDatabase1.Close;
    IBDatabase1.DatabaseName := Database;
    IBQuery1.SQL.Text := 'SELECT note_id, review_access, admin_access, manager_access FROM fo_mice_cfg WHERE user_id = ''' + Form1.Username + '''';
    IBDatabase1.Open;
    IBQuery1.Open;
    if IBQuery1.RecordCount > 0 then
    begin
      Form1.NoteID := IBQuery1.FieldByName('note_id').AsString;
      Form1.BEOTracking1.Visible := True;
      Form1.ReviewOnly := (IBQuery1.FieldByName('review_access').AsInteger = -1);
      Form1.ManagerApproval1.Visible := (IBQuery1.FieldByName('manager_access').AsInteger = -1);
      Form1.Setup1.Visible := ((IBQuery1.FieldByName('admin_access').AsInteger = -1)or(CompareStr(Form1.Username, 'ADMIN') = 0));
      Form1.StatusBar1.Panels[1].Text := Form1.NoteID;
    end;
    IBQuery1.Close;
    if Form1.ManagerApproval1.Visible then Form1.ManagerApproval1.Click
    else if Form1.BEOTracking1.Visible then Form1.BEOTracking1.Click;
    Self.Close;
  end;
end;

end.
