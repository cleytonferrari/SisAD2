unit UFerramentas;

interface
  function Criptografia(mStr: string): string;

implementation
function Criptografia(mStr: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
  mChave:String;
begin
  mChave:='cDiaBjUefGxZLhvmNoPstqR';
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
