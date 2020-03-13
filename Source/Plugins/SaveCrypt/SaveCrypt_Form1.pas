unit SaveCrypt_Form1;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  DCPmd5, DCPdes, ComCtrls, StdCtrls, Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit1: TLabeledEdit;
    Button4: TButton;
    LabeledEdit2: TLabeledEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    LabeledEdit3: TLabeledEdit;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    procedure RadioButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

const
  AvailChar : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

implementation

{$R *.dfm}

Procedure Crypt(f_in : string; f_out : string; pass : string; crypt : boolean);
var Cipher : TDCP_3des;
    f_in_stream, f_out_stream : TFileStream;
begin
   Cipher:=TDCP_3des.Create(Cipher);
   f_in_stream:=TFileStream.Create(f_in, fmOpenRead);
   f_out_stream:=TFileStream.Create(f_out, fmCreate);
   Cipher.InitStr(pass, TDCP_md5);
   if crypt then Cipher.EncryptStream(f_in_stream, f_out_stream, f_in_stream.Size)
            else Cipher.DecryptStream(f_in_stream, f_out_stream, f_in_stream.Size);
   Cipher.Burn;
   Cipher.Free;
   f_in_stream.Free;
   f_out_stream.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
MessageBoxA(handle,Pchar('Auteur : thewhiteninja'+#13+'Date : 28 Février 2006'+#13+#13+'Description : Ce plugin permet de crypter/décrypter'+#13+'n''importe quel fichier en utilisant le 3DES.'),Pchar('All4Cod - Plugins Infos'),0 + MB_ICONINFORMATION + 0);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if OpenDialog1.Execute then LabeledEdit1.Text:=OpenDialog1.FileName;
end;

procedure TForm1.Button5Click(Sender: TObject);
var i : integer;
begin
LabeledEdit3.Text:='';
for i:=0 to 19 do LabeledEdit3.Text:=LabeledEdit3.Text+Availchar[random(length(AvailChar)-1)+1];
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if not(FileExists(LabeledEdit1.Text)) then begin MessageBoxA(0,Pchar('Le fichier à crypter n''existe pas !'),Pchar('All4Cod - Plugins Erreur'),0 + MB_ICONINFORMATION + 0); Exit; end;
if LabeledEdit3.Text='' then begin MessageBoxA(0,Pchar('Le mot de passe est vide !'),Pchar('All4Cod - Plugins Erreur'),0 + MB_ICONINFORMATION + 0); Exit; end;
if RadioButton1.Checked then StatusBar1.Panels[0].Text:='Cryptage en cours ...'
                        else StatusBar1.Panels[0].Text:='Décryptage en cours ...';
Crypt(LabeledEdit1.Text, LabeledEdit2.Text, LabeledEdit3.Text, RadioButton1.Checked);
if RadioButton1.Checked then StatusBar1.Panels[0].Text:='Cryptage terminé'
                        else StatusBar1.Panels[0].Text:='Décryptage terminé';
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
if RadioButton1.Checked then LabeledEdit2.Text:=LabeledEdit1.Text+'.cry'
                        else LabeledEdit2.Text:=LabeledEdit1.Text+'.decry';
end;

end.
