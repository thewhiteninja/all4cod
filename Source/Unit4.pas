unit Unit4;

interface

uses
   SysUtils, Forms, Dialogs, ComCtrls, SynEditHighlighter, StdCtrls, SynEdit,
   Classes, Controls, ShellCtrls, IniFiles;

type
   TForm4 = class(TForm)
      StatusBar1 : TStatusBar;
      PageControl1 : TPageControl;
      TabSheet1 : TTabSheet;
      TabSheet2 : TTabSheet;
      ListBox1 : TListBox;
      RadioButton2 : TRadioButton;
      RadioButton1 : TRadioButton;
      Label1 : TLabel;
      Edit1 : TEdit;
      Button1 : TButton;
      Label2 : TLabel;
      SynEdit1 : TSynEdit;
      Button2 : TButton;
      Button3 : TButton;
      Label3 : TLabel;
      OpenDialog1 : TOpenDialog;
      ShellTreeView1 : TShellTreeView;
      procedure FormCreate(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure RadioButton2Click(Sender : TObject);
      procedure RadioButton1Click(Sender : TObject);
      procedure ListBox1Click(Sender : TObject);
      procedure Button1Click(Sender : TObject);
      procedure Button3Click(Sender : TObject);
      procedure ShellTreeView1Click(Sender : TObject);
   private
      { Déclarations privées }
   public
      { Déclarations publiques }
   end;

var
   Form4 : TForm4;

implementation

uses Unit3, Unit2, Unit1, uHighlighterProcs;

{$R *.dfm}

procedure TForm4.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ListBox1.Items := Form3.ListHighlighters;
   PageControl1.ActivePageIndex := 0;
   if DirectoryExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Templates\Files') then
      ShellTreeView1.Root := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Templates\Files'
   else
   begin
       ShellTreeView1.ObjectTypes:= ShellTreeView1.ObjectTypes - [otFolders];
       ShellTreeView1.ObjectTypes:= ShellTreeView1.ObjectTypes - [otNonFolders];
   end;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('NEWDIALOG', '0', '');
      Label1.Caption := ReadString('NEWDIALOG', '1', '');
      Label2.Caption := ReadString('NEWDIALOG', '2', '');
      Label3.Caption := ReadString('NEWDIALOG', '3', '');
      Button2.Caption := ReadString('NEWDIALOG', '4', '');
      Button3.Caption := ReadString('NEWDIALOG', '5', '');
      TabSheet1.Caption := ReadString('NEWDIALOG', '6', '');
      RadioButton1.Caption := ReadString('NEWDIALOG', '7', '');
      RadioButton2.Caption := ReadString('NEWDIALOG', '8', '');
      TabSheet2.Caption := ReadString('NEWDIALOG', '9', '');
      free;
   end;
   OpenDialog1.Title := Form1.GetText('63');
end;

procedure TForm4.Button2Click(Sender : TObject);
begin
   Close;
end;

procedure TForm4.RadioButton2Click(Sender : TObject);
begin
   ListBox1.Enabled := true;
   SynEdit1.ClearAll;
end;

procedure TForm4.RadioButton1Click(Sender : TObject);
begin
   ListBox1.Enabled := false;
   SynEdit1.ClearAll;
end;

procedure TForm4.ListBox1Click(Sender : TObject);
begin
   SynEdit1.ClearAll;
   if ListBox1.Enabled and (ListBox1.ItemIndex <> -1) then
   begin
      SynEdit1.Highlighter :=
         TSynCustomHighlighter(Form3.ListHighlighters.Objects[ListBox1.ItemIndex]);
      SynEdit1.Lines.Text := SynEdit1.Highlighter.SampleSource;
   end;
end;

procedure TForm4.Button1Click(Sender : TObject);
begin
   Form1.OpenDialog1.Title := form1.GetText('86');
   if OpenDialog1.Execute then
      Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm4.Button3Click(Sender : TObject);
var
   insert, item, biggest : string;
begin
   with TForm2.Create(Application) do
   begin
      Nom := Edit1.Text;
      if Edit1.Text = '' then
      begin
         Caption := Form1.GetText('79') + ' ' + IntToStr(Form1.Cpt_Sans_Titre);
         Inc(Form1.Cpt_Sans_Titre);
      end
      else
         Caption := ExtractFileName(Edit1.Text);
      Form1.ListBox3.Items.Add(Caption);
      Form1.TabControl1.Tabs.Add(Caption);
      Form1.Panel8.Visible := true;
      if PageControl1.ActivePageIndex = 0 then
      begin
         if RadioButton2.Checked and (ListBox1.ItemIndex <> -1) then
         begin
            SynEdit1.Highlighter :=
               TSynCustomHighlighter(Form3.ListHighlighters.Objects[ListBox1.ItemIndex]);
            StatusBar1.Panels[0].Text := SynEdit1.Highlighter.LanguageName;
            SynCompletionProposal1.TriggerChars :=
               Form3.TriggerChars[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)];
            Form3.FileToAC(insert, item, biggest,
               Form3.AC_Files[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)]);
            SynAutoComplete.AutoCompleteList.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+'Highlighters\'+Form3.AutoCompletion[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)]);
            SynCompletionProposal1.Columns[0].BiggestWord := biggest;
            SynCompletionProposal1.InsertList.Text := insert;
            SynCompletionProposal1.ItemList.Text := item;
            SynCompletionProposal1.Title :=
               Form3.AC_Files[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)];
            SynCompletionProposal1.ResetAssignedList;
         end;
      end
      else if FileExists(ShellTreeView1.Path) then
         SynEdit1.Lines.LoadFromFile(ShellTreeView1.Path);
   end;
   Close;
end;

procedure TForm4.ShellTreeView1Click(Sender : TObject);
begin
   if FileExists(ShellTreeView1.Path) then
   begin
      SynEdit1.Lines.LoadFromFile(ShellTreeView1.Path);
      synedit1.Highlighter := GetHighlighterFromFileExt(Form3.ListHighlighters,
         ExtractFileExt(ShellTreeView1.Path));
   end
   else
      SynEdit1.ClearAll;
end;

end.
