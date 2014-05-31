unit UMgrApproval;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBDatabase,
  IBCustomDataSet, IBQuery, DBCtrls, Grids, DBGrids;

type
  TForm6 = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DBRichEdit1: TDBRichEdit;
    DBRichEdit2: TDBRichEdit;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    ScrollBox1: TScrollBox;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    panelsArray: array of TPanel;
    richeditArray: array of TRichEdit;
    procedure FreeComponent(panels: array of TPanel; richedit: array of TRichEdit);
    procedure PanelEntered(Sender: TObject);
    procedure RichEditEntered(Sender: TObject);
    procedure Refresh(NoteID: Integer);
    procedure IBQSTATUS_APPRGetText(Sender: TField; var Text: String; DisplayText: Boolean);
  public
    { Public declarations }
    Username: String;
    Database: String;
    procedure DisplayNote(FolioNo: Integer; StatusAppr: String);
  end;

var
  Form6: TForm6;

implementation

uses UGlobalDef, Math;

{$R *.dfm}

procedure TForm6.IBQSTATUS_APPRGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := NoteStatusText(Sender.AsString);
end;

procedure TForm6.Refresh(NoteID: Integer);
begin
  IBQuery1.DisableControls;
  IBDatabase1.Close;
  IBDatabase1.DatabaseName := Database;
  IBQuery1.SQL.Text := 'SELECT * FROM FO_MICE_NOTE WHERE folio = ' + LabeledEdit5.Text + ' AND note_id = ' + IntToStr(NoteID) + ' ORDER BY last_editdate';
  IBDatabase1.Open;
  IBQuery1.Open;
  IBQuery1.Last;
  DBGrid1.DataSource := DataSource1;
  DBRichEdit1.DataSource := DataSource1;
  DBRichEdit1.DataField := 'NOTE';
  DBRichEdit2.DataSource := DataSource1;
  DBRichEdit2.DataField := 'STATUS_REASON';
  IBQuery1.FieldByName('STATUS_APPR').OnGetText := IBQSTATUS_APPRGetText;
  DBGrid1.Columns[0].Width := 73;
  DBGrid1.Columns[1].Width := 112;
  DBGrid1.Columns[2].Width := 112;
  DBGrid1.Columns[3].Width := 60;
  IBQuery1.EnableControls;
end;

procedure TForm6.DisplayNote(FolioNo: Integer; StatusAppr: String);
var
  i, Jml: Integer;
begin
  IBDatabase1.Close;
  IBDatabase1.DatabaseName := Database;
  IBQuery1.SQL.Text := 'SELECT b.folio, b.note, a.note_id, c.name, a.status_appr, a.date_appr, a.last_editdate, a.last_edituser FROM BQ_MASTER_NOTE b ' +
            'LEFT JOIN FO_MICE_NOTE0 a ON b.folio = a.folio AND b.id = a.note_id LEFT JOIN BQ_NOTE_ID c ON c.note_id = a.note_id ' +
            'WHERE b.folio = ' + IntToStr(FolioNo) + ' AND b.edituser IS NOT NULL AND a.status_appr = ''' + StatusAppr + ''' ORDER BY b.id';
  IBDatabase1.Open;
  IBQuery1.Open;
  IBQuery1.Last;

  i := IBQuery1.RecordCount - 1;
  Jml := i + 1;
  FreeComponent(panelsArray, richeditArray);
  SetLength(panelsArray, Jml);
  SetLength(richeditArray, Jml);
  while not IBQuery1.Bof do
  begin
    panelsArray[i] := TPanel.Create(nil);
    richeditArray[i] := TRichEdit.Create(nil);

    panelsArray[i].Top := i * (25 + 200);
    panelsArray[i].Left := 0;
    panelsArray[i].Width := IfThen(Jml > 1, 364, 381);
    panelsArray[i].Height := 25;
    panelsArray[i].BevelOuter := bvNone;
    panelsArray[i].Color := clMoneyGreen;
    panelsArray[i].Alignment := taLeftJustify;
    panelsArray[i].Font.Size := 16;
    panelsArray[i].Font.Style := [fsBold];
    panelsArray[i].Tag := i;
    panelsArray[i].Caption := IBQuery1.FieldByName('name').AsString;
    panelsArray[i].OnEnter := PanelEntered;
    panelsArray[i].Parent := ScrollBox1;

    richeditArray[i].Top := panelsArray[i].Top + panelsArray[i].Height;
    richeditArray[i].Left := 0;
    richeditArray[i].Width := IfThen(Jml > 1, 364, 381);
    richeditArray[i].Height := 200;
    richeditArray[i].ReadOnly := True;
    richeditArray[i].BorderStyle := bsNone;
    richeditArray[i].ScrollBars := ssBoth;
    richeditArray[i].Tag := IBQuery1.FieldByName('note_id').AsInteger;
    richeditArray[i].Hint := IBQuery1.FieldByName('name').AsString;
    richeditArray[i].OnEnter := RichEditEntered;
    richeditArray[i].Parent := ScrollBox1;
    richeditArray[i].Color := clSkyBlue;
    richeditArray[i].SelText := IBQuery1.FieldByName('note').AsString;

    i := i - 1;
    IBQuery1.Prior;
  end;
  Refresh(richeditArray[0].Tag);
  Label5.Caption := richeditArray[0].Hint;
end;

procedure TForm6.FreeComponent(panels: array of TPanel; richedit: array of TRichEdit);
var
  i: Integer;
begin
    for i := Low(richedit) to High(richedit) do
    begin
      panels[i].Free;
      panels[i] := nil;
      richedit[i].Free;
      richedit[i] := nil;
    end;
end;

procedure TForm6.RichEditEntered(Sender: TObject);
begin
  if Sender is TRichEdit then
  begin
    Refresh(TRichEdit(Sender).Tag);
    Label5.Caption := TRichEdit(Sender).Hint;
  end;
end;

procedure TForm6.PanelEntered(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    Refresh(richeditArray[TPanel(Sender).Tag].Tag);
    Label5.Caption := richeditArray[TPanel(Sender).Tag].Hint;
  end;
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
var
  i: Integer;
begin
  //if CompareText(LabeledEdit6.Text, 'Open') <> 0 then Exit;
  IBDatabase1.Close;
  IBDatabase1.DatabaseName := Database;
  for i := Low(richeditArray) to High(richeditArray) do
  begin
    IBQuery1.SQL.Text := 'INSERT INTO fo_mice_note (folio, note_id, note, status_appr, status_reason, date_appr, last_editdate, last_edituser) ' +
            'SELECT folio, note_id, note, ''A'', ''' + StringReplace(RichEdit1.Text, '''', '''''', [rfReplaceAll]) + ''', ''Now'', ''Now'', ''' + Username + ''' FROM fo_mice_note ' +
            'WHERE folio = ' + LabeledEdit5.Text + ' AND note_id = ' + IntToStr(richeditArray[i].Tag) + ' AND last_editdate = (SELECT max(last_editdate) FROM fo_mice_note WHERE folio = ' + LabeledEdit5.Text + ' AND note_id = ' + IntToStr(richeditArray[i].Tag) + ')';
    IBDatabase1.Open;
    IBQuery1.ExecSQL;
    IBDatabase1.Close;
  end;
  ModalResult := mrYes;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  RichEdit1.Clear;
  BitBtn1.Enabled := (CompareStr(LabeledEdit6.Text, 'Open') = 0);
  RichEdit1.ReadOnly := (CompareStr(LabeledEdit6.Text, 'Open') <> 0);
  ScrollBox1.Height := IfThen(BitBtn1.Enabled, 297, 369);
  if RichEdit1.ReadOnly then RichEdit1.Color := clSkyBlue
  else RichEdit1.Color := clWindow;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(IBQuery1.FindField('STATUS_APPR')) then
    IBQuery1.FieldByName('STATUS_APPR').OnGetText := nil;
  IBDatabase1.Close;
  FreeComponent(panelsArray, richeditArray);
  SetLength(panelsArray, 0);
  SetLength(richeditArray, 0);
  DBGrid1.DataSource := nil;
  DBRichEdit1.DataSource := nil;
  DBRichEdit2.DataSource := nil;
end;

end.
