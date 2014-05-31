unit UFTracking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, IBDatabase, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, ComCtrls, ExtCtrls, DBCtrls;

type
  TFrame1 = class(TFrame)
    DBGrid1: TDBGrid;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBQuery1FNAME: TIBStringField;
    IBQuery1FOLIOSTATUS: TIBStringField;
    IBQuery1FOLIO: TIntegerField;
    IBQuery1DATECI: TDateTimeField;
    IBQuery1DATECO: TDateTimeField;
    IBQuery1STATUS_APPR: TIBStringField;
    IBQuery1DATE_APPR: TDateTimeField;
    IBQuery1LAST_EDITUSER: TIBStringField;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery1NOTE_ID: TSmallintField;
    IBQuery1NAME: TIBStringField;
    Splitter1: TSplitter;
    IBQuery1NOTE: TBlobField;
    DBRichEdit1: TDBRichEdit;
    procedure IBQuery1FOLIOSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure IBQuery1STATUS_APPRGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    tSQL, Sort: String;
    procedure CMShowingChanged(var M: TMessage); message CM_SHOWINGCHANGED;
  public
    { Public declarations }
    Username, NoteID: String;
    Database: String;
    procedure RefreshTable;
  end;

implementation

uses UGlobalDef, UNote;

{$R *.dfm}

procedure TFrame1.IBQuery1FOLIOSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if IBQuery1.RecordCount > 0 then
    Text := FolioStatusText(Sender.AsString);
end;

procedure TFrame1.IBQuery1STATUS_APPRGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if IBQuery1.RecordCount > 0 then
    Text := NoteStatusText(Sender.AsString);
end;

procedure TFrame1.RefreshTable;
var
  bookPosition: TBookMark;
begin
  bookPosition := IBQuery1.GetBookmark;
  IBQuery1.DisableControls;
  IBDatabase1.Close;
  IBQuery1.SQL.Text := tSQL + Sort;
  IBDatabase1.Open;
  IBQuery1.Open;
  IBQuery1.GotoBookmark(bookPosition);
  IBQuery1.EnableControls;
  IBQuery1.FreeBookmark(bookPosition);
end;

procedure TFrame1.DBGrid1DblClick(Sender: TObject);
var
  ShowNote: Integer;
begin
  if IBQuery1.RecordCount > 0 then
  begin
    Form2.FolioNo := IBQuery1FOLIO.AsInteger;
    Form2.NoteID := IBQuery1NOTE_ID.AsString;
    Form2.Database := Database;
    Form2.Username := Username;
    Form2.Refresh;
    Form2.Caption := 'MICE''s Note Approval - [' + IBQuery1NAME.AsString + ']';
    Form2.LabeledEdit1.Text := IBQuery1DATECI.AsString;
    Form2.LabeledEdit2.Text := IBQuery1DATECO.AsString;
    Form2.LabeledEdit3.Text := FolioStatusText(IBQuery1FOLIOSTATUS.AsString);
    Form2.LabeledEdit4.Text := IBQuery1FNAME.AsString;
    Form2.LabeledEdit5.Text := IBQuery1FOLIO.AsString;
    Form2.LabeledEdit6.Text := NoteStatusText(IBQuery1STATUS_APPR.AsString);
    Form2.RichEdit2.Text := IBQuery1NOTE.AsString;
    ShowNote := Form2.ShowModal;
    if (ShowNote = mrYes) OR (ShowNote = mrNo) then RefreshTable;
  end;
end;

//***** http://stackoverflow.com/questions/1464778/delphi-frames-vs-forms-what-for-multi-document-interface *****//
procedure TFrame1.CMShowingChanged(var M: TMessage);
begin
  inherited;
  if Showing then
  begin
    // .... put your code for onShowing is triggered
    IBDatabase1.Connected := False;
    IBDatabase1.DatabaseName := Database;
    tSQL := 'SELECT b.fname, b.foliostatus, a.folio, b.dateci, b.dateco, ' +
          'a.status_appr, a.note_id, n.note, c.name, a.date_appr, a.last_edituser ' +
          'FROM FO_MICE_NOTE0 a LEFT JOIN FOGUEST b ON b.folio = a.folio LEFT JOIN BQ_NOTE_ID c ON c.note_id = a.note_id LEFT JOIN BQ_MASTER_NOTE n ON n.folio = a.folio AND n.id = a.note_id ' +
          'WHERE a.note_id IN (' +  NoteID + ') AND a.status_appr IS NOT null AND b.foliostatus IN (''T'', ''C'', ''I'')';
    IBQuery1.SQL.Text := tSQL;
    IBDatabase1.Connected := True;
    IBQuery1.Open;
  end
  else
  begin
    // .... put your code for onHiding is triggered
    IBDatabase1.Close;
  end;
end;

procedure TFrame1.DBGrid1TitleClick(Column: TColumn);
begin
{
  with IBQuery1 do
  begin
    if (Pos(Column.Field.FieldName, Sort) <> 0) and (Pos(' DESC', Sort) = 0) then
      Sort := ' ORDER BY ' + Column.Field.FieldName + ' DESC'
    else
      Sort := ' ORDER BY ' + Column.Field.FieldName + ' ASC';

    RefreshTable;
    DBGrid1.Columns.RestoreDefaults;
    Column.Title.Font.Color := clGreen;
  end;
}
end;

procedure TFrame1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then begin
  if IBQuery1.FieldByName('Status_Appr').AsString[1] = 'O' then begin
    DBGrid1.Canvas.Font.Color := RGB(255, 85, 13);
    DBGrid1.Canvas.Brush.Color := RGB(255, 227, 215);
  end else if IBQuery1.FieldByName('Status_Appr').AsString[1] = 'A' then begin
    DBGrid1.Canvas.Font.Color := RGB(0, 94, 81);
    DBGrid1.Canvas.Brush.Color := RGB(206, 255, 255);
  end else if IBQuery1.FieldByName('Status_Appr').AsString[1] = 'R' then begin
    DBGrid1.Canvas.Font.Color := RGB(0, 0, 0);
    DBGrid1.Canvas.Brush.Color := RGB(226, 226, 226);
  end else if IBQuery1.FieldByName('Status_Appr').AsString[1] = 'C' then begin
    DBGrid1.Canvas.Font.Color := RGB(128, 0, 128);
    DBGrid1.Canvas.Brush.Color := RGB(235, 221, 238);
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
