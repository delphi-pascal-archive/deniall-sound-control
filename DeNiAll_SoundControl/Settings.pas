unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}
uses FileCtrl;
procedure TForm6.BitBtn1Click(Sender: TObject);
var Dir:String;
begin
SelectDirectory('Выберите папку в которой находяться файлы',
  'Выберите папку в которой находяться файлы',Dir);
if Dir='' then exit
else
begin
  Edit1.Text:=Dir;
  WriteComponentResFile('Settings.res',Edit1);
end;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
if not DirectoryExists('Обработанные файлы') then
CreateDir('Обработанные файлы');
if Not FileExists('Settings.res') then
  Edit1.Text:=ExtractFileDir(Application.ExeName)+'\Обработанные файлы'
else
  ReadComponentResFile('Settings.res',Edit1)
end;

end.
