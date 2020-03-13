{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

Code template generated with SynGen.
The original code is: SynHighlighterR.pas, released 2003-01-22.
Description: Syntax Parser/Highlighter
The initial author of this file is Stefan Ascher.
Copyright (c) 2003, all rights reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynHighlighterR.pas,v 1.8.2.10 2003/09/23 20:39:03 stievie Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

-------------------------------------------------------------------------------}

unit SynHighlighterR;

{$I SynEdit.inc}

interface

uses
  SysUtils,
  Classes,
{$IFDEF SYN_CLX}
  QControls,
  QGraphics,
{$ELSE}
  Windows,
  Controls,
  Graphics,
{$ENDIF}
  SynEditTypes,
  SynEditHighlighter;

type
  TtkTokenKind = (
    tkComment,
    tkNote,
    tkIdentifier,
    tkKey,
    tkConstant,
    tkNull,
    tkNumber,
    tkFloat,
    tkComplex,
    tkSpace,
    tkString,
    tkOperator,
    tkSymbol,
    tkUnknown);

  TRangeState = (rsUnKnown, rsComment, rsNote, rsString);

  TProcTableProc = procedure of object;

  PIdentFuncTableFunc = ^TIdentFuncTableFunc;
  TIdentFuncTableFunc = function: TtkTokenKind of object;

const
  MaxKey = 110;

type
  TSynRSyn = class(TSynCustomHighlighter)
  private
    fLine: PChar;
    fLineNumber: Integer;
    fProcTable: array[#0..#255] of TProcTableProc;
    fRange: TRangeState;
    Run: LongInt;
    fStringLen: Integer;
    fToIdent: PChar;
    fTokenPos: Integer;
    fTokenID: TtkTokenKind;
    fIdentFuncTable: array[0 .. MaxKey] of TIdentFuncTableFunc;
    fCommentAttri: TSynHighlighterAttributes;
    fNoteAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fKeyAttri: TSynHighlighterAttributes;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fOperatorAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;
    fNumberAttri: TSynHighlighterAttributes;
    fFloatAttri: TSynHighlighterAttributes;
    fComplexAttri: TSynHighlighterAttributes;
    fConstAttri: TSynHighlighterAttributes;
    function KeyHash(ToHash: PChar): Integer;
    function KeyComp(const aKey: string): Boolean;
    function Func6: TtkTokenKind;
    function Func15: TtkTokenKind;
    function Func17: TtkTokenKind;
    function Func20: TtkTokenKind;
    function Func21: TtkTokenKind;
    function Func25: TtkTokenKind;
    function Func30: TtkTokenKind;
    function Func31: TtkTokenKind;
    function Func42: TtkTokenKind;
    function Func43: TtkTokenKind;
    function Func45: TtkTokenKind;
    function Func51: TtkTokenKind;
    function Func59: TtkTokenKind;
    function Func62: TtkTokenKind;
    function Func64: TtkTokenKind;
    function Func67: TtkTokenKind;
    function Func71: TtkTokenKind;
    function Func88: TtkTokenKind;
    function Func96: TtkTokenKind;
    function Func102: TtkTokenKind;
    function Func110: TtkTokenKind;
    procedure IdentProc;
    procedure UnknownProc;
    function AltFunc: TtkTokenKind;
    procedure InitIdent;
    function IdentKind(MayBe: PChar): TtkTokenKind;
    procedure MakeMethodTables;
    procedure NullProc;
    procedure SpaceProc;
    procedure CRProc;
    procedure LFProc;
    procedure CommentProc;
    procedure StringOpenProc;
    procedure StringProc;
    procedure PercentProc;
    procedure OperatorProc;
    procedure SymbolProc;
    procedure NumberProc;
    procedure PointProc;
  protected
    function GetIdentChars: TSynIdentChars; override;
    function GetSampleSource: string; override;
    function IsFilterStored: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    {$IFNDEF SYN_CPPB_1} class {$ENDIF}
    function GetLanguageName: string; override;
    function GetRange: Pointer; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetKeyWords: string;
    function GetTokenID: TtkTokenKind;
    procedure SetLine(NewValue: String; LineNumber: Integer); override;
    function GetToken: String; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: integer; override;
    function GetTokenPos: Integer; override;
    procedure Next; override;
  published
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property NoteAttri: TSynHighlighterAttributes read fNoteAttri write fNoteAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read fKeyAttri write fKeyAttri;
    property ConstAttri: TSynHighlighterAttributes read fConstAttri write fConstAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property OperatorAttri: TSynHighlighterAttributes read fOperatorAttri write fOperatorAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri write fSymbolAttri;
    property NumberAttri: TSynHighlighterAttributes read fNumberAttri write fNumberAttri;
    property FloatAttri: TSynHighlighterAttributes read fFloatAttri write fFloatAttri;
    property ComplexAttri: TSynHighlighterAttributes read fComplexAttri write fComplexAttri;
  end;

procedure Register;

implementation

uses
  SynEditStrConst;

{$IFDEF SYN_COMPILER_3_UP}
resourcestring
{$ELSE}
const
{$ENDIF}
  SYNS_FilterR = 'R files (*.r, *q)|*.r;*.q';
  SYNS_LangR = 'R';
  SYNS_AttrConstant = 'Constant';
  SYNS_AttrComplex = 'Complex Number';
  SYNS_AttrNote = 'Note';

var
  Identifiers: array[#0..#255] of ByteBool;
  mHashTable : array[#0..#255] of Integer;

procedure Register;
begin
  RegisterComponents(SYNS_HighlightersPage, [TSynRSyn]);
end;

procedure MakeIdentTable;
var
  I: Char;
begin
  for I := #0 to #255 do
  begin
    case I of
      'a'..'z', 'A'..'Z', '0'..'9': Identifiers[I] := True;
    else
      Identifiers[I] := False;
    end;
    case I in ['A'..'Z', 'a'..'z'] of
      True:
        begin
          if (I > #64) and (I < #91) then
            mHashTable[I] := Ord(I) - 64
          else if (I > #96) then
            mHashTable[I] := Ord(I) - 95;
        end;
    else
      mHashTable[I] := 0;
    end;
  end;
end;

procedure TSynRSyn.InitIdent;
var
  I: Integer;
  pF: PIdentFuncTableFunc;
begin
  pF := PIdentFuncTableFunc(@fIdentFuncTable);
  for I := Low(fIdentFuncTable) to High(fIdentFuncTable) do
  begin
    pF^ := AltFunc;
    Inc(pF);
  end;
  fIdentFuncTable[6] := Func6;
  fIdentFuncTable[15] := Func15;
  fIdentFuncTable[17] := Func17;
  fIdentFuncTable[20] := Func20;
  fIdentFuncTable[21] := Func21;
  fIdentFuncTable[25] := Func25;
  fIdentFuncTable[30] := Func30;
  fIdentFuncTable[31] := Func31;
  fIdentFuncTable[42] := Func42;
  fIdentFuncTable[43] := Func43;
  fIdentFuncTable[45] := Func45;
  fIdentFuncTable[51] := Func51;
  fIdentFuncTable[59] := Func59;
  fIdentFuncTable[62] := Func62;
  fIdentFuncTable[64] := Func64;
  fIdentFuncTable[67] := Func67;
  fIdentFuncTable[71] := Func71;
  fIdentFuncTable[88] := Func88;
  fIdentFuncTable[96] := Func96;
  fIdentFuncTable[102] := Func102;
  fIdentFuncTable[110] := Func110;
end;

function TSynRSyn.KeyHash(ToHash: PChar): Integer;
begin
  Result := 0;
  while ToHash^ in ['a'..'z', 'A'..'Z'] do
  begin
    inc(Result, mHashTable[ToHash^]);
    inc(ToHash);
  end;
  fStringLen := ToHash - fToIdent;
end;

function TSynRSyn.KeyComp(const aKey: String): Boolean;
var
  I: Integer;
  Temp: PChar;
begin
  Temp := fToIdent;
  if Length(aKey) = fStringLen then
  begin
    Result := True;
    for i := 1 to fStringLen do
    begin
      if Temp^ <> aKey[i] then
      begin
        Result := False;
        break;
      end;
      inc(Temp);
    end;
  end else
    Result := False;
end;

function TSynRSyn.Func6: TtkTokenKind;
begin
  if KeyComp('F') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func15: TtkTokenKind;
begin
  if KeyComp('NA') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func17: TtkTokenKind;
begin
  if KeyComp('if') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func20: TtkTokenKind;
begin
  if KeyComp('T') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func21: TtkTokenKind;
begin
  if KeyComp('do') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func25: TtkTokenKind;
begin
  if KeyComp('in') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func30: TtkTokenKind;
begin
  if KeyComp('NaN') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func31: TtkTokenKind;
begin
  if KeyComp('Inf') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func42: TtkTokenKind;
begin
  if KeyComp('break') then Result := tkKey else
    if KeyComp('done') then Result := tkKey else
      if KeyComp('for') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func43: TtkTokenKind;
begin
  if KeyComp('FALSE') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func45: TtkTokenKind;
begin
  if KeyComp('else') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func51: TtkTokenKind;
begin
  if KeyComp('then') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func59: TtkTokenKind;
begin
  if KeyComp('class') then Result := tkKey else
    if KeyComp('NULL') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func62: TtkTokenKind;
begin
  if KeyComp('while') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func64: TtkTokenKind;
begin
  if KeyComp('TRUE') then Result := tkConstant else Result := tkIdentifier;
end;

function TSynRSyn.Func67: TtkTokenKind;
begin
  if KeyComp('next') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func71: TtkTokenKind;
begin
  if KeyComp('repeat') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func88: TtkTokenKind;
begin
  if KeyComp('switch') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func96: TtkTokenKind;
begin
  if KeyComp('unclass') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func102: TtkTokenKind;
begin
  if KeyComp('return') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.Func110: TtkTokenKind;
begin
  if KeyComp('function') then Result := tkKey else
    if KeyComp('inherits') then Result := tkKey else Result := tkIdentifier;
end;

function TSynRSyn.AltFunc: TtkTokenKind;
begin
  Result := tkIdentifier;
end;

function TSynRSyn.IdentKind(MayBe: PChar): TtkTokenKind;
var
  HashKey: Integer;
begin
  fToIdent := MayBe;
  HashKey := KeyHash(MayBe);
  if HashKey <= MaxKey then
    Result := fIdentFuncTable[HashKey]
  else
    Result := tkIdentifier;
end;

procedure TSynRSyn.MakeMethodTables;
var
  I: Char;
begin
  for I := #0 to #255 do
    case I of
      #0: fProcTable[I] := NullProc;
      #10: fProcTable[I] := LFProc;
      #13: fProcTable[I] := CRProc;
      '"', '''': fProcTable[I] := StringOpenProc;
      '#': fProcTable[I] := CommentProc;
      '0'..'9': fProcTable[I] := NumberProc;
      '.': fProcTable[I] := PointProc;
      #1..#9,
      #11,
      #12,
      #14..#32 : fProcTable[I] := SpaceProc;
      'A'..'Z', 'a'..'z': fProcTable[I] := IdentProc;
      '%': fProcTable[I] := PercentProc;
      '~', '$', '?', '!', '=', '|', '^', '*', '+', '-', '&', '<', '>', ':', '_': fProcTable[I] := OperatorProc;
      '{', '}', '(', ')', '[', ']', ';', ',': fProcTable[I] := SymbolProc;
    else
      fProcTable[I] := UnknownProc;
    end;
end;

procedure TSynRSyn.SpaceProc;
begin
  fTokenID := tkSpace;
  repeat
    inc(Run);
  until not (fLine[Run] in [#1..#32]);
end;

procedure TSynRSyn.NullProc;
begin
  fTokenID := tkNull;
end;

procedure TSynRSyn.CRProc;
begin
  fTokenID := tkSpace;
  inc(Run);
  if fLine[Run] = #10 then
    inc(Run);
end;

procedure TSynRSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end;

procedure TSynRSyn.CommentProc;
begin
  Inc(Run);
  if fLine[Run] <> '!' then begin
    fRange := rsComment;
    fTokenID := tkComment;
  end else begin
    fRange := rsNote;
    fTokenID := tkNote;
  end;
  repeat
    if not (fLine[Run] in [#0, #10, #13]) then
      Inc(Run);
  until fLine[Run] in [#0, #10, #13];
end;

procedure TSynRSyn.StringOpenProc;
begin
  Inc(Run);
  fRange := rsString;
  StringProc;
  fTokenID := tkString;
end;

procedure TSynRSyn.StringProc;
var
  DelimChar: Char;
  Escape: boolean;
begin
  fTokenID := tkString;
  DelimChar := fLine[Run - 1];
  Escape := false;
  repeat
    if fLine[Run] = '\' then
      Escape := not Escape
    else
      Escape := false;
    if Escape and (fLine[Run+1] = DelimChar) then
      Inc(Run);
    if (fLine[Run] = DelimChar) and not Escape then
    begin
      Inc(Run);
      fRange := rsUnKnown;
      Break;
    end;
    if not (fLine[Run] in [#0, #10, #13]) then
      Inc(Run);
  until fLine[Run] in [#0, #10, #13];
end;

procedure TSynRSyn.PercentProc;
begin
  Inc(Run);
  fTokenID := tkOperator;
  repeat
    if (fLine[Run] = '%') then begin
      Inc(Run);
      fRange := rsUnknown;
      Break;
    end;
    if not (fLine[Run] in [#0, #10, #13]) then
      Inc(Run);
  until fLine[Run] in [#0, #10, #13];
end;

procedure TSynRSyn.OperatorProc;
begin
  fTokenID := tkOperator;
  inc(Run);
end;

procedure TSynRSyn.SymbolProc;
begin
  fTokenID := tkSymbol;
  inc(Run);
end;

procedure TSynRSyn.NumberProc;
var
  idx1: Integer; // token[1]
  i: Integer;
begin
  idx1 := Run;
  Inc(Run);
  fTokenID := tkNumber;
  while FLine[Run] in ['0'..'9', 'i', 'E', 'e', '-', '+', '.'] do begin
    case FLine[Run] of
      '.':
        if FLine[Succ(Run)] = '.' then
          Break
        else
          fTokenID := tkFloat;
      '-', '+':
        begin
          if fTokenID <> tkFloat then // number <> float. an arithmetic operator
            Exit;
          if not (FLine[Pred(Run)] in ['E', 'e']) then
            Exit; // number = float, but no exponent. an arithmetic operator
          if not (FLine[Succ(Run)] in ['0'..'9', '+', '-']) then // invalid
          begin
            Inc(Run);
            fTokenID := tkUnknown;
            Exit;
          end
        end;
      'E', 'e':
        if FLine[Pred(Run)] in ['0'..'9'] then // exponent
        begin
          for i := idx1 to Pred(Run) do
            if FLine[i] in ['E', 'e'] then // too many exponents
            begin
              //Run := i;
              fTokenID := tkUnknown;
              Exit;
            end;
          if not (FLine[Succ(Run)] in ['0'..'9', '+', '-']) then
            Break
          else
            fTokenID := tkFloat
        end else begin // invalid char
          fTokenID := tkUnknown;
          Break;
        end;
      'i':      // Complex number
        begin
          Inc(Run);
          fTokenID := tkComplex;
          Break;  // must be the last character of a number
        end;
    end; // case
    Inc(Run);
  end; // while
  if FLine[Run] in ['A'..'Z', 'a'..'z'] then
    fTokenID := tkUnknown;
end;

procedure TSynRSyn.PointProc;
begin
  if FLine[Run + 1] in ['0'..'9'] then // float
    begin
      Dec(Run); // numberproc must see the point
      NumberProc;
    end
  else                                {point}
    begin
      Inc(Run);
      fTokenID := tkSymbol;           {Dot is always a Symbol, isn't it?}
    end;
end;

constructor TSynRSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fCommentAttri := TSynHighLighterAttributes.Create(SYNS_AttrComment);
  fCommentAttri.Style := [fsItalic];
  fCommentAttri.Foreground := clGreen;
  AddAttribute(fCommentAttri);

  fNoteAttri := TSynHighLighterAttributes.Create(SYNS_AttrNote);
  fNoteAttri.Style := [fsItalic];
  fNoteAttri.Foreground := clTeal;
  AddAttribute(fNoteAttri);

  fIdentifierAttri := TSynHighLighterAttributes.Create(SYNS_AttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fKeyAttri := TSynHighLighterAttributes.Create(SYNS_AttrReservedWord);
  fKeyAttri.Style := [fsBold];
  fKeyAttri.Foreground := clNavy;
  AddAttribute(fKeyAttri);

  fConstAttri := TSynHighLighterAttributes.Create(SYNS_AttrConstant);
  fConstAttri.Style := [fsBold];
  AddAttribute(fConstAttri);

  fOperatorAttri := TSynHighLighterAttributes.Create(SYNS_AttrOperator);
  AddAttribute(fOperatorAttri);

  fSymbolAttri := TSynHighLighterAttributes.Create(SYNS_AttrSymbol);
  AddAttribute(fSymbolAttri);

  fSpaceAttri := TSynHighLighterAttributes.Create(SYNS_AttrSpace);
  AddAttribute(fSpaceAttri);

  fStringAttri := TSynHighLighterAttributes.Create(SYNS_AttrString);
  fStringAttri.Foreground := clMaroon;
  AddAttribute(fStringAttri);

  fNumberAttri := TSynHighLighterAttributes.Create(SYNS_AttrNumber);
  AddAttribute(fNumberAttri);

  fFloatAttri := TSynHighlighterAttributes.Create(SYNS_AttrFloat);
  AddAttribute(fFloatAttri);

  fComplexAttri := TSynHighlighterAttributes.Create(SYNS_AttrComplex);
  AddAttribute(fComplexAttri);

  SetAttributesOnChange(DefHighlightChange);
  InitIdent;
  MakeMethodTables;
  fDefaultFilter := SYNS_FilterR;
  fRange := rsUnknown;
end;

procedure TSynRSyn.SetLine(NewValue: String; LineNumber: Integer);
begin
  fLine := PChar(NewValue);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end;

procedure TSynRSyn.IdentProc;
begin
  fTokenID := IdentKind((fLine + Run));
  inc(Run, fStringLen);
  while Identifiers[fLine[Run]] do
    Inc(Run);
end;

procedure TSynRSyn.UnknownProc;
begin
{$IFDEF SYN_MBCSSUPPORT}
  if FLine[Run] in LeadBytes then
    Inc(Run,2)
  else
{$ENDIF}
  inc(Run);
  fTokenID := tkUnknown;
end;

procedure TSynRSyn.Next;
begin
  fTokenPos := Run;
  fRange := rsUnknown;
  fProcTable[fLine[Run]];
end;

function TSynRSyn.GetDefaultAttribute(Index: integer): TSynHighLighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT    : Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER : Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD    : Result := fKeyAttri;
    SYN_ATTR_STRING     : Result := fStringAttri;
    SYN_ATTR_WHITESPACE : Result := fSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynRSyn.GetEol: Boolean;
begin
  Result := fTokenID = tkNull;
end;

function TSynRSyn.GetKeyWords: string;
begin
  Result := 
    'break,class,do,done,else,for,function,if,in,next' +
    'repeat,return,switch,then,while';
end;

function TSynRSyn.GetToken: String;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  SetString(Result, (FLine + fTokenPos), Len);
end;

function TSynRSyn.GetTokenID: TtkTokenKind;
begin
  Result := fTokenId;
end;

function TSynRSyn.GetTokenAttribute: TSynHighLighterAttributes;
begin
  case GetTokenID of
    tkComment: Result := fCommentAttri;
    tkNote: Result := fNoteAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey: Result := fKeyAttri;
    tkConstant: Result := fConstAttri;
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkOperator: Result := fOperatorAttri;
    tkSymbol: Result := fSymbolAttri;
    tkNumber: Result := fNumberAttri;
    tkFloat: Result := fFloatAttri;
    tkComplex: Result := fComplexAttri;
    tkUnknown: Result := fIdentifierAttri;
  else
    Result := nil;
  end;
end;

function TSynRSyn.GetTokenKind: integer;
begin
  Result := Ord(fTokenId);
end;

function TSynRSyn.GetTokenPos: Integer;
begin
  Result := fTokenPos;
end;

function TSynRSyn.GetIdentChars: TSynIdentChars;
begin
  Result := ['a'..'z', 'A'..'Z', '0'..'9'];
end;

function TSynRSyn.GetSampleSource: string;
begin
  Result :=
    '#! Syntax highlighting'#13#10 +
    'my.method <- function(p1, p2) {'#13#10 +
    '  i <- 123456'#13#10 +
    '  for (j in i) {'#13#10 +
    '    if (j = p1) {'#13#10 +
    '      p2 <- 2i     # Complex Number'#13#10 +
    '      p1 <- 3.5E2  # Float Number with exponent'#13#10 +
    '      somestr <- "This is a string"'#13#10 +
    '      return(TRUE)'#13#10 +
    '    }'#13#10 +
    '  }'#13#10 +
    '  return(FALSE)'#13#10 +
    '}';
end;

function TSynRSyn.IsFilterStored: Boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterR;
end;

{$IFNDEF SYN_CPPB_1} class {$ENDIF}
function TSynRSyn.GetLanguageName: string;
begin
  Result := SYNS_LangR;
end;

procedure TSynRSyn.ResetRange;
begin
  fRange := rsUnknown;
end;

procedure TSynRSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

function TSynRSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

initialization
  MakeIdentTable;
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynRSyn);
{$ENDIF}
end.
