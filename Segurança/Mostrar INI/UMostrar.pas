unit UMostrar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
   Forms, Dialogs ,ShellAPI, Menus, ExtCtrls, Registry,iniFiles, StdCtrls,
  Buttons;

type
  TfrmProt2003mostrar = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProt2003mostrar: TfrmProt2003mostrar;
  reg:TRegIniFile;
  EndSistem : Array[0..144] of Char;
  DirSistem:String;
implementation

{$R *.dfm}

procedure TfrmProt2003mostrar.FormCreate(Sender: TObject);
begin
  GetSystemDirectory(EndSistem,144);//Dir do Sistema
  DirSistem :=StrPas(@EndSistem);//Dir do Sistema em str
end;

procedure TfrmProt2003mostrar.BitBtn1Click(Sender: TObject);
begin
  //Mostra o arquivo
  FileSetAttr(DirSistem+'\P3Win.ini',0);
end;

procedure TfrmProt2003mostrar.BitBtn2Click(Sender: TObject);
begin
 //Oculta o arquivo
 FileSetAttr(DirSistem+'\P3Win.ini',7);
end;

end.
