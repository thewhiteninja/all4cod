unit Unit18;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ComCtrls, Inifiles;

type
   TForm18 = class(TForm)
      ListBox1 : TListBox;
      Button1 : TButton;
      Button2 : TButton;
      Button3 : TButton;
      procedure Button1Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure FormCreate(Sender : TObject);
      procedure Button3Click(Sender : TObject);
   private
      { Déclarations privées }
   public
      { Déclarations publiques }
   end;

var
   Form18 : TForm18;

implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure TForm18.Button3Click(Sender : TObject);
begin
   ModalResult := mrCancel;
end;

procedure TForm18.FormCreate(Sender : TObject);
var
   i : TInifile;
begin
   Icon.Handle := Application.Icon.Handle;
   i := TIniFile.Create(Form1.CurrentFileLanguage);
   with i do
   begin
      Caption := ReadString('SUPPRIMER_PROJET', '0', '') + ' ' + ExtractFileName(Form1.Projet.NomFichier);
      Button1.Caption := ReadString('SUPPRIMER_PROJET', '1', '');
      Button2.Caption := ReadString('SUPPRIMER_PROJET', '2', '');
      Button3.Caption := ReadString('SUPPRIMER_PROJET', '3', '');
      free;
   end;
end;

procedure TForm18.Button2Click(Sender : TObject);
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
   Form1.Projet.Fichiers.Clear;
   ListBox1.Clear;
   Form1.Projet.Affiche;
   ModalResult := mrOk;
end;

procedure TForm18.Button1Click(Sender : TObject);
var
   i, o : integer;
begin
   for i := ListBox1.Items.Count - 1 downto 0 do
   begin
      if ListBox1.Selected[i] then
      begin
         for o := 0 to Form1.MDIChildCount - 1 do
         begin
            if Form1.FicheEditeur(i) and (ListBox1.Items[i] = TForm2(Form1.MDIChildren[o]).Nom) then
            begin
               Form1.MDIChildren[o].Close;
            end;
         end;
         Form1.Projet.Fichiers.Delete(i);
         ListBox1.Items.Delete(i);
      end;
   end;
   Form1.Projet.Affiche;
end;

end.
