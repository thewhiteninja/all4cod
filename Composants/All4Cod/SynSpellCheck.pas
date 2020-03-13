////////////////////////////////////////////////////////////////////////////////
// TSynSpellCheck 1.30
//
// Copyright (C) 2000-2003 Jacob Dybala a.k.a. "m3Rlin". All rights reserved.
//
// E-Mail: jacobdybala@synspellcheck.prv.pl
// WWW   : http://www.synspellcheck.prv.pl/ SynSpellCheck Home
//         http://www.delphifaq.net/        Merlin's Delphi Forge
//
// Elf hash algorithm
//   Copyright (c) 1998-2002 Scalabium
//   <http://www.scalabium.com/faq/dct0136.htm>
// SoundEx algorithm
//   Copyright (c) 1995-2001 Borland Software Corporation
// Metaphone Phonetic Hash Algorithm
//   Copyright (c) Tom White <wcstom@yahoo.com>
// Word differences algorithm JHCMP...
//   Copyright (c) Josef Hampl
//
// Created : Jan-10-2002
// Modified: Aug-31-2002
////////////////////////////////////////////////////////////////////////////////
// All dictionaries are located in the 'Program Files\Common\SynSpell' folder.
// This is to limit the number of copies of the same dictionary on a single
// computer to one file.
//
// Dictionaries are flat text files with a single word in each line. All words
// MUST be lowercase. The dictionaries are case insensitive.
//
// Available dictionaries:
// * czech.1-0-0.dic     - 21,177  words [197 Kb]
// * danish.1-0-0.dic    - 339,207 words [4.31 Mb]
// * dutch.1-0-0.dic     - 176,800 words [2.03 Mb]
// * english.1-1-4.dic   - 73,403  words [762 Kb]
// * german.1-0-0.dic    - 88,566  words [1.16 Mb]
// * italian.1-0-0.dic   - 60,453  words [607 Kb]
// * japanese.1-0-0.dic  - 115,524 words [1 Mb]
// * latin.1-0-0.dic     - 77,107  words [905 Kb]
// * norwegian.1-0-0.dic - 61,847  words [636 Kb]
// * polish.1-0-3.dic    - 3,925   words [36 Kb]
// * russian.1-0-0.dic   - 39,412  words [407 Kb]
// * spanish.1-0-0.dic   - 59,167  words [554 Kb]
// * turkish.1-0-0.dic   - 26,123  words [237 Kb]
////////////////////////////////////////////////////////////////////////////////
// Changes:
//
// 1.30 (Contributed in large by Jan Fiala)
//   * Many, many minor adjustments, optimizations.
//   * Rewritten SetApostrophes().
//   + New word suggestion algorithm: haDiff. Finds words based on differences.
//     haSoundex and haMetaphone *may* be removed in upcoming versions.
//   + New action added: ACTION_UNDO.
//   + New function: GetDictionaryDir(). This allows users to specify their own
//     paths.
//   + Dutch (compiled by Arno Verhoeven) dictionary added.
//
// 1.24 Released privately to certain users.
//   * Bug Fix: PChar and string incompatiblity. Fixed.
//
// 1.23 Released privately to certain users.
//   * Minor code adjustments.
//   + New dictionaries: Norwegian and Spanish.
//
// 1.22
//   * Bug Fix: The Apostrophes property did not allow changing. Fixed.
//     Submitted by R.K. Wittye.
//   * Bug Fix: ClearDictWords did not properly dispose of words creating a
//     rather large memory leak. Fixed. Submitted by Ascher Stefan.
//   * English and Polish dictionaries updated.
//   + Added Value field to TWordRec record. Each word is assigned an Elf value
//     and is checked by it. Major speed optimization. Suggested by Jan Fiala
//     (CRC32).
//
// 1.21
//   * Bug Fix: %ProgramFilesDir%\Common Files was read instead of %CommonFilesDir%.
//     This created problems on non-English versions of Windows. The directory
//     was not found. Fixed.
//   * English and Polish dictionaries updated.
//
// 1.20
//   * FindWord() routine rewritten to make use of cache array. Other functions
//     have only been slightly modified yet no functions have been broken.
//   * LoadDictionary() routine now converts all words to lowercase.
//   * LoadSkipList() does not add the words one-by-one any more. They are
//     assigned in whole.
//   * FSkipList is now cleared when a dictionary is closed.
//   * SaveSkipList() now removes all empty lines before saving to file.
//   + Added cache array to speed up word checks.
//   + ENoDictionaryLoaded is now thrown when no dictionary has been loaded.
//
// 1.19
//   * Bug Fix: Word underlining would also draw on gutter when the word was
//     partially scrolled under it. Fixed.
//   * SoundexLength property converted to HashLength.
//   * PaintUnderLine() code modified to directly color pixels instead of drawing
//     lines.
//   * Dictionary updates: English (1.1.2), Polish (1.1.1). The Polish word list
//     has been *significantly* reduced due to the fact that this word list is
//     being started all over to include words with non-latin characters.
//   + New option: sscoTrimApostrophes.
//   + New properties: Busy and UnderlineStyle (to mimic Corel Wordperfect
//     auto spell checking).
//   + MetaPhone algorithm has been finally implemented. In beta stage (works,
//     but slow on big lists).
//   + AddDictSkipList(), AddDictWordList() routines added.
//   + New dictionaries: German (by Ascher Stefan) and Russian.
//
// 1.18
//   * Bug Fix: OnSkipWord event did not return proper ASkipAll value. Fixed.
//   * Bug Fix: GetDictionaryList() included all copies of dictionaries for a
//     specific language instead of newest. Fixed.
//   * DupeString() has been corrected with proper compiler conditional.
//   * Minor code changes to always pass lowercase words to FindWord().
//   * English dictionary updated to version 1.1.0.
//   * Updated component demo.
//   + New option: sscoMaintainCase. Idea suggested by Jeff Rafter.
//   + New event: OnAddWord.
//   + Added support for words with apostrophes. Idea by Stefan van As.
//   + GetDictionaryList() now returns a sorted list.
//
// 1.17
//   * SelectWordAtCursor() made public.
//   + Added support for localized languages and numbers.
//
// 1.16
//   * Bug Fix: Compiler conditional around SoundEx() routines was broken.
//     Fixed.
//   * Bug Fix: sscoSelectWord did not work when set to False. Fixed.
//   + SelectWordAtCursor() routine added. Contributed by Stefan van As.
//
// 1.15
//   * Bug Fix: PenColor property did not work. Fixed by Jeff Corbets.
//   * Bug Fix: OnAbort event was not called when spell checking was aborted.
//     Fixed.
//   * TSoundEx class has been removed in favor of Borland implementation of
//     SoundEx() function.
//   * Minor code modifications.
//   + Added support for dashed words.
//   + New option: sscoGoUp.
//   + New property: SoundExLength.
//
// 1.14
//   * Bug Fix: If the editor had no text and sscoHourGlass was set the cursor
//     did not revert to it's previous value. Fixed by Jeff Corbets.
//
// 1.13
//   * Bug Fix: When empty lines in base dictionary and user dictionary were
//     added to word list and raised AV when attempting to calculate word hash.
//     Fixed.
//
// 1.12
//   * Bug Fix: GetSuggestions did not properly support words with uppercase
//     characters. Fixed. Found by Jeff Rafter.
//   + Added Metaphon algorithm for word hashes. Not working, just skeleton for
//     now.
//
// 1.11
//   + Added support for multiple editors: AddEditor() and RemoveEditor().
//
// 1.10 (code contributed by Ricardo Cardona)
//   * Bug Fix: When not highlighter was selected and sscoAutoSpellCheck was set
//     in Options the component generated an AV. Fixed.
//   * New property: CheckAttribs.
//   * Improved code for underlining unknown words.
//
// 1.09
//   * Bug Fix: FWordList did not free memory when the component was destroyed.
//     It just cleared the word and hash lists. Fixed.
//
// 1.08
//   * Bug Fix: FindWord() function was case sensitive. Fix contributed by
//     Gerald Nunn.
//   + New events: OnDictClose and OnDictLoad.
//   + New options: sscoAutoSpellCheck (contributed by Ricardo Cardona),
//     sscoIgnoreWordsWithNumbers and sscoIgnoreSingleChars.
//   + New property: PenColor.
//   + Added support for Java documentation.
//
// 1.07
//   * Bug Fix: When spell checking the last word under certain conditions the
//     component would enter an infinite loop. Fixed.
//
// 1.06
//   * Bug Fix: When correcting words in OnCheckWord event the word would not be
//     replaced but added to the beginning of the old one. Fixed.
//   + New dictionary: Danish.
//   + New property: OpenDictionary.
//   + New option: sscoSelectWord.
//
// 1.05
//   + New events: OnCorrectWord and OnSkipWord.
//   + Demo added.
//
// 1.04
//   * Bug Fix: Would not compile under Delphi 6 due to duplicate resource
//     error. Fixed.
//   * GetDictionaryList() now searches for file that match the correct naming
//     scheme - name.major-minor-revision.dic, where major, minor and revision
//     are single characters.
//   + New dictionaries: Italian, Latin, Japanese, Polish, Spanish (Thanks to
//     Ricardo Cardona), and Turkish.
//   + New routines: CloseDictionary(), GetWordCount().
//   + New property: Dictionary.
//   - Removed {$IFDEF SYN_WIN32} directive from GetDictionaryList(). The
//     routines are available under Kylix also.
//   - Removed Version parameter from LoadDictionary.
//
// 1.03
//   + Added /usr/local/SynSpell dir under Linux as the default dictionary
//     directory.
//   + Added Language property.
//   + %ProgramFiles%\Common Files\SynSpell is now dynamically read from system
//     Registry.
//   + Added user dictionary.
//   + Added GetDictionaryList().
//
// 1.02
//   * Bug Fix: When the word list was cleared, the SoundEx list still hogged up
//     the memory =) Fixed.
//   * Bug Fix: When a word was deleted from the dictionary, the SoundEx hash
//     remained undeleted. Therefor, after deleting a word the whole SoundEx
//     hash list after the deleted word was wrong (1 up).
//   * Bug Fix: Suggestions were not passed in ASuggestions in OnCheckWord
//     event. Fixed.
//   * Bug Fix: DeleteSkipWord() fixed to delete form skip word list, not word
//     list ;-)
//   * Bug Fix: editor did not update when searching for words, the screen
//     would "blur". Fixed.
//   * GetSuggestions() changed from procedure to function to return number or
//     words in list.
//   * FWordList is now type of TList instead of TStringList.
//   + If no AAction is specified in the OnCheckWord event, then ACTION_SKIP is
//     default.
//   + Now double words are automatically ignored in FWordList.
//   + Added sscoSuggestWords option.
//   + Added OnAbort event.
//   + Added support for HTML Text.
//   - Removed unsupported options from Options property.
//
// 1.01
//   + Added Options property (support for selecting unknown words in editor,
//     spell checking from cursor, and spell checking only selection, hour glass
//     cursor during spell check, removing cursor visibility during spell
//     check).
//   + Added word suggestion list.
////////////////////////////////////////////////////////////////////////////////

unit SynSpellCheck;

{$i synedit.inc}

interface

uses
  Classes,
{$ifdef SYN_WIN32}
  Graphics,
  Windows,
{$endif}
{$ifdef SYN_CLX}
  QControls,
  QForms,
{$else}
  Controls,
  Forms,
{$endif}
{$ifdef SYN_DELPHI_6}
  StrUtils,
{$endif}
  SysUtils,
  SynEdit,
  SynEditHighlighter,
  SynEditMiscProcs,
  SynEditTypes,
  comctrls,
  SynSpellCheckMetaphone;

type
  THashLength    = 1..16;
  TSoundExLength = 1..8;

  TJHCMPLongintArray  = array of Longint;                                         //Fiala
  TJHCMPLongintMatrix = array of TJHCMPLongintArray;                             //Fiala

  TLanguageRec = record
    Name,
    Version: string;
  end;

  PWordRec = ^TWordRec;
  TWordRec = record
    Word,
    Hash : string;
    Value: Integer;
    User : Boolean;
  end;

  TSynEditEx = class(TCustomSynEdit)
  public
    function GetWordAtRowColEx(XY: TPoint; cIdentChars: TSynIdentChars;
      OverrideHighlighterChars: Boolean): string;
    function NextWordPosEx(cIdentChars, cWhiteChars: TSynIdentChars): TPoint; reintroduce;
    function PrevWordPosEx(cIdentChars, cWhiteChars: TSynIdentChars): TPoint; reintroduce;
    function WordEndEx(cWhiteChars: TSynIdentChars): TPoint; reintroduce;
    function WordStartEx(cWhiteChars: TSynIdentChars): TPoint; reintroduce;
  end;

  TMetaphone = class(TComponent)
  private
    LengthVar: Integer;
    sIn,
    sOut     : string;
    { Procedures }
    procedure SetLength(Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    { Procedures }
    procedure MetaPhone(A: string; lg: Integer; var Res: string);
    procedure Execute;
  published
    { Properties }
    property InString: string read sIn write sIn;
    property OutLength: Integer read LengthVar write SetLength default 20;
    property OutString: string read sOut write sOut;
  end;

  TSynSpellCheck  = class;
  TUnderlineStyle = (usCorelWordPerfect, usMicrosoftWord);

  TDrawAutoSpellCheckPlugin = class(TSynEditPlugin)
  private
    FPenColor      : TColor;
    FUnderlineStyle: TUnderlineStyle;
    { Procedures }
    procedure SetPenColor(const Value: TColor);
    procedure SetUnderlineStyle(const Value: TUnderlineStyle);
  protected
    FSynSpellCheck: TSynSpellCheck;
    { Procedures }
    procedure AfterPaint(ACanvas: TCanvas; const AClip: TRect; FirstLine,
      LastLine: Integer); override;
    procedure LinesInserted(FirstLine, Count: Integer); override;
    procedure LinesDeleted(FirstLine, Count: Integer); override;
  public
    constructor Create(AOwner: TCustomSynEdit);
    { Properties }
    property PenColor: TColor read FPenColor write SetPenColor default clRed;
    property UnderlineStyle: TUnderlineStyle read FUnderlineStyle
      write SetUnderlineStyle default usMicrosoftWord;
  end;

  { Procedure types }
  TOnAddWord = procedure(Sender: TObject; AWord: string) of object;
  TOnCheckWord = procedure(Sender: TObject; AWord: string;
    ASuggestions: TStringList; var ACorrectWord: string; var AAction: Integer;
    const AUndoEnabled: Boolean = True) of object;
  TOnCorrectWord = procedure(Sender: TObject; AWord, ACorrectWord: string)
    of object;
  TOnSkipWord = procedure(Sender: TObject; AWord: string; ASkipAll: Boolean)
    of object;

  { Sets }
  HashAlgorithms       = (haSoundEx, haMetaphone, haDiff);
  SynSpellCheckOptions = (
    sscoAutoSpellCheck,
    sscoGoUp,
    sscoHideCursor,
    sscoHourGlass,
    sscoIgnoreSingleChars,
    sscoIgnoreWordsWithNumbers,
    sscoMaintainCase,
    sscoSelectWord,
    sscoStartFromCursor,
    sscoSuggestWords,
    sscoTrimApostrophes
  );
  TSynSpellCheckOptions = set of SynSpellCheckOptions;

  TSynSpellCheck = class(TComponent)
  private
    FAnsi2Ascii        : array[128..255] of Char;
    FCacheArray        : array[0..255] of array [0..1] of Cardinal;
    FBusy,
    FModified,
    FOpenDictionary,
    FUseUserDictionary : Boolean;
    FHashAlgorithm     : HashAlgorithms;
    FMaxWordLength     : Integer;
    FApostrophes,
    FDictionary,
    FDictPath,
    FUserFileName,
    FUserDictPath      : string;
    FPenColor          : TColor;
    FCursor            : TCursor;
    FEditor            : TCustomSynEdit;
    FDrawAutoSpellCheck: TDrawAutoSpellCheckPlugin;
    FHashLength        : THashLength;
    FOnAddWord         : TOnAddWord;
    FLanguage          : TLanguageRec;
    FEditors,
    FPlugins,
    FWordList          : TList;
    FMetaphone         : TMetaphone;
    FOnAbort,
    FOnDictClose,
    FOnDictLoad,
    FOnDone,
    FOnStart           : TNotifyEvent;
    FOnCheckWord       : TOnCheckWord;
    FOnCorrectWord     : TOnCorrectWord;
    FOnSkipWord        : TOnSkipWord;
    FCheckAttribs,
    FSkipList          : TStringList;
    FOptions           : TSynSpellCheckOptions;
    FUnderlineStyle    : TUnderlineStyle;
    { Functions }
    function FindWord(sWord: string): Integer;
    function GetDefaultDictionaryDir: string;
    function GetDictionaryDir: string;
    function GetUserDictionaryDir: string;    
    // Compare table alocation
    // Compare str1 and str2 and Max1 and Max2 are their max lengths
    function JHCMPDiffCount(const Str1, Str2: string): Longint; overload;
    function JHCMPDiffCount(const Str1, Str2: string;
      Differences: TJHCMPLongintMatrix): Longint; overload;
    function JHCMPFindSimilar(const Word: string;
      const MaxDiffCount: Integer; const MaxDiffLength: Integer;
      Similar: TStrings): Integer;
    // Count number of differences str1 and str2 (case sensitive)
    function JHCMPIsSimilar(const Str1, Str2: string;
      const MaxDiffCount: Longint): Boolean; overload;
    function JHCMPIsSimilar(const Str1, Str2: string;
      const MaxDiffCount: Longint; Differences: TJHCMPLongintMatrix): Boolean;
      overload;
    { Procedures }
    procedure CalculateCacheArray;
    procedure InitializeAnsi2Ascii;                                             //Fiala
    procedure JHCMPInit(const Max1,Max2:longint;var Differences:TJHCMPLongintMatrix);
    procedure SetSkipList(Value: TStringList);
    procedure SortWordList;
    procedure SetApostrophes(const Value: string);
    procedure SetCheckAttribs(const Value: TStringList);
    procedure SetEditor(const Value: TCustomSynEdit);
    procedure SetHashAlgorithm(const Value: HashAlgorithms);
    procedure SetPenColor(const Value: TColor);
    procedure SetHashLength(const Value: THashLength);
    procedure SetUnderlineStyle(const Value: TUnderlineStyle);
  public
    FIdentChars,
    FWhiteChars: TSynIdentChars;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Functions }
    function AddEditor(AEditor: TCustomSynEdit): Integer;
    function Ansi2Ascii(const sString: string): string;
    function CheckWord(Word: string): Boolean;
    function DictionaryExists(Language: string;
  {$ifdef SYN_DELPHI_4_UP}
      Path: string = ''
  {$else}
      Path: string
  {$endif}
    ): Boolean;
    function GetNewestDictionary(Language: string): string;
    function GetSuggestions(Word: string; SuggestionList: TStringList): Integer;
    function GetWordCount: Integer;
    function GetWordFromASCIIWord(sWord: string): string;
    function IsDictWord(Word: string): Boolean;
    function IsSkipWord(Word: string): Boolean;
    function RemoveEditor(AEditor: TCustomSynEdit): Boolean;
    { Procedures }
    procedure AddDiacritic(Progress: TProgressBar);                             //Fiala
    procedure AddDictWord(Word: string);
    procedure AddDictWordList(WordList: TStringList);
    procedure AddSkipWord(Word: string);
    procedure AddSkipWordList(WordList: TStringList);
    procedure ClearDictWords;
    procedure ClearSkipWords;
    procedure CloseDictionary;
    procedure DeleteDictWord(Word: string);
    procedure DeleteSkipWord(Word: string);
    procedure FixLists;
    procedure GetDictionaryList(var tslList: TStringList);
    procedure LoadDictionary(Language: string;
  {$ifdef SYN_DELPHI_4_UP}
      FileName: string = ''
  {$else}
      FileName: string
  {$endif}
    );
    procedure LoadSkipList(FileName: string);
    procedure SaveSkipList(FileName: string);
    procedure SaveUserDictionary;
    procedure SelectWordAtCursor;
    procedure SpellCheck;
  published
    { Properties }
    property Algorithm: HashAlgorithms read FHashAlgorithm write SetHashAlgorithm default haDiff;
    property Apostrophes: string read FApostrophes write SetApostrophes;
    property Busy: Boolean read FBusy default False;
    property CheckAttribs: TStringList read FCheckAttribs write SetCheckAttribs;
    property Dictionary: string read FDictionary;
    property DictionaryPath: string read GetDictionaryDir write FDictPath;
    property Editor: TCustomSynEdit read FEditor write SetEditor;
    property HashLength: THashLength read FHashLength write SetHashLength
      default 4;
    property Language: TLanguageRec read FLanguage;
    property Modified: Boolean read FModified write FModified default False;
    property OpenDictionary: Boolean read FOpenDictionary;
    property Options: TSynSpellCheckOptions read FOptions write FOptions;
    property PenColor: TColor read FPenColor write SetPenColor default clRed;
    property SkipList: TStringList read FSkipList write SetSkipList;
    property UnderlineStyle: TUnderlineStyle read FUnderlineStyle
      write SetUnderlineStyle default usMicrosoftWord;
    property UserDirectory: string read GetUserDictionaryDir write FUserDictPath;
    property UseUserDictionary: Boolean read FUseUserDictionary write FUseUserDictionary default True;
    { Events }
    property OnAbort: TNotifyEvent read FOnAbort write FOnAbort;
    property OnAddWord: TOnAddWord read FOnAddWord write FOnAddWord;
    property OnCheckWord: TOnCheckWord read FOnCheckWord write FOnCheckWord;
    property OnCorrectWord: TOnCorrectWord read FOnCorrectWord
      write FOnCorrectWord;
    property OnDictClose: TNotifyEvent read FOnDictClose write FOnDictClose;
    property OnDictLoad: TNotifyEvent read FOnDictLoad write FOnDictLoad;
    property OnDone: TNotifyEvent read FOnDone write FOnDone;
    property OnSkipWord: TOnSkipWord read FOnSkipWord write FOnSkipWord;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
  end;

  ENoDictionaryLoaded = class(EExternal);
  resourcestring SNoDictionaryLoaded = 'No dictionary is loaded.';

{$ifndef SYN_DELPHI_6}
  // The following two functions are defined in StrUtils.pas in Delphi 6 and
  // later
  function DupeString(const AText: string; ACount: Integer): string;
  function SoundEx(const AText: string; ALength: TSoundExLength): string;
{$endif}
function ElfHash(const Value: string): Integer;
function TrimEx(const sWord: string; const chChar: Char): string;

const
  //////////////////////////////////////////////////////////////////////////////
  // Action constants
  //////////////////////////////////////////////////////////////////////////////
  ACTION_ABORT   = -1;
  ACTION_SKIP    = 0;
  ACTION_SKIPALL = 1;
  ACTION_CORRECT = 2;
  ACTION_ADD     = 3;
  ACTION_UNDO    = -2;

procedure Register;

implementation

{$ifndef SYN_DELPHI_6}
  // This is just a temporary escape I hope...
  //{$r *.dcr}
{$endif}

uses
  Math
{$ifdef SYN_WIN32}
  , Registry
{$endif};

procedure Register;
begin
  RegisterComponents('SynEdit', [TSynSpellCheck]);
end;

function ContainsNumbers(sWord: string): Boolean;
var
  iI: Integer;
begin
  Result := False;
  for iI := 1 to Length(sWord) do
    if sWord[iI] in ['1'..'9', '0'] then begin
      Result := True;
      Break;
    end;
end;

{$ifndef SYN_DELPHI_6}
function DupeString(const AText: string; ACount: Integer): string;
var
  P: PChar;
  C: Integer;
begin
  C := Length(AText);
  SetLength(Result, C * ACount);
  P := Pointer(Result);
  if P = nil then
    Exit;
  while ACount > 0 do begin
    Move(Pointer(AText)^, P^, C);
    Inc(P, C);
    Dec(ACount);
  end;
end;

function DirectoryExists(const Name: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Name));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

function ForceDirectories(Dir: string): Boolean;
resourcestring
  SCannotCreateDir = 'Unable to create directory';
begin
  Result := True;
  if Length(Dir) = 0 then
    raise Exception.CreateRes(@SCannotCreateDir);
  Dir := ExcludeTrailingBackslash(Dir);
  if (Length(Dir) < 3) or DirectoryExists(Dir)
    or (ExtractFilePath(Dir) = Dir) then Exit; // avoid 'xyz:\' problem.
  Result := ForceDirectories(ExtractFilePath(Dir)) and CreateDir(Dir);
end;
{$endif}

function ElfHash(const Value: string): Integer;
var
  iI, iJ: Integer;
begin
  Result := 0;
  for iI := 1 to Length(Value) do begin
    Result := (Result shl 4) + Ord(Value[iI]);
    iJ := Result and $F0000000;
    if (iJ <> 0) then
      Result := Result xor (iJ shr 24);
    Result := Result and (not iJ);
  end;
end;

procedure JHCMPMatrix(X, Y: Longint; var LongintMatrix: TJHCMPLongintMatrix);
var
  lI: longint;
begin
  SetLength(LongintMatrix, X);
  for lI := Low(LongintMatrix) to High(LongintMatrix) do
    SetLength(LongintMatrix[lI], Y);
end;

procedure JHCMPMatrixInit(var LongintMatrix: TJHCMPLongintMatrix);
var
  lI: Longint;
begin
  for lI := Low(LongintMatrix) to High(LongintMatrix) do
    LongintMatrix[lI][0] := lI;
  for lI := Low(LongintMatrix[0]) to High(LongintMatrix[0]) do
    LongintMatrix[0][lI] := lI;
end;

function JHCMPMin(A, B, C: Longint): Longint;
begin
  Result := Min(Min(A, B), C);
end;

{ TSynSpellCheck }

function TSynSpellCheck.GetDefaultDictionaryDir: string;
begin
{$ifdef SYN_WIN32}
  Result := 'C:\Program Files\Common Files\SynSpell\';
  with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion') then begin
        if ValueExists('CommonFilesDir') then
          Result := ReadString('CommonFilesDir') + '\SynSpell\';
        CloseKey;
      end;
    finally
      Free;
    end;
{$else}
  Result := '/usr/local/SynSpell/';
{$endif}
end;

function TSynSpellCheck.GetDictionaryDir: string;
begin
{$ifdef SYN_WIN32}
  if FDictPath <> '' then
    Result := IncludeTrailingBackslash(FDictPath)
  else
    Result := IncludeTrailingBackslash(GetDefaultDictionaryDir);
{$else}
  if FDictPath <> '' then
    Result := FDictPath
  else
    Result := Result := '/usr/local/SynSpell/';
{$endif}
end;

function TSynSpellCheck.GetUserDictionaryDir;
begin
{$ifdef SYN_WIN32}
  if FUserDictPath <> '' then
    Result := IncludeTrailingBackslash(FUserDictPath)
  else
    Result := IncludeTrailingBackslash(GetDefaultDictionaryDir);
{$else}
  if FUserDictPath <> '' then
    Result := FUserDictPath
  else
    Result := Result := '/usr/local/SynSpell/';
{$endif}
end;

function IsNumber(const PWord: PChar): Boolean;
var
  iI: Integer;
begin
  Result := True;
  for iI := 1 to StrLen(PWord) do
    if not ((PWord + iI)[1] in ['0'..'9']) then begin
      Result := False;
      Break;
    end;
end;

function SortFunc(Item1, Item2: Pointer): Integer;
begin
  Result := CompareStr(TWordRec(Item1^).Word, TWordRec(Item2^).Word)
end;

{$ifndef SYN_DELPHI_6}
function SoundEx(const AText: string; ALength: TSoundExLength): string;
const
  // This table gives the Soundex score for all characters upper- and lower-
  // case hence no need to convert.  This is faster than doing an UpCase on the
  // whole input string.  The 5 non characters in middle are just given 0.
  CSoundExTable: array[65..122] of ShortInt =
  // A  B  C  D  E  F  G  H   I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W   X  Y  Z
    (0, 1, 2, 3, 0, 1, 2, -1, 0, 2, 2, 4, 5, 5, 0, 1, 2, 6, 2, 3, 0, 1, -1, 2, 0, 2,
  // [  /  ]  ^  _  '
     0, 0, 0, 0, 0, 0,
  // a  b  c  d  e  f  g  h   i  j  k  l  m  n  o  p  q  r  s  t  u  v  w   x  y  z
     0, 1, 2, 3, 0, 1, 2, -1, 0, 2, 2, 4, 5, 5, 0, 1, 2, 6, 2, 3, 0, 1, -1, 2, 0, 2);

  function Score(AChar: Integer): Integer;
  begin
    Result := 0;
    if (AChar >= Low(CSoundExTable)) and (AChar <= High(CSoundExTable)) then
      Result := CSoundExTable[AChar];
  end;

var
  iI, LScore, LPrevScore: Integer;
begin
  Result := '';
  if AText <> '' then begin
    Result := Upcase(AText[1]);
    LPrevScore := Score(Ord(AText[1]));
    for iI := 2 to Length(AText) do begin
      LScore := Score(Ord(AText[iI]));
      if (LScore > 0) and (LScore <> LPrevScore) then begin
        Result := Result + IntToStr(LScore);
        if Length(Result) = ALength then
          Break;
      end;
      if LScore <> -1 then
        LPrevScore := LScore;
    end;
    if Length(Result) < ALength then
      Result := Copy(Result + DupeString('0', ALength), 1, ALength);
  end;
end;
{$endif}

function TrimEx(const sWord: string; const chChar: Char): string;
var
  iI, iLength: Integer;
begin
  iLength := Length(sWord);
  iI := 1;
  while (iI <= iLength) and (sWord[iI] <= chChar) do
    Inc(iI);
  if iI > iLength then
    Result := ''
  else begin
    while sWord[iLength] = chChar do
      Dec(iLength);
    Result := Copy(sWord, iI, iLength - iI + 1);
  end;
end;

{ TMetaphone }

constructor TMetaphone.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  LengthVar := 20; // Looks like a kinda nice value
end;

procedure TMetaphone.Execute;
begin
  if (sIn <> '') and (LengthVar > 0) then
    Metaphone(sIn, LengthVar, sOut)
  else
    sOut := '';
end;

procedure TMetaphone.SetLength(Value: Integer);
begin
  if (Value >= 1) and (Value <= 99) then
    LengthVar := Value;
end;

procedure TMetaphone.Metaphone(A: string; lg: Integer; var Res: string);
var
  iI: Integer;
begin
  for iI := 1 to lg do
    Res := Res + ' ';
  Res := SynSpellCheckMetaphone.Metaphone(PChar(a), lg);
end;

{ TDrawAutoSpellCheckPlugin }

constructor TDrawAutoSpellCheckPlugin.Create(AOwner: TCustomSynEdit);
begin
  inherited;
  FPenColor       := clRed;
  FUnderlineStyle := usMicrosoftWord;
end;

procedure TDrawAutoSpellCheckPlugin.AfterPaint(ACanvas: TCanvas; const AClip: TRect;
  FirstLine, LastLine: Integer);
var
  LH, CX     : Integer;
  CurrentWord: string;
  Editor     : TSynEdit;
  CurrentXY,
  TP         : TPoint;

  procedure PaintUnderLine;
  var
    MaxX,
    NewPoint,
    NewY: Integer;

    procedure DrawPoint;
    begin
      // Do not draw on gutter.
      // This happens when a word is underlined and part of it is "hidden" under
      // the gutter.
      if TP.X <= Editor.Gutter.RealGutterWidth(Editor.CharWidth) then
        Exit;
      with ACanvas do begin
        if NewY = TP.Y - 1 then
          Pen.Color := Editor.Color
        else
          Pen.Color := FPenColor;
        Pixels[TP.X, NewY] := Pen.Color;
      end;
    end;

  const
    // Microsoft Word style
//  MW_POINTS: array[0..6] of ShortInt = (1, 2, 2, 1, 0, 0, 0);
    MW_POINTS: array[0..3] of ShortInt = (0, 1, 2, 1);
    // Corel Word Perfect style
//  WP_POINTS: array[0..4] of ShortInt = (3, 2, 1, -1, -1);
    WP_POINTS: array[0..3] of ShortInt = (2, 1, 0, -1);

  begin
    Inc(TP.Y, LH - 3);
    NewPoint := 0;
    if FUnderlineStyle = usMicrosoftWord then
      NewY := TP.Y + MW_POINTS[NewPoint]
    else
      NewY := TP.Y + WP_POINTS[NewPoint];
    DrawPoint;
    MaxX := TP.X + ACanvas.TextWidth(CurrentWord);
    while TP.X <= MaxX do begin
      DrawPoint;
      Inc(NewPoint);
      if FUnderlineStyle = usMicrosoftWord then begin
        if NewPoint > High(MW_POINTS) then
          NewPoint := 0
      end else begin
        if NewPoint > High(WP_POINTS) then
          NewPoint := 0;
      end;
      DrawPoint;
      Inc(TP.X);
      if FUnderlineStyle = usMicrosoftWord then
        NewY := TP.Y + MW_POINTS[NewPoint]
      else
        NewY := TP.Y + WP_POINTS[NewPoint];
    end;
  end;

var
  sToken: string;
  Attri : TSynHighlighterAttributes;
begin
  if (not Assigned(FSynSpellCheck)) or (not Assigned(FSynSpellCheck.Editor)) or
    (not (sscoAutoSpellCheck in FSynSpellCheck.Options)) then
    Exit;
  Editor := TSynEdit(FSynSpellCheck.Editor);
  LH     := Editor.LineHeight;
  ACanvas.Font.Assign(Editor.Font);
  while FirstLine <= LastLine do begin
    // Paint "Bad Words"
    CX := 1;
    while CX < Length(Editor.Lines[FirstLine - 1]) do begin
      CurrentXY   := Point(CX, FirstLine);
      CurrentWord := TSynEditEx(Editor).GetWordAtRowColEx(CurrentXY, FSynSpellCheck.FIdentChars, True);
      TP := Editor.RowColumnToPixels(TDisplayCoord(CurrentXY));
      if TP.X > ACanvas.ClipRect.Right - ACanvas.ClipRect.Left then
        Break;
      if Assigned(Editor.Highlighter) then begin
        if Editor.GetHighlighterAttriAtRowCol(TBufferCoord(CurrentXY), sToken, Attri) = False then
          Attri := Editor.Highlighter.WhitespaceAttribute;
        if Assigned(Attri) and (FSynSpellCheck.FCheckAttribs.IndexOf(Attri.Name) <> -1) and
          (CurrentWord <> '') then
          if FSynSpellCheck.CheckWord(CurrentWord) = False then
            PaintUnderLine;
      end else if FSynSpellCheck.CheckWord(CurrentWord) = False then
        PaintUnderLine;
      Inc(CX, Length(CurrentWord));
      Inc(CX);
    end;
    Inc(FirstLine);
  end;
end;

procedure TDrawAutoSpellCheckPlugin.LinesDeleted(FirstLine, Count: Integer);
begin
  // This is only for the compiler hint
end;

procedure TDrawAutoSpellCheckPlugin.LinesInserted(FirstLine, Count: Integer);
begin
  // This is only for the compiler hint
end;

procedure TDrawAutoSpellCheckPlugin.SetPenColor(const Value: TColor);
begin
  if FPenColor <> Value then begin
    FPenColor := Value;
    if Editor <> nil then
      Editor.Repaint;
  end;
end;

procedure TDrawAutoSpellCheckPlugin.SetUnderlineStyle(
  const Value: TUnderlineStyle);
begin
  if FUnderlineStyle <> Value then begin
    FUnderlineStyle := Value;
    if Editor <> nil then
      Editor.Repaint;
  end;
end;

{ TSynSpellCheck }

constructor TSynSpellCheck.Create(AOwner: TComponent);
var
  iI: Integer;
begin
  inherited Create(AOwner);
  FPenColor := clRed;
  FBusy     := False;
  FModified := False;
  FHashAlgorithm  := haDiff;
  FHashLength     := 4;
  FMaxWordLength  := 0;
  FUnderlineStyle := usMicrosoftWord;
  FUseUserDictionary := True;
  FApostrophes := '''`´';
  //////////////////////////////////////////////////////////////////////////////
  // Lists
  //////////////////////////////////////////////////////////////////////////////
  FEditors  := TList.Create;
  FPlugins  := TList.Create;
  FWordList := TList.Create;
  FSkipList := TStringList.Create;
  FSkipList.Duplicates := dupIgnore;

  FCheckAttribs := TStringList.Create;
  with FCheckAttribs do begin
    Add('Comment');
    Add('Text');
    Add('String');
    Add('Documentation');
  end;
  SetApostrophes(FApostrophes); // Generate character set
  for iI := 1 to 255 do begin
    FCacheArray[iI][0] := 0;
    FCacheArray[iI][1] := 0;
  end;
  InitializeAnsi2Ascii;  
end;

destructor TSynSpellCheck.Destroy;
begin
  CloseDictionary;
  //////////////////////////////////////////////////////////////////////////////
  // Free used memory
  //////////////////////////////////////////////////////////////////////////////
  FCheckAttribs.Free;
  FEditors.Free;
  FMetaphone.Free;
  FPlugins.Free;
  FSkipList.Free;
  FWordList.Free;
  inherited;
end;

function TSynSpellCheck.Ansi2Ascii(const sString: string): string;
var
  iI: Integer;
begin
  Result := sString;
  for iI := 1 to Length(sString) do
    if Result[iI] > #127 then
      Result[iI] := FAnsi2Ascii[Ord(Result[iI])];
end;

function TSynSpellCheck.DictionaryExists(Language: string;
{$IFDEF SYN_DELPHI_4_UP}
  Path: string = ''
{$ELSE}
  Path: string
{$ENDIF}
): Boolean;
var
  sTemp : string;
  srTemp: TSearchRec;
begin
  if Trim(Path) = '' then
    sTemp := GetDictionaryDir // Search in shared dictionary directory
  else
    sTemp := Path;            // Search in user specified directory
  Result := (FindFirst(sTemp + Language + '.?-?-?.dic', faAnyFile, srTemp) = 0);
end;

function TSynSpellCheck.GetNewestDictionary(Language: string): string;
var
  srDict : TSearchRec;
  tslTemp: TStringList;
begin
  tslTemp := TStringList.Create;
  if FindFirst(GetDictionaryDir + Language + '.?-?-?.dic', faAnyFile,
    srDict) = 0 then begin
    if Pos('.user.', srDict.Name) = 0 then
      tslTemp.Add(AnsiLowerCase(srDict.Name));
    while FindNext(srDict) = 0 do begin
      if Pos('.user.', srDict.Name) = 0 then
        tslTemp.Add(AnsiLowerCase(srDict.Name));
    end;
  end;
  with tslTemp do begin
    if Count > 0 then begin
      Sort;
      Result := Strings[Count - 1];
    end;
    Free;
  end;
  SysUtils.FindClose(srDict);
end;

function TSynSpellCheck.GetWordCount: Integer;
begin
  Result := FWordList.Count;
end;

// Returns word from word without diacritic
function TSynSpellCheck.GetWordFromASCIIWord(sWord: string): string;
var
  iI, iJ, iLength: Integer;
  sLower, sTemp  : string;

  function CorrectCase(const AsWord: string; const Word: string): string;
  var
    s1, s2, s3, s4: string;
    iX: Integer;
  begin
    s1 := AnsiUpperCase(AsWord);
    s2 := AnsiLowerCase(AsWord);
    s3 := AnsiUpperCase(Word);
    s4 := AnsiLowerCase(Word);
    Result := Word;
    for iX := 1 to Length(Word) do begin
      if s1[iX] = AsWord[iX] then
        Result[iX] := s3[iX]
      else if s2[iX] = AsWord[iX] then
        Result[iX] := s4[iX];
    end;
  end;

begin
  // Are there any words at all starting with this letter?
  sLower := AnsiLowerCase(sWord);
  if FCacheArray[Ord(sLower[1])][1] = 0 then
    Exit;
  if FindWord(sLower) <> -1 then
    Exit;
  iLength := Length(sLower);
  for iI := FCacheArray[Ord(sLower[1])][0] to FCacheArray[Ord(sLower[1])][1] do begin
    sTemp := PWordRec(FWordList.Items[iI])^.Word;
    if iLength = Length(sTemp) then begin
      // Remove diacritic in dictionary and try find word
      if Ansi2Ascii(sTemp) = sLower then begin
        Result := CorrectCase(sWord, sTemp);
        Exit;
      end;
    end;
  end;

  // Not found in base, first char has diacritic, we must continue search
  for iI := 128 to 254 do begin
    // Some optimalization
    if FAnsi2Ascii[iI] = sLower[1] then
      for iJ := FCacheArray[iI][0] to FCacheArray[iI][1] do begin
        sTemp := PWordRec(FWordList.Items[iJ])^.Word;
        if iLength = Length(sTemp) then
          // Remove diacritic in dictionary and try find word
          if Ansi2Ascii(sTemp) = sLower then begin
            Result := CorrectCase(sWord, sTemp);
            Exit;
          end;
      end;
   end;
end;

procedure TSynSpellCheck.InitializeAnsi2Ascii;
begin
  FAnsi2Ascii[128] := #128;
  FAnsi2Ascii[129] := #129;
  FAnsi2Ascii[130] := #130;
  FAnsi2Ascii[131] := #131;
  FAnsi2Ascii[132] := #132;
  FAnsi2Ascii[133] := #133;
  FAnsi2Ascii[134] := #134;
  FAnsi2Ascii[135] := #135;
  FAnsi2Ascii[136] := #136;
  FAnsi2Ascii[137] := #137;
  FAnsi2Ascii[138] := #083;
  FAnsi2Ascii[139] := #139;
  FAnsi2Ascii[140] := #083;
  FAnsi2Ascii[141] := #084;
  FAnsi2Ascii[142] := #090;
  FAnsi2Ascii[143] := #090;
  FAnsi2Ascii[144] := #144;
  FAnsi2Ascii[145] := #145;
  FAnsi2Ascii[146] := #146;
  FAnsi2Ascii[147] := #147;
  FAnsi2Ascii[148] := #148;
  FAnsi2Ascii[149] := #149;
  FAnsi2Ascii[150] := #150;
  FAnsi2Ascii[151] := #151;
  FAnsi2Ascii[152] := #152;
  FAnsi2Ascii[153] := #153;
  FAnsi2Ascii[154] := #115;
  FAnsi2Ascii[155] := #155;
  FAnsi2Ascii[156] := #115;
  FAnsi2Ascii[157] := #116;
  FAnsi2Ascii[158] := #122;
  FAnsi2Ascii[159] := #122;
  FAnsi2Ascii[160] := #32;
  FAnsi2Ascii[161] := #161;
  FAnsi2Ascii[162] := #162;
  FAnsi2Ascii[163] := #076;
  FAnsi2Ascii[164] := #164;
  FAnsi2Ascii[165] := #065;
  FAnsi2Ascii[166] := #166;
  FAnsi2Ascii[167] := #167;
  FAnsi2Ascii[168] := #168;
  FAnsi2Ascii[169] := #169;
  FAnsi2Ascii[170] := #083;
  FAnsi2Ascii[171] := #171;
  FAnsi2Ascii[172] := #172;
  FAnsi2Ascii[173] := #173;
  FAnsi2Ascii[174] := #174;
  FAnsi2Ascii[175] := #090;
  FAnsi2Ascii[176] := #176;
  FAnsi2Ascii[177] := #177;
  FAnsi2Ascii[178] := #178;
  FAnsi2Ascii[179] := #179;
  FAnsi2Ascii[180] := #180;
  FAnsi2Ascii[181] := #181;
  FAnsi2Ascii[182] := #182;
  FAnsi2Ascii[183] := #183;
  FAnsi2Ascii[184] := #184;
  FAnsi2Ascii[185] := #097;
  FAnsi2Ascii[186] := #115;
  FAnsi2Ascii[187] := #187;
  FAnsi2Ascii[188] := #076;
  FAnsi2Ascii[189] := #189;
  FAnsi2Ascii[190] := #108;
  FAnsi2Ascii[191] := #122;
  FAnsi2Ascii[192] := #082;
  FAnsi2Ascii[193] := #065;
  FAnsi2Ascii[194] := #065;
  FAnsi2Ascii[195] := #065;
  FAnsi2Ascii[196] := #065;
  FAnsi2Ascii[197] := #076;
  FAnsi2Ascii[198] := #067;
  FAnsi2Ascii[199] := #067;
  FAnsi2Ascii[200] := #067;
  FAnsi2Ascii[201] := #069;
  FAnsi2Ascii[202] := #069;
  FAnsi2Ascii[203] := #069;
  FAnsi2Ascii[204] := #069;
  FAnsi2Ascii[205] := #073;
  FAnsi2Ascii[206] := #073;
  FAnsi2Ascii[207] := #068;
  FAnsi2Ascii[208] := #068;
  FAnsi2Ascii[209] := #078;
  FAnsi2Ascii[210] := #078;
  FAnsi2Ascii[211] := #079;
  FAnsi2Ascii[212] := #079;
  FAnsi2Ascii[213] := #079;
  FAnsi2Ascii[214] := #079;
  FAnsi2Ascii[215] := #215;
  FAnsi2Ascii[216] := #082;
  FAnsi2Ascii[217] := #085;
  FAnsi2Ascii[218] := #085;
  FAnsi2Ascii[219] := #085;
  FAnsi2Ascii[220] := #085;
  FAnsi2Ascii[221] := #089;
  FAnsi2Ascii[222] := #084;
  FAnsi2Ascii[223] := #223;
  FAnsi2Ascii[224] := #114;
  FAnsi2Ascii[225] := #097;
  FAnsi2Ascii[226] := #097;
  FAnsi2Ascii[227] := #097;
  FAnsi2Ascii[228] := #097;
  FAnsi2Ascii[229] := #108;
  FAnsi2Ascii[230] := #099;
  FAnsi2Ascii[231] := #099;
  FAnsi2Ascii[232] := #099;
  FAnsi2Ascii[233] := #101;
  FAnsi2Ascii[234] := #101;
  FAnsi2Ascii[235] := #101;
  FAnsi2Ascii[236] := #101;
  FAnsi2Ascii[237] := #105;
  FAnsi2Ascii[238] := #105;
  FAnsi2Ascii[239] := #100;
  FAnsi2Ascii[240] := #100;
  FAnsi2Ascii[241] := #110;
  FAnsi2Ascii[242] := #110;
  FAnsi2Ascii[243] := #111;
  FAnsi2Ascii[244] := #111;
  FAnsi2Ascii[245] := #111;
  FAnsi2Ascii[246] := #111;
  FAnsi2Ascii[247] := #247;
  FAnsi2Ascii[248] := #114;
  FAnsi2Ascii[249] := #117;
  FAnsi2Ascii[250] := #117;
  FAnsi2Ascii[251] := #117;
  FAnsi2Ascii[252] := #117;
  FAnsi2Ascii[253] := #121;
  FAnsi2Ascii[254] := #116;
  FAnsi2Ascii[255] := #255;
end;

function TSynSpellCheck.JHCMPDiffCount(const Str1, Str2: string;
  Differences: TJHCMPLongintMatrix): Longint;
var
  I1, I2,
  Length1,
  Length2 : Longint;
begin
  Length1 := Length(Str1);
  Length2 := Length(Str2);
  for I1 := 1 to Length1 do 
    for I2 := 1 to Length2 do
      if Str1[I1] = Str2[I2] then
        Differences[I1][I2] := Differences[I1 - 1][I2 - 1]
      else
        Differences[I1][I2] := JHCMPMin(Differences[I1 - 1][I2], Differences[I1][I2 - 1], Differences[I1 - 1][I2 - 1]) + 1;
  Result := Differences[Length1][Length2];
end;

function TSynSpellCheck.JHCMPDiffCount(const Str1,
  Str2: string): longint;
var Differences:TJHCMPLongintMatrix;
begin
  JHCMPInit(length(Str1),length(Str2),Differences);
  Result := JHCMPDiffCount(Str1,Str2,Differences);
end;

procedure TSynSpellCheck.JHCMPInit(const Max1, Max2: Integer;
  var Differences: TJHCMPLongintMatrix);
begin
  JHCMPMatrix(Max1 + 1, Max2 + 1, Differences);
  JHCMPMatrixInit(Differences);
end;

function TSynSpellCheck.JHCMPIsSimilar(const Str1, Str2: string;
  const MaxDiffCount: Integer; Differences: TJHCMPLongintMatrix): boolean;
begin
  Result := (JHCMPDiffCount(Str1, Str2, Differences) <= MaxDiffCount);
end;

function TSynSpellCheck.JHCMPIsSimilar(const Str1, Str2: string;
  const MaxDiffCount: Integer): Boolean;
var
  Differences: TJHCMPLongintMatrix;
begin
  JHCMPInit(Length(Str1), Length(Str2), Differences);
  Result := JHCMPIsSimilar(Str1, Str2, MaxDiffCount, Differences);
end;

procedure TSynSpellCheck.AddDictWord(Word: string);
var
  AWordItem: PWordRec;

  { Return list position for insert new word }
  function GetInsertPos(const Word: string): Integer;
  var
    iI: Integer;
  begin
    Result := -1;
    // If not any words at all starting with this letter, we find next word
    if FCacheArray[Ord(Word[1])][1] = 0 then begin
      for iI := Ord(Word[1]) + 1 to 255 do
        if FCacheArray[iI][1] <> 0 then begin
          Result := FCacheArray[iI][0];
          Break;
        end;
    end else
      // Words with this letter exists, we find right pos
      for iI := FCacheArray[Ord(Word[1])][0] to Succ(FCacheArray[Ord(Word[1])][1]) do
        if PWordRec(FWordList.Items[iI])^.Word > Word then begin
          Result := iI;
          Break;
        end;
  end;

begin
  if Trim(Word) = '' then
    Exit;
  Word := AnsiLowerCase(Word);
  if FindWord(Word) = -1 then begin
    New(AWordItem);
    FMaxWordLength := Max(FMaxWordLength, Length(Word));
    AWordItem^.Word  := Word;
    AWordItem^.User  := True;
    AWordItem^.Value := ElfHash(Word);
    if FHashAlgorithm <> haDiff then begin
      if FHashAlgorithm = haSoundEx then
        AWordItem^.Hash := SoundEx(Word, FHashLength)
      else
        AWordItem^.Hash := MetaPhone(PChar(Word), FHashLength);
    end;
    // Quickest way is insert one word than add and than sort whole list
    FWordList.Insert(GetInsertPos(Word), AWordItem);
    CalculateCacheArray; // Calculate cache array to speed up searches
    FModified := True;
    if Assigned(FOnAddWord) then
      FOnAddWord(Self, Word);
  end;
end;

procedure TSynSpellCheck.AddDictWordList(WordList: TStringList);
var
  iI: Integer;
begin
  for iI := 0 to WordList.Count - 1 do
    AddDictWord(WordList.Strings[iI]);
end;

function TSynSpellCheck.AddEditor(AEditor: TCustomSynEdit): integer;
var
  iI    : Integer;
  Plugin: TDrawAutoSpellCheckPlugin;
begin
  // Adds an Editor and returns its index in the list
  Result := -1;
  if AEditor <> nil then begin
    iI := FEditors.IndexOf(AEditor);
    if iI = -1 then begin
      Plugin := TDrawAutoSpellCheckPlugin.Create(AEditor);
      with Plugin do begin
        FSynSpellCheck := Self;
        PenColor       := Self.FPenColor;
        UnderlineStyle := Self.FUnderlineStyle;
      end;
      iI := FEditors.Add(AEditor);
      FPlugIns.Add(Plugin);
      Result := iI;
    end else
      Result := iI;
  end;
end;

procedure TSynSpellCheck.AddSkipWord(Word: string);
begin
  if Trim(Word) <> '' then
    FSkipList.Add(AnsiLowerCase(Word));
end;

procedure TSynSpellCheck.AddSkipWordList(WordList: TStringList);
var
  iI: Integer;
begin
  for iI := 0 to WordList.Count - 1 do
    AddSkipWord(WordList.Strings[iI]);
end;

procedure TSynSpellCheck.CalculateCacheArray;
var
  chOld,
  chNew: Char;
  iI   : Integer;
begin
  if FWordList.Count = 0 then
    Exit;

  chOld := TWordRec(FWordList.Items[0]^).Word[1];
  chNew := chOld;
  FCacheArray[Ord(chOld)][0] := 0;                                              //Fiala
  FCacheArray[Ord(chOld)][1] := 0;                                              //Fiala
  for iI := 0 to FWordList.Count - 1 do
    if chOld <> TWordRec(FWordList.Items[iI]^).Word[1] then begin
      chNew := TWordRec(FWordList.Items[iI]^).Word[1];
      FCacheArray[Ord(chOld)][1] := iI - 1; // Last occurence of previous letter
      FCacheArray[Ord(chNew)][0] := iI;     // First occurence of new letter
      chOld := chNew;
    end;
  // Last occurence of last letter
  FCacheArray[Ord(chNew)][1] := FWordList.Count - 1;
end;

function TSynSpellCheck.CheckWord(Word: string): Boolean;
var
  iI: Integer;
begin
  Word := Trim(Word);
  if (Word = '') or (sscoIgnoreSingleChars in FOptions) and (Length(Word) = 1) then begin
    Result := True;
    Exit;
  end;
  // It's quicker to check before checking word list
  if sscoIgnoreWordsWithNumbers in FOptions then
    for iI := 1 to Length(Word) do
      if Word[iI] in ['0'..'9'] then begin
        Result := True;
        Exit;
      end;

  //////////////////////////////////////////////////////////////////////////////
  // Check if word consists only of dashes or apostrophes. Quite often these
  // are used when dividing sections in ASCII text files.
  //////////////////////////////////////////////////////////////////////////////
  if (TrimEx(Word, '-') = '') or (TrimEx(Word, '''') = '') then begin
    Result := True;
    Exit;
  end;

  if sscoTrimApostrophes in FOptions then
    Word := TrimEx(Word, ''''); // Trim apostrophes
  //////////////////////////////////////////////////////////////////////////////
  // Main Searching Routine
  //////////////////////////////////////////////////////////////////////////////
  Result := (FindWord(AnsiLowerCase(Word)) > -1);
  if not Result and (FSkipList.IndexOf(AnsiLowerCase(Word)) <> -1) then
    Result := True;
end;

procedure TSynSpellCheck.ClearDictWords;
var
  iI       : Integer;
  AWordItem: PWordRec;
begin
  for iI := 0 to FWordList.Count - 1 do begin
    AWordItem := FWordList.Items[iI];                                           //Fiala
    Dispose(AWordItem);                                                         //Fiala
  end;
  FWordList.Clear;
end;

procedure TSynSpellCheck.ClearSkipWords;
begin
  FSkipList.Clear;
end;

procedure TSynSpellCheck.CloseDictionary;
var
  iI       : Integer;
begin
  for iI := 0 to 255 do begin
    FCacheArray[iI][0] := 0;
    FCacheArray[iI][1] := 0;
  end;
  ClearDictWords;
  FSkipList.Clear;
  FOpenDictionary := False;
  if Assigned(FOnDictClose) then
    FOnDictClose(Self);
end;

procedure TSynSpellCheck.DeleteDictWord(Word: string);
begin
  Dispose(PWordRec(FWordList.Items[FindWord(AnsiLowerCase(Word))]^));
end;

procedure TSynSpellCheck.DeleteSkipWord(Word: string);
begin
  with FSkipList do
    Delete(IndexOf(AnsiLowerCase(Word)));
end;

function TSynSpellCheck.IsDictWord(Word: string): Boolean;
begin
  Result := (FindWord(AnsiLowerCase(Word)) <> -1);
end;

function TSynSpellCheck.IsSkipWord(Word: string): Boolean;
begin
  Result := (FSkipList.IndexOf(AnsiLowerCase(Word)) <> -1);
end;

procedure TSynSpellCheck.FixLists;
var
  iI: Integer;
begin
  for iI := 0 to FSkipList.Count - 1 do
    FSkipList.Strings[iI] := AnsiLowerCase(FSkipList.Strings[iI]);
end;

procedure TSynSpellCheck.GetDictionaryList(var tslList: TStringList);
var
  srDics: TSearchRec;

  procedure AddDictionary;
  var
    sLanguage: string;
  begin
    sLanguage := Copy(srDics.Name, 1, Pos('.', srDics.Name) - 1);
    if (tslList.IndexOf(sLanguage) = -1) and (Pos('.user.', srDics.Name) = 0) then
      tslList.Add(sLanguage);
  end;

var
  iI: Integer;
begin
  if FindFirst(GetDictionaryDir + '*.?-?-?.dic', faAnyFile, srDics) = 0 then begin
    AddDictionary;
    while FindNext(srDics) = 0 do
      AddDictionary;
  end;
  SysUtils.FindClose(srDics);
  for iI := 0 to tslList.Count - 1 do
    tslList.Strings[iI] := UpCase(tslList.Strings[iI][1]) +
      Copy(tslList.Strings[iI], 2, Length(tslList.Strings[iI]));
  tslList.Sort;
end;

function TSynSpellCheck.GetSuggestions(Word: string;
  SuggestionList: TStringList): Integer;
var
  iI,
  iLength: Integer;
  sHash,
  sWord  : string;
begin
  Result := 0;
  if not (sscoSuggestWords in FOptions) then
    Exit;
  if Assigned(SuggestionList) then begin
    ////////////////////////////////////////////////////////////////////////////
    // Select algorithm
    ////////////////////////////////////////////////////////////////////////////
    if FHashAlgorithm = haSoundEx then
      sHash := SoundEx(Word, FHashLength)
    else if FHashAlgorithm = haMetaphone then 
      sHash := MetaPhone(PChar(Word), FHashLength);
    iLength := Length(Word);
    for iI := 0 to FWordList.Count - 1 do
      if (TWordRec(FWordList.Items[iI]^).Hash = sHash) and (Abs(iLength - Length(TWordRec(FWordList.Items[iI]^).Word)) < 2) then begin
        sWord := TWordRec(FWordList.Items[iI]^).Word;
        if sscoMaintainCase in FOptions then begin
          //////////////////////////////////////////////////////////////////////
          // Maintain case for uppercase and capitalized words.
          //////////////////////////////////////////////////////////////////////
          if AnsiUpperCase(Word) = Word then
            sWord := AnsiUpperCase(sWord)
          else if AnsiUpperCase(sWord[1])[1] = Word[1] then
            sWord[1] := AnsiUpperCase(sWord[1])[1];
        end;
        SuggestionList.Add(sWord);
      end;
    Result := SuggestionList.Count;
  end;
end;

function TSynSpellCheck.JHCMPFindSimilar(const Word: string;
  const MaxDiffCount: Integer; const MaxDiffLength: Integer;
  Similar: TStrings): Integer;
var
  chFirst    : Char;
  iI, iJ,
  iLength    : Integer;
  sLower,
  sWord      : string;
  Differences: TJHCMPLongintMatrix;
begin
  Result := 0;
  if Trim(Word) = '' then
    Exit;
  sLower := AnsiLowerCase(Word);
  chFirst := Ansi2Ascii(sLower[1])[1];
  Similar.Clear;
  JHCMPInit(Length(Word), FMaxWordLength, Differences);

  iLength := Length(Word);
  for iI := FCacheArray[Ord(chFirst)][0] to FCacheArray[Ord(chFirst)][1] do begin
    sWord := PWordRec(FWordList.Items[iI])^.Word;
    if Abs(iLength - Length(sWord)) > MaxDiffLength then
      Continue;
    if JHCMPIsSimilar(sLower, sWord, MaxDiffCount, Differences) then begin
      if AnsiUpperCase(Word) = Word then
        sWord := AnsiUpperCase(sWord)
      else if AnsiUpperCase(Word[1])[1] = Word[1] then
        sWord[1] := AnsiUpperCase(sWord[1])[1];
      Similar.Add(sWord);
    end;
  end;

  // Not found in base, first char has diacritic, we must continue search
  for iJ := 128 to 254 do
    // Some optimalizations
    if (FAnsi2Ascii[iJ] = chFirst) and (FCacheArray[iJ][1] > 0) then
      for iI := FCacheArray[iJ][0] to FCacheArray[iJ][1] do begin
        sWord := PWordRec(FWordList.Items[iI])^.Word;
        if Abs(iLength - Length(sWord)) > MaxDiffCount then
          Continue;
        if JHCMPIsSimilar(sLower, sWord, MaxDiffCount, Differences) then begin
          if AnsiUpperCase(Word) = Word then
            sWord := AnsiUpperCase(sWord)
          else if AnsiUpperCase(Word[1])[1] = Word[1] then
            sWord[1] := AnsiUpperCase(sWord[1])[1];
          Similar.Add(sWord);
        end;
      end;

  Result := Similar.Count;
end;

procedure TSynSpellCheck.LoadDictionary(Language: string;
{$IFDEF SYN_DELPHI_4_UP}
  FileName: string = ''
{$ELSE}
  FileName: string
{$ENDIF}
);
var
  AWordItem: PWordRec;
  sLine,
  sName    : string;
  fOut     : TextFile;

  procedure AddNewWord(sWord: string; IsUser: Boolean);
  begin
      New(AWordItem);
      with AWordItem^ do begin
        Word := sWord;
        User := IsUser;
      end;
      if (sscoSuggestWords in FOptions) and (FHashAlgorithm <> haDiff) then begin
        if FHashAlgorithm <> haDiff then begin
          if FHashAlgorithm = haSoundEx then
            AWordItem^.Hash := SoundEx(sWord, FHashLength)
          else
            AWordItem^.Hash := MetaPhone(PChar(sWord), FHashLength);
        end;
      end;
      FWordList.Add(AWordItem);
  end;

begin
  FMaxWordLength := 0;
  if Trim(FileName) = '' then begin
    sName       := GetDictionaryDir + GetNewestDictionary(Language);
    FDictionary := Language;
  end else begin
    sName       := FileName;
    FDictionary := FileName;
  end;
  AssignFile(fOut, sName);
  Reset(fOut);
  while not Eof(fOut) do begin
    ReadLn(fOut, sLine);
    if Trim(sLine) <> '' then begin
      FMaxWordLength := Max(FMaxWordLength, Length(sLine));
      AddNewWord(sLine, False);
    end;
  end;
  CloseFile(fOut);
  sName := ExtractFileName(sName);
  with FLanguage do begin
    Name    := Copy(sName, 1, Pos('.', sName) - 1);
    Version := Copy(sName, Pos('.', sName) + 1, 5);
  end;
  FUserFileName := FLanguage.Name + '.user.dic';
  //////////////////////////////////////////////////////////////////////////////
  // Load user's dictionary if present
  //////////////////////////////////////////////////////////////////////////////
  FModified := False;
  if FUseUserDictionary then begin
    if FUserDictPath = '' then
      FUserDictPath := GetUserDictionaryDir;
    sName := IncludeTrailingBackslash(FUserDictPath) + FUserFileName;
    if FileExists(sName) then begin
      AssignFile(fOut, sName);
      Reset(fOut);
      while not Eof(fOut) do begin
        ReadLn(fOut, sLine);
        FMaxWordLength := Max(FMaxWordLength, Length(sLine));
        if Trim(sLine) <> '' then
          AddNewWord(sLine, True);
      end;
      CloseFile(fOut);
      FModified := False;
    end;
  end;

  SortWordList;        // Sort the whole word list
  CalculateCacheArray; // Calculate cache array to speed up searches
  FOpenDictionary := True;
  if (sscoAutoSpellCheck in FOptions) and (Assigned(FEditor)) then
    FEditor.Invalidate;
  if Assigned(FOnDictLoad) then
    FOnDictLoad(Self);
end;

function TSynSpellCheck.FindWord(sWord: string): Integer;
{var
  iI, iHash: Integer;
begin
  Result := -1;
  // Are there any words at all starting with this letter?
  if FCacheArray[Ord(sWord[1])][1] = 0 then
    Exit;

  iHash := ElfHash(sWord);
  for iI := FCacheArray[Ord(sWord[1])][0] to FCacheArray[Ord(sWord[1])][1] do
    if PWordRec(FWordList.Items[iI])^.Value = iHash then begin
//    if CompareStr(PWordRec(FWordList.Items[iI])^.Word, sWord) = 0 then begin
      Result := iI;
      Exit;
    end;}
var
  L, H, I, C: Integer;
begin
  Result := -1;
  // Are there any words at all starting with this letter?
  if FCacheArray[Ord(sWord[1])][1] = 0 then                                     //Fiala
    Exit;
  L := FCacheArray[Ord(sWord[1])][0];
  H := FCacheArray[Ord(sWord[1])][1];
  while L <= H do
  begin
    I := (L + H) shr 1;
    { here must be CompareStr not AnsiCompareStr, because dictionary is ASCII sorted }
    C := CompareStr(PWordRec(FWordList.Items[I])^.Word, sWord);
    if C < 0 then
      L := I + 1
    else begin
      H := I - 1;
      if C = 0 then
        Result := I;
    end;
  end;
end;

procedure TSynSpellCheck.LoadSkipList(FileName: string);
begin
  if FileExists(FileName) then 
    FSkipList.LoadFromFile(FileName);
end;

function TSynSpellCheck.RemoveEditor(AEditor: TCustomSynEdit): Boolean;
var
  iI: Integer;
begin
  Result := False;
  if AEditor <> nil then begin
    iI := FEditors.IndexOf(AEditor);
    if iI > -1 then begin
      if FEditor = AEditor then begin
        FEditor             := nil;
        FDrawAutoSpellCheck := nil;
      end;
      FEditors.Delete(iI);
      FPlugIns.Delete(iI);
      Result := True;
    end;
  end;
end;

procedure TSynSpellCheck.SaveSkipList(FileName: string);
var
  iI: Integer;
begin
  for iI := 0 to FSkipList.Count -1 do
    if Trim(FSkipList.Strings[iI]) = '' then
      FSkipList.Delete(iI); 
  FSkipList.SaveToFile(FileName);
end;

procedure TSynSpellCheck.SaveUserDictionary;
var
  iI : Integer;
  fIn: TextFile;
begin
  if not DirectoryExists(ExtractFileDir(FUserDictPath)) then
    if not ForceDirectories(ExtractFileDir(FUserDictPath)) then
      Exit;
  AssignFile(fIn, IncludeTrailingBackslash(FUserDictPath) + FUserFileName);
  Rewrite(fIn);
  for iI := 0 to FWordList.Count - 1 do
    if TWordRec(FWordList.Items[iI]^).User then
      WriteLn(fIn, TWordRec(FWordList.Items[iI]^).Word);
  CloseFile(fIn);
  FModified := False;
end;

procedure TSynSpellCheck.SelectWordAtCursor;
begin
  if FEditor = nil then
    Exit;
  with TSynEditEx(FEditor) do begin
    BlockBegin := TBufferCoord(WordStartEx(FWhiteChars));
    BlockEnd   := TBufferCoord(WordEndEx(FWhiteChars));
  end;
end;

procedure TSynSpellCheck.SetCheckAttribs(const Value: TStringList);
begin
  FCheckAttribs.Assign(Value);
end;

procedure TSynSpellCheck.SetEditor(const Value: TCustomSynEdit);
var
  iI: Integer;
begin
  if Value <> FEditor then begin
    iI := AddEditor(Value);
    if iI > -1 then begin
      FEditor := FEditors[iI];
      FDrawAutoSpellCheck := FPlugIns[iI];
      with FDrawAutoSpellCheck do begin
        FSynSpellCheck := Self;
        PenColor       := Self.FPenColor;
      end;
    end else begin
      FEditor             := nil;
      FDrawAutoSpellCheck := nil;
    end;
  end;
end;

procedure TSynSpellCheck.SetHashAlgorithm(const Value: HashAlgorithms);
var
  iI       : Integer;
  AWordItem: PWordRec;
begin
  if Value <> FHashAlgorithm then begin
    FHashAlgorithm := Value;
    if FWordList.Count > 0 then
      for iI := 0 to FWordList.Count - 1 do begin
        AWordItem := FWordList.Items[iI];
        if FHashAlgorithm = haSoundEx then
          AWordItem^.Hash := SoundEx(AWordItem^.Word, FHashLength)
        else
          AWordItem^.Hash := MetaPhone(PChar(AWordItem^.Word), FHashLength);
      end;
  end;
end;

procedure TSynSpellCheck.SetHashLength(const Value: THashLength);
var
  iI       : Integer;
  AWordItem: PWordRec;
begin
  if FHashLength <> Value then begin
    ////////////////////////////////////////////////////////////////////////////
    // Soundex hashes are supported up to 8 characters long.
    ////////////////////////////////////////////////////////////////////////////
    if (FHashLength > 8) and (FHashAlgorithm = haMetaphone) then
      FHashLength := 8;
    FHashLength := Value;
    if FWordList.Count > 0 then
      for iI := 0 to FWordList.Count - 1 do begin
        AWordItem := FWordList.Items[iI];
        if FHashAlgorithm = haSoundEx then
          AWordItem^.Hash := SoundEx(AWordItem^.Word, FHashLength)
        else
          AWordItem^.Hash := MetaPhone(PChar(AWordItem^.Word), FHashLength);
      end;
  end;
end;

procedure TSynSpellCheck.SetPenColor(const Value: TColor);
begin
  FPenColor := Value;
  if FDrawAutoSpellCheck <> nil then
    FDrawAutoSpellCheck.PenColor := Value;
end;

procedure TSynSpellCheck.SetSkipList(Value: TStringList);
begin
  SkipList.Assign(Value);
end;

procedure TSynSpellCheck.SetUnderlineStyle(const Value: TUnderlineStyle);
begin
  FUnderlineStyle := Value;
  if FDrawAutoSpellCheck <> nil then
    FDrawAutoSpellCheck.UnderlineStyle := Value;
end;

procedure TSynSpellCheck.SortWordList;
begin
  FWordList.Sort(SortFunc);
end;

procedure TSynSpellCheck.SpellCheck;
var
  bAborted,
  bUndoEnabled  : Boolean;
  sToken,
  sWord         : string;
  pLastWord,
  pNextWord     : TPoint;
  tslSuggestions: TStringList;
  Attri         : TSynHighlighterAttributes;

  function InternalCheckWord(Word: string): Boolean;
  var
    iAction     : Integer;
    sCorrectWord: string;
  begin
    Result := True;
    if not CheckWord(AnsiLowerCase(Word)) then begin
      if sscoHideCursor in FOptions then
        FEditor.EndUpdate;
      with FEditor do begin
        Update;
        EnsureCursorPosVisible;
      end;
      if sscoHourGlass in FOptions then
        Screen.Cursor := FCursor;
      if Assigned(FOnCheckWord) then begin
        // Get suggestions
        if sscoSuggestWords in FOptions then
          if FHashAlgorithm = haDiff then 
            JHCMPFindSimilar(Word, 2, 2, tslSuggestions)
          else
            GetSuggestions(Word, tslSuggestions);
        if sscoSelectWord in FOptions then
          SelectWordAtCursor;
        FOnCheckWord(Self, Word, tslSuggestions, sCorrectWord, iAction);
        tslSuggestions.Clear; // Remove items to free some memory
        case iAction of
          ACTION_ABORT: begin
            Result   := False;
            bAborted := True;
            with FEditor do begin
              BlockBegin := CaretXY;
              BlockEnd   := BlockBegin;
            end;
          end;
          ACTION_ADD: AddDictWord(sWord);
          ACTION_CORRECT: begin
            SelectWordAtCursor;
            TSynEditEx(FEditor).SelText := sCorrectWord;
            if Assigned(FOnCorrectWord) then
              FOnCorrectWord(Self, sWord, sCorrectWord);
          end;
          ACTION_SKIPALL: begin
            AddSkipWord(sWord);
            if Assigned(FOnSkipWord) then
              FOnSkipWord(Self, sWord, True);
          end;
          ACTION_SKIP: if Assigned(FOnSkipWord) then
            FOnSkipWord(Self, sWord, False);
          ACTION_UNDO: begin
            with TSynEditEx(FEditor) do begin
              Undo;
              CaretXY := TBufferCoord(pLastWord);
              if sscoGoUp in FOptions then
                CaretXY := TBufferCoord(NextWordPosEx(FIdentChars, FWhiteChars))
              else
                CaretXY := TBufferCoord(PrevWordPosEx(FIdentChars, FWhiteChars));
              bUndoEnabled := False;
            end;
          end;
        end;
      end;
      if sscoHourGlass in FOptions then
        Screen.Cursor := crHourGlass;
      if sscoHideCursor in FOptions then
        FEditor.BeginUpdate;
    end;
  end;

begin
  bUndoEnabled := False;
  // If no dictionary if loaded and spell checking is requested and Exception
  // is thrown.
  if not FOpenDictionary then
    raise ENoDictionaryLoaded.CreateRes(@SNoDictionaryLoaded);

  FBusy := True;
  if Assigned(FOnStart) then
    FOnStart(Self);
  bAborted := False;
  if sscoHourGlass in FOptions then begin
    FCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
  end;
  tslSuggestions := TStringList.Create;

  with TSynEditEx(FEditor) do begin
    if Trim(Lines.Text) = '' then begin
      Screen.Cursor := FCursor;
      FOnDone(Self);
      FBusy := False;
      Exit;
    end;
    if not (sscoStartFromCursor in FOptions) then
      CaretXY := TBufferCoord(Point(1, 1));
    if sscoHideCursor in FOptions then
      BeginUpdate;
    if sscoGoUp in FOptions then
      pNextWord := PrevWordPosEx(FIdentChars, FWhiteChars)
    else
      pNextWord := NextWordPosEx(FIdentChars, FWhiteChars);
    pLastWord := pNextWord;
    while pNextWord.X > 0 do begin
      Attri := nil;
      //////////////////////////////////////////////////////////////////////////
      // Check if the word is the last word
      // Is cursor at end of text?
      //////////////////////////////////////////////////////////////////////////
      if sscoGoUp in FOptions then begin
        if (PrevWordPosEx(FIdentChars, FWhiteChars).X = CaretX) and
          (Lines.Count = CaretY) then
        Break;
      end else begin
        if (NextWordPosEx(FIdentChars, FWhiteChars).X = CaretX) and
          (Lines.Count = CaretY) then
        Break;
      end;
      //////////////////////////////////////////////////////////////////////////
      // Make sure we do not get any 'blank' words
      //////////////////////////////////////////////////////////////////////////
      while Trim(GetWordAtRowColEx(TPoint(CaretXY), FIdentChars, True)) = '' do begin
        { Just move to next word }
        if sscoGoUp in FOptions then
          pNextWord := PrevWordPosEx(FIdentChars, FWhiteChars)
        else
          pNextWord := NextWordPosEx(FIdentChars, FWhiteChars);
        CaretXY := TBufferCoord(pNextWord);
        { If it the last word then exit loop }
        if pNextWord.X = 0 then
          Break;
      end;
      if pNextWord.X = 0 then
        Break;
      sWord := GetWordAtRowColEx(Tpoint(CaretXY), FIdentChars, True);
      //////////////////////////////////////////////////////////////////////////
      // Check if the word is in the dictionary
      //////////////////////////////////////////////////////////////////////////
      if Highlighter = nil then begin
        if InternalCheckWord(sWord) = False then
          Break;
      end else begin
        if GetHighlighterAttriAtRowCol(CaretXY, sToken, Attri) = False then
          Attri := Highlighter.WhitespaceAttribute;
        if Assigned(Attri) and (FCheckAttribs.IndexOf(Attri.Name) <> -1) and
          (not InternalCheckWord(sWord)) then
          Break;
      end;
      //////////////////////////////////////////////////////////////////////////
      // Prepare next word position
      //////////////////////////////////////////////////////////////////////////
      if sscoGoUp in FOptions then
        pNextWord := PrevWordPosEx(FIdentChars, FWhiteChars)
      else
        pNextWord := NextWordPosEx(FIdentChars, FWhiteChars);
      CaretXY  := TBufferCoord(pNextWord);
    end;
    if sscoHideCursor in FOptions then
      EndUpdate;
  end;
  tslSuggestions.Free;
  if sscoHourGlass in FOptions then
    Screen.Cursor := FCursor;
  //////////////////////////////////////////////////////////////////////////////
  // Remove last word selection
  //////////////////////////////////////////////////////////////////////////////
  with FEditor do begin
    BlockBegin := CaretXY;
    BlockEnd   := BlockBegin;
  end;
  if bAborted then begin
    if Assigned(FOnAbort) then
      FOnAbort(Self)
  end else if Assigned(FOnDone) then
    FOnDone(Self);
  FBusy := False;
end;

procedure TSynSpellCheck.SetApostrophes(const Value: string);
var
  chChar: Char;
  iI    : Integer;
begin
  FIdentChars := ['a'..'z', 'A'..'Z', '-', '0'..'9']; // Standard
  for chChar := #128 to #255 do                                                      //Fiala
    if IsCharAlphaNumeric(chChar) then
      Include(FIdentChars, chChar);
  for iI := 1 to Length(FApostrophes) do
    Include(FIdentChars, FApostrophes[iI]);
  FWhiteChars := [#1..#255] - FIdentChars;
end;

procedure TSynSpellCheck.AddDiacritic(Progress: TProgressBar);
var
  sToken,
  sWord         : string;
  pNextWord     : TPoint;
  Attri         : TSynHighlighterAttributes;
  oldCaret      : TPoint;
  oldTopLine    : Integer;

  procedure InternalCheckWord(Word: string);
  var
    sCorrectWord: string;
  begin
    sCorrectWord := GetWordFromASCIIWord(Word);
    if sCorrectWord <> '' then begin
      SelectWordAtCursor;
      TSynEditEx(FEditor).SelText := sCorrectWord;
    end;
  end;

begin
  // If no dictionary if loaded and spell checking is requested and Exception is
  // thrown.
  if not FOpenDictionary then
    raise ENoDictionaryLoaded.CreateRes(@SNoDictionaryLoaded);
  if FEditor = nil then Exit;

  FBusy := True;
  FCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  with TSynEditEx(FEditor) do begin
    if Trim(Lines.Text) = '' then begin
      Screen.Cursor := FCursor;
      FBusy := False;
      Exit;
    end;
    oldCaret := TPoint(CaretXY);
    oldTopLine := TopLine;
    CaretXY := TBufferCoord(Point(1, 1));
    if Progress <> nil then begin
      Progress.Min := 0;
      Progress.Max := Lines.Count;
    end;
    BeginUpdate;
    BeginUndoBlock;
    pNextWord := NextWordPosEx(FIdentChars, FWhiteChars);
    while pNextWord.X > 0 do begin
      Attri := nil;
      //////////////////////////////////////////////////////////////////////////
      // Check if the word is the last word
      // Is cursor at end of text?
      //////////////////////////////////////////////////////////////////////////
      if (NextWordPosEx(FIdentChars, FWhiteChars).X = CaretX) and
        (Lines.Count = CaretY) then Break;
      //////////////////////////////////////////////////////////////////////////
      // Make sure we do not get any 'blank' words
      //////////////////////////////////////////////////////////////////////////
      while Trim(GetWordAtRowColEx(TPoint(CaretXY), FIdentChars, True)) = '' do begin
        pNextWord := NextWordPosEx(FIdentChars, FWhiteChars);
        CaretXY := TBufferCoord(pNextWord);
        { If it the last word then exit loop }
        if pNextWord.X = 0 then
          Break;
      end;
      if pNextWord.X = 0 then
        Continue;
      sWord := GetWordAtRowColEx(TPoint(CaretXY), FIdentChars, True);
      //////////////////////////////////////////////////////////////////////////
      // Check if the word is in the dictionary
      //////////////////////////////////////////////////////////////////////////
      if Highlighter = nil then
        InternalCheckWord(sWord)
      else begin
        if GetHighlighterAttriAtRowCol(CaretXY, sToken, Attri) = False then
          Attri := Highlighter.WhitespaceAttribute;
        if Assigned(Attri) and (FCheckAttribs.IndexOf(Attri.Name) <> -1) then
          InternalCheckWord(sWord);
      end;
      //////////////////////////////////////////////////////////////////////////
      // Prepare next word position
      //////////////////////////////////////////////////////////////////////////
      pNextWord := NextWordPosEx(FIdentChars, FWhiteChars);
      CaretXY  := TBufferCoord(pNextWord);
      if Progress <> nil then
        if Progress.Position <> CaretY then begin
          Progress.Position := CaretY;
          Progress.Update;
        end;
    end;
    EndUndoBlock;
    EndUpdate;
  end;
  Screen.Cursor := FCursor;
  with FEditor do begin
    CaretXY := TBufferCoord(oldCaret);
    TopLine := oldTopLine;
    BlockBegin := CaretXY;
    BlockEnd   := BlockBegin;
  end;
  FBusy := False;
end;

{ TSynEditEx }

function TSynEditEx.GetWordAtRowColEx(XY: TPoint;
  cIdentChars: TSynIdentChars; OverrideHighlighterChars: Boolean): string;
var
  Line: string;
  IdChars: TSynIdentChars;
  Len, Stop: integer;
begin
  Result := '';
  if (XY.Y >= 1) and (XY.Y <= Lines.Count)  then begin
    Line := Lines[XY.Y - 1];
    Len := Length(Line);
    if (XY.X >= 1) and (XY.X <= Len + 1) then begin
      if Assigned(Highlighter) and not OverrideHighlighterChars then
        IdChars := Highlighter.IdentChars
      else
        IdChars := cIdentChars;
      Stop := XY.X;
      while (Stop <= Len) and (Line[Stop] in IdChars) do
        Inc(Stop);
      while (XY.X > 1) and (Line[XY.X - 1] in IdChars) do
        Dec(XY.X);
      if Stop > XY.X then
        Result := Copy(Line, XY.X, Stop - XY.X);
    end;
  end;
end;

function TSynEditEx.NextWordPosEx(cIdentChars,
  cWhiteChars: TSynIdentChars): TPoint;
var
  CX, CY, LineLen, MultiPos: integer;
  Line: string;

  procedure CheckOnNextLine;
  begin
    // find first IdentChar or multibyte char in the next line
    if CY < Lines.Count then begin
      Line := Lines[CY];
      Inc(CY);
{$IFDEF SYN_MBCSSUPPORT}
      MultiPos := StrScanForMultiByteChar(Line, 1);
{$ELSE}
      MultiPos := 0;
{$ENDIF}
      CX := StrScanForCharInSet(Line, 1, cIdentChars);
      // stop on any multibyte chars
      if (MultiPos > 0) and ((CX = 0) or (CX > MultiPos)) then
        CX := MultiPos;
      if CX = 0 then
        CheckOnNextLine;
    end;
  end;

begin
  CX := CaretX;
  CY := CaretY;
  // valid line?
  if (CY >= 1) and (CY <= Lines.Count) then begin
    Line    := Lines[CY - 1];
    LineLen := Length(Line);
    if CX >= LineLen then begin
      CheckOnNextLine;
    end else begin
{$IFDEF SYN_MBCSSUPPORT}
      MultiPos := StrScanForMultiByteChar(Line, CX + 1);
      // find next "whitespace" if current char is an IdentChar
      if (Line[CX] in cIdentChars) and (ByteType(Line, CX) = mbSingleByte) then
        CX := StrScanForCharInSet(Line, CX, cWhiteChars);
{$ELSE}
      MultiPos := 0;
      // find next "whitespace" if current char is an IdentChar
      if Line[CX] in IdentChars then
        CX := StrScanForCharInSet(Line, CX, cWhiteChars);
{$ENDIF}
      // if "whitespace" found, find the next IdentChar
      if (CX > 0) and (CX < LineLen) then begin
          CX := StrScanForCharInSet(Line, CX, cIdentChars);
        // stop on any multibyte chars
        if (MultiPos > 0) and ((CX = 0) or (CX > MultiPos)) then
          CX := MultiPos;
        // if one of those failed just position at the end of the line
        if CX = 0 then
          CheckOnNextLine;
      end else CheckOnNextLine;
    end;
  end;
  Result := Point(CX, CY);
end;

function TSynEditEx.PrevWordPosEx(cIdentChars,
  cWhiteChars: TSynIdentChars): TPoint;
var
  CX, CY, MultiPos: integer;
  Line: string;

  procedure CheckForIdentChar;
  begin
    if CX <= 1 then
      Exit;
{$IFDEF SYN_MBCSSUPPORT}
    MultiPos := StrRScanForMultiByteChar(Line, CX - 1);
    // If previous char is a "whitespace" search for the last IdentChar
    if (Line[CX - 1] in cWhiteChars) and (ByteType(Line, CX - 1) = mbSingleByte) then
      CX := StrRScanForCharInSet(Line, CX - 1, cIdentChars);
{$ELSE}
    MultiPos := 0;
    // If previous char is a "whitespace" search for the last IdentChar
    if Line[CX - 1] in cWhiteChars then
      CX := StrRScanForCharInSet(Line, CX - 1, cIdentChars);
{$ENDIF}
    if CX > 0 then
      // Search for the first IdentChar of this "word"
      CX := StrRScanForCharInSet(Line, CX - 1, cWhiteChars) + 1;
    // Stop on any multibyte chars
    if (MultiPos > 0) and ((CX = 0) or (CX < MultiPos)) then
      CX := MultiPos;

    if CX = 0 then begin
      // Same as CheckOnPrevLine, but we can't have a circular reference
      //  find last cIdentChar in the previous line
      if CY > 1 then begin
        Dec(CY);
        Line := Lines[CY - 1];
        while (CY > 1) and (Line = '') do begin
          Dec(CY);
          Line := Lines[CY - 1];
        end;
        if Line = '' then
          CX := 1
        else begin
          CX := Length(Line) + 1;
          CheckForIdentChar;
        end;
      end else
        CX := 1;
    end;
  end;

  procedure CheckOnPrevLine;
  begin
    // Find last IdentChar in the previous line
    if CY > 1 then begin
      Dec(CY);
      Line := Lines[CY - 1];
      CX := Length(Line) + 1;
      CheckForIdentChar;
    end else
      CX := 1;
  end;

begin
  CX := CaretX;
  CY := CaretY;
  // Valid line?
  if (CY >= 1) and (CY <= Lines.Count) then begin
    Line := Lines[CY - 1];
    CX := Min(CX, Length(Line) + 1);
    if CX <= 1 then
      CheckOnPrevLine
    else
      CheckForIdentChar;
  end;
  Result := Point(CX, CY);
end;

function TSynEditEx.WordEndEx(cWhiteChars: TSynIdentChars): TPoint;
var
  CX, CY: integer;
  Line: string;
begin
  CX := CaretX;
  CY := CaretY;
  // Valid line?
  if (CY >= 1) and (CY <= Lines.Count) then begin
    Line := Lines[CY - 1];
    CX := StrScanForCharInSet(Line, CX, cWhiteChars);
    // If no "whitespace" is found just position at the end of the line
    if CX = 0 then
      CX := Length(Line) + 1;
  end;
  Result := Point(CX, CY);
end;

function TSynEditEx.WordStartEx(cWhiteChars: TSynIdentChars): TPoint;
var
  CX, CY: integer;
  Line: string;
begin
  CX := CaretX;
  CY := CaretY;
  // Valid line?
  if (CY >= 1) and (CY <= Lines.Count) then begin
    Line := Lines[CY - 1];
    CX := Min(CX, Length(Line) + 1);
    if CX > 1 then // Only find previous char, if not already on start of line
      // If previous char isn't a "whitespace" search for the last IdentChar
      if not (Line[CX - 1] in cWhiteChars) then
        CX := StrRScanForCharInSet(Line, CX - 1, cWhiteChars) + 1;
  end;
  Result := Point(CX, CY);
end;

end.
