program DeNiAllSoundControl;

uses
  Forms,
  SNDControl in 'SNDControl.pas' {Form1},
  PackFile in 'PackFile.pas' {Form2},
  SearchForm in 'SearchForm.pas' {Form3},
  InfoMP3 in 'InfoMP3.pas' {Form4},
  Process in 'Process.pas' {Form5},
  Settings in 'Settings.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DeNiAll SoundControl';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  //Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
