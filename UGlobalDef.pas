unit UGlobalDef;

interface

function FolioStatusText(TxtIn: String): String;
function NoteStatusText(TxtIn: String): String;

implementation

function FolioStatusText(TxtIn: String): String;
begin
  if TxtIn[1] = 'T' then Result := 'Tentative'
  else if TxtIn[1] = 'C' then Result := 'Confirm'
  else if TxtIn[1] = 'I' then Result := 'In House'
  else Result := 'UNKNOWN';
end;

function NoteStatusText(TxtIn: String): String;
begin
    if TxtIn[1] = 'A' then Result := 'Approved'
    else if TxtIn[1] = 'R' then Result := 'Released'
    else if TxtIn[1] = 'C' then Result := 'Rejected'
    else if TxtIn[1] = 'O' then Result := 'Open'
    else Result := 'UNKNOWN';
end;

end.
