program PTracking;

uses
  Forms,
  UTracking in 'UTracking.pas' {Form1},
  UNote in 'UNote.pas' {Form2},
  ULogin in 'ULogin.pas' {Form3},
  UFTracking in 'UFTracking.pas' {Frame1: TFrame},
  UFSetup in 'UFSetup.pas' {Frame2: TFrame},
  USetupEntry in 'USetupEntry.pas' {Form4},
  UAbout in 'UAbout.pas' {AboutBox},
  UFMgrApproval in 'UFMgrApproval.pas' {Frame3: TFrame},
  UMgrApproval in 'UMgrApproval.pas' {Form6},
  USetupLog in 'USetupLog.pas' {Form5},
  UGlobalDef in 'UGlobalDef.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BEO Tracking';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
