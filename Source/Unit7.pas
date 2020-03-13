unit Unit7;

interface

uses
   Windows, SysUtils, Forms, StdCtrls, ExtCtrls, ComCtrls, Classes, Controls,
   Dialogs, Inifiles;

type
   TForm7 = class(TForm)
      StatusBar1 : TStatusBar;
      GroupBox1 : TGroupBox;
      GroupBox2 : TGroupBox;
      Label1 : TLabel;
      TrackBar1 : TTrackBar;
      Label2 : TLabel;
      TrackBar2 : TTrackBar;
      Label3 : TLabel;
      TrackBar3 : TTrackBar;
      LabeledEdit1 : TLabeledEdit;
      LabeledEdit2 : TLabeledEdit;
      Button1 : TButton;
      Shape1 : TShape;
      Button2 : TButton;
      ColorDialog1 : TColorDialog;
      procedure Button1Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure TrackBar1Change(Sender : TObject);
      procedure TrackBar2Change(Sender : TObject);
      procedure TrackBar3Change(Sender : TObject);
      procedure FormCreate(Sender : TObject);
   private
      { Déclarations privées }
   public
      rouge, vert, bleu : string;
      procedure UpdateColor;
   end;

var
   Form7 : TForm7;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm7.UpdateColor;
begin
   TrackBar1.Position := GetRValue(Shape1.Brush.Color);
   TrackBar2.Position := GetGValue(Shape1.Brush.Color);
   TrackBar3.Position := GetBValue(Shape1.Brush.Color);
   Label1.Caption := Rouge + ' : ' + IntToStr(GetRValue(Shape1.Brush.Color));
   Label2.Caption := Vert + ' : ' + IntToStr(GetGValue(Shape1.Brush.Color));
   Label3.Caption := Bleu + ' : ' + IntToStr(GetBValue(Shape1.Brush.Color));
   LabeledEdit1.Text := IntToHex(GetRValue(Shape1.Brush.Color), 2) +
      IntToHex(GetGValue(Shape1.Brush.Color), 2) +
      IntToHex(GetBValue(Shape1.Brush.Color), 2);
   LabeledEdit2.Text := '#' + LabeledEdit1.Text;
end;

procedure TForm7.Button1Click(Sender : TObject);
begin
   LabeledEdit1.SelectAll;
   LabeledEdit1.CopyToClipboard;
end;

procedure TForm7.Button2Click(Sender : TObject);
begin
   if ColorDialog1.Execute then
   begin
      Shape1.Brush.Color := ColorDialog1.Color;
      UpdateColor;
   end;
end;

procedure TForm7.TrackBar1Change(Sender : TObject);
begin
   Shape1.Brush.Color := RGB(TrackBar1.Position, GetGValue(Shape1.Brush.Color),
      GetBValue(Shape1.Brush.Color));
   UpdateColor;
end;

procedure TForm7.TrackBar2Change(Sender : TObject);
begin
   Shape1.Brush.Color := RGB(GetRValue(Shape1.Brush.Color), TrackBar2.Position,
      GetBValue(Shape1.Brush.Color));
   UpdateColor;
end;

procedure TForm7.TrackBar3Change(Sender : TObject);
begin
   Shape1.Brush.Color := RGB(GetRValue(Shape1.Brush.Color),
      GetGValue(Shape1.Brush.Color), TrackBar3.Position);
   UpdateColor;
end;

procedure TForm7.FormCreate(Sender : TObject);
var
   ini : TIniFile;
begin
   Icon.Handle := Application.Icon.Handle;
   ini := TIniFile.Create(Form1.CurrentFileLanguage);
   with ini do
   begin
      Caption := ReadString('COLORS', '0', '');
      GroupBox1.Caption := ReadString('COLORS', '1', '');
      GroupBox2.Caption := ReadString('COLORS', '2', '');
      LabeledEdit1.EditLabel.Caption := ReadString('COLORS', '3', '');
      LabeledEdit2.EditLabel.Caption := ReadString('COLORS', '4', '');
      Button1.Caption := ReadString('COLORS', '5', '');
      Button2.Caption := ReadString('COLORS', '6', '');
      rouge := ReadString('COLORS', '7', '');
      vert := ReadString('COLORS', '8', '');
      bleu := ReadString('COLORS', '9', '');
      free;
   end;
   UpdateColor;
end;

end.
