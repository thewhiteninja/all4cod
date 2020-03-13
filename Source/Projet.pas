unit Projet;

interface

uses Windows, Classes, Forms, Dialogs, SysUtils, StrUtils, Fonctions,
   ComCtrls, IniFiles;

type
   TProjetOptions = record
      Compile_Exe : string;
      Compile_Param : string;
      Compile_Timeout1 : integer;
      Compile_Timeout2 : integer;
      Compile_Priority : integer;
      Compile_Show : integer;
      Execute_Exe : string;
      Execute_Param : string;
      Execute_Show : integer;
   end;

type
   TProjetVersion = record
      Major : integer;
      Minor : integer;
      Release : integer;
      Build : integer;
      FileDescription : string;
      FileVersion : string;
      ProductName : string;
      OriginalFileName : string;
      InternalFileName : string;
      CompanyName : string;
      LegalCopyright : string;
      LegalTrademarks : string;
      ProductVersion : string;
   end;

type
   TProjetInfos = record
      Auteur : string;
      Nom : string;
      Date : string;
      Commentaire : string;
      Icone : string;
      AutoIncBuild : boolean;
   end;

type
   TProjet = class(TObject)
   private
      procedure EnregistrerProjet;
      procedure EnregistrerSousProjet;
   public
      NomFichier : string;
      Ouvert : boolean;
      OuvertDepuis : TDateTime;
      Fichiers : TStringlist;
      Options : TProjetOptions;
      Infos : TProjetInfos;
      Version : TProjetVersion;
      procedure Nouveau;
      procedure NouveauVide;
      procedure Ouvrir(f : string);
      procedure Enregistrer;
      procedure EnregistrerSous;
      procedure AjouterFichiers;
      procedure SupprimerFichiers;
      procedure Affiche;
      procedure Fermer;
      constructor Create;
      destructor Destroy; override;
   end;

implementation

uses Unit1, Unit2, Unit18, Unit21;

constructor TProjet.Create;
begin
   inherited Create;
   NomFichier := '';
   Ouvert := false;
   OuvertDepuis := now;
   Fichiers := TStringList.Create;
   with Options do
   begin
      Compile_exe := '';
      Compile_param := '';
      Compile_Timeout1 := 0;
      Compile_Timeout2 := 0;
      Compile_Priority := 1;
      Compile_Show := 0;
      Execute_exe := '';
      Execute_param := '';
      Execute_show := 3;
   end;
   with Infos do
   begin
      Nom := '';
      Auteur := '';
      Date := '';
      Commentaire := '';
      Icone := '';
      AutoIncBuild := false;
   end;
   with Version do
   begin
      major := 0;
      minor := 0;
      release := 0;
      build := 0;
      FileDescription := '';
      FileVersion := '';
      ProductName := '';
      OriginalFileName := '';
      InternalFileName := '';
      CompanyName := '';
      LegalCopyright := '';
      LegalTrademarks := '';
      ProductVersion := '';
   end;
end;

destructor TProjet.Destroy;
begin
   Fichiers.Free;
   inherited Destroy;
end;

procedure TProjet.Affiche;
var
   i : integer;
   t1, t2, t3, t4 : TTreeNode;
begin
   if Ouvert then
   begin
      with Form1 do
      begin
         TreeView1.Items.BeginUpdate;
         if TreeView1.Items.Count > 0 then Form1.TreeView1.Items[0].Delete;
         t1 := TreeView1.Items.Add(nil, ExtractFileName(NomFichier));
         t1.ImageIndex := 101; t1.StateIndex := 101; t1.SelectedIndex := 101;
         t2 := TreeView1.Items.AddChild(t1, 'Informations');
         t2.ImageIndex := 102; t2.StateIndex := 102; t2.SelectedIndex := 102;
         t3 := TreeView1.Items.AddChild(t2, 'Nom : ' + Infos.Nom);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Auteur : ' + Infos.Auteur);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Date : ' + Infos.Date);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Commentaire : ' + Infos.Commentaire);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'AutoIncBuild : ' + BoolToStr(Infos.AutoIncBuild, true));
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Icone : ' + Infos.Icone);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t2 := TreeView1.Items.AddChild(t1, 'Fichiers');
         t2.ImageIndex := 103; t2.StateIndex := 103; t2.SelectedIndex := 103;
         for i := 0 to Fichiers.Count - 1 do
         begin
            t3 := TreeView1.Items.AddChild(t2, ExtractFileName(Fichiers[i]));
            t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         end;

         t2 := TreeView1.Items.AddChild(t1, 'Options');
         t2.ImageIndex := 104; t2.StateIndex := 104; t2.SelectedIndex := 104;
         t3 := TreeView1.Items.AddChild(t2, 'Compile');
         t3.ImageIndex := 25; t3.StateIndex := 25; t3.SelectedIndex := 25;
         t4 := TreeView1.Items.AddChild(t3, 'Program : ' + Options.Compile_exe);
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t4 := TreeView1.Items.AddChild(t3, 'Param : ' + Options.Compile_param);
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t4 := TreeView1.Items.AddChild(t3, 'TimeOut1 : ' + IntToStr(Options.Compile_Timeout1));
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t4 := TreeView1.Items.AddChild(t3, 'TimeOut2 : ' + IntToStr(Options.Compile_Timeout2));
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t4 := TreeView1.Items.AddChild(t3, 'Priority : ' + IntToStr(Options.Compile_Priority));
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t4 := TreeView1.Items.AddChild(t3, 'Show : ' + IntToStr(Options.Compile_Show));
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Execute');
         t3.ImageIndex := 42; t3.StateIndex := 42; t3.SelectedIndex := 42;
         t4 := TreeView1.Items.AddChild(t3, 'Program : ' + Options.Execute_exe);
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t4 := TreeView1.Items.AddChild(t3, 'Param : ' + Options.Execute_param);
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;
         t4 := TreeView1.Items.AddChild(t3, 'Show : ' + IntToStr(Options.Execute_show));
         t4.ImageIndex := 106; t4.StateIndex := 106; t4.SelectedIndex := 106;

         t2 := TreeView1.Items.AddChild(t1, 'Version');
         t2.ImageIndex := 105; t2.StateIndex := 105; t2.SelectedIndex := 105;
         t3 := TreeView1.Items.AddChild(t2, 'Major : ' + IntToStr(Version.Major));
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Minor : ' + IntToStr(Version.minor));
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Release : ' + IntToStr(Version.release));
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Build : ' + IntToStr(Version.build));
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;

         t3 := TreeView1.Items.AddChild(t2, 'Description du fichier : ' + Version.FileDescription);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Version du fichier : ' + Version.FileVersion);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Nom du produit : ' + Version.ProductName);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Version du produit : ' + Version.ProductVersion);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Nom d''origine : ' + Version.OriginalFileName);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Nom interne : ' + Version.InternalFileName);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Entreprise : ' + Version.CompanyName);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Copyright : ' + Version.LegalCopyright);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         t3 := TreeView1.Items.AddChild(t2, 'Marques légales : ' + Version.LegalTrademarks);
         t3.ImageIndex := 106; t3.StateIndex := 106; t3.SelectedIndex := 106;
         TreeView1.Items[0].Expand(false);
         TreeView1.Items.EndUpdate;
      end;
   end
   else if Form1.TreeView1.Items.Count > 0 then Form1.TreeView1.Items[0].Delete;
end;

procedure TProjet.NouveauVide;
begin
   NomFichier := '';
   Ouvert := true;
   OuvertDepuis := now;
   Fichiers.Clear;
   with Options do
   begin
      Compile_exe := '';
      Compile_param := '';
      Compile_Timeout1 := 0;
      Compile_Timeout2 := 0;
      Compile_Priority := 1;
      Compile_Show := 0;
      Execute_exe := '';
      Execute_param := '';
      Execute_show := 3;
   end;
   with Infos do
   begin
      Nom := '';
      Auteur := '';
      Date := '';
      Commentaire := '';
      Icone := '';
      AutoIncBuild := false;
   end;
   with Version do
   begin
      major := 0;
      minor := 0;
      release := 0;
      build := 0;
      FileDescription := '';
      FileVersion := '';
      ProductName := '';
      OriginalFileName := '';
      InternalFileName := '';
      CompanyName := '';
      LegalCopyright := '';
      LegalTrademarks := '';
      ProductVersion := '';
   end;
   Enregistrer;
   Ouvert := NomFichier <> '';
   Affiche;
end;

procedure TProjet.Nouveau;
begin
   with TForm21.Create(Application) do
   begin
      ShowModal;
      free;
   end;
end;

procedure TProjet.AjouterFichiers;
var
   i : integer;
begin
   if Form1.OpenDialog1.Execute then
   begin
      for i := 0 to Form1.OpenDialog1.Files.Count - 1 do
      begin
         Fichiers.Add(Form1.OpenDialog1.Files[i]);
         Form1.Ouvrir(Form1.OpenDialog1.Files[i], true);
      end;
      Affiche;
   end;
end;

procedure TProjet.Supprimerfichiers;
begin
   with TForm18.Create(Application) do
   begin
      ListBox1.Items.Assign(Fichiers);
      ShowModal;
      Free;
   end;
end;

procedure TProjet.Ouvrir(f : string);
var
   ini : TIniFile;
   i : integer;
begin
   NomFichier := f;
   Ouvert := true;
   OuvertDepuis := now;
   ini := TIniFile.Create(f);
   with ini do
   begin
      for i := 0 to ReadInteger('Files', 'Count', 0) - 1 do Fichiers.Add(ReadString('Files', IntToStr(i), ''));
      with Options do
      begin
         Compile_exe := ReadString('Compile', 'Program', '');
         Compile_param := ReadString('Compile', 'Param', '');
         Compile_Timeout1 := ReadInteger('Compile', 'TimeOut1', 0);
         Compile_Timeout2 := ReadInteger('Compile', 'TimeOut2', 0);
         Compile_Priority := ReadInteger('Compile', 'Priority', 1);
         Compile_Show := ReadInteger('Compile', 'Show', 0);
         Execute_exe := ReadString('Execute', 'Program', '');
         Execute_param := ReadString('Execute', 'Param', '');
         Execute_show := ReadInteger('Execute', 'Show', 3);
      end;
      with Infos do
      begin
         Nom := ReadString('Informations', 'Name', '');
         Auteur := ReadString('Informations', 'Author', '');
         Date := ReadString('Informations', 'Date', '');
         Commentaire := ReadString('Informations', 'Comments', '');
         Icone := ReadString('Informations', 'Icon', '');
         AutoIncBuild := ReadBool('Informations', 'AutoIncBuild', false);
      end;
      with Version do
      begin
         major := ReadInteger('Version', 'Major', 0);
         minor := ReadInteger('Version', 'Minor', 0);
         release := ReadInteger('Version', 'Release', 0);
         build := ReadInteger('Version', 'Build', 0);
         FileDescription := ReadString('Version', 'FileDescription', '');
         FileVersion := ReadString('Version', 'FileVersion', '');
         ProductName := ReadString('Version', 'ProductName', '');
         OriginalFileName := ReadString('Version', 'OriginalFileName', '');
         InternalFileName := ReadString('Version', 'InternalFileName', '');
         CompanyName := ReadString('Version', 'CompanyName', '');
         LegalCopyright := ReadString('Version', 'LegalCopyright', '');
         LegalTrademarks := ReadString('Version', 'LegalTrademarks', '');
         ProductVersion := ReadString('Version', 'ProductVersion', '');
      end;
      free;
   end;
   for i := 0 to Fichiers.Count - 1 do Form1.Ouvrir(Fichiers[i], true);
   Affiche;
end;

procedure TProjet.Enregistrer;
begin
   if NomFichier = '' then
   begin
      EnregistrerSousProjet;
   end
   else EnregistrerProjet;
end;

procedure TProjet.EnregistrerSous;
begin
   EnregistrerSousProjet;
end;

procedure TProjet.Fermer;
var
   o : integer;
begin
   for o := Form1.MDIChildCount - 1 downto 0 do
   begin
      if Form1.FicheEditeur(o) and (TForm2(Form1.MDIChildren[o]).Projet) then
      begin
         TForm2(Form1.MDIChildren[o]).Close;
      end;
   end;
   Application.ProcessMessages;
   if Form1.MDIChildCount = 0 then
   begin
      Form1.TabControl1.Tabs.Clear;
      Form1.Panel8.Visible := false;
      Form1.ListBox3.Clear;
   end;
   NomFichier := '';
   Ouvert := false;
   OuvertDepuis := now;
   Fichiers.Clear;
   with Options do
   begin
      Compile_exe := '';
      Compile_param := '';
      Compile_Timeout1 := 0;
      Compile_Timeout2 := 0;
      Compile_Priority := 1;
      Compile_Show := 0;
      Execute_exe := '';
      Execute_param := '';
      Execute_show := 3;
   end;
   with Infos do
   begin
      Nom := '';
      Auteur := '';
      Date := '';
      Commentaire := '';
      Icone := '';
      AutoIncBuild := false;
   end;
   with Version do
   begin
      major := 0;
      minor := 0;
      release := 0;
      build := 0;
      FileDescription := '';
      FileVersion := '';
      ProductName := '';
      OriginalFileName := '';
      InternalFileName := '';
      CompanyName := '';
      LegalCopyright := '';
      LegalTrademarks := '';
      ProductVersion := '';
   end;
   Affiche;
end;

procedure TProjet.EnregistrerSousProjet;
var
   tmp : string;
   ini : TIniFile;
   i : integer;
begin
   tmp := Form1.SaveDialog1.Filter;
   Form1.SaveDialog1.Filter := 'All4Cod Project|*.ap';
   if form1.SaveDialog1.Execute then
   begin
      NomFichier := ChangeFileExt(Form1.SaveDialog1.FileName, '.ap');
      ini := TIniFile.Create(NomFichier);
      with ini do
      begin
         for i := 0 to Fichiers.Count - 1 do WriteString('Files', IntToStr(i), Fichiers[i]);
         WriteInteger('Files', 'Count', Fichiers.Count);
         with Options do
         begin
            WriteString('Compile', 'Program', Compile_exe);
            WriteString('Compile', 'Param', Compile_param);
            WriteInteger('Compile', 'TimeOut1', Compile_Timeout1);
            WriteInteger('Compile', 'TimeOut2', Compile_Timeout2);
            WriteInteger('Compile', 'Priority', Compile_Priority);
            WriteInteger('Compile', 'Show', Compile_Show);
            WriteString('Execute', 'Program', Execute_exe);
            WriteString('Execute', 'Param', Execute_param);
            WriteInteger('Execute', 'Show', Execute_show);
         end;
         with Infos do
         begin
            WriteString('Informations', 'Name', Nom);
            WriteString('Informations', 'Author', Auteur);
            WriteString('Informations', 'Date', Date);
            WriteString('Informations', 'Comments', Commentaire);
            WriteString('Informations', 'Icon', Icone);
            WriteBool('Informations', 'AutoIncBuild', AutoIncBuild);
         end;
         with Version do
         begin
            WriteInteger('Version', 'Major', major);
            WriteInteger('Version', 'Minor', minor);
            WriteInteger('Version', 'Release', release);
            WriteInteger('Version', 'Build', build);
            WriteString('Version', 'FileDescription', FileDescription);
            WriteString('Version', 'FileVersion', FileVersion);
            WriteString('Version', 'ProductName', ProductName);
            WriteString('Version', 'ProductVersion', ProductVersion);
            WriteString('Version', 'OriginalFileName', OriginalFileName);
            WriteString('Version', 'InternalFileName', InternalFileName);
            WriteString('Version', 'CompanyName', CompanyName);
            WriteString('Version', 'LegalCopyright', LegalCopyright);
            WriteString('Version', 'LegalTrademarks', LegalTrademarks);
         end;
         free;
      end;
      for i := 0 to Fichiers.Count - 1 do
      begin
         if form1.FicheEditeur(i) then Tform2(Form1.MDIChildren[i]).Enregistrer;
      end;
      Affiche;
   end;
   Form1.SaveDialog1.Filter := tmp;
end;

procedure TProjet.EnregistrerProjet;
var
   ini : TIniFile;
   i : integer;
begin
   ini := TIniFile.Create(NomFichier);
   with ini do
   begin
      for i := 0 to Fichiers.Count - 1 do WriteString('Files', IntToStr(i), Fichiers[i]);
      WriteInteger('Files', 'Count', Fichiers.Count);
      with Options do
      begin
         WriteString('Compile', 'Program', Compile_exe);
         WriteString('Compile', 'Param', Compile_param);
         WriteInteger('Compile', 'TimeOut1', Compile_Timeout1);
         WriteInteger('Compile', 'TimeOut2', Compile_Timeout2);
         WriteInteger('Compile', 'Priority', Compile_Priority);
         WriteInteger('Compile', 'Show', Compile_Show);
         WriteString('Execute', 'Program', Execute_exe);
         WriteString('Execute', 'Param', Execute_param);
         WriteInteger('Execute', 'Show', Execute_show);
      end;
      with Infos do
      begin
         WriteString('Informations', 'Name', Nom);
         WriteString('Informations', 'Author', Auteur);
         WriteString('Informations', 'Date', Date);
         WriteString('Informations', 'Comments', Commentaire);
         WriteString('Informations', 'Icon', Icone);
         WriteBool('Informations', 'AutoIncBuild', AutoIncBuild);
      end;
      with Version do
      begin
         WriteInteger('Version', 'Major', major);
         WriteInteger('Version', 'Minor', minor);
         WriteInteger('Version', 'Release', release);
         WriteInteger('Version', 'Build', build);
         WriteString('Version', 'FileDescription', FileDescription);
         WriteString('Version', 'FileVersion', FileVersion);
         WriteString('Version', 'ProductName', ProductName);
         WriteString('Version', 'ProductVersion', ProductVersion);
         WriteString('Version', 'OriginalFileName', OriginalFileName);
         WriteString('Version', 'InternalFileName', InternalFileName);
         WriteString('Version', 'CompanyName', CompanyName);
         WriteString('Version', 'LegalCopyright', LegalCopyright);
         WriteString('Version', 'LegalTrademarks', LegalTrademarks);
      end;
      free;
   end;
   for i := 0 to Fichiers.Count - 1 do
   begin
      if form1.FicheEditeur(i) then Tform2(Form1.MDIChildren[i]).Enregistrer;
   end;
end;

end.

