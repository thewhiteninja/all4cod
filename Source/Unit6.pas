unit Unit6;

interface

uses
   Windows, Controls, Forms, Fonctions, Dialogs, Math, Classes,
   ComCtrls, StdCtrls, ExtCtrls, Inifiles;

type
   TForm6 = class(TForm)
      StatusBar1 : TStatusBar;
      LabeledEdit1 : TLabeledEdit;
      LabeledEdit2 : TLabeledEdit;
      LabeledEdit3 : TLabeledEdit;
      LabeledEdit4 : TLabeledEdit;
      Button1 : TButton;
      procedure Button1Click(Sender : TObject);
      procedure LabeledEdit1Change(Sender : TObject);
      procedure LabeledEdit2Change(Sender : TObject);
      procedure LabeledEdit3Change(Sender : TObject);
      procedure LabeledEdit4Change(Sender : TObject);
      procedure LabeledEdit1KeyPress(Sender : TObject; var Key : Char);
      procedure LabeledEdit2KeyPress(Sender : TObject; var Key : Char);
      procedure LabeledEdit3KeyPress(Sender : TObject; var Key : Char);
      procedure LabeledEdit4KeyPress(Sender : TObject; var Key : Char);
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      procedure UpdateLabels(n : integer);
   end;

var
   Form6 : TForm6;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm6.UpdateLabels(n : integer);
begin
   if n = 1 then
   begin
      LabeledEdit2.Text := ConvertBase(LabeledEdit1.Text, '0123456789ABCDEF',
         '0123456789');
      LabeledEdit3.Text := ConvertBase(LabeledEdit1.Text, '0123456789ABCDEF',
         '01234567');
      LabeledEdit4.Text := ConvertBase(LabeledEdit1.Text, '0123456789ABCDEF',
         '01');
   end;
   if n = 2 then
   begin
      LabeledEdit1.Text := ConvertBase(LabeledEdit2.Text, '0123456789',
         '0123456789ABCDEF');
      LabeledEdit3.Text := ConvertBase(LabeledEdit2.Text, '0123456789',
         '01234567');
      LabeledEdit4.Text := ConvertBase(LabeledEdit2.Text, '0123456789', '01');
   end;
   if n = 3 then
   begin
      LabeledEdit1.Text := ConvertBase(LabeledEdit3.Text, '01234567',
         '0123456789ABCDEF');
      LabeledEdit2.Text := ConvertBase(LabeledEdit3.Text, '01234567',
         '0123456789');
      LabeledEdit4.Text := ConvertBase(LabeledEdit3.Text, '01234567', '01');
   end;
   if n = 4 then
   begin
      LabeledEdit1.Text := ConvertBase(LabeledEdit4.Text, '01',
         '0123456789ABCDEF');
      LabeledEdit2.Text := ConvertBase(LabeledEdit4.Text, '01', '0123456789');
      LabeledEdit3.Text := ConvertBase(LabeledEdit4.Text, '01', '01234567');
   end;
end;

procedure TForm6.Button1Click(Sender : TObject);
begin
   Close;
end;

procedure TForm6.LabeledEdit1Change(Sender : TObject);
begin
   if LabeledEdit1.Focused then
      UpdateLabels(1);
end;

procedure TForm6.LabeledEdit2Change(Sender : TObject);
begin
   if LabeledEdit2.Focused then
      UpdateLabels(2);
end;

procedure TForm6.LabeledEdit3Change(Sender : TObject);
begin
   if LabeledEdit3.Focused then
      UpdateLabels(3);
end;

procedure TForm6.LabeledEdit4Change(Sender : TObject);
begin
   if LabeledEdit4.Focused then
      UpdateLabels(4);
end;

procedure TForm6.LabeledEdit1KeyPress(Sender : TObject; var Key : Char);
begin
   if not (Key in ['0'..'9', 'A'..'F', 'a'..'f', Chr(VK_BACK), Chr(VK_DELETE)]) then
      Key := #0;
end;

procedure TForm6.LabeledEdit2KeyPress(Sender : TObject; var Key : Char);
begin
   if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE)]) then
      Key := #0;
end;

procedure TForm6.LabeledEdit3KeyPress(Sender : TObject; var Key : Char);
begin
   if not (Key in ['0'..'7', Chr(VK_BACK), Chr(VK_DELETE)]) then
      Key := #0;
end;

procedure TForm6.LabeledEdit4KeyPress(Sender : TObject; var Key : Char);
begin
   if not (Key in ['0', '1', Chr(VK_BACK), Chr(VK_DELETE)]) then
      Key := #0;
end;

procedure TForm6.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('BASE', '0', '');
      LabeledEdit1.EditLabel.Caption := ReadString('BASE', '1', '');
      LabeledEdit2.EditLabel.Caption := ReadString('BASE', '2', '');
      LabeledEdit3.EditLabel.Caption := ReadString('BASE', '3', '');
      LabeledEdit4.EditLabel.Caption := ReadString('BASE', '4', '');
      Button1.Caption := ReadString('BASE', '5', '');
      free;
   end;
end;

end.
