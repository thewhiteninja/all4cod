unit UFind;
(******************************************************************************
Authors: Vit (nevzorov@yahoo.com)
Official Site: www.delphist.com
With all questions, please visit www.delphist.com/forum
******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Placemnt, RxGrdCpt, Menus;

type
  TFind = class(TForm)
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
    PopupMenu1: TPopupMenu;
    Ok1: TMenuItem;
    Cancel1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FindTextKeyPress(Sender: TObject; var Key: Char);
    procedure Cancel1Click(Sender: TObject);
  private
    procedure save;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Find: TFind;

implementation

{$R *.DFM}

procedure TFind.FormShow(Sender: TObject);
begin
  FindText.SetFocus;
end;

procedure TFind.save;
  var i:integer;
begin
  if FindText.Items.IndexOf(FindText.text)=-1 then
    begin
      while FindText.Items.Count<10 do FindText.Items.add('');
      for i:=9 downto 0 do FindText.Items[i]:=FindText.Items[i-1];
      FindText.Items[0]:=FindText.text;
    end;
  modalresult:=mrOk;  
end;

procedure TFind.Button1Click(Sender: TObject);
begin
  save;
end;

procedure TFind.FindTextKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: save;
    #27: modalresult:=mrCancel;
  end
end;

procedure TFind.Cancel1Click(Sender: TObject);
begin
  close;
end;

end.
