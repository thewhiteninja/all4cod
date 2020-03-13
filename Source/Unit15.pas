unit Unit15;

interface

uses
   Windows, SysUtils, Controls, Forms, Fonctions, StdCtrls, StrUtils,
   HTTPGet, ExtCtrls, Classes, ComCtrls, ImgList, Inifiles, Gauges;

type
   TForm15 = class(TForm)
      Button1 : TButton;
      StatusBar1 : TStatusBar;
      Label1 : TLabel;
      Label2 : TLabel;
      Label3 : TLabel;
      Label4 : TLabel;
      Label5 : TLabel;
      Panel1 : TPanel;
      Label6 : TLabel;
      Label7 : TLabel;
      Label8 : TLabel;
      Label9 : TLabel;
      Label10 : TLabel;
      HTTPGet1 : THTTPGet;
      ImageList1 : TImageList;
      Image1 : TImage;
      Image2 : TImage;
      Image3 : TImage;
      Image4 : TImage;
      Image5 : TImage;
      ProgressBar1 : TProgressBar;
      procedure Button1Click(Sender : TObject);
      procedure HTTPGet1DoneString(Sender : TObject; Result : string);
      procedure HTTPGet1Error(Sender : TObject);
      procedure HTTPGet1DoneFile(Sender : TObject; FileName : string;
         FileSize : Integer);
      procedure HTTPGet1Progress(Sender : TObject; TotalSize,
         Readed : Integer);
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      DL_Fini, erreur : boolean;
      NewVersion : string;
      procedure Reset;
   end;

var
   Form15 : TForm15;

implementation

uses Unit1;

{$R *.dfm}

function NewVersionAvailable(new : string; current : string) : boolean;
var
   p1, p2 : TStringList;
begin
   if (new <> current) then
   begin
     p1 := TStringList.Create;
     p2 := TStringList.Create;
     try
       p1.Delimiter := '.';
       p2.Delimiter := '.';
       p1.DelimitedText := new;
       p2.DelimitedText := current;
       if StrToInt(p2[0]) > StrToInt(p1[0]) then result := false
       else if StrToInt(p2[1]) > StrToInt(p1[1]) then result := false
       else if StrToInt(p2[2]) > StrToInt(p1[2]) then result := false
       else if StrToInt(p2[3]) > StrToInt(p1[3]) then result := false;
     except
       p1.Free;
       p2.Free;
     end;
   end
   else result:=false;
end;

procedure TForm15.Reset;
begin
   ImageList1.GetBitmap(1, Image1.Picture.Bitmap);
   ImageList1.GetBitmap(1, Image2.Picture.Bitmap);
   ImageList1.GetBitmap(1, Image3.Picture.Bitmap);
   ImageList1.GetBitmap(1, Image4.Picture.Bitmap);
   ImageList1.GetBitmap(1, Image5.Picture.Bitmap);
   Label1.Caption := '...';
   Label2.Caption := '...';
   Label3.Caption := '...';
   Label4.Caption := '...';
   Label5.Caption := '...';
   StatusBar1.Panels[0].Text := '';
   ProgressBar1.Position := 0;
end;

procedure TForm15.Button1Click(Sender : TObject);
begin
   Button1.Enabled := false;
   if
      FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
      'Update\All4Cod.exe') then
   begin
      MessageBoxA(Handle, Pchar(form1.GetText('31') + #13 +
         Form1.GetText('32')), Pchar('All4Cod - ' + Form1.GetText('MSG')), 0 +
         MB_ICONINFORMATION + 0);
      exit;
   end;
   Label1.Caption := Form1.GetText('66');
   Application.ProcessMessages;
   if DetectionConnexion then
   begin
      ImageList1.GetBitmap(0, Image1.Picture.Bitmap);
      Image1.Repaint;
      Label1.Caption := Form1.GetText('67');
      Application.ProcessMessages;
   end
   else
   begin
      MessageBoxA(Handle, Pchar(Form1.GetText('33')), Pchar('All4Cod - ' +
         Form1.GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
      exit;
   end;
   Label2.Caption := Form1.GetText('66');
   Application.ProcessMessages;
   with HTTPGet1 do
   begin
      erreur := false;
      NewVersion := '';
      URL := 'http://www.opensofts.info/All4Cod/UPDATE';
      DL_Fini := true;
      GetString;
      while ((not erreur) and (NewVersion = '')) do
         Application.ProcessMessages;
      if not erreur then
      begin
         ImageList1.GetBitmap(0, Image2.Picture.Bitmap);
         Image2.Repaint;
         Label2.Caption := Form1.GetText('67');
         Application.ProcessMessages;
      end
      else
      begin
         MessageBoxA(Handle, Pchar(Form1.GetText('34')), Pchar('All4Cod - ' +
            Form1.GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
         Exit;
      end;
   end;
   Label3.Caption := Form1.GetText('66');
   Application.ProcessMessages;
   if NewVersionAvailable(NewVersion, GetVersion) then
   begin
      Label3.Caption := Form1.GetText('67');
      ImageList1.GetBitmap(0, Image3.Picture.Bitmap);
      Image3.Repaint;
      Application.ProcessMessages;
   end
   else
   begin
      MessageBoxA(Handle, Pchar(Form1.GetText('35') + #13 + Form1.GetText('36') +
         ' ' + GetVersion), Pchar('All4Cod - ' + Form1.GetText('MSG')), 0 +
         MB_ICONINFORMATION + 0);
      exit;
   end;
   Label4.Caption := Form1.GetText('66');
   Application.ProcessMessages;
   with HTTPGet1 do
   begin
      if not
         (DirectoryExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Update')) then
         MkDir(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
            + 'Update');
      URL := 'http://www.opensofts.info/download.php?id=1';
      FileName :=
         IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
         'Update\All4Cod.exe';
      erreur := false;
      DL_Fini := false;
      GetFile;
      while (not (erreur or DL_Fini)) do
         Application.ProcessMessages;
      if not erreur then
      begin
         ImageList1.GetBitmap(0, Image4.Picture.Bitmap);
         Image4.Repaint;
         Label4.Caption := Form1.GetText('68');
      end
      else
      begin
         MessageBoxA(Handle, Pchar(Form1.GetText('37')), Pchar('All4Cod - ' +
            Form1.GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
         Exit;
      end;
   end;
   ImageList1.GetBitmap(0, Image5.Picture.Bitmap);
   Image5.Repaint;
   label5.Caption := Form1.GetText('67');
   Application.ProcessMessages;
   MessageBoxA(Handle, Pchar(Form1.GetText('38') + #13 + Form1.GetText('39')),
      Pchar('All4Cod - ' + Form1.GetText('MSG')), 0 + MB_ICONINFORMATION + 0);
end;

procedure TForm15.HTTPGet1DoneString(Sender : TObject; Result : string);
begin
   NewVersion := Result;
end;

procedure TForm15.HTTPGet1Error(Sender : TObject);
begin
   erreur := true;
end;

procedure TForm15.HTTPGet1DoneFile(Sender : TObject; FileName : string;
   FileSize : Integer);
begin
   Dl_Fini := true;
   ProgressBar1.Position := 100;
end;

procedure TForm15.HTTPGet1Progress(Sender : TObject; TotalSize,
   Readed : Integer);
begin
   if not (DL_Fini) then
   begin
      Label4.Caption := FormatFloat('0.00', 100 * Readed * (1 / TotalSize)) +
         ' %';
      ProgressBar1.Position := Readed * 100 div TotalSize;
      if StatusBar1.Panels[0].Text = '' then
         StatusBar1.Panels[0].Text := Form1.GetText('69') + ' : ' +
            IntToStr(TotalSize div 1024) + ' Ko';
   end;
end;

procedure TForm15.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('MISEAJOUR', '0', '');
      Label6.Caption := ReadString('MISEAJOUR', '1', '');
      Label7.Caption := ReadString('MISEAJOUR', '2', '');
      Label8.Caption := ReadString('MISEAJOUR', '3', '');
      Label9.Caption := ReadString('MISEAJOUR', '4', '');
      Label10.Caption := ReadString('MISEAJOUR', '5', '');
      Button1.Caption := ReadString('MISEAJOUR', '6', '');
      free;
   end;
   ProgressBar1.Parent := StatusBar1;
   ProgressBar1.SetBounds(StatusBar1.Panels[0].Width + 2, 2, StatusBar1.Width -
      StatusBar1.Panels[0].Width - 2, 17);
end;

end.
