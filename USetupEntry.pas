unit USetupEntry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  CheckLst, MyStrings;

type
  TForm4 = class(TForm)
    ComboBox1: TComboBox;
    CheckListBox1: TCheckListBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    StatusSQL: Boolean; // False: Add/Insert; True: Edit/Update;
    Username: String;
    Database: String;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.ComboBox1Select(Sender: TObject);
begin
  if not StatusSQL then
    Form4.Caption := 'Add New User: ' + ComboBox1.Text;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
  List: TStrings;
  i: Integer;
  NoteText: String;
begin
  if (ComboBox1.ItemIndex = -1) then
  begin
    MessageDlg('Please select "User ID" first!!.', mtError, [mbOK], 0);
    ModalResult := mrNone;
    Exit;
  end;
  List := TStringList.Create;
  for i:=0 to CheckListBox1.Items.Count-1 do
    if CheckListBox1.Checked[i] then List.Add(SplitEx(CheckListBox1.Items[i], ' - ').Strings[0]);
  NoteText := List.DelimitedText;
  List.Free;

  if StatusSQL then
  begin
    IBDatabase1.Connected := False;
    IBDatabase1.DatabaseName := Database;
    IBQuery1.SQL.Text := 'UPDATE fo_mice_cfg SET editdate = ''NOW'', edituser = ''' + Username + ''', note_id = ''' + NoteText + ''', review_access = ' + BoolToStr(CheckBox1.Checked) + ', manager_access = ' + BoolToStr(CheckBox3.Checked) + ', admin_access = ' + BoolToStr(CheckBox2.Checked) + ' WHERE user_id = ''' + ComboBox1.Text + '''';
    IBDatabase1.Connected := True;
    IBQuery1.ExecSQL;
    IBDatabase1.Connected := False;
  end
  else
  begin
    IBDatabase1.Connected := False;
    IBDatabase1.DatabaseName := Database;
    IBQuery1.SQL.Text := 'INSERT INTO fo_mice_cfg (createuser, edituser, user_id, note_id, review_access, manager_access, admin_access) VALUES (''' + Username + ''', ''' + Username + ''', ''' + ComboBox1.Text + ''', ''' + NoteText + ''', ' + BoolToStr(CheckBox1.Checked) + ', ' + BoolToStr(CheckBox3.Checked) + ', ' + BoolToStr(CheckBox2.Checked) + ')';
    IBDatabase1.Connected := True;
    IBQuery1.ExecSQL;
    IBDatabase1.Connected := False;
  end;
  ModalResult := mrOk;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IBDatabase1.Close;
end;

end.
