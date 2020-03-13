unit Unit16;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, jpeg, Inifiles, Shellapi;

type
   TForm16 = class(TForm)
      Image1 : TImage;
      GroupBox1 : TGroupBox;
      Memo1 : TMemo;
      Label1 : TLabel;
      Label2 : TLabel;
      Button1 : TButton;
      GroupBox2 : TGroupBox;
      Button2 : TButton;
      Button3 : TButton;
      Label3 : TLabel;
      Label4 : TLabel;
      Label5 : TLabel;
      Label6 : TLabel;
      Label7 : TLabel;
      Label8 : TLabel;
      Label9 : TLabel;
      Label10 : TLabel;
      Label11 : TLabel;
      Label12 : TLabel;
      Label13 : TLabel;
      Label14 : TLabel;
      Label15 : TLabel;
      procedure Button3Click(Sender : TObject);
      procedure Label5Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure FormCreate(Sender : TObject);
      procedure Label13Click(Sender : TObject);
   private
      { Déclarations privées }
   public
      { Déclarations publiques }
   end;

var
   Form16 : TForm16;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm16.Button3Click(Sender : TObject);
begin
   ShellExecute(handle, 'open', pchar('http://www.OpenSofts.info'), nil, nil,
      SW_SHOW);
end;

procedure TForm16.Label5Click(Sender : TObject);
begin
   ShellExecute(handle, 'open', pchar(TLabel(Sender).Caption), nil, nil,
      SW_SHOW);
end;

procedure TForm16.Button2Click(Sender : TObject);
begin
   MessageBoxA(Handle, Pchar(Form1.GetText('70') + ' :' + #13 + '' + #13 + '- '
      + Form1.GetText('71') + ' : thewhiteninja' + #13 + '- ' + Form1.GetText('72') +
      ' fr, eng : thewhiteninja' + #13 + '- ' + Form1.GetText('73') +
      ' : Delphi 2005, Tidy, Upx'), Pchar('All4Cod - ' + Form1.GetText('70')), 0 +
      MB_ICONINFORMATION + 0);
end;

procedure TForm16.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('APROPOS', '0', '');
      Label2.Caption := ReadString('APROPOS', '1', '') + ' : ';
      GroupBox2.Caption := ReadString('APROPOS', '2', '');
      Button1.Caption := ReadString('APROPOS', '3', '');
      Button2.Caption := ReadString('APROPOS', '4', '');
      Button3.Caption := ReadString('APROPOS', '5', '');
      free;
   end;
end;

procedure TForm16.Label13Click(Sender : TObject);
begin
   ShellExecute(handle, 'open',
      pchar('http://www.geocities.com/CapeCanaveral/8002'), nil, nil, SW_SHOW);
end;

end.
