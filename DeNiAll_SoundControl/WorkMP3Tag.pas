unit WorkMP3Tag;

interface

uses SysUtils, Classes;

type
  TMP3Tag = record
    FileName: string;
    Title, Artist, Album: string[30];
    Year: string[4];
    Comment: string[29];
    Track, Genre: byte;
  end;

function IndexToGenre(Index: byte): string;
function GenreToIndex(Genre: string): byte;
function GetMP3Tag(var Mp3Tag: TMP3Tag; FileName: string): boolean;
function SetMp3Tag(Mp3Tag: TMP3Tag; FileName: string): boolean;
function DeleteMp3Tag(FileName: string): boolean;
function TagExists(FileName: string): boolean;

const
  Genres: array[0..125] of string =
  ('Blues', 'Classic Rock', 'Country', 'Dance', 'Disco',
    'Funk', 'Grunge', 'Hip-Hop', 'Jazz', 'Metal',
    'New Age', 'Oldies', 'Other', 'Pop', 'R&B',
    'Rap', 'Reggae', 'Rock', 'Techno', 'Industrial',
    'Alternative', 'Ska', 'Death Metal', 'Pranks', 'Soundtrack',
    'Euro-Techno', 'Ambient', 'Trip-Hop', 'Vocal', 'Jazz+Funk',
    'Fusion', 'Trance', 'Classical', 'Instrumental', 'Acid',
    'House', 'Game', 'Sound Clip', 'Gospel', 'Noise',
    'AlternRock', 'Bass', 'Soul', 'Punk', 'Space',
    'Meditative', 'Instrumental Pop', 'Instrumental Rock', 'Ethnic', 'Gothic',
    'Darkwave', 'Techno-Industrial', 'Electronic', 'Pop-Folk', 'Eurodance',
    'Dream', 'Southern Rock', 'Comedy', 'Cult', 'Gangsta',
    'Top 40', 'Christian Rap', 'Pop/Funk', 'Jungle', 'Native American',
    'Cabaret', 'New Wave', 'Psychadelic', 'Rave', 'Showtunes',
    'Trailer', 'Lo-Fi', 'Tribal', 'Acid Punk', 'Acid Jazz',
    'Polka', 'Retro', 'Musical', 'Rock & Roll', 'Hard Rock',
    'Folk', 'Folk-Rock', 'National Folk', 'Swing', 'Fast Fusion',
    'Bebob', 'Latin', 'Revival', 'Celtic', 'Bluegrass',
    'Avantgarde', 'Gothic Rock', 'Progressive Rock', 'Psychedelic Rock',
      'Symphonic Rock',
    'Slow Rock', 'Big Band', 'Chorus', 'Easy Listening', 'Acoustic',
    'Humour', 'Speech', 'Chanson', 'Opera', 'Chamber Music',
    'Sonata', 'Symphony', 'Booty Brass', 'Primus', 'Porn Groove',
    'Satire', 'Slow Jam', 'Club', 'Tango', 'Samba',
    'Folklore', 'Ballad', 'Poweer Ballad', 'Rhytmic Soul', 'Freestyle',
    'Duet', 'Punk Rock', 'Drum Solo', 'A Capela', 'Euro-House', 'Dance Hall');

implementation

function GetMP3Tag(var Mp3Tag: TMP3Tag; FileName: string): boolean;
var
  tag: array[0..127] of char;
  F: file;
  I: byte;
  S: string;

  function DelSpace(s: string): string;
  begin
    Result := s;
    if length(Result) = 0 then
      exit;
    while s[length(Result)] in [' ', #0] do
    begin
      delete(Result, length(Result), 1);
      if Result = '' then
        break;
    end;
  end;

begin
  Result := false;
  if not FileExists(FileName) then
    exit;
  mp3tag.FileName := FileName;
  mp3tag.Title := ExtractFileName(ChangeFileExt(FileName, ''));
  mp3tag.Artist := 'Unknown';
  mp3tag.Album := 'Unknown';
  mp3tag.Year := '';
  mp3tag.Comment := '';
  mp3tag.Genre := 255;
  mp3tag.Track := 0;
  try
    AssignFile(F, FileName);
{$I-}
    Reset(F, 1);
    Seek(F, FileSize(F) - 128);
    BlockRead(f, tag, 128);
    CloseFile(F);
{$I+}
    if IOResult = 0 then
    begin
      s := '';
      for i := 0 to 127 do
        s := s + tag[i];
      if copy(s, 1, 3) = 'TAG' then
      begin
        mp3tag.Title := DelSpace(copy(S, 4, 30));
        mp3tag.Artist := DelSpace(copy(S, 34, 30));
        mp3tag.Album := DelSpace(copy(S, 64, 30));
        mp3tag.Year := DelSpace(copy(S, 94, 4));
        mp3tag.Comment := DelSpace(copy(S, 98, 29));
        mp3tag.Track := Ord(S[127]);
        mp3tag.Genre := Ord(S[128]);
        Result := true;
      end;
    end;
  except
    Result := false;
  end;
end;

function SetMp3Tag(MP3Tag: TMP3Tag; FileName: string): boolean;
var
  mp3Str: TFileStream;
  TExists: boolean;

  procedure WriteString(Str: string; Count: byte);
  var
    i: integer;
    CH: char;
  begin
    CH := #0;
    for i := 1 to Count do
    begin
      if I <= Length(Str) then
        Mp3Str.Write(Str[i], 1)
      else
        Mp3Str.Write(CH, 1);
    end;
  end;

begin
  Result := false;
  if not FileExists(FileName) then
    exit;

  try
    FileSetAttr(filename, 0);
    TExists := TagExists(filename);
    Mp3Str := TFileStream.create(FileName, fmOpenWrite);
    if not TExists then
      Mp3Str.Seek(Mp3Str.Size, 0)
    else
      Mp3Str.Seek(Mp3Str.Size - 128, 0);
    WriteString('TAG', 3);
    WriteString(MP3Tag.Title, 30);
    WriteString(MP3Tag.Artist, 30);
    WriteString(MP3Tag.Album, 30);
    WriteString(MP3Tag.Year, 4);
    WriteString(MP3Tag.Comment, 29);
    Mp3Str.Write(MP3Tag.Track, 1);
    Mp3Str.Write(MP3Tag.Genre, 1);
    Mp3Str.Free;
    Result := true;
  except
    Result := false;
  end;
end;

function DeleteMp3Tag(FileName: string): boolean;
var
  F: file;
begin
  Result := false;
  if not TagExists(FileName) then
    exit;
  try
    FileSetAttr(filename, 0);
    AssignFile(F, filename);
    Reset(F, 1);
    Seek(F, FileSize(F) - 128);
    Truncate(F);
    CloseFile(F);
    Result := true;
  except
    Result := false;
  end;
end;

function TagExists(FileName: string): boolean;
var
  Tag: array[0..2] of char;
  F: file;
begin
  Result := false;
  try
    FileSetAttr(filename, 0);
    if FileExists(FileName) then
    begin
      AssignFile(F, FileName);
{$I-}
      Reset(F, 1);
      Seek(F, FileSize(F) - 128);
      BlockRead(f, tag, 3);
      CloseFile(F);
{$I+}
      if IOResult = 0 then
        if Tag = 'TAG' then
          Result := true;
    end;
  except
    Result := false;
  end;
end;

function IndexToGenre(Index: byte): string;
begin
  if Index <= 125 then
    Result := Genres[Index]
  else
    Result := '';
end;

function GenreToIndex(Genre: string): byte;
var
  i: byte;
begin
  if Genre <> '' then
  begin
    for i := 0 to 125 do
      if UpperCase(Genres[i]) = UpperCase(Genre) then
      begin
        Result := i;
        exit;
      end;
  end
  else
    Result := 255;
end;

end.

end.
