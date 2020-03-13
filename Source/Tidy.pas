unit Tidy;

interface

uses Windows, Classes, Forms, Dialogs, SysUtils, StrUtils, Fonctions;

type
   TTidyWarningError = record
      Line, Column : integer;
      Text : string;
   end;

type
   TTidy = class(TObject)
   private
      Dir : string;
      function BuildCommand : string;
   public
      Input, Output : TStringlist;
      OptionsFile, Options : string;
      Infos : array of string;
      Warnings, Errors : array of TTidyWarningError;
      constructor Create(DirTidy : string);
      destructor Destroy; override;
      function Execute : integer;
   end;

const
   TidyPath = 'Tidy\Tidy.exe';
   ErrorsFile = 'Tidy\Tidy_Err.dat';
   InputFile = 'Tidy\Tidy_In.dat';

implementation

function ExecuteCommand(Cmd : string) : boolean;
var
   StartInfo : TStartupInfo;
   ProcessInfo : TProcessInformation;
   Fin : Boolean;
begin
   Result := True;
   FillChar(StartInfo, SizeOf(StartInfo), #0);
   StartInfo.cb := SizeOf(StartInfo);
   StartInfo.dwFlags := STARTF_USESHOWWINDOW;
   StartInfo.wShowWindow := SW_HIDE;
   if CreateProcess(nil, PChar(Cmd), nil, nil, False,
      0, nil, nil, StartInfo, ProcessInfo) then
   begin
      Fin := False;
      repeat
         case WaitForSingleObject(ProcessInfo.hProcess, 200) of
            WAIT_OBJECT_0 : Fin := True;
            WAIT_TIMEOUT : ;
         end;
         Application.ProcessMessages;
      until Fin;
   end
   else
      Result := false;
end;

constructor TTidy.Create(DirTidy : string);
begin
   inherited Create;
   Dir := DirTidy;
   OptionsFile := '';
   Options := '';
   Input := TStringList.Create;
   Output := TStringList.Create;
   SetLength(Infos, 0);
   SetLength(Warnings, 0);
   SetLength(Errors, 0);
end;

destructor TTidy.Destroy;
begin
   Input.Free;
   Output.Free;
   inherited Destroy;
end;

function TTidy.BuildCommand : string;
begin
   Result := '"' + Dir + TidyPath + '" -f "' + Dir + ErrorsFile + '"';
   if FileExists(Dir + OptionsFile) then
      Result := Result + ' -config "' + Dir + OptionsFile + '"'
   else
      Result := Result + ' -' + Options;
   Result := Result + ' "' + Dir + InputFile + '"';
end;

function TTidy.Execute : integer;
var
   ErrorsList : TStringList;
   i : integer;
begin
   Result := 0;
   if Input.Text = '' then
   begin
      Result := 1;
      Exit;
   end;
   if not (FileExists(Dir + TidyPath)) then
   begin
      Result := 2;
      exit;
   end;

   ErrorsList := TStringList.Create;
   Input.SaveToFile(Dir + InputFile);
   Input.Clear;
   ErrorsList.Clear;
   Output.Clear;

   if ExecuteCommand(BuildCommand) then
   begin
      { Option write-back:yes ou -m > Ecrit dans le fichier d'entrée
        Ca évite d'avoir à créer un nouveau fichier }
      if FileExists(Dir + InputFile) then
         Output.LoadFromFile(Dir + InputFile);
      DeleteFile(Dir + InputFile);
      if FileExists(Dir + ErrorsFile) then
         ErrorsList.LoadFromFile(Dir + ErrorsFile);
      DeleteFile(Dir + ErrorsFile);

      SetLength(Infos, 0);
      for i := 0 to ErrorsList.Count - 1 do
      begin
         if ErrorsList[i] = '' then
            Break;
         if LeftStr(ErrorsList[i], 5) = 'Info:' then
         begin
            SetLength(Infos, length(Infos) + 1);
            Infos[length(Infos) - 1] := RightStr(ErrorsList[i],
               length(ErrorsList[i]) - 6);
         end
      end;

      SetLength(Warnings, 0);
      for i := 0 to ErrorsList.Count - 1 do
      begin
         if ErrorsList[i] = '' then
            Break;
         if pos('- Warning:', ErrorsList[i]) <> 0 then
         begin
            SetLength(Warnings, length(Warnings) + 1);
            Warnings[length(Warnings) - 1].line := ExtractNumber(ErrorsList[i],
               pos('line ', ErrorsList[i]) + 5);
            Warnings[length(Warnings) - 1].column :=
               ExtractNumber(ErrorsList[i], pos('column ', ErrorsList[i]) + 7);
            Warnings[length(Warnings) - 1].text := RightStr(ErrorsList[i],
               length(ErrorsList[i]) - pos('Warning: ', ErrorsList[i]) - 8);
         end
      end;

      SetLength(Errors, 0);
      for i := 0 to ErrorsList.Count - 1 do
      begin
         if ErrorsList[i] = '' then
            Break;
         if pos('- Error:', ErrorsList[i]) <> 0 then
         begin
            SetLength(Errors, length(Errors) + 1);
            Errors[length(Errors) - 1].line := ExtractNumber(ErrorsList[i],
               pos('line ', ErrorsList[i]) + 5);
            Errors[length(Errors) - 1].column := ExtractNumber(ErrorsList[i],
               pos('column ', ErrorsList[i]) + 7);
            Errors[length(Errors) - 1].text := RightStr(ErrorsList[i],
               length(ErrorsList[i]) - pos('Error: ', ErrorsList[i]) - 6);
         end
      end;

   end
   else
      Result := 3;
   ErrorsList.Free;
end;

end.

