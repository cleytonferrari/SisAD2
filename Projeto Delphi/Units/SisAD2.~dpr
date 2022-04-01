program SisAD2;

uses
  forms,
  Dialogs,
  Messages,
  Windows,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  ULoggin in 'ULoggin.pas' {frmLoggin},
  USeguranca in 'USeguranca.pas',
  UDataModule in 'UDataModule.pas' {dmSisAD2: TDataModule},
  USplash in 'USplash.pas' {frmSplash},
  UFerramentas in 'UFerramentas.pas',
  UCadUsuario in 'UCadUsuario.pas' {frmCadUsuario},
  UControlaTabela in 'UControlaTabela.pas',
  ULocalizar in 'ULocalizar.pas' {frmLocalizar},
  UBackup in 'UBackup.pas' {frmBackup},
  UAguarde in 'UAguarde.pas' {frmAguarde},
  UCadExecutivo in 'UCadExecutivo.pas' {frmCadExecutivo},
  UCadSecretarias in 'UCadSecretarias.pas' {frmCadSecretarias},
  UCadAD in 'UCadAD.pas' {frmCadAD},
  UCadFicha in 'UCadFicha.pas' {frmCadFicha},
  URelAD in 'URelAD.pas' {frmRel},
  UTelaImpressora in 'UTelaImpressora.pas' {frmTelaImpressora},
  UCadDecreto in 'UCadDecreto.pas' {frmCadDecreto},
  URelFicha in 'URelFicha.pas' {frmRelFicha},
  UCadElementoDespesa in 'UCadElementoDespesa.pas' {frmCadElementoDespesa},
  UCadProjetoAtividade in 'UCadProjetoAtividade.pas' {frmCadProjetoAtividade},
  URelFichaSec in 'URelFichaSec.pas' {frmRelFichaSec},
  URelDecreto in 'URelDecreto.pas' {frmRelDecreto};

{$R *.res}

begin
  { É utilizado para validar o programa ADexe
  com a utilização do Prot2003, para programas
  alugados, conta X dias para bloquear o SisAD2 }
  if ParamStr(1) <> '111181' then begin //senha
   Application.MessageBox('Erro ao abrir o SisAD2',
  'SisAD2',MB_OK+mb_iconerror );
   Halt;
  end;


//abaixo usa se for vendido o programa
//cria um arquivo contendo as informações
//sobre a memoria e o serial do HD
//so abre se conferir com o que consta no
//arquivo criado na primeira utilização
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  frmSplash.lblSplash.Caption := 'Carregando Aplicativo...';
  frmSplash.Refresh;
  Application.ProcessMessages;


  if ExecutaVerificacao('x') = False then
  begin
  frmSplash.lblSplash.Caption := 'Erro de Validação...';
  frmSplash.Refresh;
  Application.ProcessMessages;

   Application.MessageBox('Erro ao abrir o SisAD2!!!'+#13+
                          'Erro Numero: 0001',
  'SisAD2',MB_OK+mb_iconerror );

  frmSplash.Visible := False;
  frmSplash.Release;
  frmSplash:= nil;

   Halt;
  end;

  Application.Initialize;
  Application.Title := 'SisAD2';

  frmSplash.lblSplash.Caption := 'Conectando ao Banco de Dados...';
  frmSplash.Refresh;
  Application.ProcessMessages;

  Application.CreateForm(TdmSisAD2, dmSisAD2);
  frmLoggin := TfrmLoggin.Create(Application);
  frmLoggin.Refresh;

  frmSplash.lblSplash.Caption := 'Iniciando Loggin...';
  frmSplash.Refresh;
  Application.ProcessMessages;


  frmLoggin.ShowModal;

  if Entra = True then begin
  frmLoggin.Release;
  frmLoggin := nil;
  frmLoggin.Free;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmPrincipal.BarraStatus.Panels[2].Text := 'Usuário: ' +Usuario;
  Application.Run;
  end else begin
  Application.Terminate;
  end;
end.
