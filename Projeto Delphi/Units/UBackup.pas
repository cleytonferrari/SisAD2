unit UBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBServices, FileCtrl, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBackup = class(TForm)
    DisabilitaCampo: TPanel;
    GroupBox1: TGroupBox;
    RBGerar: TRadioButton;
    RBRestaurar: TRadioButton;
    MemoLog: TMemo;
    GroupBox2: TGroupBox;
    EndPasta: TDirectoryListBox;
    EndUnidade: TDriveComboBox;
    EndArquivo: TFileListBox;
    IBBackupService1: TIBBackupService;
    IBRestoreService1: TIBRestoreService;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    GerarRestaurar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnGerar: TSpeedButton;
    Image1: TImage;
    procedure RBGerarClick(Sender: TObject);
    procedure RBRestaurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GerarBackup;
    procedure btnGerarClick(Sender: TObject);
    procedure RestaurarBackup;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

uses UPrincipal, UAguarde, UDataModule;

{$R *.dfm}

procedure TfrmBackup.RBGerarClick(Sender: TObject);
begin
  EndUnidade.Drive:='C';
  EndPasta.Directory:=ExtractFilePath(ParamStr(0)) + 'Dados\Backup';
  EndArquivo.Mask := '*.gbk';

  {EndUnidade.Enabled := False;
  EndPasta.Enabled := False;
  EndArquivo.Enabled := False;
  EndUnidade.Color := clBtnFace;
  EndPasta.Color := clBtnFace;
  EndArquivo.Color := clBtnFace;}
end;

procedure TfrmBackup.RBRestaurarClick(Sender: TObject);
begin
  EndUnidade.Drive:='C';
  EndPasta.Directory:=ExtractFilePath(ParamStr(0)) + 'Dados\Backup';
  EndArquivo.Mask := '*.gbk';

  {EndUnidade.Enabled := True;
  EndPasta.Enabled := True;
  EndArquivo.Enabled := True;
  EndUnidade.Color := clWindow;
  EndPasta.Color := clWindow;
  EndArquivo.Color := clWindow;}
end;

procedure TfrmBackup.FormCreate(Sender: TObject);
begin
  frmPrincipal.CriarSubDiretorio('Dados/Backup');
end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  RBGerarClick(Self);
end;

procedure TfrmBackup.GerarBackup;
Var
  NomeArq,Caminho:String;
 I:Integer;
 N:String;
begin
  DMSisAD2.BaseDados.Connected := False;
  Application.ProcessMessages;

 with IBBackupService1 do
  begin
    //ServerName := 'DOMESTICK';
    LoginPrompt := False;
    Params.Add('user_name=sysdba');
    Params.Add('password=171099');
    Active := True;
    try
      Verbose := True;
      Options := [NonTransportable, IgnoreLimbo];

      N:= DateToStr(date);

      for I:=1 to Length(N) do  begin
        if N[I] = '/' then
         NomeArq:=NomeArq+'_' else
         NomeArq:=NomeArq+N[I];
      end;
      Caminho:= ExtractFilePath(ParamStr(0)) + 'Dados';

      DatabaseName := Caminho+'\SisAD2.gdb';

      BackupFile.Add(EndPasta.Directory +'\SisAD2_[ '+NomeArq+' ].gbk');
      ServiceStart;
      MemoLog.Clear;
      While not Eof do begin
        MemoLog.Lines.Add(GetNextLine);
      end;
    finally
      Active := False;
    end;
  end;
  DMSisAD2.BaseDados.Connected := True;
  frmAguarde.Close;
  MemoLog.Lines.Add('');
  MemoLog.Lines.Add('............');
  MemoLog.Lines.Add('Backup Gerado com Sucesso!!!');
  MemoLog.Lines.Add('Processo Finalizado!!!');
end;

procedure TfrmBackup.btnGerarClick(Sender: TObject);
begin
  If RBGerar.Checked then begin
    frmAguarde := TfrmAguarde.Create(Application);
    frmAguarde.Show;
    frmAguarde.Repaint;
    frmAguarde.Refresh;
    Application.ProcessMessages;
    GerarBackup; //Gera o Backup
  end else begin
   if FileExists(EndArquivo.FileName) = true then begin
     frmAguarde := TfrmAguarde.Create(Application);
     frmAguarde.Show;
     frmAguarde.Repaint;
     frmAguarde.Refresh;
     Application.ProcessMessages;
     RestaurarBackup;
   end else
     Application.MessageBox(
     'Selecione um Arquivo!!!','Aviso'  ,MB_OK+MB_ICONINFORMATION);
 end;
end;

procedure TfrmBackup.RestaurarBackup;
Var
 Caminho:String;
begin
 DMSisAD2.BaseDados.Connected := False;
 Application.ProcessMessages;
 with IBRestoreService1 do
  begin
   // ServerName := 'DOMESTICK';
    LoginPrompt := False;
    Params.Add('user_name=sysdba');
    Params.Add('password=171099');
    Active := True;
    try
      Verbose := True;
      Options := [Replace, UseAllSpace];
      PageBuffers := 3000;
      PageSize := 4096;

      Caminho:= ExtractFilePath(ParamStr(0)) + 'Dados';

      DatabaseName.Add( Caminho + '\SisAD2.gdb');

      BackupFile.Add(EndArquivo.FileName);

      MemoLog.Clear;
      ServiceStart;
      While not Eof do
        MemoLog.Lines.Add(GetNextLine);
    finally
      Active := False;
    end;
  end;
 DMSisAD2.BaseDados.Connected := True;
 frmAguarde.Close;
  MemoLog.Lines.Add('');
  MemoLog.Lines.Add('............');
  MemoLog.Lines.Add('Backup Gerado com Sucesso!!!');
  MemoLog.Lines.Add('Processo Finalizado!!!'); 
end;

procedure TfrmBackup.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
