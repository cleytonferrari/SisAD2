unit UFerramentas;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, IniFiles,Mask, Registry,DBCtrls, ExtCtrls, Buttons;

function VerificaCPF(num: string): boolean;
function VerificaData(Data : String):boolean;
procedure GetBuildInfo(var v1, v2, v3, v4:word);
function GetVersionInfo: String;

implementation

function VerificaCPF(num: string): boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  try
  n1:=StrToInt(num[1]);
  n2:=StrToInt(num[2]);
  n3:=StrToInt(num[3]);
  n4:=StrToInt(num[4]);
  n5:=StrToInt(num[5]);
  n6:=StrToInt(num[6]);
  n7:=StrToInt(num[7]);
  n8:=StrToInt(num[8]);
  n9:=StrToInt(num[9]);
  d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
    d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
    d2:=11-(d2 mod 11);
  if d2>=10 then d2:=0;
    calculado:=inttostr(d1)+inttostr(d2);
    digitado:=num[10]+num[11];
  if calculado=digitado then
    VerificaCPF:=true
    else
    VerificaCPF:=false;
  except
   on EConvertError do
    VerificaCPF:=false;
  end;
end;

function VerificaData(Data : String):boolean;
begin
  try
  StrToDate(Data);
  Result := True;
  except
  on EConvertError do
    Result:=False;
end;
end;

procedure GetBuildInfo(var v1, v2, v3, v4: word);
Var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize:= GetFileVersionInfoSize(PChar(ParamStr(0)),Dummy);
  GetMem(VerInfo,VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)),0,VerInfoSize,VerInfo);
  VerQueryValue(VerInfo,'\',Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    v1:= dwFileVersionMS shr 16;
    v2:= dwFileVersionMS and $FFFF;
    v3:= dwFileVersionLS shr 16;
    v4:= dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function GetVersionInfo: String;
Var
  v1,v2,v3,v4 : Word;
begin
  GetBuildInfo(v1,v2,v3,v4);
  Result:= IntToStr(v1) + '.'
     + IntToStr(v2) + '.'
     + IntToStr(v3) + '.'
     + IntToStr(v4);
end;


end.
 
