unit Unit11;

interface

uses
   Forms, Dialogs, SynEditPrintPreview, Inifiles, ComCtrls, Classes, Controls,
   StdCtrls,
   ExtCtrls;

type
   TForm11 = class(TForm)
      StatusBar1 : TStatusBar;
      Panel1 : TPanel;
      Button1 : TButton;
      SynEditPrintPreview1 : TSynEditPrintPreview;
      Button2 : TButton;
      Button3 : TButton;
      Button4 : TButton;
      Button5 : TButton;
      Button6 : TButton;
      Label1 : TLabel;
      ComboBox1 : TComboBox;
      procedure ComboBox1Select(Sender : TObject);
      procedure Button1Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure Button3Click(Sender : TObject);
      procedure Button4Click(Sender : TObject);
      procedure Button6Click(Sender : TObject);
      procedure Button5Click(Sender : TObject);
      procedure FormShow(Sender : TObject);
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      procedure UpdateEnable;
   end;

var
   Form11 : TForm11;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm11.UpdateEnable;
begin
   {Button1.Enabled := SynEditPrintPreview1.PageNumber > 1;
   Button2.Enabled := Button1.Enabled;
   Button3.Enabled := SynEditPrintPreview1.PageNumber < SynEditPrintPreview1.PageCount;
   Button4.Enabled := button3.Enabled;}
end;

procedure TForm11.ComboBox1Select(Sender : TObject);
begin
   case ComboBox1.ItemIndex of
      0 : SynEditPrintPreview1.ScaleMode := pscPageWidth;
      1 : SynEditPrintPreview1.ScaleMode := pscWholePage;
      2 :
         begin
            SynEditPrintPreview1.ScaleMode := pscUserScaled;
            SynEditPrintPreview1.ScalePercent := 25;
         end;
      3 :
         begin
            SynEditPrintPreview1.ScaleMode := pscUserScaled;
            SynEditPrintPreview1.ScalePercent := 50;
         end;
      4 :
         begin
            SynEditPrintPreview1.ScaleMode := pscUserScaled;
            SynEditPrintPreview1.ScalePercent := 75;
         end;
      5 :
         begin
            SynEditPrintPreview1.ScaleMode := pscUserScaled;
            SynEditPrintPreview1.ScalePercent := 100;
         end;
      6 :
         begin
            SynEditPrintPreview1.ScaleMode := pscUserScaled;
            SynEditPrintPreview1.ScalePercent := 200;
         end;
      7 :
         begin
            SynEditPrintPreview1.ScaleMode := pscUserScaled;
            SynEditPrintPreview1.ScalePercent := 400;
         end;
      8 :
         begin
            SynEditPrintPreview1.ScaleMode := pscUserScaled;
            SynEditPrintPreview1.ScalePercent := 800;
         end;
   end;
end;

procedure TForm11.Button1Click(Sender : TObject);
begin
   SynEditPrintPreview1.FirstPage;
   Form11.UpdateEnable;
end;

procedure TForm11.Button2Click(Sender : TObject);
begin
   SynEditPrintPreview1.PreviousPage;
   Form11.UpdateEnable;
end;

procedure TForm11.Button3Click(Sender : TObject);
begin
   SynEditPrintPreview1.NextPage;
   Form11.UpdateEnable;
end;

procedure TForm11.Button4Click(Sender : TObject);
begin
   SynEditPrintPreview1.LastPage;
   Form11.UpdateEnable;
end;

procedure TForm11.Button6Click(Sender : TObject);
begin
   Close;
end;

procedure TForm11.Button5Click(Sender : TObject);
begin
   if Form1.PrintDialog1.Execute then
   begin
      Form1.SynEditPrint1.Copies := Form1.PrintDialog1.Copies;
      Form1.SynEditPrint1.PrintRange(Form1.PrintDialog1.FromPage,
         Form1.PrintDialog1.ToPage);
   end;
end;

procedure TForm11.FormShow(Sender : TObject);
begin
   ComboBox1.ItemIndex := 0;
   ComboBox1Select(nil);
   ComboBox1.SetFocus;
   SynEditPrintPreview1.UpdatePreview;
   UpdateEnable;
end;

procedure TForm11.FormCreate(Sender : TObject);
var
   ini : TIniFile;
   i : integer;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('PREVIEW', '0', '');
      Label1.Caption := ReadString('PREVIEW', '7', '');
      Button1.Caption := ReadString('PREVIEW', '1', '');
      Button2.Caption := ReadString('PREVIEW', '2', '');
      Button3.Caption := ReadString('PREVIEW', '3', '');
      Button4.Caption := ReadString('PREVIEW', '4', '');
      Button5.Caption := ReadString('PREVIEW', '5', '');
      Button6.Caption := ReadString('PREVIEW', '6', '');
      i := ComboBox1.ItemIndex;
      ComboBox1.Items[0] := ReadString('PREVIEW', '8', '');
      ComboBox1.Items[1] := ReadString('PREVIEW', '9', '');
      ComboBox1.ItemIndex := i;
      free;
   end;
end;

end.
