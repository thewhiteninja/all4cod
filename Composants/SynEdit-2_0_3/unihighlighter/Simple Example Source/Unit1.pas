unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SynEditHighlighter, SynUniHighlighter, SynEdit,
  ExtCtrls, ComCtrls, SynUniDesigner;

type
  TForm1 = class(TForm)
    SynEdit1: TSynEdit;
    SynUniSyn1: TSynUniSyn;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button3: TButton;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Button4: TButton;
    Button5: TButton;
    Button2: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    Memo3: TMemo;
    Label4: TLabel;
    Button9: TButton;
    Label5: TLabel;
    Button10: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  SynEdit1.Highlighter:=nil;
  SynUniSyn1.MainRules.Reset;
  SynUniSyn1.MainRules.clear;
  if OpenDialog1.execute then SynUniSyn1.LoadFromFile(OpenDialog1.Filename);
  SynEdit1.Highlighter:=SynUniSyn1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with TSynUniDesigner.Create(SynUniSyn1) do
    try
      execute;
    finally
      free;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
  var kw:TSynSymbolGroup;
begin
  SynUniSyn1.MainRules.Reset;
  SynEdit1.Highlighter:=nil;

  kw:=TSynSymbolGroup.Create('',TSynHighlighterAttributes.Create('unknown'));
  kw.Name:='Example 1';
  kw.Attribs.Foreground:=clRed;
  kw.Attribs.Background:=clWhite;
  kw.KeywordsList.assign(memo1.Lines);
  SynUniSyn1.MainRules.AddSymbolGroup(kw);

  kw:=TSynSymbolGroup.Create('',TSynHighlighterAttributes.Create('unknown'));
  kw.Name:='Example 2';
  kw.Attribs.Foreground:=clGreen;
  kw.Attribs.Background:=clWhite;
  kw.Attribs.Style:=[fsItalic];
  kw.KeywordsList.assign(memo2.Lines);
  SynUniSyn1.MainRules.AddSymbolGroup(kw);

  kw:=TSynSymbolGroup.Create('',TSynHighlighterAttributes.Create('unknown'));
  kw.Name:='Example 3';
  kw.Attribs.Foreground:=clBlue;
  kw.Attribs.Background:=clWhite;
  kw.Attribs.Style:=[fsBold];
  kw.KeywordsList.assign(memo3.Lines);
  SynUniSyn1.MainRules.AddSymbolGroup(kw);

  SynEdit1.Highlighter:=SynUniSyn1;
end;

procedure TForm1.Button4Click(Sender: TObject);
  var r:TSynRange;
begin
  SynUniSyn1.MainRules.Reset;
  SynEdit1.Highlighter:=nil;
  r:=TSynRange.Create('{','}');
  r.Name:='Remarks';
  r.DefaultAttri.Foreground:=clNavy;
  r.DefaultAttri.Background:=clLime;
  r.NumberAttri.Foreground:=clNavy;
  r.NumberAttri.Background:=clLime;
  r.CaseSensitive:=false;
  r.OpenSymbol.BrakeType:=btAny;
 SynUniSyn1.MainRules.AddRange(r);
  SynEdit1.Highlighter:=SynUniSyn1;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  SynEdit1.Highlighter:=nil;
  SynUniSyn1.MainRules.clear;
  SynEdit1.Highlighter:=SynUniSyn1;
end;

procedure TForm1.Button9Click(Sender: TObject);
  var r:TSynRange;
begin
  SynUniSyn1.MainRules.Reset;
  SynEdit1.Highlighter:=nil;
  r:=TSynRange.Create('''','''');
  r.Name:='Strings';
  r.DefaultAttri.Foreground:=clNavy;
  r.DefaultAttri.Background:=clYellow;
  r.NumberAttri.Foreground:=clNavy;
  r.NumberAttri.Background:=clYellow;
  r.CaseSensitive:=false;
  r.OpenSymbol.BrakeType:=btAny;
 SynUniSyn1.MainRules.AddRange(r);
  SynEdit1.Highlighter:=SynUniSyn1;
end;

procedure TForm1.Button10Click(Sender: TObject);
  var r:TSynRange;
begin
  SynUniSyn1.MainRules.Reset;
  SynEdit1.Highlighter:=nil;
  r:=TSynRange.Create('[''{','}'']');
  r.Name:='Strings';
  r.DefaultAttri.Foreground:=clNavy;
  r.DefaultAttri.Background:=clAqua;
  r.NumberAttri.Foreground:=clNavy;
  r.NumberAttri.Background:=clAqua;
  r.CaseSensitive:=false;
  r.OpenSymbol.BrakeType:=btAny;
 SynUniSyn1.MainRules.AddRange(r);
  SynEdit1.Highlighter:=SynUniSyn1;
end;

end.
