unit Unit14;

interface

uses
   Forms, ExtCtrls, Classes, Inifiles, StdCtrls, Controls;

type
   TForm14 = class(TForm)
      Button1 : TButton;
      LabeledEdit1 : TLabeledEdit;
      LabeledEdit2 : TLabeledEdit;
      Button2 : TButton;
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public

   end;

var
   Form14 : TForm14;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm14.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('VARIABLES', '0', '');
      LabeledEdit1.EditLabel.Caption := ReadString('VARIABLES', '1', '');
      LabeledEdit2.EditLabel.Caption := ReadString('VARIABLES', '2', '');
      Button1.Caption := ReadString('VARIABLES', '3', '');
      Button2.Caption := ReadString('VARIABLES', '4', '');
      free;
   end;
end;

end.
