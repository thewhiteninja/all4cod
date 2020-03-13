unit SynUniReg;

interface

{$I SynEdit.inc}

uses
{$IFDEF SYN_COMPILER_6_UP}
  DesignIntf,
  DesignEditors,
{$ELSE}
  DsgnIntf,
{$ENDIF}
  Classes,
  SynEditStrConst,
  SynUniHighlighter,
  SynUniDesigner;

type
  TSynUniEditor = class(TDefaultEditor)
    procedure Edit; override;
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents( SYNS_ComponentsPage, [TSynUniSyn] );
  RegisterComponentEditor(TSynUniSyn, TSynUniEditor);
end;

{ TSynUniEditor }

procedure TSynUniEditor.Edit;
begin
  TSynUniDesigner.EditHighlighter( Component as TSynUniSyn );
end;

procedure TSynUniEditor.ExecuteVerb(Index: Integer);
begin
  Edit;
end;

function TSynUniEditor.GetVerb(Index: Integer): string;
resourcestring
  sEditUni = 'Edit...';
begin
  Result := sEditUni;
end;

function TSynUniEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.

