SetCompressor zlib

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "All4Cod"
!define PRODUCT_VERSION "2.0.2.11"
!define PRODUCT_PUBLISHER "OpenSofts"
!define PRODUCT_WEB_SITE "http://www.opensofts.info"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\All4Cod.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "zipdll.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "icon.ico"
!define MUI_UNICON "uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "License.txt"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\All4Cod.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "French"
; MUI end ------

Name "${PRODUCT_NAME}"
OutFile "All4Cod.exe"
InstallDir "$PROGRAMFILES\All4Cod"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
XPStyle on
CRCCheck off
AutoCloseWindow false

InstType "Minimum"
InstType "Complet"
InstType "Développeur"

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section ""
  SectionIn 2 3
  SetOverwrite on
  SetOutPath "$INSTDIR\AutoCompletion"
  File "..\AutoCompletion\Sample"
  SetOutPath "$INSTDIR\Models"
  File "..\Models\Ada"
  File "..\Models\AML"
  File "..\Models\ARC"
  File "..\Models\ARCEDIT"
  File "..\Models\ARCPLOT"
  File "..\Models\Assembleur"
  File "..\Models\Batch - MsDOS"
  File "..\Models\BLUE"
  File "..\Models\C - C++"
  File "..\Models\Caractéres spéciaux"
  File "..\Models\Clipper 5"
  File "..\Models\COBOL"
  File "..\Models\DataFlex"
  File "..\Models\Eiffel"
  File "..\Models\Fortran"
  File "..\Models\HTML - Attributs"
  File "..\Models\HTML - Balises"
  File "..\Models\Java"
  File "..\Models\Limbo"
  File "..\Models\LISP"
  File "..\Models\LiteStep"
  File "..\Models\Modula 2"
  File "..\Models\Paradox Object"
  File "..\Models\Pascal Object"
  File "..\Models\Perl 5"
  File "..\Models\Progress"
  File "..\Models\Python"
  File "..\Models\QBASIC"
  File "..\Models\REXX"
  File "..\Models\Smalltalk"
  File "..\Models\SQL"
  File "..\Models\VB - Etats"
  File "..\Models\VB - Fonctions"
  File "..\Models\Vb - Methodes"
  File "..\Models\VDHL"
  File "..\Models\Verilog"
  SetOutPath "$INSTDIR\Profils"
  File "..\Profils\None.cfg"
  File "..\Profils\Devcpp.cfg"
  SetOutPath "$INSTDIR\Templates\Files\C-C++"
  File "..\Templates\Files\C-C++\Application  Console.c"
  File "..\Templates\Files\C-C++\Application Windows.cpp"
  SetOutPath "$INSTDIR\Templates\Files\Internet"
  File "..\Templates\Files\Internet\Blank HTML 3.2.html"
  File "..\Templates\Files\Internet\HTML Document.htm"
  File "..\Templates\Files\Internet\PHP Document.php"
  SetOutPath "$INSTDIR\Templates\Files"
  File "..\Templates\Files\Default.html"
  File "..\Templates\Files\Delphi Form.dfm"
  File "..\Templates\Files\Delphi TComponent Descendant.dpr"
  File "..\Templates\Files\Fichier de commandes MS-DOS.bat"
  File "..\Templates\Files\JavaScript.js.js"
  File "..\Templates\Files\Pascal Console.pas"
  File "..\Templates\Files\Standard Perl 5.0.pl"
  File "..\Templates\Files\VBScript.vbs"
  SetOutPath "$INSTDIR\Templates\Projects\C-C++"
  File "..\Templates\Projects\C-C++\Console.c"
  File "..\Templates\Projects\C-C++\Main.c"
SectionEnd

Section "Programme (requis)" SEC01
  SectionIn RO
  SetOverwrite on
  SetOutPath "$INSTDIR"
  CreateDirectory "$SMPROGRAMS\All4Cod"
  CreateShortCut "$SMPROGRAMS\All4Cod\All4Cod.lnk" "$INSTDIR\All4Cod.exe"
  CreateShortCut "$DESKTOP\All4Cod.lnk" "$INSTDIR\All4Cod.exe"

  IFFileExists "$INSTDIR\config.ini" 0 Pas_Demander
    MessageBox MB_YESNO|MB_ICONQUESTION "Voulez-vous écraser le fichier de configuration 'Config.ini' ?" IDNO Pas_Ecraser
  Pas_demander:
  File "..\config.ini"
  Pas_Ecraser:
  File "..\All4Cod.exe"
  File "..\Infos.html"
  SetOutPath "$INSTDIR\Highlighters"
  File "..\Highlighters\68HC11 Assembler"
  File "..\Highlighters\ADSP21xx"
  File "..\Highlighters\AWK"
  File "..\Highlighters\Baan 4GL"
  File "..\Highlighters\Borland Forms"
  File "..\Highlighters\C#"
  File "..\Highlighters\C_C++"
  File "..\Highlighters\Cache Object Script"
  File "..\Highlighters\CA-Clipper"
  File "..\Highlighters\Cascading Style Sheet"
  File "..\Highlighters\COAS Product Manager Report"
  File "..\Highlighters\COBOL"
  File "..\Highlighters\CORBA IDL"
  File "..\Highlighters\Custom Highlighter"
  File "..\Highlighters\DOT Graph Drawing Description language"
  File "..\Highlighters\Eiffel"
  File "..\Highlighters\Fortran"
  File "..\Highlighters\Foxpro"
  File "..\Highlighters\Galaxy"
  File "..\Highlighters\Gembase"
  File "..\Highlighters\General"
  File "..\Highlighters\GW-TEL"
  File "..\Highlighters\Haskell"
  File "..\Highlighters\HP48"
  File "..\Highlighters\HTML"
  File "..\Highlighters\INI"
  File "..\Highlighters\Inno Setup Script"
  File "..\Highlighters\Java"
  File "..\Highlighters\JavaScript"
  File "..\Highlighters\KiXtart"
  File "..\Highlighters\LEGO LDraw"
  File "..\Highlighters\Modelica"
  File "..\Highlighters\Modula 3"
  File "..\Highlighters\MS VBScript"
  File "..\Highlighters\MS-DOS Batch"
  File "..\Highlighters\NSIS Script"
  File "..\Highlighters\Object Pascal"
  File "..\Highlighters\Perl"
  File "..\Highlighters\PHP"
  File "..\Highlighters\Progress"
  File "..\Highlighters\Python"
  File "..\Highlighters\R"
  File "..\Highlighters\Resource"
  File "..\Highlighters\Ruby"
  File "..\Highlighters\Scilab"
  File "..\Highlighters\Semanta Data Dictionary"
  File "..\Highlighters\SQL"
  File "..\Highlighters\Standard ML"
  File "..\Highlighters\Structured Text"
  File "..\Highlighters\SynGen Msg"
  File "..\Highlighters\Tcl_Tk"
  File "..\Highlighters\TeX"
  File "..\Highlighters\UNIX Shell Script"
  File "..\Highlighters\Unreal"
  File "..\Highlighters\URI"
  File "..\Highlighters\Visual Basic"
  File "..\Highlighters\Vrml97"
  File "..\Highlighters\x86 Assembly"
  File "..\Highlighters\XML"
SectionEnd

SectionGroup "Plugins"
  SetOverwrite on

  Section "SaveCrypt"
    SectionIn 2 3
    SetOutPath "$INSTDIR\Plugins"
    File "..\Plugins\Savecrypt.dll"
  SectionEnd

SectionGroupEnd

SectionGroup "Langues"
  SetOverwrite on

  Section "Français"
    SectionIn RO
  SectionEnd

  Section "English"
    SectionIn 2 3
    SetOutPath "$INSTDIR\Languages"
    File "..\Languages\English.lng"
  SectionEnd

SectionGroupEnd

Section "Tidy HTML"
  SetOverwrite on
  SectionIn 2 3
  SetOutPath "$INSTDIR\Tidy"
  File "..\Tidy\clean_Document_nowrap"
  File "..\Tidy\clean_Document_nowrap_no_indent"
  File "..\Tidy\clean_Document_quote"
  File "..\Tidy\clean_Document_wrap"
  File "..\Tidy\Compress"
  File "..\Tidy\Custom"
  File "..\Tidy\Lowercase_Tags"
  File "..\Tidy\Microsoft_Word_2000_Document"
  File "..\Tidy\Reformat"
  File "..\Tidy\Upgrade_To_CSS"
  File "..\Tidy\Upgrade_To_XHTML"
  File "..\Tidy\Upgrade_To_XML"
  File "..\Tidy\Uppercase_Tags"
  File "..\Tidy\Tidy.exe"
SectionEnd

SectionGroup "Code Source"
  SetOverwrite on
  
  Section "Plugins (Delphi\C)"
    SectionIn 3
    SetOutPath "$INSTDIR\Plugins\C"
    File "..\Plugins\C\dll.h"
    File "..\Plugins\C\dllmain.c"
    File "..\Plugins\C\dllres.rc"
    File "..\Plugins\C\icon.bmp"
    File "..\Plugins\C\Makefile.win"
    File "..\Plugins\C\My_Dll.dev"
    File "..\Plugins\C\Readme"
    SetOutPath "$INSTDIR\Plugins\Delphi"
    File "..\Plugins\Delphi\My_Dll.bmp"
    File "..\Plugins\Delphi\My_Dll.dpr"
    File "..\Plugins\Delphi\My_Dll.rc"
    File "..\Plugins\Delphi\Readme"
  SectionEnd

SectionGroupEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\All4Cod\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\All4Cod\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\All4Cod.exe"
  WriteRegStr HKCR ".ap" "" "All4Cod Project"
  WriteRegStr HKCR "All4Cod Project\DefaultIcon" "" "$\"$INSTDIR\All4Cod.exe$\",0"
  WriteRegStr HKCR "All4Cod Project\Shell\Open\Command" "" "$\"$INSTDIR\All4Cod.exe$\" $\"%1$\""
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\All4Cod.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "Minimum requis pour faire fonctionner All4Cod"
!insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) a été désinstallé avec succès de votre ordinateur."
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Êtes-vous certains de vouloir désinstaller totalement $(^Name) et tous ses composants ?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\Infos.html"
  Delete "$INSTDIR\All4Cod.exe"

  RMDir /r "$INSTDIR\AutoCompletion"
  RMDir /r "$INSTDIR\Highlighters"
  RMDir /r "$INSTDIR\Languages"
  RMDir /r "$INSTDIR\Models"
  RMDir /r "$INSTDIR\Plugins\"
  RMDir /r "$INSTDIR\Tidy"
  RMDir /r "$INSTDIR\Profils"
  RMDir /r "$INSTDIR\Templates"
  RMDir /r "$INSTDIR\Code Source"

  Delete "$SMPROGRAMS\All4Cod\Uninstall.lnk"
  Delete "$SMPROGRAMS\All4Cod\Website.lnk"
  Delete "$SMPROGRAMS\All4Cod\All4Cod.lnk"
  RMDir "$SMPROGRAMS\All4Cod"
  
  Delete "$DESKTOP\All4Cod.lnk"
  
  MessageBox MB_YESNO|MB_ICONQUESTION "Voulez-vous supprimer le fichier de configuration 'Config.ini' ?" IDNO NoDelete
    Delete "$INSTDIR\config.ini"
    RMDir "$INSTDIR"
  NoDelete:

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  DeleteRegKey HKCR ".ap"
  DeleteRegKey HKCR "All4Cod Project"
SectionEnd