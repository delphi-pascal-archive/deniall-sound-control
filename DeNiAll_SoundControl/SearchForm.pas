unit SearchForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TForm3 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
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
  Form3: TForm3;

implementation

uses SNDControl;

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  Form1.ScanDir(Dir,ComboBox1.Text);
  Form3.Close;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dir:='';
end;

end.
