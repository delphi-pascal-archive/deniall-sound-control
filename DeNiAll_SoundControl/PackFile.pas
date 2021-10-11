unit PackFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox2: TComboBox;
    Bevel1: TBevel;
    BitBtn3: TBitBtn;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;
type
  SizeType=record
    OldSize:Real;
    CurrentSize:Real;
    PackProcent:Real;
  end;


var
  Form2: TForm2;
  Temp:String;
implementation

uses SNDControl,ShellAPI, InfoMP3, Process,WorkMP3Tag;

{$R *.dfm}

function ExecCmdLineAndWait(const CmdLine: string;
   WindowState: Word): Boolean;
 var
   SUInfo: TStartupInfo;
   ProcInfo: TProcessInformation;
begin
Form5.Show;
application.ProcessMessages;

   { Enclose filename in quotes to take care of
    long filenames with spaces. }
   FillChar(SUInfo, SizeOf(SUInfo), #0);
   with SUInfo do
   begin
     cb := SizeOf(SUInfo);
     dwFlags := STARTF_USESHOWWINDOW;
     wShowWindow := SW_Hide;
   end;
   Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
     CREATE_NEW_CONSOLE or
     NORMAL_PRIORITY_CLASS, nil,
     nil {PChar(ExtractFilePath(Filename))},
     SUInfo, ProcInfo);
   { Wait for it to finish. }
   if Result then
   begin
     WaitForSingleObject(ProcInfo.hProcess, INFINITE);
   end;
Form5.Close;
end;



procedure TForm2.RadioButton1Click(Sender: TObject);
begin
  ComboBox1.Enabled:=True;
  ComboBox2.Enabled:=False;
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
  ComboBox2.Enabled:=True;
  ComboBox1.Enabled:=False;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled:=true;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var BitRate,i:Integer;
    Mode:Char;
    OldFile:String;
    NewFile:String;
    tt,ta,tl,ty,tc:PChar;
    aTmp:ARRAY[0..255] of Char;
    FileInfo:TSearchRec;
    FileSize:SizeType;
    Procente:Real;
    mp3Info:Tmp3Tag;
begin
with Form4 do
begin
  mp3Info.Title:=Edit1.text;
  mp3Info.Artist:=Edit2.Text;
  mp3Info.Album:=Edit3.Text;
  mp3Info.Year:=Edit4.Text;
  mp3Info.Comment:=Memo1.Text;
  mp3Info.Genre:=5;
end;

BitRate:=0;
Mode:='a';
if ComboBox1.Enabled=true then
case ComboBox1.ItemIndex of
  0:BitRate:=160;
  1:BitRate:=112;
  2:BitRate:=192;
  3:BitRate:=256;
  4:BitRate:=16;
  5:BitRate:=24;
  6:BitRate:=56;
  7:BitRate:=40;
end
else
case ComboBox2.ItemIndex of
  0:BitRate:=32;
  1:BitRate:=40;
  2:BitRate:=56;
  3:BitRate:=64;
  4:BitRate:=80;
  5:BitRate:=96;
  6:BitRate:=112;
  7:BitRate:=128;
  8:BitRate:=160;
  9:BitRate:=192;
  10:BitRate:=224;
  11:BitRate:=256;
end;
if RadioButton5.Checked=true then
Mode:='a';
if RadioButton3.Checked=true then
Mode:='s';
if RadioButton4.Checked=true then
Mode:='m';

for i:=0 to Form1.List1.Items.Count-1 do
begin
if Form1.List1.Items[i].Checked=true then
begin
  OldFile:=Form1.List1.Items[i].SubItems.Strings[0]+Form1.List1.Items[i].Caption;
  Temp:=Form1.List1.Items[i].SubItems.Strings[0]+Form1.List1.Items[i].Caption;
  FindFirst(OldFile,faAnyFile,FileInfo);
  FileSize.OldSize:=FileInfo.Size/1024/1024;
{***Всё просто! Преобразовываем имя файла переменной OldFile в короткое *~.*mp3***}
  NewFile:=OldFile;
  GetShortPathName(PChar (OldFile), aTmp, Sizeof (aTmp) - 1);
  OldFile:=StrPas(aTmp);
  GetShortPathName(PChar (NewFile), aTmp, Sizeof (aTmp) - 1);
  NewFile:=StrPas(aTmp);
  NewFile:=ExtractFileDir(NewFile)+'\~'+ExtractFileName(NewFile);
  {***Запускаем и ждём до конца выполнение программы Lame.exe***}
  with Form4 do
  begin
    tt:=PChar(Edit1.Text);
    ta:=PChar(Edit2.Text);
    tl:=PChar(Edit3.Text);
    ty:=PChar(Edit4.Text);
    tc:=PChar(Memo1.Text);
  end;
  {***Преобразовываем строку в символы***}
  StringOfChar(Char(tt),Length(tt));
  StringOfChar(Char(ta),Length(tt));
  StringOfChar(Char(tl),Length(tt));
  StringOfChar(Char(ty),Length(tt));
  StringOfChar(Char(tc),Length(tt));
  {***Преобразовываем строку в символы***}

  {***Запускаем приложение Lame.exe и ждём его завершения***}
  if Form2.Tag=1 then
  if (ExtractFileExt(OldFile)='.wav')or(ExtractFileExt(OldFile)='.WAV') then
    ExecCmdLineAndWait(PChar('Lame.exe -m '+Mode+' -b '+IntToStr(BitRate)+' '+OldFile+' '+ChangeFileExt(NewFile,'.mp3')),SW_ShowNormal);
  if Form2.Tag=0 then
    ExecCmdLineAndWait(PChar('Lame.exe -m '+Mode+' -b '+IntToStr(BitRate)+' '+OldFile+' '+NewFile),SW_ShowNormal);

 OldFile:=ExtractFileDir(Temp)+'\~'+ExtractFileName(Temp);
  {***Переименовываем файл в нормальное длинное имя!***}
 if (ExtractFileExt(OldFile)='.wav')or(ExtractFileExt(OldFile)='.WAV') then
 begin
 if Form2.Tag=0 then
    RenameFile(ChangeFileExt(NewFile,'.wav'),ChangeFileExt(OldFile,'.wav'));
 if Form2.Tag=1 then
 begin
    RenameFile(ChangeFileExt(NewFile,'.mp3'),ChangeFileExt(OldFile,'.mp3'));
    SetMP3Tag(mp3Info,ChangeFileExt(OldFile,'.mp3'));
 end
 end
 else
 begin
    RenameFile(NewFile,OldFile);
    SetMP3Tag(mp3Info,OldFile);
 end;
 with Form1 do
 begin
      List2.Items.Add;
      if Form2.Tag=1 then
      FindFirst(ChangeFileExt(OldFile,'.mp3'),faAnyFile,FileInfo)
      else
      FindFirst(OldFile,faAnyFile,FileInfo);
      FileSize.CurrentSize:=FileInfo.Size/1024/1024;
      if Form2.Tag=1 then
      List2.Items[List2.Items.Count-1].Caption:=ExtractFileName(ChangeFileExt(Temp,'.mp3'))
      else
      List2.Items[List2.Items.Count-1].Caption:=ExtractFileName(Temp);
      List2.Items[List2.Items.Count-1].SubItems.Add(ExtractFilePath(Temp));
      List2.Items[List2.Items.Count-1].SubItems.Add(Format('%.2f MB',[FileSize.CurrentSize]));
      Procente:=FileSize.CurrentSize/FileSize.OldSize*100;
      FileSize.PackProcent:=100-Procente;
      if FileSize.PackProcent<0 then
      begin
        List2.Items[List2.Items.Count-1].SubItems.Add('Увеличился на'+Format('%.1f',[FileSize.PackProcent])+'%');
      end;
      List2.Items[List2.Items.Count-1].SubItems.Add(Format('%.1f',[FileSize.PackProcent])+'%');
      List1.Items[i].Checked:=False;
      List2.Items[List2.Items.Count-1].ImageIndex:=3;
 end;
Form5.Close;
if i=Form1.List1.Items.Count-1 then
Temp:='';
end;
end;
end;
procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 // Form2.Enabled:=False;
  Form4.Show;
end;

end.
