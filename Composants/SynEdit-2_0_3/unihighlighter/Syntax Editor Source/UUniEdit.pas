unit UUniEdit;

(******************************************************************************
Author: Vit (nevzorov@yahoo.com)
Official Site: www.delphist.com
With all questions, please visit www.delphist.com/forum
******************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditHighlighter, SynUniHighlighter, StdCtrls, ComCtrls, Spin,
  ExtCtrls, FileCtrl, JvDriveCtrls, JvListBox, JvCombobox, JvEdit,
  JvTypedEdit, JvPlacemnt, JvComponent, JvSplit, SynEdit, SynUniDesigner;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DirectoryListBox: TJvDirectoryListBox;
    FileListBox: TJvFileListBox;
    DriveCombo: TJvDriveCombo;
    JvxSplitter1: TJvxSplitter;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Name: TEdit;
    Label10: TLabel;
    FileTypeName: TEdit;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Author: TEdit;
    Email: TEdit;
    Web: TEdit;
    Copyright: TEdit;
    Company: TEdit;
    Remark: TEdit;
    Label7: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel4: TPanel;
    History: TMemo;
    Button4: TButton;
    Label8: TLabel;
    Version: TJvIntegerEdit;
    Label13: TLabel;
    Revision: TJvIntegerEdit;
    VersionType: TRadioGroup;
    Label15: TLabel;
    Panel5: TPanel;
    Label16: TLabel;
    SampleMemo: TSynEdit;
    FormStorage: TJvFormStorage;
    Layout: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FileListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FileListBoxChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure FileListBoxDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    procedure Load;
    procedure Save;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SynUniSyn:TSynUniSyn;
  UniDesigner:TSynUniDesigner;
  FileName:string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if SynUniSyn<>nil then
    begin
      UniDesigner:=TSynUniDesigner.create (SynUniSyn);
      UniDesigner.Execute;
      UniDesigner.free;
    end
  else Showmessage('Please, choose highlighter');
end;

Procedure TForm1.Load;
begin
  SampleMemo.Highlighter:=nil;
  if FileName='' then
    begin
      Caption:='UniHighlighter Editor';
      exit;
    end;
  if assigned(SynUniSyn) then
    begin
      SynUniSyn.free;
    end;

  SynUniSyn:=TSynUniSyn.create(nil);
  SynUniSyn.LoadFromFile(FileName);
  Name.Text:=SynUniSyn.Info.General.Name;
  FileTypeName.Text:=SynUniSyn.Info.General.FileTypeName;
  Layout.Text:=SynUniSyn.Info.General.Layout;
  Author.text:=SynUniSyn.Info.Author.Name;
  Email.text:=SynUniSyn.Info.Author.Email;
  Web.Text:=SynUniSyn.Info.Author.Web;
  Copyright.Text:=SynUniSyn.Info.Author.Copyright;
  Company.Text:=SynUniSyn.Info.Author.Company;
  Remark.Text:=SynUniSyn.Info.Author.Remark;
  Version.Value:=SynUniSyn.Info.Version.Version;
  Revision.Value:=SynUniSyn.Info.Version.Revision;
  History.Text:=SynUniSyn.Info.History.Text;
  case SynUniSyn.Info.Version.VersionType of
    vtInternalTest: VersionType.ItemIndex:=0;
    vtBeta: VersionType.ItemIndex:=1;
    vtRelease: VersionType.ItemIndex:=2;
  end;
  Layout.Text:=SynUniSyn.Info.General.Layout;
  SampleMemo.text:=SynUniSyn.Info.Sample.Text;
  SampleMemo.Highlighter:=SynUniSyn;
  Caption:='Editing '+FileName;
end;

Procedure TForm1.Save;
begin
  if SynUniSyn=nil then exit;
  SynUniSyn.Info.Author.Name:=Author.text;
  SynUniSyn.Info.Author.Email:=Email.text;
  SynUniSyn.Info.Author.Web:=Web.Text;
  SynUniSyn.Info.Author.Copyright:=Copyright.Text;
  SynUniSyn.Info.Author.Company:=Company.Text;
  SynUniSyn.Info.Author.Remark:=Remark.Text;

  SynUniSyn.Info.Version.Version:=Version.Value;
  SynUniSyn.Info.Version.Revision:=Revision.Value;
  case VersionType.ItemIndex of
    0: SynUniSyn.Info.Version.VersionType:=vtInternalTest;
    1: SynUniSyn.Info.Version.VersionType:=vtBeta;
    2: SynUniSyn.Info.Version.VersionType:=vtRelease;
  end;
  SynUniSyn.Info.Version.ReleaseDate:=now;

  SynUniSyn.Info.General.Name:=Name.Text;
  SynUniSyn.Info.General.FileTypeName:=FileTypeName.Text;
  SynUniSyn.Info.General.Layout:=Layout.Text;
  SynUniSyn.Info.History.Text:=History.Text;
  SynUniSyn.Info.Sample.Text:=SampleMemo.text;
  SynUniSyn.SaveToFile(FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SampleMemo.Highlighter:=nil;
  if assigned(SynUniSyn) then
    begin
      SynUniSyn.free;
    end;
  SynUniSyn:=TSynUniSyn.create(nil);
  SynUniSyn.CreateStandardRules;
  FileName:=DirectoryListBox.Directory+'\'+InputBox('Enter File Name','','')+'.hgl';
  SampleMemo.Text:='';
  Name.Text:='';
  FileTypeName.Text:='';
  History.Text:='';

  SynUniSyn.SaveToFile(Filename);
  FileListBox.Update;
  FileListBox.Filename:=Filename;
  Load;
end;

procedure TForm1.FileListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_delete then
    if MessageDlg('Are you sure you want to delete '+FileListBox.Filename,mtWarning,[mbYes,MbNo],0)=mrYes then
      begin
        SynUniSyn.free;
        SynUniSyn:=nil;
        FileName:='';
        DeleteFile(FileListBox.Filename);
        FileListBox.Update;
      end;
end;

procedure TForm1.FileListBoxChange(Sender: TObject);
begin
  Save;
  Filename:=FileListBox.Filename;
  Load;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Load;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  save;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FileListBoxDblClick(Sender: TObject);
begin
  if SynUniSyn<>nil then
    begin
      SynUniSyn.Info.Sample.Text:=SampleMemo.text;
      UniDesigner:=TSynUniDesigner.create (SynUniSyn);
      UniDesigner.Execute;
      UniDesigner.free;
      SampleMemo.text:=SynUniSyn.Info.Sample.Text;
    end else Showmessage('Please, choose highlighter');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  onActivate:=nil;

  if paramstr(1)<>'' then
    begin
      DirectoryListBox.Directory:=extractfilepath(ExpandFileName(Paramstr(1)));
      FileListBox.Filename:=paramstr(1);
      Filename:=ExpandFileName(Paramstr(1));
      Load;
    end
  else
    DirectoryListBox.Directory:=extractfilepath(ExpandFileName(Paramstr(0)));
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then FileListBoxDblClick(nil);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  SampleMemo.Highlighter:=nil;
end;

end.




