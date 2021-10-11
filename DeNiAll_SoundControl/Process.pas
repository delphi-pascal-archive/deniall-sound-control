unit Process;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm5 = class(TForm)
    StatusBar1: TStatusBar;
    Animate1: TAnimate;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
implementation

uses PackFile, InfoMP3, SNDControl;

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
begin
  Form1.Enabled:=False;
  Form2.Close;
  animate1.Active:=True;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled:=True;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin

Label3.Caption:=ExtractFileName(Temp);
if temp='' then
begin
  Form5.Close;
end;
end;

end.
