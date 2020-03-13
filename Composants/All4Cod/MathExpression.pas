unit MathExpression {v 1.0};
{************************************************
    For updates checkout: http://www.cobans.net
      (C) Alex Demchenko(alex@ritlabs.com)
*************************************************}


interface
uses
  SysUtils, Math;

{Error codes}
const
  C_NOERROR             = 0;
  C_ERR_BRACKETS        = 1;
  C_ERR_EMPTY_EXPR      = 2;
  C_ERR_UNKNOWN_FUNC    = 3;
  C_ERR_FUNCTION_ERR    = 4;
  C_ERR_DEV_BY_ZERO     = 5;
  C_ERR_CANNOT_SOLVE    = 6;
  C_ERR_BAD_NUMBER      = 7;


{
function CalcExpression

        Evaluates Expression,

        Value -- Source string with expression
        X -- Variable X, used for building graphs
        Res -- Result

        Returns
          C_NOERROR if there are no errors, otherwise one of the 'Error codes'
}
function CalcExpression(Value: String; var Res: String): Word;
function CalcGraphExpression(Value: String; X: Extended; var Res: String): Word;
function CalcErrorToStr(Error: Word): String;

implementation
type
  PExprNum = ^TExprNum;
  TExprNum = record
    Operator: ShortString;
    Next: PExprNum;
  end;

const
  HILL_TOP   = High(Integer);
  HILL_FUNC  = HILL_TOP - 1;
  HILL_FACT  = HILL_TOP - 2;
  HILL_POW   = HILL_TOP - 3;
  HILL_DIV   = HILL_TOP - 4;
  HILL_MUL   = HILL_TOP - 5;
  HILL_MINUS = HILL_TOP - 6;
  HILL_PLUS  = HILL_TOP - 7;
  HILL_ZERO  = HILL_TOP - 8;


{Testing brackets}
function TestBrackets(const Value: String): Boolean;
var
  i: LongWord;
  S: String;
begin
  S := '';
  for i := 1 to Length(Value) do
    if Value[i] in ['(', ')'] then
      S := S + Value[i];
  while Pos('()', S) > 0 do
    Delete(S, Pos('()', S), 2);
  Result := Length(S) = 0;
end;

{Evaluating functions sin, cos, tan...}
function DoFuncCalc(const Func: String; Value: Extended; var Res: Extended): Word;
begin
  Res := 0; Result := C_NOERROR;
  if Func = 'ln' then begin
    if Value > 0 then
      Res := ln(Value)
    else
      Result := C_ERR_FUNCTION_ERR    
  end
  else if Func = 'sin' then Res := sin(Value)
  else if Func = 'cos' then Res := cos(Value)
  else if Func = 'tan' then
  begin
    if (cos(Value) <> 0) then
      Res := sin(Value) / cos(Value)
    else
      Result := C_ERR_FUNCTION_ERR;
  end
  else if Func = 'ctg' then
  begin
    if (sin(Value) <> 0) then
      Res := cos(Value) / sin(Value)
    else
      Result := C_ERR_FUNCTION_ERR;
  end
  else if Func = 'abs' then Res := abs(Value)
  else if Func = 'sqrt' then
  begin
    if Value >= 0 then
      Res := sqrt(Value)
    else
      Result := C_ERR_FUNCTION_ERR;
  end
  else
    Result := C_ERR_UNKNOWN_FUNC;
end;

{Calculating expression without brackets}
function DoMathCalc(Value: String; var Res: String): Word;
var
  hchain: PExprNum;     {   variables used with                      }
  pchain: PExprNum;     {   dynamic lists                            }

  function CountChars(const Value: String; Char: Char): Word;
  var
    i: Word;
  begin
    Result := 0;
    if Length(Value) = 0 then Exit;
    for i := 1 to Length(Value) do
      if Value[i] = Char then Inc(Result);
  end;

  {Releasing chain memory}
  procedure FreeExprChain(var Value: PExprNum);
  var
    p: Pointer;
  begin
    if Value = nil then Exit;
    while Value.Next <> nil do
    begin
      p := Value.Next;
      Dispose(Value);
      Value := p;
    end;
    Dispose(Value); Value := nil;
  end;

  function Factorial(Value: String): LongWord;
  var
    i: LongWord;
    C: LongWord;
  begin
    if Value = '' then Value := '0';
    C := Trunc(StrToFloat(Value));
    if C > 0 then
    begin
      Result := 1;
      if C > 1 then
        for i := 1 to C do
          Result := Result * i
    end else
      Result := 0;
  end;

  procedure Push(Op: String);
  begin
    {Adding opcode into chain for feature calculation}
    if hchain = nil then
    begin
      New(hchain);
      pchain := hchain;
    end else
    begin
      New(pchain.Next);
      pchain := pchain.Next;
    end;

    pchain.Operator := Op;
    pchain.Next := nil;
  end;

  {Solving the chain}
  function SolveChain(var Value: String): Word;
  var
    chain, p, prev: PExprNum;

    procedure KillValue;
    begin
      p := chain.Next;
      chain.Next := chain.Next.Next;
      Dispose(p);
    end;

    procedure KillPV;
    begin
      prev.Next := chain.Next.Next;
      Dispose(chain.Next);
      Dispose(chain);
      chain := prev;
    end;

    procedure NextValue;
    begin
      chain := chain.Next;
    end;

    function IsNumber(const Value: String): Boolean;
    begin
      Result := (((Value[1] = '+') or (Value[1] = '-')) and (Length(Value) > 1)) {'Complex' numbers} or
                ((Value[1] in ['0'..'9', ',', '.']) and (Length(Value) > 0))   {Normal numbers}
    end;

    function IsFunction(const Value: String): Boolean;
    begin
      Result := (Value[1] in ['a'..'z']);
    end;

    function CheckIsNumbers(const Value: array of String; var Res: Word): Boolean;
    var
      i: Word;
    begin
      Result := True;
      if SizeOf(Value) > 0 then
        for i := 0 to High(Value) do
          Result := Result and IsNumber(Value[i]);
      if not Result then Res := C_ERR_BAD_NUMBER;
    end;

  var
    Hill: Integer;
    res: Extended;
    Handled: Boolean;
  begin
    Result := C_NOERROR;
    Hill := HILL_FUNC;

    while hchain.Next <> nil do
    begin
      chain := hchain; prev := chain; Handled := False;
      while chain.Next <> nil do
      begin
        case Hill of
          HILL_FUNC:
            if IsFunction(chain.Operator) then begin
              Result := DoFuncCalc(chain.Operator, StrToFloat(chain.Next.Operator), res);
              Handled := True;
              KillValue;
              chain.Operator := FloatToStr(Res);
            end;
          HILL_FACT: begin
            if chain.Next.Operator = '!' then begin
              if not CheckIsNumbers([chain.Operator], Result) then Break;
              if StrToFloat(chain.Operator) < 0 then begin Result := C_ERR_CANNOT_SOLVE; Break; end;
              Res := Factorial(chain.Operator);
              Handled := True;
              KillValue;
              chain.Operator := FloatToStr(Res);
            end;
          end;
          HILL_POW:
            if chain.Operator = '^' then begin
              if not CheckIsNumbers([prev.Operator, chain.Next.Operator], Result) then Break;
              if prev = nil then begin Result := C_ERR_CANNOT_SOLVE; Break; end;
              if ((StrToFloat(chain.Next.Operator) < 1) and (StrToFloat(chain.Next.Operator) > 0) and (StrToFloat(prev.Operator) < 0)) {-2^(1/2) = sqrt(-2) = error} then begin
                Result := C_ERR_CANNOT_SOLVE; Break;
              end;
              Handled := True;
              Res := Power(StrToFloat(prev.Operator), StrToFloat(chain.Next.Operator));
              KillPV;
              chain.Operator := FloatToStr(Res);
            end;
          HILL_DIV:
            if (chain.Operator = '/') or (chain.Operator = ':') then begin
              if not CheckIsNumbers([prev.Operator, chain.Next.Operator], Result) then Break;
              if prev = nil then begin Result := C_ERR_CANNOT_SOLVE; Break; end;
              Handled := True;
              if StrToFloat(chain.Next.Operator) = 0 then begin
                Result := C_ERR_DEV_BY_ZERO;
                Break;
              end;
              Res := StrToFloat(prev.Operator) / StrToFloat(chain.Next.Operator);
              KillPV;
              chain.Operator := FloatToStr(Res);
            end;
          HILL_MUL:
            if chain.Operator = '*' then begin
              if not CheckIsNumbers([prev.Operator, chain.Next.Operator], Result) then Break;
              if prev = nil then begin Result := C_ERR_CANNOT_SOLVE; Break; end;
              Handled := True;
              Res := StrToFloat(prev.Operator) * StrToFloat(chain.Next.Operator);
              KillPV;
              chain.Operator := FloatToStr(Res);
            end;
          HILL_MINUS:
            if chain.Operator = '-' then begin
              if not CheckIsNumbers([prev.Operator, chain.Next.Operator], Result) then Break;
              if prev = nil then begin Result := C_ERR_CANNOT_SOLVE; Break; end;
              Handled := True;
              Res := StrToFloat(prev.Operator) - StrToFloat(chain.Next.Operator);
              KillPV;
              chain.Operator := FloatToStr(Res);
            end;
          HILL_PLUS:
            if chain.Operator = '+' then begin
              if not CheckIsNumbers([prev.Operator, chain.Next.Operator], Result) then Break;            
              if prev = nil then begin Result := C_ERR_CANNOT_SOLVE; Break; end;
              Handled := True;
              Res := StrToFloat(prev.Operator) + StrToFloat(chain.Next.Operator);
              KillPV;
              chain.Operator := FloatToStr(Res);
            end;
          HILL_ZERO: begin
          end else begin
            Break;
          end;
        end;
        prev := chain;
        if Result <> C_NOERROR then Break;
        if chain.Next <> nil then
          NextValue;
      end;
      if not Handled then Dec(Hill);
      if (Result <> C_NOERROR) or (Hill < HILL_ZERO) then Break;
    end;
    Value := hchain.Operator;
  end;

var
  vals: String;           
  i: LongWord;

  is_first_type: Boolean;
  work_type, prev_type: Integer;
begin
  Res := ''; Result := C_NOERROR;
  if Value = '' then Exit;

  hchain := nil;
  {if Pos(#0, Value) > 0 then
    Value := Copy(Value, 1, Pos(#0, Value));}


  {Some required replaces}
  while True do
  begin
    vals := Value;
    Value := StringReplace(Value, '+-', '-', [rfReplaceAll]);
    Value := StringReplace(Value, '-+', '-', [rfReplaceAll]);
    Value := StringReplace(Value, '--', '+', [rfReplaceAll]);
    Value := StringReplace(Value, '++', '+', [rfReplaceAll]);
    Value := StringReplace(Value, '[[', '[', [rfReplaceAll]);
    Value := StringReplace(Value, ']]', ']', [rfReplaceAll]);
    Value := StringReplace(Value, ':', '/', [rfReplaceAll]);
    Value := StringReplace(Value, '**', '^', [rfReplaceAll]);
    //Value := StringReplace(Value, '[]', '', [rfReplaceAll]);
    Value := StringReplace(Value, '.', ',', [rfReplaceAll]);
    if Value = vals then Break;
  end;

  work_type := -1;
  vals := '';
  is_first_type := True;

  for i := 1 to Length(Value) do
  begin
    if Value[i] = #0 then Break;
    if work_type = 9 then begin
      if Value[i] = ']' then begin
        Push(vals);
        vals := '';
        work_type := -1;
        Continue;
      end else begin
        vals := vals + Value[i];
        Continue;
      end;
    end;
    prev_type := work_type;
    case Value[i] of
      'a'..'z': begin
        work_type := 1; is_first_type := False;
      end;
      '0'..'9', ',': begin
        work_type := 2; is_first_type := False;
      end;
      '+': begin if is_first_type then Push('0');
        work_type := 3; is_first_type := False;
      end;
      '-': begin if is_first_type then Push('0');
        work_type := 4; is_first_type := False;
      end;
      '*': begin
        work_type := 5; is_first_type := False;
      end;
      '/': begin
        work_type := 6; is_first_type := False;
      end;
      '^': begin
        work_type := 7; is_first_type := False;
      end;
      '!': begin
        work_type := 8; is_first_type := False;
       end;
      '[': begin
        work_type := 9; is_first_type := False;
      end;
    end;
    if (prev_type <> work_type) and (vals <> '') then begin
      Push(vals);
      vals := '';
    end;
    if work_type <> 9 then
      vals := vals + Value[i];
  end;
  if vals <> '' then
    Push(vals);

  Result := SolveChain(Res);

  {Free chain memory}
  FreeExprChain(hchain);
end;

{P - position in a string, N - deep}
{Recursive function for parsing brackets}
function DoCalc(const Value: String; var P, N: LongWord; var Err: Word): String;
var
  i: LongWord;
  NPassed: LongWord;
  Res: String;
begin
  Result := '';
  if Err <> C_NOERROR then Exit;
  NPassed := N; Inc(N);
  for i := P to Length(Value) do
  begin
    Inc(P);
    case Value[P] of
      '(':
      begin
        Err := DoMathCalc(DoCalc(Value, P, N, Err), Res);
        Result := Result + '[' + Res + ']';
      end;
      ')':
      begin
        Dec(N);
        if N = NPassed then Break;
      end;
    else
      Result := Result + Value[P];
    end;
    if Err <> C_NOERROR then Exit;
  end;
end;

function CalcExpression(Value: String; var Res: String): Word;
var
  P, N: LongWord;
begin
  Result := C_NOERROR; Res := '';
  if Length(Value) = 0 then begin Result := C_ERR_EMPTY_EXPR; Exit; end;
  if not TestBrackets(Value) then begin Result := C_ERR_BRACKETS; Exit; end;
  N := 0; P := 0;
  Value := StringReplace(Value, ' ', '', [rfReplaceAll]);
  Value := StringReplace(Value, 'pi', FloatToStr(pi), [rfReplaceAll]);
  Value := StringReplace(Value, 'e', FloatToStr(Exp(1)), [rfReplaceAll]);

  if Length(Value) = 0 then begin Result := C_ERR_EMPTY_EXPR; Exit; end;
  Value := AnsiLowerCase(Value);
  Res := DoCalc(Value, P, N, Result);
  if Result = C_NOERROR then
    Result := DoMathCalc(Res, Res);
end;

function CalcGraphExpression(Value: String; X: Extended; var Res: String): Word;
begin
  {Replacing x to it's value}
  Value := StringReplace(Value, 'x', '(' + FloatToStr(X) + ')', [rfReplaceAll]);
  Result := CalcExpression(Value, Res);
end;

{Converting error code to it's string representation}
function CalcErrorToStr(Error: Word): String;
begin
  case Error of
    C_NOERROR:          Result := 'No error';
    C_ERR_BRACKETS:     Result := 'Could not parse brackets';
    C_ERR_EMPTY_EXPR:   Result := 'Empty expression';
    C_ERR_UNKNOWN_FUNC: Result := 'Unknown function';
    C_ERR_FUNCTION_ERR: Result := 'Error while evaluating function';
    C_ERR_DEV_BY_ZERO:  Result := 'Division by sezo';
    C_ERR_CANNOT_SOLVE: Result := 'Error while evaluating expression';
    C_ERR_BAD_NUMBER:   Result := 'Incorrect number';
  else
    Result := 'Unknown error';
  end;
end;


end.
