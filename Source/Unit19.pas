unit Unit19;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, ComCtrls, Projet, Spin, IniFiles, Grids;

type
   TForm19 = class(TForm)
      StatusBar1: TStatusBar;
      Button3: TButton;
      Button4: TButton;
      SpinEdit1: TSpinEdit;
      SpinEdit2: TSpinEdit;
      SpinEdit3: TSpinEdit;
      SpinEdit4: TSpinEdit;
      StringGrid1: TStringGrid;
      StaticText1: TStaticText;
      TreeView1: TTreeView;
      StaticText2: TStaticText;
      Notebook1: TNotebook;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      RichEdit1: TRichEdit;
      Edit1: TEdit;
      Edit2: TEdit;
      Edit3: TEdit;
      Label5: TLabel;
      Image1: TImage;
      CheckBox1: TCheckBox;
      Button1: TButton;
      Button2: TButton;
      Label6: TLabel;
    Label20: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      OpenDialog1: TOpenDialog;
      LabeledEdit1: TLabeledEdit;
      LabeledEdit2: TLabeledEdit;
      Button5: TButton;
      GroupBox1: TGroupBox;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      SpinEdit5: TSpinEdit;
      SpinEdit6: TSpinEdit;
      ComboBox1: TComboBox;
      ComboBox2: TComboBox;
      LabeledEdit5: TLabeledEdit;
      LabeledEdit6: TLabeledEdit;
      GroupBox3: TGroupBox;
      ComboBox5: TComboBox;
      Label17: TLabel;
      Button7: TButton;
      procedure Button7Click(Sender: TObject);
      procedure Button5Click(Sender: TObject);
      procedure TreeView1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure Button4Click(Sender: TObject);
   private
      { Déclarations privées }
   public
      icone: string;
      procedure ChargeProjet;
   end;

var
   Form19: TForm19;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm19.ChargeProjet;
begin
   with Form1.Projet do
   begin
   Edit1.Text := Infos.Nom;
   Edit2.Text := Infos.Auteur;
   Edit3.Text := Infos.Date;
   RichEdit1.Lines.Text := infos.Commentaire;
   if (Infos.Icone <> '') and FileExists(Infos.Icone) then Image1.Picture.LoadFromFile(Infos.Icone);
   icone := Infos.Icone;
   CheckBox1.Checked := Infos.AutoIncBuild;
   SpinEdit1.Value := version.major;
   SpinEdit2.Value := version.minor;
   SpinEdit3.Value := version.release;
   SpinEdit4.Value := version.build;
   with StringGrid1 do
   begin
      Rows[1][1] := Version.FileDescription;
      Rows[2][1] := Version.FileVersion;
      Rows[3][1] := Version.ProductName;
      Rows[4][1] := Version.ProductVersion;
      Rows[5][1] := Version.OriginalFileName;
      Rows[6][1] := Version.InternalFileName;
      Rows[7][1] := Version.CompanyName;
      Rows[8][1] := Version.LegalCopyright;
      Rows[9][1] := Version.LegalTrademarks;
   end;
      with Options do
      begin
         LabeledEdit1.Text:=Compile_exe;
         LabeledEdit2.Text:=Compile_param;
         SpinEdit5.Value:=Compile_Timeout1;
         SpinEdit6.Value:=Compile_Timeout2;
         ComboBox1.ItemIndex:=Compile_Priority;
         ComboBox2.ItemIndex:=Compile_Show;
         LabeledEdit5.Text:=Execute_exe;
         LabeledEdit6.Text:=Execute_param;
         ComboBox5.ItemIndex:=Execute_show;
      end;
   StatusBar1.SimpleText := ExtractFileName(NomFichier);
   end;
end;

procedure TForm19.Button4Click(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TForm19.Button3Click(Sender: TObject);
begin
   with Form1.Projet do
   begin
      Infos.Nom := Edit1.Text;
      Infos.Auteur := Edit2.Text;
      Infos.Date := Edit3.Text;
      infos.Commentaire := RichEdit1.Lines.Text;
      if Image1.Picture = nil then Infos.Icone := ''
      else Infos.Icone := icone;
      Infos.AutoIncBuild := CheckBox1.Checked;
      version.major := SpinEdit1.Value;
      version.minor := SpinEdit2.Value;
      version.release := SpinEdit3.Value;
      version.build := SpinEdit4.Value;
      with StringGrid1 do
      begin
         Version.FileDescription := Cells[1, 1];
         Version.FileVersion := Cells[1, 2];
         Version.ProductName := Cells[1, 3];
         Version.ProductVersion := Cells[1, 4];
         Version.OriginalFileName := Cells[1, 5];
         Version.InternalFileName := Cells[1, 6];
         Version.CompanyName := Cells[1, 7];
         Version.LegalCopyright := Cells[1, 8];
         Version.LegalTrademarks := Cells[1, 9];
      end;
      with Options do
      begin
         Compile_exe:=LabeledEdit1.Text;
         Compile_param:=LabeledEdit2.Text;
         Compile_Timeout1:=SpinEdit5.Value;
         Compile_Timeout2:=SpinEdit6.Value;
         Compile_Priority:=ComboBox1.ItemIndex;
         Compile_Show:=ComboBox2.ItemIndex;
         Execute_exe:=LabeledEdit5.Text;
         Execute_param:=LabeledEdit6.Text;
         Execute_show:=ComboBox5.ItemIndex;
      end;
   end;
   ModalResult := mrOk;
end;

procedure TForm19.FormCreate(Sender: TObject);
var i: TInifile;
begin
   i := TIniFile.Create(Form1.CurrentFileLanguage);
   with i do
   begin
      Caption := ReadString('OPTIONS_PROJET', '0', '');
      Label1.Caption := ReadString('OPTIONS_PROJET', '2', '');
      Label2.Caption := ReadString('OPTIONS_PROJET', '3', '');
      Label3.Caption := ReadString('OPTIONS_PROJET', '4', '');
      Label4.Caption := ReadString('OPTIONS_PROJET', '5', '');
      Label5.Caption := ReadString('OPTIONS_PROJET', '7', '');
      Button1.Caption := ReadString('OPTIONS_PROJET', '8', '');
      Button2.Caption := ReadString('OPTIONS_PROJET', '9', '');
      CheckBox1.Caption := ReadString('OPTIONS_PROJET', '11', '');

      TreeView1.Items[0].Text:= ReadString('OPTIONS_PROJET', '1', '');
      TreeView1.Items[1].Text:= ReadString('OPTIONS_PROJET', '12', '');
      TreeView1.Items[2].Text:= ReadString('OPTIONS_PROJET', '43', '');
      TreeView1.Items[3].Text:= ReadString('OPTIONS_PROJET', '44', '');

      with StringGrid1 do
      begin
         Rows[0].Text := ReadString('OPTIONS_PROJET', '13', '') + #13 + ReadString('OPTIONSPROJECT', '14', '');
         Rows[1].Text := ReadString('OPTIONS_PROJET', '15', '');
         Rows[2].Text := ReadString('OPTIONS_PROJET', '16', '');
         Rows[3].Text := ReadString('OPTIONS_PROJET', '17', '');
         Rows[4].Text := ReadString('OPTIONS_PROJET', '18', '');
         Rows[5].Text := ReadString('OPTIONS_PROJET', '19', '');
         Rows[6].Text := ReadString('OPTIONS_PROJET', '20', '');
         Rows[7].Text := ReadString('OPTIONS_PROJET', '21', '');
         Rows[8].Text := ReadString('OPTIONS_PROJET', '22', '');
         Rows[9].Text := ReadString('OPTIONS_PROJET', '23', '');
      end;
      label6.Caption:= ReadString('OPTIONS_PROJET', '24', '');
      label20.Caption:= ReadString('OPTIONS_PROJET', '25', '');
      label7.Caption:= ReadString('OPTIONS_PROJET', '26', '');
      label8.Caption:= ReadString('OPTIONS_PROJET', '27', '');

      LabeledEdit1.EditLabel.Caption:= ReadString('OPTIONS_PROJET', '28', '');
      LabeledEdit2.EditLabel.Caption:= ReadString('OPTIONS_PROJET', '29', '');
      Button5.Caption:= ReadString('OPTIONS_PROJET', '30', '');
      GroupBox1.Caption:= ReadString('OPTIONS_PROJET', '31', '');
      Label9.Caption:= ReadString('OPTIONS_PROJET', '32', '');
      Label10.Caption:= ReadString('OPTIONS_PROJET', '33', '');
      Label11.Caption:= ReadString('OPTIONS_PROJET', '34', '');
      Label12.Caption:= ReadString('OPTIONS_PROJET', '35', '');
      ComboBox2.Items[0]:= ReadString('OPTIONS_PROJET', '36', '');
      ComboBox2.Items[1]:= ReadString('OPTIONS_PROJET', '37', '');
      ComboBox2.Items[2]:= ReadString('OPTIONS_PROJET', '38', '');
      ComboBox2.Items[3]:= ReadString('OPTIONS_PROJET', '39', '');

      LabeledEdit5.EditLabel.Caption:= ReadString('OPTIONS_PROJET', '28', '');
      LabeledEdit6.EditLabel.Caption:= ReadString('OPTIONS_PROJET', '29', '');
      Button7.Caption:= ReadString('OPTIONS_PROJET', '30', '');
      GroupBox3.Caption:= ReadString('OPTIONS_PROJET', '31', '');
      Label17.Caption:= ReadString('OPTIONS_PROJET', '35', '');
      ComboBox5.Items[0]:= ReadString('OPTIONS_PROJET', '36', '');
      ComboBox5.Items[1]:= ReadString('OPTIONS_PROJET', '37', '');
      ComboBox5.Items[2]:= ReadString('OPTIONS_PROJET', '38', '');
      ComboBox5.Items[3]:= ReadString('OPTIONS_PROJET', '39', '');

      Button3.Caption := ReadString('OPTIONS_PROJET', '40', '');
      Button4.Caption := ReadString('OPTIONS_PROJET', '41', '');
      free;
   end;
   TreeView1.Items[0].Selected := true;
   Notebook1.PageIndex := 0;
   StringGrid1.ColWidths[1] := 250;
end;

procedure TForm19.Button1Click(Sender: TObject);
begin
   Image1.Picture := nil;
   icone := '';
end;

procedure TForm19.Button2Click(Sender: TObject);
var tmp: string;
begin
   tmp := Form1.OpenDialog1.Filter;
   Form1.OpenDialog1.Filter := '(*.ico)|*.ico';
   Form1.OpenDialog1.Title := form1.GetText('88');
   if Form1.OpenDialog1.Execute then
   begin
      icone := Form1.OpenDialog1.FileName;
      Image1.Picture.LoadFromFile(icone);
   end;
   Form1.OpenDialog1.Filter := tmp;
end;

procedure TForm19.TreeView1Click(Sender: TObject);
begin
   if TreeView1.SelectionCount > 0 then
   begin
      Notebook1.PageIndex := TreeView1.Selected.Index;
      StaticText2.Caption := 'Options' + ' > ' + TreeView1.Selected.Text;
   end;
end;

procedure TForm19.Button5Click(Sender: TObject);
begin
   if OpenDialog1.Execute then LabeledEdit1.Text := OpenDialog1.FileName;
end;

procedure TForm19.Button7Click(Sender: TObject);
begin
   if OpenDialog1.Execute then LabeledEdit5.Text := OpenDialog1.FileName;
end;

end.

