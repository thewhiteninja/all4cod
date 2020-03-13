program Light;

(******************************************************************************
Authors: Vit (nevzorov@yahoo.com)
Official Site: www.delphist.com
With all questions, please visit www.delphist.com/forum
******************************************************************************)
uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  UReplace in 'UReplace.pas' {Replace},
  UFind in 'UFind.pas' {Find};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TReplace, Replace);
  Application.CreateForm(TFind, Find);
  Application.Run;
end.
