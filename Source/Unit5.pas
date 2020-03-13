unit Unit5;

interface

uses
   SysUtils, Controls, Inifiles, Forms, Classes, ComCtrls, Fonctions, StdCtrls,
   Dialogs;

type
   TForm5 = class(TForm)
      RadioButton1 : TRadioButton;
      RadioButton2 : TRadioButton;
      RadioButton3 : TRadioButton;
      RichEdit1 : TRichEdit;
      StatusBar1 : TStatusBar;
      ListBox1 : TListBox;
      Edit1 : TEdit;
      Button1 : TButton;
      Label1 : TLabel;
      Edit2 : TEdit;
      OpenDialog1 : TOpenDialog;
      Button2 : TButton;
      procedure Button1Click(Sender : TObject);
      procedure Edit1Change(Sender : TObject);
      procedure ListBox1Click(Sender : TObject);
      procedure RichEdit1Change(Sender : TObject);
      procedure RadioButton1Click(Sender : TObject);
      procedure RadioButton2Click(Sender : TObject);
      procedure RadioButton3Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      procedure UpdateEnable;
   end;

var
   Form5 : TForm5;

implementation

uses Unit1, Unit2, Unit3;

{$R *.dfm}

procedure TForm5.UpdateEnable;
begin
   RichEdit1.Enabled := RadioButton1.Checked;
   ListBox1.Enabled := RadioButton2.Checked;
   Edit1.Enabled := RadioButton3.Checked;
   Button1.Enabled := RadioButton3.Checked;
end;

procedure TForm5.Button1Click(Sender : TObject);
begin
   Form1.OpenDialog1.Title := form1.GetText('86');
   if OpenDialog1.Execute then
      Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm5.Edit1Change(Sender : TObject);
begin
   if FileExists(Edit1.Text) then
   begin
      StatusBar1.SimpleText := Form1.GetText('64');
      Application.ProcessMessages;
      Edit2.Text := HashFile(Edit1.Text);
      StatusBar1.SimpleText := '';
   end
   else
      Edit2.Text := '';
end;

procedure TForm5.ListBox1Click(Sender : TObject);
var
   i : integer;
begin
   if ListBox1.ItemIndex <> -1 then
   begin
      for i := 0 to Form1.MDIChildCount - 1 do
         if Form1.FicheEditeur(i) and (Form1.MDIChildren[i].Caption = ListBox1.Items[ListBox1.ItemIndex]) then
         begin
            StatusBar1.SimpleText := form1.GetText('65');
            Edit2.Text :=
               HashString(TForm2(Form1.MDIChildren[i]).SynEdit1.Lines.Text);
            StatusBar1.SimpleText := '';
            Exit;
         end;
   end
   else
      Edit2.Text := '';
end;

procedure TForm5.RichEdit1Change(Sender : TObject);
begin
   if RichEdit1.Lines.Text <> '' then
      Edit2.Text := HashString(RichEdit1.Lines.Text)
   else
      Edit2.Text := '';
end;

procedure TForm5.RadioButton1Click(Sender : TObject);
begin
   UpdateEnable;
   RichEdit1Change(nil);
end;

procedure TForm5.RadioButton2Click(Sender : TObject);
begin
   UpdateEnable;
   ListBox1Click(nil);
end;

procedure TForm5.RadioButton3Click(Sender : TObject);
begin
   UpdateEnable;
   Edit1Change(nil);
end;

procedure TForm5.Button2Click(Sender : TObject);
begin
   Edit2.SelectAll;
   Edit2.CopyToClipboard;
end;

procedure TForm5.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('MD5', '0', '');
      RadioButton1.Caption := ReadString('MD5', '1', '');
      RadioButton2.Caption := ReadString('MD5', '2', '');
      RadioButton3.Caption := ReadString('MD5', '3', '');
      Label1.Caption := ReadString('MD5', '4', '');
      Button2.Caption := ReadString('MD5', '5', '');
      free;
   end;
end;

end.
