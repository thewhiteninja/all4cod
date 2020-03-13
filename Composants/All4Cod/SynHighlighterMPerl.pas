{
  This Highlighter was created from Murad Kakabayev (murYk) <murad_kakabayev@mail.ru>
}

unit SynHighlighterMPerl;

interface

{$I SynEdit.inc}
{$R-,Q-}   // disabled overflow checking (gives AV)

uses
  SysUtils, Windows, Messages, Classes, Controls, Graphics,SynEditTypes,
  SynEditHighlighter;

type
  TTokenKind = (tkNull,tkUnknown,tkSpace,tkComment,tkEND,tkPredefinedVar,tkPod,
                tkString,tkSingleString,tkKeyword,tkPragma,tkInternalFunction,
                tkSymbol,tkVariable,tkSpecSub,tkOperator,tkDecNumber,tkOctNumber,
                tkHexNumber,tkBackQuote,tkHeredoc,tkRe,tkFormatBody,tkBinNumber,
                tkFormatHeader,tkSub,tkClass,tkPackageKeyword,tkSpecialVarInQuoted,tkVarInQuoted,
                tkSubName,tkSubParameters,tkAnonymous,tkSpecSub_Sub,tkInternalFunction_Sub,
                tkClass_Sub,tkKnownPackageName,tkUnknownPackageName,tkOpenCurly,
                tkCloseCurly,tkSubOpenCurly,tkSubProto,tkFileDescriptor);

  TPredefinedRangeStates = (
                rsUnknown,rsM,rsMBracket,rsMSlash,rsQuoted,rsQuotedBracket,
                rsQr,rsQrBracket,rsS_BetweenBrackets,rsS_First,rsS_FirstBracket,
                rsS_Second,rsS_SecondBracket,rsTr_BetweenBrackets,rsTr_First,
                rsTr_FirstBracket,rsTr_Second,rsTr_SecondBracket,rsEndOfData,
                rsPod,rsString,rsSingleString,rsBackQuote,rsEmptyHeredocSingle,
                rsBeforeScript,rsFormatBody,rsQuotedInter,rsQuotedInterBracket,
                rsAfterSub,rsBeforeSubName,rsAfterSubName,rsInsideSubArgs,
                rsAfterSubArgs,rsAfterVariable,rsOnLeftCurly,rsAfterLeftCurly,
                rsonFirstWord,rsAfterPackage,rsAnonymousLeftCurly,rsSubLeftCurly,
                rsEmptyHeredocInter);


const FLAG_HEREDOC         = $80000000;
      FLAG_HEREDOC_NOINTER = $40000000;

type
  TRangeState = cardinal;
  {  // различие для CRC/обычной обработки
     Самый первый бит слева 0 - обычный range
                            1 - heredoc
                            
           Heredoc - 4 ...
                       второй бит 0 - интерполируемый
                                  1 - нет
                       3..8 бит   длина heredoc (0,63)           
                     3..1 - CRC   
                  
     Обычный Range -  4 .... 
                        два младших бита - Step 0..3
                      3 Range 
                      2 Delimiter при quoted operators
                      1 Номер скобок 
  }
  
{    case boolean of
       true  : ( P: pointer);
       false : ( Filler: byte; 
                 C: char; 
                 Range: byte; 
                 Step: byte
               );
    end;
}
  TBracketKind = (bkSquareOpen,bkCurlyOpen,bkRoundOpen,bkAngleOpen,
                  bkSquareClose,bkCurlyClose,bkRoundClose,bkAngleClose,bkUnknown);
  TBracketType = (bOpen,bClose,bUnknown);
  
  TProcTableProc = procedure of object;

  TSynMPerlSynOption  = (poParseAfter__END__,poParseWithXSwitch,poHighlightVariables);
  TSynMPerlSynOptions = set of TSynMPerlSynOption;

  TSynMPerlSyn = class(TSynCustomHighlighter)
  private
    FXOffset      : integer;  
    FCurrentRange : TRangeState;
    FOptions      : TSynMPerlSynOptions;
    fToIdent      : PChar;
    FLine         : PChar;
    FLineOffset   : longint;
    FStringLen    : integer;
    FTokenID      : TTokenKind;
    FTokenPos     : integer;
    FProcTable       : array [#0..#255] of TProcTableProc;
    FRangeProcTable  : array [TPredefinedRangeStates] of TProcTableProc;
    
    FAttributesTable : array [TTokenKind] of TSynHighlighterAttributes;
    
    FSkipHeredocBeforeEOL : boolean;
    HeredocSkipRange : TRangeState;


    FSpecialSUBAttributes       : TSynHighlighterAttributes;
    FUnknownAttributes          : TSynHighlighterAttributes;
    FCommentAttributes          : TSynHighlighterAttributes;
    FPodAttributes              : TSynHighlighterAttributes;
    FVariableAttributes         : TSynHighlighterAttributes;
    FBinNumberAttributes        : TSynHighlighterAttributes;
    FQuoteAttributes            : TSynHighlighterAttributes;
    FOctNumberAttributes        : TSynHighlighterAttributes;
    FPragmaAttributes           : TSynHighlighterAttributes;
    FSpecialVarInQuotedAttributes : TSynHighlighterAttributes;
    FFormatAttributes           : TSynHighlighterAttributes;
    FDecNumberAttributes        : TSynHighlighterAttributes;
    FOperatorAttributes         : TSynHighlighterAttributes;
    FSymbolAttributes           : TSynHighlighterAttributes;
    FInternalFunctionAttributes : TSynHighlighterAttributes;
    FKeywordAttributes          : TSynHighlighterAttributes;
    FVarInQuotedAttributes      : TSynHighlighterAttributes;
    FREAttributes               : TSynHighlighterAttributes;
    FHexNumberAttributes        : TSynHighlighterAttributes;
    FEndOfDataAttributes        : TSynHighlighterAttributes;
    FSpaceAttributes            : TSynHighlighterAttributes;
    FHEREDOCAttributes          : TSynHighlighterAttributes;
    FPredefinedVarAttributes    : TSynHighlighterAttributes;

    function  CRange : TPredefinedRangeStates;
    function  CChar : Char;
    procedure SRange(A : TPredefinedRangeStates);
    function  CStep: byte;
    
    procedure MakeMethodTables;
    procedure UnknownProc;
    procedure SymbolProc;
    procedure OpenCurlyProc;
    procedure CloseCurlyProc;
    procedure NullProc;
    procedure LFProc;
    procedure CRProc;
    procedure SpaceProc;
    procedure CommentProc;
    procedure ProcUnderscore;
    procedure EqualProc;
    procedure ToIdent(Index : integer);
    procedure ToIdentIdent;
    procedure ToIdentIdentSingle;
    procedure EndOfDataProc;
    procedure BeforeScriptProc;
    procedure PodProc;
    procedure LessProc;
    procedure FileDescriptorProc;
    procedure HeredocProc(IsEmptyHeredoc : boolean);
    procedure QuoteProc;
    procedure BackQuoteProc;
    procedure SingleQuoteProc;
    procedure GenQuoteProc;
    procedure AfterSubProc;
    procedure AfterPackageProc;
    procedure AfterLeftCurlyProc;
    procedure OnLeftCurlyProc;
    procedure AfterVariableProc;
    procedure AfterSubNameProc;
    procedure AfterSubArgsProc;
    procedure InsideSubArgsProc;
    procedure OnFirstWordProc;
        
    procedure DefProc; 
    procedure MProc0;  
    procedure HeredocProcTrue;  
    procedure QWProc0;       
    procedure QWInterProc0;  
       
    procedure SubNameProc;    
    procedure OnSubOpenCurlyProc;
    procedure FromLetterProc;
    procedure VarProc;
    procedure AmpersandProc;
    procedure PipeProc;
    procedure ArrayProc;
    procedure HashProc;
    procedure NumberProc;
    procedure MinusProc;
    procedure QProc;
    procedure SlashProc;
    procedure MProc(Step : integer);
    procedure S_BetweenBrackets;
    procedure Tr_BetweenBrackets;
    procedure QWProc( Step : integer);
    procedure QWInterProc( Step : integer);
    function  CheckSharp(Offset : integer) : boolean;
    function  CheckAsterisk : boolean;
    function  IsPreviousBackSlash(Offset : integer) : boolean;
    procedure FormatProc;
    function  RecognizePackageVar : TTokenKind;
    procedure ProcessRefs;
  protected
    function GetIdentChars: TSynIdentChars; override;
    function GetSampleSource: string; override;
  public
    {$IFNDEF SYN_CPPB_1} class {$ENDIF} //mh 2000-07-14
    function GetLanguageName: string; override;
  public
    property  XOptionOffset : integer read FXOFFSET;
    constructor Create(AOwner: TComponent); override;
    function  GetDefaultAttribute(Index: integer): TSynHighlighterAttributes; override;
    function  GetEol: Boolean; override;
    function  GetRange: Pointer; override;
    procedure SetRange(Value: Pointer); override;
    procedure ResetRange; override;
    function  GetToken: String; override;
    function  GetTokenAttribute: TSynHighlighterAttributes; override;
    function  GetTokenKind: integer; override;
    function  GetTokenPos: Integer; override;
    procedure Next; override;
    procedure SetLine(NewValue: String; LineNumber:Integer); override;
    function  RecognizeToken(Token : string) : TTokenKind;
    
  published
    property Options : TSynMPerlSynOptions read FOptions write FOptions;
    property SpecialSUBAttributes: TSynHighlighterAttributes read FSpecialSUBAttributes write FSpecialSUBAttributes;
    property UnknownAttributes: TSynHighlighterAttributes read FUnknownAttributes write FUnknownAttributes;
    property CommentAttributes: TSynHighlighterAttributes read FCommentAttributes write FCommentAttributes;
    property PodAttributes: TSynHighlighterAttributes read FPodAttributes write FPodAttributes;
    property VariableAttributes: TSynHighlighterAttributes read FVariableAttributes write FVariableAttributes;
    property BinNumberAttributes: TSynHighlighterAttributes read FBinNumberAttributes write FBinNumberAttributes;
    property QuoteAttributes: TSynHighlighterAttributes read FQuoteAttributes write FQuoteAttributes;
    property OctNumberAttributes: TSynHighlighterAttributes read FOctNumberAttributes write FOctNumberAttributes;
    property PragmaAttributes: TSynHighlighterAttributes read FPragmaAttributes write FPragmaAttributes;
    property SpecialVarInQuotedAttributes: TSynHighlighterAttributes read FSpecialVarInQuotedAttributes write FSpecialVarInQuotedAttributes;
    property FormatAttributes: TSynHighlighterAttributes read FFormatAttributes write FFormatAttributes;
    property DecNumberAttributes: TSynHighlighterAttributes read FDecNumberAttributes write FDecNumberAttributes;
    property OperatorAttributes: TSynHighlighterAttributes read FOperatorAttributes write FOperatorAttributes;
    property SymbolAttributes: TSynHighlighterAttributes read FSymbolAttributes write FSymbolAttributes;
    property InternalFunctionAttributes: TSynHighlighterAttributes read FInternalFunctionAttributes write FInternalFunctionAttributes;
    property KeywordAttributes: TSynHighlighterAttributes read FKeywordAttributes write FKeywordAttributes;
    property VarInQuotedAttributes: TSynHighlighterAttributes read FVarInQuotedAttributes write FVarInQuotedAttributes;
    property REAttributes: TSynHighlighterAttributes read FREAttributes write FREAttributes;
    property HexNumberAttributes: TSynHighlighterAttributes read FHexNumberAttributes write FHexNumberAttributes;
    property EndOfDataAttributes: TSynHighlighterAttributes read FEndOfDataAttributes write FEndOfDataAttributes;
    property SpaceAttributes: TSynHighlighterAttributes read FSpaceAttributes write FSpaceAttributes;
    property HEREDOCAttributes: TSynHighlighterAttributes read FHEREDOCAttributes write FHEREDOCAttributes;
    property PredefinedVarAttributes: TSynHighlighterAttributes read FPredefinedVarAttributes write FPredefinedVarAttributes;
  end;

function CalcCRC32(P: PChar; Len: cardinal):
         {$IFDEF SYN_COMPILER_4_UP} cardinal {$ELSE} integer {$ENDIF};

procedure Register;

implementation

uses  SynEditStrConst;

type  TSetChar = set of Char;
const IdentArray : array [1..6] of TSetChar = (
      ['0','1'],
      ['_','a'..'z','A'..'Z','0'..'9'],
      [#0..#32,'!'..'/',':'..'?','['..'^','`','{'..'~'],
      ['0'..'9','_'],
      ['0'..'9','a'..'f','A'..'F','_'],
      ['0'..'9']
);



const
   CRCTable:  array[0..255] of
              {$IFDEF SYN_COMPILER_4_UP} cardinal {$ELSE} integer {$ENDIF} = (
   $00000000,$77073096,$EE0E612C,$990951BA,$076DC419,$706AF48F,$E963A535,$9E6495A3,
   $0EDB8832,$79DCB8A4,$E0D5E91E,$97D2D988,$09B64C2B,$7EB17CBD,$E7B82D07,$90BF1D91,
   $1DB71064,$6AB020F2,$F3B97148,$84BE41DE,$1ADAD47D,$6DDDE4EB,$F4D4B551,$83D385C7,
   $136C9856,$646BA8C0,$FD62F97A,$8A65C9EC,$14015C4F,$63066CD9,$FA0F3D63,$8D080DF5,
   $3B6E20C8,$4C69105E,$D56041E4,$A2677172,$3C03E4D1,$4B04D447,$D20D85FD,$A50AB56B,
   $35B5A8FA,$42B2986C,$DBBBC9D6,$ACBCF940,$32D86CE3,$45DF5C75,$DCD60DCF,$ABD13D59,
   $26D930AC,$51DE003A,$C8D75180,$BFD06116,$21B4F4B5,$56B3C423,$CFBA9599,$B8BDA50F,
   $2802B89E,$5F058808,$C60CD9B2,$B10BE924,$2F6F7C87,$58684C11,$C1611DAB,$B6662D3D,
   $76DC4190,$01DB7106,$98D220BC,$EFD5102A,$71B18589,$06B6B51F,$9FBFE4A5,$E8B8D433,
   $7807C9A2,$0F00F934,$9609A88E,$E10E9818,$7F6A0DBB,$086D3D2D,$91646C97,$E6635C01,
   $6B6B51F4,$1C6C6162,$856530D8,$F262004E,$6C0695ED,$1B01A57B,$8208F4C1,$F50FC457,
   $65B0D9C6,$12B7E950,$8BBEB8EA,$FCB9887C,$62DD1DDF,$15DA2D49,$8CD37CF3,$FBD44C65,
   $4DB26158,$3AB551CE,$A3BC0074,$D4BB30E2,$4ADFA541,$3DD895D7,$A4D1C46D,$D3D6F4FB,
   $4369E96A,$346ED9FC,$AD678846,$DA60B8D0,$44042D73,$33031DE5,$AA0A4C5F,$DD0D7CC9,
   $5005713C,$270241AA,$BE0B1010,$C90C2086,$5768B525,$206F85B3,$B966D409,$CE61E49F,
   $5EDEF90E,$29D9C998,$B0D09822,$C7D7A8B4,$59B33D17,$2EB40D81,$B7BD5C3B,$C0BA6CAD,
   $EDB88320,$9ABFB3B6,$03B6E20C,$74B1D29A,$EAD54739,$9DD277AF,$04DB2615,$73DC1683,
   $E3630B12,$94643B84,$0D6D6A3E,$7A6A5AA8,$E40ECF0B,$9309FF9D,$0A00AE27,$7D079EB1,
   $F00F9344,$8708A3D2,$1E01F268,$6906C2FE,$F762575D,$806567CB,$196C3671,$6E6B06E7,
   $FED41B76,$89D32BE0,$10DA7A5A,$67DD4ACC,$F9B9DF6F,$8EBEEFF9,$17B7BE43,$60B08ED5,
   $D6D6A3E8,$A1D1937E,$38D8C2C4,$4FDFF252,$D1BB67F1,$A6BC5767,$3FB506DD,$48B2364B,
   $D80D2BDA,$AF0A1B4C,$36034AF6,$41047A60,$DF60EFC3,$A867DF55,$316E8EEF,$4669BE79,
   $CB61B38C,$BC66831A,$256FD2A0,$5268E236,$CC0C7795,$BB0B4703,$220216B9,$5505262F,
   $C5BA3BBE,$B2BD0B28,$2BB45A92,$5CB36A04,$C2D7FFA7,$B5D0CF31,$2CD99E8B,$5BDEAE1D,
   $9B64C2B0,$EC63F226,$756AA39C,$026D930A,$9C0906A9,$EB0E363F,$72076785,$05005713,
   $95BF4A82,$E2B87A14,$7BB12BAE,$0CB61B38,$92D28E9B,$E5D5BE0D,$7CDCEFB7,$0BDBDF21,
   $86D3D2D4,$F1D4E242,$68DDB3F8,$1FDA836E,$81BE16CD,$F6B9265B,$6FB077E1,$18B74777,
   $88085AE6,$FF0F6A70,$66063BCA,$11010B5C,$8F659EFF,$F862AE69,$616BFFD3,$166CCF45,
   $A00AE278,$D70DD2EE,$4E048354,$3903B3C2,$A7672661,$D06016F7,$4969474D,$3E6E77DB,
   $AED16A4A,$D9D65ADC,$40DF0B66,$37D83BF0,$A9BCAE53,$DEBB9EC5,$47B2CF7F,$30B5FFE9,
   $BDBDF21C,$CABAC28A,$53B39330,$24B4A3A6,$BAD03605,$CDD70693,$54DE5729,$23D967BF,
   $B3667A2E,$C4614AB8,$5D681B02,$2A6F2B94,$B40BBE37,$C30C8EA1,$5A05DF1B,$2D02EF8D);


   KeyIdentIndex : array[0..255] of integer = (
     262144,65540,262149,262153,131085,262159,524307,0,393243,327713,196646,196649,
     524332,131124,393270,131132,524350,131142,0,131144,393290,131152,262226,
     393302,131164,262238,131170,131172,393318,393324,131186,131188,524406,65662,
     393343,65669,131206,131208,327818,327823,262292,262296,262300,131232,524450,
     131242,65708,196781,524464,196792,262331,65727,262336,196804,131271,262345,
     458957,131284,131286,196824,327899,131296,196834,196837,262376,327916,196849,
     196852,131319,262393,262397,196865,327940,262409,65805,131342,131344,459026,
     196889,131356,131358,262432,459044,327979,196912,196915,327990,327995,131392,
     328002,393543,65869,262478,262482,65878,0,65879,393560,65886,328031,328036,
     393577,328047,262516,328056,131453,196991,328066,196999,197002,65933,262542,
     393618,262552,197020,262559,131491,328101,131498,328108,262577,131509,197047,
     328122,262591,197059,197062,197065,65996,197069,393680,197078,66009,459226,
     393697,262631,262635,197103,131570,262644,131576,197114,197117,328192,328197,
     131594,262668,131600,197138,131605,393751,197149,197152,0,328227,262696,
     262700,328240,197173,197176,328251,66112,262721,459333,197196,262735,393811,
     393817,131679,197217,197220,131687,262761,131693,197231,197234,197237,262776,
     393852,262786,197254,262793,131725,197263,131730,459412,393883,197281,393892,
     328362,131759,328369,262838,262842,197310,131777,131779,66245,197318,393929,
     262863,393939,197337,131804,393950,66276,262885,262889,197357,262896,393972,
     328442,393983,66309,328454,525067,394003,262937,328477,328482,262951,394027,
     262961,131893,197431,131898,262972,197440,328515,131912,262986,197454,262993,
     525141,328541,590690,197483,66414,197487,263026,328566,328571,66432,197505,
     394116,328586,328591,263060,263064,328604,328609,132006,263080,66476,132013,
     328623);

   KeyIdentData : array[0..947] of integer = (
     $2D16D5{Net::DummyInetd},$813243{SOAP::GenericScalarSerializer},$90FC74{hex},
     $BB3CD6{rindex},$FC203D{stat},$949CF8{Net::servent},$C80B5D{Pod::Find},$89FAB1{Tk::Label},
     $E24C97{accept},$2B7121{Tk::options},$E09371{Tk::TList},$1AC268{WWW::Search::ZDNet},
     $5DC713{exists},$94FC0B{Time::gmtime},$B72080{Tk},$27793E{LWP::Debug},$135C33{Tk::messageBox},
     $87CD4F{WWW::Search::Fireball},$6EBE29{WWW::Search::Monster},$F6A2E0{while},
     $B77317{HTML::Template},$0000C8{Net::DNS::RR::NSAP},$CB0919{Thread::Semaphore},
     $2681B8{Tk::Adjuster},$FEB3B2{WWW::Search},$73FCA0{UNIVERSAL},$8C5E90{xor},
     $FE6E19{warn},$8924E6{ExtUtils::MM_Cygwin},$3C5929{Getopt::EvaP},$4FDC73{Tk::IO},
     $347852{XML::PPD},$A8BACE{eof},$6D4CD4{HTML::TreeBuilder},$81B4BF{Tk::TextUndo},
     $6EA248{Tk::Wm},$8FCD8A{URI::Heuristic},$2507CB{join},$6E55CD{Tie::CPHash},
     $9433A4{Tk::callbacks},$A72660{Tk::overview},$934DD2{Getopt::Std},$6689F8{Win32::ODBC},
     $C45299{stdin},$C7AABD{DB},$6B397B{warnings},$3382C6{File::CounterFile},
     $0B53C1{Net::LDAP::Message},$67D43E{WWW::Search::AltaVista},$59CB06{WWW::Search::Dice},
     $F4CA0E{Win32::Pipe},$2A1972{msgrcv},$97A7B3{WWW::Search::Infoseek::Email},
     $F899BE{CHECK},$06268B{Math::MatrixBool},$718CAC{Text::Abbrev},$B4FA5B{Win32::API},
     $C2F286{XML::PPMConfig},$DB2F72{setsockopt},$10D35D{endhostent},$7032FF{Devel::Peek},
     $B43F73{rmdir},$EE1483{if},$34D0EA{for},$C3ACD5{DirHandle},$02CCAC{B::Assembler},
     $B8CFB7{HTTP::Daemon},$953EC2{Pod::Usage},$5D922D{XML::Parser},$92673F{chroot},
     $34BB83{Date::Parse},$006FEE{bless},$E10E4D{MIME::Lite},$60B438{WWW::Search::HeadHunter},
     $BCE49D{utf8},$CE37C8{POE::Wheel::SocketFactory},$1272DF{Tk::bindtags},$FB2CD8{Tk::palette},
     $B0B613{Win32::NetResource},$5D3228{ord},$993872{Archive::Tar},$2F1E9F{Text::ParseWords},
     $5C9EAC{return},$FB94CF{Net::LDAP::Filter},$832FAD{POE::Wheel},$85B5A1{Tk::Scrollbar},
     $818F3C{DBD::Proxy},$666033{Net::Domain},$4E80F4{WWW::Search::Metapedia},
     $E846ED{link},$525FEE{semget},$6468B7{ge},$0680F5{IPC::SysV},$992E41{Tk::Photo},
     $C967E4{Tk::grid},$8D8B12{Win32::OLE::Enum},$4ED7FC{undef},$B4ED18{STORESIZE},
     $4012E2{FileHandle},$310628{FETCHSIZE},$1B042F{DBD::File},$30A5F2{Devel::SelfStubber},
     $AFF157{Net::DNS::RR::ISDN},$1A2942{Net::DNS::RR::MINFO},$8EB725{Netscape::HistoryURL},
     $540869{Text::Tabs},$8D5D48{Win32::Console},$B0026A{closedir},$EBC865{POE},
     $728B36{File::Basename},$42C1C5{Net::LDAP::Entry},$FEADC8{URI::file},$F31449{lc},
     $35F2A7{VERSION},$6C2C99{strict},$01B8BD{PPM::SOAPServer},$B685EF{Net::Bind},
     $AE2216{XML::Element},$2339F0{Errno},$D18EA3{re},$774501{SOAP},$7C340B{HTML::FormatPS},
     $D24C45{Set::Scalar::Universe},$E54F31{Tk::Tree},$5D6054{study},$9E0EE0{getsockopt},
     $178510{Test::Harness},$C86368{SelfLoader},$D30F81{Bundle::DBD::CSV},$810B3B{Net::DNS::Header},
     $DE31F8{Tk::Radiobutton},$70C03C{URI::URL::ldap},$77B469{CLOSE},$74347D{Tk::FileSelect},
     $6A0F19{SOAP::Transport::HTTP::Client},$A049CB{PRINT},$6BCF20{next},$555826{Tk::Common},
     $733AE0{no},$3DD513{IO::Dir},$F7F503{Tie::RefHash},$2EF3FA{Tie::Watch},$6D8975{kill},
     $390527{DBD::Oracle},$2F82B1{ExtUtils::Liblist},$2A5EDE{Tie::Hash},$0F3729{Tk::Entry},
     $0D37D8{tell},$D476DB{Tk::Bitmap},$E9BD9A{Win32::EventLog},$C61B24{telldir},
     $469C1D{STDERR},$D48068{B::Showlex},$2DCC93{Net::DNS::RR::TXT},$C199D0{dbmclose},
     $54E216{getservbyname},$CC716F{DynaLoader},$5A2F95{LWP::RobotUA},$9F42A0{Win32::Sound},
     $B200C4{X11::Keysyms},$714772{Net::DNS::RR::AAAA},$FDE4C0{Win32::OLE::Variant},
     $8C6FBE{import},$D568F7{Oraperl},$28C1E4{HTML::Parser},$DF4D0E{POE::Session},
     $9992F4{Tk::fileevent},$92F2C4{Tk::LabFrame},$1C6AF3{Tk::Pixmap},$79FEEC{setnetent},
     $81158E{ExtUtils::Mksymlists},$E6DE54{WWW::Search::Search97},$DFC1E7{Tk::Cloth},
     $A8CA05{IO::Scalar},$188F0C{Win32::Semaphore},$7A4E5A{X11::Protocol::Connection::UNIXSocket},
     $A7CA9B{FileCache},$C1A667{CGI::Screen},$7354EA{File::CheckTree},$197C57{News::Newsrc},
     $46D48C{WWW::Search::AltaVista::AdvancedWeb},$D46A3A{untie},$090D52{waitpid},
     $F322C9{getpwuid},$F0D26E{SDBM_File},$6107B8{SOAP::Transport::HTTP::Apache},
     $9A8A07{splice},$A6755E{File::Spec},$CC15D6{LWP::UserAgent},$3BDBC2{WWW::Search::ExciteForWebServers},
     $FCA0D8{getpeername},$E5C030{ExtUtils::MM_VMS},$49DD0B{Env},$893AB7{Net::PH},
     $E6C1DC{getservbyport},$B8EF13{gethostbyaddr},$F28011{HTTP::Date},$0B12BD{Net::LDAP::Constant},
     $04D63A{socketpair},$EEEEF9{Net::Time},$80D872{Net::DNS::RR::CNAME},$833AE4{HTTP::Negotiate},
     $F1CC71{Set::Scalar},$965758{WWW::Search::AltaVista::AdvancedNews},$1B4E69{reverse},
     $8353B0{Net::DNS::RR::SRV},$855EF6{POE::Filter::Line},$D3D9F5{Tk::DItem},
     $7348D9{Tk::grab},$73C26D{X11::Protocol::Connection},$0DDBE9{truncate},$010320{gethostbyname},
     $DA53A9{charnames},$822A68{rand},$B3DF88{atan2},$83CB47{gmtime},$A3479D{Date::Format},
     $060664{File::Find},$B15199{Tk::FireButton},$A985A1{Locale::Language},$1CAAA4{POE::Driver},
     $9268BB{URI::data},$DC330B{Win32::Mutex},$D3FA86{crypt},$C2CBA3{CGI::Apache},
     $D75606{endpwent},$E608D8{ByteLoader},$BF82AD{HTML::LinkExtor},$DEBC12{pipe},
     $338A96{Fatal},$3BE404{WWW::Search::AltaVista::News},$88DE48{eq},$C48F41{File::Spec::VMS},
     $90CE17{SGMLS::Output},$E5C309{semop},$7668D6{getprotoent},$88AC94{Date::Manip},
     $7EE5DC{ExtUtils::testlib},$87528E{Net::LDAP::Reference},$EC4B6F{Win32::AuthenticateUser},
     $90A7D5{GETC},$716AE4{Shell},$D15AED{HTML::TokeParser},$5DA098{Tk::NoteBook},
     $D387DF{Sort::PolySort},$C142D5{WWW::RobotRules::AnyDBM_File},$04B8EB{package},
     $683A4E{Font::AFM},$3CBA6B{Net::DNS::RR::SOA},$7EE425{DB_File},$2BC18D{SGMLS::Refs},
     $4036A7{Tk::Widget},$634E4A{prototype},$A29F56{sigtrap},$1D940C{ExtUtils::MM_Win32},
     $16E4F3{Win32::DBIODBC},$51901C{index},$4A300C{IPC::Msg},$4F193F{Tk::Font},
     $7F548B{getprotobynumber},$7DC913{HTTP::Request::Common},$517EF0{Tk::X},
     $824AB8{sin},$547728{each},$EB24CC{PUSH},$08D29E{until},$1EB331{IO::Socket::UNIX},
     $FC0D8D{Tk::DialogBox},$4108AD{quotemeta},$9D2510{WWW::Search::Simple},$FF7C40{msgsnd},
     $F3A0B8{BEGIN},$3A6891{endprotoent},$1D4FF2{WRITE},$F47FF5{local},$798FEC{Class::Tom},
     $1C198C{Sys::Syslog},$C18D17{Time::Period},$A133FD{URI::Escape},$CAFAA1{User::grent},
     $48423B{WWW::Search::Livelink},$466F67{Tk::widgets},$F591F8{WWW::Search::WebCrawler},
     $D04759{time},$5F98D2{File::Spec::Mac},$E529BB{Tk::Listbox},$F944A2{LWP::MemberMixin},
     $EE4C74{semctl},$8DB7F2{Opcode},$BF9691{Net::hostent},$F31628{Tk::Error},
     $DDE1F3{WWW::Search::AltaVista::Careers},$52C5A9{File::Spec::Unix},$BE8960{POE::Filter},
     $10C382{Term::Cap},$131C84{Tk::Pane},$11D886{Tk::Submethods},$374282{WWW::Search::Verity},
     $907383{Win32::ChangeNotify},$B6B3B6{redo},$D322D7{Tk::TFrame},$709968{WWW::Search::PLweb},
     $1082EB{fileno},$9E9A26{scalar},$0D4B96{IO::Pipe},$E45220{Mozilla::Conn},
     $46FB08{getnetbyaddr},$25912C{Class::Template},$4B8CF1{Tk::selection},$5778C6{XML::ValidatingElement},
     $4EE2DE{lib},$FF1C34{DBI::W32ODBC},$361B3D{Digest::SHA1},$A2EC27{Net::DNS::Question},
     $0F7CC2{Netscape::History},$8124E2{SHA},$7B8506{DBI::ProxyServer},$F95319{Statistics::Descriptive},
     $CF3D63{Tk::ROText},$06A86D{Win32::OLE::Const},$7D79E9{Cwd},$FF173B{getnetbyname},
     $1A4141{overload},$090E2E{Test},$E6379C{Getopt::Long},$5B73B2{POE::Filter::HTTPD},
     $BE84C6{chr},$A6926C{Symbol},$DD2B12{LWP::MediaTypes},$FDA5B4{Pod::InputObjects},
     $6B5D21{Text::German},$44126E{Tie::IxHash},$33015C{oct},$5052CE{Mail::POP3Client},
     $74D159{IO::Handle},$CDCEC6{Tk::X11Font},$AA5CF9{wait},$6E6778{or},$D84232{Dumpvalue},
     $760207{Net::Whois},$3EBA71{lstat},$3BD934{endservent},$59DF9F{setprotoent},
     $6ED2D1{Text::Striphigh},$14324E{Pod::Man},$9B995D{String::Parity},$23EC89{Tk::chooseColor},
     $1ABE3C{Tk::Derived},$FC5BB1{WWW::Search::Yahoo::Classifieds::Employment},
     $F82297{cos},$E48BE9{Config},$9CEF45{IO::Lines},$DA81B6{Net::netent},$D59852{printf},
     $29CC58{shift},$CC836B{setgrent},$666446{eval},$6DF037{Pod::ParseUtils},
     $B7DC3E{Term::Complete},$97C671{Tk::DirTree},$639B32{ucfirst},$6D7D31{CGI::Cookie},
     $4D7168{Text::Soundex},$26446F{Tk::Canvas},$61439C{Tk::form},$3FA131{Tk::NumEntryPlain},
     $EA7173{chdir},$7B720C{elsif},$1EB846{Net::Netrc},$73538B{Thread::Signal},
     $28AE39{dump},$D8A344{sqrt},$081A92{Set::IntRange},$3C1E74{Tk::Tiler},$882C4F{bind},
     $8010F2{defined},$BA6A57{Digest::MD5},$93A529{Search::Dict},$4C384C{URI::URL},
     $5FF5ED{rename},$B19337{readline},$EE1958{Digest::HMAC},$1AA829{END},$3EEE45{File::Recurse},
     $B35170{WWW::Search::GoTo},$0513B3{unlink},$9F76BC{last},$F01559{use},$381BB7{IO::Stringy},
     $F28E76{Net::DNS::RR::PTR},$FD0F8D{WWW::Search::Infoseek},$7F7748{NDBM_File},
     $7F40FE{Net::NNTP},$EC73A9{map},$9E76A1{B::Terse},$ACFF83{Net::POP3},$D0F1A6{syswrite},
     $03E4E6{Tk::Menubutton},$D467DF{HTTP::Request},$05A235{Net::DNS::RR::MX},
     $197393{umask},$78D37C{format},$1A9B9C{ExtUtils::Install},$B2078E{Net::DNS::Packet},
     $A84CD6{POE::Kernel},$7EB1D7{log},$602D3E{sort},$362C8E{POP},$CCA94B{Math::Matrix},
     $254D80{Tk::bind},$5DABE5{WWW::Search::FolioViews},$D1BDFC{getpgrp},$C96F20{autouse},
     $22327F{File::stat},$FFADAB{fcntl},$24839C{goto},$3EDF4D{Tk::Toplevel},$E6C65E{listen},
     $0BEDBF{stdout},$FF8A97{else},$9BE754{getgrnam},$23A54C{ExtUtils::MM_Unix},
     $09379E{File::Glob},$B8F8C0{File::Tools},$75C163{Pod::Win32},$28575E{WWW::Search::Test},
     $C1F5B6{continue},$32C240{readdir},$BBB4D3{bytes},$6A3BAB{WWW::Search::Lycos::Pages},
     $054A61{getc},$D76D0C{split},$83F517{ARGVOUT},$732040{B::Xref},$9889AA{Tk::Balloon},
     $9C8DB1{recv},$8FB028{system},$6A2B14{CGI::Imagemap},$A18B54{isa},$CA830F{AutoSplit},
     $A736A0{Net::DNS::RR::EID},$832F09{EXTEND},$04630B{ODBM_File},$5B74B3{SOAP::Defs},
     $FB3AB0{Term::ANSIColor},$665CDB{WWW::Search::NetFind},$281AA2{DELETE},$F7928D{Class::Struct},
     $5E5D8A{HTML::Filter},$AF4B41{Net::Ping},$AF4B41{Net::Ping},$005C18{Set::Object},
     $A67F62{seekdir},$D44845{gt},$52E4E2{English},$7EC978{push},$23071A{getpwent},
     $575034{Net::LDAP::BER},$983FBE{pos},$E228E6{utime},$648C4F{CGI::Switch},
     $A95735{Getopt::Mixed},$33653B{POE::Wheel::FollowTail},$F4EB74{Tk::mega},
     $D4F59A{IO::AtomicFile},$B6E7D3{Math::Approx},$9264F2{Math::BigFloat},$8EF1F6{Math::Kleene},
     $0BD671{Tk::ProgressBar},$E75007{X11::Protocol::Connection::INETSocket},
     $28691E{PPM::SOAPClient},$4F7031{Pod::Checker},$F32A39{STDOUT},$B0EBB0{Bundle::DBI},
     $673069{Storable},$E82636{CGI::Push},$993862{File::Compare},$90E714{Net::DNS::RR::X25},
     $6AE418{Tk::After},$D8F015{Tk::Dialog},$345CB8{open},$0D2628{CPAN::FirstTime},
     $061B40{IO::Select},$4BB5FF{XML::Parser::Expat},$F3BD51{uc},$37E5D1{send},
     $D238CB{setpwent},$4EE816{Thread},$301F39{LWP::Protocol},$F0B077{srand},
     $E763AE{symlink},$51AF32{Tk::getOpenFile},$C034F3{Tk::Item},$9CD51D{WWW::Search::Null},
     $5775FC{Win32::TieRegistry},$D4C3FD{File::Slurp},$FF8962{SOAP::TypeMapper},
     $65876D{setservent},$8B4482{IPC::Semaphore},$9C002D{Math::Trig},$71EF7D{Term::ReadLine},
     $BEF757{WWW::Search::Magellan},$D0DD24{delete},$65ED45{values},$BD9A72{SOAP::Parser},
     $C229DB{WWW::Search::Infoseek::Web},$B83C8C{Carp},$0BF346{Tk::Xrm},$A50892{Win32API::Registry},
     $4C54B7{Set::IntSpan},$3C01B1{Text::Template},$4455B3{substr},$1F1E9D{unless},
     $8C12C7{DBD::ODBC},$D04B2B{Net::DNS::RR::MR},$09BE30{readlink},$8673CF{READ},
     $5C2F62{Data::Dumper},$69CE29{Net::DNS::RR::PX},$33F157{POE::Wheel::ListenAccept},
     $007696{Text::Metaphone},$9A841E{Tk::send},$E8C20F{Tk::pTk},$855CF4{getpwnam},
     $675B4F{Net::DNS::RR::MB},$E8EB3B{Tk::configspec},$A95E0C{Tk::NumEntry},
     $C3C023{Mysql},$44E90D{Net::DNS::RR::NAPTR},$2D5FD4{PRINTF},$D031D7{URI::WithBase},
     $A29D57{new},$7D0EE8{SHIFT},$CA9BF0{keys},$A50537{shmwrite},$5AF39B{File::Spec::Win32},
     $B1F135{I18N::Collate},$399E07{Locale::Country},$5A7758{WWW::Search::AltaVista::Intranet},
     $BF4850{reset},$25422F{lcfirst},$951F81{AutoLoader},$FFEB0B{Digest::HMAC_SHA1},
     $C6FFC1{rewinddir},$D220BC{B},$32C6B8{CGI::XMLForm},$574FC7{Win32::OLE::NLS},
     $F598F1{Exporter},$F1E60E{HTTP::Response},$C37B51{LWP::Simple},$2B91D9{exec},
     $AF8766{fork},$C285FB{File::DosGlob},$8D8D14{Text::Vpp},$3334CC{WWW::Search::Snap},
     $3DBCBA{getgrent},$8F78B3{Math::BigInt},$47FE99{Win32::OLE::NEWS},$4DBBE2{vec},
     $7D63C0{can},$1BCBB0{CPAN},$C34DBA{XSLoader},$A36928{DBD::ADO},$6A7866{MIME::Base64},
     $932DF1{Tk::option},$D258AD{Safe},$DB37E3{Tie::Dir},$20918E{lt},$A1CAE5{HTML::Formatter},
     $CC837D{Tk::Compound},$F19F10{Win32::File},$D87F46{B::CC},$9FEAB5{Penguin::Easy},
     $F462D9{String::CRC},$37E0F0{Tk::pack},$F6FE60{WWW::Search::HotFiles},$BA6E23{Pod::PerlEz},
     $2E8530{POE::Filter::Reference},$A5B8D7{Text::Wrap},$E84459{URI::ldap},$15FC82{syscall},
     $0AA555{DBI::FAQ},$40A7C5{HTTP::Headers},$55C3F7{Net::DNS::Resolver},$225E78{Net::DNS::RR::NULL},
     $E03ADD{Tk::exit},$5E52C5{binmode},$AAEE9B{getsockname},$C7411C{ExtUtils::Manifest},
     $114973{IO::Seekable},$976FFC{wantarray},$B8D56D{ops},$333735{IPC::Open3},
     $878A10{Statistics::ChiSquare},$BB5365{X11::Protocol},$4C12F2{Devel::DProf},
     $C799D0{SOAP::Packager},$F0E9F2{Tk::HList},$E58AE2{glob},$3F44CF{readpipe},
     $CB4412{lock},$435BCE{sub},$36049A{B::Lint},$1ECE67{X11::Protocol::Connection::Socket},
     $9DC5C4{XML::DOM},$20A6FF{getservent},$8D4FE3{FIRSTKEY},$D44101{User::pwent},
     $7E88C5{shmctl},$0C84F9{B::Debug},$FFFD02{chown},$B71129{TIEHASH},$600AB8{Net::SNPP},
     $EF64F2{Set::Scalar::Real},$1E8245{Tk::Message},$E9E080{Net::DNS::RR::RT},
     $283CD1{SQL::Statement},$842499{Net::DNS::RR::RP},$50B62A{Tk::Text},$938A68{Win32::Process},
     $39CEC2{TIESCALAR},$F722A7{Mozilla::Utils},$C5C111{Parse::Yapp},$480AB1{constant},
     $93BE43{msgget},$820F7B{READLINE},$C811BE{our},$9CCB4B{SGMLS},$2FCFB4{Tk::focus},
     $4CA873{X11::Protocol::Ext::BIG_REQUESTS},$B9C6FF{flock},$BF3F11{length},
     $1A812F{Net::LDAP::Util},$8C12C6{Set::Scalar::Valued},$C89A2D{Text::CSV_XS},
     $6C257D{Win32::FileSecurity},$888309{IO::ScalarArray},$2CC65C{Time::localtime},
     $64F1C7{Tk::SunConst},$E879C8{Win32},$BDB1C0{alarm},$A11691{ioctl},$3E82AF{Fcntl},
     $8BCC2E{Socket},$2B32E1{Tk::CmdLine},$9F56EE{FETCH},$7BC3BC{Convert::BER},
     $5D0225{SOAP::GenericInputStream},$27C918{socket},$4D5B12{exit},$778C6A{subs},
     $1B550D{Devel::Coverage},$35073F{Exporter::Heavy},$230121{Tk::DropSite},
     $9A813F{pack},$753534{Roman},$824C45{B::Asmdata},$4BE451{Sybase::BCP},$B8211C{Thread::Queue},
     $779C31{Tk::ObjScanner},$43DEBA{SOAP::Transport::HTTP::Server},$D69694{Tk::Frame},
     $F2D690{Tk::place},$215AFC{X11::Auth},$139E7B{read},$0B9D5A{grep},$1DEAC2{opendir},
     $DCF1AF{DBI},$E450B1{MD5},$64E1AE{DBI::Shell},$E528AC{WWW::Search::Lycos},
     $A32D2B{sysseek},$22C1CB{DATA},$7C0427{Digest},$87442A{Bit::Vector},$498D42{write},
     $37EC27{Net::Telnet},$6398A5{Net::DNS::RR::A},$5FA98D{Pod::Select},$E4C342{Tk::Eventloop},
     $8ED604{caller},$62E1EC{formline},$BFCA37{Business::CreditCard},$C779AF{File::Spec::OS2},
     $483F0A{Net::DNS::RR::LOC},$B2F32C{Time::Zone},$6FDA4A{WWW::Search::NorthernLight},
     $EA0874{Date::Calc},$5552E4{sprintf},$12D9E2{File::Copy},$12D9E2{File::Copy},
     $57C65A{String::Scanf},$4D6F4E{Tie::Scalar},$CDD339{WWW::Search::Gopher},
     $DCC113{GDBM_File},$57F769{Digest::HMAC_MD5},$867C7E{Net::FTP},$E01189{SOAP::Envelope},
     $5E5490{B::Stackobj},$3B0871{HTML::Entities},$CC927B{WWW::Search::Euroseek},
     $624D81{SPLICE},$E4136F{CGI},$2517F2{WWW::Search::Infoseek::News},$5AB087{X11::Protocol::Connection::INETFH},
     $472DA1{Tk::Checkbutton},$136F29{Tk::Internals},$5542A1{Mozilla::API},$2CFF23{WWW::Search::AOL::Classifieds::Employment},
     $ACD62F{Thread::Specific},$3926C5{die},$B6487B{Class::Eroot},$A6D3FE{ne},
     $F29248{attrs},$61DD56{blib},$637475{integer},$D8A84D{IO},$081E88{IO::File},
     $55B81A{WWW::SearchResult},$FA998A{Class::MethodMaker},$11993B{IO::Socket},
     $B5582B{chmod},$6F60FC{mkdir},$D76E92{B::Deparse},$13AE06{Tk::Image},$81740E{Tk::Optionmenu},
     $1135B1{sleep},$B9919F{getprotobyname},$17458F{endnetent},$4FEE77{getgrgid},
     $EB5018{sysopen},$C711AF{cmp},$13082C{Win32::Service},$77D461{unpack},$104ECB{MLDBM},
     $ECC682{B::Graph},$4A71E5{Net::SMTP},$917412{Tie::Handle},$4D8659{Tk::Animation},
     $4F8E46{WWW::Search::MetaCrawler},$0BD94C{Math::MatrixReal},$895C4B{GD},
     $E636DE{ExtUtils::MM_OS2},$C4C613{Tk::Clipboard},$216DDA{STORE},$27422B{fields},
     $92F095{B::Bytecode},$2BD2DD{IO::Poll},$108D53{TIEARRAY},$6C8F86{Pod::Text::Termcap},
     $E7C5F5{Tk::TixGrid},$C2A3E4{UNSHIFT},$953AC3{POSIX},$1ACC31{ExtUtils::Command},
     $F4C559{WWW::Search::OpenDirectory},$A5D6DC{INIT},$11F606{attributes},$9D3EA3{B::C},
     $6831E8{HTTP::Headers::Util},$3407A3{IPC::Open2},$D9E43C{Mozilla::Entry},
     $1E303B{Pod::Plainer},$F4DEF3{Benchmark},$4465A5{vars},$FA287E{Net::DNS::RR::NS},
     $1F97BC{Pod::Html},$F48B7B{print},$F70FBC{SelectSaver},$D69682{Net::DNS::Update},
     $FAA632{Net::DNS::RR::HINFO},$24C529{POE::Wheel::ReadWrite},$42F38C{WWW::Search::LookSmart},
     $C7C4AB{CLEAR},$2376D9{close},$1C7CFC{CGI::Carp},$64EC15{MIME::QuotedPrint},
     $76B4CD{Net::Bind::Utils},$B264C6{News::NNTPClient},$5186E5{Tk::Scrolled},
     $AF4F9B{CPAN::Nox},$AA16F2{Carp::Heavy},$EFF1E8{Mozilla::LDIF},$B77006{SOAP::OutputStream},
     $A8F1BB{Sys::Hostname},$29576B{Tie::Array},$AC430E{WWW::Search::Excite::News},
     $D288B4{abs},$87A36A{B::Disassembler},$1F803E{Pod::Parser},$BDFB99{WWW::RobotRules},
     $C9EDA6{endgrent},$789735{localtime},$BE5B9B{stderr},$7DF4DC{Bundle::LWP},
     $F0FA09{Net::DNS::RR::AFSDB},$8A1460{Tk::ColorEditor},$886713{Win32API::File},
     $8200D7{foreach},$C7C680{HTML::AsSubs},$012785{WWW::Search::MSIndexServer},
     $1F85B5{tie},$4E8D04{sethostent},$E21D5A{SOAP::Transport::HTTP::CGI},$DCDE72{SQL::Eval},
     $C2E0CC{Tk::tkvars},$F51991{times},$5417EE{getppid},$9CD26A{do},$4AB836{require},
     $29CA56{Pod::Text::Color},$DC5D3A{Set::Scalar::Virtual},$4A45AC{HTML::FormatText},
     $DAA669{HTML::HeadParser},$CF1075{Net::LDAP::Search},$AA6358{Tk::tixWm},
     $37C421{chop},$55ED91{getnetent},$6A4EC9{PPM},$B7494F{Net::protoent},$5329E3{dbmopen},
     $63A71F{DESTROY},$753606{filetest},$E5D59E{TIEHANDLE},$013879{IO::WrapTie},
     $688FDD{Tk::Scale},$7242FD{Win32::IPC},$F0217D{base},$966A06{shmread},$B5F233{Chart},
     $FED83F{HTTP::Message},$0DAFC0{Net::DNS::RR::MG},$400521{setpgrp},$803C58{ExtUtils::Packlist},
     $15FC4C{X11::Protocol::Ext::SHAPE},$DD3ABA{chomp},$1739EB{diagnostics},$C0C927{Time::tm},
     $50A2B3{Tk::Reindex},$EADD18{getpriority},$DBB935{NEXTKEY},$7E4B71{Term::ReadKey},
     $5F6DCB{Tie::SubstrHash},$8FB38D{Alias},$635C01{O},$7EC613{DBI::DBD},$916E04{pop},
     $11EEC3{LWP},$ADF845{IO::Wrap},$B7EFA3{SUPER},$7CC563{ExtUtils::Installed},
     $2DAE2F{ExtUtils::Miniperl},$A31AB4{ExtUtils::Mkbootstrap},$21E970{Tk::WinPhoto},
     $D57CCC{HTTP::Status},$7DC79A{Net::Cmd},$46866F{Net::DNS::RR},$53795C{Time::HiRes},
     $BF8B83{Win32::Event},$347B19{X11::Protocol::Connection::FileHandle},$A32661{connect},
     $2FADD9{msgctl},$1519C7{Graph::Kruskal},$260371{Net::DNS},$BD2411{Tk::MainWindow},
     $DE2B7E{Tk::Menu},$916698{Tk::Mwm},$F56A4D{CGI::Pretty},$16039C{HTTP::Cookies},
     $CA241D{Math::Complex},$E2CEB1{Mozilla::LDAP},$1E74BD{WWW::Search::Lycos::Sites},
     $EBC627{Win32::OLE},$2EE7B1{ref},$1003A3{int},$B157AF{AUTOLOAD},$F5BA5E{ExtUtils::Embed},
     $589506{Net::Bind::Resolv},$B7F4BE{Tk::InputO},$FA2AB9{URI},$AD7229{Net::DNS::RR::NIMLOC},
     $FAED43{WWW::Search::Google},$BE2A1E{Win32::NetAdmin},$D35570{B::Bblock},
     $F7496E{Win32API::Net},$875DFE{unshift},$C29B5F{shmget},$42673B{locale},
     $EDC89E{Pod::Text},$C8A5C1{WWW::Search::AltaVista::Web},$EFBC0C{Win32::PerfLib},
     $8001AB{shutdown},$FEE06F{lwpcook},$5F6FCC{HTML::Parse},$EF4E14{POE::Filter::Stream},
     $71B7CD{SOAP::GenericHashSerializer},$0EFDC7{tied},$F24BC3{less},$5078EB{File::Listing},
     $73BC8B{HTML::Stream},$A50095{EXISTS},$8B1F1D{String::BitCount},$9452B8{Tk::BrowseEntry},
     $EE866B{WWW::Search::Infoseek::Companies},$DEFE55{Win32::Internet},$0BAC96{gethostent},
     $90B17C{le},$3CB35A{Set::Scalar::ValuedUniverse},$75C716{Time::Local},$1E267F{WWW::Search::Crawler},
     $8234BB{X11::Protocol::Connection::UNIXFH},$7C218B{seek},$DEFFF4{Digest::MD2},
     $D25831{IO::Socket::INET},$5F91DE{Net::LDAP::LDIF},$418FFA{Tk::event},$CC92DB{sysread},
     $4D72B6{FindBin},$CB3C58{ExtUtils::MakeMaker},$B1425A{SOAP::EnvelopeMaker},
     $442467{not},$5F8761{Bit::ShiftReg},$9683C8{DBD::Sybase},$BEADF0{File::Spec::Functions},
     $B4427F{and},$8ADC72{my},$FCE96F{File::Path},$622709{Image::Size},$4E2CBF{WWW::Search::SFgate},
     $FF8B09{exp},$93EECE{NNML::Server},$BF844A{Tk::Button},$07251F{Tk::Table},
     $304B63{select},$C56A51{setpriority},$1DA62B{Compress::Zlib},$E48D7E{Tk::composite},
     $6E5C28{Devel::Symdump},$54EBB7{Net::LDAP},$D753C6{Set::Scalar::Base},$909029{STDIN},
     $2A2D51{HTML::Element},$C728BF{AnyDBM_File},$256B4F{DBI::Format},$B47996{CGI::Fast},
     $CF9110{DBD::CSV},$9C1FCA{Getopt::Tabular},$CD513D{POE::Driver::SysRW},$39B93A{getlogin}
     );

   KeyIdentTypes : array[0..947] of byte = (
     10,10,11,11,11,10,10,10,11,10,10,10,11,10,10,10,10,10,10,9,10,10,10,10,10,
     26,15,9,10,10,10,10,11,10,10,10,10,11,10,10,10,10,10,5,10,10,10,10,10,10,
     10,11,10,14,10,10,10,10,11,11,10,11,9,9,10,10,10,10,10,11,10,11,10,10,10,
     10,10,10,10,11,10,10,9,10,10,10,10,10,10,11,11,15,10,10,10,10,11,26,10,26,
     10,10,10,10,10,10,10,11,10,10,10,10,11,26,10,10,10,10,10,10,10,10,10,10,
     11,11,10,10,10,10,10,10,26,10,10,26,9,10,10,10,10,10,11,10,10,10,10,11,10,
     10,11,5,10,10,11,11,10,10,10,10,10,10,10,10,10,10,10,10,10,11,10,10,10,10,
     10,10,10,10,10,10,10,11,11,11,10,10,11,10,10,10,11,10,10,10,11,11,10,10,
     11,10,10,10,10,10,11,10,10,10,10,10,11,11,10,11,11,11,10,10,10,10,10,10,
     10,11,10,11,10,10,11,10,10,15,10,10,11,11,10,10,10,10,26,10,10,10,10,10,
     27,10,10,10,10,10,11,10,10,10,11,10,10,11,10,10,11,11,26,9,10,10,11,10,11,
     14,11,26,9,10,10,10,10,10,10,10,10,11,10,10,10,11,10,10,10,10,10,10,10,10,
     10,10,10,9,10,10,11,11,10,10,11,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
     11,10,10,10,10,11,10,10,10,10,10,11,10,10,10,11,15,10,10,11,11,11,10,10,
     10,10,10,10,11,10,10,10,11,11,11,9,10,10,10,11,10,10,10,10,10,11,9,10,10,
     11,11,10,10,11,11,10,10,10,11,11,10,14,10,10,11,9,10,10,10,10,10,10,11,10,
     10,11,10,10,10,11,24,10,10,10,11,11,26,10,10,10,11,10,10,11,9,10,11,5,9,
     11,10,10,10,10,10,9,11,10,10,11,11,5,10,10,11,11,10,26,10,10,26,10,10,10,
     10,26,10,10,10,10,10,11,15,10,11,11,10,11,11,10,10,10,10,10,10,10,10,10,
     10,10,10,5,10,10,10,10,10,10,10,11,10,10,10,11,11,11,10,10,11,11,10,10,10,
     10,10,10,11,10,10,10,10,11,11,10,10,10,10,10,10,10,11,9,10,10,11,26,10,10,
     10,10,10,10,11,10,10,10,10,10,26,10,26,26,11,11,10,10,10,10,11,11,10,10,
     11,10,10,10,10,10,10,11,11,10,10,10,11,10,10,11,26,10,10,10,10,10,10,10,
     15,10,10,10,10,10,10,10,10,10,10,10,10,11,10,10,10,10,10,11,11,10,10,11,
     10,10,10,10,10,10,10,11,11,11,25,10,10,10,11,26,10,11,10,11,26,10,10,10,
     10,10,10,10,10,26,10,10,10,11,26,9,10,10,10,11,11,10,10,10,10,10,10,10,10,
     11,11,10,10,10,26,10,10,11,9,10,10,10,10,11,10,10,10,10,10,10,10,10,10,11,
     11,11,10,10,10,10,11,5,10,10,11,10,10,10,10,11,11,10,10,10,10,10,10,11,10,
     10,10,10,10,10,10,10,10,10,10,10,26,10,10,10,10,10,10,10,10,9,10,15,10,10,
     10,10,10,10,10,10,11,11,10,10,10,11,11,11,11,11,15,10,11,10,10,10,10,10,
     10,10,10,10,10,26,10,10,10,26,10,10,26,10,10,10,14,10,10,10,10,10,10,10,
     10,10,10,11,10,10,10,10,10,26,11,10,10,10,10,10,10,10,10,10,10,10,10,11,
     10,10,10,11,11,5,10,10,10,10,9,10,10,11,11,10,10,10,11,11,9,10,10,10,10,
     10,10,10,11,11,10,10,11,14,10,26,10,10,10,10,11,10,10,10,11,10,10,11,10,
     10,10,11,26,10,10,10,10,10,11,10,10,26,10,10,10,10,10,10,10,10,10,10,11,
     11,10,10,10,10,10,10,10,10,10,10,10,11,11,14,10,10,10,10,10,10,10,10,10,
     11,11,10,10,10,10,11,10,10,10,10,11,10,10,10,26,10,10,10,10,11,15,10,10,
     10,10,11,10,10,10,10,11,10,10,10,15,10,10,10,15,9,10,10,10,11,10,10,10,11,
     11,10,10,10,10,10,5,10,10,10,10,10,10,10,11);

   KeyVarIndex : array[0..255] of integer = (
     0,65536,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65537,0,0,0,0,65538,0,0,0,0,0,0,65539,
     0,0,0,0,0,65540,0,65541,0,0,0,0,0,0,0,0,0,65542,0,65543,0,0,0,0,0,0,0,65544,
     65545,0,65546,0,65547,65548,0,0,0,65549,0,0,0,0,0,65550,0,196623,65554,0,
     0,0,0,0,0,65555,0,0,0,0,0,65556,0,0,0,0,0,65557,0,0,0,0,0,0,0,65558,0,0,
     0,0,0,0,0,0,0,65559,0,65560,0,0,65561,0,65562,0,65563,0,65564,0,0,0,0,0,
     0,0,0,0,0,0,65565,65566,65567,0,0,0,65568,131105,0,0,0,0,0,0,65571,0,0,0,
     65572,0,0,0,65573,0,0,0,0,0,65574,0,0,0,0,0,0,0,0,0,131111,65577,65578,0,
     0,0,0,0,0,0,0,0,65579,0,0,0,0,65580,0,0,0,65581,0,0,65582,0,65583,0,0,0,
     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65584,0,0,0,0,65585,0,0,0,0,0,0,0,0,196658,
     0,0,0,65589,0,0,0,0,0,65590,0,0,0,0,65591,0,0,0,0,0);

   KeyVarData : array[0..55] of integer = (
     $29F565{ORS},$6D0C12{ARG},$B6D444{ERRNO},$35F2A7{VERSION},$A9774B{FORMAT_LINE_BREAK_CHARACTERS},
     $DFEA80{GID},$872230{OFS},$73676B{MULTILINE_MATCHING},$A211D5{FORMAT_NAME},
     $7D9D9E{UID},$B65F75{PID},$B94203{EXECUTABLE_NAME},$B14F78{INPUT_RECORD_SEPARATOR},
     $D82E87{COMPILING},$055B4F{EXTENDED_OS_ERROR},$2DF0A8{MATCH},$A04B33{INPLACE_EDIT},
     $E2FE60{SUBSCRIPT_SEPARATOR},$E0D854{POSTMATCH},$066B51{INPUT_LINE_NUMBER},
     $CC1299{EFFECTIVE_GROUP_ID},$E0B8E5{FORMAT_LINES_PER_PAGE},$81E2E6{OUTPUT_FIELD_SEPARATOR},
     $A0E885{ARGV},$F31095{OS_ERROR},$2B1808{OUTPUT_AUTOFLUSH},$CD87BC{DEBUGGING},
     $EF3F98{RS},$E38B7A{PROGRAM_NAME},$DEC6FE{PERLDB},$15428F{EGID},$BC6866{OUTPUT_RECORD_SEPARATOR},
     $341A98{EVAL_ERROR},$8DB8C8{REAL_USER_ID},$105A0A{PERL_VERSION},$B73591{EUID},
     $B531FE{REAL_GROUP_ID},$B11DBC{OFMT},$BD1F02{SYSTEM_FD_MAX},$9AC6DD{PROCESS_ID},
     $F452F9{FORMAT_TOP_NAME},$F0C1C9{LIST_SEPARATOR},$34A316{LAST_PAREN_MATCH},
     $E13BEB{FORMAT_FORMFEED},$E6BE7A{FORMAT_LINES_LEFT},$6BD009{SUBSEP},$975A7F{ACCUMULATOR},
     $4F410C{OSNAME},$2C037D{FORMAT_PAGE_NUMBER},$67BDA2{WARNING},$9F5253{NR},
     $88BCD0{BASETIME},$B157AF{AUTOLOAD},$F338D0{CHILD_ERROR},$D4602F{PREMATCH},
     $207E35{EFFECTIVE_USER_ID});

{ For example, we must recognize internal function "print"
  1. Calculate CRC32 : CRC32('print') = $D3F48B7B
  2. Split CRC value into Index:D3 and Value: F48B7B
  3. return tkSymbol if KeyIdentIndex[D3] in null, else -
  4. Decode KeyIdentIndex[D3] value - it is 4-byte integer, first 2 bytes is
     Count of all precalculated CRC32 values, which started from D3 and second
     2 bytes is Offset in KeyIdentData array, where we can find these values
  5. Locate our Value(F48B7B) in KeyIdentData array from Offset next Count
     array elements
  6. If search was successful, return TokenKind of located Value from
     KeyIdentTypes array.                                                    }
procedure SplitCRC(CRC : integer; var Index : Byte; var Value : integer);
begin
    Index  := CRC shr 24;
    Value  := CRC and $FFFFFF;
end;

procedure SplitIntoOffsetAndLen(A : integer; var Offset, Len : Word);
begin
    Offset := A and $ffff;
    Len    := A shr 16;
end;

function CheckIdentCRC(CRC : integer) : TTokenKind;
var Index  : Byte;
    Value  : integer;
    Len,Offset : word;
    I      : integer ;
begin
    result := tkSymbol;
    SplitCRC(CRC,Index,Value);
    if KeyIdentIndex[Index] = 0 then exit;
    SplitIntoOffsetAndLen(KeyIdentIndex[Index],Offset,Len);

    for i:= Offset to Offset+Len-1 do
       if KeyIdentData[i] = Value then begin
          result :=  TTokenKind(KeyIdentTypes[i]);
          exit;
       end;
end;

function CheckVariableCRC(CRC : integer) : TTokenKind;
var Index  : Byte;
    Value  : integer;
    Len,Offset : word;
    I      : integer ;
begin
    result := tkVariable;
    SplitCRC(CRC,Index,Value);
    if KeyVarIndex[Index] = 0 then exit;
    SplitIntoOffsetAndLen(KeyVarIndex[Index],Offset,Len);

    for i:= Offset to Offset+Len-1 do
       if KeyVarData[i] = Value then begin
          result :=  tkPredefinedVar;
          exit;
       end;
end;

type TVarLetterType = (vltCaret,vltSpace,vltPredefined,vltUnderscore,
                       vltSharp,vltOther,vltColon,vltDigit,vltDollar,vltLeftCurly);
                       
     TGenLetterType = (gltIdent,gltCRLFNULL,gltSpaces,gltOther);
     
     TIdentLetterType = (iltAlpha,iltColon,iltDigit,iltOther,iltSingle);

var VarIA : array [#0..#255] of TVarLetterType;
    GenIA : array [#0..#255] of TGenLetterType;
    IdeIA : array [#0..#255] of TIdentLetterType;

procedure BuildIdentArray;
var C : Char;
begin
   for c:=#0 to #255 do begin
      case C of
        #0..#32 : VarIA[c] := vltSpace;
        '^'     : VarIA[c] := vltCaret;
       #38,#39,#96,#34,#93,#91,#43,#42,#46,#47,#124,#44,#92,#59,#37,#61,#45,#126,#63,#33,#64,#60,#62,#40,#41
                : VarIA[c] := vltPredefined;
       '{'      : VarIA[c] := vltLeftCurly;
       '0'..'9' : VarIA[c] := vltDigit;
        ':'     : VarIA[c] := vltColon;
        '_'     : VarIA[c] := vltUnderscore;
        '#'     : VarIA[c] := vltSharp;
        '$'    : VarIA[c] := vltDollar;
       else  VarIA[c] := vltOther;
      end;
      case C of
        #0,#13,#10              : GenIA[c] := gltCRLFNULL;
        #1..#9,#11,#12,#14..#32 : GenIA[c] := gltSpaces;
        'a'..'z','_','0'..'9',
        'A'..'Z'                : GenIA[c] := gltIdent;
        else  GenIA[c] := gltOther;
      end;
      case C of 
        'a'..'z','_','A'..'Z'  : IdeIA[c] := iltAlpha;
        '0'..'9'               : IdeIA[c] := iltDigit;
        ':'                    : IdeIA[c] := iltColon;  
        ''''                   : IdeIA[c] := iltSingle;    
        else  IdeIA[c] := iltOther;
      end;  
   end;
end;

procedure ResetRangeState(var RangeState : TRangeState);
begin
    RangeState := 0;
end;

function BuildSimpleRange(Range: TPredefinedRangeStates): TRangeState;
begin
   Result := Byte(Range) shl 16;
end;

function BuildDelimiterRange(C: char; Range: TPredefinedRangeStates; Step: byte): TRangeState;
begin
   Result := (Step shl 24) + (byte(Range) shl 16) + (Byte(C) shl 8);
end;

procedure IncRangeStep(var RangeState : TRangeState);
begin
    RangeState := (RangeState and $FCFFFFFF) + 
                  ((((RangeState shr 24) and 3) + 1) and $3) shl 24
end;

procedure DecRangeStep(var RangeState : TRangeState);
begin
    RangeState := (RangeState and $FCFFFFFF) + 
                  ((((RangeState shr 24) and 3) - 1) and $3) shl 24
end;

procedure DecHeredocStep(var RangeState : TRangeState);
begin
    Dec(RangeState)
end;

procedure IncHeredocStep(var RangeState : TRangeState);
begin
    if RangeState and $f <> $f then  Inc(RangeState)
end;

function CompareHeredocCRC(H : TRangeState; CRC : integer) : boolean;
begin
    result := (H and $FFFFF0) = (CRC and $FFFFF0);
end;

function BuildRangePointer(CRC, Len : cardinal) : TRangeState;
begin
    result := ( CRC and $FFFFF0) + ( Len and $3F ) shl 24 + FLAG_HEREDOC;
end;

function ExtractStringLenFromHash(P : TRangeState) : integer;
begin
    Result := (P shr 24) and $3F;
end;

type TRangeStateKind = (rskHeredoc,rskDelimiter,rskSimple);

function RecognizeRange(RangeState : TRangeState) : TRangeStateKind;
begin
   if (RangeState and FLAG_HEREDOC) = FLAG_HEREDOC then result := rskHeredoc else
   if (RangeState and $0000FF00) <> 0 then result := rskDelimiter else 
   if (RangeState shr 24) and $3 = 0 then result := rskSimple else
   result := rskDelimiter;
   
   
{        
                if (Filler <> 0) or (Range > 63) or (Step > 3) then  else
           if (C <> #0) then result := rskDelimiter else
               if Step = 0 then result := rskSimple else
                  case TPredefinedRangeStates(Range) of
                     rsMBracket,
                     rsQuotedBracket,
                     rsQuotedInterBracket,
                     rsS_FirstBracket,
                     rsS_SecondBracket,
                     rsS_BetweenBrackets,
                     rsTr_FirstBracket,
                     rsTr_SecondBracket,
                     rsTr_BetweenBrackets : result := rskDelimiter
                     else result :=  rskHeredoc;
                  end;
    end }
end;

function IsOpenBracket(C : Char) : boolean;
begin
   result := C in ['<','(','{','['];
end;

function RecognizeBracket(C : Char) : TBracketKind;
begin
   case C of
     '[' : result := bkSquareOpen;
     '{' : result := bkCurlyOpen;
     '(' : result := bkRoundOpen;
     '<' : result := bkAngleOpen;
     ']' : result := bkSquareClose;
     '}' : result := bkCurlyClose;
     ')' : result := bkRoundClose;
     '>' : result := bkAngleClose;
      else result := bkUnknown;
   end;
end;

function BuildBracketRange(C: char; Range: Byte; Step: byte): TRangeState;
begin
  Result := (Step shl 24) + (Byte(RecognizeBracket(C)) shl 8) + (Range shl 16);
end;

procedure IncBracketCounter(var RangeState: TRangeState);
begin
   if RangeState and $ff = 255 then exit; // only 255 levels
   Inc(RangeState)
end;

procedure DecBracketCounter(var RangeState: TRangeState);
begin
   Dec(RangeState);
end;

function IsBracketLevelsZero(RangeState: TRangeState) : boolean;
begin
    result := (RangeState and $FF) = 0;
end;

function CheckForWantedBracket(C : Char; RangeState : TRangeState ) : TBracketType;
var BK,BK2 : TBracketKind;
begin
   result := bUnknown;
   BK  := RecognizeBracket(c);
   if BK = bkUnknown then exit;
   BK2 := TBracketKind((RangeState shr 8) and 3);
   
   if BK = BK2 then result := bOpen
   else
      if TBracketKind(Byte(BK2) + 4) = BK then result := bClose;
end;

function CalcCRC32(P: PChar; Len: cardinal):
         {$IFDEF SYN_COMPILER_4_UP} cardinal {$ELSE} integer {$ENDIF};
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Len - 1 do begin
    Result := (Result shr 8) xor CRCTable[byte((P + i)^) xor (Result and $000000FF)]
  end;
end;

function TSynMPerlSyn.CRange : TPredefinedRangeStates;
begin
    result := TPredefinedRangeStates((FCurrentRange shr 16) and $ff);
end;

procedure SetStep(var RangeState : TRangeState; Step : byte);
begin
    RangeState := (RangeState and $FCFFFFFF) + (Step and $3) shl 24
end;

function TSynMPerlSyn.CStep: byte;
begin
    result := (FCurrentRange shr 24) and $3;
end;


procedure TSynMPerlSyn.SRange(A : TPredefinedRangeStates);
begin
    FCurrentRange := (FCurrentRange and $FF00FFFF) + Byte(A) shl 16 ;
end;

function TSynMPerlSyn.CChar : Char;
begin
    result := Char((FCurrentRange shr 8) and $ff);
end;


function TSynMPerlSyn.GetIdentChars: TSynIdentChars;
begin
  Result := ['%','@','$','_','0'..'9','a'..'z','A'..'Z',':',#128..#255];
end;

procedure  TSynMPerlSyn.DefProc; begin fProcTable[FLine[FLineOffset]] end;
procedure  TSynMPerlSyn.MProc0;  begin MProc(0) end;
procedure  TSynMPerlSyn.HeredocProcTrue;  begin HeredocProc(true) end;
procedure  TSynMPerlSyn.QWProc0;       begin QWProc(0);      end;
procedure  TSynMPerlSyn.QWInterProc0;  begin QWInterProc(0); end;

 

procedure TSynMPerlSyn.MakeMethodTables;
var I: Char; T : TTokenKind;
    R : TPredefinedRangeStates;
begin
  for I := #0 to #255 do
     case I of
        #0: fProcTable[I] := NullProc;
       #10: fProcTable[I] := LFProc;
       #13: fProcTable[I] := CRProc;
       #1..#9, #11..#12, #14..#32 : fProcTable[I] := SpaceProc;
      '#' : fProcTable[I] := CommentProc;
      '_' : fProcTable[I] := ProcUnderscore;
      '=' : fProcTable[I] := EqualProc;
      '<' : fProcTable[I] := LessProc;
      #34 : fProcTable[i] := QuoteProc;
      '`' : fProcTable[i] := BackQuoteProc;
      '/' : fProcTable[i] := SlashProc;
      '$' : fProcTable[i] := VarProc;
      '%' : fProctable[i] := HashProc;
      '@' : fProcTable[i] := ArrayProc;
      '-' : fProctable[i] := MinusProc;
      'q' : fProctable[i] := QProc;
      #39 : fProcTable[i] := SingleQuoteProc;
      'a'..'p','r'..'z','A'..'Z'  : fProcTable[i] := FromLetterProc;
      '0'..'9','.'        : fProcTable[i] := NumberProc;
      '{' : fProctable[i] := OpenCurlyProc;
      '}' : fProctable[i] := CloseCurlyProc;
      
      '[',']','(',')',':',';',',','+','\' : fProcTable[i] := SymbolProc;
      '^','*','~','?'     : fProcTable[i] := SymbolProc;
      '>','!'             : fProcTable[i] := SymbolProc;
      '&'                 : fProcTable[i] := AmpersandProc;
      '|'                 : fProcTable[i] := PipeProc;
     else
        fProcTable[I] := UnknownProc;
   end;
   
   for R := Low(R) to High(R) do
      case R of
        rsUnknown,
        rsMBracket,
        rsQuotedBracket,
        rsQrBracket,
        rsS_FirstBracket,
        rsS_SecondBracket,
        rsTr_FirstBracket,
        rsTr_SecondBracket,
        rsQuotedInterBracket  : FRangeProcTable[R] := DefProc;
        rsAfterSubName        : FRangeProcTable[R] := AfterSubNameProc;
        rsInsideSubArgs       : FRangeProcTable[R] := InsideSubArgsProc;
        rsAnonymousLeftCurly,
        rsSubLeftCurly        : FRangeProcTable[R] := OnSubOpenCurlyProc;
        rsAfterSubArgs        : FRangeProcTable[R] := AfterSubArgsProc;
        rsOnFirstWord         : FRangeProcTable[R] := OnFirstWordProc;
        rsAfterPackage        : FRangeProcTable[R] := AfterPackageProc;
        rsAfterLeftCurly      : FRangeProcTable[R] := AfterLeftCurlyProc;
        rsOnLeftCurly         : FRangeProcTable[R] := OnLeftCurlyProc;
        rsAfterSub            : FRangeProcTable[R] := AfterSubProc;
        rsAfterVariable       : FRangeProcTable[R] := AfterVariableProc;
        rsBeforeSubName       : FRangeProcTable[R] := SubNameProc;
        rsString              : FRangeProcTable[R] := GenQuoteProc;
        rsSingleString        : FRangeProcTable[R] := GenQuoteProc;
        rsM,rsQR,
        rsS_First,
        rsS_Second,
        rsMSlash              : FRangeProcTable[R] := MProc0;
        rsPod                 : FRangeProcTable[R] := PodProc;
        rsBackQuote           : FRangeProcTable[R] := GenQuoteProc;
        rsEmptyHeredocSingle,
        rsEmptyHeredocInter   : FRangeProcTable[R] := HeredocProcTrue;
        rsQuoted              : FRangeProcTable[R] := QWProc0;
        rsQuotedInter         : FRangeProcTable[R] := QWInterProc0;
        rsTr_First,           
        rsTr_Second           : FRangeProcTable[R] := MProc0;
        rsFormatBody          : FRangeProcTable[R] := FormatProc;
        rsEndOfData           : FRangeProcTable[R] := EndOfDataProc;
        rsBeforeScript        : FRangeProcTable[R] := BeforeScriptProc;
        rsS_BetweenBrackets   : FRangeProcTable[R] := S_BetweenBrackets;
        rsTr_BetweenBrackets  : FRangeProcTable[R] := Tr_BetweenBrackets;
     else
        raise Exception.CreateFmt('Handler of TPredefinedRangeStates %d is not defined!',[Integer(R)]);
     end;

     for T := Low(T) to High(T) do 
       case (T) of
         tkSpecSub          : FAttributesTable[T] := FSpecialSUBAttributes;
         tkClass            : FAttributesTable[T] := FSpecialSUBAttributes;
         tkClass_Sub        : FAttributesTable[T] := FSpecialSUBAttributes;
         tkSpecSub_Sub      : FAttributesTable[T] := FSpecialSUBAttributes;
         tkUnknown          : FAttributesTable[T] := FUnknownAttributes;
         tkComment          : FAttributesTable[T] := FCommentAttributes;
         tkPod              : FAttributesTable[T] := FPodAttributes;
         tkVariable         : FAttributesTable[T] := FVariableAttributes;
         tkFileDescriptor   : FAttributesTable[T] := FVariableAttributes;
         tkBinNumber        : FAttributesTable[T] := FBinNumberAttributes;
         tkString           : FAttributesTable[T] := FQuoteAttributes;
         tkSingleString     : FAttributesTable[T] := FQuoteAttributes;
         tkBackQuote        : FAttributesTable[T] := FQuoteAttributes;
         tkOctNumber        : FAttributesTable[T] := FOctNumberAttributes;
         tkPragma           : FAttributesTable[T] := FPragmaAttributes;
         tkPackageKeyword   : FAttributesTable[T] := FPragmaAttributes;
         tkKnownPackageName : FAttributesTable[T] := FPragmaAttributes;
         tkSpecialVarInQuoted : FAttributesTable[T] := FSpecialVarInQuotedAttributes;
         tkFormatBody       : FAttributesTable[T] := FFormatAttributes;
         tkDecNumber        : FAttributesTable[T] := FDecNumberAttributes;
         tkAnonymous        : FAttributesTable[T] := FDecNumberAttributes;
         tkOperator         : FAttributesTable[T] := FOperatorAttributes;
         tkSymbol           : FAttributesTable[T] := FSymbolAttributes;
         tkUnKnownPackageName : FAttributesTable[T] := FSymbolAttributes;
         tkSubParameters    : FAttributesTable[T] := FSymbolAttributes;
         tkSubName          : FAttributesTable[T] := FSymbolAttributes;
         tkOpenCurly        : FAttributesTable[T] := FSymbolAttributes;
         tkCloseCurly       : FAttributesTable[T] := FSymbolAttributes;
         tkSubOpenCurly     : FAttributesTable[T] := FSymbolAttributes;
         tkSubProto         : FAttributesTable[T] := FSymbolAttributes;
         tkInternalFunction : FAttributesTable[T] := FInternalFunctionAttributes;
         tkInternalFunction_Sub : FAttributesTable[T] := FInternalFunctionAttributes;
         tkKeyword          : FAttributesTable[T] := FKeywordAttributes;
         tkSub              : FAttributesTable[T] := FKeywordAttributes;
         tkVarInQuoted      : FAttributesTable[T] := FVarInQuotedAttributes;
         tkRE               : FAttributesTable[T] := FREAttributes;
         tkHexNumber        : FAttributesTable[T] := FHexNumberAttributes;
         tkEnd              : FAttributesTable[T] := FEndOfDataAttributes;
         tkSpace            : FAttributesTable[T] := FSpaceAttributes;
         tkHeredoc          : FAttributesTable[T] := FHEREDOCAttributes;
         tkPredefinedVar    : FAttributesTable[T] := FPredefinedVarAttributes;
            else FAttributesTable[T] := nil;     
       end;
end;

procedure TSynMPerlSyn.UnknownProc;
begin
  inc(FLineOffset);
  fTokenID := tkUnknown;
end;

procedure TSynMPerlSyn.SymbolProc;
begin
  inc(FLineOffset);
  fTokenID := tkSymbol;
end;

procedure TSynMPerlSyn.OpenCurlyProc;
begin
  inc(FLineOffset);
  fTokenID := tkOpenCurly;
end;

procedure TSynMPerlSyn.CloseCurlyProc;
begin
  inc(FLineOffset);
  fTokenID := tkCloseCurly;
end;

procedure TSynMPerlSyn.MinusProc;
begin
   inc(FLineOffset);
   fTokenID := tkSymbol;
   // FileTest operations (like "-f")
   if (FLine[FLineOffset] in ['r','w','x','o','R','W','X','O','e','z','s','f','d','l','p','S','b','c','t','u','g','k','T','B','M','A','C']) and
      ((VarIA[FLine[FLineOffset+1]] = vltSpace) or
       (FLine[FLineOffset+1] in ['$',#34,#39,'`'])) then begin
      inc(FLineOffset);
      fTokenID := tkInternalFunction;
   end;
end;

function  TSynMPerlSyn.CheckSharp(Offset : integer) : boolean;
var i : integer;
begin
    result := false;
    i:=FLineOffset+Offset;
    while true do begin
       case FLine[i] of
          '#' : if i <> FLineOffset+Offset then break;
          ' ' : begin Inc(i); continue; end;
       end;
       result := GenIA[FLine[FLineOffset+Offset]] <> gltIdent;
       exit;
    end;
end;

function  TSynMPerlSyn.CheckAsterisk : boolean;
begin
    result := (FLineOffset=0) or (FLine[FlineOffset-1] <> '*')
end;

procedure TSynMPerlSyn.QProc;
begin
   if gltIdent = GenIA[FLine[FLineOffset+1]] then begin
      if FLine[FLineOffset+1] in ['w','q','x'] then begin
         if CheckSharp(2) then begin
              if FLine[FLineOffset+1] = 'w' then 
                  FCurrentRange  := BuildSimpleRange(rsQuoted)
              else 
                  FCurrentRange  := BuildSimpleRange(rsQuotedInter);
              ftokenID  := tkOperator;
              Inc(FLineOffset,2);
              exit;
         end;
      end
   end else
         if CheckSharp(1) then begin
               FCurrentRange  := BuildSimpleRange(rsQuoted);
               ftokenID  := tkOperator;
               Inc(FLineOffset);
               exit;
         end;
   FromLetterProc;
end;

procedure TSynMPerlSyn.SlashProc;
var i,j: integer;
begin
   ftokenID  := tkOperator;
   i := FLineOffset-1;
   while true do begin
      if i < 0 then begin
         Inc(FLineOffset);
         FCurrentRange := BuildDelimiterRange('/',rsMSlash,2);
         exit;
      end;
      if not (GenIA[FLine[i]] in [gltSpaces,gltCRLFNULL]) then break;
      Dec(i);
   end;
   // first non-space character was found
   if GenIA[FLine[i]] = gltIdent then begin
      j:=i;
      while true do begin
         if not (FLine[j] in
            ['a'..'z','A'..'Z','_','0'..'9']) then begin
            Inc(j);
            break;
         end;
         Dec(J);
      end;
      if (j<>0) and (FLine[j] = '$') then Dec(j);
      case CalcCRC32(FLine+j,i-j+1) of
         $77D76D0C{split},
         $10EE1483{if},
         $8F1F1E9D{unless},
         $1034D0EA{for},
         $667B720C{elsif},
         $06F6A2E0{while},
         $DA8200D7{foreach},
         $068C5E90{xor},
         $F8B4427F{and},
         $5C6E6778{or},
         $F7442467{not},
         $CAC711AF{cmp} : begin
                  Inc(FLineOffset);
                  FCurrentRange := BuildDelimiterRange ('/',rsMSlash,2);
                end;
           else SymbolProc;
      end;
   end else

   case FLine[i] of
       // Slash is probably division operator
       ')',']','}','>','''' : SymbolProc;
       // RE
       else if (i <> 0) and (FLine[i-1] = '$') then SymbolProc
            else begin
               Inc(FLineOffset);
               FCurrentRange := BuildDelimiterRange('/',rsMSlash,2);
            end;
   end;
end;

procedure TSynMPerlSyn.QWProc(Step : integer);
begin
  case Step of
   0 : begin
      FTokenID := tkSpace;
      case FLine[FLineOffset] of
          #0:  NullProc;
          #10: LFProc;
          #13: CRProc;
          else repeat
                 if VarIA[FLine[FLineOffset]] <> vltSpace then begin
                     if (CRange = rsQuoted) and
                        IsOpenBracket(FLine[FLineOffset]) then
                        FCurrentRange := BuildBracketRange(
                                           FLine[FLineOffset],
                                           Byte(rsQuotedBracket),1)
                     else
                        FCurrentRange := BuildDelimiterRange(FLine[FLineOffset],CRange,1);
                     break
                 end;
                 Inc(FLineOffset);
               until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
      end;
   end;
   1 : begin
       Inc(FLineOffset);
       fTokenID := tkOperator;
       IncRangeStep(FCurrentRange);
   end;
   2 : begin
       case FLine[FLineOffset] of
             #0: NullProc;
             #10: LFProc;
             #13: CRProc;
          else begin
              fTokenID := tkString;
              repeat
                 if CRange = rsQuotedBracket then begin
                     case CheckForWantedBracket(FLine[FLineOffset],FCurrentRange) of
                         bOpen    : if not IsPreviousBackSlash(FLineOffset) then
                                       IncBracketCounter(FCurrentRange);
                         bClose   : if not IsPreviousBackSlash(FLineOffset) then begin
                                       if IsBracketLevelsZero(FCurrentRange) then begin
                                           IncRangeStep(FCurrentRange);
                                           exit;
                                        end;
                                        DecBracketCounter(FCurrentRange);
                                    end;
                     end;
                 end else
                     if (FLine[FLineOffset] = CChar) and
                        not IsPreviousBackSlash(FLineOffset) then begin
                            IncRangeStep(FCurrentRange);
                            exit;
                     end;
                 Inc(FLineOffset);
              until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
          end;
       end;
   end;
   3 : begin
       FCurrentRange := BuildSimpleRange(rsUnknown);
       FTokenID := tkOperator;
       Inc(FLineOffset);
   end;
  end;
end;

procedure TSynMPerlSyn.QWInterProc(Step : integer);
var i : integer;
    OldToken : TTokenKind;
begin
  case Step of
   0 : begin
      FTokenID := tkSpace;
      case FLine[FLineOffset] of
          #0:  NullProc;
          #10: LFProc;
          #13: CRProc;
          else repeat
                 if VarIA[FLine[FLineOffset]] <> vltSpace then begin
                     if (CRange = rsQuotedInter) and
                          IsOpenBracket(FLine[FLineOffset]) then
                          FCurrentRange := BuildBracketRange(
                                           FLine[FLineOffset],
                                           Byte(rsQuotedInterBracket),1)
                     else
                          FCurrentRange := BuildDelimiterRange(FLine[FLineOffset],CRange,1);
                     break
                 end;
                 Inc(FLineOffset);
               until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
      end;
   end;
   1 : begin
       Inc(FLineOffset);
       fTokenID := tkOperator;
       IncRangeStep(FCurrentRange);
   end;
   2 : begin
       i := 0;
       case FLine[FLineOffset] of
             #0: NullProc;
             #10: LFProc;
             #13: CRProc;
          else begin
              fTokenID := tkString;
              repeat
                 if CRange = rsQuotedInterBracket then begin
                     case CheckForWantedBracket(FLine[FLineOffset],
                                                FCurrentRange) of
                         bOpen    : if not IsPreviousBackSlash(FLineOffset) then
                                       IncBracketCounter(FCurrentRange);
                         bClose   : if not IsPreviousBackSlash(FLineOffset) then begin
                                       if IsBracketLevelsZero(FCurrentRange) then begin
                                           IncRangeStep(FCurrentRange);
                                           exit;
                                        end;
                                        DecBracketCounter(FCurrentRange);
                                    end;
                     end;
                 end else
                     if (FLine[FLineOffset] = CChar) and
                        not IsPreviousBackSlash(FLineOffset) then begin
                            IncRangeStep(FCurrentRange);
                            exit;
                     end;
                 // poHighlightVariables
                 if  (poHighlightVariables in FOptions) and 
                     (FLine[FLineOffset]  in ['$','@']) and
                      not IsPreviousBackSlash(FLineOffset) then begin
                      
                      OldToken := FTokenID;
                      if i = 0 then
                         if FLine[FLineOffset] = '$' then VarProc else ArrayProc;

                      case FTokenID of
                        tkSymbol : FTokenID := OldToken;
                        tkVariable : FTokenID :=  tkVarInQuoted;
                        tkPredefinedVar : FTokenID :=  tkSpecialVarInQuoted;
                      end;  
                      break;
                 end;
                 Inc(i);
                 //
                 Inc(FLineOffset);
              until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
          end;
       end;
   end;
   3 : begin
       FCurrentRange := BuildSimpleRange(rsUnknown);
       FTokenID := tkOperator;
       Inc(FLineOffset);
   end;
  end;
end;


function  TSynMPerlSyn.IsPreviousBackSlash(Offset : integer) : boolean;
var i : integer;
begin
   i:=Offset-1;
   while i >= 0 do if FLine[i] <> '\' then break else Dec(i);
   IsPreviousBackSlash := (Offset - i) mod 2 <> 1
end;

procedure TSynMPerlSyn.S_BetweenBrackets;
begin
   fTokenId := tkUnknown;

   case FLine[FLineOffset] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
    #32,#1..#9,#11,#12,#14..#31 : begin
                                 fTokenId := tkSpace;
                                 while GenIA[FLine[FLineOffset]]=gltSpaces do
                                    Inc(FLineOffset)
                              end;
    else repeat
           if FLine[FLineOffset] in ['[','<','{','('] then begin 
              FCurrentRange := BuildBracketRange(FLine[FLineOffset],
                               Byte(rsS_SecondBracket),1);
              break;
           end;                    
           
           Inc(FLineOffset);
         until GenIA[FLine[FLineOffset]] in [gltCRLFNULL,gltSpaces];
   end;
end;

procedure TSynMPerlSyn.Tr_BetweenBrackets;
begin
   fTokenId := tkUnknown;

   case FLine[FLineOffset] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
    #1..#9,#11,#12,#14..#32 : begin
                                 fTokenId := tkSpace;
                                 while GenIA[FLine[FLineOffset]]=gltSpaces do
                                    Inc(FLineOffset)
                              end;
    else repeat
           if FLine[FLineOffset] in ['[','<','{','('] then begin 
              FCurrentRange := BuildBracketRange(FLine[FLineOffset],
                               Byte(rsTr_SecondBracket),1);
              break;
           end;                    

           Inc(FLineOffset);
         until GenIA[FLine[FLineOffset]] in [gltCRLFNULL,gltSpaces];
   end;
end;

procedure TSynMPerlSyn.MProc(Step : integer);
var  OldToken : TTokenKind;
     i : integer;
     C : Char;
begin
  case Step of
   0 : begin
      FTokenID := tkSpace;
      case FLine[FLineOffset] of
          #0:  NullProc;
          #10: LFProc;
          #13: CRProc;
          else repeat
                 if VarIA[FLine[FLineOffset]] <> vltSpace then begin
                    if (CRange in [rsM,rsQR,rsS_First,rsTr_First]) and
                        IsOpenBracket(FLine[FLineOffset]) then
                        FCurrentRange := BuildBracketRange(
                                           FLine[FLineOffset],Byte(CRange)+1,1)
                    else
                         FCurrentRange := BuildDelimiterRange(FLine[FLineOffset],CRange,1);
                    break;
                 end;
                 Inc(FLineOffset);
               until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
      end;
   end;
   1 : begin
       Inc(FLineOffset);
       fTokenID := tkOperator;
       IncRangeStep(FCurrentRange);
   end;
   2 : begin
       i := 0;
       C := #0;
       case FLine[FLineOffset] of
             #0: NullProc;
             #10: LFProc;
             #13: CRProc;
          else begin
              fTokenID := tkRe;
              repeat
                if CRange in
                    [rsMBracket,rsQRBracket,rsS_SecondBracket,rsS_FirstBracket,
                     rsTr_SecondBracket,rsTr_FirstBracket] then begin
                     
                    case CheckForWantedBracket(FLine[FLineOffset],
                                               FCurrentRange) of
                        bOpen    : if not IsPreviousBackSlash(FLineOffset) then
                                      IncBracketCounter(FCurrentRange);
                        bClose   : if not IsPreviousBackSlash(FLineOffset) then begin
                                      if IsBracketLevelsZero(FCurrentRange) then begin
                                         IncRangeStep(FCurrentRange);
                                         exit;
                                      end;
                                      DecBracketCounter(FCurrentRange);
                                   end;
                    end;
                end else
                   if (FLine[FLineOffset] = CChar)  and
                      not IsPreviousBackSlash(FLineOffset) then begin
                          IncRangeStep(FCurrentRange);
                          exit;
                   end;
                //##########HighlightVariables
                if C <> #0 then begin
                    OldToken := FTokenID;
                    Dec(FLineOffset);
                    if C = '$' then VarProc else ArrayProc;
                    case FTokenID of
                      tkSymbol : FTokenID := OldToken;
                      tkVariable : FTokenID :=  tkVarInQuoted;
                      tkPredefinedVar : FTokenID :=  tkSpecialVarInQuoted;
                    end;
                    break;
                end;
                if  (poHighlightVariables in FOptions) and
                    (FLine[FLineOffset]  in ['$','@']) and
                    not (CRange in
                         [rsTr_First,rsTr_FirstBracket,rsTr_Second,rsTr_SecondBracket]) and
                    not IsPreviousBackSlash(FLineOffset) then begin
                    if i = 0 then C := FLine[FLineOffset] else break
                end;
                Inc(i);
                //##########HighlightVariables

                Inc(FLineOffset);
             until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
          end;
       end;
   end;
   3 : begin
       FTokenID := tkOperator;
       Inc(FLineOffset);

       case CRange of
          rsS_FirstBracket : begin
                                SRange(rsS_BetweenBrackets);
                                exit;
                             end ;
                 rsS_First : begin
                               SRange(rsS_Second);
                               SetStep(FCurrentRange,2);
                               exit;
                             end;
         rsTr_FirstBracket : begin
                               SRange(rsTr_BetweenBrackets);
                               exit;
                             end ;
                rsTr_First : begin
                                SRange(rsTr_Second);
                                SetStep(FCurrentRange,2);
                                exit;
                             end;
          rsQRBracket,rsQR : while FLine[FLineOffset] in
                               ['i','m','o','s','x' ] do Inc(FLineOffset);
              rsM,rsMSlash,
                rsMBracket : while FLine[FLineOffset] in
                               ['c','g','i','m','o','s','x' ] do Inc(FLineOffset);
        rsS_SecondBracket,
                rsS_Second : while FLine[FLineOffset] in
                               ['e','g','i','m','o','s','x' ] do Inc(FLineOffset);
       rsTr_SecondBracket,
               rsTr_Second : while FLine[FLineOffset] in
                               ['c','d','s' ] do Inc(FLineOffset);
       end;
       FCurrentRange := BuildSimpleRange(rsUnknown);
     end;
  end;
end;

function TSynMPerlSyn.GetToken: string;
var
  Len: LongInt;
begin
  Len := FLineOffset - fTokenPos;
  SetString(Result, (FLine + FTokenPos), Len);
end;

constructor TSynMPerlSyn.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);

   FSpecialSUBAttributes := TSynHighlighterAttributes.Create(SYNS_AttrFunction);
   AddAttribute(FSpecialSUBAttributes);

   FUnknownAttributes := TSynHighlighterAttributes.Create(SYNS_AttrIllegalChar);
   AddAttribute(FUnknownAttributes);

   FCommentAttributes := TSynHighlighterAttributes.Create(SYNS_AttrComment);
   AddAttribute(FCommentAttributes);

   FPodAttributes := TSynHighlighterAttributes.Create(SYNS_AttrEmbedText);
   AddAttribute(FPodAttributes);

   FVariableAttributes := TSynHighlighterAttributes.Create(SYNS_AttrVariable);
   AddAttribute(FVariableAttributes);

   FBinNumberAttributes := TSynHighlighterAttributes.Create('BinNumber');
   AddAttribute(FBinNumberAttributes);

   FQuoteAttributes := TSynHighlighterAttributes.Create(SYNS_AttrString);
   AddAttribute(FQuoteAttributes);

   FOctNumberAttributes := TSynHighlighterAttributes.Create('OctalNumber');
   AddAttribute(FOctNumberAttributes);

   FPragmaAttributes := TSynHighlighterAttributes.Create(SYNS_AttrPragma);
   AddAttribute(FPragmaAttributes);

   FSpecialVarInQuotedAttributes := TSynHighlighterAttributes.Create('SpecialVarInQuoted');
   AddAttribute(FSpecialVarInQuotedAttributes);

   FFormatAttributes := TSynHighlighterAttributes.Create('OutputFormats');
   AddAttribute(FFormatAttributes);

   FDecNumberAttributes := TSynHighlighterAttributes.Create(SYNS_AttrNumber);
   AddAttribute(FDecNumberAttributes);

   FOperatorAttributes := TSynHighlighterAttributes.Create(SYNS_AttrOperator);
   AddAttribute(FOperatorAttributes);

   FSymbolAttributes := TSynHighlighterAttributes.Create(SYNS_AttrSymbol);
   AddAttribute(FSymbolAttributes);

   FInternalFunctionAttributes := TSynHighlighterAttributes.Create(SYNS_AttrInternalFunction);
   AddAttribute(FInternalFunctionAttributes);

   FKeywordAttributes := TSynHighlighterAttributes.Create(SYNS_AttrKey);
   AddAttribute(FKeywordAttributes);

   FVarInQuotedAttributes := TSynHighlighterAttributes.Create('VarInQuoted');
   AddAttribute(FVarInQuotedAttributes);

   FREAttributes := TSynHighlighterAttributes.Create('RegularExpressions');
   AddAttribute(FREAttributes);

   FHexNumberAttributes := TSynHighlighterAttributes.Create('HexNumber');
   AddAttribute(FHexNumberAttributes);

   FEndOfDataAttributes := TSynHighlighterAttributes.Create(SYNS_AttrText);
   AddAttribute(FEndOfDataAttributes);

   FSpaceAttributes := TSynHighlighterAttributes.Create(SYNS_AttrSpace);
   AddAttribute(FSpaceAttributes);

   FHEREDOCAttributes := TSynHighlighterAttributes.Create('HEREDOC');
   AddAttribute(FHEREDOCAttributes);

   FPredefinedVarAttributes := TSynHighlighterAttributes.Create(SYNS_AttrSpecialVariable);
   AddAttribute(FPredefinedVarAttributes);

   MakeMethodTables;
   FCurrentRange  := BuildSimpleRange(rsUnknown);
   SetAttributesOnChange(DefHighlightChange);
   fDefaultFilter := SYNS_FilterPerl;
end;

function TSynMPerlSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT:    Result := fCommentAttributes;
    SYN_ATTR_IDENTIFIER: Result := fVariableAttributes;
    SYN_ATTR_KEYWORD:    Result := fKeywordAttributes;
    SYN_ATTR_STRING:     Result := fQuoteAttributes;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttributes;
    else result := nil;
  end;
end;

function TSynMPerlSyn.GetEol: Boolean;
begin
  Result := fTokenID = tkNull;
end;

function TSynMPerlSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
   result := FAttributesTable[fTokenID]
end;

function TSynMPerlSyn.GetTokenKind: integer;
begin
  Result := Ord(fTokenId);
end;

function TSynMPerlSyn.GetTokenPos: Integer;
begin
  Result := fTokenPos;
end;

procedure TSynMPerlSyn.Next;
begin
    FTokenPos := FLineOffset;

    case RecognizeRange(FCurrentRange) of
        rskSimple : FRangeProcTable[CRange];
     rskDelimiter : case CRange of
                       rsS_BetweenBrackets  : S_BetweenBrackets;
                       rsTr_BetweenBrackets : Tr_BetweenBrackets;
                       rsQuoted,
                       rsQuotedBracket : QWProc(CStep);
                       rsQuotedInter,
                       rsQuotedInterBracket : QWInterProc(CStep);
                       rsS_First,
                       rsS_FirstBracket,
                       rsS_SecondBracket,
                       rsS_Second,
                       rsMSlash,
                       rsTr_First,
                       rsTr_Second,
                       rsTr_FirstBracket,
                       rsTr_SecondBracket,
                       rsQR,rsM,
                       rsQRBracket,
                       rsMBracket      : MProc(CStep);
                       else
                           fProcTable[FLine[FLineOffset]];
                    end;
       rskHeredoc : HeredocProc(false);
    end;
end;

procedure TSynMPerlSyn.EndOfDataProc;
begin

  case FLine[FLineOffset] of
     #0  : NullProc;
     #10 : LFProc;
     #13 : CRProc;
     else begin
       fTokenID := tkEnd;
       repeat inc(FLineOffset);
       until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
     end;
  end;
end;

procedure TSynMPerlSyn.BeforeScriptProc;
begin
  if (FLineOffset=0) and (FLine[0]='#') and (FLine[1]='!') then begin
     if 0<>pos('perl',FLine) then begin
        fTokenID := tkEnd;
        repeat inc(FLineOffset);
        until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
        FCurrentRange := BuildSimpleRange(rsUnknown);
        Inc(FXOffset);
        exit;
     end;
  end;
  case FLine[FLineOffset] of
     #0  : begin 
               NullProc;
               Inc(FXOffset);
           end;    
     #10 : LFProc;
     #13 : CRProc;
     else begin
       fTokenID := tkEnd;
       repeat inc(FLineOffset);
       until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
     end;
  end;
end;

procedure TSynMPerlSyn.SetLine(NewValue: String; LineNumber:Integer);
begin
  FLine := PChar(NewValue);
  FLineOffset := 0;

  if (LineNumber = 0) and (poParseWithXSwitch in FOptions) then begin
      FCurrentRange := BuildSimpleRange(rsBeforeScript);
      FXOffset := 0;
  end;    
  Next;
end;

procedure TSynMPerlSyn.NullProc;
begin
   fTokenID := tkNull;
   if FSkipHeredocBeforeEOL then begin
      FSkipHeredocBeforeEOL := false;
      FCurrentRange := HeredocSkipRange;
   end;
end;
procedure TSynMPerlSyn.LFProc;
begin
  fTokenID := tkSpace;
  if FSkipHeredocBeforeEOL then begin
      FSkipHeredocBeforeEOL := false;
      FCurrentRange := HeredocSkipRange;
  end;
  Inc(FLineOffset)
end;

procedure TSynMPerlSyn.CRProc;
begin
  if FSkipHeredocBeforeEOL then begin
      FSkipHeredocBeforeEOL := false;
      FCurrentRange := HeredocSkipRange;
  end;
  fTokenID := tkSpace;
  inc(FLineOffset);
  if FLine[FLineOffset] = #10 then inc(FLineOffset);
end;

procedure TSynMPerlSyn.SpaceProc;
begin
  inc(FLineOffset);
  fTokenID := tkSpace;
  while GenIA[FLine[FLineOffset]] = gltSpaces do inc(FLineOffset);
end;

procedure TSynMPerlSyn.CommentProc;
begin
  fTokenID := tkComment;
  repeat
    if GenIA[FLine[FLineOffset]] = gltCRLFNULL then break;
    inc(FLineOffset);
  until FLine[FLineOffset] = #0;
end;

{$IFNDEF SYN_CPPB_1} class {$ENDIF}  //mh 2000-07-14
function TSynMPerlSyn.GetLanguageName: string;
begin
  Result := SYNS_LangPerl;
end;

function TSynMPerlSyn.GetRange: Pointer;
begin
    Result := Pointer(FCurrentRange);
end;

procedure TSynMPerlSyn.SetRange(Value: Pointer);
begin
   fCurrentRange := TRangeState(Value);
end;

procedure TSynMPerlSyn.ReSetRange;
begin
  fCurrentRange := BuildSimpleRange(rsUnknown);
end;

procedure TSynMPerlSyn.ProcUnderscore;
begin
   fTokenID := tkSymbol;
   ToIdentIdent;

   if FLine[FLineOffset-FStringLen+1]='_' then
      case CalcCRC32(FToIdent,FStringLen) of
        $5B01334B{__DATA__},
        $72F9F3A9{__END__} : begin
                                   fTokenID := tkEND;
                                   if not (poParseAfter__END__ in FOptions) then
                                       fCurrentRange := BuildSimpleRange(rsEndOfData);
                               end;
        $B41D0E2D{__FILE__},
        $F7B6B1C1{__PACKAGE__},
        $BF8FE5C0{__LINE__},
        $D38C8897{__DIE__},
        $F0745B9F{__WARN__} : fTokenID := tkPredefinedVar;
      end;
end;


procedure TSynMPerlSyn.PodProc;
begin
  fTokenID := tkPod;
  if (FLineOffset = 0) and
     (FLine[0] = '=')  and //
     (FLine[1] = 'c')  and // Very smart, isn't it ? :-)
     (FLine[2] = 'u')  and //
     (FLine[3] = 't')  then begin
     Inc(FLineOffset,4);
     FCurrentRange := BuildSimpleRange(rsUnknown);
     while GenIA[FLine[FLineOffset]] <> gltCRLFNULL do inc(FLineOffset);
     exit;
  end;

  case FLine[FLineOffset] of
    #0  : NullProc;
    #10 : LFProc;
    #13 : CRProc;
    else begin
      repeat
          inc(FLineOffset);
      until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
    end;
  end;
end;

procedure TSynMPerlSyn.ToIdent(Index : integer);
begin
    FToIdent := FLine+ FLineOffset;
    while FLine[FLineOffset] in IdentArray[Index] do
          Inc(FLineOffset);
    FStringLen := (FLine + FLineOffset)-FToIdent;
end;

procedure TSynMPerlSyn.ToIdentIdent;
begin
    FToIdent := FLine+FLineOffset;
    while GenIA[FLine[FLineOffset]] = gltIdent do Inc(FLineOffset);
    FStringLen := (FLine + FLineOffset)-FToIdent;
end;

procedure TSynMPerlSyn.ToIdentIdentSingle;
begin
    FToIdent := FLine+FLineOffset;
    while (GenIA[FLine[FLineOffset]] = gltIdent) or
          (FLine[FLineOffset] = '''') do Inc(FLineOffset);
    FStringLen := (FLine + FLineOffset)-FToIdent;
end;

procedure TSynMPerlSyn.EqualProc;
begin
  fTokenID := tkSymbol;
  if FLineOffset = 0 then begin
      if not ( (FLine[1] = 'c') and
         (FLine[2] = 'u') and
         (FLine[3] = 't') and not
         (FLine[4] in ['a'..'z','A'..'Z'])) then begin
         if FLine[1] in ['a'..'z','A'..'Z'] then begin
             Inc(FLineOffset,2);
             fTokenID := tkPod;
             fCurrentRange := BuildSimpleRange(rsPod);
             exit
         end;
     end;
  end;
  Inc(FLineOffset);
end;

procedure TSynMPerlSyn.LessProc;
var i,j,k,len : integer;
    Quote : Char;
    s : string;
    QuoteInside : boolean;
    Empty : TPredefinedRangeStates;
begin
  fTokenID := tkSymbol;
  Inc(FLineOffset);
  if FLine[FLineOffset] <> '<' then begin
      FileDescriptorProc; 
      exit;
  end;       
  Inc(FLineOffset);
  case FLine[FLineOffset] of
     ' ',#0,
     #13,#10 : ; // no HEREDOC, it is SHIFT LEFT operation
     ';'     : begin
                  //Dec(FLineOffset);
                  FCurrentRange:= BuildSimpleRange(rsEmptyHeredocInter) ;
                  HeredocSkipRange := FCurrentRange;
                  FSkipHeredocBeforeEOL := true;
                  fTokenID := tkHeredoc;
               end;
     #39,'"',
         '`' : begin
                  if FLine[FLineOffset] = #39 then 
                     Empty := rsEmptyHeredocSingle
                  else
                     Empty := rsEmptyHeredocInter;   
                  
                  Quote :=  FLine[FLineOffset];
                  Inc(FLineOffset);
                  i:= FLineOffset;
                  QuoteInside := true;
                  while true do begin
                     if FLine[i] in [#0,#10,#13] then break; //Unterminated
                                                             //string, no Heredoc
                     if (FLine[i] = Quote) then begin
                        if not IsPreviousBackSlash(i) then begin
                            len := i-FLineOffset;
                            fTokenID := tkHeredoc;
                            if len = 0 then
                                FCurrentRange:= BuildSimpleRange(Empty)
                            else begin
                                if QuoteInside then begin
                                   s := Copy(FLine+FLineOffset,1,len);
                                   j := 1;
                                   while s <> '' do begin
                                       k := j;
                                       j:=pos('\'+Quote,Copy(s,k,length(s)));
                                       if j = 0 then break;
                                       Delete(s,j+k-1,1);
                                   end;
                                   if s = '' then
                                       FCurrentRange:= BuildSimpleRange(Empty)
                                   else
                                       FCurrentRange := BuildRangePointer(
                                       CalcCRC32(PChar(s),Length(s)),Length(s));
                                end else 
                                     FCurrentRange := BuildRangePointer(
                                            CalcCRC32(FLine+FLineOffset,
                                            len),len);

                                if Empty = rsEmptyHeredocSingle then 
                                    Inc(FCurrentRange,FLAG_HEREDOC_NOINTER);
           
                            end;

          {+}               if FSkipHeredocBeforeEOL and 
                                CompareHeredocCRC(FCurrentRange,HeredocSkipRange) then begin
                                IncHeredocStep(HeredocSkipRange);
                                FCurrentRange := HeredocSkipRange;
          {-}               end;

                            FLineOffset := i+1;
                            FSkipHeredocBeforeEOL := true;
                            HeredocSkipRange := FCurrentRange;

                            break;
                        end;
                     end else QuoteInside := true;
                     Inc(i);
                  end;
               end;
     else      begin
                  fTokenID := tkHeredoc;
                  i:= FLineOffset;
                  while GenIA[FLine[i]] = gltIdent do Inc(i);
                  len := i-FLineOffset;
                  FCurrentRange := BuildRangePointer(
                          CalcCRC32(FLine+FLineOffset,len),len);
                  Inc(FLineOffset,len);
                  
{+}               if FSkipHeredocBeforeEOL and
                     CompareHeredocCRC(FCurrentRange,HeredocSkipRange) then begin
                     IncHeredocStep(HeredocSkipRange);
                     FCurrentRange := HeredocSkipRange;
                  end else
{-}                  HeredocSkipRange := FCurrentRange;

                  FSkipHeredocBeforeEOL := true;
               end;
  end;
end;

procedure TSynMPerlSyn.HeredocProc(IsEmptyHeredoc : boolean);
var i,l : integer;
    OldToken : TTokenKind;
    HVariables : boolean;
label l_main;
begin
  if FSkipHeredocBeforeEOL then begin
     fProcTable[FLine[FLineOffset]];
     exit;
  end;
  
  HVariables := (poHighlightVariables in FOptions) and 
    (
      (IsEmptyHeredoc and (CRange = rsEmptyHeredocInter)) 
      or
      (not IsEmptyHeredoc and (FCurrentRange and FLAG_HEREDOC_NOINTER = 0 ))
    ); 
                
  fTokenID := tkHeredoc;
  if (FLineOffset = 0) then begin
     if IsEmptyHeredoc then begin
        if FLine[0] in [#0,#13,#10] then
           FCurrentRange := BuildSimpleRange(rsUnknown);
        goto l_main;
     end;
     l:= ExtractStringLenFromHash(FCurrentRange);
     i:=0;
     while not (FLine[i] in [#0,#13,#10]) do begin
        if i > l then goto l_main;
        Inc(i);
     end;
     if i<>l then goto l_main;
     
{+}  if CompareHeredocCRC(FCurrentRange,CalcCRC32(FLine,i)) then begin
        if FCurrentRange and $f <> 0 then 
           DecHeredocStep(FCurrentRange)
        else begin   
           FCurrentRange := BuildSimpleRange(rsUnknown);
           FLineOffset := i;
           exit
        end;   
{-}  end;
  end;

l_main:
  i := 0;

  case FLine[FLineOffset] of
    #0  : NullProc;
    #10 : LFProc;
    #13 : CRProc;
    else begin
      repeat
          if  HVariables and          
              (FLine[FLineOffset]  in ['$','@']) and
               not IsPreviousBackSlash(FLineOffset) then begin
               
               OldToken := FTokenID;
               if i = 0 then  
                  if FLine[FLineOffset] = '$' then VarProc else ArrayProc;

               case FTokenID of
                 tkSymbol : FTokenID := OldToken;
                 tkVariable : FTokenID :=  tkVarInQuoted;
                 tkPredefinedVar : FTokenID :=  tkSpecialVarInQuoted;
               end;  
               break;
          end;
          Inc(i);
          inc(FLineOffset);
      until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
    end;
  end;
end;

procedure TSynMPerlSyn.FromLetterProc; 
var oldlineoffset : integer;
begin
   oldlineoffset := FLineOffset;

   case FLine[FLineOffset] of
      'm' : if CheckSharp(1) and CheckAsterisk then begin
              FCurrentRange  := BuildSimpleRange(rsM);
              ftokenID  := tkOperator;
              Inc(FLineOffset,1);
              exit;                                        
            end;                          
      's' : if CheckSharp(1) and CheckAsterisk then begin
              FCurrentRange  := BuildSimpleRange(rsS_First);
              ftokenID  := tkOperator;
              Inc(FLineOffset,1);
              exit;                                        
            end;
      'y' : if CheckSharp(1) and CheckAsterisk then begin
              FCurrentRange  := BuildSimpleRange(rsTr_First);
              ftokenID  := tkOperator;
              Inc(FLineOffset,1);
              exit;                                        
            end;
      't' : if (FLine[FLineOffset+1] = 'r') and CheckSharp(2) and CheckAsterisk then begin
              FCurrentRange  := BuildSimpleRange(rsTr_First);
              ftokenID  := tkOperator;
              Inc(FLineOffset,2);
              exit;                                        
            end;                                           
      'q' : if (FLine[FLineOffset+1] = 'r') and CheckSharp(2) and CheckAsterisk then begin
              FCurrentRange  := BuildSimpleRange(rsQR);
              ftokenID  := tkOperator;
              Inc(FLineOffset,2);
              exit;                                        
            end;
      'v': begin
              Inc(FLineOffset) ;
              while true do begin
                 while FLine[FLineOffset] in ['0'..'9'] do Inc(FLineOffset);
                 if oldlineoffset +1 = FLineOffset then break;

                 if FLine[FLineOffset] <> '.' then begin
                    ftokenID  := tkDecNumber;
                    exit;
                 end;
                 if not (FLine[FLineOffset+1] in ['0'..'9']) then begin
                    ftokenID  := tkDecNumber;
                    Dec(FLineOffset);
                    exit;
                 end;
                 Inc(FLineOffset);
              end;
           end;
   end;

   FLineOffset := oldlineoffset;

   //Получим идентификатор
   while true do begin
      ToIdentIdent;
      if FLine[FLineOffset]   <> ':' then break;
      if FLine[FLineOffset+1] <> ':' then break;
      if GenIA[FLine[FLineOffset+2]] <> gltIdent then break;
      Inc(FLineOffset,2);
   end;
   //Опознаем слово по CRC
   FTokenID := CheckIdentCRC(CalcCRC32(FLine+oldlineoffset,FLineOffset-oldlineoffset));
   //Особая обработка для некоторых случаев
   case FTokenID of
              tkSub :  begin
                          if (oldlineoffset <> 0) and
                             (FLine[oldlineoffset-1] = '&') then begin
                             FTokenID := tkSymbol;
                          end else begin   
                             FCurrentRange := BuildSimpleRange(rsAfterSub);
                          end;   
                       end;
           tkSpecSub : begin
                          FCurrentRange  := BuildSimpleRange(rsAfterSubName);
                       end;            
   tkPackageKeyword  : begin 
                          FCurrentRange := BuildSimpleRange(rsAfterPackage);
                       end;  
      tkFormatHeader : begin
                         Dec(oldlineoffset);
                         while (oldlineoffset >= 0) do begin
                             if GenIA[FLine[oldlineoffset]] <> gltSpaces then begin
                                 FTokenID := tkInternalFunction;
                                 exit; 
                             end;
                             Dec(oldlineoffset);
                         end; 
                         FCurrentRange := BuildSimpleRange(rsFormatBody);
                         FTokenID := tkInternalFunction
                       end;
   end; // case;                    
end;


procedure TSynMPerlSyn.QuoteProc;
begin
   fTokenID        := tkString;
   fCurrentRange   := BuildSimpleRange(rsString);
   Inc(FLineOffset);
end;

procedure TSynMPerlSyn.BackQuoteProc;
begin
   fTokenID        := tkBackQuote;
   fCurrentRange   := BuildSimpleRange(rsBackQuote);
   Inc(FLineOffset);
end;

procedure TSynMPerlSyn.SingleQuoteProc;
begin
   fTokenID        := tkSingleString;
   fCurrentRange   := BuildSimpleRange(rsSingleString);
   Inc(FLineOffset);
end;

procedure TSynMPerlSyn.GenQuoteProc;
var C : Char;
    i : integer;
    OldToken : TTokenKind;
begin
   C := #0;
   case CRange of
      rsString       : begin C := '"'; fTokenID := tkString; end;
      rsSingleString : begin C := #39; fTokenID := tkSingleString; end;
      rsBackQuote    : begin C := '`'; fTokenID := tkBackQuote; end;
   end;
   i := 0;
   
   case FLine[FLineOffset] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
    else begin
       repeat
          if (FLine[FLineOffset] = C) and
              not IsPreviousBackSlash(FLineOffset) then begin

              Inc(FLineOffset);
              fCurrentRange := BuildSimpleRange(rsUnknown);
              break;
          end;
          if  (poHighlightVariables in FOptions) and (c <> #39) and 
              (FLine[FLineOffset]  in ['$','@']) and
               not IsPreviousBackSlash(FLineOffset) then begin
               OldToken := FTokenID;
               if i = 0 then 
                   if FLine[FLineOffset] = '$' then VarProc else ArrayProc;
               
               case FTokenID of
                 tkSymbol : FTokenID := OldToken;
                 tkVariable : FTokenID :=  tkVarInQuoted;
                 tkPredefinedVar : FTokenID :=  tkSpecialVarInQuoted;
               end;  
               break;
          end;
          Inc(FLineOffset);
          Inc(i);
       until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
    end;
  end;
end;

procedure TSynMPerlSyn.FormatProc;
begin
   fTokenID := tkFormatBody;

   if (FLineOffset = 0) then begin
      if (FLine[FLineOffset] ='.') and
         (GenIA[FLine[FLineOffset+1]] = gltCRLFNULL) then begin
         Inc(FLineOffset);
         FCurrentRange := BuildSimpleRange(rsUnknown);
         exit;
      end;
      if (FLine[FLineOffset] ='#') then begin
         fTokenID := tkComment;
         while not (GenIA[FLine[FLineOffset]] = gltCRLFNULL) do
             Inc(FLineOffset);
         exit;
      end;
   end;

   case FLine[FLineOffset] of
      #0: NullProc;
     #10: LFProc;
     #13: CRProc;
     else begin
            repeat
              Inc(FLineOffset);
            until GenIA[FLine[FLineOffset]] = gltCRLFNULL;
     end;
   end;
end;


procedure TSynMPerlSyn.PipeProc;
begin
    if FLine[FlineOffset+1]='|' then begin
       Inc(FLineOffset,2);
       FTokenID := tkOperator;
       exit;
    end;

    SymbolProc;
end;    

procedure TSynMPerlSyn.AmpersandProc;
begin
    if FLine[FlineOffset+1]='&' then begin
       Inc(FLineOffset,2);
       FTokenID := tkOperator;
       exit;
    end;

    Inc(FLineOffset);
    FTokenID := tkSymbol;
    
    // вызов процедуры
    if IdeIA[FLine[FlineOffset]] in [iltAlpha,iltColon,iltSingle] then begin
       while IdeIA[FLine[FlineOffset]] <> iltOther do begin
          Inc(FLineOffset);
       end;
    end;       
end;                      

procedure TSynMPerlSyn.VarProc;
var OldLineOffset : integer;
label label_end;
begin
   Inc(FLineOffset);
   ftokenid := tkSymbol;

   case VarIA[FLine[FLineOffset]] of
      vltSpace : ;
      vltCaret : case VarIA[FLine[FLineOffset+1]] of
                     vltSpace : begin
                                   fTokenID := tkPredefinedVar; // $^ var
                                   Inc(FLineOffset);
                                end;
                     vltOther : if (GenIA[FLine[FLineOffset+2]] <> gltIdent) and
                                   (FLine[FLineOffset+1] in ['L','A','E','F','C','D','V','H','M','O','R','S','X','I','P','T','W'])
                                   then begin
                                   fTokenID := tkPredefinedVar;
                                   Inc(FLineOffset,2);
                                end;
                 end;
  // variable enclosed in curly
  vltLeftCurly : begin
                    // predefined vars, only ${C} type.Warning - colon,caret!
                    if VarIA[FLine[FLineOffset+1]] in [vltPredefined,
                        vltSharp,vltDollar,vltUnderscore,vltColon] then begin
                        if FLine[FLineOffset+2] = '}' then begin
                           FTokenID := tkPredefinedVar;
                           Inc(FLineOffset,3)
                        end;   
                        // check for case $::
                        if (FLine[FLineOffset+1] <> ':') or
                           (FLine[FLineOffset+2] <> ':') then 
                           exit;
                        // Now we have ${:: сituation. 
                        OldLineOffset := FLineOffset;
                        Inc(FLineOffset,3);
                        FTokenID := RecognizePackageVar;
                        if FLine[FLineOffset] <> '}' then begin
                          FTokenID := tkSymbol;
                          FLineOffset := OldLineOffset;
                          exit;
                       end;   
                       if (FTokenID = tkPredefinedVar) and
                          (OldLineOffset - FLineOffset = 3) then begin
                          FTokenID := tkSymbol;
                          FLineOffset := OldLineOffset;
                          exit;
                       end;
                       Inc(FLineOffset);   
                       exit;    
                    end;
                    if FLine[FLineOffset+1] = '^' then 
                       case FLine[FLineOffset+2] of
                          '}' : begin 
                                  FTokenID := tkPredefinedVar;
                                  Inc(FLineOffset,3);
                                  goto label_end;
                                end;   
                 'L','A','E','F','C','D','V','H','M','O','R','S','X','I','P','T','W' : if FLine[FLineOffset+3] = '}' then begin
                                  FTokenID := tkPredefinedVar;
                                  Inc(FLineOffset,4);
                                  goto label_end;
                                end else exit;   
                       end;            
                    // ordinal variables
                    if (GenIA[FLine[FLineOffset+1]] = gltIdent) or
                       ((FLine[FLineOffset+1] = ':') and (FLine[FLineOffset+2] = ':')) then begin
                       OldLineOffset := FLineOffset;
                       Inc(FLineOffset);
                       FTokenID := RecognizePackageVar;
                       if FLine[FLineOffset] <> '}' then begin
                          FTokenID := tkSymbol;
                          FLineOffset := OldLineOffset;
                          exit;
                       end;   
                       Inc(FLineOffset);  
                     end; 
                 end;
      vltColon : if GenIA[FLine[FLineOffset+1]] <> gltIdent then begin
                    if FLine[FLineOffset+1] = ':' then begin
                        Inc(FLineOffset,2);
                        FTokenID := RecognizePackageVar;
                    end else begin
                        fTokenID := tkPredefinedVar; // $: var
                        Inc(FLineOffset);
                    end;
                 end;
     vltDollar : if (GenIA[FLine[FLineOffset+1]] = gltIdent) or
                    (FLine[FLineOffset+1] in ['$',':']) then
                    ProcessRefs
                 else begin
                    fTokenID := tkPredefinedVar; // $$ var
                    Inc(FLineOffset);
                 end;
 vltPredefined : if GenIA[FLine[FLineOffset+1]] <> gltIdent then begin
                     fTokenID := tkPredefinedVar;
                     Inc(FLineOffset);
                 end else
                 if FLine[FLineOffset] = '''' then begin
                    Inc(FLineOffset);
                    FTokenID := RecognizePackageVar;
                 end;
                 
      vltDigit : if GenIA[FLine[FLineOffset+1]] <> gltIdent then begin
                     fTokenID := tkPredefinedVar;
                     Inc(FLineOffset);
                 end else
                 if (VarIA[FLine[FLineOffset+1]] = vltDigit) and
                    (FLine[FLineOffset]<>'0') and
                    (GenIA[FLine[FLineOffset+2]] <> gltIdent ) then begin
                      fTokenID := tkPredefinedVar;
                      Inc(FLineOffset,2);
                 end;
 vltUnderscore : if FLine[FLineOffset+1] in IdentArray[3] then begin
                     fTokenID := tkPredefinedVar;
                     Inc(FLineOffset);
                 end else begin
                     ToIdentIdent;
                     fTokenID := tkVariable;
                 end ;
      vltSharp : begin
                   if GenIA[FLine[FLineOffset+1]] = gltIdent then  begin
                      Inc(FLineOffset);
                      ToIdentIdent;
                      case CalcCRC32(FToIdent,FStringLen) of
                        $FE64C4EE{INC},
                        $71A0E885{ARGV},
                        $FBD44C65{_},
                        $EF06C9DE{ISA},
                        $03B670B1{EXPORT},
                        $38AE5934{EXPORT_OK},
                        $87D311A2{EXPORT_FAIL} : fTokenID := tkPredefinedVar;
                        else    fTokenID := tkVariable;
                      end;
                      goto label_end;
                   end;
                   if FLine[FLineOffset+1] = '$' then begin
                      Inc(FLineOffset);
                      if FLine[FLineOffset+1] = ';' then begin // $#$;
                          Inc(FLineOffset);
                          FtokenID := TkVariable
                      end else    
                          ProcessRefs;
                      exit;
                   end;
                   fTokenID := tkPredefinedVar; //$# var
                   Inc(FLineOffset);
                 end;
      //vltOther :           
      else FTokenID := RecognizePackageVar;
   end;
label_end:
   if (FTokenID in [tkPredefinedVar,tkVariable]) and 
      (CRange = rsUnknown) then begin
       FCurrentRange := BuildSimpleRange(rsAfterVariable);
   end;
end;

procedure TSynMPerlSyn.ProcessRefs;
begin
    FTokenID := tkSymbol;
    while VarIA[FLine[FLineOffset]] = vltDollar do inc(FLineOffset);                                                             
    if (FLine[FLineOffset] = ':') and (FLine[FLineOffset+1] = ':') then begin
         Inc(FLineOffset,2);
         FTokenID := RecognizePackageVar;
         exit;
    end;
    if GenIA[FLine[FLineOffset]] = gltIdent then
       FTokenID := RecognizePackageVar;
end;

function TSynMPerlSyn.RecognizePackageVar :  TTokenKind;
var oldoffset,level : integer;
begin
    oldoffset  := FLineOffset;
    level      := 0;
    
    while true do begin
       Inc(level);
       
       ToIdentIdentSingle;
       
       if FLine[FLineOffset]   <> ':' then break;
       if FLine[FLineOffset+1] <> ':' then break;
       Inc(FLineOffset,2);
    end;
                                                                                                                                  
    if level = 1 then
       result := CheckVariableCRC(CalcCRC32(FLine+oldoffset,FStringLen))
    else
        result := tkVariable;
end;

procedure TSynMPerlSyn.ArrayProc;
var level : integer;
begin
   Inc(FLineOffset);
   while VarIA[FLine[FLineOffset]] = vltDollar do inc(FLineOffset);

   if (FLine[FLineOffset]=':') and
      (FLine[FLineOffset+1]=':') then
      Inc(FLineOffset,2);

   level := 0;

   while true do begin
       Inc(level);
       ToIdentIdent;
       if FLine[FLineOffset]   <> ':' then break;
       if FLine[FLineOffset+1] <> ':' then break;
       Inc(FLineOffset,2);
   end;

   if level = 1 then begin
      case CalcCRC32(FToIdent,FStringLen) of
         $FE64C4EE{INC},
        $71A0E885{ARGV},
        $FBD44C65{_},
        $EF06C9DE{ISA},
        $03B670B1{EXPORT},
        $38AE5934{EXPORT_OK},
        $87D311A2{EXPORT_FAIL} : fTokenID := tkPredefinedVar;
         else if FStringLen <> 0 then
                  ftokenid := tkVariable
              else
                  ftokenid := tkSymbol;
      end;
   end else ftokenid := tkVariable; 
end;
procedure TSynMPerlSyn.HashProc;
var level : integer;
begin
   Inc(FLineOffset);
   while VarIA[FLine[FLineOffset]] = vltDollar do inc(FLineOffset);

   if (FLine[FLineOffset]=':') and
      (FLine[FLineOffset+1]=':') then
      Inc(FLineOffset,2);

   level      := 0;

   while true do begin
       Inc(level);
       ToIdentIdent;
       if FLine[FLineOffset]   <> ':' then break;
       if FLine[FLineOffset+1] <> ':' then break;
       Inc(FLineOffset,2);
   end;

   if level = 1 then begin
      case CalcCRC32(FToIdent,FStringLen) of
         $FE64C4EE{INC},
      $A7F9B096{SIG},
      $9AA3D961{ENV},
      $6E48AECD{EXPORT_TAGS} : fTokenID := tkPredefinedVar;
         else if FStringLen <> 0 then
                  ftokenid := tkVariable
              else
                  ftokenid := tkSymbol;
      end;
   end else ftokenid := tkVariable;
end;

function TSynMPerlSyn.RecognizeToken(Token : string) : TTokenKind;
begin
   result := CheckIdentCRC(CalcCRC32(PChar(Token),Length(Token)));
   if (result = tkSymbol) and (length(token) > 1) then begin
       case token[1] of
         '$'  : result := CheckVariableCRC(CalcCRC32(PChar(Token)+1,Length(Token)-1));
         '@',
         '%'  : result := tkVariable;
       end;
   end;
end;

procedure TSynMPerlSyn.NumberProc;
label l_dot;
begin
   inc (FLineOffset);
   FTokenID := tkSymbol;
   case FLine[FLineOffset-1] of
      '0' : case FLine[FLineOffset] of
             '0'..'9','_' : begin ToIdent(4); fTokenID := tkOctNumber; exit; end;
             '.'          : begin fTokenID := tkDecNumber; Inc(FLineOffset); goto l_dot; end;
             'x','X'      : begin Inc(FLineOffset); ToIdent(5);
                                  if FStringLen <>0 then fTokenID := tkHexNumber
                                  else begin
                                      Dec(FLineOffset);
                                      fTokenID := tkDecNumber;
                                  end;
                                  exit;
                            end;
             'b','B'      : begin Inc(FLineOffset); ToIdent(1);
                                  if FStringLen <>0 then fTokenID := tkBinNumber
                                  else begin
                                      Dec(FLineOffset);
                                      fTokenID := tkDecNumber;
                                  end;
                                  exit;
                            end;
             else fTokenID := tkDecNumber;
            end;
      '.' : if ((FLineOffset = 1) or (FLine[FLineOffset-2] <> '.')) and
               (FLine[FLineOffset] in ['0'..'9','e','E']) then goto l_dot;
     else begin
        fTokenID := tkDecNumber;
        ToIdent(4);
        if FLine[FLineOffset] in ['.','e','E'] then begin
           Inc(FLineOffset);
           goto l_dot; 
        end;
     end;
   end;
   exit;
l_dot:
   if not (FLine[FLineOffset] in ['0'..'9','e','E']) then begin
      Dec(FLineOffset);
      exit;
   end;
   if FLine[FLineOffset] in ['0'..'9'] then begin
      ToIdent(4);
      fTokenID := tkDecNumber;
   end;
   if (FLine[FLineOffset] in ['e','E']) and
      (FLine[FLineOffset+1] in ['0'..'9','+','-']) then begin
      Inc(FLineOffset,2);
      ToIdent(6);
      fTokenID := tkDecNumber;
   end;
end;

// пропускаем пробелы между sub и именем процедуры
procedure TSynMPerlSyn.AfterSubProc;
begin
   case GenIA[FLine[FLineOffset]] of
      //Конец строки
      gltCRLFNULL : case FLine[FLineOffset] of
                       #0:  NullProc;
                       #10: LFProc;
                       #13: CRProc;
                    end;
       gltSpaces  : begin              
                      inc(FLineOffset);
                      fTokenID := tkSpace;
                      while GenIA[FLine[FLineOffset]] = gltSpaces do 
                         inc(FLineOffset);
                      // Если встретили непробел, то меняем state
                      if GenIA[FLine[FLineOffset]] <> gltCRLFNULL then 
                          FCurrentRange  := BuildSimpleRange(rsBeforeSubName)
                    end;
             else   begin // все остальное
                       FCurrentRange  := BuildSimpleRange(rsBeforeSubName);
                       SubNameProc;
                    end;
   end;
end;

procedure TSynMPerlSyn.SubNameProc;
label label_sub_name,label_error,label_checkforattr;
var  oldlineoffset : integer;
begin
   oldlineoffset := FLineOffset;
   
   case GenIA[FLine[FLineOffset]] of
       // настоящее имя
       gltIdent : if IdeIa[FLine[FLineOffset]] = iltAlpha then
                     goto label_sub_name  // имя начинается с буквы
                  else
                     goto label_error ;

       gltOther : case FLine[FLineOffset] of
                     ':' : goto label_checkforattr;
                     '{' : begin
                              //inc(FLineOffset);
                              fTokenID := tkAnonymous;
                              FCurrentRange  := BuildSimpleRange(rsAnonymousLeftCurly);
                              exit;
                           end;
                     '(' : begin
                              fTokenID := tkAnonymous;
                              FCurrentRange  := BuildSimpleRange(rsInsideSubArgs);
                              //inc(FLineOffset);
                              exit;
                           end;
                    else begin
                             if FLine[FLineOffset] in ['}',')','>',']','='] then begin
                                 FCurrentRange  := BuildSimpleRange(rsUnknown);
                                 inc(FLineOffset);
                                 FTokenID := tkSymbol;
                             end else 
                                 goto label_error ;
                         end;   
                  end;
       else  fProcTable[FLine[FLineOffset]]; // Пусть все будет по умолчанию
   end;
   exit;

   //  начинается настоящая обработка

   // Имя подпрограммы
   label_sub_name:
      while (IdeIA[FLine[FLineOffset]] <> iltOther) do inc(FLineOffset);
      
      FTokenID := CheckIdentCRC(CalcCRC32(FLine+oldlineoffset,FLineOffset-oldlineoffset));
      case FTokenID of
         tkSpecSub           : fTokenID :=  tkSpecSub_Sub;         
         tkInternalFunction  : fTokenID :=  tkInternalFunction_Sub;
         tkClass             : fTokenID :=  tkClass_Sub;           
         tkFormatHeader      : fTokenID :=  tkInternalFunction_Sub;    

         tkSub : fTokenID := tkInternalFunction_Sub; 
         else  fTokenID := tkSubName;
      end;
      FCurrentRange  := BuildSimpleRange(rsAfterSubName);
      exit;

   // Ошибка. Помечаем как плохой символ но ничего не сбрасываем
   label_error:
      inc(FLineOffset);
      fTokenID := tkUnknown;
      exit;

   // проверим, парное ли двоеточие и есть ли что-нибудь за ним (проверка на аттрибуты
   label_checkforattr:
      case IdeIa[FLine[FLineOffset+1]] of
         iltOther,
         iltAlpha : begin // аттрибуты, причем анонимная подпрограмма
                       //inc(FLineOffset);
                       fTokenID := tkAnonymous;
                       FCurrentRange  := BuildSimpleRange(rsAfterSubArgs);
                       exit;
                    end;
         iltSingle,           
         iltDigit : goto label_error;
         iltColon : goto label_sub_name// имя подпрограммы
      end;
end;

 
procedure TSynMPerlSyn.AfterSubNameProc;
begin
  FTokenID := tkSubParameters;
  case FLine[FLineOffset] of
    #0  : NullProc;
    #10 : LFProc;
    #13 : CRProc;
    else while GenIA[FLine[FLineOffset]] <> gltCRLFNULL  do begin
            case FLine[FLineOffset] of
              ';','}','#' : begin
                             FCurrentRange  := BuildSimpleRange(rsUnknown);
                             FTokenID := tkSubProto;
                             exit;
                            end;   
              '{' : begin
                        FCurrentRange  := BuildSimpleRange(rsSubLeftCurly);
                        //inc(FLineOffset);
                        exit;
                    end;
              '(' : begin
                        FCurrentRange  := BuildSimpleRange(rsInsideSubArgs);
                        inc(FLineOffset);
                        exit;
                    end;
            end;       
            inc(FLineOffset);
         end;
  end;
end;

procedure TSynMPerlSyn.InsideSubArgsProc;
var oldoffset : integer;
begin
   oldoffset := FLineOffset;
   
   FTokenID := tkSubParameters;
   case FLine[FLineOffset] of
      #0  : NullProc;
      #10 : LFProc;
      #13 : CRProc;
      else while GenIA[FLine[FLineOffset]] <> gltCRLFNULL  do begin
            case FLine[FLineOffset] of
              ';','*','$','@','%','&','\' : ;
              ')' : begin
                       FCurrentRange  := BuildSimpleRange(rsAfterSubArgs);
                       inc(FLineOffset);
                       exit;
                    end;
               '(' : if oldoffset <> FLineOffset then begin
                         fTokenId := tkUnknown;
                         inc(FLineOffset);
                         exit;
                     end;
               else if oldoffset = FLineOffset then begin
                       fTokenId := tkUnknown;
                       inc(FLineOffset);
                       exit;
                    end else exit;
            end;       
            inc(FLineOffset);
         end;
   end;
end;

procedure TSynMPerlSyn.AfterSubArgsProc;
var oldoffset : integer;
begin
   oldoffset := FLineOffset;

   FTokenID := tkSubParameters;
   case FLine[FLineOffset] of
      #0  : NullProc;
      #10 : LFProc;
      #13 : CRProc;
      else while GenIA[FLine[FLineOffset]] <> gltCRLFNULL  do begin
              case FLine[FLineOffset] of
               ';','#','}' : begin
                               FCurrentRange  := BuildSimpleRange(rsUnknown);
                               FTokenID := tkSubProto;
                               exit;
                            end; 
                      '{' : begin
                             FCurrentRange  := BuildSimpleRange(rsSubLeftCurly);
                             // FCurrentRange  := BuildSimpleRange(rsUnknown);
                             exit;
                          end;
               else begin
                       if (GenIA[FLine[FLineOffset]] in [gltIdent,gltSpaces]) or
                          (FLine[FLineOffset] = ':') then  
                       else begin   
                          if oldoffset = FLineOffset then begin
                              fTokenId := tkUnknown;
                              inc(FLineOffset);
                              exit;
                           end else exit;   
                       end; 
                    end;   
              end;       
              inc(FLineOffset);
         end;
   end;
end;


// пропускаем пробелы между переменной и фигурной скобкой
procedure TSynMPerlSyn.AfterVariableProc;
begin
   case GenIA[FLine[FLineOffset]] of
      //Конец строки
      gltCRLFNULL : case FLine[FLineOffset] of
                       #0:  NullProc;
                       #10: LFProc;
                       #13: CRProc;
                    end;
       gltSpaces  : begin              
                      inc(FLineOffset);
                      fTokenID := tkSpace;
                      while GenIA[FLine[FLineOffset]] = gltSpaces do Inc(FLineOffset);
                    end;
             else   if FLine[FLineOffset] = '{' then OnLeftCurlyProc else 
                    if (FLine[FLineOffset] = '-') and
                       (FLine[FLineOffset+1] = '>') then begin
                       
                       Inc(FlineOffset,2);
                       fTokenID := tkSymbol;
                     
                    end else begin
                        FCurrentRange  := BuildSimpleRange(rsUnknown);
                        fProcTable[FLine[FLineOffset]];
                    end;
   end;
end;

// пропускаем пробелы между левой фигурной скобкой и непробелом
procedure TSynMPerlSyn.AfterLeftCurlyProc;
begin
   case GenIA[FLine[FLineOffset]] of
      //Конец строки
      gltCRLFNULL : case FLine[FLineOffset] of
                       #0:  NullProc;
                       #10: LFProc;
                       #13: CRProc;
                    end;
       gltSpaces  : begin              
                      inc(FLineOffset);
                      fTokenID := tkSpace;
                      while GenIA[FLine[FLineOffset]] = gltSpaces do 
                         inc(FLineOffset);
                      // Если не конец строки
                      if  GenIA[FLine[FLineOffset]] <> gltCRLFNULL then 
                          FCurrentRange  := BuildSimpleRange(rsOnFirstWord)
                      else begin
                          FCurrentRange  := BuildSimpleRange(rsUnknown)
                      end;    
                    end;
             else   begin
                       FCurrentRange  := BuildSimpleRange(rsOnFirstWord);
                       FTokenID := tkSpace;
                    end;   
                        
   end;
end;


procedure TSynMPerlSyn.OnLeftCurlyProc;
begin 
    fTokenID := tkOpenCurly;
    FCurrentRange  := BuildSimpleRange(rsAfterLeftCurly);
    inc(flineOffset);
end;    


// Анализируем первое слово
procedure TSynMPerlSyn.OnFirstWordProc;
var middleoffset,oldLineOffset : integer;
     
begin
   // Сразу расправимся с ошибочными вариантами
   if  GenIA[FLine[FLineOffset]] <> gltIdent then begin
       FCurrentRange  := BuildSimpleRange(rsUnknown);
       fProcTable[FLine[FLineOffset]];
       exit;
   end;
   // выделим слово
   
   OldLineOffset := FLineOffset;
   
   while true do begin
       case GenIA[FLine[FLineOffset]] of 
          gltIdent : begin
                        inc(FLineOffset);
                        continue;
                     end;
         gltSpaces : begin
                        middleoffset := FLineOffset;
                        while GenIA[FLine[FLineOffset]] <> gltCRLFNULL do begin
                            if GenIA[FLine[FLineOffset]] = gltSpaces then begin
                               Inc(FLineOffset);
                               continue;
                            end;   
                            if FLine[FLineOffset] = '}' then begin
                               FLineOffset := MiddleOffset;
                               FTokenId := tkString;
                               FCurrentRange  := BuildSimpleRange(rsUnknown);
                               exit;
                            end; 
                            FLineOffset := OldLineOffset;
                            FCurrentRange  := BuildSimpleRange(rsUnknown);
                            fProcTable[FLine[FLineOffset]];
                            exit;
                        end;
                     end
         else begin
            if FLine[FLineOffset] = '}' then begin
                FTokenId := tkString;
                FCurrentRange  := BuildSimpleRange(rsUnknown);
            end else begin 
                FLineOffset := OldLineOffset;
                FCurrentRange  := BuildSimpleRange(rsUnknown);
                fProcTable[FLine[FLineOffset]];
            end;    
            exit;
         end;           
     end;
   end;  
end;

// пропускаем пробелы между package и именем пакета
procedure TSynMPerlSyn.AfterPackageProc;
begin
   case GenIA[FLine[FLineOffset]] of
      //Конец строки
      gltCRLFNULL : case FLine[FLineOffset] of
                       #0:  NullProc;
                       #10: LFProc;
                       #13: CRProc;
                    end;
       gltSpaces  : begin              
                       inc(FLineOffset);
                       fTokenID := tkSpace;
                       while GenIA[FLine[FLineOffset]] = gltSpaces do inc(FLineOffset);
                    end;
        gltIdent  : begin
                       FCurrentRange  := BuildSimpleRange(rsUnknown);
                       FromLetterProc;
                       case FTokenID of
                           tkPragma : FTokenID := tkKNownPackageName;
                           tkSymbol : FTokenID := tkUnknownPackageName;
                       end;
                    end;        
             else   begin // все остальное
                       FCurrentRange  := BuildSimpleRange(rsUnknown);
                       fProcTable[FLine[FLineOffset]];
                    end;
   end;
end;

procedure TSynMPerlSyn.OnSubOpenCurlyProc;
begin
   inc(FLineOffset);
   fTokenID := tkSubOpenCurly;
   FCurrentRange  := BuildSimpleRange(rsUnknown);
end;
{
type TVarLetterType = (vltCaret,vltSpace,vltPredefined,vltUnderscore,
                       vltSharp,vltOther,vltColon,vltDigit,vltDollar,
                       vltLeftCurly);
                       
     TGenLetterType = (gltIdent,gltCRLFNULL,gltSpaces,gltOther);
     
     TIdentLetterType = (iltAlpha,iltColon,iltDigit,iltOther,iltSingle);

var VarIA : array [#0..#255] of TVarLetterType;
    GenIA : array [#0..#255] of TGenLetterType;
    IdeIA : array [#0..#255] of TIdentLetterType;
}

procedure TSynMPerlSyn.FileDescriptorProc;
var OldLineOffset : integer;
begin
    if FLine[FLineOffset] = '>' then begin // <>
       Inc(FLineOffset);
       FTokenID := tkVariable;
       exit;
    end;
    
    OldLineOffset := FLineOffset;
    
    if GenIA[FLine[FLineOffset]] = gltIdent then begin
       while GenIA[FLine[FLineOffset]] = gltIdent do Inc(FLineOffset);
       if FLine[FLineOffset] = '>' then begin
          Inc(FLineOffset);
          FTokenID := tkVariable;
       end else 
          FLineOffset :=  OldLineOffset;
       exit;  
    end;
    
    if FLine[FLineOffset] = '$' then begin 
       VarProc;
       if fTokenId<>tkSymbol then begin
          if FLine[FLineOffset] = '>' then 
             Inc(FLineOffset)
          else begin
             fTokenId := tkSymbol;
             FLineOffset :=  OldLineOffset;
          end;   
       end;
    end;      
end;

function TSynMPerlSyn.GetSampleSource: string;
begin
  Result :=
    '#!/bin/perl'#13#10 +
    'require "cgi-lib.pl";'#13#10 +
    'use sigtrap;'#13#10 +
    'do ''envars.pl'';'#13#10 +
    '$_ = $password1;'#13#10 +
    'sub WriteBack {'#13#10 +
    '        while ($_ ne "fred")    {'#13#10 +
    '                sleep 5;'#13#10 +
    '        }'#13#10 +
    '}';
end;

procedure Register;
begin
  RegisterComponents('SynEdit Highlighters', [TSynMPerlSyn]);
end;

initialization
   {$IFNDEF SYN_CPPB_1}
    RegisterPlaceableHighlighter(TSynMPerlSyn);
   {$ENDIF}
   BuildIdentArray;
end.

