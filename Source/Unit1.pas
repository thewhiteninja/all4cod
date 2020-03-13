unit Unit1;

interface

uses
   { Standard }
   Windows, Messages, SysUtils, Graphics, Forms, StdCtrls, ComCtrls, ToolWin,
   Menus, ShellApi, StrUtils, Buttons, ClipBrd, Classes, Controls, Dialogs,
   ImgList, ExtCtrls, Grids, ShellCtrls,
   { SynEdit }
   SynEditTextBuffer, SynEdit, SynEditTypes, SynSpellCheck, SynExportHTML,
   SynEditHighlighter, SynEditMiscClasses, SynEditSearch, SynExportTeX,
   SynExportRTF, SynEditExport, SynEditPrintPreview, SynMemo, SynEditPrint,
   { Divers }
   DosCommand,
   Fonctions,
   Tidy,
   XPMan,
   IniFiles,
   Projet;

const
   WM_TrayMessage = WM_User + 1;
   // Constante du message provenant de la systray

type
   TSignet = record // Type Signet avec coordonnées
      Coord: TBufferCoord; // Il existe deja dans SynEdit,
      Existe: boolean; // (cf SynEdit.Bookmarks)
   end;
type
   TSignets = array[0..9] of TSignet; // 10 Signets max
type
   TForm1 = class(TForm)
      MainMenu1: TMainMenu;
      Fichier1: TMenuItem;
      Nouveau1: TMenuItem;
      Ouvrir1: TMenuItem;
      N1: TMenuItem;
      Enregistrer1: TMenuItem;
      Enregistrersous1: TMenuItem;
      outenregsitrer1: TMenuItem;
      N2: TMenuItem;
      Fermer1: TMenuItem;
      outfermer1: TMenuItem;
      N4: TMenuItem;
      Quitter1: TMenuItem;
      StatusBar1: TStatusBar;
      OpenDialog1: TOpenDialog;
      SaveDialog1: TSaveDialog;
      Edition1: TMenuItem;
      Dfaire1: TMenuItem;
      Refaire1: TMenuItem;
      N3: TMenuItem;
      Couper1: TMenuItem;
      CouperPressepapier1: TMenuItem;
      Copier1: TMenuItem;
      CopierPressepapiers1: TMenuItem;
      Coller1: TMenuItem;
      Supprimer1: TMenuItem;
      outslectionner1: TMenuItem;
      N5: TMenuItem;
      VoirlePressepapiers1: TMenuItem;
      InsrerDateetHeure1: TMenuItem;
      Insrerunfichier1: TMenuItem;
      Format1: TMenuItem;
      Changerlacasse1: TMenuItem;
      Cloque1: TMenuItem;
      Findeligne1: TMenuItem;
      rier1: TMenuItem;
      N6: TMenuItem;
      Lectureseule1: TMenuItem;
      Affichage1: TMenuItem;
      Chercher1: TMenuItem;
      Excuter1: TMenuItem;
      Outils1: TMenuItem;
      Fentre1: TMenuItem;
      N7: TMenuItem;
      CommandeDos1: TMenuItem;
      Correcteurdorthographe1: TMenuItem;
      ableASCII1: TMenuItem;
      Evaluateurdexpressions1: TMenuItem;
      Couleurs1: TMenuItem;
      Editerlesfichierssystmes1: TMenuItem;
      Conversiondebases1: TMenuItem;
      EmpreintedigitaleMD51: TMenuItem;
      N8: TMenuItem;
      Prfrences1: TMenuItem;
      abulationsEspaces1: TMenuItem;
      EspacesTabulations1: TMenuItem;
      N9: TMenuItem;
      OEMAnsi1: TMenuItem;
      AnsiOEM1: TMenuItem;
      Inverser1: TMenuItem;
      Capitaliser1: TMenuItem;
      N10: TMenuItem;
      SlectionMajuscule1: TMenuItem;
      SlectionMinuscule1: TMenuItem;
      outMajuscule1: TMenuItem;
      outMinuscule1: TMenuItem;
      Augmenterlindentation1: TMenuItem;
      Diminuerlindentation1: TMenuItem;
      N11: TMenuItem;
      Commenter1: TMenuItem;
      Dcommenter1: TMenuItem;
      N12: TMenuItem;
      Sauvegarder1: TMenuItem;
      DosWindows1: TMenuItem;
      Unix1: TMenuItem;
      Mac1: TMenuItem;
      Ordrecroissant1: TMenuItem;
      Ordredcroissant1: TMenuItem;
      Barredoutils1: TMenuItem;
      N13: TMenuItem;
      Explorateur1: TMenuItem;
      Modlesdecodes1: TMenuItem;
      N14: TMenuItem;
      Ligneactive1: TMenuItem;
      Retourlaligne1: TMenuItem;
      Numrodeligne1: TMenuItem;
      Caractresspciaux1: TMenuItem;
      AutoCompltiondesparenthses1: TMenuItem;
      N15: TMenuItem;
      Police1: TMenuItem;
      Timer1: TTimer;
      Standard1: TMenuItem;
      Langage1: TMenuItem;
      Edition2: TMenuItem;
      Affichage2: TMenuItem;
      Recherche1: TMenuItem;
      Outils2: TMenuItem;
      Fentre2: TMenuItem;
      N17: TMenuItem;
      outafficher1: TMenuItem;
      outmasquer1: TMenuItem;
      Panel1: TPanel;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      TabSheet3: TTabSheet;
      Splitter1: TSplitter;
      Panel2: TPanel;
      Splitter2: TSplitter;
      GroupBox1: TGroupBox;
      ListBox1: TListBox;
      Splitter3: TSplitter;
      ListBox2: TListBox;
      Prcdente1: TMenuItem;
      Suivante1: TMenuItem;
      N16: TMenuItem;
      Cascade1: TMenuItem;
      Mozaque1: TMenuItem;
      Mozaqueverticale1: TMenuItem;
      N18: TMenuItem;
      Fermer2: TMenuItem;
      outfermer2: TMenuItem;
      Panel3: TPanel;
      CheckBox1: TCheckBox;
      CheckBox2: TCheckBox;
      Panel4: TPanel;
      Button3: TButton;
      ListBox3: TListBox;
      RichEdit1: TRichEdit;
      Panel5: TPanel;
      Button4: TButton;
      Button6: TButton;
      Rouvrir1: TMenuItem;
      Recharger1: TMenuItem;
      N19: TMenuItem;
      Lefichierencours1: TMenuItem;
      outlesfichiersouverts1: TMenuItem;
      Aucun1: TMenuItem;
      Aucun2: TMenuItem;
      Aucun3: TMenuItem;
      Aucun4: TMenuItem;
      Aucun5: TMenuItem;
      Aucun6: TMenuItem;
      Aucun7: TMenuItem;
      Aucun8: TMenuItem;
      Aucun9: TMenuItem;
      Aucun10: TMenuItem;
      outeffacer1: TMenuItem;
      PopupMenu1: TPopupMenu;
      Aucun11: TMenuItem;
      Aucun12: TMenuItem;
      Aucun13: TMenuItem;
      Aucun14: TMenuItem;
      Aucun15: TMenuItem;
      Aucun16: TMenuItem;
      Aucun17: TMenuItem;
      Aucun18: TMenuItem;
      Aucun19: TMenuItem;
      Acun1: TMenuItem;
      N20: TMenuItem;
      outeffacer2: TMenuItem;
      DosCommand1: TDosCommand;
      Compiler1: TMenuItem;
      Excuter2: TMenuItem;
      N21: TMenuItem;
      outfaire1: TMenuItem;
      N22: TMenuItem;
      Stopper1: TMenuItem;
      Aide1: TMenuItem;
      Misejour1: TMenuItem;
      Envoyerunrapportderreur1: TMenuItem;
      N23: TMenuItem;
      AproposdePitiPad1: TMenuItem;
      SynSpellCheck1: TSynSpellCheck;
      GroupBox2: TGroupBox;
      StringGrid1: TStringGrid;
      Rechercher1: TMenuItem;
      Remplacer1: TMenuItem;
      Occurencesuivante1: TMenuItem;
      Occurenceprcdente1: TMenuItem;
      N24: TMenuItem;
      Allerlaligne1: TMenuItem;
      N25: TMenuItem;
      Crerunsignet1: TMenuItem;
      Allerunsignet1: TMenuItem;
      Effacerlessignets1: TMenuItem;
      FindDialog1: TFindDialog;
      ReplaceDialog1: TReplaceDialog;
      Signet01: TMenuItem;
      Signet11: TMenuItem;
      Signet21: TMenuItem;
      Signet31: TMenuItem;
      Signet41: TMenuItem;
      Signet51: TMenuItem;
      Signet61: TMenuItem;
      Signet71: TMenuItem;
      Signet81: TMenuItem;
      Signet91: TMenuItem;
      Signet02: TMenuItem;
      Signet12: TMenuItem;
      Signet22: TMenuItem;
      Signet32: TMenuItem;
      Signet42: TMenuItem;
      Signet52: TMenuItem;
      Signet62: TMenuItem;
      Signet72: TMenuItem;
      Signet82: TMenuItem;
      Signet92: TMenuItem;
      N26: TMenuItem;
      AperuenHTML1: TMenuItem;
      Exporter1: TMenuItem;
      FormatHTML1: TMenuItem;
      FormatRTF1: TMenuItem;
      FormatLaTex1: TMenuItem;
      N27: TMenuItem;
      Modledecodes1: TMenuItem;
      Proprits1: TMenuItem;
      N28: TMenuItem;
      N29: TMenuItem;
      Configurerlimpression1: TMenuItem;
      Aperuavantimpression1: TMenuItem;
      Imprimer1: TMenuItem;
      SynExporterHTML1: TSynExporterHTML;
      SynExporterRTF1: TSynExporterRTF;
      SynEditPrint1: TSynEditPrint;
      PrintDialog1: TPrintDialog;
      PopupMenu2: TPopupMenu;
      Standard2: TMenuItem;
      Edition3: TMenuItem;
      Langage2: TMenuItem;
      Affichage3: TMenuItem;
      Recherche2: TMenuItem;
      Outils3: TMenuItem;
      Fentre3: TMenuItem;
      N30: TMenuItem;
      outafficher2: TMenuItem;
      outmasquer2: TMenuItem;
      PopupMenu3: TPopupMenu;
      Editer1: TMenuItem;
      N31: TMenuItem;
      Ractualiserlaliste1: TMenuItem;
      PopupMenu4: TPopupMenu;
      MenuItem1: TMenuItem;
      MenuItem2: TMenuItem;
      MenuItem3: TMenuItem;
      MenuItem4: TMenuItem;
      MenuItem5: TMenuItem;
      MenuItem6: TMenuItem;
      MenuItem7: TMenuItem;
      MenuItem8: TMenuItem;
      MenuItem9: TMenuItem;
      MenuItem10: TMenuItem;
      MenuItem11: TMenuItem;
      MenuItem12: TMenuItem;
      MenuItem13: TMenuItem;
      MenuItem14: TMenuItem;
      MenuItem15: TMenuItem;
      MenuItem16: TMenuItem;
      Enregistrersous2: TMenuItem;
      MenuItem17: TMenuItem;
      MenuItem18: TMenuItem;
      Signet03: TMenuItem;
      Signet13: TMenuItem;
      Signet23: TMenuItem;
      Signet33: TMenuItem;
      Signet43: TMenuItem;
      Signet53: TMenuItem;
      Signet63: TMenuItem;
      Signet73: TMenuItem;
      Signet83: TMenuItem;
      Signet93: TMenuItem;
      Signet04: TMenuItem;
      Signet14: TMenuItem;
      Signet24: TMenuItem;
      Signet34: TMenuItem;
      Signet44: TMenuItem;
      Signet54: TMenuItem;
      Signet64: TMenuItem;
      Signet74: TMenuItem;
      Signet84: TMenuItem;
      Signet94: TMenuItem;
      ImageList1: TImageList;
      Configuration1: TMenuItem;
      Configuration2: TMenuItem;
      PopupMenu5: TPopupMenu;
      Restaurer1: TMenuItem;
      N32: TMenuItem;
      Quitter2: TMenuItem;
      N33: TMenuItem;
      FormatRTFPressepapiers1: TMenuItem;
      FormatRTFPressepapiers2: TMenuItem;
      FormatLaTexPressepapiers1: TMenuItem;
      HTML1: TMenuItem;
      ControlerlecodeHTML1: TMenuItem;
      idy1: TMenuItem;
      Cleandocumentnowrapnoindent1: TMenuItem;
      Cleandocumentnowrap1: TMenuItem;
      Cleandocumentquote1: TMenuItem;
      Cleandocumentwrap1: TMenuItem;
      CleanMicrosoftWord20001: TMenuItem;
      UpgradetoCSS1: TMenuItem;
      UpgradetoXHTML1: TMenuItem;
      UpgradetoXML1: TMenuItem;
      N34: TMenuItem;
      N35: TMenuItem;
      Personnalis1: TMenuItem;
      Balisesenmajuscules1: TMenuItem;
      Balisesenminuscules1: TMenuItem;
      N36: TMenuItem;
      N37: TMenuItem;
      CompresserlecodeHTML1: TMenuItem;
      Aperudanslenavigateur1: TMenuItem;
      N38: TMenuItem;
      ReformaterlecodeHTML1: TMenuItem;
      Resteraudessusdelcran1: TMenuItem;
      Panel8: TPanel;
      TabControl1: TTabControl;
      Cacher1: TMenuItem;
      ShellComboBox1: TShellComboBox;
      ShellTreeView1: TShellTreeView;
      SynExporterTeX1: TSynExporterTeX;
      N39: TMenuItem;
      Langues1: TMenuItem;
      Dfaut1: TMenuItem;
      ControlBar1: TControlBar;
      ToolBar1: TToolBar;
      ToolButton1: TToolButton;
      ToolButton2: TToolButton;
      ToolButton3: TToolButton;
      ToolButton4: TToolButton;
      ToolButton5: TToolButton;
      ToolButton6: TToolButton;
      ToolButton7: TToolButton;
      ToolButton8: TToolButton;
      ToolButton9: TToolButton;
      ToolButton10: TToolButton;
      ToolButton12: TToolButton;
      ToolButton66: TToolButton;
      ToolButton13: TToolButton;
      ToolButton14: TToolButton;
      ToolButton15: TToolButton;
      ToolButton16: TToolButton;
      ToolButton17: TToolButton;
      ToolButton18: TToolButton;
      ToolButton19: TToolButton;
      ToolBar2: TToolBar;
      Panel6: TPanel;
      Label1: TLabel;
      ComboBox1: TComboBox;
      ToolBar6: TToolBar;
      ToolButton52: TToolButton;
      ToolButton53: TToolButton;
      ToolButton54: TToolButton;
      ToolButton55: TToolButton;
      ToolButton56: TToolButton;
      ToolButton57: TToolButton;
      ToolButton58: TToolButton;
      ToolButton59: TToolButton;
      ToolBar3: TToolBar;
      ToolButton20: TToolButton;
      ToolButton21: TToolButton;
      ToolButton22: TToolButton;
      ToolButton23: TToolButton;
      ToolButton24: TToolButton;
      ToolButton25: TToolButton;
      ToolButton26: TToolButton;
      ToolButton27: TToolButton;
      ToolButton28: TToolButton;
      ToolButton29: TToolButton;
      ToolButton30: TToolButton;
      ToolButton31: TToolButton;
      ToolButton32: TToolButton;
      ToolButton33: TToolButton;
      ToolBar4: TToolBar;
      ToolButton34: TToolButton;
      ToolButton35: TToolButton;
      ToolButton36: TToolButton;
      ToolButton37: TToolButton;
      ToolButton38: TToolButton;
      ToolButton39: TToolButton;
      ToolButton40: TToolButton;
      ToolButton41: TToolButton;
      ToolButton42: TToolButton;
      ToolButton43: TToolButton;
      ToolButton44: TToolButton;
      ToolButton45: TToolButton;
      ToolButton67: TToolButton;
      ToolBar5: TToolBar;
      ToolButton46: TToolButton;
      ToolButton47: TToolButton;
      ToolButton48: TToolButton;
      ToolButton49: TToolButton;
      ToolButton50: TToolButton;
      ToolButton51: TToolButton;
      ToolBar7: TToolBar;
      ToolButton60: TToolButton;
      ToolButton61: TToolButton;
      ToolButton62: TToolButton;
      ToolButton63: TToolButton;
      ToolButton64: TToolButton;
      ToolButton65: TToolButton;
      ToolBar8: TToolBar;
      Panel7: TPanel;
      Label2: TLabel;
      ComboBox2: TComboBox;
      N40: TMenuItem;
      AfficherAll4CodInfos1: TMenuItem;
      Panel9: TPanel;
      Splitter4: TSplitter;
      TreeView1: TTreeView;
      PopupMenu6: TPopupMenu;
      Nouveau2: TMenuItem;
      Ouvrir2: TMenuItem;
      Enregistrer2: TMenuItem;
      Fermer3: TMenuItem;
      N41: TMenuItem;
      Ajouterunfichier1: TMenuItem;
      N42: TMenuItem;
      Enregsitrersous1: TMenuItem;
      Supprimerdesfichiers1: TMenuItem;
      Projet1: TMenuItem;
      Nouveau3: TMenuItem;
      Ouvrir3: TMenuItem;
      N43: TMenuItem;
      Enregistrer3: TMenuItem;
      Enregistrersous3: TMenuItem;
      N44: TMenuItem;
      Informationssurleprojet1: TMenuItem;
      Options1: TMenuItem;
      N45: TMenuItem;
      Fermer4: TMenuItem;
      N46: TMenuItem;
      Ajouterauprojet1: TMenuItem;
      Retirerduprojet1: TMenuItem;
      Vide1: TMenuItem;
      Modles1: TMenuItem;
      Fichiervide1: TMenuItem;
      Fichieravecmodle1: TMenuItem;
      N47: TMenuItem;
      Projetvide1: TMenuItem;
      Projetavecmodle1: TMenuItem;
      N48: TMenuItem;
      N49: TMenuItem;
      Informationssurleprojet2: TMenuItem;
      Options2: TMenuItem;
      Fichiervide2: TMenuItem;
      Modle1: TMenuItem;
      Enregistrerleprojetsous1: TMenuItem;
      GroupBox3: TGroupBox;
    XPManifest1: TXPManifest;
    PopupMenu7: TPopupMenu;
    Copier2: TMenuItem;
    Effacer1: TMenuItem;
    Enregistrersous4: TMenuItem;
    procedure Copier2Click(Sender: TObject);
    procedure Effacer1Click(Sender: TObject);
    procedure Enregistrersous4Click(Sender: TObject);
      procedure Options1Click(Sender: TObject);
      procedure Informationssurleprojet1Click(Sender: TObject);
      procedure Fichieravecmodle1Click(Sender: TObject);
      procedure Fermer4Click(Sender: TObject);
      procedure Retirerduprojet1Click(Sender: TObject);
      procedure Ajouterauprojet1Click(Sender: TObject);
      procedure Enregistrersous3Click(Sender: TObject);
      procedure Enregistrer3Click(Sender: TObject);
      procedure Ouvrir3Click(Sender: TObject);
      procedure Modles1Click(Sender: TObject);
      procedure Vide1Click(Sender: TObject);
      procedure TreeView1Click(Sender: TObject);
      procedure TreeView1DblClick(Sender: TObject);
      procedure AfficherAll4CodInfos1Click(Sender: TObject);
      procedure Ouvrir1Click(Sender: TObject);
      procedure Enregistrer1Click(Sender: TObject);
      procedure Enregistrersous1Click(Sender: TObject);
      procedure outenregsitrer1Click(Sender: TObject);
      procedure Fermer1Click(Sender: TObject);
      procedure outfermer1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure Nouveau1Click(Sender: TObject);
      procedure ComboBox1Select(Sender: TObject);
      procedure Dfaire1Click(Sender: TObject);
      procedure Refaire1Click(Sender: TObject);
      procedure Couper1Click(Sender: TObject);
      procedure Copier1Click(Sender: TObject);
      procedure Coller1Click(Sender: TObject);
      procedure Supprimer1Click(Sender: TObject);
      procedure outslectionner1Click(Sender: TObject);
      procedure CouperPressepapier1Click(Sender: TObject);
      procedure CopierPressepapiers1Click(Sender: TObject);
      procedure VoirlePressepapiers1Click(Sender: TObject);
      procedure InsrerDateetHeure1Click(Sender: TObject);
      procedure Insrerunfichier1Click(Sender: TObject);
      procedure Lectureseule1Click(Sender: TObject);
      procedure Prfrences1Click(Sender: TObject);
      procedure Quitter1Click(Sender: TObject);
      procedure abulationsEspaces1Click(Sender: TObject);
      procedure EspacesTabulations1Click(Sender: TObject);
      procedure OEMAnsi1Click(Sender: TObject);
      procedure AnsiOEM1Click(Sender: TObject);
      procedure Inverser1Click(Sender: TObject);
      procedure Capitaliser1Click(Sender: TObject);
      procedure SlectionMajuscule1Click(Sender: TObject);
      procedure SlectionMinuscule1Click(Sender: TObject);
      procedure outMajuscule1Click(Sender: TObject);
      procedure outMinuscule1Click(Sender: TObject);
      procedure Augmenterlindentation1Click(Sender: TObject);
      procedure Diminuerlindentation1Click(Sender: TObject);
      procedure Sauvegarder1Click(Sender: TObject);
      procedure DosWindows1Click(Sender: TObject);
      procedure Unix1Click(Sender: TObject);
      procedure Mac1Click(Sender: TObject);
      procedure Ordrecroissant1Click(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Ordredcroissant1Click(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
      procedure Standard1Click(Sender: TObject);
      procedure Edition2Click(Sender: TObject);
      procedure Langage1Click(Sender: TObject);
      procedure Affichage2Click(Sender: TObject);
      procedure Recherche1Click(Sender: TObject);
      procedure Outils2Click(Sender: TObject);
      procedure Fentre2Click(Sender: TObject);
      procedure outafficher1Click(Sender: TObject);
      procedure outmasquer1Click(Sender: TObject);
      procedure Explorateur1Click(Sender: TObject);
      procedure Modlesdecodes1Click(Sender: TObject);
      procedure Police1Click(Sender: TObject);
      procedure Ligneactive1Click(Sender: TObject);
      procedure Retourlaligne1Click(Sender: TObject);
      procedure Numrodeligne1Click(Sender: TObject);
      procedure Caractresspciaux1Click(Sender: TObject);
      procedure AutoCompltiondesparenthses1Click(Sender: TObject);
      procedure ListBox1Click(Sender: TObject);
      procedure ListBox2DblClick(Sender: TObject);
      procedure Prcdente1Click(Sender: TObject);
      procedure Suivante1Click(Sender: TObject);
      procedure Cascade1Click(Sender: TObject);
      procedure Mozaque1Click(Sender: TObject);
      procedure Mozaqueverticale1Click(Sender: TObject);
      procedure CheckBox1Click(Sender: TObject);
      procedure CheckBox2Click(Sender: TObject);
      procedure Panel1CanResize(Sender: TObject; var NewWidth,
         NewHeight: Integer; var Resize: Boolean);
      procedure Button6Click(Sender: TObject);
      procedure Button4Click(Sender: TObject);
      procedure Commenter1Click(Sender: TObject);
      procedure Dcommenter1Click(Sender: TObject);
      procedure Editerlesfichierssystmes1Click(Sender: TObject);
      procedure Lefichierencours1Click(Sender: TObject);
      procedure outlesfichiersouverts1Click(Sender: TObject);
      procedure outeffacer1Click(Sender: TObject);
      procedure Aucun1Click(Sender: TObject);
      procedure Aucun11Click(Sender: TObject);
      procedure Compiler1Click(Sender: TObject);
      procedure DosCommand1Terminated(Sender: TObject; ExitCode: Cardinal);
      procedure Excuter2Click(Sender: TObject);
      procedure outfaire1Click(Sender: TObject);
      procedure Stopper1Click(Sender: TObject);
      procedure AproposdePitiPad1Click(Sender: TObject);
      procedure Envoyerunrapportderreur1Click(Sender: TObject);
      procedure Aide1Click(Sender: TObject);
      procedure Misejour1Click(Sender: TObject);
      procedure CommandeDos1Click(Sender: TObject);
      procedure EmpreintedigitaleMD51Click(Sender: TObject);
      procedure Conversiondebases1Click(Sender: TObject);
      procedure Couleurs1Click(Sender: TObject);
      procedure Evaluateurdexpressions1Click(Sender: TObject);
      procedure Correcteurdorthographe1Click(Sender: TObject);
      procedure SynSpellCheck1DictClose(Sender: TObject);
      procedure SynSpellCheck1DictLoad(Sender: TObject);
      procedure SynSpellCheck1Done(Sender: TObject);
      procedure SynSpellCheck1CheckWord(Sender: TObject; AWord: string;
         ASuggestions: TStringList; var ACorrectWord: string;
         var AAction: Integer; const AUndoEnabled: Boolean);
      procedure SynSpellCheck1Abort(Sender: TObject);
      procedure ableASCII1Click(Sender: TObject);
      procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
         Rect: TRect; State: TGridDrawState);
      procedure Rechercher1Click(Sender: TObject);
      procedure FindDialog1Find(Sender: TObject);
      procedure Occurencesuivante1Click(Sender: TObject);
      procedure Occurenceprcdente1Click(Sender: TObject);
      procedure Remplacer1Click(Sender: TObject);
      procedure ReplaceDialog1Find(Sender: TObject);
      procedure ReplaceDialog1Replace(Sender: TObject);
      procedure Allerlaligne1Click(Sender: TObject);
      procedure Signet02Click(Sender: TObject);
      procedure Signet01Click(Sender: TObject);
      procedure Effacerlessignets1Click(Sender: TObject);
      procedure AperuenHTML1Click(Sender: TObject);
      procedure Modledecodes1Click(Sender: TObject);
      procedure FormatHTML1Click(Sender: TObject);
      procedure Configurerlimpression1Click(Sender: TObject);
      procedure Imprimer1Click(Sender: TObject);
      procedure Aperuavantimpression1Click(Sender: TObject);
      procedure Proprits1Click(Sender: TObject);
      procedure Ractualiserlaliste1Click(Sender: TObject);
      procedure Editer1Click(Sender: TObject);
      procedure Signet04Click(Sender: TObject);
      procedure Signet03Click(Sender: TObject);
      procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
      procedure ComboBox2Select(Sender: TObject);
      procedure Configuration1Click(Sender: TObject);
      procedure Quitter2Click(Sender: TObject);
      procedure Restaurer1Click(Sender: TObject);
      procedure FormatRTFPressepapiers1Click(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure ControlerlecodeHTML1Click(Sender: TObject);
      procedure Cleandocumentnowrapnoindent1Click(Sender: TObject);
      procedure Cleandocumentnowrap1Click(Sender: TObject);
      procedure Cleandocumentquote1Click(Sender: TObject);
      procedure Cleandocumentwrap1Click(Sender: TObject);
      procedure CleanMicrosoftWord20001Click(Sender: TObject);
      procedure UpgradetoCSS1Click(Sender: TObject);
      procedure UpgradetoXHTML1Click(Sender: TObject);
      procedure UpgradetoXML1Click(Sender: TObject);
      procedure Balisesenmajuscules1Click(Sender: TObject);
      procedure Balisesenminuscules1Click(Sender: TObject);
      procedure CompresserlecodeHTML1Click(Sender: TObject);
      procedure ReformaterlecodeHTML1Click(Sender: TObject);
      procedure Resteraudessusdelcran1Click(Sender: TObject);
      procedure ToolButton67Click(Sender: TObject);
      procedure ListBox3Click(Sender: TObject);
      procedure ListBox3DblClick(Sender: TObject);
      procedure TabControl1DrawTab(Control: TCustomTabControl;
         TabIndex: Integer; const Rect: TRect; Active: Boolean);
      procedure Personnalis1Click(Sender: TObject);
      procedure Cacher1Click(Sender: TObject);
      procedure ShellTreeView1DblClick(Sender: TObject);
      procedure Dfaut1Click(Sender: TObject);
      procedure TabControl1Change(Sender: TObject);
   private
      // Gère les clicks du menu Plugins
      procedure GerePluginsClick(Sender: TObject);
      procedure GerePluginsReponse(rep : PChar);
      // Gère les clicks du menu Language
      procedure GereLanguageClick(Sender: TObject);
      // Affiche la fenêtre principale (depuis la systray)
      procedure Montrer;
      // Cacher la fenêtre principale dans la systray
      procedure Cacher;
      procedure OnMinimize(Sender: TObject);
      // Gère le Drag/Drop de fichiers
      procedure WMDropFiles(var msg: TMessage); message WM_DROPFILES;
      // Gère l'icone dans la systray
      procedure WMTrayMessage(var msg: TMessage); message WM_TrayMessage;
   public
      Tray: TNotifyIconData;
      Tidy: TTidy;
      // Tableau statique de 10 signets
      Signets: TSignets;
      // Tableau dynamique de plugins (cf Fonctions.pas)
      Plugins: TPlugins;
      CurrentFileLanguage: string;
      // N° des fenêtre   Ex : Sans Titre 3
      Cpt_Sans_Titre: integer;
      Commande_Terminer, Stopper, Correction, Fermer: boolean; // Divers flags
      Projet: TProjet;
      // Fonction général pour ouvrir un fichier
      procedure Ouvrir(fichier: string; Dans_projet: boolean);
      // Flag modifier de la fenêtre en cours à TRUE +
      // Affichage dans la statusbar
      procedure ModifToTrue;
      // Ajoute un fichier dans menu Reouvrir
      procedure AddReOpen(fichier: string);
      // Charge un language à partir de l'index du MenuItem clické
      procedure ChargeLanguage(index: integer);
      // Charge un language à partir d'un fichier lng (txt :))
      procedure ChargeStrings(f: string);
      // Renvoi le texte de la section MESSAGES du fichier de language courant
      function GetText(value: string): string;
      // Indique si une MDIChild existe et si ce n'est pas la fiche infos
      function FicheEditeur(const index: integer = -2): boolean;
   end;

var
   Form1: TForm1;

const
   TabShowWindows: array[0..3] of TShowWindow = (swHIDE, swMAXIMIZE, swMINIMIZE,
      swSHOW);
   TabPriority: array[0..3] of Word = (HIGH_PRIORITY_CLASS,
      NORMAL_PRIORITY_CLASS, IDLE_PRIORITY_CLASS, REALTIME_PRIORITY_CLASS);

implementation

uses Unit2, Unit3, uHighlighterProcs, Unit4, Unit5, Unit6, Unit7, Unit8,
   Unit9, Unit10, Unit11, Unit12, Unit15, Unit16, Unit17, Unit18, Unit19,
   Unit20;

{$R *.dfm}

function TForm1.FicheEditeur(const index: integer = -2): boolean;
begin
   try
      if (index = -2) then
      begin
         result := (ActiveMDIChild.Tag = 0);
      end
      else
      begin
         result := (MDIChildren[index].Tag = 0);
      end;
   except
      result := false
   end;
end;

function Tform1.GetText(value: string): string;
var
   ini: TIniFile;
begin
   ini := TIniFile.Create(CurrentFileLanguage);
   try
      Result := ini.ReadString('MESSAGES', value, '');
   finally
      ini.free;
   end;
end;

procedure TForm1.ChargeStrings(f: string);
{ Change les caption, pour la form1 (principale), et la form3 (Options)
  Seul ces 2 fiches sont crées au départ. Les autres chargeont le language
  à leur création }
var
   Ini: TIniFile;
   i: integer;
begin
   if FileExists(f) then
   begin
      CurrentFileLanguage := f;
      Ini := TIniFile.Create(f);
      try
         with ini do
         begin
            // On commence par le MainMenu
            with MainMenu1 do
            begin
               if Items.Count > 10 then
                  Items[8].Caption := ReadString('MENU', 'PLUGINS', '');
               // Fichier
               with Items[0] do
               begin
                  Caption := ReadString('MENU', '0_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '0_0', '');
                  Items[0].Items[0].Caption := ReadString('MENU', '0_0_0', '');
                  Items[0].Items[1].Caption := ReadString('MENU', '0_0_1', '');
                  Items[0].Items[3].Caption := ReadString('MENU', '0_0_2', '');
                  Items[0].Items[4].Caption := ReadString('MENU', '0_0_3', '');
                  Items[1].Caption := ReadString('MENU', '0_1', '');
                  Items[2].Caption := ReadString('MENU', '0_2', '');
                  Items[2].Items[11].Caption := ReadString('MENU', '0_2_0', '');
                  Items[3].Caption := ReadString('MENU', '0_3', '');
                  Items[3].Items[0].Caption := ReadString('MENU', '0_3_0', '');
                  Items[3].Items[1].Caption := ReadString('MENU', '0_3_1', '');
                  Items[5].Caption := ReadString('MENU', '0_4', '');
                  Items[6].Caption := ReadString('MENU', '0_5', '');
                  Items[7].Caption := ReadString('MENU', '0_6', '');
                  Items[8].Caption := ReadString('MENU', '0_7', '');
                  Items[10].Caption := ReadString('MENU', '0_8', '');
                  Items[11].Caption := ReadString('MENU', '0_9', '');
                  Items[11].Items[0].Caption := ReadString('MENU', '0_9_0', '');
                  Items[11].Items[1].Caption := ReadString('MENU', '0_9_1', '');
                  Items[11].Items[2].Caption := ReadString('MENU', '0_9_2', '');
                  Items[11].Items[4].Caption := ReadString('MENU', '0_9_3', '');
                  Items[11].Items[5].Caption := ReadString('MENU', '0_9_4', '');
                  Items[11].Items[6].Caption := ReadString('MENU', '0_9_5', '');
                  Items[11].Items[8].Caption := ReadString('MENU', '0_9_6', '');
                  Items[13].Caption := ReadString('MENU', '0_10', '');
                  Items[14].Caption := ReadString('MENU', '0_11', '');
                  Items[16].Caption := ReadString('MENU', '0_12', '');
                  Items[18].Caption := ReadString('MENU', '0_13', '');
                  Items[19].Caption := ReadString('MENU', '0_14', '');
                  Items[20].Caption := ReadString('MENU', '0_15', '');
                  Items[22].Caption := ReadString('MENU', '0_16', '');
               end;
               // Edition
               with Items[1] do
               begin
                  Caption := ReadString('MENU', '1_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '1_0', '');
                  Items[1].Caption := ReadString('MENU', '1_1', '');
                  Items[3].Caption := ReadString('MENU', '1_2', '');
                  Items[4].Caption := ReadString('MENU', '1_3', '');
                  Items[5].Caption := ReadString('MENU', '1_4', '');
                  Items[6].Caption := ReadString('MENU', '1_5', '');
                  Items[7].Caption := ReadString('MENU', '1_6', '');
                  Items[8].Caption := ReadString('MENU', '1_7', '');
                  Items[9].Caption := ReadString('MENU', '1_8', '');
                  Items[11].Caption := ReadString('MENU', '1_9', '');
                  Items[12].Caption := ReadString('MENU', '1_10', '');
                  Items[13].Caption := ReadString('MENU', '1_11', '');
                  Items[14].Caption := ReadString('MENU', '1_12', '');
                  Items[14].Items[0].Caption := ReadString('MENU', '1_12_0', '');
                  Items[14].Items[1].Caption := ReadString('MENU', '1_12_1', '');
                  Items[14].Items[3].Caption := ReadString('MENU', '1_12_2', '');
                  Items[14].Items[4].Caption := ReadString('MENU', '1_12_3', '');
                  Items[15].Caption := ReadString('MENU', '1_13', '');
                  Items[15].Items[0].Caption := ReadString('MENU', '1_13_0', '');
                  Items[15].Items[1].Caption := ReadString('MENU', '1_13_1', '');
                  Items[15].Items[3].Caption := ReadString('MENU', '1_13_2', '');
                  Items[15].Items[4].Caption := ReadString('MENU', '1_13_3', '');
                  Items[15].Items[5].Caption := ReadString('MENU', '1_13_4', '');
                  Items[15].Items[6].Caption := ReadString('MENU', '1_13_5', '');
                  Items[16].Caption := ReadString('MENU', '1_14', '');
                  Items[16].Items[0].Caption := ReadString('MENU', '1_14_0', '');
                  Items[16].Items[1].Caption := ReadString('MENU', '1_14_1', '');
                  Items[16].Items[3].Caption := ReadString('MENU', '1_14_2', '');
                  Items[16].Items[4].Caption := ReadString('MENU', '1_14_3', '');
                  Items[16].Items[6].Caption := ReadString('MENU', '1_14_4', '');
                  Items[17].Caption := ReadString('MENU', '1_15', '');
                  Items[17].Items[0].Caption := ReadString('MENU', '1_15_0', '');
                  Items[17].Items[1].Caption := ReadString('MENU', '1_15_1', '');
                  Items[17].Items[2].Caption := ReadString('MENU', '1_15_2', '');
                  Items[18].Caption := ReadString('MENU', '1_16', '');
                  Items[18].Items[0].Caption := ReadString('MENU', '1_16_0', '');
                  Items[18].Items[1].Caption := ReadString('MENU', '1_16_1', '');
                  Items[20].Caption := ReadString('MENU', '1_17', '');
               end;
               // Affichage
               with Items[2] do
               begin
                  Caption := ReadString('MENU', '2_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '2_0', '');
                  Items[0].Items[0].Caption := ReadString('MENU', '2_0_0', '');
                  Items[0].Items[1].Caption := ReadString('MENU', '2_0_1', '');
                  Items[0].Items[2].Caption := ReadString('MENU', '2_0_2', '');
                  Items[0].Items[3].Caption := ReadString('MENU', '2_0_3', '');
                  Items[0].Items[4].Caption := ReadString('MENU', '2_0_4', '');
                  Items[0].Items[5].Caption := ReadString('MENU', '2_0_5', '');
                  Items[0].Items[6].Caption := ReadString('MENU', '2_0_6', '');
                  Items[0].Items[7].Caption := ReadString('MENU', '2_0_7', '');
                  Items[0].Items[9].Caption := ReadString('MENU', '2_0_8', '');
                  Items[0].Items[10].Caption := ReadString('MENU', '2_0_9', '');
                  Items[2].Caption := ReadString('MENU', '2_1', '');
                  Items[3].Caption := ReadString('MENU', '2_2', '');
                  Items[5].Caption := ReadString('MENU', '2_3', '');
                  Items[7].Caption := ReadString('MENU', '2_4', '');
                  Items[8].Caption := ReadString('MENU', '2_5', '');
                  Items[9].Caption := ReadString('MENU', '2_6', '');
                  Items[10].Caption := ReadString('MENU', '2_7', '');
                  Items[11].Caption := ReadString('MENU', '2_8', '');
                  Items[13].Caption := ReadString('MENU', '2_9', '');
                  Items[14].Caption := ReadString('MENU', '2_10', '');
               end;
               // Chercher
               with Items[3] do
               begin
                  Caption := ReadString('MENU', '3_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '3_0', '');
                  Items[1].Caption := ReadString('MENU', '3_1', '');
                  Items[2].Caption := ReadString('MENU', '3_2', '');
                  Items[3].Caption := ReadString('MENU', '3_3', '');
                  Items[5].Caption := ReadString('MENU', '3_4', '');
                  Items[7].Caption := ReadString('MENU', '3_5', '');
                  Items[8].Caption := ReadString('MENU', '3_6', '');
                  Items[9].Caption := ReadString('MENU', '3_7', '');
                  // Liste des signets
                  for i := 0 to 9 do
                  begin
                     if not (Signets[i].existe) then
                     begin
                        Items[7].Items[i].Caption := Form1.GetText('80') + ' ' +
                           IntToStr(i);
                        PopupMenu4.Items[3].Items[i].Caption :=
                           Items[7].Items[i].Caption;
                        Items[8].Items[i].Caption := Items[7].Items[i].Caption;
                        PopupMenu4.Items[4].Items[i].Caption :=
                           Items[7].Items[i].Caption;
                     end;
                  end;
               end;
               //Projet
               with Items[4] do
               begin
                  Caption := ReadString('MENU', '4_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '4_0', '');
                  PopupMenu6.Items[0].Caption := ReadString('MENU', '4_0', '');
                  Items[0].Items[0].Caption := ReadString('MENU', '4_0_0', '');
                  PopupMenu6.Items[0].Items[0].Caption := ReadString('MENU', '4_0_0', '');
                  Items[0].Items[1].Caption := ReadString('MENU', '4_0_1', '');
                  PopupMenu6.Items[0].Items[1].Caption := ReadString('MENU', '4_0_1', '');
                  Items[1].Caption := ReadString('MENU', '4_1', '');
                  PopupMenu6.Items[1].Caption := ReadString('MENU', '4_1', '');
                  Items[3].Caption := ReadString('MENU', '4_2', '');
                  PopupMenu6.Items[3].Caption := ReadString('MENU', '4_2', '');
                  Items[4].Caption := ReadString('MENU', '4_3', '');
                  PopupMenu6.Items[4].Caption := ReadString('MENU', '4_3', '');
                  Items[6].Caption := ReadString('MENU', '4_4', '');
                  PopupMenu6.Items[6].Caption := ReadString('MENU', '4_4', '');
                  Items[7].Caption := ReadString('MENU', '4_5', '');
                  PopupMenu6.Items[7].Caption := ReadString('MENU', '4_5', '');
                  Items[9].Caption := ReadString('MENU', '4_6', '');
                  PopupMenu6.Items[9].Caption := ReadString('MENU', '4_6', '');
                  Items[10].Caption := ReadString('MENU', '4_7', '');
                  PopupMenu6.Items[10].Caption := ReadString('MENU', '4_7', '');
                  Items[12].Caption := ReadString('MENU', '4_8', '');
                  PopupMenu6.Items[12].Caption := ReadString('MENU', '4_8', '');
               end;

               // Executer
               with Items[5] do
               begin
                  Caption := ReadString('MENU', '5_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '5_0', '');
                  Items[1].Caption := ReadString('MENU', '5_1', '');
                  Items[3].Caption := ReadString('MENU', '5_0', '')+' && '+ReadString('MENU', '5_1', '');
                  Items[5].Caption := ReadString('MENU', '5_2', '');
               end;
               // Outils
               with Items[6] do
               begin
                  Caption := ReadString('MENU', '6_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '6_0', '');
                  Items[1].Caption := ReadString('MENU', '6_1', '');
                  Items[2].Caption := ReadString('MENU', '6_2', '');
                  Items[3].Caption := ReadString('MENU', '6_3', '');
                  Items[4].Caption := ReadString('MENU', '6_4', '');
                  Items[5].Caption := ReadString('MENU', '6_5', '');
                  Items[6].Caption := ReadString('MENU', '6_6', '');
                  Items[7].Caption := ReadString('MENU', '6_7', '');
                  Items[9].Caption := ReadString('MENU', '6_8', '');
               end;
               // HTML
               with Items[7] do
               begin
                  Caption := ReadString('MENU', '7_CAPTION', '');
                  Items[0].Caption := ReadString('MENU', '7_0', '');
                  Items[2].Caption := ReadString('MENU', '7_1', '');
                  Items[3].Caption := ReadString('MENU', '7_2', '');
                  Items[5].Caption := ReadString('MENU', '7_3', '');
                  Items[6].Caption := ReadString('MENU', '7_4', '');
                  Items[8].Caption := ReadString('MENU', '7_5', '');
                  Items[9].Caption := ReadString('MENU', '7_6', '');
                  Items[9].Items[10].Caption := ReadString('MENU', '7_6_0', '');
               end;
               // Le menu plugins est traité séparément
               // Fenêtre
               Items[Items.Count - 2].Caption := ReadString('MENU', '8_CAPTION', '');
               Items[Items.Count - 2].Items[0].Caption := ReadString('MENU', '8_0', '');
               Items[Items.Count - 2].Items[1].Caption := ReadString('MENU', '8_1', '');
               Items[Items.Count - 2].Items[3].Caption := ReadString('MENU', '8_2', '');
               Items[Items.Count - 2].Items[4].Caption := ReadString('MENU', '8_3', '');
               Items[Items.Count - 2].Items[5].Caption := ReadString('MENU', '8_4', '');
               Items[Items.Count - 2].Items[7].Caption := ReadString('MENU', '8_5', '');
               Items[Items.Count - 2].Items[8].Caption := ReadString('MENU', '8_6', '');
               Items[Items.Count - 2].Items[10].Caption := ReadString('MENU', '8_7', '');
               // ?
               Items[Items.Count - 1].Caption := ReadString('MENU', '9_CAPTION', '');
               Items[Items.Count - 1].Items[0].Caption := ReadString('MENU', '9_0', '');
               Items[Items.Count - 1].Items[1].Caption := ReadString('MENU', '9_1', '');
               Items[Items.Count - 1].Items[2].Caption := ReadString('MENU', '9_2', '');
               Items[Items.Count - 1].Items[4].Caption := ReadString('MENU', '9_3', '');
               // Change les Hint des MenuItem Caption2Hint :)
               C2H(Items);
            end;
            // Change les Captions et Hint des ToolButtons
            // à partir des MenuItem associés
            for i := 0 to ToolBar1.ButtonCount - 1 do
               if not (ToolBar1.Buttons[i].Style = tbsSeparator) and
                  assigned(ToolBar1.Buttons[i].MenuItem) then
                  ToolBar1.Buttons[i].Hint :=
                     ToolBar1.Buttons[i].MenuItem.Caption;
            for i := 0 to ToolBar3.ButtonCount - 1 do
               if not (ToolBar3.Buttons[i].Style = tbsSeparator) and
                  assigned(ToolBar3.Buttons[i].MenuItem) then
                  ToolBar3.Buttons[i].Hint :=
                     ToolBar3.Buttons[i].MenuItem.Caption;
            for i := 0 to ToolBar4.ButtonCount - 1 do
               if not (ToolBar4.Buttons[i].Style = tbsSeparator) and
                  assigned(ToolBar4.Buttons[i].MenuItem) then
                  ToolBar4.Buttons[i].Hint :=
                     ToolBar4.Buttons[i].MenuItem.Caption;
            for i := 0 to ToolBar5.ButtonCount - 1 do
               if not (ToolBar5.Buttons[i].Style = tbsSeparator) and
                  assigned(ToolBar5.Buttons[i].MenuItem) then
                  ToolBar5.Buttons[i].Hint :=
                     ToolBar5.Buttons[i].MenuItem.Caption;
            for i := 0 to ToolBar6.ButtonCount - 1 do
               if not (ToolBar6.Buttons[i].Style = tbsSeparator) and
                  assigned(ToolBar6.Buttons[i].MenuItem) then
                  ToolBar6.Buttons[i].Hint :=
                     ToolBar6.Buttons[i].MenuItem.Caption;
            for i := 0 to ToolBar7.ButtonCount - 1 do
               if not (ToolBar7.Buttons[i].Style = tbsSeparator) and
                  assigned(ToolBar7.Buttons[i].MenuItem) then
                  ToolBar7.Buttons[i].Hint :=
                     ToolBar7.Buttons[i].MenuItem.Caption;
            // Quelques ToolButton qui n'ont pas de MenuItem
            ToolButton36.Hint := Explorateur1.Caption;
            ToolButton37.Hint := Modlesdecodes1.Caption;
            ToolButton39.Hint := Ligneactive1.Caption;
            ToolButton40.Hint := Retourlaligne1.Caption;
            ToolButton41.Hint := Numrodeligne1.Caption;
            ToolButton42.Hint := Caractresspciaux1.Caption;
            ToolButton43.Hint := AutoCompltiondesparenthses1.Caption;
            ToolButton67.Hint := Resteraudessusdelcran1.Caption;
            ToolButton2.Hint := Ouvrir1.Caption;
            ToolButton34.Hint := Barredoutils1.Caption;
            ToolButton67.Hint := Resteraudessusdelcran1.Caption;

            // Change les Caption des ToolBars Config et Language
            Label2.Caption := Prfrences1.Caption + ' : ';
            ComboBox2.Left := Label2.Width + 5;
            ToolBar8.Hint := Prfrences1.Caption;
            Label1.Caption := Langues1.Caption + ' : ';
            ComboBox1.Left := Label1.Width + 5;
            ToolBar2.Hint := Langues1.Caption;

            // Ajuste la taille des combobox des ToolBars Config et Language
            // C'est plus zoli :)
            if ComboBox1.Left + ComboBox1.Width > 250 then
            begin

               if ComboBox1.Left + ComboBox1.Width > ComboBox2.Left +
                  ComboBox2.Width then
               begin
                  ComboBox1.Width := ComboBox2.Left + ComboBox2.Width -
                     ComboBox1.Left;
               end
               else
               begin
                  ComboBox2.Width := ComboBox1.Left + ComboBox1.Width -
                     ComboBox2.Left;
               end;

            end
            else
            begin
               if ComboBox1.Left + ComboBox1.Width > ComboBox2.Left +
                  ComboBox2.Width then
               begin
                  ComboBox2.Width := ComboBox1.Left + ComboBox1.Width -
                     ComboBox2.Left;
               end
               else
               begin
                  ComboBox1.Width := ComboBox2.Left + ComboBox2.Width -
                     ComboBox1.Left;
               end;
            end;

            // Ajuste la taille des ToolBars Config et Language
            Panel6.Width := ComboBox2.Width + ComboBox2.Left + 2;
            Panel7.Width := ComboBox1.Width + ComboBox1.Left + 2;
            ToolBar2.Width := ComboBox2.Width + ComboBox2.Left + 4;
            ToolBar8.Width := ComboBox1.Width + ComboBox1.Left + 4;

            ComboBox1.Items[0] := GetText('81'); // Item spéciale : Aucun, None
            ComboBox1.ItemIndex := 0;
            // Panneau de gauche, explorateur, notes et fichiers ouverts
            CheckBox1.Caption := ReadString('PANEL', '0', '');
            CheckBox2.Caption := ReadString('PANEL', '1', '');
            TabSheet1.Caption := ReadString('PANEL', '2', '');
            TabSheet2.Caption := ReadString('PANEL', '3', '');
            TabSheet3.Caption := ReadString('PANEL', '4', '');
            Button3.Caption := ReadString('PANEL', '5', '');
            Button4.Caption := ReadString('PANEL', '6', '');
            Button6.Caption := ReadString('PANEL', '7', '');
            GroupBox3.Caption := ReadString('PANEL', '8', '');
            GroupBox2.Caption := ReadString('PANEL', '9', '');
            GroupBox1.Caption := ReadString('PANEL', '10', '');

            PopupMenu1.Items[11].Caption := ReadString('POPUP1', '0', '');

            for i := 0 to PopupMenu2.Items.Count - 1 do
               PopupMenu2.Items[i].Caption :=
                  MainMenu1.Items[2].Items[0].Items[i].Caption;

            PopupMenu3.Items[0].Caption := ReadString('POPUP3', '0', '');
            PopupMenu3.Items[2].Caption := ReadString('POPUP3', '1', '');

            // PopupMenu des form2
            with PopupMenu4 do
            begin
               Items[0].Caption := ReadString('MENU', '1_0', '');
               Items[1].Caption := ReadString('MENU', '1_1', '');
               Items[3].Caption := ReadString('MENU', '3_5', '');
               Items[4].Caption := ReadString('MENU', '3_6', '');
               Items[5].Caption := ReadString('MENU', '3_7', '');
               Items[7].Caption := ReadString('MENU', '1_2', '');
               Items[8].Caption := ReadString('MENU', '1_4', '');
               Items[9].Caption := ReadString('MENU', '1_6', '');
               Items[10].Caption := ReadString('MENU', '1_7', '');
               Items[11].Caption := ReadString('MENU', '1_8', '');
               Items[13].Caption := ReadString('MENU', '0_3', '');
               Items[15].Caption := ReadString('MENU', '0_4', '');
               Items[16].Caption := ReadString('MENU', '0_5', '');
               Items[18].Caption := ReadString('MENU', '0_10', '');
            end;

            // PopupMenu de la TrayIcon
            PopupMenu5.Items[0].Caption := ReadString('POPUP5', '0', '');
            PopupMenu5.Items[1].Caption := ReadString('POPUP5', '1', '');
            PopupMenu5.Items[3].Caption := ReadString('MENU', '0_16', '');

            // PopupMenu des SynMemo
            PopupMenu7.Items[0].Caption := ReadString('POPUP7', '0', '');
            PopupMenu7.Items[1].Caption := ReadString('POPUP7', '1', '');
            PopupMenu7.Items[2].Caption := ReadString('POPUP7', '2', '');

            // Change le language affiché dans les form2, si il n'y en a pas
            // Aucun, None
            for i := 0 to MDIChildCount - 1 do
            begin
               if FicheEditeur(i) then
               begin
                  TForm2(MDIChildren[i]).GroupBox1.Caption := Form1.GetText('78');
                  if TForm2(MDIChildren[i]).SynEdit1.Highlighter = nil then
                     TForm2(MDIChildren[i]).StatusBar1.Panels[0].Text :=
                        GetText('81');
               end;
            end;

            // Caption de la form3 : Gros paquet de ReadString :)
            with Form3 do
            begin
               for i := 0 to 9 do
                  TreeView1.Items[i].Text := ReadString('SETTINGS', 'LEFT' +
                     IntToStr(i), '');
               Caption := Form1.Prfrences1.Caption;
               CheckBox20.Caption := ReadString('SETTINGS', '0', '');
               CheckBox21.Caption := ReadString('SETTINGS', '1', '');
               CheckBox22.Caption := ReadString('SETTINGS', '2', '');
               CheckBox23.Caption := ReadString('SETTINGS', '3', '');
               CheckBox24.Caption := ReadString('SETTINGS', '4', '');
               CheckBox31.Caption := ReadString('SETTINGS', '5', '');
               CheckBox44.Caption := ReadString('SETTINGS', '6', '');
               Label12.Caption := ReadString('SETTINGS', '7', '');
               Label13.Caption := ReadString('SETTINGS', '8', '');
               Label14.Caption := ReadString('SETTINGS', '9', '');
               Label15.Caption := ReadString('SETTINGS', '10', '');
               Label16.Caption := ReadString('SETTINGS', '11', '');
               i := ComboBox3.ItemIndex;
               ComboBox3.Items[0] := ReadString('SETTINGS', '11_0', '');
               ComboBox3.Items[1] := ReadString('SETTINGS', '11_1', '');
               ComboBox3.Items[2] := ReadString('SETTINGS', '11_2', '');
               ComboBox3.Items[3] := ReadString('SETTINGS', '11_3', '');
               ComboBox3.ItemIndex := i;
               Label17.Caption := ReadString('SETTINGS', '12', '');
               i := ComboBox4.ItemIndex;
               ComboBox4.Items[0] := ReadString('SETTINGS', '12_0', '');
               ComboBox4.Items[1] := ReadString('SETTINGS', '12_1', '');
               ComboBox4.Items[2] := ReadString('SETTINGS', '12_2', '');
               ComboBox4.Items[3] := ReadString('SETTINGS', '12_3', '');
               ComboBox4.ItemIndex := i;
               Label18.Caption := ReadString('SETTINGS', '13', '');
               Label19.Caption := ReadString('SETTINGS', '14', '');
               Label20.Caption := ReadString('SETTINGS', '15', '');
               Button3.Caption := ReadString('SETTINGS', '16', '');
               GroupBox2.Caption := ReadString('SETTINGS', '17', '');
               Label9.Caption := ReadString('SETTINGS', '18', '');
               Label10.Caption := ReadString('SETTINGS', '19', '');
               CheckBox17.Caption := ReadString('SETTINGS', '20', '');
               CheckBox18.Caption := ReadString('SETTINGS', '21', '');
               CheckBox19.Caption := ReadString('SETTINGS', '22', '');
               CheckBox1.Caption := ReadString('SETTINGS', '23', '');
               CheckBox7.Caption := ReadString('SETTINGS', '24', '');
               CheckBox42.Caption := ReadString('SETTINGS', '25', '');
               GroupBox3.Caption := ReadString('MENU', '2_9', '');
               CheckBox43.Caption := ReadString('SETTINGS', '26', '');
               CheckBox6.Caption := ReadString('SETTINGS', '27', '');
               GroupBox4.Caption := ReadString('SETTINGS', '28', '');
               Button8.Caption := ReadString('SETTINGS', '29', '');
               Button9.Caption := ReadString('SETTINGS', '30', '');
               Button10.Caption := ReadString('SETTINGS', '31', '');
               CheckBox15.Caption := ReadString('SETTINGS', '32', '');
               CheckBox16.Caption := ReadString('SETTINGS', '33', '');
               CheckBox34.Caption := ReadString('SETTINGS', '34', '');
               CheckBox40.Caption := ReadString('SETTINGS', '35', '');
               CheckBox25.Caption := ReadString('SETTINGS', '36', '');
               CheckBox26.Caption := ReadString('SETTINGS', '37', '');
               CheckBox27.Caption := ReadString('SETTINGS', '38', '');
               CheckBox28.Caption := ReadString('SETTINGS', '39', '');
               CheckBox29.Caption := ReadString('SETTINGS', '40', '');
               CheckBox30.Caption := ReadString('SETTINGS', '41', '');
               GroupBox1.Caption := ReadString('SETTINGS', '42', '');
               LabeledEdit1.EditLabel.Caption := ReadString('SETTINGS', '43',
                  '');
               CheckBox8.Caption := ReadString('SETTINGS', '44', '');
               CheckBox9.Caption := ReadString('SETTINGS', '45', '');
               CheckBox10.Caption := ReadString('SETTINGS', '46', '');
               CheckBox11.Caption := ReadString('SETTINGS', '47', '');
               CheckBox12.Caption := ReadString('SETTINGS', '48', '');
               CheckBox13.Caption := ReadString('SETTINGS', '49', '');
               CheckBox14.Caption := ReadString('SETTINGS', '50', '');
               CheckBox41.Caption := ReadString('SETTINGS', '51', '');
               Label8.Caption := ReadString('SETTINGS', '52', '');
               Button7.Caption := ReadString('MENU', '0_10', '');
               Label2.Caption := ReadString('SETTINGS', '53', '');
               TabSheet1.Caption := ReadString('SETTINGS', '54', '');
               Label3.Caption := ReadString('SETTINGS', '55', '');
               Label4.Caption := ReadString('SETTINGS', '56', '');
               Label5.Caption := ReadString('SETTINGS', '57', '');
               GroupBox14.Caption := ReadString('SETTINGS', '58', '');
               CheckBox5.Caption := ReadString('SETTINGS', '59', '');
               CheckBox4.Caption := ReadString('SETTINGS', '60', '');
               CheckBox2.Caption := ReadString('SETTINGS', '61', '');
               CheckBox3.Caption := ReadString('SETTINGS', '62', '');
               LabeledEdit2.EditLabel.Caption := ReadString('SETTINGS', '63',
                  '');
               LabeledEdit3.EditLabel.Caption := ReadString('SETTINGS', '64',
                  '');
               TabSheet2.Caption := ReadString('SETTINGS', '65', '');
               GroupBox15.Caption := ReadString('SETTINGS', '66', '');
               CheckBox45.Caption := ReadString('SETTINGS', '67', '');
               CheckBox47.Caption := ReadString('SETTINGS', '68', '');
               CheckBox46.Caption := ReadString('SETTINGS', '69', '');
               Label7.Caption := ReadString('SETTINGS', '70', '');
               Label6.Caption := ReadString('SETTINGS', '71', '');
               Label23.Caption := ReadString('SETTINGS', '72', '');
               Label27.Caption := ReadString('SETTINGS', '72', '');
               LabeledEdit4.EditLabel.Caption := ReadString('SETTINGS', '73',
                  '');
               TabSheet3.Caption := ReadString('SETTINGS', '74', '');
               GroupBox5.Caption := ReadString('SETTINGS', '75', '');
               Label42.Caption := ReadString('SETTINGS', '76', '');
               Label43.Caption := ReadString('SETTINGS', '77', '');
               CheckBox32.Caption := ReadString('SETTINGS', '78', '');
               CheckBox33.Caption := ReadString('SETTINGS', '79', '');
               Button12.Caption := ReadString('SETTINGS', '80', '');
               Button14.Caption := ReadString('SETTINGS', '81', '');
               Label21.Caption := ReadString('SETTINGS', '82', '');
               Label22.Caption := ReadString('SETTINGS', '83', '');
               GroupBox9.Caption := ReadString('SETTINGS', '84', '');
               Label40.Caption := ReadString('SETTINGS', '85', '');
               Label41.Caption := ReadString('SETTINGS', '86', '');
               Label25.Caption := ReadString('SETTINGS', '87', '');
               Label24.Caption := ReadString('SETTINGS', '88', '');
               GroupBox11.Caption := ReadString('SETTINGS', '89', '');
               Button18.Caption := ReadString('SETTINGS', '90', '');
               Label26.Caption := ReadString('SETTINGS', '91', '');
               i := ComboBox6.ItemIndex;
               ComboBox5.Items[0] := ReadString('SETTINGS', '92', '');
               ComboBox5.Items[1] := ReadString('SETTINGS', '93', '');
               ComboBox5.Items[2] := ReadString('SETTINGS', '94', '');
               ComboBox5.Items[3] := ReadString('SETTINGS', '95', '');
               ComboBox5.ItemIndex := i;
               Label32.Caption := ReadString('SETTINGS', '82', '');
               Label33.Caption := ReadString('SETTINGS', '83', '');
               GroupBox7.Caption := ReadString('SETTINGS', '84', '');
               Label35.Caption := ReadString('SETTINGS', '88', '');
               GroupBox13.Caption := ReadString('SETTINGS', '89', '');
               Button20.Caption := ReadString('SETTINGS', '90', '');
               Label36.Caption := ReadString('SETTINGS', '91', '');
               i := ComboBox10.ItemIndex;
               ComboBox10.Items[0] := ReadString('SETTINGS', '92', '');
               ComboBox10.Items[1] := ReadString('SETTINGS', '93', '');
               ComboBox10.Items[2] := ReadString('SETTINGS', '94', '');
               ComboBox10.Items[3] := ReadString('SETTINGS', '95', '');
               ComboBox10.ItemIndex := i;
               GroupBox16.Caption := ReadString('SETTINGS', '96', '');
               GroupBox17.Caption := ReadString('SETTINGS', '97', '');
               Label34.Caption := ReadString('SETTINGS', '98', '');
               Label37.Caption := ReadString('SETTINGS', '99', '');
               Label60.Caption := ReadString('SETTINGS', '100', '');
               Label55.Caption := ReadString('SETTINGS', '101', '');
               Label56.Caption := ReadString('SETTINGS', '102', '');
               Label57.Caption := ReadString('SETTINGS', '103', '');
               Label58.Caption := ReadString('SETTINGS', '104', '');
               Label59.Caption := ReadString('SETTINGS', '105', '');
               GroupBox18.Caption := ReadString('SETTINGS', '108', '');
               GroupBox19.Caption := ReadString('SETTINGS', '109', '');
               ListView1.Columns[0].Caption := ReadString('SETTINGS', '110',
                  '');
               ListView1.Columns[1].Caption := ReadString('SETTINGS', '111',
                  '');
               ListView1.Columns[2].Caption := ReadString('SETTINGS', '112',
                  '');
               GroupBox10.Caption := ReadString('SETTINGS', '113', '');
               Button16.Caption := ReadString('SETTINGS', '114', '');
               Button17.Caption := ReadString('SETTINGS', '115', '');
               Label44.Caption := ReadString('SETTINGS', '116', '');
               i := ComboBox13.ItemIndex;
               ComboBox13.Items[0] := ReadString('SETTINGS', '117', '');
               ComboBox13.Items[1] := ReadString('SETTINGS', '118', '');
               ComboBox13.Items[2] := ReadString('SETTINGS', '119', '');
               ComboBox13.ItemIndex := i;
               Label45.Caption := ReadString('SETTINGS', '120', '');
               Label46.Caption := ReadString('SETTINGS', '121', '');
               Label47.Caption := ReadString('SETTINGS', '122', '');
               Label48.Caption := ReadString('SETTINGS', '123', '');
               Label49.Caption := ReadString('SETTINGS', '124', '');
               Label50.Caption := ReadString('SETTINGS', '125', '');
               Label51.Caption := ReadString('SETTINGS', '126', '');
               CheckBox35.Caption := ReadString('SETTINGS', '127', '');
               CheckBox36.Caption := ReadString('SETTINGS', '128', '');
               CheckBox37.Caption := ReadString('SETTINGS', '129', '');
               CheckBox38.Caption := ReadString('SETTINGS', '130', '');
               CheckBox39.Caption := ReadString('SETTINGS', '131', '');
               CheckBox48.Caption := ReadString('SETTINGS', '132', '');
            end;
         end;
      finally
         ini.Free;
      end;
   end
   else
      MessageBoxA(Handle, Pchar(GetText('0')), Pchar('All4Cod - ' +
         GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
end;

procedure TForm1.ChargeLanguage(index: integer);
var
   m: TResourceStream;
begin
   inc(index);
   if index = 0 then
   begin
      // Si index=0, la langue est celle par défault : Francais
      m := TResourceStream.Create(HInstance, 'Default', RT_RCDATA);
      try
         m.SaveToFile(IncludeTrailingPathDelimiter(GetTempDossier) +
            'default.lng');
      finally
         m.Free;
      end;
      // On extrait les fichier Default.lng dans les ressources
      ChargeStrings(IncludeTrailingPathDelimiter(GetTempDossier) +
         'default.lng');
   end
   else
      // Sinon on charge le fichier
      ChargeStrings(AnsiReplaceText(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Languages\' + MainMenu1.Items[2].Items[5].Items[index].Caption +
         '.lng', '&', ''));
end;

procedure TForm1.WMTrayMessage(var msg: TMessage);
var
   Curs: TPoint;
begin
   case msg.LParam of
      Wm_RButtonDown: begin // Clik gauche = Affiche PopupMenu
            SetForegroundWindow(handle);
            GetCursorPos(Curs);
            PopupMenu5.Popup(Curs.X, Curs.Y);
         end;
      WM_LBUTTONDBLCLK: begin // DblClik gauche = Montrer
            Montrer;
         end;
   end;
end;

procedure TForm1.OnMinimize(Sender: TObject);
begin
   if Form3.CheckBox42.Checked then Cacher;
end;

procedure TForm1.Cacher;
begin
   ShowWindow(Application.Handle, SW_HIDE);
   if Application.MainForm <> nil then
      Application.MainForm.Visible := false
   else
      Application.ShowMainForm := false;
end;

procedure TForm1.Montrer;
begin
   if Application.MainForm <> nil then
   begin
      Application.Restore;
      Application.MainForm.Visible := true;
      Application.MainForm.Refresh;
      ShowWindow(Application.Handle, SW_SHOW);
      SetForegroundWindow(Application.MainForm.Handle);
   end;
end;

procedure AjouteIcon;
begin
   with Form1.Tray do
   begin
      cbSize := SizeOf(Form1.Tray);
      wnd := Form1.Handle;
      uID := 1;
      UCallbackMessage := WM_TrayMessage;
      hIcon := Application.Icon.handle;
      szTip := 'All4Cod';
      uFlags := nif_message or nif_icon or nif_tip;
   end;
   Shell_NotifyIcon(Nim_ADD, @(Form1.Tray));
end;

procedure TForm1.GereLanguageClick;
var
   i: integer;
begin
   for i := 0 to MainMenu1.Items[2].Items[5].Count - 1 do
      MainMenu1.Items[2].Items[5].Items[i].Checked :=
         MainMenu1.Items[2].Items[5].Items[i].Tag = TMenuItem(Sender).Tag;
   ChargeLanguage(TMenuItem(Sender).Tag);
end;

procedure TForm1.GerePluginsReponse(rep : PChar);
var cmd, param : string;
begin
if (rep <> nil) then
begin
  cmd := LeftStr(string(rep), pos('##', string(rep))-1);
  param := RightStr(string(rep), length(string(rep))-pos('##', string(rep))-1);
  //
end;
end;

procedure TForm1.GerePluginsClick;
begin
   if not(Plugins[TmenuItem(Sender).Tag].GetInfo.NeedFileOpen) or FicheEditeur then
   begin
      if not(Plugins[TmenuItem(Sender).Tag].GetInfo.NeedFileSaved) or (TForm2(ActiveMDIChild).Nom <> '') then
      begin
        GerePluginsReponse(Plugins[TmenuItem(Sender).Tag].Execute(Pchar('MenuClick'), PChar(TForm2(ActiveMDIChild).Nom)));
      end
      else MessageBoxA(handle,Pchar(GetText('92')),Pchar(GetText('INFO')),0 + MB_ICONINFORMATION + 0);
   end
   else MessageBoxA(handle,Pchar(GetText('93')),Pchar(GetText('INFO')),0 + MB_ICONINFORMATION + 0);
end;

procedure LoadLanguages;
var
   i: integer;
   p: TStringList;
   menu: TMenuItem;
   bitmap : TBitmap;
begin
   p := TStringList.Create;
   try
      p.Assign(ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Languages\', '*.lng', false, true));
      p.Sort;
      for i := 0 to p.Count - 1 do
      begin
         menu := TMenuItem.Create(Form1.MainMenu1);
         menu.Caption := ChangeFileExt(ExtractFileName(p[i]), '');
         bitmap:=TBitmap.Create;
         try
            bitmap.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Languages\'+ChangeFileExt(p[i], '.bmp'));
            menu.ImageIndex:=Form1.ImageList1.AddMasked(bitmap, clFuchsia);
         except
            menu.ImageIndex:=-1;
         end;
         bitmap.Free;
         menu.Hint := menu.Caption;
         menu.Tag := i;
         menu.AutoHotkeys := maManual;
         menu.OnClick := Form1.GereLanguageClick;
         Form1.MainMenu1.Items[2].Items[5].Add(menu);
      end;
   finally
      p.Free;
   end;
end;

procedure AddPluginsMenu;
var
   menu: TMenuItem;
begin
   menu := TMenuItem.Create(Form1.MainMenu1);
   menu.Caption := 'Plugins';
   Form1.MainMenu1.Items.Insert(8, menu);
end;

procedure AddPluginToPluginsMenu(index: integer);
var
   menu: TMenuItem;
   b: TBitmap;
begin
   menu := TMenuItem.Create(Form1.MainMenu1);
   menu.Caption := string(Form1.Plugins[index].GetInfo.MenuCaption);
   menu.Hint := menu.Caption;
   menu.Tag := index;
   b := TBitmap.Create;
   b.LoadFromResourceName(Form1.Plugins[index].h, 'IMAGE');
   b.Height := 16;
   b.Width := 16;
   Form1.ImageList1.AddMasked(b, clFuchsia);
   b.Free;
   menu.ImageIndex := Form1.ImageList1.Count - 1;
   menu.OnClick := Form1.GerePluginsClick;
   Form1.MainMenu1.Items[8].Add(menu);
end;

procedure LoadPlugins;
var
   i: integer;
   p: TStringList;
   pluginsmenu: boolean;
begin
   SetLength(Form1.Plugins, 0);
   p := TStringList.Create;
   try
      p.Assign(ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Plugins\', '*.dll', false, true));
      p.Sort;
      pluginsmenu := false;
      for i := 0 to p.Count - 1 do
      begin
         SetLength(Form1.Plugins, length(Form1.Plugins) + 1);
         if not
            (LoadDll(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Plugins\' + p[i], Form1.Plugins[i])) then
         begin
            if Form1.Plugins[i].h <> 0 then
               FreeLibrary(Form1.Plugins[i].h);
            SetLength(Form1.Plugins, Length(Form1.Plugins) - 1);
         end
         else
         begin
            if Form1.Plugins[i].GetInfo.Menu then
            begin
              if not (pluginsmenu) then
              begin
                AddPluginsMenu;
                pluginsmenu := true;
              end;
              AddPluginToPluginsMenu(i);
            end;  
         end;
      end;
   finally
      p.Free;
   end;
end;

procedure TidyClean;
begin
   if Form1.FicheEditeur then
   begin
      with Form1.Tidy do
      begin
         Input.Assign(TForm2(Form1.ActiveMDIChild).SynEdit1.Lines);
         case Execute of
            1:
               begin
                  MessageBoxA(Form1.Handle, Pchar(Form1.GetText('2')),
                     Pchar('All4Cod - ' + Form1.GetText('ERROR')), 0 +
                     MB_ICONINFORMATION + 0);
                  exit;
               end;
            2:
               begin
                  MessageBoxA(Form1.Handle, Pchar(Form1.GetText('3') + #13 +
                     IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
                     'Tidy\Tidy.exe'), Pchar('All4Cod - ' +
                     Form1.GetText('ERROR')), 0 +
                     MB_ICONINFORMATION + 0);
                  exit;
               end;
            3:
               begin
                  MessageBoxA(Form1.Handle, Pchar(form1.GetText('4')),
                     Pchar('All4Cod - ' + Form1.GetText('ERROR')), 0 +
                     MB_ICONINFORMATION + 0);
                  exit;
               end;
         end;
         if Output.Text <> '' then
            TForm2(Form1.ActiveMDIChild).SynEdit1.Lines.Assign(Output);
      end;
   end;
end;

procedure TForm1.WMDropFiles(var msg: TMessage);
var
   hand: THandle;
   nbFich, i: integer;
   buf: array[0..MAX_PATH] of Char;
begin
   hand := msg.wParam;
   nbFich := DragQueryFile(hand, 4294967295, buf, 254);
   for i := 0 to nbFich - 1 do
   begin
      DragQueryFile(hand, i, buf, 254);
      Ouvrir(strpas(buf), false);
   end;
   DragFinish(hand);
end;

function PrepareCommande(chaine: string): string;
var
   i: integer;
begin
   Form3.UpdateVariables;
   Result := chaine;
   for i := 1 to Form3.StringGrid1.RowCount - 1 do
      Result := AnsiReplaceText(Result, Form3.StringGrid1.Cells[0, i],
         Form3.StringGrid1.Cells[1, i]);
end;

procedure ConfigTDosCommand(projet: boolean);
begin
   if Form1.FicheEditeur then
   begin
      if projet and Form1.Projet.Ouvert then
      begin
         with Form1.DosCommand1 do
         begin
            OutputLines := TForm2(Form1.ActiveMDIChild).SynMemo1.Lines;
               CommandLine := PrepareCommande(Form1.Projet.Options.Compile_exe + ' ' +
                  Form1.Projet.Options.Compile_param);
               MaxTimeAfterBeginning := Form1.Projet.Options.Compile_Timeout1;
               MaxTimeAfterLastOutput := Form1.Projet.Options.Compile_Timeout2;
               ShowWindow := TabShowWindows[Form1.Projet.Options.Compile_Show];
               Priority := TabPriority[Form1.Projet.Options.Compile_Priority];
            TForm2(Form1.ActiveMDIChild).SynMemo1.Lines.Add(form1.GetText('44') + ' : '
               + CommandLine);
         end;
      end
      else
      begin
         with Form1.DosCommand1 do
         begin
            OutputLines := TForm2(Form1.ActiveMDIChild).SynMemo1.Lines;
               CommandLine := PrepareCommande(Form3.Edit1.Text + ' ' +
                  Form3.Edit2.Text);
               MaxTimeAfterBeginning := Form3.SpinEdit12.Value;
               MaxTimeAfterLastOutput := Form3.SpinEdit13.Value;
               ShowWindow := TabShowWindows[Form3.ComboBox5.ItemIndex];
               Priority := TabPriority[Form3.ComboBox6.ItemIndex];
            TForm2(Form1.ActiveMDIChild).SynMemo1.Lines.Add(form1.GetText('44') + ' : '
               + CommandLine);
         end;
      end;
   end;
end;

procedure TForm1.AddReOpen(fichier: string);
var
   i: integer;
begin
   if fichier <> MainMenu1.Items[0].Items[2].Items[0].Caption then
      with MainMenu1.Items[0].Items[2] do
      begin
         for i := 8 downto 0 do
            Items[i + 1].Caption := Items[i].Caption;
         Items[0].Caption := fichier;
         for i := 0 to 9 do
            PopupMenu1.Items[i].Caption := Items[i].Caption;
      end;
end;

procedure TForm1.Ouvrir(fichier: string; dans_projet: boolean);
var
   insert, item, biggest: string;
begin
   if FileExists(fichier) then
   begin
      if UpperCase(ExtractFileExt(fichier)) = '.AP' then
      begin
         if Projet.Ouvert then
         begin
            if MessageBoxA(handle, Pchar(GetText('91')), Pchar('All4Cod - ' + GetText('QUESTION')), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = 6 then
            begin
               Projet.Fermer;
               Projet.Ouvrir(fichier);
            end;
         end
         else Projet.Ouvrir(fichier);
      end
      else
      begin
         if ListBox3.Items.IndexOf(ExtractFileName(fichier)) <> -1 then
         begin
            if MessageBoxA(Handle, Pchar(GetText('5') + ' ' +
               ExtractFileName(fichier) + ' ' + GetText('6') + #13 + GetText('7')),
               Pchar('All4Cod - ' + GetText('QUESTION')), MB_YESNO + MB_ICONQUESTION +
               MB_DEFBUTTON2) = 7 then
               Exit;
         end;
         with TForm2.Create(Application) do
         begin
            Projet := Dans_Projet;
            SynEdit1.Lines.LoadFromFile(fichier);
            Nom := fichier;
            Caption := ExtractFileName(fichier);
            ListBox3.Items.Add(Caption);
            TabControl1.Tabs.Add(Caption);
            Panel8.Visible := true;
            AddReOpen(fichier);
            if Form3.CheckBox25.Checked and
               (GetHighlighterFromFileExt(Form3.ListHighlighters,
               ExtractFileExt(fichier)) <> nil) then
            begin
               SynEdit1.Highlighter :=
                  GetHighlighterFromFileExt(Form3.ListHighlighters,
                  ExtractFileExt(fichier));
               StatusBar1.Panels[0].Text := SynEdit1.Highlighter.LanguageName;
               SynCompletionProposal1.TriggerChars :=
                  Form3.TriggerChars[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)];
               Form3.FileToAC(insert, item, biggest,
                  Form3.AC_Files[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)]);
               SynAutoComplete.AutoCompleteList.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+'Highlighters\'+Form3.AutoCompletion[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)]);
               with SynCompletionProposal1 do
               begin
                  Columns[0].BiggestWord := biggest;
                  InsertList.Text := insert;
                  ItemList.Text := item;
                  Title :=
                     Form3.AC_Files[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)];
                  ResetAssignedList;
               end;
            end;
         end;
      end;
   end;
end;

procedure TForm1.ModifToTrue;
begin
   if FicheEditeur then
   begin
      TForm2(ActiveMDIChild).Modifier := true;
      TForm2(ActiveMDIChild).StatusBar1.Panels[2].Text := GetText('77');
   end;
end;

procedure TForm1.Ouvrir1Click(Sender: TObject);
var
   i: integer;
begin
   OpenDialog1.Title := Form1.GetText('82');
   if OpenDialog1.Execute then
      for i := 0 to OpenDialog1.Files.Count - 1 do
         Ouvrir(OpenDialog1.Files[i], false);
end;

procedure TForm1.Enregistrer1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).Enregistrer;
end;

procedure TForm1.Enregistrersous1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).EnregistrerSous;
end;

procedure TForm1.outenregsitrer1Click(Sender: TObject);
var
   i: integer;
begin
   for i := 0 to MDIChildCount - 1 do
      if FicheEditeur(i) then TForm2(MDIChildren[i]).Enregistrer;
   if Projet.Ouvert then Projet.Enregistrer;
end;

procedure TForm1.Fermer1Click(Sender: TObject);
begin
   if (MDIChildCount > 0) then
      ActiveMDIChild.Close;
end;

procedure TForm1.outfermer1Click(Sender: TObject);
var
   i: integer;
begin
   for i := 0 to MDIChildCount - 1 do
      MDIChildren[i].Close;
   if Projet.Ouvert then Projet.Fermer;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   i: integer;
begin
   Icon.Handle := Application.Icon.Handle;
   LoadPlugins;
   LoadLanguages;
   AjouteIcon;
   Application.OnMinimize := OnMinimize;
   Fermer := false;
   Cpt_Sans_Titre := 1;
   Tidy := TTidy.Create(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)));
   Projet := TProjet.create;
   DragacceptFiles(Handle, true);
   for i := 0 to 9 do
      Signets[i].Existe := false;
   Commande_Terminer := true;
   PageControl1.ActivePage := TabSheet1;
   ListBox1.Items :=
      ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
      + 'Models', '*.*', false, true);
   StringGrid1.Rows[0].Text := 'Dec' + #13#10 + 'Hex' + #13#10 + 'ASCII';
   for i := 0 to 255 do
      StringGrid1.Rows[i + 1].Text := IntToStr(i) + #13#10 + IntToHex(i, 2) +
         #13#10 + Char(i);
   ListBox1.ItemIndex := 0;
   ListBox1Click(nil);
end;

procedure TForm1.Nouveau1Click(Sender: TObject);
var
   f2: TForm2;
begin
   f2 := TForm2.Create(Self);
   f2.Caption := GetText('79') + ' ' + IntToStr(Cpt_Sans_Titre);
   Inc(Cpt_Sans_Titre);
   ListBox3.Items.Add(f2.Caption);
   TabControl1.Tabs.Add(f2.Caption);
   Panel8.Visible := true;
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
var
   insert, item, biggest: string;
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
      begin
         StatusBar1.Panels[0].Text := ComboBox1.Items[ComboBox1.ItemIndex];
         if ComboBox1.ItemIndex = 0 then
            SynEdit1.Highlighter := nil
         else
         begin
            SynEdit1.Highlighter :=
               TSynCustomHighlighter(Form3.ListHighlighters.Objects[ComboBox1.ItemIndex - 1]);
            Form3.FileToAC(insert, item, biggest,
               Form3.AC_Files[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)]);
            SynAutoComplete.AutoCompleteList.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+'Highlighters\'+Form3.AutoCompletion[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)]);
            with SynCompletionProposal1 do
            begin
               TriggerChars :=
                  Form3.TriggerChars[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)];
               Columns[0].BiggestWord := biggest;
               InsertList.Text := insert;
               ItemList.Text := item;
               Title :=
                  Form3.AC_Files[Form3.ListHighlighters.IndexOf(SynEdit1.Highlighter.LanguageName)];
               ResetAssignedList;
            end;
         end;
      end;
   end;
end;

procedure TForm1.Dfaire1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.Undo;
end;

procedure TForm1.Refaire1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.Redo;
end;

procedure TForm1.Couper1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.CutToClipboard;
end;

procedure TForm1.Copier1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.CopyToClipboard;
end;

procedure TForm1.Coller1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.PasteFromClipboard;
end;

procedure TForm1.Supprimer1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.ClearSelection;
end;

procedure TForm1.outslectionner1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.SelectAll;
end;

procedure TForm1.CouperPressepapier1Click(Sender: TObject);
var
   c: TClipboard;
begin
   if FicheEditeur then
   begin
      c := TClipboard.Create;
      try
         c.AsText := c.AsText + TForm2(ActiveMDIChild).SynEdit1.SelText;
      finally
         c.Free;
      end;
      TForm2(ActiveMDIChild).SynEdit1.ClearSelection;
   end;
end;

procedure TForm1.CopierPressepapiers1Click(Sender: TObject);
var
   c: TClipboard;
begin
   if FicheEditeur then
   begin
      c := TClipboard.Create;
      try
         c.AsText := c.AsText + TForm2(ActiveMDIChild).SynEdit1.SelText;
      finally
         c.Free;
      end;
   end;
end;

procedure TForm1.VoirlePressepapiers1Click(Sender: TObject);
var
   text: array[0..999] of char;
   c: TClipboard;
begin
   c := TClipboard.Create;
   try
      if c.HasFormat(CF_TEXT) then
      begin
         c.GetTextBuf(text, length(text));
         MessageBoxA(Handle, Pchar(string(text)), Pchar('All4Cod - ' +
            GetText('CPB')), 0 + MB_ICONINFORMATION + 0);
      end
      else
      begin
         if MessageBoxA(Handle, Pchar(GetText('8') + #13 + GetText('9') + #13 +
            GetText('10')), Pchar('All4Cod - ' + GetText('QUESTION')), MB_YESNO +
            MB_ICONQUESTION + 0) = 6 then
         begin
            c.GetTextBuf(text, length(text));
            MessageBoxA(Handle, Pchar(string(text)), Pchar('All4Cod - ' +
               GetText('CPB')), 0 + MB_ICONINFORMATION + 0);
         end;
      end;
   finally
      c.Free;
   end;
end;

procedure TForm1.InsrerDateetHeure1Click(Sender: TObject);
var
   r: string;
begin
   if FicheEditeur then
   begin
      try
         DateTimeToString(r, Form3.LabeledEdit1.Text, Now);
         TForm2(ActiveMDIChild).SynEdit1.SelText := r;
      except
         MessageBoxA(Handle, Pchar(GetText('11')), Pchar('All4Cod - ' +
            GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
      end;
   end;
end;

procedure TForm1.Insrerunfichier1Click(Sender: TObject);
var
   s: TStringList;
begin
   if FicheEditeur then
   begin
      OpenDialog1.Title := GetText('55');
      if OpenDialog1.Execute then
      begin
         s := TStringList.Create;
         try
            s.LoadFromFile(OpenDialog1.FileName);
            TForm2(ActiveMDIChild).SynEdit1.SelText := s.Text;
         finally
            s.Free;
         end;
      end;
   end;
end;

procedure TForm1.Lectureseule1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
      begin
         SynEdit1.ReadOnly := not SynEdit1.ReadOnly;
         if SynEdit1.ReadOnly then
            SynMemo1.Lines.Add(GetText('54'))
         else
            SynMemo1.Lines.Add(GetText('53'));
      end;
   end;
end;

procedure TForm1.Prfrences1Click(Sender: TObject);
begin
   Form3.ShowModal;
end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
   Fermer := true;
   Close;
end;

procedure TForm1.abulationsEspaces1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
         SynEdit1.Text := AnsiReplaceText(SynEdit1.Text, #9, StringOfChar(#32,
            SynEdit1.TabWidth));
      ModifToTrue;
   end;
end;

procedure TForm1.EspacesTabulations1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
         SynEdit1.Text := AnsiReplaceText(SynEdit1.Text, StringOfChar(#32,
            SynEdit1.TabWidth), #9);
      ModifToTrue;
   end;
end;

procedure TForm1.OEMAnsi1Click(Sender: TObject);
var
   ms: TMemoryStream;
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
      begin
         ms := TmemoryStream.Create;
         try
            SynEdit1.Lines.SaveToStream(ms);
            ms.Position := 0;
            OemToCharBuff(ms.Memory, ms.Memory, ms.Size);
            SynEdit1.Lines.LoadFromStream(ms);
         finally
            ms.Free
         end;
      end;
      ModifToTrue;
   end;
end;

procedure TForm1.AnsiOEM1Click(Sender: TObject);
var
   ms: TMemoryStream;
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
      begin
         ms := TmemoryStream.Create;
         try
            SynEdit1.Lines.SaveToStream(ms);
            ms.Position := 0;
            CharToOemBuff(ms.Memory, ms.Memory, ms.Size);
            SynEdit1.Lines.LoadFromStream(ms);
         finally
            ms.Free
         end;
      end;
      ModifToTrue;
   end;
end;

procedure TForm1.Inverser1Click(Sender: TObject);
var
   i: integer;
   tmp: string;
   p1, p2: TBufferCoord;
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild).SynEdit1 do
      begin
         p1 := BlockBegin;
         p2 := BlockEnd;
         tmp := SelText;
         for i := 1 to Length(tmp) do
            if CharIsUpper(tmp[i]) then
               tmp[i] := LowerCase(Tmp[i])[1]
            else if CharIsLower(tmp[i]) then
               tmp[i] := UpCase(tmp[i]);
         SelText := tmp;
         BlockBegin := p1;
         BlockEnd := p2;
      end;
      ModifToTrue;
   end;
end;

procedure TForm1.Capitaliser1Click(Sender: TObject);
var
   BlBegin, BlEnd: TBufferCoord;
   i, l: integer;
   tmpSel: string;
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild).SynEdit1 do
      begin
         if SelLength > 0 then
         begin
            BlBegin := BlockBegin;
            BlEnd := BlockEnd;
            l := Length(SelText);
            tmpSel := SelText;
            i := 1;
            while i < l do
            begin
               if IsWhiteSpaceEx(tmpSel[i]) then
               begin
                  Inc(i);
                  while IsWhiteSpaceEx(tmpSel[i]) do
                     Inc(i);
                  if not CharIsUpper(tmpSel[i]) then
                     tmpSel[i] := UpCase(tmpSel[i]);
               end
               else
               begin
                  Inc(i);
                  if not CharIsLower(tmpSel[i]) then
                     tmpSel[i] := UpCase(tmpSel[i]);
               end;
            end;
            if CharIsLower(tmpSel[1]) then
               tmpSel[1] := UpCase(tmpSel[1]);
            SelText := tmpSel;
            BlockBegin := BlBegin;
            BlockEnd := BlEnd;
         end;
      end;
      ModifToTrue;
   end;
end;

procedure TForm1.SlectionMajuscule1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
         SynEdit1.SelText := UpperCase(SynEdit1.SelText);
      ModifToTrue;
   end;
end;

procedure TForm1.SlectionMinuscule1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
         SynEdit1.SelText := LowerCase(SynEdit1.SelText);
      ModifToTrue;
   end;
end;

procedure TForm1.outMajuscule1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
         SynEdit1.Text := UpperCase(SynEdit1.Text);
      ModifToTrue;
   end;
end;

procedure TForm1.outMinuscule1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      with TForm2(ActiveMDIChild) do
         SynEdit1.Text := LowerCase(SynEdit1.Text);
      ModifToTrue;
   end;
end;

procedure TForm1.Augmenterlindentation1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      TForm2(ActiveMDIChild).SynEdit1.ExecuteCommand(610, #0, nil);
      ModifToTrue;
   end;
end;

procedure TForm1.Diminuerlindentation1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      TForm2(ActiveMDIChild).SynEdit1.ExecuteCommand(611, #0, nil);
      ModifToTrue;
   end;
end;

procedure TForm1.Sauvegarder1Click(Sender: TObject);
var
   s: TStringList;
begin
   if FicheEditeur then
   begin
      SaveDialog1.Title := GetText('52');
      if SaveDialog1.Execute then
      begin
         s := TStringList.Create;
         try
            s.Text := TForm2(ActiveMDIChild).SynEdit1.SelText;
            s.SaveToFile(SaveDialog1.FileName);
         finally
            s.Free;
         end;
      end;
   end;
end;

procedure TForm1.DosWindows1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      TSynEditStringList(TForm2(ActiveMDIChild).SynEdit1.Lines).FileFormat :=
         sffDos;
      ModifToTrue
   end;
end;

procedure TForm1.Unix1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      TSynEditStringList(TForm2(ActiveMDIChild).SynEdit1.Lines).FileFormat :=
         sffUnix;
      ModifToTrue;
   end;
end;

procedure TForm1.Mac1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      TSynEditStringList(TForm2(ActiveMDIChild).SynEdit1.Lines).FileFormat :=
         sffMac;
      ModifToTrue;
   end;
end;

procedure TForm1.Ordrecroissant1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      Trier(TForm2(ActiveMDIChild).SynEdit1.Lines, true);
      TForm2(ActiveMDIChild).SynEdit1.Repaint;
      ModifToTrue;
   end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if Form3.CheckBox43.Checked and not (Fermer) then
   begin
      Cacher;
      CanClose := false;
   end
   else
   begin
      if Form3.CheckBox6.Checked then
         Canclose := MessageBoxA(handle, Pchar(GetText('12')), Pchar('All4Cod - '
            + GetText('QUESTION')), MB_YESNO + MB_ICONQUESTION + 0) = 6
      else
         Canclose := true;
      if CanClose then
         Form1.SynSpellCheck1.OnDictClose := nil
      else
         Fermer := false;
   end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
   i: integer;
begin
   DeleteFile(IncludeTrailingPathDelimiter(GetTempDossier) + 'default.lng');
   if Projet.Ouvert then Projet.Fermer;
   SynSpellCheck1.CloseDictionary;
   if length(Form1.Plugins) > 0 then
      for i := 0 to length(Form1.Plugins) - 1 do
         Form1.Plugins[i].Close;
   if Length(Plugins) > 0 then
   begin
      for i := 0 to length(Plugins) - 1 do
         FreeLibrary(Plugins[i].h);
      Setlength(Plugins, 0);
   end;
   Form3.SauveOptions;
end;

procedure TForm1.Ordredcroissant1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      Trier(TForm2(ActiveMDIChild).SynEdit1.Lines, false);
      TForm2(ActiveMDIChild).SynEdit1.Repaint;
      ModifToTrue;
   end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   if MessageBoxA(Handle, Pchar(GetText('13')), Pchar('All4Cod - ' +
      GetText('SAVEAUTO') + ' (' + IntToStr(Form3.SpinEdit1.Value) + ')'), MB_YESNO
      + MB_ICONQUESTION + 0) = 6 then
      outenregsitrer1Click(nil);
end;

procedure TForm1.Standard1Click(Sender: TObject);
begin
   Form3.CheckBox8.Checked := not Form3.CheckBox8.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Edition2Click(Sender: TObject);
begin
   Form3.CheckBox9.Checked := not Form3.CheckBox9.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Langage1Click(Sender: TObject);
begin
   Form3.CheckBox10.Checked := not Form3.CheckBox10.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Affichage2Click(Sender: TObject);
begin
   Form3.CheckBox11.Checked := not Form3.CheckBox11.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Recherche1Click(Sender: TObject);
begin
   Form3.CheckBox12.Checked := not Form3.CheckBox12.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Outils2Click(Sender: TObject);
begin
   Form3.CheckBox13.Checked := not Form3.CheckBox13.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Fentre2Click(Sender: TObject);
begin
   Form3.CheckBox14.Checked := not Form3.CheckBox14.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.outafficher1Click(Sender: TObject);
begin
   Form3.CheckBox8.Checked := true;
   Form3.CheckBox9.Checked := true;
   Form3.CheckBox10.Checked := true;
   Form3.CheckBox11.Checked := true;
   Form3.CheckBox12.Checked := true;
   Form3.CheckBox13.Checked := true;
   Form3.CheckBox14.Checked := true;
   Form3.CheckBox41.Checked := true;
   Form3.UpdateOptions;
end;

procedure TForm1.outmasquer1Click(Sender: TObject);
begin
   Form3.CheckBox8.Checked := false;
   Form3.CheckBox9.Checked := false;
   Form3.CheckBox10.Checked := false;
   Form3.CheckBox11.Checked := false;
   Form3.CheckBox12.Checked := false;
   Form3.CheckBox13.Checked := false;
   Form3.CheckBox14.Checked := false;
   Form3.CheckBox41.Checked := false;
   Form3.UpdateOptions;
end;

procedure TForm1.Explorateur1Click(Sender: TObject);
begin
   Form3.CheckBox15.Checked := not Form3.CheckBox15.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Modlesdecodes1Click(Sender: TObject);
begin
   Form3.CheckBox16.Checked := not Form3.CheckBox16.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Police1Click(Sender: TObject);
begin
   Form3.TreeView1.Items[1].Selected := true;
   Form3.TreeView1Click(nil);
   Form3.ShowModal;
end;

procedure TForm1.Ligneactive1Click(Sender: TObject);
begin
   Form3.CheckBox27.Checked := not Form3.CheckBox27.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Retourlaligne1Click(Sender: TObject);
begin
   Form3.CheckBox28.Checked := not Form3.CheckBox28.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Numrodeligne1Click(Sender: TObject);
begin
   Form3.CheckBox17.Checked := not Form3.CheckBox17.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Caractresspciaux1Click(Sender: TObject);
begin
   Form3.CheckBox29.Checked := not Form3.CheckBox29.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.AutoCompltiondesparenthses1Click(Sender: TObject);
begin
   Form3.CheckBox30.Checked := not Form3.CheckBox30.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
   if ListBox1.ItemIndex <> -1 then
      ListBox2.Items.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Models\' + ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TForm1.ListBox2DblClick(Sender: TObject);
begin
   if (ListBox2.ItemIndex <> -1) and FicheEditeur then
      TForm2(ActiveMDIChild).SynEdit1.SelText :=
         ListBox2.Items[ListBox2.ItemIndex];
end;

procedure TForm1.Prcdente1Click(Sender: TObject);
begin
   Previous;
end;

procedure TForm1.Suivante1Click(Sender: TObject);
begin
   Next;
end;

procedure TForm1.Cascade1Click(Sender: TObject);
begin
   Cascade;
end;

procedure TForm1.Mozaque1Click(Sender: TObject);
begin
   TileMode := tbHorizontal;
   Tile;
end;

procedure TForm1.Mozaqueverticale1Click(Sender: TObject);
begin
   TileMode := tbVertical;
   Tile;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
   ShellTreeView1.AutoContextMenus := CheckBox1.Checked;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
   if CheckBox2.Checked then
      ShellTreeView1.ObjectTypes := ShellTreeView1.ObjectTypes + [otHidden]
   else
      ShellTreeView1.ObjectTypes := ShellTreeView1.ObjectTypes - [otHidden];
end;

procedure TForm1.Panel1CanResize(Sender: TObject; var NewWidth,
   NewHeight: Integer; var Resize: Boolean);
begin
   Button3.Width := NewWidth - 11;
   Button4.Width := (NewWidth - 13) shr 1;
   Button6.Left := Button4.Width + 4;
   Button6.Width := Button4.Width;
   Resize := true;
   ShellComboBox1.Width := ShellTreeView1.Width;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   RichEdit1.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   OpenDialog1.Title := GetText('83');
   if OpenDialog1.Execute then
   begin
      RichEdit1.Clear;
      RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
   end;
end;

procedure TForm1.Commenter1Click(Sender: TObject);
var
   commentaire: string[20];
begin
   if FicheEditeur then
   begin
      if TForm2(ActiveMDIChild).SynEdit1.Highlighter <> nil then
      begin
         commentaire :=
            Form3.Commentaires[Form3.ListHighlighters.IndexOf(TForm2(ActiveMDIChild).SynEdit1.Highlighter.LanguageName)];
         TForm2(ActiveMDIChild).SynEdit1.SelText := LeftStr(commentaire,
            pos('|', commentaire) - 1) + TForm2(ActiveMDIChild).SynEdit1.SelText +
            RightStr(commentaire, length(commentaire) - pos('|', commentaire));
         ModifToTrue;
      end;
   end;
end;

procedure TForm1.Dcommenter1Click(Sender: TObject);
var
   commentaire: string[20];
   part1, part2: string[10];
begin
   if FicheEditeur then
   begin
      if (TForm2(ActiveMDIChild).SynEdit1.Highlighter <> nil) then
      begin
         commentaire :=
            Form3.Commentaires[Form3.ListHighlighters.IndexOf(TForm2(ActiveMDIChild).SynEdit1.Highlighter.LanguageName)];
         part1 := LeftStr(commentaire, pos('|', commentaire) - 1);
         part2 := RightStr(commentaire, length(commentaire) - pos('|',
            commentaire));
         TForm2(ActiveMDIChild).SynEdit1.SelText :=
            Copy(TForm2(ActiveMDIChild).SynEdit1.SelText, Length(part1) + 1,
            Length(TForm2(ActiveMDIChild).SynEdit1.SelText) - length(part1) -
            length(part2) + 1);
         ModifToTrue;
      end;
   end;
end;

procedure TForm1.Editerlesfichierssystmes1Click(Sender: TObject);
var
   i: integer;
begin
   for i := 0 to Form3.ListBox1.Count - 1 do
      Ouvrir(Form3.ListBox1.Items[i], false);
end;

procedure TForm1.Lefichierencours1Click(Sender: TObject);
begin
   if FicheEditeur then
      with TForm2(ActiveMDIChild) do
         if FileExists(Nom) then
         begin
            SynEdit1.Lines.LoadFromFile(Nom);
            Modifier := false;
            StatusBar1.Panels[2].Text := '';
         end;
end;

procedure TForm1.outlesfichiersouverts1Click(Sender: TObject);
var
   i: integer;
begin
   for i := 0 to MDIChildCount - 1 do
   begin
      if FicheEditeur(i) then
      begin
         with TForm2(MDIChildren[i]) do
            if FileExists(Nom) then
            begin
               SynEdit1.Lines.LoadFromFile(Nom);
               Modifier := false;
               StatusBar1.Panels[2].Text := '';
            end;
      end;
   end;
end;

procedure TForm1.outeffacer1Click(Sender: TObject);
var
   i: integer;
begin
   for i := 0 to 9 do
      MainMenu1.Items[0].Items[2].Items[i].Caption := '';
   for i := 0 to 9 do
      PopupMenu1.Items[i].Caption := '';
end;

procedure TForm1.Aucun1Click(Sender: TObject);
var
   f: string;
begin
   f := AnsiReplaceText(TMenuItem(Sender).Caption, '&', '');
   if FileExists(f) and (f <> '') then
      Ouvrir(f, false);
end;

procedure TForm1.Aucun11Click(Sender: TObject);
begin
   Aucun1Click(Sender);
end;

procedure TForm1.Compiler1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      Form3.UpdateVariables;
      if TForm2(ActiveMDIChild).Projet and Projet.Ouvert then
      begin
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('51'));
         if not (FileExists(PrepareCommande(Projet.Options.Compile_exe))) then
         begin
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('50'));
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add('');
            exit;
         end;
         if (DosCommand1.Active or not (Commande_Terminer)) then
         begin
            MessageBoxA(Handle, Pchar(GetText('15')), Pchar('All4Cod - ' +
               GetText('ERROR')), MB_OK + MB_ICONINFORMATION + 0);
            exit;
         end;
         ConfigTDosCommand(true);
      end
      else
      begin
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('51'));
         if not (FileExists(PrepareCommande(Form3.Edit1.Text))) then
         begin
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('50'));
      TForm2(ActiveMDIChild).SynMemo1.Lines.Add('');
            exit;
         end;
         if TForm2(ActiveMDIChild).Nom = '' then
         begin
            MessageBoxA(Handle, Pchar(GetText('14')), Pchar('All4Cod - ' +
               GetText('ERROR')), MB_OK + MB_ICONINFORMATION + 0);
            exit;
         end;
         if TForm2(ActiveMDIChild).Modifier then
            TForm2(ActiveMDIChild).Enregistrer;
         if (DosCommand1.Active or not (Commande_Terminer)) then
         begin
            MessageBoxA(Handle, Pchar(GetText('15')), Pchar('All4Cod - ' +
               GetText('ERROR')), MB_OK + MB_ICONINFORMATION + 0);
            exit;
         end;
         ConfigTDosCommand(false);
      end;
      Commande_Terminer := false;
      DosCommand1.Execute;
   end;
end;

procedure TForm1.DosCommand1Terminated(Sender: TObject;
   ExitCode: Cardinal);
begin
   if FicheEditeur then
   begin
      TForm2(ActiveMDIChild).SynMemo1.Lines.Text :=
         DosStrToWinStrW(TForm2(ActiveMDIChild).SynMemo1.Lines.Text);
      TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('49'));
      TForm2(ActiveMDIChild).SynMemo1.Lines.Add('');
      Commande_Terminer := true;
      DosCommand1.Stop;
   end;
end;

procedure TForm1.Excuter2Click(Sender: TObject);
const
   TabShowWindows: array[0..3] of integer = (SW_HIDE, SW_SHOWMAXIMIZED,
      SW_SHOWMINIMIZED, SW_SHOWNORMAL);
begin
   if FicheEditeur then
   begin
      Form3.UpdateVariables;
      if TForm2(ActiveMDIChild).Projet and Projet.Ouvert then
      begin
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('46'));
         if not (FileExists(PrepareCommande(Projet.Options.Execute_exe))) then
         begin
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('45'));
                  TForm2(ActiveMDIChild).SynMemo1.Lines.Add('');
            exit;
         end;
         if (DosCommand1.Active or not (Commande_Terminer)) then
         begin
            MessageBoxA(Handle, Pchar(GetText('15')), Pchar('All4Cod - ' +
               GetText('ERROR')), MB_OK + MB_ICONINFORMATION + 0);
            exit;
         end;
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('44') + ' : ' +
            PrepareCommande(Projet.Options.Execute_exe) + ' ' + PrepareCommande(Projet.Options.Execute_param));
         ShellExecute(0, 'open', PChar(PrepareCommande(Projet.Options.Execute_exe)),
            PChar(PrepareCommande(Projet.Options.Execute_param)), nil,
            TabShowWindows[Form3.ComboBox10.ItemIndex]); //
      end
      else
      begin
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('46'));
         if not (FileExists(PrepareCommande(Form3.Edit7.Text))) then
         begin
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('45'));
                  TForm2(ActiveMDIChild).SynMemo1.Lines.Add('');
            exit;
         end;
         if TForm2(ActiveMDIChild).Nom = '' then
         begin
            MessageBoxA(Handle, Pchar(GetText('14')), Pchar('All4Cod - ' +
               GetText('ERROR')), MB_OK + MB_ICONINFORMATION + 0);
            exit;
         end;
         if TForm2(ActiveMDIChild).Modifier then
            TForm2(ActiveMDIChild).Enregistrer;
         if (DosCommand1.Active or not (Commande_Terminer)) then
         begin
            MessageBoxA(Handle, Pchar(GetText('15')), Pchar('All4Cod - ' +
               GetText('ERROR')), MB_OK + MB_ICONINFORMATION + 0);
            exit;
         end;
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('44') + ' : ' +
            PrepareCommande(Form3.Edit7.Text) + ' ' + PrepareCommande(Form3.Edit8.Text));
         ShellExecute(0, 'open', PChar(PrepareCommande(Form3.Edit7.Text)),
            PChar(PrepareCommande(Form3.Edit8.Text)), nil,
            TabShowWindows[Form3.ComboBox10.ItemIndex]);
      end;
   end;
end;

procedure TForm1.outfaire1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      Compiler1Click(nil);
      while not (Commande_Terminer) do
         Application.ProcessMessages;
      if stopper then
         Exit;
      Excuter2Click(nil);
   end;
end;

procedure TForm1.Stopper1Click(Sender: TObject);
begin
   DosCommand1.Stop;
   Stopper := true;
   Commande_Terminer := true;
end;

procedure TForm1.AproposdePitiPad1Click(Sender: TObject);
var
   f: TForm16;
begin
   f := TForm16.Create(Self);
   try
      f.Label3.Caption := GetVersion;
      f.ShowModal;
   finally
      f.free;
   end;
end;

procedure TForm1.Envoyerunrapportderreur1Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open',
      PChar('mailto:admin@OpenSofts.info?subject=All4Cod ' + GetVersion +
      ' : Rapport d''erreur(s)&body=Erreur(s) :'), nil, nil, SW_SHOW);
end;

procedure TForm1.Aide1Click(Sender: TObject);
begin
   MessageBoxA(Handle, Pchar(GetText('16') + #13 + GetText('17') +
      ' : http://www.OpenSofts.info'), Pchar('All4Cod - ' + GetText('HELP')), 0 +
      MB_ICONINFORMATION + 0);
end;

procedure TForm1.Misejour1Click(Sender: TObject);
var
   f: tform15;
begin
   f := TForm15.Create(self);
   try
      f.Reset;
      f.ShowModal;
   finally
      f.Free;
   end;
end;

procedure TForm1.CommandeDos1Click(Sender: TObject);
begin
   if GetEnvironmentVariable('COMSPEC') <> '' then
      ShellExecute(handle, 'open', PChar(GetEnvironmentVariable('COMSPEC')),
         nil, nil, SW_NORMAL);
end;

procedure TForm1.EmpreintedigitaleMD51Click(Sender: TObject);
var
   f: tform5;
begin
   f := TForm5.Create(self);
   try
      f.ListBox1.Items := ListBox3.Items;
      f.UpdateEnable;
      f.ShowModal;
   finally
      f.free;
   end;
end;

procedure TForm1.Conversiondebases1Click(Sender: TObject);
var
   f: TForm6;
begin
   f := TForm6.Create(self);
   try
      f.ShowModal;
   finally
      f.Free;
   end;
end;

procedure TForm1.Couleurs1Click(Sender: TObject);
var
   f: TForm7;
begin
   f := TForm7.Create(self);
   try
      f.ShowModal;
   finally
      f.Free;
   end;
end;

procedure TForm1.Evaluateurdexpressions1Click(Sender: TObject);
var
   f: tform8;
begin
   f := TForm8.Create(self);
   try
      f.ShowModal;
   finally
      f.Free;
   end;
end;

procedure TForm1.Correcteurdorthographe1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      if SynSpellCheck1.OpenDictionary then
      begin
         SynSpellCheck1.Editor := TForm2(ActiveMDIChild).SynEdit1;
         SynSpellCheck1.SpellCheck;
      end
      else
         MessageBoxA(Handle, Pchar(GetText('18')), Pchar('All4Cod - ' +
            GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
   end;
end;

procedure TForm1.SynSpellCheck1DictClose(Sender: TObject);
begin
   if SynSpellCheck1.Dictionary <> '' then
      MessageBoxA(Handle, Pchar(GetText('19') + ' ' +
         ExtractFileName(SynSpellCheck1.Dictionary) + ' ' + GetText('20')),
         Pchar('All4Cod - ' + GetText('DICO')), 0 + MB_ICONINFORMATION + 0);
end;

procedure TForm1.SynSpellCheck1DictLoad(Sender: TObject);
begin
   MessageBoxA(Handle, Pchar(GetText('19') + ' ' +
      ExtractFileName(SynSpellCheck1.Dictionary) + ' ' + GetText('21')),
      Pchar('All4Cod - ' + GetText('DICO')), 0 + MB_ICONINFORMATION + 0);
end;

procedure TForm1.SynSpellCheck1Done(Sender: TObject);
begin
   MessageBoxA(Handle, Pchar(GetText('22')), Pchar('All4Cod - ' +
      GetText('CORR')), 0 + MB_ICONINFORMATION + 0);
end;

procedure TForm1.SynSpellCheck1CheckWord(Sender: TObject; AWord: string;
   ASuggestions: TStringList; var ACorrectWord: string;
   var AAction: Integer; const AUndoEnabled: Boolean);
var
   f: tform9;
begin
   f := TForm9.Create(self);
   try
      f.Caption := f.Dico + ' : ' + SynSpellCheck1.Language.Name + '   ' +
         f.nbmots + ' : ' + IntToStr(SynSpellCheck1.GetWordCount);
      f.Label1.Caption := AWord;
      f.ListBox1.Items.Assign(ASuggestions);
      f.Edit1.Text := AWord;
      case f.ShowModal of
         mrOK:
            begin
               AcorrectWord := f.Edit1.Text;
               AAction := ACTION_CORRECT;
            end;
         mrAbort: AAction := ACTION_ABORT;
         mrNo: AAction := ACTION_SKIP;
         mrNoToAll: AAction := ACTION_SKIPALL;
         mrAll: AAction := ACTION_ADD;
         mrYesToAll:
            begin
               AcorrectWord := f.Edit1.Text;
               AAction := ACTION_ADD and ACTION_CORRECT;
            end;
      end;
   finally
      f.Free;
   end;
end;

procedure TForm1.SynSpellCheck1Abort(Sender: TObject);
begin
   MessageBoxA(Handle, Pchar(GetText('23')), Pchar('All4Cod - ' +
      GetText('CORR')), 0 + MB_ICONINFORMATION + 0);
end;

procedure TForm1.ableASCII1Click(Sender: TObject);
begin
   Form3.CheckBox34.Checked := not Form3.CheckBox34.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
   Rect: TRect; State: TGridDrawState);
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
         DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), -1, Rect, DT_CENTER or
            DT_NOPREFIX or DT_VCENTER or DT_SINGLELINE);
      end;
end;

procedure TForm1.Rechercher1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      if TForm2(ActiveMDIChild).SynEdit1.SelAvail then
         FindDialog1.FindText :=
            TForm2(ActiveMDIChild).SynEdit1.GetWordAtRowCol(TForm2(ActiveMDIChild).SynEdit1.CaretXY);
      FindDialog1.Execute;
   end;
end;

function FindOptionsToSearchOptions(const FindOptions: TFindOptions):
   TSynSearchOptions;
begin
   Result := [];
   if frMatchCase in FindOptions then
      Include(Result, ssoMatchCase);
   if frWholeWord in FindOptions then
      Include(Result, ssoWholeWord);
   if not (frDown in FindOptions) then
      Include(Result, ssoBackwards);
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
begin
   if FicheEditeur then
   begin
      FindDialog1.CloseDialog;
      if TForm2(ActiveMDIChild).SynEdit1.SearchReplace(FindDialog1.FindText, '',
         FindOptionsToSearchOptions(FindDialog1.Options)) = 0 then
         MessageDlg(Format(GetText('24') + ' ' + '''%s''' + ' ' + GetText('25'),
            [FindDialog1.FindText]), mtInformation, [mbYes], 0);
   end;
end;

procedure TForm1.Occurencesuivante1Click(Sender: TObject);
begin
   if FindDialog1.FindText = '' then
      Rechercher1Click(nil)
   else
      FindDialog1Find(FindDialog1);
end;

procedure TForm1.Occurenceprcdente1Click(Sender: TObject);
begin
   if FindDialog1.FindText = '' then
      Rechercher1Click(nil)
   else
   begin
      if frDown in FindDialog1.Options then
         FindDialog1.Options := FindDialog1.Options - [frDown]
      else
         FindDialog1.Options := FindDialog1.Options + [frDown];
      FindDialog1Find(FindDialog1);
   end;
end;

procedure TForm1.Remplacer1Click(Sender: TObject);
begin
   if FicheEditeur then
      ReplaceDialog1.Execute;
end;

procedure TForm1.ReplaceDialog1Find(Sender: TObject);
begin
   if FicheEditeur then
      if TForm2(ActiveMDIChild).SynEdit1.SearchReplace(FindDialog1.FindText, '',
         FindOptionsToSearchOptions(FindDialog1.Options)) = 0 then
         MessageDlg(Format(GetText('24') + ' ' + '''%s''' + ' ' + GetText('25'),
            [FindDialog1.FindText]), mtInformation, [mbYes], 0);
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
var
   Bol: Boolean;
begin
   if FicheEditeur then
   begin
      if not (frMatchCase in ReplaceDialog1.Options) then
         Bol := AnsiCompareText(TForm2(ActiveMDIChild).SynEdit1.SelText,
            ReplaceDialog1.FindText) = 0
      else
         Bol := TForm2(ActiveMDIChild).SynEdit1.SelText = ReplaceDialog1.FindText;
      if Bol then
         TForm2(ActiveMDIChild).SynEdit1.SelText := ReplaceDialog1.ReplaceText;
      if TForm2(ActiveMDIChild).SynEdit1.SearchReplace(ReplaceDialog1.FindText, '',
         FindOptionsToSearchOptions(ReplaceDialog1.Options)) = 0 then
         MessageDlg(Format(GetText('24') + ' ' + '''%s''' + ' ' + GetText('25'),
            [ReplaceDialog1.FindText]), mtInformation, [mbYes], 0)
      else if frReplaceAll in ReplaceDialog1.Options then
      begin
         ReplaceDialog1.CloseDialog;
         repeat
            TForm2(ActiveMDIChild).SynEdit1.SelText := ReplaceDialog1.ReplaceText;
         until
            TForm2(ActiveMDIChild).SynEdit1.SearchReplace(ReplaceDialog1.FindText, '',
            FindOptionsToSearchOptions(ReplaceDialog1.Options)) = 0;
      end;
   end;
end;

procedure TForm1.Allerlaligne1Click(Sender: TObject);
var
   f: tform10;
begin
   if FicheEditeur then
   begin
      f := TForm10.Create(self);
      try
         f.LabeledEdit1.Text :=
            IntToStr(TForm2(Form1.ActiveMDIChild).SynEdit1.CaretY);
         if f.ShowModal = mrOK then
         try
            TForm2(Form1.ActiveMDIChild).SynEdit1.CaretY :=
               StrToInt(f.LabeledEdit1.Text);
         except
         end;
      finally
         f.Free;
      end;
   end;
end;

procedure TForm1.Signet02Click(Sender: TObject);
begin
   if FicheEditeur and Signets[TMenuItem(Sender).Tag].Existe then
      TForm2(ActiveMDIChild).SynEdit1.CaretXY :=
         Signets[TMenuItem(Sender).Tag].Coord;
end;

procedure TForm1.Signet01Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      Signets[TMenuItem(Sender).Tag].Existe := true;
      Signets[TMenuItem(Sender).Tag].Coord :=
         TForm2(ActiveMDIChild).SynEdit1.CaretXY;
      MainMenu1.Items[3].Items[7].Items[TMenuItem(Sender).Tag].Caption := 'L :'
         + IntToStr(Signets[TMenuItem(Sender).Tag].Coord.Line) + '  C :' +
      IntToStr(Signets[TMenuItem(Sender).Tag].Coord.Char);
      MainMenu1.Items[3].Items[8].Items[TMenuItem(Sender).Tag].Caption :=
         MainMenu1.Items[3].Items[7].Items[TMenuItem(Sender).Tag].Caption;
      PopupMenu4.Items[3].Items[TMenuItem(Sender).Tag].Caption := 'L :' +
         IntToStr(Signets[TMenuItem(Sender).Tag].Coord.Line) + '  C :' +
      IntToStr(Signets[TMenuItem(Sender).Tag].Coord.Char);
      PopupMenu4.Items[4].Items[TMenuItem(Sender).Tag].Caption :=
         PopupMenu4.Items[3].Items[TMenuItem(Sender).Tag].Caption;
   end;
end;

procedure TForm1.Effacerlessignets1Click(Sender: TObject);
var
   i: integer;
begin
   for i := 0 to 9 do
   begin
      Signets[i].Existe := false;
      MainMenu1.Items[3].Items[7].Items[i].Caption := GetText('80') + ' ' +
         IntToStr(i);
      MainMenu1.Items[3].Items[8].Items[i].Caption :=
         MainMenu1.Items[3].Items[7].Items[i].Caption;
      PopupMenu4.Items[3].Items[i].Caption :=
         MainMenu1.Items[3].Items[7].Items[i].Caption;
      PopupMenu4.Items[4].Items[i].Caption :=
         MainMenu1.Items[3].Items[7].Items[i].Caption;
   end;
end;

procedure TForm1.AperuenHTML1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      TForm2(ActiveMDIChild).SynEdit1.Lines.SaveToFile(IncludeTrailingPathDelimiter(ExtractFileDrive(Application.ExeName)) + 'temp.html');
      ShellExecute(handle, 'open',
         PChar(IncludeTrailingPathDelimiter(ExtractFileDrive(Application.ExeName)) +
         'temp.html'), nil, nil, SW_SHOW);
   end;
end;

procedure TForm1.Modledecodes1Click(Sender: TObject);
var
   tmpdir: string;
begin
   if FicheEditeur then
   begin
      tmpdir := SaveDialog1.InitialDir;
      SaveDialog1.InitialDir :=
         IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
         'Models';
      SaveDialog1.Title := GetText('43');
      if SaveDialog1.Execute then
         TForm2(ActiveMDIChild).SynEdit1.Lines.SaveToFile(SaveDialog1.FileName);
      ListBox1.Items :=
         ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'Models', '*.*', false, true);
      ListBox1.ItemIndex := 0;
      ListBox1Click(nil);
      SaveDialog1.InitialDir := tmpdir;
   end;
end;

procedure TForm1.FormatHTML1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).Exporter(TMenuItem(Sender).Tag, true);
end;

procedure TForm1.Configurerlimpression1Click(Sender: TObject);
begin
   Form3.TreeView1.Items[8].Selected := true;
   Form3.TreeView1Click(nil);
   Form3.ShowModal;
end;

procedure TForm1.Imprimer1Click(Sender: TObject);
begin
   if FicheEditeur then
   begin
      if PrintDialog1.Execute then
      begin
         SynEditPrint1.SynEdit := TForm2(ActiveMDIChild).SynEdit1;
         SynEditPrint1.Copies := PrintDialog1.Copies;
         if Form3.CheckBox38.Checked then
            SynEditPrint1.Title := TForm2(ActiveMDIChild).Nom
         else
            SynEditPrint1.Title := TForm2(ActiveMDIChild).Caption;
         SynEditPrint1.Highlighter :=
            TForm2(ActiveMDIChild).SynEdit1.Highlighter;
         SynEditPrint1.PrintRange(PrintDialog1.FromPage, PrintDialog1.ToPage);
      end;
   end;
end;

procedure TForm1.Aperuavantimpression1Click(Sender: TObject);
var
   f: tform11;
begin
   if FicheEditeur then
   begin
      SynEditPrint1.SynEdit := TForm2(ActiveMDIChild).SynEdit1;
      if Form3.CheckBox38.Checked then
         SynEditPrint1.DocTitle := TForm2(ActiveMDIChild).Nom
      else
         SynEditPrint1.DocTitle := TForm2(ActiveMDIChild).Caption;
      SynEditPrint1.Highlighter := TForm2(ActiveMDIChild).SynEdit1.Highlighter;
      SynEditPrint1.Font.Assign(TForm2(ActiveMDIChild).SynEdit1.Font);
      f := TForm11.Create(self);
      try
         f.ShowModal;
      finally
         f.Free;
      end;
   end;
end;

procedure TForm1.Proprits1Click(Sender: TObject);
var
   f: tform12;
begin
   if FicheEditeur then
   begin
      f := TForm12.Create(Self);
      try
         f.Prop(TForm2(Form1.ActiveMDIChild).Nom,
            TForm2(Form1.ActiveMDIChild).SynEdit1);
         f.ShowModal;
      finally
         f.Free;
      end;
   end;
end;

procedure TForm1.Ractualiserlaliste1Click(Sender: TObject);
begin
   ListBox1.Items :=
      ListeDossier(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))
      + 'Models', '*.*', false, true);
end;

procedure TForm1.Editer1Click(Sender: TObject);
begin
   if
      FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
      'Models\' + ListBox1.Items[ListBox1.ItemIndex]) then
      Ouvrir(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
         'Models\' + ListBox1.Items[ListBox1.ItemIndex], false);
end;

procedure TForm1.Signet04Click(Sender: TObject);
begin
   Signet02Click(Sender);
end;

procedure TForm1.Signet03Click(Sender: TObject);
begin
   Signet01Click(sender);
end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
var
   r: TGridRect;
begin
   r.Left := 0;
   r.Right := 2;
   r.Top := Ord(key) + 1;
   r.Bottom := r.Top;
   StringGrid1.Selection := r;
end;

procedure TForm1.ComboBox2Select(Sender: TObject);
begin
   Form3.LoadConfig(TComboBox(Sender).Tag);
end;

procedure TForm1.Configuration1Click(Sender: TObject);
begin
   Form3.CheckBox41.Checked := not Form3.CheckBox41.Checked;
   Form3.UpdateOptions;
end;

procedure TForm1.Quitter2Click(Sender: TObject);
begin
   Fermer := true;
   Close;
end;

procedure TForm1.Restaurer1Click(Sender: TObject);
begin
   Montrer;
end;

procedure TForm1.FormatRTFPressepapiers1Click(Sender: TObject);
begin
   if FicheEditeur then
      TForm2(ActiveMDIChild).Exporter(TMenuItem(Sender).Tag, false);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
   Shell_NotifyIcon(Nim_DELETE, @Tray);
   Projet.destroy;
   Tidy.Destroy;
end;

procedure TForm1.ControlerlecodeHTML1Click(Sender: TObject);
var
   i: integer;
begin
   if FicheEditeur then
   begin
      with Tidy do
      begin
         Input.Assign(TForm2(ActiveMDIChild).SynEdit1.Lines);
         OptionsFile := '';
         Options := 'e';
         case Execute of
            1:
               begin
                  MessageBoxA(Handle, Pchar(GetText('2')), Pchar('All4Cod - ' +
                     GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
                  exit;
               end;
            2:
               begin
                  MessageBoxA(Handle, Pchar(GetText('3') + #13 +
                     IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) +
                     'Tidy\Tidy.exe'), Pchar('All4Cod - ' + GetText('ERROR')), 0 +
                     MB_ICONINFORMATION + 0);
                  exit;
               end;
            3:
               begin
                  MessageBoxA(Handle, Pchar(GetText('4')), Pchar('All4Cod - ' +
                     GetText('ERROR')), 0 + MB_ICONINFORMATION + 0);
                  exit;
               end;
         end;
         for i := 0 to length(Tidy.Errors) - 1 do
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('40') + ' ' +
               IntToStr(i + 1) + ' - ' + IntToStr(Tidy.Errors[i].line) + ':' +
               IntToStr(Tidy.Errors[i].column) + ' - ' + Tidy.Errors[i].text);
         for i := 0 to length(Tidy.Warnings) - 1 do
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('41') + ' ' +
               IntToStr(i + 1) + ' - ' + IntToStr(Tidy.Warnings[i].line) + ':' +
               IntToStr(Tidy.Warnings[i].column) + ' - ' + Tidy.Warnings[i].text);
         for i := 0 to length(Tidy.Infos) - 1 do
            TForm2(ActiveMDIChild).SynMemo1.Lines.Add(GetText('42') + ' ' +
               IntToStr(i + 1) + ' - ' + Tidy.Infos[i]);
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add(IntToStr(length(Tidy.Errors))
            + ' ' + GetText('40') + ' ' + IntToStr(length(Tidy.Warnings)) + ' ' +
            GetText('41') + ' ' + IntToStr(length(Tidy.Infos)) + ' ' +
            GetText('42'));
         TForm2(ActiveMDIChild).SynMemo1.Lines.Add('');
      end;
   end;
end;

procedure TForm1.Cleandocumentnowrapnoindent1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\clean_Document_nowrap_no_indent';
   TidyClean;
end;

procedure TForm1.Cleandocumentnowrap1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\clean_Document_nowrap';
   TidyClean;
end;

procedure TForm1.Cleandocumentquote1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\clean_Document_quote';
   TidyClean;
end;

procedure TForm1.Cleandocumentwrap1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\clean_Document_wrap';
   TidyClean;
end;

procedure TForm1.CleanMicrosoftWord20001Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Microsoft_Word_2000_Document';
   TidyClean;
end;

procedure TForm1.UpgradetoCSS1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Upgrade_To_CSS';
   TidyClean;
end;

procedure TForm1.UpgradetoXHTML1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Upgrade_To_XHTML';
   TidyClean;
end;

procedure TForm1.UpgradetoXML1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Upgrade_To_XML';
   TidyClean;
end;

procedure TForm1.Balisesenmajuscules1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Uppercase_Tags';
   TidyClean;
end;

procedure TForm1.Balisesenminuscules1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Lowercase_Tags';
   TidyClean;
end;

procedure TForm1.CompresserlecodeHTML1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Compress';
   TidyClean;
end;

procedure TForm1.ReformaterlecodeHTML1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Reformat';
   TidyClean;
end;

procedure TForm1.Resteraudessusdelcran1Click(Sender: TObject);
begin
   TMenuItem(Sender).Checked := not (TMenuItem(Sender).Checked);
   ToolButton67.Down := TMenuItem(Sender).Checked;
   if TMenuItem(Sender).Checked then
      SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or
         SWP_NOACTIVATE)
   else
      SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE
         or SWP_NOACTIVATE);
end;

procedure TForm1.ToolButton67Click(Sender: TObject);
begin
   Resteraudessusdelcran1Click(Resteraudessusdelcran1);
end;

procedure TForm1.ListBox3Click(Sender: TObject);
var
   i: integer;
begin
   if ListBox3.ItemIndex <> -1 then
      for i := 0 to MDIChildCount - 1 do
         if MDIChildren[i].Caption = ListBox3.Items[ListBox3.ItemIndex] then
         begin
            MDIChildren[i].BringToFront;
            Exit;
         end;
end;

procedure TForm1.ListBox3DblClick(Sender: TObject);
var
   i: integer;
begin
   if ListBox3.ItemIndex <> -1 then
      for i := 0 to MDIChildCount - 1 do
         if MDIChildren[i].Caption = ListBox3.Items[ListBox3.ItemIndex] then
         begin
            MDIChildren[i].Close;
            Exit;
         end;
end;

procedure TForm1.TabControl1DrawTab(Control: TCustomTabControl;
   TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
   Rect2: TRect;
   titre: string;
begin
   if Active then
   begin
      with Control.Canvas do
      begin
         Brush.Color := RGB(160, 183, 207);
         Pen.Color := clNavy;
         Rectangle(rect.Left, rect.Top, rect.Right, rect.Bottom);
         Font.Style := [fsBold];
      end;
   end
   else
      Control.Canvas.Font.Style := [];

   Rect2 := Rect;
   titre := TabControl1.Tabs[TabIndex];
   SetTextColor(Control.Canvas.Handle, clBlack);
   if Control.Canvas.TextWidth(titre) > 70 then
   begin
      while Control.Canvas.TextWidth(titre + ' ...') > 70 do
         titre := LeftStr(titre, length(titre) - 1);
      titre := titre + ' ...';
   end;
   DrawText(Control.Canvas.Handle, PChar(titre), -1, Rect2,
      DT_CENTER or DT_NOPREFIX or DT_VCENTER or DT_SINGLELINE);
end;

procedure TForm1.Personnalis1Click(Sender: TObject);
begin
   Tidy.OptionsFile := 'Tidy\Custom';
   TidyClean;
end;

procedure TForm1.Cacher1Click(Sender: TObject);
begin
   Cacher;
end;

procedure TForm1.ShellTreeView1DblClick(Sender: TObject);
begin
   Ouvrir(ShellTreeView1.Path, false);
end;

procedure TForm1.Dfaut1Click(Sender: TObject);
begin
   GereLanguageClick(sender);
end;

procedure TForm1.TabControl1Change(Sender: TObject);
var
   i: integer;
begin
   if TabControl1.TabIndex > -1 then
   begin
      for i := 0 to MDIChildCount - 1 do
      begin
         if MDIChildren[i].Caption = ListBox3.Items[TabControl1.TabIndex] then
         begin
            MDIChildren[i].BringToFront;
            Exit;
         end;
      end;
   end;
end;

procedure TForm1.AfficherAll4CodInfos1Click(Sender: TObject);
var i: integer;
   o: boolean;
begin
   o := true;
   for i := 0 to MDIChildCount - 1 do if not (FicheEditeur(i)) then o := false;
   if o then
   begin
      with TForm17.Create(Application) do
      begin
         Caption := 'All4Cod - Infos';
      end;
      ListBox3.Items.Add('All4Cod - Infos');
      TabControl1.Tabs.Add('All4Cod - Infos');
      Panel8.Visible := true;
   end;
end;

procedure TForm1.TreeView1DblClick(Sender: TObject);
var i: integer;
   dejaouvert: boolean;
begin
   if Projet.Ouvert and (TreeView1.Selected.HasAsParent(TreeView1.Items[0].Item[1])) then
   begin
      dejaouvert := false;
      for i := 0 to MDIChildCount - 1 do
      begin
         if FicheEditeur(i) and (Projet.Fichiers[TreeView1.Selected.Index] = TForm2(MDIChildren[i]).Nom) then dejaouvert := true;
      end;
      if not (dejaouvert) then Ouvrir(Projet.Fichiers[TreeView1.Selected.Index], true);
   end;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
var i: integer;
begin
   if Projet.Ouvert and (TreeView1.Selected.HasAsParent(TreeView1.Items[0].Item[1])) then
   begin
      for i := 0 to MDIChildCount - 1 do
      begin
         if FicheEditeur(i) and (Projet.Fichiers[TreeView1.Selected.Index] = TForm2(MDIChildren[i]).Nom) then MDIChildren[i].BringToFront;
      end;
   end;
end;

procedure TForm1.Vide1Click(Sender: TObject);
begin
   if Projet.Ouvert then
   begin
      if MessageBoxA(handle, Pchar(GetText('90')), Pchar('All4Cod - ' + GetText('QUESTION')), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = 6 then
      begin
         Projet.Fermer;
         Projet.NouveauVide;
      end;
   end
   else
   begin
      Projet.Nouveauvide;
   end;
end;

procedure TForm1.Modles1Click(Sender: TObject);
begin
   if Projet.Ouvert then
   begin
      if MessageBoxA(handle, Pchar(GetText('90')), Pchar('All4Cod - ' + GetText('QUESTION')), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = 6 then
      begin
         Projet.Fermer;
         Projet.Nouveau;
      end;
   end
   else
   begin
      Projet.Nouveau;
   end;
end;

procedure TForm1.Ouvrir3Click(Sender: TObject);
var tmp: string;
begin
   if Projet.Ouvert then
   begin
      if MessageBoxA(handle, Pchar(GetText('91')), Pchar('All4Cod - ' + GetText('QUESTION')), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = 6 then
      begin
         Projet.Fermer;
         tmp := OpenDialog1.Filter;
         OpenDialog1.Filter := 'All4Cod Project|*.ap';
         OpenDialog1.Title := GetText('84');
         if OpenDialog1.Execute then Projet.Ouvrir(OpenDialog1.filename);
         Form1.OpenDialog1.Filter := tmp;
      end;
   end
   else
   begin
      tmp := OpenDialog1.Filter;
      OpenDialog1.Filter := 'All4Cod Project|*.ap';
      OpenDialog1.Title := GetText('84');
      if OpenDialog1.Execute then Projet.Ouvrir(OpenDialog1.filename);
      Form1.OpenDialog1.Filter := tmp;
   end;
end;

procedure TForm1.Enregistrer3Click(Sender: TObject);
begin
   if Projet.Ouvert then Projet.Enregistrer;
end;

procedure TForm1.Enregistrersous3Click(Sender: TObject);
begin
   if Projet.Ouvert then Projet.EnregistrerSous;
end;

procedure TForm1.Ajouterauprojet1Click(Sender: TObject);
begin
   if Projet.Ouvert then Projet.AjouterFichiers;
end;

procedure TForm1.Retirerduprojet1Click(Sender: TObject);
begin
   if Projet.Ouvert and (Projet.Fichiers.Count > 0) then Projet.SupprimerFichiers;
end;

procedure TForm1.Fermer4Click(Sender: TObject);
begin
   if Projet.Ouvert then Projet.Fermer;
end;

procedure TForm1.Fichieravecmodle1Click(Sender: TObject);
var f4: TForm4;
begin
   f4 := TForm4.Create(Self);
   try
      f4.ShowModal;
   finally
      f4.Free;
   end;
end;

procedure TForm1.Informationssurleprojet1Click(Sender: TObject);
begin
   if Projet.Ouvert then
   begin
      with TForm20.Create(Application) do
      begin
         ChargeProjet;
         ShowModal;
         free;
      end;
   end;
end;

procedure TForm1.Options1Click(Sender: TObject);
begin
   if Projet.Ouvert then
   begin
      with TForm19.Create(Application) do
      begin
         ChargeProjet;
         if ShowModal = mrOk then Projet.Affiche;
         free;
      end;
   end;
end;

procedure TForm1.Enregistrersous4Click(Sender: TObject);
begin
if FicheEditeur then
begin
   SaveDialog1.Title := GetText('89');
   if SaveDialog1.Execute then
      Tform2(ActiveMdiChild).SynMemo1.Lines.SaveToFile(SaveDialog1.FileName);
end;
end;

procedure TForm1.Effacer1Click(Sender: TObject);
begin
  if FicheEditeur then Tform2(ActiveMdiChild).SynMemo1.Clear;
end;

procedure TForm1.Copier2Click(Sender: TObject);
begin
  if FicheEditeur then Tform2(ActiveMdiChild).SynMemo1.CopyToClipboard;
end;

end.

