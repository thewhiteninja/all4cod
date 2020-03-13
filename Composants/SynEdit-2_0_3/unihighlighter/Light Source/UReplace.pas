unit UReplace;
(******************************************************************************
Authors: Vit (nevzorov@yahoo.com)
Official Site: www.delphist.com
With all questions, please visit www.delphist.com/forum
******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, StdCtrls, ExtCtrls, RxGrdCpt, Menus;

type
  TReplace = class(TForm)
    Label1: TLabel;
    Options: TGroupBox;
    CaseSensitive: TCheckBox;
    Wholewords: TCheckBox;
    Scope: TRadioGroup;
    Direction: TRadioGroup;
    Origin: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    FindText: TComboBox;
    FormStorage: TFormStorage;
    Label2: TLabel;
    ReplaceText: TComboBox;
    Prompt: TCheckBox;
    ReplaceAll: TButton;
    PopupMenu1: TPopupMenu;
    Ok1: TMenuItem;
    Cancel1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FindTextKeyPress(Sender: TObject; var Key: Char);
    procedure ReplaceAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cancel1Click(Sender: TObject);
  private
    procedure save;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Replace: TReplace;

implementation

{$R *.DFM}


procedure TReplace.save;
  var i:integer;
begin
  if FindText.Items.IndexOf(FindText.text)=-1 then
    begin
      while FindText.Items.Count<10 do FindText.Items.add('');
      for i:=9 downto 0 do FindText.Items[i]:=FindText.Items[i-1];
      FindText.Items[0]:=FindText.text;
    end;
  if ReplaceText.Items.IndexOf(ReplaceText.text)=-1 then
    begin
      while ReplaceText.Items.Count<10 do ReplaceText.Items.add('');
      for i:=9 downto 0 do ReplaceText.Items[i]:=ReplaceText.Items[i-1];
      ReplaceText.Items[0]:=ReplaceText.text;
    end;
end;




procedure TReplace.Button1Click(Sender: TObject);
begin
  save;
end;

procedure TReplace.FindTextKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: begin
           save;
           modalresult:=mrOk;
         end;

    #27: modalresult:=mrCancel;
  end
end;

procedure TReplace.ReplaceAllClick(Sender: TObject);
begin
 save;
end;

procedure TReplace.FormShow(Sender: TObject);
begin
  Findtext.SelectAll;
  Findtext.SetFocus;

end;

procedure TReplace.Cancel1Click(Sender: TObject);
begin
  Close;
end;

end.
