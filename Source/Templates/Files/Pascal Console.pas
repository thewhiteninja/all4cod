program Console;
{$APPTYPE CONSOLE}

procedure ShowHelp;
begin
  WriteLn('Help');
  Halt(0);
end;

procedure HandleOptions;
var
  i: integer;
  switch: string;
begin
  { To Do: process Arguments }
  if ParamCount > 0 then begin
    i := 1;
    while i <= ParamCount do begin
      switch := ParamStr(i);
      if (switch[1] = '/') or (switch[1] = '-') then begin
        Delete(switch, 1, 1);
        if (switch = '?') or (switch = 'help') then
          ShowHelp

        else begin
          WriteLn('Unknown Option "' + switch + '"');
          Halt(1);
        end;
      end;
      Inc(i);
    end;
  end else
    ShowHelp;
end;

begin
  HandleOptions;
end.
