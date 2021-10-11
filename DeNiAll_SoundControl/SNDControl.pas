unit SNDControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, Grids, ValEdit, StdCtrls,
  ComCtrls, Menus, Buttons, ImgList;

type
  TForm1 = class(TForm)
    Bevel1: TBevel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Bevel2: TBevel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Bevel3: TBevel;
    SpeedButton5: TSpeedButton;
    Panel3: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Bevel4: TBevel;
    SpeedButton9: TSpeedButton;
    Panel4: TPanel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Panel5: TPanel;
    Panel6: TPanel;
    SpeedButton16: TSpeedButton;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    N4: TMenuItem;
    Timer1: TTimer;
    N8: TMenuItem;
    ImageList1: TImageList;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image1: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image2: TImage;
    Image3: TImage;
    N5: TMenuItem;
    N6: TMenuItem;
    PlayList1: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    OpenDialog3: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    N20: TMenuItem;
    N21: TMenuItem;
    N23: TMenuItem;
    N25: TMenuItem;
    Panel7: TPanel;
    Panel8: TPanel;
    List1: TListView;
    Panel9: TPanel;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    Label11: TLabel;
    Panel10: TPanel;
    List2: TListView;
    Splitter1: TSplitter;
    Panel11: TPanel;
    Label10: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
 Procedure ScanDir(StartDir: string; Mask: string);
  end;

var
  Form1: TForm1;
  Dir,FullPath:String;
implementation

{$R *.dfm}
uses FileCTRL, PackFile, SearchForm,ShellAPI, InfoMP3, Settings, ShlObj, ClipBrd,registry;

Procedure Delete_from_File(str:String;Ind:Integer);
var Li:TStringList;
    i:Integer;
begin
try
Li:=TStringList.Create;
setCurrentDir(extractFileDir(application.ExeName));
//ShowMessage(str);

if fileExists('Files.txt') then
begin
 Li.LoadFromFile('Files.txt');
for i:=0 to li.Count-1 do
if Li.Strings[i]=str then
begin
 Li.Delete(i);
 Li.SaveToFile('Files.txt');
 exit;
end;
end;
except
end;
end;

Procedure Add_to_table(Str:String);
var
    intFileAge:LongInt;
    FileInfo:TSearchRec;
    i:Integer;
begin
for i:=0 to Form1.List1.Items.Count-1 do
begin
if (form1.List1.Items[i].Caption=ExtractFileName(Str)) and
   (form1.List1.Items[i].SubItems.Strings[0]=(ExtractFilePath(Str))) then
   exit;
end;

    form1.List1.Items.Add;
    FindFirst(Str,faAnyFile,FileInfo);
    form1.List1.Items[form1.List1.Items.Count-1].Caption:=ExtractFileName(Str);
    form1.List1.Items[form1.List1.Items.Count-1].SubItems.Add(ExtractFilePath(Str));
    form1.List1.Items[form1.List1.Items.Count-1].SubItems.Add(Format('%.2f MB',[FileInfo.Size/1024/1024]));
    intFileAge:=FileAge(Str);
    form1.List1.Items[form1.List1.Items.Count-1].SubItems.Add(DateToStr(FileDateToDateTime(intFileAge)));
end;

procedure CheckFiles;
var Li:TStringList;
    i:Integer;
begin
Li:=TStringList.Create;
setCurrentDir(extractFileDir(application.ExeName));
if fileExists('Files.txt') then
begin
 Li.LoadFromFile('Files.txt');
for i:=0 to Li.Count-1 do
begin
Add_to_table(Li.Strings[i]);
end;
end;
end;

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
r.WriteString('','"'+ExtractFileDir(application.ExeName)+'\ExplMenu.exe'+'""%1"');
end;
r.Free;
end;

procedure CopyFilesToClipboard(FileList: string);
var 
  DropFiles: PDropFiles; 
  hGlobal: THandle; 
  iLen: Integer; 
begin 
  iLen := Length(FileList) + 2; 
  FileList := FileList + #0#0; 
  hGlobal := GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT, 
    SizeOf(TDropFiles) + iLen); 
  if (hGlobal = 0) then raise Exception.Create('Could not allocate memory.'); 
  begin 
    DropFiles := GlobalLock(hGlobal); 
    DropFiles^.pFiles := SizeOf(TDropFiles); 
    Move(FileList[1], (PChar(DropFiles) + SizeOf(TDropFiles))^, iLen); 
    GlobalUnlock(hGlobal); 
    Clipboard.SetAsHandle(CF_HDROP, hGlobal); 
  end; 
end;



procedure TForm1.ScanDir(StartDir: string; Mask: string);
var
  SearchRec: TSearchRec;
  intFileAge:LongInt;
  i:Integer;
begin
  if Mask = '' then
    Mask := '*.*';
  if StartDir[Length(StartDir)] <> '\' then
    StartDir := StartDir + '\';
  if FindFirst(StartDir + Mask, faAnyFile, SearchRec) = 0 then
  begin
    repeat Application.ProcessMessages;
      if (SearchRec.Attr and faDirectory) <> faDirectory then
      begin
      List1.Items.Add;
      List1.Items[List1.Items.Count-1].Caption:=ExtractFileName(StartDir + SearchRec.Name);
      List1.Items[List1.Items.Count-1].SubItems.Add(ExtractFileDir(StartDir + SearchRec.Name)+'\');
      List1.Items[List1.Items.Count-1].SubItems.Add(Format('%.2f MB',[SearchRec.Size/1024/1024]));
      intFileAge:=FileAge(StartDir + SearchRec.Name);
      List1.Items[List1.Items.Count-1].SubItems.Add(DateToStr(FileDateToDateTime(intFileAge)));
      end
      else if (SearchRec.Name <> '..') and (SearchRec.Name <> '.')then
      begin
      List1.Items.Add;
      List1.Items[List1.Items.Count-1].Caption:=ExtractFileName(StartDir + SearchRec.Name);
      List1.Items[List1.Items.Count-1].SubItems.Add(ExtractFileDir(StartDir + SearchRec.Name)+'\');
      List1.Items[List1.Items.Count-1].SubItems.Add(Format('%.2f MB',[SearchRec.Size/1024/1024]));
      intFileAge:=FileAge(StartDir + SearchRec.Name);
      List1.Items[List1.Items.Count-1].SubItems.Add(DateToStr(FileDateToDateTime(intFileAge)));
      ScanDir(StartDir + SearchRec.Name + '\',mask);
      end;
until FindNext(SearchRec) <> 0;
FindClose(SearchRec);
for i:=0 to Form1.List1.Items.Count-1 do
Form1.List1.Items[i].Checked:=True;
List1.Items[0].Selected:=True;
List1.OnClick(List1);
end;

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i,j:Integer;
    intFileAge:LongInt;
    FileInfo:TSearchRec;
begin
with OpenDialog1 do
begin
  if Execute then
  begin
  for i:=0 to Files.Count-1 do
    begin
    for j:=0 to List1.Items.Count-1 do
    begin
      if ExtractFileName(Files[i])=List1.Items[j].Caption then
      begin
        MessageDLG('Файл '+List1.Items[j].Caption+' уже добавлен!',mtInformation,[mbOk],0);
        exit;
      end;
    end;
      List1.Items.Add;
      FindFirst(Files[i],faAnyFile,FileInfo);
      List1.Items[List1.Items.Count-1].Caption:=ExtractFileName(Files[i]);
      List1.Items[List1.Items.Count-1].SubItems.Add(ExtractFilePath(FileName));
      List1.Items[List1.Items.Count-1].SubItems.Add(Format('%.2f MB',[FileInfo.Size/1024/1024]));
      intFileAge:=FileAge(Files[i]);
      List1.Items[List1.Items.Count-1].SubItems.Add(DateToStr(FileDateToDateTime(intFileAge)));
     end;
  List1.Items[0].Selected:=True;
  List1.OnClick(List1);   
  end;

end;

for i:=0 to Form1.List1.Items.Count-1 do
Form1.List1.Items[i].Checked:=True;

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  SelectDirectory('Выберите папку в которой находяться файлы',
  'Выберите папку в которой находяться файлы',Dir);
  if Dir='' then exit;
  Application.CreateForm(TForm3, Form3);
  Form3.Show;

end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
var F:TextFile;
    Buff:String;
    FileInfo:TSearchRec;
    intFileAge:LongInt;
    i:Integer;
begin
with OpenDialog2 do
begin
 if Execute then
 begin
  if not FileExists(FileName) then exit;
  AssignFile(F,FileName);
  reset(F);
  while not eof(F) do
  begin
  readln(F,buff);
  if FileExists(buff)=true then
  begin
    List1.Items.Add;
    List1.Items[List1.Items.Count-1].Caption:=ExtractFileName(buff);
    FindFirst(buff,faAnyFile,FileInfo);

    List1.Items[List1.Items.Count-1].SubItems.Add(ExtractFileDir(buff)+'\');

    List1.Items[List1.Items.Count-1].SubItems.Add(Format('%.2f MB',[FileInfo.Size/1024/1024]));
    intFileAge:=FileAge(buff);
    List1.Items[List1.Items.Count-1].SubItems.Add(DateToStr(FileDateToDateTime(intFileAge)));
  end;
  end;
  CloseFile(F);
end;
end;
for i:=0 to Form1.List1.Items.Count-1 do
Form1.List1.Items[i].Checked:=True;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var i:Integer;
begin
if List1.Items.Count=0 then exit;
  List1.Items[0].Selected:=True;
  List1.OnClick(List1);
if FullPath='' then exit;
for i:=0 to Form1.List1.Items.Count-1 do
begin
if Form1.List1.Items[i].Checked=true then
begin
  Application.CreateForm(TForm2, Form2);
  Form2.Tag:=0;
  Form2.Caption:='Сжать файлы';
  Form2.Show;
  Form1.Enabled:=False;
exit;
end;
end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  List1.Columns[0].Width:=150;
  List1.Columns[1].Width:=250;
  List1.Columns[2].Width:=80;
  List1.Columns[3].Width:=90;
  List2.Columns[0].Width:=150;
  List2.Columns[1].Width:=250;
  List2.Columns[2].Width:=80;
  List2.Columns[3].Width:=90;
  Set_extFile;
  if not DirectoryExists('Обработанные файлы') then
  CreateDir('Обработанные файлы');

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label11.Caption:='&Всего файлов '+IntToStr(List1.Items.Count);
  if List1.SelCount=0 then
  FullPath:='';
  CheckFiles;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  List1.Clear;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
if FullPath='' then exit;
  ShellExecute(Handle,'Open',PChar(FullPath),nil,nil,SW_ShowNormal);
end;

procedure TForm1.List1Click(Sender: TObject);
var i:Integer;
    S:String;
begin
if ((Sender as TListView).SelCount)=0 then
begin
  SpeedButton16.Tag:=0;
  SpeedButton16.Click;
  exit;
end;
with ((Sender as TListView)) do
begin
if Name='List1' then
    FullPath:=List1.Selected.SubItems.Strings[0]+List1.Selected.Caption;
    StatusBar1.SimpleText:=Selected.SubItems.Strings[0]+Selected.Caption;
    Label4.Hint:=FullPath;
    Label4.ShowHint:=True;
end;
if ((Sender as TListView).SelCount)<>0 then
begin
  with ((Sender as TListView).Selected) do
  begin
    Label4.Caption:=Caption;
    Label5.Caption:=SubItems.Strings[1];
    Label6.Caption:=SubItems.Strings[2];
  end;
  if ((Sender as TListView).Name='List2') then
  begin
    Label9.Caption:='&Сжат на';
    Label9.Font.Color:=clRed;
    Label6.Font.Color:=clRed;
  end
  else
  begin
    Label9.Font.Color:=clGreen;
    Label6.Font.Color:=clGreen;
    Label9.Caption:='&Изменён';
  end;
  S:=Label4.Caption;
  for i:=15 to Length(s) do
  begin
    S[i]:='.';
  end;
  Label4.Caption:=S;

  SpeedButton16.Tag:=1;
  SpeedButton16.Click;
end;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
if FullPath='' then exit;
  ShellExecute(Handle,'Open',PChar(ExtractFileDir(FullPath)),nil,nil,SW_ShowNormal);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
 var i:Integer;
begin

StatusBar1.SimpleText:='';
if List1.SelCount<>0 then
  if List1.Focused=true then
  begin
  Timer1.Enabled:=False;
  for i:=0 to List1.SelCount-1 do
  begin
    //ShowMessage(List1.Selected.SubItems.Strings[0]+List1.Selected.Caption);
    Delete_from_File(List1.Selected.SubItems.Strings[0]+List1.Selected.Caption,List1.Selected.Index);
    List1.Selected.Delete;
  end;
    List1.OnClick(List1);
  end;

if List2.SelCount<>0 then
  if List2.Focused=true then
  begin
    List2.Selected.Delete;
    List2.OnClick(List2);
  end;
Timer1.Enabled:=True;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
case SpeedButton1.Tag of
  1:begin
      Panel1.Height:=193;
      SpeedButton1.Tag:=0;
      ((Sender as TSpeedButton).Glyph:=Image3.Picture.Bitmap);
    end;
  0:begin
      Panel1.Height:=Panel2.Height+1;
      SpeedButton1.Tag:=1;
      ((Sender as TSpeedButton).Glyph:=Image2.Picture.Bitmap);
    end;
end;
Panel3.Top:=Panel1.Height+39;
Panel5.Top:=Panel3.Top+Panel3.Height+7;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin

case SpeedButton10.Tag of
  1:Begin
      Panel3.Height:=163;
      SpeedButton10.Tag:=0;
      ((Sender as TSpeedButton).Glyph:=Image3.Picture.Bitmap);
    end;
  0:begin
      Panel3.Height:=Panel4.Height+1;
      Panel3.Top:=Panel1.Height+39;
      SpeedButton10.Tag:=1;
      ((Sender as TSpeedButton).Glyph:=Image2.Picture.Bitmap);
    end;
end;
Panel5.Top:=Panel3.Top+Panel3.Height+7;
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
case SpeedButton16.Tag of
  1:Begin
      Panel5.Height:=129;
      SpeedButton16.Tag:=0;
      ((Sender as TSpeedButton).Glyph:=Image3.Picture.Bitmap);
    end;
  0:begin
      Panel5.Height:=Panel6.Height+1;
      SpeedButton16.Tag:=1;
      ((Sender as TSpeedButton).Glyph:=Image2.Picture.Bitmap);
    end;
end;
Panel5.Top:=Panel3.Top+Panel3.Height+7;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
//  Application.CreateForm(TForm4, Form4);
  Form4.Show;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var i:Integer;
begin
if FullPath='' then exit;
for i:=0 to Form1.List1.Items.Count-1 do
begin
if Form1.List1.Items[i].Checked=true then
begin
if (ExtractFileExt(List1.Items[i].Caption)='.wav')or(ExtractFileExt(List1.Items[i].Caption)='.WAV') then
begin
  Application.CreateForm(TForm2, Form2);
  Form2.Show;
  Form2.Tag:=1;
  Form2.Caption:='Конвертировать в MP3';
  Form1.Enabled:=False;
  exit;
end;
end;
end;
end;
procedure TForm1.N9Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
  MessageDLG('Программа "DeNiAll SoundControl" написана Гидиным Денисом Юрьевичем'
  ,mtInformation,[mbOk],0);
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  MessageDLG('Программа преднозначена для сжатия и конвертирования звуковых файлов'
  ,mtInformation,[mbOk],0);
end;

procedure TForm1.N18Click(Sender: TObject);
begin
try
SaveDialog1.Execute;
if SaveDialog1.FileName='' then
  exit;
  WriteComponentResFile(SaveDialog1.FileName,List1);
  WriteComponentResFile(SaveDialog1.FileName+'T2',List2);
except
  exit;
end;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
try
OpenDialog3.Execute;
if Not FileExists(OpenDialog3.FileName) then
exit;
  ReadComponentResFile(OpenDialog3.FileName,List1);
  ReadComponentResFile(OpenDialog3.FileName+'T2',List2);
  List1.Columns[0].Width:=150;
  List1.Columns[1].Width:=250;
  List1.Columns[2].Width:=80;
  List1.Columns[3].Width:=90;
except
  exit;
end;
  
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  exit;
  Form6.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
MoveFile('D:\~Ссылки.txt','C:\~Ссылки.txt');
end;

procedure TForm1.N20Click(Sender: TObject);
var i:integer;
    S:String;
begin
for i:=0 to list2.Items.Count-1 do
begin
List2.Items[i].ImageIndex:=13;
if List2.Items[i].Selected then
  if S<>'' then
    S:=S+#0+List2.Items[i].SubItems.Strings[0]+'~'+List2.Items[i].Caption
  else
    S:=List2.Items[i].SubItems.Strings[0]+'~'+List2.Items[i].Caption;
end;
//ShowMessage(S);
CopyFilesToClipboard(S);
end;

procedure TForm1.N24Click(Sender: TObject);
var s:string;
begin
  SelectDirectory('Выберите папку в которую нужно отправить файлы',
  'Выберите папку в которую нужно отправить файлы',S);
if S='' then exit;
  
end;

procedure TForm1.N23Click(Sender: TObject);
var s:string;
    OldFile,OldFile1:String;
    i:integer;
begin
  SelectDirectory('Выберите папку в которую нужно отправить файлы',
  'Выберите папку в которую нужно отправить файлы',S);
if S='' then exit;
for i:=0 to list2.Items.Count-1 do
begin
if List2.Items[i].Selected then
begin
OldFile:=PChar(List2.Items[i].SubItems.Strings[0]+'~'+List2.Items[i].Caption);
OldFile1:=PChar(S+'\~'+List2.Items[i].caption);

if  MoveFile(PChar(OldFile),PChar(OldFile1))=false then
begin
  MessageDLG('&Ошибка! Не могу пререместить файл '+List2.Items[i].Caption,mtError,[mbOk],0);
  List2.Items[i].ImageIndex:=11;
end
else
begin
  List2.Items[i].Caption:=List2.Items[i].Caption+' (Перемещён...)';
  List2.Items[i].ImageIndex:=10;
end;
end;
end;


end;


procedure TForm1.CheckBox2Click(Sender: TObject);
var i:Integer;
begin
if CheckBox2.Checked=true then
for i:=0 to List1.Items.Count-1 do
  List1.Items[i].Checked:=True
else
for i:=0 to List1.Items.Count-1 do
  List1.Items[i].Checked:=False;
end;

procedure TForm1.N25Click(Sender: TObject);
var i:integer;
    S:String;
begin
if MessageDLG('&Вы действительно хотите удалить файл(ы)?',mtInformation,[mbYes,mbNo],0)=mrYes then
begin
for i:=0 to list2.Items.Count-1 do
begin
if List2.Items[i].Selected then
if DeleteFile(List2.Items[i].SubItems.Strings[0]+'~'+List2.Items[i].Caption)=false then
    MessageDLG('&Не могу удалить файл '+List2.Items[i].Caption,mtError,[mbOK],0)
  else
  begin
    List2.Items[i].Caption:=List2.Items[i].Caption+' (Удалён)';
    List2.Items[i].ImageIndex:=12;
  end;
end;
end;

end;

end.
