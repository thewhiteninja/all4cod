unit Unit3;

interface

uses
   Windows, SysUtils, Forms, Fonctions, ComCtrls, SynHighlighterEiffel,
   SynEditHighlighter, SynHighlighterCpp, SynHighlighterXML, SynHighlighterAsm,
   SynHighlighterVrml97, SynHighlighterVB, SynHighlighterURI,
   SynHighlighterUnreal, SynHighlighterUNIXShellScript, SynHighlighterTeX,
   SynHighlighterTclTk, SynHighlighterMsg, SynHighlighterST, SynHighlighterSml,
   SynHighlighterSQL, SynHighlighterSDD, SynHighlighterRuby, SynHighlighterRC,
   SynHighlighterPython, SynHighlighterProgress, SynHighlighterPHP,
   SynHighlighterPerl, SynHighlighterPas, SynHighlighterBat, Inifiles,
   SynHighlighterVBScript, SynHighlighterM3, SynHighlighterModelica,
   SynHighlighterLDraw, SynHighlighterKix, SynHighlighterJScript,
   SynHighlighterJava, SynHighlighterInno, SynHighlighterIni,
   SynHighlighterHtml, SynHighlighterHP48, SynHighlighterHaskell,
   SynHighlighterGWS, SynHighlighterGeneral, SynHighlighterDml,
   SynHighlighterGalaxy, SynHighlighterFoxpro, SynHighlighterFortran,
   SynHighlighterDOT, SynHighlighterIDL, SynHighlighterCobol, SynHighlighterCPM,
   SynHighlighterCSS, SynHighlighterCAC, SynHighlighterCache, SynHighlighterCS,
   SynHighlighterDfm, SynHighlighterBaan, SynHighlighterAWK,
   SynHighlighterADSP21xx, SynHighlighterHC11, StdCtrls, ExtCtrls, SynEdit,
   Spin, SynEditPrintTypes, SynSpellCheck, SynHighlighterScilab,
   SynHighlighterR, SynHighlighterNSIS, SynHighlighterAny, Classes, Graphics,
   Controls, Dialogs, Grids, jpeg, ShellApi, SynHighlighterMPerl;

type
   TForm3 = class(TForm)
      StatusBar1 : TStatusBar;
      SynCppSyn1 : TSynCppSyn;
      SynEiffelSyn1 : TSynEiffelSyn;
      SynHC11Syn1 : TSynHC11Syn;
      SynADSP21xxSyn1 : TSynADSP21xxSyn;
      SynAWKSyn1 : TSynAWKSyn;
      SynBaanSyn1 : TSynBaanSyn;
      SynDfmSyn1 : TSynDfmSyn;
      SynCSSyn1 : TSynCSSyn;
      SynCacheSyn1 : TSynCacheSyn;
      SynCACSyn1 : TSynCACSyn;
      SynCssSyn1 : TSynCssSyn;
      SynCPMSyn1 : TSynCPMSyn;
      SynCobolSyn1 : TSynCobolSyn;
      SynIdlSyn1 : TSynIdlSyn;
      SynDOTSyn1 : TSynDOTSyn;
      SynFortranSyn1 : TSynFortranSyn;
      SynFoxproSyn1 : TSynFoxproSyn;
      SynGalaxySyn1 : TSynGalaxySyn;
      SynDmlSyn1 : TSynDmlSyn;
      SynGeneralSyn1 : TSynGeneralSyn;
      SynGWScriptSyn1 : TSynGWScriptSyn;
      SynHaskellSyn1 : TSynHaskellSyn;
      SynHP48Syn1 : TSynHP48Syn;
      SynHTMLSyn1 : TSynHTMLSyn;
      SynIniSyn1 : TSynIniSyn;
      SynInnoSyn1 : TSynInnoSyn;
      SynJavaSyn1 : TSynJavaSyn;
      SynJScriptSyn1 : TSynJScriptSyn;
      SynKixSyn1 : TSynKixSyn;
      SynLDRSyn1 : TSynLDRSyn;
      SynModelicaSyn1 : TSynModelicaSyn;
      SynM3Syn1 : TSynM3Syn;
      SynVBScriptSyn1 : TSynVBScriptSyn;
      SynBatSyn1 : TSynBatSyn;
      SynPasSyn1 : TSynPasSyn;
      SynPHPSyn1 : TSynPHPSyn;
      SynProgressSyn1 : TSynProgressSyn;
      SynPythonSyn1 : TSynPythonSyn;
      SynRCSyn1 : TSynRCSyn;
      SynRubySyn1 : TSynRubySyn;
      SynSDDSyn1 : TSynSDDSyn;
      SynSQLSyn1 : TSynSQLSyn;
      SynSMLSyn1 : TSynSMLSyn;
      SynSTSyn1 : TSynSTSyn;
      SynMsgSyn1 : TSynMsgSyn;
      SynTclTkSyn1 : TSynTclTkSyn;
      SynTeXSyn1 : TSynTeXSyn;
      SynUNIXShellScriptSyn1 : TSynUNIXShellScriptSyn;
      SynUnrealSyn1 : TSynUnrealSyn;
      SynURISyn1 : TSynURISyn;
      SynVBSyn1 : TSynVBSyn;
      SynVrml97Syn1 : TSynVrml97Syn;
      SynAsmSyn1 : TSynAsmSyn;
      SynXMLSyn1 : TSynXMLSyn;
      GroupBox1 : TGroupBox;
      LabeledEdit1 : TLabeledEdit;
      Bevel1 : TBevel;
      Label1 : TLabel;
      CheckBox1 : TCheckBox;
      ComboBox1 : TComboBox;
      Label3 : TLabel;
      ComboBox2 : TComboBox;
      Label4 : TLabel;
      Shape1 : TShape;
      Shape2 : TShape;
      Label5 : TLabel;
      LabeledEdit2 : TLabeledEdit;
      CheckBox2 : TCheckBox;
      CheckBox3 : TCheckBox;
      CheckBox4 : TCheckBox;
      CheckBox5 : TCheckBox;
      LabeledEdit3 : TLabeledEdit;
      SynEdit1 : TSynEdit;
      Button1 : TButton;
      Button2 : TButton;
      ColorDialog1 : TColorDialog;
      CheckBox6 : TCheckBox;
      CheckBox7 : TCheckBox;
      SpinEdit1 : TSpinEdit;
      Label8 : TLabel;
      CheckBox8 : TCheckBox;
      CheckBox9 : TCheckBox;
      CheckBox10 : TCheckBox;
      CheckBox11 : TCheckBox;
      CheckBox12 : TCheckBox;
      CheckBox13 : TCheckBox;
      CheckBox14 : TCheckBox;
      CheckBox15 : TCheckBox;
      CheckBox16 : TCheckBox;
      GroupBox2 : TGroupBox;
      Label9 : TLabel;
      Label10 : TLabel;
      CheckBox17 : TCheckBox;
      CheckBox18 : TCheckBox;
      CheckBox19 : TCheckBox;
      SpinEdit2 : TSpinEdit;
      SpinEdit3 : TSpinEdit;
      GroupBox3 : TGroupBox;
      Bevel2 : TBevel;
      Button3 : TButton;
      Label11 : TLabel;
      FontDialog1 : TFontDialog;
      CheckBox20 : TCheckBox;
      CheckBox21 : TCheckBox;
      CheckBox22 : TCheckBox;
      CheckBox23 : TCheckBox;
      CheckBox24 : TCheckBox;
      Label12 : TLabel;
      Label13 : TLabel;
      Label14 : TLabel;
      Label15 : TLabel;
      Label16 : TLabel;
      Label17 : TLabel;
      Label18 : TLabel;
      Label19 : TLabel;
      Label20 : TLabel;
      SpinEdit4 : TSpinEdit;
      SpinEdit5 : TSpinEdit;
      SpinEdit6 : TSpinEdit;
      SpinEdit7 : TSpinEdit;
      ComboBox3 : TComboBox;
      ComboBox4 : TComboBox;
      Shape3 : TShape;
      Shape4 : TShape;
      Shape5 : TShape;
      Button4 : TButton;
      Button5 : TButton;
      Button6 : TButton;
      CheckBox25 : TCheckBox;
      CheckBox26 : TCheckBox;
      CheckBox27 : TCheckBox;
      CheckBox28 : TCheckBox;
      CheckBox29 : TCheckBox;
      CheckBox30 : TCheckBox;
      Button7 : TButton;
      GroupBox4 : TGroupBox;
      ListBox1 : TListBox;
      Button8 : TButton;
      Button9 : TButton;
      Button10 : TButton;
      CheckBox31 : TCheckBox;
      Label21 : TLabel;
      Edit1 : TEdit;
      Button11 : TButton;
      Label22 : TLabel;
      Edit2 : TEdit;
      Label32 : TLabel;
      Edit7 : TEdit;
      Edit8 : TEdit;
      Label33 : TLabel;
      Button15 : TButton;
      OpenDialog1 : TOpenDialog;
      GroupBox5 : TGroupBox;
      Label42 : TLabel;
      Label43 : TLabel;
      CheckBox32 : TCheckBox;
      CheckBox33 : TCheckBox;
      ComboBox11 : TComboBox;
      ComboBox12 : TComboBox;
      Button12 : TButton;
      Button14 : TButton;
      CheckBox34 : TCheckBox;
      Label44 : TLabel;
      ComboBox13 : TComboBox;
      Label45 : TLabel;
      SpinEdit14 : TSpinEdit;
      SpinEdit15 : TSpinEdit;
      Label46 : TLabel;
      SpinEdit16 : TSpinEdit;
      Label47 : TLabel;
      SpinEdit17 : TSpinEdit;
      Label48 : TLabel;
      SpinEdit18 : TSpinEdit;
      Label49 : TLabel;
      SpinEdit19 : TSpinEdit;
      Label50 : TLabel;
      SpinEdit20 : TSpinEdit;
      Label51 : TLabel;
      CheckBox35 : TCheckBox;
      CheckBox36 : TCheckBox;
      CheckBox37 : TCheckBox;
      CheckBox38 : TCheckBox;
      CheckBox39 : TCheckBox;
      Image1 : TImage;
      CheckBox40 : TCheckBox;
      SynAnySyn1 : TSynAnySyn;
      SynNSISSyn1 : TSynNSISSyn;
      SynPerlSyn1 : TSynPerlSyn;
      SynRSyn1 : TSynRSyn;
      SynScilabSyn1 : TSynScilabSyn;
      GroupBox7 : TGroupBox;
      Label35 : TLabel;
      ComboBox10 : TComboBox;
      GroupBox9 : TGroupBox;
      Label40 : TLabel;
      Label41 : TLabel;
      Label24 : TLabel;
      Label25 : TLabel;
      ComboBox6 : TComboBox;
      ComboBox5 : TComboBox;
      SpinEdit13 : TSpinEdit;
      SpinEdit12 : TSpinEdit;
      GroupBox10 : TGroupBox;
      StringGrid1 : TStringGrid;
      Button16 : TButton;
      Button17 : TButton;
      GroupBox11 : TGroupBox;
      Label26 : TLabel;
      ComboBox18 : TComboBox;
      GroupBox13 : TGroupBox;
      Label36 : TLabel;
      ComboBox20 : TComboBox;
      Button18 : TButton;
      Button20 : TButton;
      SaveDialog1 : TSaveDialog;
      CheckBox41 : TCheckBox;
      CheckBox42 : TCheckBox;
      CheckBox43 : TCheckBox;
      CheckBox44 : TCheckBox;
      Notebook1 : TNotebook;
      StaticText1 : TStaticText;
      StaticText2 : TStaticText;
      PageControl1 : TPageControl;
      TabSheet1 : TTabSheet;
      TabSheet2 : TTabSheet;
      TabSheet3 : TTabSheet;
      GroupBox14 : TGroupBox;
      GroupBox15 : TGroupBox;
      CheckBox45 : TCheckBox;
      CheckBox46 : TCheckBox;
      CheckBox47 : TCheckBox;
      LabeledEdit4 : TLabeledEdit;
      Label6 : TLabel;
      SpinEdit8 : TSpinEdit;
      Label7 : TLabel;
      HotKey1 : THotKey;
      Label23 : TLabel;
      ComboBox9 : TComboBox;
      GroupBox16 : TGroupBox;
      ListBox2 : TListBox;
      GroupBox17 : TGroupBox;
      Label34 : TLabel;
      Label37 : TLabel;
      Label55 : TLabel;
      Label56 : TLabel;
      Label57 : TLabel;
      Label58 : TLabel;
      Label59 : TLabel;
      Memo1 : TMemo;
      Image2 : TImage;
      Label60 : TLabel;
      GroupBox18 : TGroupBox;
      Memo2 : TMemo;
      GroupBox19 : TGroupBox;
      ListView1 : TListView;
      Label63 : TLabel;
      Label64 : TLabel;
      TreeView1 : TTreeView;
      Label2 : TLabel;
      Label52 : TLabel;
      Label53 : TLabel;
      Label54 : TLabel;
      Label65 : TLabel;
      CheckBox48 : TCheckBox;
    SynMPerlSyn1: TSynMPerlSyn;
    TabSheet4: TTabSheet;
    ComboBox7: TComboBox;
    Label27: TLabel;
    procedure ComboBox7Select(Sender: TObject);
      procedure FormCreate(Sender : TObject);
      procedure FormDestroy(Sender : TObject);
      procedure LabeledEdit1Change(Sender : TObject);
      procedure FormClose(Sender : TObject; var Action : TCloseAction);
      procedure ComboBox1Select(Sender : TObject);
      procedure ComboBox2Select(Sender : TObject);
      procedure LabeledEdit2Change(Sender : TObject);
      procedure Button1Click(Sender : TObject);
      procedure Button2Click(Sender : TObject);
      procedure CheckBox2Click(Sender : TObject);
      procedure LabeledEdit3Change(Sender : TObject);
      procedure Button3Click(Sender : TObject);
      procedure Button4Click(Sender : TObject);
      procedure Button5Click(Sender : TObject);
      procedure Button6Click(Sender : TObject);
      procedure Button7Click(Sender : TObject);
      procedure Button10Click(Sender : TObject);
      procedure Button9Click(Sender : TObject);
      procedure Button8Click(Sender : TObject);
      procedure Button11Click(Sender : TObject);
      procedure Button15Click(Sender : TObject);
      procedure Button12Click(Sender : TObject);
      procedure Button14Click(Sender : TObject);
      procedure FormShow(Sender : TObject);
      procedure StringGrid1DrawCell(Sender : TObject; ACol, ARow : Integer;
         Rect : TRect; State : TGridDrawState);
      procedure StringGrid1SelectCell(Sender : TObject; ACol, ARow : Integer;
         var CanSelect : Boolean);
      procedure Button17Click(Sender : TObject);
      procedure Button16Click(Sender : TObject);
      procedure Button18Click(Sender : TObject);
      procedure ComboBox18Select(Sender : TObject);
      procedure TreeView1Click(Sender : TObject);
      procedure LabeledEdit4Change(Sender : TObject);
      procedure ComboBox9Select(Sender : TObject);
      procedure ListBox2Click(Sender : TObject);
      procedure Label63Click(Sender : TObject);
      procedure Label64Click(Sender : TObject);
   private
      { Déclarations privées }
   public
      AC_Files, ListHighlighters, AutoCompletion : TStringList;
      Commentaires : TCommentaires;
      TriggerChars : TTriggerChars;
      procedure FileToAC(var insert : string; var item : string; var biggest :
         string; fichier : string);
      procedure ChargeOptions;
      procedure SauveOptions;
      procedure UpdateOptions;
      procedure UpdateVariables;
      procedure SaveConfig(fichier : string);
      procedure LoadConfig(cfg : integer);
   end;

var
   Form3 : TForm3;

implementation

uses uHighlighterProcs, Unit1, Unit2, SynEditPrint, Unit14,
   SynCompletionProposal, Menus, Unit17;

{$R *.dfm}

function ExecuteCommand(Cmd : string) : boolean;
var
   StartInfo : TStartupInfo;
   ProcessInfo : TProcessInformation;
   Fin : Boolean;
begin
   Result := True;
   FillChar(StartInfo, SizeOf(StartInfo), #0);
   StartInfo.cb := SizeOf(StartInfo);
   StartInfo.dwFlags := STARTF_USESHOWWINDOW;
   StartInfo.wShowWindow := SW_HIDE;
   if CreateProcess(nil, PChar(Cmd), nil, nil, False,
      0, nil, nil, StartInfo, ProcessInfo) then
   begin
      Fin := False;
      repeat
         case WaitForSingleObject(ProcessInfo.hProcess, 200) of
            WAIT_OBJECT_0 : Fin := True;
            WAIT_TIMEOUT : ;
         end;
         Application.ProcessMessages;
      until Fin;
   end
   else
      Result := false;
end;

procedure TForm3.SaveConfig(fichier : string);
begin
   with TIniFile.Create(fichier) do
   begin
      WriteString('Compile', 'Program', Edit1.Text);
      WriteString('Compile', 'Param', Edit2.Text);
      WriteInteger('Compile', 'TimeOut1', SpinEdit12.Value);
      WriteInteger('Compile', 'TimeOut2', SpinEdit13.Value);
      WriteInteger('Compile', 'Priority', ComboBox6.ItemIndex);
      WriteInteger('Compile', 'Show', ComboBox5.ItemIndex);
      WriteString('Execute', 'Program', Edit7.Text);
      WriteString('Execute', 'Param', Edit8.Text);
      WriteInteger('Execute', 'Show', ComboBox10.ItemIndex);
      Free;
   end;
   MessageBoxA(Handle, Pchar(Form1.GetText('29')), Pchar('All4Cod - ' +
      Form1.GetText('MSG')), MB_OK + MB_ICONINFORMATION + 0);
end;

procedure TForm3.LoadConfig(cfg : integer);
var
   t : TIniFile;
begin
   case cfg of
      1 :
         begin
            t :=
               TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Profils\' + ComboBox18.Items[ComboBox18.ItemIndex]);
            ComboBox20.ItemIndex := ComboBox18.ItemIndex;
            Form1.ComboBox2.ItemIndex := ComboBox18.ItemIndex;
         end;
      3 :
         begin
            t :=
               TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Profils\' + ComboBox20.Items[ComboBox20.ItemIndex]);
            ComboBox18.ItemIndex := ComboBox20.ItemIndex;
            Form1.ComboBox2.ItemIndex := ComboBox20.ItemIndex;
         end;
      4 :
         begin
            t :=
               TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Profils\' + Form1.ComboBox2.Items[Form1.ComboBox2.ItemIndex]);
            ComboBox18.ItemIndex := Form1.ComboBox2.ItemIndex;
            ComboBox20.ItemIndex := Form1.ComboBox2.ItemIndex;
         end;
   else
      Exit;
   end;
   Edit1.Text := t.ReadString('Compile', 'Program', '');
   Edit2.Text := t.ReadString('Compile', 'Param', '');
   SpinEdit12.Value := t.ReadInteger('Compile', 'TimeOut1', 0);
   SpinEdit13.Value := t.ReadInteger('Compile', 'TimeOut2', 0);
   ComboBox6.ItemIndex := t.ReadInteger('Compile', 'Priority', 1);
   ComboBox5.ItemIndex := t.ReadInteger('Compile', 'Show', 3);
   Edit7.Text := t.ReadString('Execute', 'Program', '');
   Edit8.Text := t.ReadString('Execute', 'Param', '');
   ComboBox10.ItemIndex := t.ReadInteger('Execute', 'Show', 3);
   if Assigned(t) then
      t.Free;
end;

procedure TForm3.UpdateVariables;
var
   t : TSystemTime;
begin
   StringGrid1.Rows[1].Text := '%DRIVE%';
   StringGrid1.Rows[2].Text := '%NAME%';
   StringGrid1.Rows[3].Text := '%FILENAME%';
   StringGrid1.Rows[4].Text := '%FILENAME_FULL%';
   StringGrid1.Rows[5].Text := '%FILEPATH%';
   if Form1.FicheEditeur then
   begin
      if TForm2(Form1.ActiveMDIChild).Nom <> '' then
      begin
         StringGrid1.Rows[1].Text := '%DRIVE%' + #13#10 +
            ExtractFileDrive(TForm2(Form1.ActiveMDIChild).Nom);
         StringGrid1.Rows[2].Text := '%NAME%' + #13#10 +
            ChangeFileExt(ExtractFileName(TForm2(Form1.ActiveMDIChild).Nom), '');
         StringGrid1.Rows[3].Text := '%FILENAME%' + #13#10 +
            ExtractFileName(TForm2(Form1.ActiveMDIChild).Nom);
         StringGrid1.Rows[4].Text := '%FILENAME_FULL%' + #13#10 +
            TForm2(Form1.ActiveMDIChild).Nom;
         StringGrid1.Rows[5].Text := '%FILEPATH%' + #13#10 +
            IncludeTrailingPathDelimiter(ExtractFileDir(TForm2(Form1.ActiveMDIChild).Nom));
      end;
   end;
   GetSystemTime(t);
   StringGrid1.Rows[6].Text := '%TIME_GMT%' + #13#10 +
      DateTimeToStr(SystemTimeToDateTime(t)) + ' GMT';
   StringGrid1.Rows[7].Text := '%TIME_LOCAL%' + #13#10 + DateTimeToStr(Now) +
      ' Local';
   StringGrid1.Rows[8].Text := '%ALL4COD_NAME%' + #13#10 + 'All4Cod ' +
      GetVersion;
   StringGrid1.Rows[9].Text := '%ALL4COD_PATH%' + #13#10 +
      IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName));
end;

procedure SauveCommentaires;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
   begin
      for i := 0 to length(Form3.Commentaires) - 1 do
         WriteString('Comment',
            TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName,
            Form3.Commentaires[i]);
   end;
end;

procedure ChargeCommentaires;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
      for i := 0 to length(Form3.Commentaires) - 1 do
         Form3.Commentaires[i] := ReadString('Comments',
            TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName,
            '');
end;

procedure SauveTriggerChars;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
      for i := 0 to length(Form3.TriggerChars) - 1 do
         WriteString('TriggerChars',
            TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName,
            Form3.TriggerChars[i]);
end;

procedure ChargeTriggerChars;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
      for i := 0 to length(Form3.TriggerChars) - 1 do
         Form3.TriggerChars[i] := ReadString('TriggerChars',
            TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName,
            '');
end;

procedure SauveAutoCompletion;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
      for i := 0 to Form3.AutoCompletion.Count - 1 do
         WriteString('AutoCompletion',
            TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName,
            Form3.AutoCompletion[i]);
end;

procedure ChargeAutoCompletion;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
      for i := 0 to Form3.AutoCompletion.Count - 1 do
         if FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\' + ReadString('AutoCompletion', TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName, 'None.ac')) then
          Form3.AutoCompletion[i] := ReadString('AutoCompletion', TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName, 'None.ac')
         else
         Form3.AutoCompletion[i] := 'None.ac';
end;

procedure SauveAC_Files;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
      for i := 0 to Form3.AC_Files.Count - 1 do
         WriteString('CompletionProposal_Files',
            TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName,
            Form3.AC_Files[i]);
end;

procedure ChargeAC_Files;
var
   i : integer;
begin
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
      for i := 0 to Form3.AC_Files.Count - 1 do
         if FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\' + ReadString('CompletionProposal_Files', TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName, 'Aucun')) then
            Form3.AC_Files[i] := ReadString('CompletionProposal_Files', TSynCustomHighlighter(Form3.ListHighlighters.Objects[i]).LanguageName, 'Aucun')
         else
            Form3.AC_Files[i]:='Aucun';
end;

procedure TForm3.FileToAC(var insert : string; var item : string; var biggest :
   string; fichier : string);
var
   section : TStringList;
   i, count : integer;
begin
   insert := '';
   item := '';
   biggest := '';
   if fichier <> 'Aucun' then
   begin
      if
         FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\' + fichier) then
      begin
         with
            TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\' + fichier) do
         begin
            section := TStringList.Create;
            count := ReadInteger('Infos', 'Count', 0);
            section.Clear;
            for i := 1 to count do
               section.Add(ReadString('Insert', IntToStr(i), ''));
            insert := section.Text;
            section.Clear;
            for i := 1 to count do
               section.Add(ReadString('Item', IntToStr(i), ''));
            item := section.Text;
            section.Free;
            biggest := ReadString('Infos', 'BiggestWord', 'constructor');
            Free;
         end;
      end
      else
         MessageBoxA(Handle, Pchar(Form1.GetText('30')), Pchar('All4Cod - ' +
            Form1.GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
   end;
end;

procedure TForm3.UpdateOptions;
var
   i : integer;
   insert, item, biggest : string;
begin
   try
      Memo2.Lines.SaveToFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Tidy\Custom');
   except
   end;
   with Form1 do
   begin
      PopupMenu2.Items[0].Checked := CheckBox8.Checked;
      PopupMenu2.Items[1].Checked := CheckBox9.Checked;
      PopupMenu2.Items[2].Checked := CheckBox10.Checked;
      PopupMenu2.Items[3].Checked := CheckBox11.Checked;
      PopupMenu2.Items[4].Checked := CheckBox41.Checked;
      PopupMenu2.Items[5].Checked := CheckBox12.Checked;
      PopupMenu2.Items[6].Checked := CheckBox13.Checked;
      PopupMenu2.Items[7].Checked := CheckBox14.Checked;
      with MainMenu1.Items[2] do
      begin
         Items[7].Checked := CheckBox27.Checked;
         Items[8].Checked := CheckBox28.Checked;
         Items[10].Checked := CheckBox29.Checked;
         Items[11].Checked := CheckBox30.Checked;
         Items[9].Checked := CheckBox17.Checked;
         Items[2].Checked := CheckBox15.Checked;
         Items[3].Checked := CheckBox16.Checked;
         Items[0].Items[0].Checked := CheckBox8.Checked;
         Items[0].Items[1].Checked := CheckBox9.Checked;
         Items[0].Items[2].Checked := CheckBox10.Checked;
         Items[0].Items[3].Checked := CheckBox11.Checked;
         Items[0].Items[4].Checked := CheckBox41.Checked;
         Items[0].Items[5].Checked := CheckBox12.Checked;
         Items[0].Items[6].Checked := CheckBox13.Checked;
         Items[0].Items[7].Checked := CheckBox14.Checked;
      end;
      with SynEditPrint1 do
      begin
         case ComboBox13.ItemIndex of
            0 : Margins.UnitSystem := usMM;
            1 : Margins.UnitSystem := usCM;
            2 : Margins.UnitSystem := usInch
         end;
         Margins.Left := SpinEdit14.Value;
         Margins.Right := SpinEdit15.Value;
         Margins.Top := SpinEdit16.Value;
         Margins.Bottom := SpinEdit17.Value;
         Margins.Gutter := SpinEdit18.Value;
         Margins.Header := SpinEdit19.Value;
         Margins.Footer := SpinEdit20.Value;
         Highlight := CheckBox35.Checked;
         Colors := CheckBox35.Checked;
         LineNumbers := CheckBox36.Checked;
         LineNumbersInMargin := CheckBox37.Checked;
         SelectedOnly := CheckBox39.Checked;
      end;
      MainMenu1.Items[5].Items[2].Checked := CheckBox34.Checked;
      GroupBox2.Visible := CheckBox34.Checked;
      ToolButton39.Down := CheckBox27.Checked;
      ToolButton40.Down := CheckBox28.Checked;
      ToolButton42.Down := CheckBox29.Checked;
      ToolButton43.Down := CheckBox30.Checked;
      ToolButton36.Down := CheckBox15.Checked;
      ToolButton41.Down := CheckBox17.Checked;
      ToolButton37.Down := CheckBox16.Checked;
      Splitter1.Visible := CheckBox15.Checked;
      Panel1.Visible := CheckBox15.Checked;
      Panel2.Visible := CheckBox16.Checked;
      Splitter2.Visible := CheckBox16.Checked;
      ToolBar1.Visible := CheckBox8.Checked;
      ToolBar3.Visible := CheckBox9.Checked;
      ToolBar2.Visible := CheckBox10.Checked;
      ToolBar4.Visible := CheckBox11.Checked;
      ToolBar5.Visible := CheckBox12.Checked;
      ToolBar6.Visible := CheckBox13.Checked;
      ToolBar7.Visible := CheckBox14.Checked;
      ToolBar8.Visible := CheckBox41.Checked;
      Timer1.Enabled := CheckBox7.Checked;
      Timer1.Interval := SpinEdit1.Value * 1000;
      case ComboBox12.ItemIndex of
         0 : Form1.SynSpellCheck1.UnderlineStyle := usCorelWordPerfect;
         1 : Form1.SynSpellCheck1.UnderlineStyle := usMicrosoftWord;
      end;
      if CheckBox32.Checked then
         Form1.SynSpellCheck1.Options := Form1.SynSpellCheck1.Options +
            [sscoIgnoreSingleChars]
      else
         Form1.SynSpellCheck1.Options := Form1.SynSpellCheck1.Options -
            [sscoIgnoreSingleChars];
      if CheckBox33.Checked then
         Form1.SynSpellCheck1.Options := Form1.SynSpellCheck1.Options +
            [sscoIgnoreWordsWithNumbers]
      else
         Form1.SynSpellCheck1.Options := Form1.SynSpellCheck1.Options -
            [sscoIgnoreWordsWithNumbers];
   end;
   for i := 0 to Form1.MDIChildCount - 1 do
   begin
      if Form1.FicheEditeur(i) then
      begin
         TForm2(Form1.MDIChildren[i]).Ruler1.Visible := CheckBox44.Checked;
         with TForm2(Form1.MDIChildren[i]).SynCompletionProposal1 do
         begin
            if CheckBox45.Checked then
               Options := Options + [scoCaseSensitive]
            else
               Options := Options - [scoCaseSensitive];
            if CheckBox47.Checked then
               Options := Options + [scoLimitToMatchedText]
            else
               Options := Options - [scoLimitToMatchedText];
            if CheckBox46.Checked then
               Options := Options + [scoAnsiStrings]
            else
               Options := Options - [scoAnsiStrings];
            ShortCut := HotKey1.HotKey;
            TimerInterval := SpinEdit8.Value;
            if (TForm2(Form1.MDIChildren[i]).SynEdit1.Highlighter <> nil) then
            begin
               TriggerChars :=
                  Form3.TriggerChars[Form3.ListHighlighters.IndexOf(TForm2(Form1.MDIChildren[i]).SynEdit1.Highlighter.LanguageName)];
               FileToAC(insert, item, biggest,
                  AC_Files[Form3.ListHighlighters.IndexOf(TForm2(Form1.MDIChildren[i]).SynEdit1.Highlighter.LanguageName)]);
               Columns[0].BiggestWord := biggest;
               InsertList.Text := insert;
               ItemList.Text := item;
               Title :=
                  AC_Files[Form3.ListHighlighters.IndexOf(TForm2(Form1.MDIChildren[i]).SynEdit1.Highlighter.LanguageName)];
               ResetAssignedList;
            end;
         end;
         with TForm2(Form1.MDIChildren[i]).SynEdit1 do
         begin
            if CheckBox27.Checked then
               ActiveLineColor := clYellow
            else
               ActiveLineColor := clWhite;
            WordWrap := CheckBox28.Checked;
            if CheckBox29.Checked then
               Options := Options + [eoShowSpecialChars]
            else
               Options := Options - [eoShowSpecialChars];
            if CheckBox31.Checked then
               Options := Options + [eoDragDropEditing]
            else
               Options := Options - [eoDragDropEditing];
            ExtraLineSpacing := SpinEdit4.Value;
            TabWidth := SpinEdit5.Value;
            MaxUndo := SpinEdit6.Value;
            RightEdge := SpinEdit7.Value;
            case ComboBox3.ItemIndex of
               0 : ScrollBars := ssNone;
               1 : ScrollBars := ssVertical;
               2 : ScrollBars := ssHorizontal;
               3 : ScrollBars := ssBoth;
            end;
            case ComboBox4.ItemIndex of
               0 :
                  begin
                     InsertCaret := ctVerticalLine;
                     OverwriteCaret := ctVerticalLine;
                  end;
               1 :
                  begin
                     InsertCaret := ctHorizontalLine;
                     OverwriteCaret := ctHorizontalLine;
                  end;
               2 :
                  begin
                     InsertCaret := ctHalfBlock;
                     OverwriteCaret := ctHalfBlock;
                  end;
               3 :
                  begin
                     InsertCaret := ctBlock;
                     OverwriteCaret := ctBlock;
                  end;
            end;
            Color := Shape3.Brush.Color;
            SelectedColor.Foreground := Shape4.Brush.Color;
            SelectedColor.Background := Shape5.Brush.Color;
            Gutter.Width := SpinEdit2.Value;
            Gutter.DigitCount := SpinEdit3.Value;
            Gutter.Visible := CheckBox17.Checked;
            Gutter.ZeroStart := CheckBox18.Checked;
            Gutter.LeadingZeros := not (CheckBox19.Checked);
            Font := Label11.Font;
            HideSelection := Form3.CheckBox20.Checked;
            if CheckBox21.Checked then
               Options := Options + [eoAutoIndent]
            else
               Options := Options - [eoAutoIndent];
            WantTabs := CheckBox22.Checked;
            if Form3.CheckBox24.Checked then
               Options := Options + [eoSmartTabs]
            else
               Options := Options - [eoSmartTabs];
         end;
      end;
   end;
end;

procedure TForm3.ChargeOptions;
var
   i : integer;
begin
   for i := 0 to ListHighlighters.Count - 1 do
   begin
      if TSynCustomHighlighter(ListHighlighters.Objects[i]).LanguageName =
         'C/C++' then
         TSynCustomHighlighter(ListHighlighters.Objects[i]).LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\C_C++.hl')
      else if TSynCustomHighlighter(ListHighlighters.Objects[i]).LanguageName =
         'Tcl/Tk' then
         TSynCustomHighlighter(ListHighlighters.Objects[i]).LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\Tcl_Tk.hl')
      else
         TSynCustomHighlighter(ListHighlighters.Objects[i]).LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\' +
            TSynCustomHighlighter(ListHighlighters.Objects[i]).LanguageName+'.hl');
   end;
   if length(Form1.Plugins) > 0 then
      for i := 0 to length(Form1.Plugins) - 1 do
         ListBox2.Items.Add(PChar(Form1.Plugins[i].GetInfo.DllName));
   if ListBox2.Items.Count > 0 then
   begin
      ListBox2.ItemIndex := 0;
      ListBox2Click(nil);
   end;
   ChargeCommentaires;
   ChargeTriggerChars;
   ChargeAC_Files;
   ChargeAutoCompletion;
   Memo2.Clear;
   try
      Memo2.Lines.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Tidy\Custom');
   except
      Memo2.Lines.Text := 'write-back:yes';
   end;
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
   begin
      Form1.ChargeLanguage(ReadInteger('Generales', 'Language', -1));
      Form1.MainMenu1.Items[2].Items[5].Items[ReadInteger('Generales',
         'Language', -1) + 1].Checked := true;
      ListBox1.Clear;
      for i := 0 to ReadInteger('SystemFiles', 'FilesCount', 0) - 1 do
         ListBox1.Items.Add(ReadString('SystemFiles', IntToStr(i), ''));
      for i := 0 to 9 do
      begin
         Form1.MainMenu1.Items[0].Items[2].Items[i].Caption :=
            ReadString('ReOpen', IntToStr(i), '');
         Form1.PopupMenu1.Items[i].Caption :=
            Form1.MainMenu1.Items[0].Items[2].Items[i].Caption;
      end;
      for i := 10 to ReadInteger('Variables', 'Count', 10) - 1 do
      begin
         StringGrid1.RowCount := StringGrid1.RowCount + 1;
         StringGrid1.Rows[StringGrid1.RowCount - 1].Text :=
            ReadString('Variables', IntToStr(i - 9), '');
      end;
      Form1.Left := ReadInteger('Generales', 'Gauche', Form1.Left);
      Form1.Top := ReadInteger('Generales', 'Haut', Form1.Top);
      Form1.Width := ReadInteger('Generales', 'Largeur', Form1.Width);
      Form1.Height := ReadInteger('Generales', 'Hauteur', Form1.Height);
      CheckBox48.Checked := ReadBool('Generales', 'Afficher_Infos', true);
      CheckBox45.Checked := ReadBool('CompletionProposal', 'CaseSensitive', false);
      CheckBox46.Checked := ReadBool('CompletionProposal', 'AnsiStrings', true);
      CheckBox47.Checked := ReadBool('CompletionProposal', 'LimitToMatchedText',
         false);
      HotKey1.HotKey := ReadInteger('CompletionProposal', 'HotKey', 0);
      SpinEdit8.Value := ReadInteger('CompletionProposal', 'TimerInterval', 1000);
      CheckBox44.Checked := ReadBool('Editeur', 'Afficher_Regle', true);
      CheckBox42.Checked := ReadBool('Generales', 'MinimizeToTray', true);
      CheckBox43.Checked := ReadBool('Generales', 'CloseToTray', false);
      CheckBox40.Checked := ReadBool('Generales', 'Afficher_Splash', true);
      ComboBox13.ItemIndex := ReadInteger('Impression', 'Unit', 0);
      SpinEdit14.Value := ReadInteger('Impression', 'Gauche', 25);
      SpinEdit15.Value := ReadInteger('Impression', 'Droite', 15);
      SpinEdit16.Value := ReadInteger('Impression', 'Haut', 25);
      SpinEdit17.Value := ReadInteger('Impression', 'Bas', 25);
      SpinEdit18.Value := ReadInteger('Impression', 'Gutter', 10);
      SpinEdit19.Value := ReadInteger('Impression', 'Header', 15);
      SpinEdit20.Value := ReadInteger('Impression', 'Footer', 15);
      CheckBox35.Checked := ReadBool('Impression', 'Colorateur', true);
      CheckBox36.Checked := ReadBool('Impression', 'Nombre', true);
      CheckBox37.Checked := ReadBool('Impression', 'Marge', true);
      CheckBox38.Checked := ReadBool('Impression', 'TitreComplet', false);
      CheckBox39.Checked := ReadBool('Impression', 'SelectedOnly', false);
      CheckBox34.Checked := ReadBool('Generales', 'TableASCII', false);
      ComboBox11.ItemIndex := ReadInteger('Dictionnnaire', 'Nom', -1);
      ComboBox12.ItemIndex := ReadInteger('Dictionnnaire', 'Montrer', 0);
      CheckBox32.Checked := ReadBool('Dictionnnaire', 'IgnoreOneChar', true);
      CheckBox33.Checked := ReadBool('Dictionnnaire', 'IgnoreChiffres', true);
      Edit1.Text := ReadString('Compiler', 'Compilateur', '');
      Edit2.Text := ReadString('Compiler', 'Parametres', '');
      SpinEdit12.Value := ReadInteger('Compiler', 'MaxBegin', 0);
      SpinEdit13.Value := ReadInteger('Compiler', 'MaxLast', 0);
      ComboBox5.ItemIndex := ReadInteger('Compiler', 'TypeFenetre', 3);
      ComboBox6.ItemIndex := ReadInteger('Compiler', 'Priorite', 1);
      Edit7.Text := ReadString('Executer', 'Compilateur', '');
      Edit8.Text := ReadString('Executer', 'Parametres', '');
      ComboBox10.ItemIndex := ReadInteger('Executer', 'TypeFenetre', 3);
      CheckBox27.Checked := ReadBool('Editeur', 'LigneActive', true);
      CheckBox28.Checked := ReadBool('Editeur', 'WordWrap', false);
      CheckBox29.Checked := ReadBool('Editeur', 'CharsSpecials', false);
      CheckBox30.Checked := ReadBool('Editeur', 'AutoCompletionBrackets', true);
      CheckBox25.Checked := ReadBool('Editeur', 'ChoixAutoColorateur', true);
      CheckBox26.Checked := ReadBool('Generales', 'AfficherNouveau', true);
      SpinEdit4.Value := ReadInteger('Editeur', 'LineSpace', 0);
      SpinEdit5.Value := ReadInteger('Editeur', 'TailleTab', 8);
      SpinEdit6.Value := ReadInteger('Editeur', 'MaxUndo', 100);
      SpinEdit7.Value := ReadInteger('Editeur', 'CoteDroit', 80);
      ComboBox3.ItemIndex := ReadInteger('Editeur', 'ScrollBars', 3);
      ComboBox4.ItemIndex := ReadInteger('Editeur', 'CaretType', 0);
      Shape3.Brush.Color := StringToColor(ReadString('Editeur', 'Coloration',
         'clWhite'));
      Shape4.Brush.Color := StringToColor(ReadString('Editeur', 'SelColoration',
         'clWhite'));
      Shape5.Brush.Color := StringToColor(ReadString('Editeur',
         'SelColorationBack', 'clNavy'));
      CheckBox20.Checked := ReadBool('Editeur', 'HideSelection', false);
      CheckBox21.Checked := ReadBool('Editeur', 'AutoIndent', true);
      CheckBox22.Checked := ReadBool('Editeur', 'AllowTabs', true);
      CheckBox23.Checked := ReadBool('Editeur', 'ClearUndo', false);
      CheckBox24.Checked := ReadBool('Editeur', 'SmartTabs', true);
      LabeledEdit1.Text := ReadString('Generales', 'DateTimeFormat',
         'hh:mm:ss dd/mm/yyyy');
      CheckBox1.Checked := ReadBool('Generales', 'UneSeuleInstance', true);
      CheckBox6.Checked := ReadBool('Generales', 'ConfirmQuit', true);
      CheckBox7.Checked := ReadBool('Generales', 'SauvegardeAuto', false);
      SpinEdit2.Value := ReadInteger('Goutiere', 'Largeur', 30);
      SpinEdit3.Value := ReadInteger('Goutiere', 'Chiffres', 3);
      CheckBox17.Checked := ReadBool('Goutiere', 'Visible', true);
      CheckBox18.Checked := ReadBool('Goutiere', 'ZeroStart', false);
      CheckBox19.Checked := ReadBool('Goutiere', 'LeadingZeros', true);
      CheckBox15.Checked := ReadBool('Generales', 'Afficher_Explorateur', true);
      CheckBox16.Checked := ReadBool('Generales', 'Afficher_Modeles', true);
      CheckBox8.Checked := ReadBool('Generales', 'Afficher_Standard', true);
      CheckBox9.Checked := ReadBool('Generales', 'Afficher_Edition', true);
      CheckBox10.Checked := ReadBool('Generales', 'Afficher_Langage', true);
      CheckBox11.Checked := ReadBool('Generales', 'Afficher_Affichage', true);
      CheckBox12.Checked := ReadBool('Generales', 'Afficher_Recherche', true);
      CheckBox13.Checked := ReadBool('Generales', 'Afficher_Outils', true);
      CheckBox14.Checked := ReadBool('Generales', 'Afficher_Fenetre', true);
      CheckBox41.Checked := ReadBool('Generales', 'Afficher_Configuration',
         true);
      CheckBox31.Checked := ReadBool('Generales', 'DragDrop', true);
      SpinEdit1.Value := ReadInteger('Generales', 'SauvegardeAuto_Interval',
         60);
      with Label11.Font do
      begin
         Size := ReadInteger('Police', 'Size', 10);
         Name := ReadString('Police', 'Name', 'Courier New');
         Color := StringToColor(ReadString('Police', 'Color', 'clWindowText'));
         if ReadBool('Police', 'Bold', false) then
            Style := Style + [fsBold]
         else
            Style := Style - [fsBold];
         if ReadBool('Police', 'StrikeOut', false) then
            Style := Style + [fsStrikeOut]
         else
            Style := Style - [fsStrikeOut];
         if ReadBool('Police', 'Italic', false) then
            Style := Style + [fsItalic]
         else
            Style := Style - [fsItalic];
         if ReadBool('Police', 'Underline', false) then
            Style := Style + [fsUnderline]
         else
            Style := Style - [fsUnderline];
      end;
      Free;
   end;
end;

procedure TForm3.SauveOptions;
var
   i : integer;
begin
   for i := 0 to ListHighlighters.Count - 1 do
   begin
      if TSynCustomHighlighter(ListHighlighters.Objects[i]).LanguageName =
         'C/C++' then
         TSynCustomHighlighter(ListHighlighters.Objects[i]).SaveToFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\C_C++.hl')
      else if TSynCustomHighlighter(ListHighlighters.Objects[i]).LanguageName =
         'Tcl/Tk' then
         TSynCustomHighlighter(ListHighlighters.Objects[i]).SaveToFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\Tcl_Tk.hl')
      else
         TSynCustomHighlighter(ListHighlighters.Objects[i]).SaveToFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Highlighters\' +
            TSynCustomHighlighter(ListHighlighters.Objects[i]).LanguageName+'.hl');
   end;
   SauveCommentaires;
   SauveTriggerChars;
   SauveAutoCompletion;
   SauveAC_Files;
   with
      TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'config.ini') do
   begin
      for i := 0 to Form1.MainMenu1.Items[2].Items[5].Count - 1 do
      begin
         if Form1.MainMenu1.Items[2].Items[5].Items[i].Checked then
            WriteInteger('Generales', 'Language',
               Form1.MainMenu1.Items[2].Items[5].Items[i].MenuIndex - 1);
      end;
      WriteInteger('SystemFiles', 'FilesCount', ListBox1.Count);
      for i := 0 to ListBox1.Count - 1 do
         WriteString('SystemFiles', IntToStr(i), ListBox1.Items[i]);
      for i := 0 to 9 do
         WriteString('ReOpen', IntToStr(i),
            Form1.MainMenu1.Items[0].Items[2].Items[i].Caption);
      WriteInteger('Variables', 'Count', StringGrid1.RowCount);
      for i := 9 to (StringGrid1.RowCount - 1) do
         WriteString('Variables', IntToStr(i - 9), StringGrid1.Rows[i].Text);
      WriteInteger('Generales', 'Gauche', Form1.Left);
      WriteInteger('Generales', 'Haut', Form1.Top);
      WriteInteger('Generales', 'Largeur', Form1.Width);
      WriteInteger('Generales', 'Hauteur', Form1.Height);
      Form1.Height := ReadInteger('Generales', 'Hauteur', Form1.Height);
      WriteBool('Generales', 'Afficher_Infos', CheckBox48.Checked);
      WriteBool('CompletionProposal', 'CaseSensitive', CheckBox45.Checked);
      WriteBool('CompletionProposal', 'AnsiStrings', CheckBox46.Checked);
      WriteBool('CompletionProposal', 'LimitToMatchedText', CheckBox47.Checked);
      WriteInteger('CompletionProposal', 'TimerInterval', SpinEdit8.Value);
      WriteInteger('CompletionProposal', 'HotKey', HotKey1.HotKey);
      WriteBool('Editeur', 'Afficher_Regle', CheckBox44.Checked);
      WriteBool('Generales', 'MinimizeToTray', CheckBox42.Checked);
      WriteBool('Generales', 'CloseToTray', CheckBox43.Checked);
      WriteBool('Generales', 'Afficher_Splash', CheckBox40.Checked);
      WriteInteger('Impression', 'Unit', ComboBox13.ItemIndex);
      WriteInteger('Impression', 'Gauche', SpinEdit14.Value);
      WriteInteger('Impression', 'Droite', SpinEdit15.Value);
      WriteInteger('Impression', 'Haut', SpinEdit16.Value);
      WriteInteger('Impression', 'Bas', SpinEdit17.Value);
      WriteInteger('Impression', 'Gutter', SpinEdit18.Value);
      WriteInteger('Impression', 'Header', SpinEdit19.Value);
      WriteInteger('Impression', 'Footer', SpinEdit20.Value);
      WriteBool('Impression', 'Colorateur', CheckBox35.Checked);
      WriteBool('Impression', 'Nombre', CheckBox36.Checked);
      WriteBool('Impression', 'Marge', CheckBox37.Checked);
      WriteBool('Impression', 'TitreComplet', CheckBox38.Checked);
      WriteBool('Impression', 'SelectedOnly', CheckBox39.Checked);
      WriteBool('Generales', 'TableASCII', CheckBox34.Checked);
      WriteInteger('Dictionnnaire', 'Nom', ComboBox11.ItemIndex);
      WriteInteger('Dictionnnaire', 'Montrer', ComboBox12.ItemIndex);
      WriteBool('Dictionnnaire', 'IgnoreOneChar', CheckBox32.Checked);
      WriteBool('Dictionnnaire', 'IgnoreChiffres', CheckBox33.Checked);
      WriteString('Compiler', 'Compilateur', Edit1.Text);
      WriteString('Compiler', 'Parametres', Edit2.Text);
      WriteInteger('Compiler', 'MaxBegin', SpinEdit12.Value);
      WriteInteger('Compiler', 'MaxLast', SpinEdit13.Value);
      WriteInteger('Compiler', 'TypeFenetre', ComboBox5.ItemIndex);
      WriteInteger('Compiler', 'Priorite', ComboBox6.ItemIndex);
      WriteString('Executer', 'Compilateur', Edit7.Text);
      WriteString('Executer', 'Parametres', Edit8.Text);
      WriteInteger('Executer', 'TypeFenetre', ComboBox10.ItemIndex);
      WriteBool('Editeur', 'LigneActive', CheckBox27.Checked);
      WriteBool('Editeur', 'WordWrap', CheckBox28.Checked);
      WriteBool('Editeur', 'CharsSpecials', CheckBox29.Checked);
      WriteBool('Editeur', 'AutoCompletionBrackets', CheckBox30.Checked);
      WriteBool('Editeur', 'ChoixAutoColorateur', CheckBox25.Checked);
      WriteBool('Generales', 'AfficherNouveau', CheckBox26.Checked);
      WriteInteger('Editeur', 'LineSpace', SpinEdit4.Value);
      WriteInteger('Editeur', 'TailleTab', SpinEdit5.Value);
      WriteInteger('Editeur', 'MaxUndo', SpinEdit6.Value);
      WriteInteger('Editeur', 'CoteDroit', SpinEdit7.Value);
      WriteInteger('Editeur', 'ScrollBars', ComboBox3.ItemIndex);
      WriteInteger('Editeur', 'CaretType', ComboBox4.ItemIndex);
      WriteString('Editeur', 'Coloration', ColorToString(shape3.Brush.Color));
      WriteString('Editeur', 'SelColoration',
         ColorToString(shape4.Brush.Color));
      WriteString('Editeur', 'SelColorationBack',
         ColorToString(shape5.Brush.Color));
      WriteBool('Editeur', 'HideSelection', CheckBox20.Checked);
      WriteBool('Editeur', 'AutoIndent', CheckBox21.Checked);
      WriteBool('Editeur', 'AllowTabs', CheckBox22.Checked);
      WriteBool('Editeur', 'ClearUndo', CheckBox23.Checked);
      WriteBool('Editeur', 'SmartTabs', CheckBox24.Checked);
      WriteInteger('Police', 'Size', Label11.Font.Size);
      WriteString('Police', 'Name', Label11.Font.Name);
      WriteString('Police', 'Color', ColorToString(Label11.Font.Color));
      WriteBool('Police', 'Bold', fsBold in Label11.Font.Style);
      WriteBool('Police', 'Italic', fsItalic in Label11.Font.Style);
      WriteBool('Police', 'StrikeOut', fsUnderline in Label11.Font.Style);
      WriteBool('Police', 'Underline', fsUnderline in Label11.Font.Style);
      WriteString('Generales', 'DateTimeFormat', LabeledEdit1.Text);
      WriteBool('Generales', 'UneSeuleInstance', CheckBox1.Checked);
      WriteBool('Generales', 'ConfirmQuit', CheckBox6.Checked);
      WriteBool('Generales', 'SauvegardeAuto', CheckBox7.Checked);
      WriteInteger('Goutiere', 'Largeur', SpinEdit2.Value);
      WriteInteger('Goutiere', 'Chiffres', SpinEdit3.Value);
      WriteBool('Goutiere', 'Visible', CheckBox17.Checked);
      WriteBool('Goutiere', 'ZeroStart', CheckBox18.Checked);
      WriteBool('Goutiere', 'LeadingZeros', CheckBox19.Checked);
      WriteBool('Generales', 'Afficher_Explorateur', CheckBox15.Checked);
      WriteBool('Generales', 'Afficher_Modeles', CheckBox16.Checked);
      WriteBool('Generales', 'Afficher_Standard', CheckBox8.Checked);
      WriteBool('Generales', 'Afficher_Edition', CheckBox9.Checked);
      WriteBool('Generales', 'Afficher_Langage', CheckBox10.Checked);
      WriteBool('Generales', 'Afficher_Affichage', CheckBox11.Checked);
      WriteBool('Generales', 'Afficher_Recherche', CheckBox12.Checked);
      WriteBool('Generales', 'Afficher_Outils', CheckBox13.Checked);
      WriteBool('Generales', 'Afficher_Fenetre', CheckBox14.Checked);
      WriteBool('Generales', 'Afficher_Configuration', CheckBox41.Checked);
      WriteInteger('Generales', 'SauvegardeAuto_Interval', SpinEdit1.Value);
      WriteBool('Generales', 'DragDrop', CheckBox31.Checked);
      Free;
   end;
end;

procedure TForm3.FormCreate(Sender : TObject);
var
   filter : string;
   i : integer;
begin
   Icon.Handle := Application.Icon.Handle;
   Association(Application.ExeName, '.ap');
   ListHighlighters := TStringList.Create;
   AC_Files := TStringList.Create;
   AutoCompletion:=TStringList.Create;
   ComboBox7.Items :=
      ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
      + 'Highlighters', '*.ac', false, true);
   ComboBox11.Items :=
      ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
      + 'Dictionaries', '*.*', false, true);
   GetHighlighters(Self, ListHighlighters, false);
   SetLength(Commentaires, ListHighlighters.Count);
   SetLength(TriggerChars, ListHighlighters.Count);
   while AC_Files.Count < ListHighlighters.Count do
   begin
      AC_Files.Add('Aucun');
      AutoCompletion.Add('');
   end;
   ComboBox9.Items :=
      ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
      + 'Highlighters', '*.cp', false, true);
   ComboBox1.Items := ListHighlighters;
   ComboBox1.ItemIndex := 0;
   Form1.ComboBox1.Items := ListHighlighters;
   Form1.ComboBox1.Items.Insert(0, 'Aucun');
   filter := GetHighlightersFilter(ListHighlighters);
   if (filter <> '') and (filter[1] <> '|') then
      filter := '|' + filter;
   filter := Form1.GetText('58') + ' (*.*)|*.*' + filter;
   Form1.OpenDialog1.Filter := filter;
   Form1.SaveDialog1.Filter := filter;
   StringGrid1.Rows[0].Text := 'Nom' + #13#10 + 'Valeur';
   SaveDialog1.InitialDir :=
      IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
      'Profils';
   ComboBox18.Items :=
      ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
      + 'Profils', '*.*', false, true);
   ComboBox20.Items := ComboBox18.Items;
   Form1.ComboBox2.Items := ComboBox18.Items;
   ChargeOptions;
   UpdateOptions;
   Form1.ComboBox1.ItemIndex := 0;
   ComboBox1Select(nil);
   Notebook1.PageIndex := 0;
   TreeView1.Selected := TreeView1.Items[0];
   if CheckBox48.Checked then
   begin
      with TForm17.Create(Application) do
      begin
         Caption := 'All4Cod - '+Form1.GetText('INFO');
         WindowState := wsMaximized;
      end;
      Form1.ListBox3.Items.Add('All4Cod - '+Form1.GetText('INFO'));
      Form1.TabControl1.Tabs.Add('All4Cod - '+Form1.GetText('INFO'));
      Form1.Panel8.Visible := true;
   end;
   if length(Form1.Plugins) > 0 then
      for i := 0 to length(Form1.Plugins) - 1 do
         Form1.Plugins[i].Init;
   for i := 1 to ParamCount do
   begin
      if (UpperCase(ExtractFileExt(ParamStr(i))) = '.AP') and not (Form1.Projet.Ouvert) then
      begin
         Form1.Ouvrir(ParamStr(i), true);
      end
      else Form1.Ouvrir(ParamStr(i), false);
   end;
end;

procedure TForm3.FormDestroy(Sender : TObject);
begin
   ListHighlighters.Free;
   AutoCompletion.Free;
   SetLength(Commentaires, 0);
   SetLength(TriggerChars, 0);
   AC_Files.Free;
end;

procedure TForm3.LabeledEdit1Change(Sender : TObject);
var
   r : string;
begin
   try
      DateTimeToString(r, LabeledEdit1.Text, Now);
      Label1.Caption := r;
   except
      Label1.Caption := Form1.GetText('59');
   end;
end;

procedure TForm3.FormClose(Sender : TObject; var Action : TCloseAction);
begin
   UpdateOptions;
end;

procedure TForm3.ComboBox1Select(Sender : TObject);
var
   i : integer;
begin
   ComboBox2.Clear;
   with TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]) do
   begin
      for i := 0 to AttrCount - 1 do
         ComboBox2.Items.Add(Attribute[i].Name);
      LabeledEdit3.Text := Commentaires[ComboBox1.ItemIndex];
      LabeledEdit4.Text := TriggerChars[ComboBox1.ItemIndex];
      ComboBox7.ItemIndex:=
         ComboBox7.Items.IndexOf(AutoCompletion[ComboBox1.ItemIndex]);
      ComboBox9.ItemIndex :=
         ComboBox9.Items.IndexOf(AC_Files[ComboBox1.ItemIndex]);
      SynEdit1.Highlighter :=
         TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]);
      SynEdit1.Text := SampleSource;
      LabeledEdit2.Text := DefaultFilter;
   end;
   ComboBox2.ItemIndex := 0;
   ComboBox2Select(nil);
end;

procedure TForm3.ComboBox2Select(Sender : TObject);
begin
   with TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]) do
   begin
      Shape1.Brush.Color := Attribute[ComboBox2.ItemIndex].Foreground;
      Shape2.Brush.Color := Attribute[ComboBox2.ItemIndex].Background;
      CheckBox2.Checked := fsUnderline in Attribute[ComboBox2.ItemIndex].Style;
      CheckBox3.Checked := fsStrikeOut in Attribute[ComboBox2.ItemIndex].Style;
      CheckBox4.Checked := fsItalic in Attribute[ComboBox2.ItemIndex].Style;
      CheckBox5.Checked := fsBold in Attribute[ComboBox2.ItemIndex].Style;
   end;
end;

procedure TForm3.LabeledEdit2Change(Sender : TObject);
begin
   TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]).DefaultFilter := LabeledEdit2.Text;
end;

procedure TForm3.Button1Click(Sender : TObject);
begin
   if ColorDialog1.Execute then
   begin
      Shape1.Brush.Color := ColorDialog1.Color;
      TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]).Attribute[ComboBox2.ItemIndex].Foreground := ColorDialog1.Color;
   end;
end;

procedure TForm3.Button2Click(Sender : TObject);
begin
   if ColorDialog1.Execute then
   begin
      Shape2.Brush.Color := ColorDialog1.Color;
      TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]).Attribute[ComboBox2.ItemIndex].Background := ColorDialog1.Color;
   end;
end;

procedure TForm3.CheckBox2Click(Sender : TObject);
var
   at : TFontStyles;
begin
   at :=
      TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]).Attribute[ComboBox2.ItemIndex].Style;
   if CheckBox2.Checked then
      include(at, fsUnderline)
   else
      exclude(at, fsUnderLine);
   if CheckBox3.Checked then
      include(at, fsStrikeOut)
   else
      exclude(at, fsStrikeOut);
   if CheckBox4.Checked then
      include(at, fsItalic)
   else
      exclude(at, fsItalic);
   if CheckBox5.Checked then
      include(at, fsBold)
   else
      exclude(at, fsBold);
   TSynCustomHighlighter(ListHighlighters.Objects[ComboBox1.ItemIndex]).Attribute[ComboBox2.ItemIndex].Style := at;
end;

procedure TForm3.LabeledEdit3Change(Sender : TObject);
begin
   Commentaires[ComboBox1.ItemIndex] := LabeledEdit3.Text;
end;

procedure TForm3.Button3Click(Sender : TObject);
begin
   if FontDialog1.Execute then
      Label11.Font := FontDialog1.Font;
end;

procedure TForm3.Button4Click(Sender : TObject);
begin
   if ColorDialog1.Execute then
      Shape3.Brush.Color := ColorDialog1.Color;
end;

procedure TForm3.Button5Click(Sender : TObject);
begin
   if ColorDialog1.Execute then
      Shape4.Brush.Color := ColorDialog1.Color;
end;

procedure TForm3.Button6Click(Sender : TObject);
begin
   if ColorDialog1.Execute then
      Shape5.Brush.Color := ColorDialog1.Color;
end;

procedure TForm3.Button7Click(Sender : TObject);
begin
   Close;
end;

procedure TForm3.Button10Click(Sender : TObject);
begin
   ListBox1.Clear;
end;

procedure TForm3.Button9Click(Sender : TObject);
var
   i : integer;
begin
   for i := 0 to ListBox1.Count - 1 do
      if ListBox1.Selected[i] then
      begin
         ListBox1.Items.Delete(i);
         Exit;
      end;
end;

procedure TForm3.Button8Click(Sender : TObject);
begin
   Form1.OpenDialog1.Title := form1.GetText('60');
   if Form1.OpenDialog1.Execute then
      ListBox1.Items.AddStrings(Form1.OpenDialog1.Files);
end;

procedure TForm3.Button11Click(Sender : TObject);
begin
   Form1.OpenDialog1.Title := form1.GetText('85');
   if OpenDialog1.Execute then
      Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm3.Button15Click(Sender : TObject);
begin
   Form1.OpenDialog1.Title := form1.GetText('85');
   if OpenDialog1.Execute then
      Edit7.Text := OpenDialog1.FileName;
end;

procedure TForm3.Button12Click(Sender : TObject);
begin
   if ListBox1.ItemIndex <> -1 then
   begin
      if
         FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Dictionaries\' + ComboBox11.Items[ComboBox11.ItemIndex]) then
      begin
         StatusBar1.SimpleText := Form1.GetText('61');
         Screen.Cursor := crHourGlass;
         Application.ProcessMessages;
         Form1.SynSpellCheck1.CloseDictionary;
         Form1.SynSpellCheck1.LoadDictionary('',
            IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
            'Dictionaries\' + ComboBox11.Items[ComboBox11.ItemIndex]);
         Screen.Cursor := crDefault;
         StatusBar1.SimpleText := '';
      end;
   end;
end;

procedure TForm3.Button14Click(Sender : TObject);
begin
   StatusBar1.SimpleText := Form1.GetText('62');
   Screen.Cursor := crHourGlass;
   Application.ProcessMessages;
   Form1.SynSpellCheck1.CloseDictionary;
   Screen.Cursor := crDefault;
   StatusBar1.SimpleText := '';
end;

procedure TForm3.FormShow(Sender : TObject);
begin
   UpdateVariables;
   if TreeView1.SelectionCount = 0 then
      TreeView1.Items[0].Selected := true;
   TreeView1Click(nil);
   TreeView1.SetFocus;
end;

procedure TForm3.StringGrid1DrawCell(Sender : TObject; ACol, ARow : Integer;
   Rect : TRect; State : TGridDrawState);
begin
   with Sender as TStringGrid do
      with Canvas do
      begin
         if gdFixed in State then
            Brush.Color := clBtnFace
         else if gdSelected in State then
            Brush.Color := clNavy
         else
            Brush.Color := clWhite;
         FillRect(Rect);
         if gdSelected in State then
            SetTextColor(Canvas.Handle, clWhite)
         else
            SetTextColor(Canvas.Handle, clBlack);
         DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), -1, Rect,
            DT_CENTER or DT_NOPREFIX or DT_VCENTER or DT_SINGLELINE);
      end;
end;

procedure TForm3.StringGrid1SelectCell(Sender : TObject; ACol,
   ARow : Integer; var CanSelect : Boolean);
begin
   if ARow > 9 then
      StringGrid1.Options := StringGrid1.Options + [goEditing]
   else
      StringGrid1.Options := StringGrid1.Options - [goEditing];
   CanSelect := true;
end;

procedure TForm3.Button17Click(Sender : TObject);
var
   i : Integer;
begin
   if StringGrid1.Selection.Top > 9 then
   begin
      for i := StringGrid1.Selection.Top to StringGrid1.RowCount - 2 do
         StringGrid1.Rows[i] := StringGrid1.Rows[i + 1];
      StringGrid1.RowCount := StringGrid1.RowCount - 1;
   end;
end;

procedure TForm3.Button16Click(Sender : TObject);
begin
   with TForm14.Create(Application) do
   begin
      if ShowModal = mrOK then
      begin
         StringGrid1.RowCount := StringGrid1.RowCount + 1;
         StringGrid1.Rows[StringGrid1.RowCount - 1].Text := LabeledEdit1.Text +
            #13#10 + LabeledEdit2.Text;
      end;
      Free;
   end;
end;

procedure TForm3.Button18Click(Sender : TObject);
begin
   if SaveDialog1.Execute then
   begin
      SaveConfig(ChangeFileExt(SaveDialog1.FileName, '.cfg'));
      ComboBox18.Items :=
         ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Profils', '*.*', false, true);
      ComboBox20.Items := ComboBox18.Items;
      Form1.ComboBox2.Items := ComboBox18.Items;
   end;
end;

procedure TForm3.ComboBox18Select(Sender : TObject);
begin
   LoadConfig(TComboBox(Sender).Tag);
end;

procedure TForm3.TreeView1Click(Sender : TObject);
begin
   if (TreeView1.SelectionCount > 0) and (TreeView1.Selected.Index <> -1) then
   begin
      Notebook1.PageIndex := TreeView1.Selected.Index;
      StaticText2.Caption := Form1.Prfrences1.Caption + ' > ' +
         TreeView1.Selected.Text;
   end;
end;

procedure TForm3.LabeledEdit4Change(Sender : TObject);
begin
   TriggerChars[ComboBox1.ItemIndex] := LabeledEdit4.Text;
end;

procedure TForm3.ComboBox9Select(Sender : TObject);
begin
   AC_Files[ComboBox1.ItemIndex] := ComboBox9.Text;
end;

procedure TForm3.ListBox2Click(Sender : TObject);
begin
   if ListBox2.ItemIndex <> -1 then
   begin
      with Form1.Plugins[ListBox2.ItemIndex] do
      begin
         Label52.Caption := string(GetInfo.Auteur);
         Label53.Caption := string(GetInfo.Date);
         Memo1.Lines.Text := string(GetInfo.Description);
         Label54.Caption := string(GetInfo.Commentaire);
         Label65.Caption := string(GetInfo.Fait_par);
         Label63.Caption := string(GetInfo.WebSite);
         Label64.Caption := string(GetInfo.Mail);
         Image2.Picture.Bitmap.LoadFromResourceName(h, 'IMAGE');
      end;
   end;
end;

procedure TForm3.Label63Click(Sender : TObject);
begin
   if Label63.Caption <> '' then
      ShellExecute(handle, 'open', pchar(Label63.Caption), nil, nil, SW_SHOW);
end;

procedure TForm3.Label64Click(Sender : TObject);
begin
   if Label64.Caption <> '' then
      ShellExecute(handle, 'open', pchar('mailto:' + Label64.Caption), nil, nil,
         SW_SHOW);
end;

procedure TForm3.ComboBox7Select(Sender: TObject);
begin
AutoCompletion[ComboBox1.ItemIndex]:=ComboBox7.Items[ComboBox7.Itemindex];
end;

end.

