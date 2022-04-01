unit USeguranca;

interface
uses
  Windows, Messages, IniFiles, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

    function SerialNumHD(FDrive: String): String;
    function ExtractWindowsDir(N:String) : String;
    function ExecutaVerificacao(N:String) : Boolean;
    function Criptografia(mStr: string): string;

implementation



function SerialNumHD(FDrive: String): String;
Var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
 Try GetVolumeInformation(PChar(FDrive+'\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
Except
 Result :='';
end;
end;

function ExecutaVerificacao(N:String) : Boolean;
var
 ArqIni : TIniFile;
 MS: TMemoryStatus;
 MEMarq,HDarq : string; //arquivo
 MEMcur,HDcur : string; //currente
 Ano, Mes, Dia : word;
 H,M,S,Mss : Word;
begin
Result:=True;
  //MEMORIA AVALIADA
   GlobalMemoryStatus(MS);
   MEMcur:= FormatFloat('#,###', MS.dwTotalPhys / 1024);
  //NUMERO SERIAL DO HD
   HDcur:= SerialNumHD(ExtractFileDrive(Application.GetNamePath));

If (fileexists(ExtractWindowsDir('x')+'\SystemAL.INI')) then
begin
  //Se o arquivo existir entra e confere os campos
  ArqIni := TIniFile.Create(ExtractWindowsDir('x')+'\SystemAL.INI');
  try
   MEMarq:= ArqIni.ReadString('SystemAL','M','');
   HDarq := ArqIni.ReadString('SystemAL','H','');
   HDarq := Criptografia(HDarq);
   MEMarq:= Criptografia(MEMarq);

  finally ArqIni.Free; end;
  if (HDarq = HDcur) and (MEMarq = MEMcur) then
  begin
   Result:= True;
   exit;
  end;
//senao existir pede a senha de criação do arquivo
end;
//verifica a senha de liberacao
//formada pela hora minuto dia e mes atual 12:10 31/12/2004 = 12103112
  DecodeDate (Date, Ano, Mes, Dia);
  DecodeTime(Now,H,M,S,Mss);
 if InputBox('Senha de Liberação','Senha','') =
   (IntToStr(H)+IntToStr(M)+IntToStr(Dia)+IntToStr(Mes)) then
 begin
   //senha valida entra aqui
  ArqIni := TIniFile.Create(ExtractWindowsDir('x')+'\SystemAL.INI');
  Try
   MEMcur:= Criptografia(MEMcur);
   HDcur := Criptografia(HDcur);
   ArqIni.WriteString('SystemAL','M',MEMcur);
   ArqIni.WriteString('SystemAL','H',HDcur);
   Result:=True;
  Finally ArqIni.Free; end;
 end else//begin
 Result := False;
end;

function ExtractWindowsDir(N:String): String;
var
MeuBuffer: Array [1..128] of Char;
retorno: Integer;
Begin
retorno:=GetSystemDirectory(@MeuBuffer,128);
if (retorno>128) OR (retorno=0) then
  Result:=''
else
  Result:=StrPas(@MeuBuffer);
end;

function Criptografia(mStr: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
  mChave:String;
begin
  mChave:='abcdefghijlmnopqrstuvxzwyk0123456789';
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);
  for i := 1 to TamanhoString do
  begin
  pos := (i mod TamanhoChave);
  if pos = 0 then
  pos := TamanhoChave;
  posLetra := ord(Result[i]) xor ord(mChave[pos]);
  if posLetra = 0 then
  posLetra := ord(Result[i]);
  Result[i] := chr(posLetra);
  end;
end;



end.
