unit Unit21;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ShellCtrls, StdCtrls, ExtCtrls, Fonctions, Inifiles;

type
   TForm21 = class(TForm)
      StatusBar1 : TStatusBar;
      GroupBox1 : TGroupBox;
      ShellTreeView1 : TShellTreeView;
      Button1 : TButton;
      Button2 : TButton;
      LabeledEdit1 : TLabeledEdit;
      LabeledEdit2 : TLabeledEdit;
      LabeledEdit3 : TLabeledEdit;
      Image1 : TImage;
      Button3 : TButton;
      Button4 : TButton;
      GroupBox2 : TGroupBox;
      ShellListView1 : TShellListView;
      Label1 : TLabel;
      procedure Button4Click(Sender : TObject);
      procedure ShellListView1Click(Sender : TObject);
      procedure Button3Click(Sender : TObject);
      procedure Button1Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      Icone_path : string;
   end;

var
   Form21 : TForm21;

implementation

uses Unit1, Projet;

{$R *.dfm}

procedure TForm21.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('NOUVEAU_PROJET', '0', '');
      GroupBox1.Caption := ReadString('NOUVEAU_PROJET', '1', '');
      GroupBox2.Caption := ReadString('NOUVEAU_PROJET', '2', '');
      LabeledEdit1.EditLabel.Caption := ReadString('NOUVEAU_PROJET', '3', '');
      LabeledEdit2.EditLabel.Caption := ReadString('NOUVEAU_PROJET', '4', '');
      LabeledEdit3.EditLabel.Caption := ReadString('NOUVEAU_PROJET', '5', '');
      Button3.Caption := ReadString('NOUVEAU_PROJET', '6', '');
      Button4.Caption := ReadString('NOUVEAU_PROJET', '7', '');
      Button1.Caption := ReadString('NOUVEAU_PROJET', '8', '');
      Button2.Caption := ReadString('NOUVEAU_PROJET', '9', '');
      Label1.Caption := ReadString('NOUVEAU_PROJET', '10', '');
      free;
   end;
   Icone_path := '';
   ShellTreeView1.Root := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Templates\Projects';
   LabeledEdit3.Text := DateToStr(now);
end;

procedure TForm21.Button2Click(Sender : TObject);
begin
   ModalResult := mrCancel;
end;

procedure TForm21.Button1Click(Sender : TObject);
var
   ini : TInifile;
   i : Integer;
   copie : String;
begin
   if ShellListView1.SelCount > 0 then
   begin
      with Form1.Projet do
      begin
         NomFichier := '';
         OuvertDepuis := Now;
         Fichiers.Clear;
         with Options do
         begin
            Compile_exe := '';
            Compile_param := '';
            Compile_Timeout1 := 0;
            Compile_Timeout2 := 0;
            Compile_Priority := 1;
            Compile_Show := 3;
            Execute_exe := '';
            Execute_param := '';
            Execute_show := 3;
         end;
         with Infos do
         begin
            Nom := LabeledEdit1.Text;
            Auteur := LabeledEdit2.Text;
            Date := LabeledEdit3.Text;
            Commentaire := '';
            Icone := Icone_path;
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
         if Ouvert then
         begin
            ini := TIniFile.Create(ShellListView1.SelectedFolder.PathName);
            with ini do
            begin
               for i := 0 to ReadInteger('Files', 'Count', 0) - 1 do
               begin
                  copie := IncludeTrailingPathDelimiter(ExtractFileDir(NomFichier)) + ExtractFileName(ReadString('Files', IntToStr(i), ''));
                  CopyFile(pchar(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + ReadString('Files', IntToStr(i), '')), pchar(copie), false);
                  FileSetAttr(copie, FileGetAttr(copie) and not (faHidden));
                  Fichiers.Add(copie);
               end;
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
               free;
            end;
            for i := 0 to Fichiers.Count - 1 do Form1.Ouvrir(Fichiers[i], true);
         end;
         Enregistrer;
         Affiche;
      end;
      ModalResult := mrOK;
   end;
end;

procedure TForm21.Button3Click(Sender : TObject);
begin
   Image1.Picture := nil;
   Icone_path := '';
   Label1.Visible := true;
end;

procedure TForm21.ShellListView1Click(Sender : TObject);
var
   i : TIniFile;
begin
   if ShellListView1.SelCount > 0 then
   begin
      i := TIniFile.Create(ShellListView1.SelectedFolder.PathName);
      with i do
      begin
         LabeledEdit1.Text := ReadString('Informations', 'Name', '');
         if FileExists(ReadString('Informations', 'Icon', '')) then
         begin
            Icone_path := ReadString('Informations', 'Icon', '');
            Image1.Picture.LoadFromFile(Icone_path);
         end;
         free;
      end;
   end
   else
   begin
      Label1.Visible := true;
      Image1.Picture := nil;
      Icone_path := '';
   end;
end;

procedure TForm21.Button4Click(Sender : TObject);
var
   tmp : string;
begin
   tmp := Form1.OpenDialog1.Filter;
   Form1.OpenDialog1.Filter := '(*.ico)|*.ico';
   Form1.OpenDialog1.Title := form1.GetText('88');
   if Form1.OpenDialog1.Execute then
   begin
      Icone_path := Form1.OpenDialog1.FileName;
      Image1.Picture.LoadFromFile(Icone_path);
      Label1.Visible := false;
   end;
   Form1.OpenDialog1.Filter := tmp;
end;

end.

