program UniEdit;

(******************************************************************************
Author: Vit (nevzorov@yahoo.com)
Official Site: www.delphist.com
With all questions, please visit www.delphist.com/forum
******************************************************************************)

uses
  Forms,
  UUniEdit in 'UUniEdit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
