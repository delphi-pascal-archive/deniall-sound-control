program ExplMenu;

uses
  Forms,
  SysUtils,
  registry,
  Windows;

{WorkExplorerMenu in 'WorkExplorerMenu.pas';} {Form1}

{$R *.res}

procedure Set_extFile;
var r:Tregistry;
begin
r:=TRegistry.Create;
r.RootKey:=HKEY_CLASSES_ROOT;
r.OpenKey('*',false);
if not r.KeyExists('Shell\DeNiAll Sound Control\command') then
begin
r.CreateKey('Shell\DeNiAll Sound Control');
r.CreateKey('Shell\DeNiAll Sound Control\command');
r.OpenKey('Shell\DeNiAll Sound Control\command',false);
r.WriteString('','"'+application.ExeName+'""%1"');
end;
r.Free;
end;

var f:TextFile;
begin
Set_extFile;
Assignfile(f,ExtractFileDir(Application.ExeName)+'\Files.txt');
if not fileexists(ExtractFileDir(Application.ExeName)+'\Files.txt') then
rewrite(f);
append(f);
writeln(f,paramstr(1));
closefile(f);
application.Terminate;
end.
