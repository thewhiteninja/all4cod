unit Unit8;

interface

uses
   Windows, Messages, SysUtils, Forms, StrUtils, MathExpression, ComCtrls,
   Classes, Controls, StdCtrls, Inifiles;

type
   TForm8 = class(TForm)
      StatusBar1 : TStatusBar;
      PageControl1 : TPageControl;
      TabSheet1 : TTabSheet;
      RichEdit1 : TRichEdit;
      Edit1 : TEdit;
      Button1 : TButton;
      Button2 : TButton;
      Button3 : TButton;
      Button4 : TButton;
      GroupBox1 : TGroupBox;
      ListBox1 : TListBox;
      Button5 : TButton;
      Button6 : TButton;
      Button7 : TButton;
      Button8 : TButton;
      Button9 : TButton;
      Button10 : TButton;
      Button11 : TButton;
      Button12 : TButton;
      Button13 : TButton;
      Button14 : TButton;
      Button15 : TButton;
      Button16 : TButton;
      Button17 : TButton;
      Button18 : TButton;
      Button19 : TButton;
      Button20 : TButton;
      Button21 : TButton;
      procedure Button20Click(Sender : TObject);
      procedure Edit1KeyPress(Sender : TObject; var Key : Char);
      procedure Button14Click(Sender : TObject);
      procedure FormCreate(Sender : TObject);
      procedure ListBox1Click(Sender : TObject);
      procedure Button4Click(Sender : TObject);
      procedure Button1Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure Button3Click(Sender : TObject);
   private
      { Déclarations privées }
   public
      rep : string;
   end;

var
   Form8 : TForm8;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm8.Button20Click(Sender : TObject);
var
   res : string;
begin
   if Edit1.Text <> '' then
   begin
      if CalcExpression(AnsiReplaceText(AnsiReplaceText(Edit1.Text, 'REP', Rep),
         'Pi', 'pi'), Res) = 0 then
      begin
         RichEdit1.Lines.Add(' ' + Edit1.Text + ' = ' + Res);
         rep := res;
         Edit1.Text := '';
      end
      else
         RichEdit1.Lines.Add(' ' + Edit1.Text + ' = ' + Form1.GetText('40'));
   end;
end;

procedure TForm8.Edit1KeyPress(Sender : TObject; var Key : Char);
begin
   if Ord(Key) = VK_RETURN then
      Button20Click(nil);
   if Key = '(' then
   begin
      Edit1.SelText := '(  )';
      Edit1.SelStart := Edit1.SelStart - 2;
      Key := #0;
   end;
end;

procedure TForm8.Button14Click(Sender : TObject);
begin
   Edit1.SelText := TButton(Sender).Caption;
end;

procedure TForm8.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('EXPR', '0', '');
      TabSheet1.Caption := ReadString('EXPR', '1', '');
      Button1.Caption := ReadString('EXPR', '2', '');
      Button4.Caption := ReadString('EXPR', '3', '');
      Button2.Caption := ReadString('EXPR', '4', '');
      Button3.Caption := ReadString('EXPR', '5', '');
      Button21.Caption := ReadString('EXPR', '6', '');
      Button20.Caption := ReadString('EXPR', '7', '');
      free;
   end;
   rep := '0';
end;

procedure TForm8.ListBox1Click(Sender : TObject);
begin
   if ListBox1.ItemIndex <> -1 then
   begin
      Edit1.SelText := ListBox1.Items[ListBox1.ItemIndex];
      if Length(ListBox1.Items[ListBox1.ItemIndex]) > 2 then
         Edit1.SelStart := Edit1.SelStart - 1;
   end;
end;

procedure TForm8.Button4Click(Sender : TObject);
begin
   SendMessage(RichEdit1.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
end;

procedure TForm8.Button1Click(Sender : TObject);
begin
   SendMessage(RichEdit1.Handle, WM_VSCROLL, SB_LINEUP, 0);
end;

procedure TForm8.Button2Click(Sender : TObject);
begin
   SendMessage(RichEdit1.Handle, WM_HSCROLL, SB_LINELEFT, 0);
end;

procedure TForm8.Button3Click(Sender : TObject);
begin
   SendMessage(RichEdit1.Handle, WM_HSCROLL, SB_LINERIGHT, 0);
end;

end.
