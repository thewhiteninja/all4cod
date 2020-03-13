unit Unit2;

interface

uses
   Windows, SysUtils, Graphics, Controls, Forms, StdCtrls, ComCtrls,
   ExtCtrls, SynEdit, SynEditTypes, SynEditHighlighter, SynEditMiscClasses,
   SynEditExport, SynEditSearch, SynEditAutoComplete, Menus, Classes, Dialogs, Ruler, Fonctions,
   SynCompletionProposal, SynEditKeyCmds, SynMemo, ShellApi, StrUtils;

type
   TForm2 = class(TForm)
      SynEdit1 : TSynEdit;
      StatusBar1 : TStatusBar;
      GroupBox1 : TGroupBox;
      Splitter1 : TSplitter;
      SynEditSearch1 : TSynEditSearch;
      SaveDialog1 : TSaveDialog;
      Ruler1 : TRuler;
      SynCompletionProposal1 : TSynCompletionProposal;
      SynMemo1 : TSynMemo;
      procedure FormCreate(Sender : TObject);
      procedure FormClose(Sender : TObject; var Action : TCloseAction);
      procedure SynEdit1Change(Sender : TObject);
      procedure FormCloseQuery(Sender : TObject; var CanClose : Boolean);
      procedure FormCanResize(Sender : TObject; var NewWidth,
         NewHeight : Integer; var Resize : Boolean);
      procedure SynEdit1StatusChange(Sender : TObject;
         Changes : TSynStatusChanges);
      procedure SynEdit1KeyPress(Sender : TObject; var Key : Char);
      procedure Effacer1Click(Sender : TObject);
      procedure FormActivate(Sender : TObject);
   private
      { Déclarations privées }
   public
      Nom : string;
      Modifier : boolean;
      Projet : boolean;
      SynAutoComplete : TCustomSynAutoComplete;
      procedure Enregistrer;
      procedure EnregistrerSous;
      procedure Exporter(index : integer; fichier : boolean);
      function DemandeEnregistrer : integer;
   end;

var
   Form2 : TForm2;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm2.Exporter(index : integer; fichier : boolean);
var
   ex : TSynCustomExporter;
   tmp : string;
begin
   ex := nil;
   if SynEdit1.Highlighter <> nil then
   begin
      case index of
         0 : ex := Form1.SynExporterHTML1;
         1 : ex := Form1.SynExporterRTF1;
         2 : ex := Form1.SynExporterTeX1;
      end;
      ex.ExportAsText := fichier;
      ex.Title := Caption;
      ex.Highlighter := SynEdit1.Highlighter;
      if SynEdit1.SelAvail then
         ex.ExportRange(SynEdit1.Lines, SynEdit1.BlockBegin, SynEdit1.BlockEnd)
      else
         ex.ExportAll(SynEdit1.Lines);
      if fichier then
      begin
         tmp := Form1.SaveDialog1.Filter;
         Form1.SaveDialog1.Filter := ex.DefaultFilter;
         Form1.SaveDialog1.Title := Form1.GetText('56') + ' ' + Ex.FormatName;
         if Form1.SaveDialog1.Execute then
         begin
            case index of
               0 : Form1.SaveDialog1.FileName :=
                  ChangeFileExt(Form1.SaveDialog1.FileName, '.html');
               1 : Form1.SaveDialog1.FileName :=
                  ChangeFileExt(Form1.SaveDialog1.FileName, '.rtf');
               2 : Form1.SaveDialog1.FileName :=
                  ChangeFileExt(Form1.SaveDialog1.FileName, '.tex');
            end;
            ex.SaveToFile(Form1.SaveDialog1.FileName);
         end;
         Form1.SaveDialog1.Filter := tmp;
      end
      else
         ex.CopyToClipboard;
   end
   else
      MessageBoxA(Handle, Pchar(Form1.GetText('26') + #13 +
         Form1.GetText('27')), Pchar('All4Cod - ' + Form1.GetText('ERROR')), 0 +
         MB_ICONINFORMATION + 0);
end;

function TForm2.DemandeEnregistrer : integer;
begin
   Result := MessageBoxA(Handle, Pchar(Form1.GetText('28')), Pchar('All4Cod - '
      + Caption), MB_YESNOCANCEL + MB_ICONQUESTION + 0);
end;

procedure TForm2.Enregistrer;
begin
   if nom <> '' then
   begin
      SynEdit1.Lines.SaveToFile(nom);
      modifier := false;
      StatusBar1.Panels[2].Text := '';
      if Form3.CheckBox23.Checked then
         SynEdit1.UndoList.Clear;
   end
   else
      EnregistrerSous;
end;

procedure TForm2.EnregistrerSous;
begin
   Form1.SaveDialog1.Title := Caption + ' - ' + Form1.GetText('57') + ' ?';
   if Form1.SaveDialog1.Execute then
   begin
      modifier := false;
      StatusBar1.Panels[2].Text := '';
      nom := Form1.SaveDialog1.FileName;
      SynEdit1.Lines.SaveToFile(nom);
      Form1.AddReOpen(nom);
      Form1.ListBox3.Items[Form1.ListBox3.Items.IndexOf(Caption)] :=
         ExtractFileName(nom);
      try
      Form1.TabControl1.Tabs[Form1.TabControl1.Tabs.IndexOf(Caption)] :=
         ExtractFileName(nom);
      except
      end;   
      Caption := ExtractFileName(nom);
      if Form3.CheckBox23.Checked then
         SynEdit1.UndoList.Clear;
   end;
end;

procedure TForm2.FormCreate(Sender : TObject);
begin
   Icon.Handle := Application.Icon.Handle;
   Nom := '';
   Form1.ComboBox1.ItemIndex := 0;
   Modifier := false;
   SynAutoComplete:=TCustomSynAutoComplete.Create(Self);
   SynAutoComplete.Editor:=SynEdit1;
   SynEdit1.AddKey(ecAutoCompletion, word('J'), [ssCtrl], 0, []);
   StatusBar1.Panels[0].Width := StatusBar1.Width - 270;
   StatusBar1.Panels[0].Text := Form1.GetText('81');
   StatusBar1.Panels[3].Text := Form1.GetText('75');
   GroupBox1.Caption := Form1.GetText('78');
   Ruler1.Visible := Form3.CheckBox44.Checked;
   with SynCompletionProposal1 do
   begin
      if Form3.CheckBox45.Checked then
         Options := Options + [scoCaseSensitive]
      else
         Options := Options - [scoCaseSensitive];
      if Form3.CheckBox47.Checked then
         Options := Options + [scoLimitToMatchedText]
      else
         Options := Options - [scoLimitToMatchedText];
      if Form3.CheckBox46.Checked then
         Options := Options + [scoAnsiStrings]
      else
         Options := Options - [scoAnsiStrings];
      ShortCut := Form3.HotKey1.HotKey;
      TimerInterval := Form3.SpinEdit8.Value;
   end;
   with SynEdit1 do
   begin
      if Form3.CheckBox27.Checked then
         ActiveLineColor := clYellow
      else
         ActiveLineColor := clWhite;
      WordWrap := Form3.CheckBox28.Checked;
      if Form3.CheckBox29.Checked then
         Options := Options + [eoShowSpecialChars]
      else
         Options := Options - [eoShowSpecialChars];
      if Form3.CheckBox31.Checked then
         Options := Options + [eoDragDropEditing]
      else
         Options := Options - [eoDragDropEditing];
      Gutter.Width := Form3.SpinEdit2.Value;
      Gutter.DigitCount := Form3.SpinEdit3.Value;
      Gutter.Visible := Form3.CheckBox17.Checked;
      Gutter.ZeroStart := Form3.CheckBox18.Checked;
      Gutter.LeadingZeros := not (Form3.CheckBox19.Checked);
      Font := Form3.Label11.Font;
      HideSelection := Form3.CheckBox20.Checked;
      if Form3.CheckBox21.Checked then
         Options := Options + [eoAutoIndent]
      else
         Options := Options - [eoAutoIndent];
      WantTabs := Form3.CheckBox22.Checked;
      if Form3.CheckBox24.Checked then
         Options := Options + [eoSmartTabs]
      else
         Options := Options - [eoSmartTabs];
      ExtraLineSpacing := Form3.SpinEdit4.Value;
      TabWidth := Form3.SpinEdit5.Value;
      MaxUndo := Form3.SpinEdit6.Value;
      RightEdge := Form3.SpinEdit7.Value;
      case Form3.ComboBox3.ItemIndex of
         0 : ScrollBars := ssNone;
         1 : ScrollBars := ssVertical;
         2 : ScrollBars := ssHorizontal;
         3 : ScrollBars := ssBoth;
      end;
      case Form3.ComboBox4.ItemIndex of
         0 :
            begin
               InsertCaret := ctVerticalLine;
               OverwriteCaret := ctVerticalLine;
            end;
         1 :
            begin
               InsertCaret := ctHorizontalLine;
               OverwriteCaret := ctHorizontalLine;
            end;
         2 :
            begin
               InsertCaret := ctHalfBlock;
               OverwriteCaret := ctHalfBlock;
            end;
         3 :
            begin
               InsertCaret := ctBlock;
               OverwriteCaret := ctBlock;
            end;
      end;
      Color := Form3.Shape3.Brush.Color;
      SelectedColor.Foreground := Form3.Shape4.Brush.Color;
      SelectedColor.Background := Form3.Shape5.Brush.Color;
   end;
end;

procedure TForm2.FormClose(Sender : TObject; var Action : TCloseAction);
var
   i : integer;
   info : boolean;
begin
   info := false;
   for i := 0 to Form1.MDIChildCount - 1 do if not (Form1.FicheEditeur(i)) then info := true;

   if Form1.MDIChildCount = 1 then
   begin
      Form1.ListBox3.Clear;
      Form1.TabControl1.Tabs.Clear;
      Form1.Cpt_Sans_Titre := 1;
      Form1.Panel8.Visible := false;
   end
   else
   begin
      if (Form1.MDIChildCount = 2) and info then
      begin
         Form1.ListBox3.Clear;
         Form1.Cpt_Sans_Titre := 1;
         Form1.ListBox3.Items.Delete(Form1.ListBox3.Items.IndexOf(Caption));
         if Form1.TabControl1.Tabs.IndexOf(Caption) > -1 then Form1.TabControl1.Tabs.Delete(Form1.TabControl1.Tabs.IndexOf(Caption));
      end
      else
      begin
         Form1.ListBox3.Items.Delete(Form1.ListBox3.Items.IndexOf(Caption));
         if Form1.TabControl1.Tabs.IndexOf(Caption) > -1 then Form1.TabControl1.Tabs.Delete(Form1.TabControl1.Tabs.IndexOf(Caption));
      end;
   end;
   SynAutoComplete.Free;
   SynEdit1.Free;
   Action := caFree;
end;

procedure TForm2.SynEdit1Change(Sender : TObject);
begin
   modifier := true;
end;

procedure TForm2.FormCloseQuery(Sender : TObject; var CanClose : Boolean);
var rep : integer;
begin
   if modifier then
   begin
       rep := DemandeEnregistrer;
       if rep = 6 then Enregistrer
       else CanClose := rep = 7;
   end;
end;

procedure TForm2.FormCanResize(Sender : TObject; var NewWidth,
   NewHeight : Integer; var Resize : Boolean);
begin
   StatusBar1.Panels[0].Width := StatusBar1.Width - 270;
   Resize := true;
end;

procedure TForm2.SynEdit1StatusChange(Sender : TObject;
   Changes : TSynStatusChanges);
begin
   StatusBar1.Panels[1].Text := IntToStr(SynEdit1.CaretY) + ' : ' +
      IntToStr(SynEdit1.CaretX);
   if scModified in Changes then
   begin
      modifier := true;
      if SynEdit1.Modified then
         StatusBar1.Panels[2].Text := Form1.GetText('77')
      else
         StatusBar1.Panels[2].Text := '';
   end;
   if scInsertMode in Changes then
   begin
      if SynEdit1.InsertMode then
         StatusBar1.Panels[3].Text := Form1.GetText('75')
      else
         StatusBar1.Panels[3].Text := Form1.GetText('76');
   end;
end;

procedure TForm2.SynEdit1KeyPress(Sender : TObject; var Key : Char);
begin
   if Form3.CheckBox30.Checked and (Key in ['(', '[', '{', '<']) then
   begin
      case Ord(Key) of
         ord('(') : SynEdit1.SelText := '()';
         ord('{') : SynEdit1.SelText := '{}';
         ord('[') : SynEdit1.SelText := '[]';
         ord('<') : SynEdit1.SelText := '<>';
      end;
      SynEdit1.CaretX := SynEdit1.CaretX - 1;
      Key := #0;
   end;
end;

procedure TForm2.Effacer1Click(Sender : TObject);
begin
   SynMemo1.Clear;
end;

procedure TForm2.FormActivate(Sender : TObject);
begin
   Form1.TabControl1.TabIndex := Form1.ListBox3.Items.IndexOf(Caption);
end;

end.
