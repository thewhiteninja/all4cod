unit Unit12;

interface

uses
   SysUtils, Variants, Forms, StrUtils, SynEdit, Math, Classes, Controls,
   ComCtrls, Fonctions, IniFiles;

type
   TForm12 = class(TForm)
      StatusBar1 : TStatusBar;
      PageControl1 : TPageControl;
      TabSheet1 : TTabSheet;
      TabSheet2 : TTabSheet;
      ListView1 : TListView;
      ListView2 : TListView;
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      nbline, nbmots, nbchar, nbcharret, taille, datecre, datemod, attrib,
         hidden, lect, archive, inconnu, octet : string;
      procedure Prop(nom : string; SynEdit : TCustomSynEdit);
      function ItemAdd(c1, c2, c3 : string; List1 : boolean) : boolean;
   end;

var
   Form12 : TForm12;

implementation

uses Unit1, Unit3;

{$R *.dfm}

function TForm12.ItemAdd(c1, c2, c3 : string; List1 : boolean) : boolean;
var
   item : TListItem;
begin
   if List1 then
      item := ListView1.Items.Add
   else
      item := ListView2.Items.Add;
   item.Caption := (c1);
   if c2 <> '' then
      item.SubItems.Add(c2);
   if c3 <> '' then
      item.SubItems.Add(c3);
   Result := true;
end;

procedure TForm12.Prop(nom : string; Synedit : TCustomSynEdit);
var
   Liste : TStringList;
   i, occ, count : integer;
   old : string;
begin
   ListView1.Clear;
   ListView2.Clear;
   Liste := TStringList.Create;
   StatusBar1.SimpleText := nom;
   ItemAdd(nbline, IntToStr(SynEdit.Lines.Count), '', true);
   extraireMots(SynEdit.Lines.Text, Liste, true, [' ', ',', '.', ';']);
   count := Liste.Count;
   for i := 0 to Count - 1 do
      liste[i] := AnsiReplaceText(Liste[i], #13#10, '');
   for i := 0 to Count - 1 do
      liste[i] := AnsiReplaceText(Liste[i], #9, '');
   ItemAdd(nbmots, IntToStr(Count), '', true);
   ItemAdd(nbchar, VarToStr(Length(SynEdit.Lines.Text)), '', true);
   ItemAdd(nbcharret, IntToStr(Length(SynEdit.Lines.Text) + (SynEdit.Lines.Count
      - 1) * 2), '', true);
   ItemAdd('', '', '', true);
   if TailleFichier(nom) = 'I' then
      ItemAdd(taille, inconnu, '', true)
   else
      ItemAdd(taille, AnsiReplaceText(TailleFichier(nom), 'octets', octet), '',
         true);
   ItemAdd('', '', '', true);
   if FileExists(nom) then
      ItemAdd(datecre, DateTimeToStr(DateHeureCreationFichier(nom)), '', true)
   else
      ItemAdd(datecre, inconnu, '', true);
   if FileExists(nom) then
      ItemAdd(datemod, DateTimeToStr(TimeModificationFichier(nom)), '', true)
   else
      ItemAdd(datemod, inconnu, '', true);
   ItemAdd('', '', '', true);
   ItemAdd(attrib, '', '', true);
   if FileExists(nom) then
   begin
      i := FileGetAttr(nom);
      if (i and faReadOnly <> 0) then
         ItemAdd(lect, 'O', '', true)
      else
         ItemAdd(lect, 'X', '', true);
      if (i and faHidden <> 0) then
         ItemAdd(hidden, 'O', '', true)
      else
         ItemAdd(hidden, 'X', '', true);
      if (i and faArchive <> 0) then
         ItemAdd(archive, 'O', '', true)
      else
         ItemAdd(archive, 'X', '', true);
   end
   else
   begin
      ItemAdd(lect, inconnu, '', true);
      ItemAdd(hidden, inconnu, '', true);
      ItemAdd(archive, inconnu, '', true);
   end;
   liste.Sort;
   occ := 1;
   old := Liste[0];
   for i := 1 to Count do
   begin
      if i = Count then
      begin
         ItemAdd(Liste[Count - 1], IntToStr(occ), FloatToStr(RoundTo(occ * (1 /
            Count), -2)), false);
      end
      else
      begin
         if Liste[i] = old then
            inc(occ)
         else
         begin
            ItemAdd(old, IntToStr(occ), FloatToStr(RoundTo(occ * (1 / Count),
               -2)), false);
            old := Liste[i];
            occ := 1;
         end;
      end;
   end;
   Liste.Free;
end;

procedure TForm12.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('PROPRIETES', '0', '');
      TabSheet1.Caption := ReadString('PROPRIETES', '1', '');
      TabSheet2.Caption := ReadString('PROPRIETES', '2', '');
      ListView1.Columns[0].Caption := ReadString('PROPRIETES', '3', '');
      ListView1.Columns[1].Caption := ReadString('PROPRIETES', '4', '');
      ListView2.Columns[0].Caption := ReadString('PROPRIETES', '5', '');
      ListView2.Columns[1].Caption := ReadString('PROPRIETES', '6', '');
      ListView2.Columns[2].Caption := ReadString('PROPRIETES', '7', '');
      nbline := ReadString('PROPRIETES', '8', '');
      nbmots := ReadString('PROPRIETES', '9', '');
      nbchar := ReadString('PROPRIETES', '10', '');
      nbcharret := ReadString('PROPRIETES', '11', '');
      taille := ReadString('PROPRIETES', '12', '');
      datecre := ReadString('PROPRIETES', '13', '');
      datemod := ReadString('PROPRIETES', '14', '');
      attrib := ReadString('PROPRIETES', '15', '');
      hidden := ReadString('PROPRIETES', '16', '');
      lect := ReadString('PROPRIETES', '17', '');
      archive := ReadString('PROPRIETES', '18', '');
      inconnu := ReadString('PROPRIETES', '19', '');
      octet := ReadString('PROPRIETES', '20', '');
      Free;
   end;
   PageControl1.ActivePageIndex := 0;
end;

end.
