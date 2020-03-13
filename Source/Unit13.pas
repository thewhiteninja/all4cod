unit Unit13;

interface

uses
   Forms, Controls, ExtCtrls, StdCtrls, Classes, Fonctions, jpeg;

type
   TForm13 = class(TForm)
      Image1 : TImage;
      Label2 : TLabel;
      Label1 : TLabel;
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      { Déclarations publiques }
   end;

var
   Form13 : TForm13;

implementation

{$R *.dfm}

procedure TForm13.FormCreate(Sender : TObject);
begin
   Label2.Caption := 'Version ' + GetVersion;
end;

end.
