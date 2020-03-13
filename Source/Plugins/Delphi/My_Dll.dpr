library My_Dll;

uses
  SysUtils, Classes;

type TDllInfo = record
   Author, Date, Comment, Description, MakeWith, WebSite, Mail,
   DllName, MenuCaption : PChar;
   Menu, NeedFileOpen, NeedFileSaved : boolean;
end;

{$R My_Dll.RES}

procedure Init;  stdcall;
begin
//
end;

function GetInfo : TDllInfo; stdcall;
begin
  With Result do
  begin
  DllName := Pchar('DllName');
  Author:=PChar('Author');
  Date:=PChar('Date');
  Description:=PChar('Desscription');
  Comment:=PChar('Comment');
  WebSite:=PChar('WebSite');
  Mail:=Pchar('Mail');
  MakeWith:=PChar('MakeWith');
  MenuCaption := Pchar('Caption');
  Menu := true;
  NeedFileOpen:=true;
  NeedFileSaved:=true;
  end;
end;

function Execute(command : PChar; param : PChar) : PChar ; stdcall;
begin
  if (string(command)='MenuClick') then
  begin
  //
  Result := nil;
  end;
  //
end;

procedure Close; stdcall;
begin
//
end;

exports
Init, GetInfo, Execute, Close;

begin
end.
 