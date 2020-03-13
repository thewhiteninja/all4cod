program All4Cod;

{
  Ajout au projet du fichier de ressource Default qui contient le fichier
  de langue correspondant au Français
  (cf Default.rc et Default.lng)
}
{$R 'Default.res' 'Default.rc'}

uses
   Forms, SysUtils, Windows, Inifiles, ShellApi, Fonctions, 
   Unit1 in 'Unit1.pas' {Form1},
   Unit2 in 'Unit2.pas' {Form2},
   Unit3 in 'Unit3.pas' {Form3},
   Unit4 in 'Unit4.pas' {Form4},
   Unit5 in 'Unit5.pas' {Form5},
   Unit6 in 'Unit6.pas' {Form6},
   Unit7 in 'Unit7.pas' {Form7},
   Unit8 in 'Unit8.pas' {Form8},
   Unit9 in 'Unit9.pas' {Form9},
   Unit10 in 'Unit10.pas' {Form10},
   Unit11 in 'Unit11.pas' {Form11},
   Unit12 in 'Unit12.pas' {Form12},
   Unit13 in 'Unit13.pas' {Form13},
   Unit14 in 'Unit14.pas' {Form14},
   Unit15 in 'Unit15.pas' {Form15},
   Unit16 in 'Unit16.pas' {Form16},
   Unit17 in 'Unit17.pas' {Form17},
   Unit18 in 'Unit18.pas' {Form18},
   Unit19 in 'Unit19.pas' {Form19},
   Unit20 in 'Unit20.pas' {Form20},
   Unit21 in 'Unit21.pas' {Form21};

{$R *.res}

var
   une_seule_instance, affiche_splash : boolean;
   t : Cardinal;
   Ini : TIniFile;

begin
   // Options des Hint (Bulles d'aide)
   Application.HintPause := 0; // Délai avant affichage
   Application.HintHidePause := 5000; // Délai avant fin
   Application.HintShortCuts := true; // Présence des raccourcis

   SetCurrentDir(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)));

   // Si il y a une mise à jour téléchargée
   if
      FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
      + 'Update\All4Cod.exe') then
   begin
      // On déplace le fichier pour ne plus relancer la mise à jour
      MoveFile(pchar(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
         + 'Update\All4Cod.exe'),
         pchar(IncludeTrailingPathDelimiter(GetTempDossier) +
         'All4Cod.exe'));
      DeleteFile(pchar(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
         + 'Update\All4Cod.exe'));
      // Lancement de la mise à jour (Installateur)
      ShellExecute(0, pchar('open'),
         pchar(IncludeTrailingPathDelimiter(GetTempDossier) + 'All4Cod.exe'),
         nil,
         nil, SW_NORMAL);
      Exit;
   end;

   // Lecture des options
   Ini := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini');
   try
      une_seule_instance := Ini.ReadBool('Generales', 'UneSeuleInstance', true);
      affiche_splash := Ini.ReadBool('Generales', 'Splash', true);
   finally
      Ini.Free
   end;
   // Création du mutex
   SetLastError(NO_ERROR);
   CreateMutex(nil, false, 'All4Cod');

   // Si il n'y pas deux mutex ou qu'on autorise plusieurs instance
   if ((GetLastError <> ERROR_ALREADY_EXISTS) or not (une_seule_instance)) then
   begin
      // Initialisation
      Application.Initialize;
      Application.Title := 'All4Cod';

      // Affichage du splash-screen (Form13)
      if affiche_splash then
      begin
         Form13 := TForm13.Create(nil);
         try
            Form13.Show;
            Form13.Update; // Nécéssaire pour les TCaption
         except
         end;
      end;
      t := GetTickCount;

      // Création de Form1 (principale) et Form3 (Options)
      Application.CreateForm(TForm1, Form1);
      Application.CreateForm(TForm3, Form3);
      // Affiche le splash-screen au moins 3 secondes
      while GetTickCount - t < 3000 do
         Application.ProcessMessages;

      // Libération de la Form13
      if Assigned(Form13) then
      begin
         Form13.Close;
         Form13.Release;
      end;

      // Lancement
      Application.Run;
   end;
end.

