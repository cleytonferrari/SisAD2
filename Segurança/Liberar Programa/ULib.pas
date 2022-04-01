unit ULib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    function ExtractWindowsDir(N:String): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  EndSistem : Array[0..144] of Char;
  DirSistem:String;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  If (fileexists(ExtractWindowsDir('x')+'\SystemAL.INI')) then
    DeleteFile(ExtractWindowsDir('x')+'\SystemAL.INI');

    GetSystemDirectory(EndSistem,144);//Dir do Sistema
    DirSistem :=StrPas(@EndSistem);//Dir do Sistema em str
    If (fileexists(DirSistem+'\P3Win.ini')) then
      DeleteFile((DirSistem+'\P3Win.ini'));
end;

function TForm1.ExtractWindowsDir(N: String): String;
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

end.
