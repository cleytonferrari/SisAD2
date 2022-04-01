unit UEncriptar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    function Criptografia(mStr: string): string;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

function TForm1.Criptografia(mStr: string): string;
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Edit2.Text := '';
 Edit2.Text := Criptografia(Edit1.Text); 
end;

end.
