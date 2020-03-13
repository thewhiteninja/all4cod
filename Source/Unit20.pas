unit Unit20;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, StdCtrls, ExtCtrls, IniFiles, Fonctions;

type
   TForm20 = class(TForm)
      StatusBar1: TStatusBar;
      Button1: TButton;
      Image1: TImage;
      GroupBox1: TGroupBox;
      GroupBox2: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Timer1: TTimer;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Timer1Timer(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      { Déclarations privées }
   public
      procedure ChargeProjet;
   end;

var
   Form20: TForm20;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm20.FormCreate(Sender: TObject);
var i: TInifile;
begin
   Icon.Handle := Application.Icon.Handle;
   i := TIniFile.Create(Form1.CurrentFileLanguage);
   with i do
   begin
      Caption := ReadString('INFOPROJECT', '0', '');
      GroupBox1.Caption := ReadString('INFOPROJECT', '1', '');
      Label1.Caption := ReadString('INFOPROJECT', '2', '');
      Label8.Caption := ReadString('INFOPROJECT', '3', '');
      Label2.Caption := ReadString('INFOPROJECT', '4', '');
      GroupBox2.Caption := ReadString('INFOPROJECT', '5', '');
      Label3.Caption := ReadString('INFOPROJECT', '6', '');
      Label4.Caption := ReadString('INFOPROJECT', '7', '');
      Label6.Caption := ReadString('INFOPROJECT', '8', '');
      Label5.Caption := ReadString('INFOPROJECT', '9', '');
      Button1.Caption := ReadString('INFOPROJECT', '11', '');
      Label7.Caption := ReadString('INFOPROJECT', '10', '');
      free;
   end;
   Timer1.Enabled := true;
end;

procedure TForm20.ChargeProjet;
var i, res: integer;
   s: TStringList;
begin
   StatusBar1.SimpleText := ExtractFileName(Form1.Projet.NomFichier);
   Label9.Caption := Form1.Projet.Infos.Nom;
   Label10.Caption := Form1.Projet.Infos.Auteur;
   Label11.Caption := Form1.Projet.Infos.Date;
   if (Form1.Projet.Infos.Icone <> '') and FileExists(Form1.Projet.Infos.Icone) then
   begin
      Image1.Picture.LoadFromFile(Form1.Projet.Infos.Icone);
      Label7.Visible := false;
   end;
   Label12.Caption := IntToStr(Form1.Projet.Fichiers.Count);
   res := 0;
   for i := 0 to form1.Projet.Fichiers.Count - 1 do
   begin
      if FileExists(form1.Projet.Fichiers[i]) then
      begin
         s := TStringList.Create;
         try
            s.LoadFromFile(form1.Projet.Fichiers[i]);
            res := res + s.Count;
         finally
            s.Free;
         end;
      end;
   end;
   Label13.Caption := IntToStr(res);
   res := 0;
   for i := 0 to form1.Projet.Fichiers.Count - 1 do
   begin
      if FileExists(form1.Projet.Fichiers[i]) then res := res + TailleFichierSimple(form1.Projet.Fichiers[i]);
   end;
   label14.Caption := TailleFormat(res);
   Label15.Caption := FormatDateTime('hh:mm:ss', now - Form1.Projet.OuvertDepuis);
end;

procedure TForm20.Button1Click(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TForm20.Timer1Timer(Sender: TObject);
begin
   Label15.Caption := FormatDateTime('hh:mm:ss', now - Form1.Projet.OuvertDepuis);
end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Timer1.Enabled := false;
end;

end.
