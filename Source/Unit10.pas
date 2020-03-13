unit Unit10;

interface

uses
   Windows, SysUtils, Forms, Classes, Controls, StdCtrls, Inifiles, ExtCtrls;

type
   TForm10 = class(TForm)
      LabeledEdit1 : TLabeledEdit;
      Button1 : TButton;
      procedure LabeledEdit1KeyPress(Sender : TObject; var Key : Char);
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      { Déclarations publiques }
   end;

var
   Form10 : TForm10;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm10.LabeledEdit1KeyPress(Sender : TObject; var Key : Char);
begin
   if Key = chr(VK_RETURN) then
   begin
      ModalResult := mrOk;
      Key := #0;
   end;
   if not (Key in ['0'..'9', Chr(VK_BACK), Chr(VK_DELETE), Chr(VK_RETURN)]) then
      Key := #0;
end;

procedure TForm10.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('GOTOLINE', '0', '');
      LabeledEdit1.EditLabel.Caption := ReadString('GOTOLINE', '1', '');
      Button1.Caption := ReadString('GOTOLINE', '2', '');
      free;
   end;
end;

end.
