unit ULicenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,Registry,iniFiles, ExtCtrls;

type
  TForm1 = class(TForm)
    EditData: TMaskEdit;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Image1: TImage;
    procedure Executa(Arquivo: String; Estado: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  reg:TRegIniFile;
  EndSistem : Array[0..144] of Char;
  DirSistem:String;

implementation

uses UFerramentas;

{$R *.dfm}

{ TForm1 }

procedure TForm1.Executa(Arquivo: String; Estado: Integer);
var
  Programa : array [0..512] of char;
  CurDir : array [0..255] of char;
  WorkDir : String;
  StartupInfo : TStartupInfo;
  ProcessInfo : TProcessInformation;
begin
    StrPCopy (Programa, Arquivo);
    GetDir (0, WorkDir);
    StrPCopy (CurDir, WorkDir);
    FillChar (StartupInfo, Sizeof (StartupInfo), #0);
    StartupInfo.cb := sizeof (StartupInfo);
    StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartupInfo.wShowWindow := Estado;
    if not CreateProcess (nil, Programa, nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
      //Result := -1
    else
    begin
     WaitForSingleObject (ProcessInfo.hProcess, Infinite);
     //GetExitCodeProcess(ProcessInfo.hProcess, Result);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
ArqIni : TIniFile;
begin
try
  //cria P3Win.ini **************************
  //Na Primeira Execução se nao existir o P3Win.ini ele entao é criado
  GetSystemDirectory(EndSistem,144);//Dir do Sistema
  DirSistem :=StrPas(@EndSistem);//Dir do Sistema em str
  ArqIni := TIniFile.Create(DirSistem+'\P3Win.ini');

  Try
  If Not (fileexists(DirSistem+'\P3Win.ini')) then
  begin
    ArqIni.WriteString('P4','D.I','');
    ArqIni.WriteString('P4','D.F','');
    ArqIni.WriteString('P4','C','');
    ArqIni.WriteString('P4','C2','');
  end;
Finally
  ArqIni.Free;
  FileSetAttr(DirSistem+'\P3Win.ini',7);
  //************************************
end;
except
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 ArqIni : TIniFile;
 VDataAgora,VDataInicio,VDataFim:TDateTime;
 VContador,VContador2:TDateTime;
begin
try
  StrToDate(EditData.EditText);
except
  ShowMessage('Data Inválida!!!');
  Exit;
end;

try
  FileSetAttr(DirSistem+'\P3Win.ini',0);
  //**************************************
  ArqIni := TIniFile.Create(DirSistem+'\P3Win.ini');
  Try

   ArqIni.WriteString('P4','D.I',Criptografia(DateToStr(Date)) );

   ArqIni.WriteString('P4','D.F',Criptografia(DateToStr(StrToDate(EditData.EditText ))));

   ArqIni.WriteString('P4','C',Criptografia(DateToStr(Date)));
   ArqIni.WriteString('P4','C2',Criptografia(DateToStr(Date)));

   //Marca no Registro(P3Win.ini) se o programa pode ser Executado!!!
   ArqIni.WriteString('P5','A','1AB212');//Programa é Executado!!!

Finally
  ArqIni.Free;
  FileSetAttr(DirSistem+'\P3Win.ini',7);
  //**************************************
  ShowMessage('Licença Gravada com Sucesso!!!');
end;
except
end;

end;

end.
