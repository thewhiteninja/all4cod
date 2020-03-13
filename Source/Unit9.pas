unit Unit9;

interface

uses
   Forms, Classes, Controls, StdCtrls, ComCtrls, IniFiles;

type
   TForm9 = class(TForm)
      StatusBar1 : TStatusBar;
      Label1 : TLabel;
      Edit1 : TEdit;
      ListBox1 : TListBox;
      Button1 : TButton;
      Button2 : TButton;
      Button3 : TButton;
      Button4 : TButton;
      Button5 : TButton;
      Button6 : TButton;
      procedure ListBox1Click(Sender : TObject);
      procedure FormCreate(Sender : TObject);
   private

   public
      Dico, nbmots : string;
   end;

var
   Form9 : TForm9;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm9.ListBox1Click(Sender : TObject);
begin
   if ListBox1.ItemIndex <> -1 then
      Edit1.Text := ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TForm9.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Button1.Caption := ReadString('CORR', '1', '');
      Button2.Caption := ReadString('CORR', '2', '');
      Button3.Caption := ReadString('CORR', '3', '');
      Button4.Caption := ReadString('CORR', '4', '');
      Button5.Caption := ReadString('CORR', '5', '');
      Button6.Caption := ReadString('CORR', '6', '');
      Dico := ReadString('CORR', '7', '');
      nbmots := ReadString('CORR', '8', '');
      free;
   end;
end;

end.
