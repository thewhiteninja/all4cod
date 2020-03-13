unit Unit17;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, OleCtrls, Fonctions,
   SHDocVw_TLB, StrUtils, Inifiles;

type
   TForm17 = class(TForm)
      WebBrowser1 : TWebBrowser;
      StatusBar1 : TStatusBar;
      ToolBar1 : TToolBar;
      ToolButton1 : TToolButton;
      ToolButton2 : TToolButton;
      ToolButton3 : TToolButton;
      ToolButton4 : TToolButton;
      ToolButton5 : TToolButton;
      ToolButton6 : TToolButton;
      ToolButton7 : TToolButton;
      Panel1 : TPanel;
      ComboBox1 : TComboBox;
      ToolButton8 : TToolButton;
      ProgressBar1 : TProgressBar;
      procedure FormActivate(Sender : TObject);
      procedure WebBrowser1NavigateComplete2(ASender : TObject;
         const pDisp : IDispatch; var URL : OleVariant);
      procedure StatusBar1Resize(Sender : TObject);
      procedure WebBrowser1ProgressChange(ASender : TObject; Progress,
         ProgressMax : Integer);
      procedure WebBrowser1StatusTextChange(ASender : TObject;
         const Text : WideString);
      procedure WebBrowser1CommandStateChange(ASender : TObject; Command : Integer;
         Enable : WordBool);
      procedure ComboBox1KeyPress(Sender : TObject; var Key : Char);
      procedure ToolButton8Click(Sender : TObject);
      procedure ToolButton6Click(Sender : TObject);
      procedure ToolButton1Click(Sender : TObject);
      procedure ToolButton2Click(Sender : TObject);
      procedure ToolButton4Click(Sender : TObject);
      procedure ToolButton5Click(Sender : TObject);
      procedure FormResize(Sender : TObject);
      procedure FormCreate(Sender : TObject);
      procedure FormClose(Sender : TObject; var Action : TCloseAction);
   private
      { Déclarations privées }
   public
      { Déclarations publiques }
   end;

var
   Form17 : TForm17;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm17.FormClose(Sender : TObject; var Action : TCloseAction);
begin
   if Form1.MDIChildCount = 1 then
   begin
      Form1.ListBox3.Clear;
      Form1.TabControl1.Tabs.Clear;
      Form1.Panel8.Visible := false;
   end
   else
   begin
      Form1.ListBox3.Items.Delete(Form1.ListBox3.Items.IndexOf(Caption));
      if Form1.TabControl1.Tabs.IndexOf(Caption) > -1 then Form1.TabControl1.Tabs.Delete(Form1.TabControl1.Tabs.IndexOf(Caption));
   end;
   Action := caFree;
end;

procedure TForm17.FormCreate(Sender : TObject);
var
   i : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ProgressBar1.Parent := StatusBar1;
   ProgressBar1.SetBounds(StatusBar1.Panels[0].Width + 2, 2, StatusBar1.Width - StatusBar1.Panels[0].Width - 5, StatusBar1.Height - 3);
   i := TIniFile.Create(Form1.CurrentFileLanguage);
   with i do
   begin
      Caption := 'All4Cod - ' + ReadString('NEWS', '0', '');
      ToolButton1.Hint := ReadString('NEWS', '1', '');
      ToolButton2.Hint := ReadString('NEWS', '2', '');
      ToolButton4.Hint := ReadString('NEWS', '3', '');
      ToolButton5.Hint := ReadString('NEWS', '4', '');
      ToolButton6.Hint := ReadString('NEWS', '5', '');
      ToolButton8.Hint := ReadString('NEWS', '6', '');
      free;
   end;
   if DetectionConnexion then
   begin
      try
         WebBrowser1.Navigate('http://www.OpenSofts.info/All4Cod/Infos.php');
         ComboBox1.Text := 'http://www.OpenSofts.info/All4Cod/Infos.php';
      except
      end;
   end
   else
   begin
      try
         WebBrowser1.Navigate('file://' + IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Infos.html');
         ComboBox1.Text := 'file://' + IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Infos.html';
      except
      end;
   end;
end;

procedure TForm17.FormResize(Sender : TObject);
begin
   Panel1.Width := Width - 172;
   ComboBox1.Width := Panel1.Width - 3;
end;

procedure TForm17.ToolButton5Click(Sender : TObject);
begin
   try
      WebBrowser1.Refresh;
   except
   end;
end;

procedure TForm17.ToolButton4Click(Sender : TObject);
begin
   try
      WebBrowser1.Stop;
   except
   end;
end;

procedure TForm17.ToolButton2Click(Sender : TObject);
begin
   try
      WebBrowser1.GoForward;
   except
   end;
end;

procedure TForm17.ToolButton1Click(Sender : TObject);
begin
   try
      WebBrowser1.GoBack;
   except
   end;
end;

procedure TForm17.ToolButton6Click(Sender : TObject);
begin
   if DetectionConnexion then
   begin
      try
         WebBrowser1.Navigate('http://www.OpenSofts.info/All4Cod/Infos.php');
         ComboBox1.Text := 'http://www.OpenSofts.info/All4Cod/Infos.php';
      except
      end;
   end
   else
   begin
      try
         WebBrowser1.Navigate('file:///' + AnsiReplaceText('\', IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Infos.html', '/'));
         ComboBox1.Text := 'file:///' + AnsiReplaceText('\', IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Infos.html', '/');
      except
      end;
   end;
end;

procedure TForm17.ToolButton8Click(Sender : TObject);
begin
   try
      WebBrowser1.Navigate(ComboBox1.Text);
      ComboBox1.Items.Add(ComboBox1.Text);
   except
   end;
end;

procedure TForm17.ComboBox1KeyPress(Sender : TObject; var Key : Char);
begin
   if key = Chr(VK_RETURN) then
   begin
      ToolButton8Click(nil);
      key := #0;
   end;
end;

procedure TForm17.WebBrowser1CommandStateChange(ASender : TObject;
   Command : Integer; Enable : WordBool);
begin
   ToolButton2.Enabled := Command = CSC_NAVIGATEFORWARD;
   ToolButton1.Enabled := Command = CSC_NAVIGATEBACK;
end;

procedure TForm17.WebBrowser1StatusTextChange(ASender : TObject;
   const Text : WideString);
begin
   StatusBar1.Panels[0].Text := text;
end;

procedure TForm17.WebBrowser1ProgressChange(ASender : TObject; Progress,
   ProgressMax : Integer);
begin
   ProgressBar1.Max := ProgressMax;
   ProgressBar1.Position := Progress;
end;

procedure TForm17.StatusBar1Resize(Sender : TObject);
begin
   StatusBar1.Panels[0].Width := StatusBar1.Width - 128;
   ProgressBar1.SetBounds(StatusBar1.Panels[0].Width + 2, 2, StatusBar1.Width - StatusBar1.Panels[0].Width - 5, StatusBar1.Height - 3);
end;

procedure TForm17.WebBrowser1NavigateComplete2(ASender : TObject;
   const pDisp : IDispatch; var URL : OleVariant);
begin
   ComboBox1.Text := URL;
end;

procedure TForm17.FormActivate(Sender : TObject);
begin
   Form1.TabControl1.TabIndex := Form1.ListBox3.Items.IndexOf(Caption);
end;

end.
