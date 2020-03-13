library SaveCrypt;

uses
  Windows, SysUtils, Classes,
  SaveCrypt_Form1 in 'SaveCrypt_Form1.pas' {Form1};

type TDllInfo = record
   Author, Date, Comment, Description, MakeWith, WebSite, Mail,
   DllName, MenuCaption : PChar;
   Menu, NeedFileOpen, NeedFileSaved : boolean;
end;

{$R SaveCrypt.RES}

procedure Init;  stdcall;
begin
  //
end;

function GetInfo : TDllInfo; stdcall;
begin
  With Result do
  begin
  DllName := Pchar('SaveCrypt.dll');
  Author:=PChar('thewhiteninja');
  Date:=PChar('28 Février 2006');
  Description:=PChar('Ce plugins permet de chiffrer/déchiffrer n''importe quel fichier en utilisant le 3DES.');
  Comment:=PChar('Composants DCPCrypt v2 Beta 3');
  WebSite:=PChar('http://www.opensofts.info');
  Mail:=Pchar('mail@localhost"');
  MakeWith:=PChar('Borland Delphi 2005 PE');
  MenuCaption := Pchar('Chiffrer un fichier');
  Menu := true;
  NeedFileOpen:=true;
  NeedFileSaved:=true;
  end;
end;

function Execute(command : PChar; param : PChar) : PChar ; stdcall;
begin
  if (string(command)='MenuClick') then
  begin
    With TForm1.Create(nil) do
    begin
       LabeledEdit1.Text:=string(param);
       LabeledEdit2.Text:=string(param)+'.cry';
       ShowModal;
       Free;
    end;
    Result:= nil;
  end;
end;

procedure Close; stdcall;
begin
//
end;

exports
Init, GetInfo, Execute, Close;

begin
Randomize;
end.
