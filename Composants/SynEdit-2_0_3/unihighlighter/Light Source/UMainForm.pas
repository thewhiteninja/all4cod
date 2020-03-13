unit UMainForm;
(******************************************************************************
Authors: Vit (nevzorov@yahoo.com)
Official Site: www.delphist.com
With all questions, please visit www.delphist.com/forum
******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, SynEditPrint, SynExportRTF, SynEditExport,
  SynExportHTML, SynEdit, SynEditHighlighter, SynUniHighlighter, Placemnt,
  SynEditTypes;

type



  TMainForm = class(TForm)
    FormStorage: TFormStorage;
    Edit: TSynEdit;
    SynEditPrint1: TSynEditPrint;
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    mFile: TMenuItem;
    SynUniSyn: TSynUniSyn;
    mFileNew: TMenuItem;
    SaveDialog: TSaveDialog;
    mFileSave: TMenuItem;
    mSaveAs: TMenuItem;
    NewFromClipboard1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mFileOpen: TMenuItem;
    OpenDialog: TOpenDialog;
    mEdit: TMenuItem;
    mEditUndo: TMenuItem;
    mEditRedo: TMenuItem;
    mClose: TMenuItem;
    N4: TMenuItem;
    mEditCut: TMenuItem;
    mEditCopy: TMenuItem;
    mEditPaste: TMenuItem;
    mEditSelectAll: TMenuItem;
    N5: TMenuItem;
    mEditFind: TMenuItem;
    mEditFindNext: TMenuItem;
    mEditReplace: TMenuItem;
    N6: TMenuItem;
    mEditDateTime: TMenuItem;
    mEditIncrementalSearch: TMenuItem;
    mEditGotoLine: TMenuItem;
    mSyntax: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure mFileNewClick(Sender: TObject);
    procedure mFileSaveClick(Sender: TObject);
    procedure mSaveAsClick(Sender: TObject);
    procedure NewFromClipboard1Click(Sender: TObject);
    procedure mFileOpenClick(Sender: TObject);
    procedure mEditUndoClick(Sender: TObject);
    procedure mEditRedoClick(Sender: TObject);
    procedure mCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mEditCutClick(Sender: TObject);
    procedure mEditCopyClick(Sender: TObject);
    procedure mEditPasteClick(Sender: TObject);
    procedure mEditSelectAllClick(Sender: TObject);
    procedure mEditFindClick(Sender: TObject);
    procedure mEditFindNextClick(Sender: TObject);
    procedure mEditReplaceClick(Sender: TObject);
    procedure mEditDateTimeClick(Sender: TObject);
    procedure mEditGotoLineClick(Sender: TObject);
    procedure mEditIncrementalSearchClick(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FFileName: string;
    SearchOptions:TSynSearchOptions;
    SearchText, ReplaceText, SearchFor:String;
    IncrementalSearchMode:boolean;
    IncrementalSearchBackUp:TMemoryStream;
    procedure SetFileName(const Value: string);
    procedure LoadFile(FName: string='');
    function SaveFile(FName: string='';AskAlways:boolean=False): boolean;
    function SaveRequest: boolean;
    function isAllowOverride(FName: string): boolean;
    function AskForFileName(AskAlways:boolean): boolean;
    function NewWindow: boolean;
    procedure ExitFromSearch;
    procedure LoadHighlighters;
    procedure mSyntaxClick(Sender: TObject);
    procedure ExSyntaxClick(Sender: TObject);
  public
    property FileName:string read FFileName write SetFileName;
  end;

var
  MainForm: TMainForm;


Const {Localizable constants}
  _FileModified='File was modified. ';
  _FileAlreadyExists='File with this name already exists. ';
  _Save='Do you wish to save?';
  _Untitled='Untitled.txt';
  _StringNotFound='Search string ''%s'' not found';
  _EnterLineNum='Enter line number';
  _GoToLine='Go to line';
  _SearchFor='Search for:';

implementation

uses UFind, UReplace,SynEditTextBuffer, inifiles;

Var HighlighterPath:string;

{$R *.dfm}

Function TMainForm.SaveRequest:boolean;  //true if was saved or saving was not required
begin
  Result:=True;
  if Edit.Modified then
    Case MessageDlg(_FileModified+_Save,mtWarning,[mbYes, mbNo, mbCancel],0) of
      mrYes: result:=SaveFile;
      mrCancel:result:=false;
    End; {Case}
end;

Function TMainForm.isAllowOverride(FName:string):boolean;
begin
  result:=true;
  if FName<>'' then
    if FileExists(FName) then
      Case MessageDlg(_FileAlreadyExists+_Save,mtWarning,[mbYes, mbNo],0) of
        mrYes: FileName:=FName;
        mrNo: Result:=False;
      End {Case}
end;

Function TMainForm.AskForFileName(AskAlways:boolean):boolean;
begin
  Result:=true;
  if (FileName='') or (FileName=_Untitled) or AskAlways then
    begin
      SaveDialog.FileName:=FileName;
      if SaveDialog.execute then
        FileName:=SaveDialog.FileName
      else
        result:=False;
    end;
end;

Function TMainForm.SaveFile(FName:string='';AskAlways:boolean=False):boolean; //true if saved seccessfully
begin
  Result:=False;
  if AskAlways or isAllowOverride(FName) then
    if AskForFileName(AskAlways) then
      try
        Edit.Lines.SaveToFile(FileName);
        Edit.Modified:=false;
        result:=true;
      except
        on e:exception do Showmessage(e.message);
      end;
end;


Function GetHighlighterFileName(Extension:string):string;
begin
  Extension:=copy(Extension,2,length(Extension));
  with TIniFile.Create(ChangeFileExt(Paramstr(0),'.ini')) do
    try
      Result:=readstring('Associations', Extension,'');
    finally
      free;
    end;
end;

procedure TMainForm.LoadFile(FName:string='');
  var s:string;
begin
  if FName<>'' then FileName:=FName;
  s:=GetHighlighterFileName(ExtractFileExt(FileName));
  Edit.Highlighter:=nil;
  if s='' then SynUniSyn.MainRules.Clear else
    begin
      SynUniSyn.MainRules.Clear;
      SynUniSyn.LoadFromFile(HighlighterPath+s);
    end;

  Edit.Lines.LoadFromFile(FileName);
  Edit.Highlighter:=SynUniSyn;
  Edit.Modified:=false;
end;

procedure TMainForm.mSyntaxClick(Sender: TObject);
begin
  With TIniFile.create(ChangeFileExt(Paramstr(0),'.ini')) do
    try
      Edit.Highlighter:=nil;
      SynUniSyn.MainRules.Clear;
      SynUniSyn.LoadFromFile(HighlighterPath+ReadString('Show Syntax', StringReplace((Sender as TMenuItem).caption,'&','',[rfReplaceAll]),''));
      Edit.Highlighter:=SynUniSyn;
      Edit.Refresh;
    finally
      Free;
    end;
end;

procedure TMainForm.ExSyntaxClick(Sender: TObject);
begin
  SynUniSyn.LoadFromFile(HighlighterPath+StringReplace((Sender as TMenuItem).caption,'&','',[rfReplaceAll]));
  Edit.Refresh;
end;


Procedure TMainForm.LoadHighlighters;
  var List:TStringList;
      i:integer;
      NewItem,NewItem2:TMenuItem;
      fs:TSearchRec;
      a:array['A'..'Z'] of TMenuItem;
      ch:char;
begin
  With TIniFile.create(ChangeFileExt(Paramstr(0),'.ini')) do
    try
      List:=TStringList.create;
      try
        ReadSection('Show Syntax',List);
        For i:=0 to List.count-1 do
          begin
            NewItem := TMenuItem.Create(Self);
            NewItem.Caption := List[i];
            NewItem.OnClick:=mSyntaxClick;
            mSyntax.add(NewItem);
          end;
        NewItem := TMenuItem.Create(Self);
        NewItem.Caption := '-';
        mSyntax.add(NewItem);
        NewItem := TMenuItem.Create(Self);
        NewItem.Caption := 'All Languages';
        mSyntax.add(NewItem);
        for ch:='A' to 'Y' do
          begin
            a[ch] := TMenuItem.Create(Self);
            a[ch].Caption := ch;
            NewItem.add(a[ch]);
          end;
        a['Z'] := TMenuItem.Create(Self);
        a['Z'].Caption := 'Z and etc.';
        NewItem.add(a['Z']);
        if FindFirst(HighlighterPath+'*.hgl',faAnyFile, fs)=0 then 
        repeat
          NewItem2 := TMenuItem.Create(Self);
          NewItem2.Caption := fs.name;
          NewItem2.OnClick:=ExSyntaxClick;
          ch:=Upcase(fs.name[1]);
          if ch in ['A'..'Z'] then
            a[ch].add(NewItem2)
          else
            a['Z'].add(NewItem2);
        until FindNext(fs)<>0;
      finally
        List.free;
      end;
    finally
      Free;
    end;
end;


procedure TMainForm.FormActivate(Sender: TObject);
  var cmd, selfname:string;
begin
  onActivate:=nil;
  if paramstr(1)<>'' then
    begin
       cmd:=StringReplace(String(CmdLine),'"','',[rfReplaceAll]);
       selfname:=StringReplace(paramstr(0),'"','',[rfReplaceAll]);
       LoadFile(trim(copy(cmd,length(selfname)+1, length(Cmd))));
    end{if paramstr(1)<>'' then}
  else
    begin
      FileName:=_Untitled;
    end;{if..else paramstr(1)<>'' then}
  SearchText:='';
  ReplaceText:='';
  IncrementalSearchMode:=false;
  SearchFor:='';
  LoadHighlighters;
end;

procedure TMainForm.SetFileName(const Value: string);
begin
  FFileName := Value;
  Caption:='Light - '+ extractFileName(FFileName);
  Application.Title:='Light: '+ extractFileName(FFileName);
end;

Function TMainForm.NewWindow:boolean;
begin
  result:=false;
  if Edit.Modified then
    if not SaveRequest then exit;
  FileName:=_Untitled;
  edit.Text:='';
  result:=true;
end;

procedure TMainForm.mFileNewClick(Sender: TObject);
begin
  NewWindow;
end;

procedure TMainForm.mFileSaveClick(Sender: TObject);
begin
  SaveFile;
end;

procedure TMainForm.mSaveAsClick(Sender: TObject);
begin
  SaveFile(FileName,True);
end;

procedure TMainForm.NewFromClipboard1Click(Sender: TObject);
begin
  if NewWindow then
    begin
      edit.PasteFromClipboard;
      edit.SelStart:=0;
    end;
end;

procedure TMainForm.mFileOpenClick(Sender: TObject);
begin
  OpenDialog.FileName:=FileName;
  if OpenDialog.Execute then
    if NewWindow then LoadFile(OpenDialog.FileName);
end;

procedure TMainForm.mEditUndoClick(Sender: TObject);
begin
  Edit.Undo;
end;

procedure TMainForm.mEditRedoClick(Sender: TObject);
begin
  Edit.Redo;
end;

procedure TMainForm.mCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Edit.Modified then CanClose:=SaveRequest;
end;

procedure TMainForm.mEditCutClick(Sender: TObject);
begin
  Edit.CutToClipboard;
end;

procedure TMainForm.mEditCopyClick(Sender: TObject);
begin
  Edit.CopyToClipboard;
end;

procedure TMainForm.mEditPasteClick(Sender: TObject);
begin
  Edit.PasteFromClipboard;
end;

procedure TMainForm.mEditSelectAllClick(Sender: TObject);
begin
  Edit.SelectAll;
end;

procedure TMainForm.mEditFindClick(Sender: TObject);
begin
  Find.FindText.text:=Edit.WordAtCursor;
  Find.FindText.SelectAll;
  if (Find.showmodal=mrOk) and (Find.FindText.text<>'')  then
    begin
      if Find.CaseSensitive.checked then SearchOptions:=SearchOptions+[ssoMatchCase] else SearchOptions:=SearchOptions-[ssoMatchCase];
      if Find.Wholewords.checked then SearchOptions:=SearchOptions+[ssoWholeWord] else SearchOptions:=SearchOptions-[ssoWholeWord];
      if Find.Direction.ItemIndex=0 then SearchOptions:=SearchOptions-[ssoBackwards] else SearchOptions:=SearchOptions+[ssoBackwards];
      if Find.Scope.ItemIndex=0 then SearchOptions:=SearchOptions-[ssoSelectedOnly] else SearchOptions:=SearchOptions+[ssoSelectedOnly];
      if Find.Origin.ItemIndex=0 then SearchOptions:=SearchOptions-[ssoEntireScope] else SearchOptions:=SearchOptions+[ssoEntireScope];
      SearchOptions:=SearchOptions-[ssoReplace]- [ssoReplaceAll]+[ssoPrompt];
      SearchText:=Find.FindText.text;
      ReplaceText:=SearchText;
      if Edit.SearchReplace(SearchText,SearchText,SearchOptions)=0 then showmessage(format(_StringNotFound,[SearchText]));
    end;
end;

procedure TMainForm.mEditFindNextClick(Sender: TObject);
begin
  If SearchText='' then
    begin
      mEditFindClick(Sender);
      exit;
    end;
  SearchOptions:=SearchOptions-[ssoEntireScope];
  if Edit.SearchReplace(SearchText,Replacetext,SearchOptions)=0 then showmessage(format(_StringNotFound,[SearchText]));
end;

procedure TMainForm.mEditReplaceClick(Sender: TObject);
begin
  Replace.FindText.text:=Edit.WordAtCursor;
  Replace.FindText.SelectAll;
  Replace.showmodal;
  if (Replace.modalResult=mrOk) or (Replace.modalResult=mrYesToAll)  then
    begin
      if Replace.CaseSensitive.checked then SearchOptions:=SearchOptions+[ssoMatchCase] else SearchOptions:=SearchOptions-[ssoMatchCase];
      if Replace.Wholewords.checked then SearchOptions:=SearchOptions+[ssoWholeWord] else SearchOptions:=SearchOptions-[ssoWholeWord];
      if Replace.Direction.ItemIndex=0 then SearchOptions:=SearchOptions-[ssoBackwards] else SearchOptions:=SearchOptions+[ssoBackwards];
      if Replace.Scope.ItemIndex=0 then SearchOptions:=SearchOptions-[ssoSelectedOnly] else SearchOptions:=SearchOptions+[ssoSelectedOnly];
      if Replace.Origin.ItemIndex=0 then SearchOptions:=SearchOptions-[ssoEntireScope] else SearchOptions:=SearchOptions+[ssoEntireScope];
      if Replace.modalResult=mrYesToAll then SearchOptions:=SearchOptions + [ssoReplaceAll] else SearchOptions:=SearchOptions - [ssoReplaceAll];
      if Replace.Prompt.checked then SearchOptions:=SearchOptions+[ssoPrompt] else SearchOptions:=SearchOptions-[ssoPrompt];
      SearchOptions:=SearchOptions+[ssoReplace];
      SearchText:=Replace.FindText.text;
      ReplaceText:=Replace.ReplaceText.Text;
      if Edit.SearchReplace(SearchText,ReplaceText,SearchOptions)=0 then showmessage(format(_StringNotFound,[SearchText]));
    end;
end;

procedure TMainForm.mEditDateTimeClick(Sender: TObject);
begin
  Edit.SelText:=DateTimeToStr(Now);
end;


procedure TMainForm.mEditGotoLineClick(Sender: TObject);
  var p:TPoint;
      s:string;
begin
  s:=InputBox(_Gotoline,_EnterLineNum,inttostr(Edit.CaretXY.Y));
  try
    p.X:=Edit.CaretXY.X;
    p.Y:=StrToInt(s);
    Edit.CaretXY:=p;
  except
    {do nothing}
  end;
end;

procedure TMainForm.mEditIncrementalSearchClick(Sender: TObject);
begin
  IncrementalSearchMode:=true;
  Edit.Keystrokes.SaveToStream(IncrementalSearchBackUp);
  Edit.Keystrokes.Clear;
  StatusBar.SimpleText:=_SearchFor;
  StatusBar.SimplePanel:=true;
end;

procedure TMainForm.EditKeyPress(Sender: TObject; var Key: Char);
  var SearchFor:string;
begin
  if IncrementalSearchMode then
    begin
      SearchFor:=copy(StatusBar.SimpleText, length(_SearchFor)+1,length(StatusBar.SimpleText));
      case Key of
        #13,#27:begin
                  ExitFromSearch;
                end;
        #8: StatusBar.SimpleText:=_SearchFor+copy(SearchFor,1,length(SearchFor)-1);
        else begin
               StatusBar.SimplePanel:=true;
               Edit.caretxy:=Edit.BlockBegin;
               if Edit.SearchReplace(SearchFor+Key,SearchFor,[])>0 then StatusBar.SimpleText:=StatusBar.SimpleText+Key;
             end;
      end;
      Key:=#0;
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  IncrementalSearchBackUp:=TMemoryStream.create;
end;

Procedure TMainForm.ExitFromSearch;
begin
  if StatusBar.SimplePanel=true then
    begin
      StatusBar.SimpleText:='';
      IncrementalSearchMode:=false;
      StatusBar.SimplePanel:=false;
      IncrementalSearchBackUp.Seek(0,soFromBeginning);
      Edit.Keystrokes.LoadFromStream(IncrementalSearchBackUp);
    end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  IncrementalSearchBackUp.Free;
end;

initialization

  HighlighterPath:=ExtractFilePath(Paramstr(0))+'Highlighters\';

end.

