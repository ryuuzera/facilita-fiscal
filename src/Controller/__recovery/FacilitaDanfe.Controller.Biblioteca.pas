unit FacilitaDanfe.Controller.Biblioteca;


interface

uses
  Winapi.ShellAPI, Winapi.Windows, Vcl.Forms;

Type
  Biblioteca = Class
  class function ShellExecuteAndWait(Operation, FileName, Parameter, Directory: String; Show: Word; bWait: Boolean): Longint;
  class procedure AbrirArquivo(aFileName: String);
  class function getVersao: string;
  End;

implementation

uses
  System.UITypes;


{ Biblioteca }

class procedure Biblioteca.AbrirArquivo(aFileName: String);
var
  SavCursor: TCursor;
begin
  SavCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    ShellExecuteAndWait('open', aFileName, '', '', SW_SHOWMAXIMIZED, True);
  finally
    Screen.Cursor := SavCursor;
  end;

end;

class function Biblioteca.getVersao: string;
begin
  result := 'v0.1 pre-alpha';
end;

class function Biblioteca.ShellExecuteAndWait(Operation, FileName, Parameter,
  Directory: String; Show: Word; bWait: Boolean): Longint;
var
  bOK: Boolean;
  Info: TShellExecuteInfo;
begin
  FillChar(Info, SizeOf(Info), Chr(0));
  Info.cbSize := SizeOf(Info);
  Info.fMask := SEE_MASK_NOCLOSEPROCESS;
  Info.lpVerb := PChar(Operation);
  Info.lpFile := PChar(FileName);
  Info.lpParameters := PChar(Parameter);
  Info.lpDirectory := PChar(Directory);
  Info.nShow := Show;
  bOK := Boolean(ShellExecuteEx(@Info));
  if bOK then
  begin
    if bWait then
    begin
      while WaitForSingleObject(Info.hProcess, 100) = WAIT_TIMEOUT do
        Application.ProcessMessages;
      bOK := GetExitCodeProcess(Info.hProcess, DWORD(Result));
    end
    else
      Result := 0;
  end;
  if not bOK then
    Result := -1;
end;


end.
