unit InfoMP3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TForm4 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses SNDControl, PackFile;

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
var i:Integer;
begin
{for i:=1 to 5 do
begin
  if TEdit(FindComponent('Edit'+IntToStr(i))).Text='' then
  begin
    MessageDLG('&Заполните все поля!',mtInformation,[mbOk],0);
    TEdit(FindComponent('Edit'+IntToStr(i))).SetFocus;
    exit;
    Break;
  end;
end
if Memo1.Text='' then
begin
  MessageDLG('&Заполните все поля!',mtInformation,[mbOk],0);
  Memo1.SetFocus;
  exit;
end; }
Form4.Close;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Memo1.Clear;
  Form4.Close;
end;
procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form2.Enabled:=true;
end;

end.
