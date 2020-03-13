unit Fonctions;

interface

uses Windows, Sysutils, Dialogs, WinInet, Classes, Md5, Menus, Strutils,
   Registry, ShellApi;

type
   TDllInfo = record
   Auteur, Date, Commentaire, Description, Fait_par, WebSite, Mail,
   DllName, MenuCaption : PChar;
   Menu, NeedFileOpen, NeedFileSaved : boolean;
   end;

type
   TDll = record
      Init : procedure; stdcall;
      GetInfo : function : TDllInfo; stdcall;
      Execute : function(command : PChar; param : PChar) : PChar; stdcall;
      Close : procedure; stdcall;
      h : Cardinal;
   end;

type
   TPlugins = array of TDll;

type
   TCommentaires = array of string[20];

type
   TTriggerChars = array of string[2];

function LoadDll(fichier : string; var Dll : TDll) : boolean;
function GetVersion : string;
function GetTempDossier : string;
function DetectionConnexion : boolean;
function ConvertBase(Number : string; const BaseFrom, BaseTo : string) : string;
function HashFile(fichier : string) : string;
function IsWhiteSpaceEx(c : AnsiChar) : boolean;
function CharIsLower(c : char) : boolean;
function CharIsUpper(c : char) : boolean;
function DosStrToWinStrW(const StrDos : string) : string;
function WindowsDirectory : string;
function ListeDossier(Chemin : string; mask : string; dossier : boolean; fichier :
   boolean) : TStringList;
function TailleFormat(taille : integer) : string;
function HashString(Text : string) : string;
function ExtractNumber(s : string; pos : integer) : integer;
function DateHeureCreationFichier(fichier : string) : TDateTime;
function TimeModificationFichier(fichier : string) : TDateTime;
function TailleFichier(fichier : string) : string;
function ApplicationVersion : string;
function TailleFichierSimple(fichier : string) : integer;
procedure C2H(m : TMenuItem);
procedure Trier(Liste : TStrings; croissant : boolean);
procedure Association(app : string; ext : string);
procedure extraireMots(s : string; into : TStrings; viderListe : boolean = false;
   sep : TSysCharSet = [' ', ',']);

implementation

procedure C2H(m : TMenuItem);
var
   i : integer;
begin
   for i := 0 to m.Count - 1 do
   begin
      if not (m.Items[i].IsLine) then
         m.Items[i].Hint := AnsiReplaceText(m[i].Caption, '&', '');
      C2H(m.Items[i]);
   end;
end;

procedure Association(app : string; ext : string);
var
   r : Tregistry;
begin
   r := TRegistry.Create;
   with r do
   begin
      RootKey := HKEY_CLASSES_ROOT;
      OpenKey(UpperCase(ext), True);
      WriteString('', 'All4Cod Project');
      CloseKey;
      OpenKey('All4Cod Project', True);
      WriteString('', 'All4Cod Project');
      CloseKey;
      OpenKey('All4Cod Project\Shell\Open\Command', True);
      WriteString('', '"' + app + '" "%1"');
      CloseKey;
      OpenKey('All4Cod Project\DefaultIcon', True);
      WriteString('', '"' + app + '",0');
      CloseKey;
      free;
   end;
end;

function TailleFormat(taille : integer) : string;
var
   Resultat : integer;
begin
   Result := '0';
   if taille <> 0 then
   begin
      Resultat := taille;
      if Resultat > 1 shl 30 then
      begin
         Result := IntToStr(Resultat shr 30) + ' Go';
         exit;
      end;
      if Resultat > 1 shl 20 then
      begin
         Result := IntToStr(Resultat shr 20) + ' Mo';
         exit;
      end;
      if Resultat > 1 shl 10 then
      begin
         Result := IntToStr(Resultat shr 10) + ' Ko';
         exit;
      end;
      Result := IntToStr(Resultat) + ' octets';
   end;
end;

function TailleFichierSimple(fichier : string) : integer;
var
   SearchRec : TSearchRec;
begin
   Result := 0;
   if FindFirst(fichier, FaAnyFile, SearchRec) = 0 then Result := SearchRec.Size;
   FindClose(SearchRec);
end;

function ApplicationVersion : string;
var
   VerInfoSize, VerValueSize, Dummy : DWord;
   VerInfo : Pointer;
   VerValue : PVSFixedFileInfo;
begin
   VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
   if VerInfoSize <> 0 then
   begin
      GetMem(VerInfo, VerInfoSize);
      GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
      VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
      with VerValue^ do
      begin
         Result := IntTostr(dwFileVersionMS shr 16);
         Result := Result + '.' + IntTostr(dwFileVersionMS and $FFFF);
         Result := Result + '.' + IntTostr(dwFileVersionLS shr 16);
         Result := Result + '.' + IntTostr(dwFileVersionLS and $FFFF);
      end;
      FreeMem(VerInfo, VerInfoSize);
   end
   else
      raise
         EAccessViolation.Create('Les informations de version de sont pas inclues');
end;

function LoadDll(fichier : string; var Dll : TDll) : boolean;
begin
   result := true;
   Dll.h := LoadLibrary(pchar(fichier));
   if Dll.h = 0 then
   begin
      result := false;
      exit;
   end;

   @Dll.Init := GetProcAddress(Dll.h, 'Init');
   if @Dll.Init = nil then
   begin
      result := false;
      exit;
   end;

   @Dll.Close := GetProcAddress(Dll.h, 'Close');
   if @Dll.Close = nil then
   begin
      result := false;
      exit;
   end;

   @Dll.Execute := GetProcAddress(Dll.h, 'Execute');
   if @Dll.Execute = nil then
   begin
      result := false;
      exit;
   end;

   @Dll.GetInfo := GetProcAddress(Dll.h, 'GetInfo');
   if @Dll.GetInfo = nil then
   begin
      result := false;
      exit;
   end;

end;

function ExtractNumber(s : string; pos : integer) : integer;
var
   i : integer;
   number : string;
begin
   number := '0';
   for i := pos to length(s) - 1 do
   begin
      if (s[i] in ['0'..'9']) then
         number := number + s[i]
      else
         break;
   end;
   result := StrToInt(number);
end;

function GetVersion : string;
begin
   Result := ApplicationVersion;
end;

function GetTempDossier : string;
var
   Dossier : array[0..MAX_PATH] of Char;
begin
   result := '';
   if GetTempPath(SizeOf(Dossier), Dossier) <> 0 then
      Result := StrPas(Dossier);
end;

function DetectionConnexion : Boolean;
var
   dwFlags : DWord;
begin
   dwFlags := INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN or
      INTERNET_CONNECTION_PROXY;
   Result := InternetGetConnectedState(@dwFlags, 0);
end;

procedure extraireMots(s : string; into : TStrings; viderListe : boolean = false;
   sep : TSysCharSet = [' ', ',']);
var
   i, n : integer;
   currentWord : string;
begin
   if viderListe then
      into.Clear;
   n := length(s);
   i := 1;
   while (i <= n) do
   begin
      currentWord := '';
      while (i <= n) and (s[i] in sep) do
         inc(i);
      while (i <= n) and not (s[i] in sep) do
      begin
         currentWord := currentWord + s[i];
         inc(i);
      end;
      if (currentWord <> '') then
         into.Add(currentWord);
   end;
end;

function TailleFichier(fichier : string) : string;
var
   SearchRec : TSearchRec;
   Resultat : integer;
begin
   Result := 'I';
   Resultat := FindFirst(fichier, FaAnyFile, SearchRec);
   if Resultat = 0 then
   begin
      Resultat := SearchRec.Size;
      if Resultat > 1 shl 30 then
      begin
         Result := IntToStr(Resultat shr 30) + ' Go';
         exit;
      end;
      if Resultat > 1 shl 20 then
      begin
         Result := IntToStr(Resultat shr 20) + ' Mo';
         exit;
      end;
      if Resultat > 1 shl 10 then
      begin
         Result := IntToStr(Resultat shr 10) + ' Ko';
         exit;
      end;
      Result := IntToStr(Resultat) + ' octets';
   end;
   FindClose(SearchRec);
end;

function TimeModificationFichier(fichier : string) : TDateTime;
var
   SearchRec : TSearchRec;
   Resultat : longint;
begin
   Result := 0;
   Resultat := FindFirst(fichier, FaAnyFile, SearchRec);
   if Resultat = 0 then
      Result := FileDateToDateTime(SearchRec.Time);
   FindClose(SearchRec);
end;

function DateHeureCreationFichier(fichier : string) : TDateTime;
var
   SearchRec : TSearchRec;
   Resultat : longint;
begin
   Result := 0;
   Resultat := FindFirst(fichier, FaAnyFile, SearchRec);
   if Resultat = 0 then
      Result := FileDateToDateTime(SearchRec.Time);
   FindClose(SearchRec);
end;

function ConvertBase(Number : string; const BaseFrom, BaseTo : string) : string;
var
   s : string;
   LenFrom, LenTo : Integer;
   i, j, k, Remainder : Integer;
begin
   Result := '';
   LenFrom := Length(BaseFrom);
   LenTo := Length(BaseTo);
   if (LenTo > 0) and (LenFrom > 0) and (Number <> '') then
   begin
      s := Number;
      while (s <> '') do
      begin
         j := 0;
         Remainder := 0;
         for i := 1 to Length(s) do
         begin
            k := Pos(s[i], BaseFrom) - 1;
            if (k >= 0) then
            begin
               Remainder := LenFrom * Remainder + k;
               if (Remainder >= LenTo) then
               begin
                  Inc(j);
                  Number[j] := BaseFrom[(Remainder div LenTo) + 1];
                  Remainder := Remainder mod LenTo;
               end
               else if (j > 0) then
               begin
                  Inc(j);
                  Number[j] := BaseFrom[1];
               end;
            end;
         end;
         s := Copy(Number, 1, j);
         Result := BaseTo[Remainder + 1] + Result;
      end;
   end;
end;

function HashFile(fichier : string) : string;
var
   Digest : MD5Digest;
begin
   Digest := MD5File(fichier);
   Result := MD5Print(Digest);
end;

function HashString(Text : string) : string;
var
   Digest : MD5Digest;
begin
   Digest := MD5String(Text);
   Result := MD5Print(Digest);
end;

function CharIsUpper(c : char) : boolean;
begin
   result := (ord(c) > 64) and (ord(c) < 91);
end;

function CharIsLower(c : char) : boolean;
begin
   result := (ord(c) > 96) and (ord(c) < 123);
end;

function IsWhiteSpaceEx(c : AnsiChar) : boolean;
const
   WhiteSpaceEx = [#9, #10, #11, #12,
      #13, #32, #34, #33, #39, #40, #41, #44, #46, #47,
      #58, #59, #60, #62, #63, #91, #92, #93, #123, #125, #171, #187];
begin
   Result := c in WhiteSpaceEx;
end;

function DosStrToWinStrW(const StrDos : string) : string;
begin
   SetLength(Result, Length(StrDos));
   OemToCharBuff(pChar(StrDos), @Result[1], Length(StrDos));
end;

function WindowsDirectory : string;
const
   dwLength : DWORD = 255;
var
   WindowsDir : PChar;
begin
   GetMem(WindowsDir, dwLength);
   GetWindowsDirectory(WindowsDir, dwLength);
   Result := IncludeTrailingPathDelimiter(string(WindowsDir));
   FreeMem(WindowsDir, dwLength);
end;

procedure Trier(Liste : TStrings; croissant : boolean);
var
   I, J : Integer;
   PosMin : Integer;
begin
   for I := 0 to Liste.Count - 2 do
   begin
      PosMin := I;
      for J := PosMin + 1 to Liste.Count - 1 do
      begin
         if croissant and (Liste[J] < Liste[PosMin]) then
            PosMin := J;
         if not (croissant) and (Liste[J] > Liste[PosMin]) then
            PosMin := J;
      end;
      Liste.Exchange(I, PosMin);
   end;
end;

function ListeDossier(Chemin : string; mask : string; dossier : boolean; fichier :
   boolean) : TStringList;
var
   Info : TSearchRec;
begin
   Result := TStringList.Create;
   Result.Clear;
   if FindFirst(IncludeTrailingPathDelimiter(Chemin) + mask, faAnyFile, Info) = 0 then
   begin
      repeat
         if (fichier and ((Info.Attr and faDirectory) = 0)) or (dossier and
            ((Info.Attr and faDirectory) <> 0)) then
            Result.Add(Info.FindData.cFileName);
      until FindNext(Info) <> 0;
      FindClose(Info);
   end;
end;

end.

