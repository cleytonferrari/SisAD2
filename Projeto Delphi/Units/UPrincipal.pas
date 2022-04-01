unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, jpeg, StdCtrls, ActnList, Menus;

type
  TfrmPrincipal = class(TForm)
    Fundo: TPanel;
    BarraStatus: TStatusBar;
    BarraTarefa: TPanel;
    Image1: TImage;
    lblVersao: TLabel;
    actList: TActionList;
    CadUsuario: TAction;
    MenuPrincipal: TMainMenu;
    Cadastrar1: TMenuItem;
    Usurio1: TMenuItem;
    Ferramentas1: TMenuItem;
    Backup: TAction;
    CopiadeSeguranaBackup1: TMenuItem;
    CadExecutivo: TAction;
    ExecutivoMunicipal1: TMenuItem;
    CadSecretarias: TAction;
    SecretariasMunicipais1: TMenuItem;
    CadAD: TAction;
    AutorizaodeDespesas1: TMenuItem;
    CadFicha: TAction;
    FichaOramentaria1: TMenuItem;
    RelAD: TAction;
    Relatrios1: TMenuItem;
    AutorizaodeDespesas2: TMenuItem;
    CadDecreto: TAction;
    Decreto1: TMenuItem;
    RelFicha: TAction;
    FichaOramentaria2: TMenuItem;
    CadElementoDespesa: TAction;
    ElementoDespesa1: TMenuItem;
    CadProjAtividade: TAction;
    ProjetodeAtividade1: TMenuItem;
    RelFichaSec: TAction;
    FichaPorSecretaria1: TMenuItem;
    RelDecreto: TAction;
    Decreto2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure CadUsuarioExecute(Sender: TObject);
    procedure BackupExecute(Sender: TObject);
    procedure CriarSubDiretorio(NomeDiretorio: String);
    procedure CadExecutivoExecute(Sender: TObject);
    procedure CadSecretariasExecute(Sender: TObject);
    procedure CadADExecute(Sender: TObject);
    procedure CadFichaExecute(Sender: TObject);
    procedure RelADExecute(Sender: TObject);
    procedure CadDecretoExecute(Sender: TObject);
    procedure RelFichaExecute(Sender: TObject);
    procedure CadElementoDespesaExecute(Sender: TObject);
    procedure CadProjAtividadeExecute(Sender: TObject);
    procedure RelFichaSecExecute(Sender: TObject);
    procedure RelDecretoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  ResultadoPesquisa2:String;
  TelaImpressora : Boolean;
implementation

uses USplash, UFerramentas, UCadUsuario, UBackup, UCadExecutivo,
  UCadSecretarias, UCadAD, UCadFicha, ULocalizar, UTelaImpressora, UAguarde,
  UDataModule, URelAD, UCadDecreto, URelFicha, UCadElementoDespesa,
  UCadProjetoAtividade, URelFichaSec, URelDecreto;

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ShortDateFormat:= 'dddd, dd" de "mmmm" de "yyyy';
  BarraStatus.Panels[1].Text := DateToStr(Date);
  ShortDateFormat:= 'dd/mm/yyyy';
  lblVersao.Caption := 'Vers�o -  '+GetVersionInfo+'   ';
end;

procedure TfrmPrincipal.CadUsuarioExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadUsuario := TfrmCadUsuario.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadUsuario.ShowModal;
  finally
   frmCadUsuario.Release;
   frmCadUsuario := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCadUsuario.Free;

end;

procedure TfrmPrincipal.BackupExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmBackup := TfrmBackup.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmBackup.ShowModal;
  finally
   frmBackup.Release;
   frmBackup := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmBackup.Free;
end;

procedure TfrmPrincipal.CriarSubDiretorio(NomeDiretorio: String);
var
  Caminho: string;
begin
  Caminho := ExtractFilePath(ParamStr(0)) + NomeDiretorio;
  if Not DirectoryExists(Caminho) then
    CreateDir(Caminho);
end;

procedure TfrmPrincipal.CadExecutivoExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadExecutivo := TfrmCadExecutivo.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadExecutivo.ShowModal;
  finally
   frmCadExecutivo.Release;
   frmCadExecutivo := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCadExecutivo.Free;
end;

procedure TfrmPrincipal.CadSecretariasExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadSecretarias := TfrmCadSecretarias.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadSecretarias.ShowModal;
  finally
   frmCadSecretarias.Release;
   frmCadSecretarias := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCadSecretarias.Free;
end;

procedure TfrmPrincipal.CadADExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadAD := TfrmCadAD.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadAD.ShowModal;
  finally
   frmCadAD.Release;
   frmCadAD := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCadAD.Free;
end;

procedure TfrmPrincipal.CadFichaExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadFicha := TfrmCadFicha.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadFicha.ShowModal;
  finally
   frmCadFicha.Release;
   frmCadFicha := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCadFicha.Free;
end;

procedure TfrmPrincipal.RelADExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmLocalizar := TfrmLocalizar.Create(Application);

  with frmLocalizar do
  begin
    Qry_Localizar.Close;
    Qry_Localizar.SQL.Clear;//Limpa
    CampoTabela:='SELECT * FROM AD';

    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='AD_ID';
    grid.Columns.Items[0].Title.Caption:= 'C�digo';
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[1].FieldName:='NUMEROAD';
    grid.Columns.Items[1].Title.Caption:= 'N� A.D.';
    Grid.Columns.Add;
    grid.Columns.Items[2].FieldName:='NUMEROPROCESSO';
    grid.Columns.Items[2].Title.Caption:= 'N� Processo';
    Grid.Columns.Add;
    grid.Columns.Items[3].FieldName:='DATA';
    grid.Columns.Items[3].Title.Caption:= 'Data';

    //Adciona a op�oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('N.� A.D.');
    EditOpcao.Items.Add('N� PROCESSO');

    //nome real da pesquisa
    CampoPesquisa[0]:='NUMEROAD';
    CampoPesquisa[1]:='NUMEROPROCESSO';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';

  end;
  frmLocalizar.Caption :=
   'Localizar Autoriza��o de Despesa para Impress�o';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;

  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
     //monta relatorio
     with DMSisAD2 do begin
      QryAD.Close;
      QryAD.SQL.Clear;
      QryAD.SQL.Add('SELECT * FROM AD WHERE AD_ID = :PAD');
      QryAD.ParamByName('PAD').AsString := ResultadoPesquisa2;
      QryAD.Open;

      QryFicha.Close;
      QryFicha.SQL.Clear;
      QryFicha.SQL.Add ('SELECT * FROM FICHA WHERE FICHA_ID = :PFICHA');
      QryFicha.ParamByName('PFICHA').AsInteger := QryADFICHA_ID.AsInteger;
      QryFicha.Open;

      QrySecretarias.Close;
      QrySecretarias.SQL.Clear;
      QrySecretarias.SQL.Add ('SELECT * FROM SECRETARIASMUNICIPAIS WHERE SECRETARIASMUNICIPAIS_ID = :PSEC');
      QrySecretarias.ParamByName('PSEC').AsInteger := QryFichaSECRETARIASMUNICIPAIS_ID.AsInteger;
      QrySecretarias.Open;

      QryExecutivo.Close;
      QryExecutivo.SQL.Clear;
      QryExecutivo.SQL.Add ('SELECT * FROM EXECUTIVOMUNICIPAL WHERE EXECUTIVOMUNICIPAL_ID = 1');
      QryExecutivo.Open;

      QryItensAD.Close;
      QryItensAD.SQL.Clear;
      QryItensAD.SQL.Add ('SELECT * FROM ITENSAD WHERE AD_ID = :PAD ORDER BY NUMEROITEM');
      QryItensAD.ParamByName('PAD').AsInteger := QryADAD_ID.AsInteger;
      QryItensAD.Open;

     end;

      frmRel := TfrmRel.Create(Application);
    try
      ShortDateFormat := 'dddd, dd" de "mmmm" de "yyyy';
      frmTelaImpressora := TfrmTelaImpressora.Create(Application);
      frmTelaImpressora.ShowModal;
      if TelaImpressora = True then begin
        frmRel.Qrep.Preview;
      end else
        frmRel.Qrep.Print;

      ShortDateFormat := 'dd/mm/yyyy';
    finally
      frmRel.Release;
      frmRel :=  nil;
    end;
      frmRel.Free;
  end
  else
    ShowMessage('Registro N�o Encontrado!!!');
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmLocalizar.Free;
end;

procedure TfrmPrincipal.CadDecretoExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadDecreto := TfrmCadDecreto.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadDecreto.ShowModal;
  finally
   frmCadDecreto.Release;
   frmCadDecreto := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCaddecreto.Free;
end;

procedure TfrmPrincipal.RelFichaExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmLocalizar := TfrmLocalizar.Create(Application);

  with frmLocalizar do
  begin
    Qry_Localizar.Close;
    Qry_Localizar.SQL.Clear;//Limpa
    CampoTabela:='SELECT * FROM PESQUISAFICHA';

    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='FICHA_ID';
    grid.Columns.Items[0].Title.Caption:= 'N�Ficha';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='NOMESECRETARIA';
    grid.Columns.Items[1].Title.Caption:= 'Secretaria';
    Grid.Columns.Add;
    grid.Columns.Items[2].FieldName:='PROJETOATIVIDADE';
    grid.Columns.Items[2].Title.Caption:= 'Proj. Atividade';
    Grid.Columns.Add;
    grid.Columns.Items[3].FieldName:='ELEMENTODESPESA';
    grid.Columns.Items[3].Title.Caption:= 'Elem.Despesa';

    //Adciona a op�oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('N.� FICHA');
    EditOpcao.Items.Add('PROJ.ATIVIDADE');
    EditOpcao.Items.Add('ELEM.DESPESA');
    EditOpcao.Items.Add('SECRETARIA');

    //nome real da pesquisa
    CampoPesquisa[0]:='FICHA_ID';
    CampoPesquisa[1]:='PROJETOATIVIDADE';
    CampoPesquisa[2]:='ELEMENTODESPESA';
    CampoPesquisa[3]:='NOMESECRETARIA';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
    MascaraPesquisa[2]:='';
    MascaraPesquisa[3]:='';

  end;
  frmLocalizar.Caption :=
   'Localizar Ficha Or�amentaria para Impress�o';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;

  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
     //monta relatorio
     with DMSisAD2 do begin
      QryFicha.Close;
      QryFicha.SQL.Clear;
      QryFicha.SQL.Add ('SELECT * FROM FICHA WHERE FICHA_ID = :PFICHA');
      QryFicha.ParamByName('PFICHA').AsString := ResultadoPesquisa2;
      QryFicha.Open;

      QryItensFicha.Close;
      QryItensFicha.SQL.Clear;
      QryItensFicha.SQL.Add (
       'SELECT * FROM ITENSFICHA WHERE FICHA_ID = :PAD ORDER BY DATA, NUMPROCESSO, NUMDECRETO, NUMEROAD, NUMANULACAO, ITENSFICHA_ID');
      QryItensFicha.ParamByName('PAD').AsInteger := QryFichaFICHA_ID.AsInteger;
      QryItensFicha.Open;

      QrySecretarias.Close;
      QrySecretarias.SQL.Clear;
      QrySecretarias.SQL.Add (
       'SELECT * FROM SECRETARIASMUNICIPAIS WHERE SECRETARIASMUNICIPAIS_ID = :PSEC');
      QrySecretarias.ParamByName('PSEC').AsInteger := QryFichaSECRETARIASMUNICIPAIS_ID.AsInteger;
      QrySecretarias.Open;

     end;

      frmRelFicha := TfrmRelFicha.Create(Application);
    try
      frmTelaImpressora := TfrmTelaImpressora.Create(Application);
      frmTelaImpressora.ShowModal;
      if TelaImpressora = True then begin
        frmRelFicha.Qrep.Preview;
      end else
        frmRelFicha.Qrep.Print;
    finally
      frmRelFicha.Release;
      frmRelFicha :=  nil;
    end;
      frmRelFicha.Free;
  end
  else
    ShowMessage('Registro N�o Encontrado!!!');
  //Aguarda a execu��o e depois Libera a Mem�ria
  dmSisAD2.QryItensFicha.Close;  
  frmLocalizar.Free;
end;

procedure TfrmPrincipal.CadElementoDespesaExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadElementoDespesa  := TfrmCadElementoDespesa.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadElementoDespesa.ShowModal;
  finally
   frmCadElementoDespesa.Release;
   frmCadElementoDespesa := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCadElementoDespesa.Free;
end;

procedure TfrmPrincipal.CadProjAtividadeExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmCadProjetoAtividade := TfrmCadProjetoAtividade.Create(Application);
  //Mostra form em modo exclusivo
  try
   frmCadProjetoAtividade.ShowModal;
  finally
   frmCadProjetoAtividade.Release;
   frmCadProjetoAtividade := nil;
  end;
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmCadProjetoAtividade.Free;
end;

procedure TfrmPrincipal.RelFichaSecExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmLocalizar := TfrmLocalizar.Create(Application);

  with frmLocalizar do
  begin
    Qry_Localizar.Close;
    Qry_Localizar.SQL.Clear;//Limpa
    CampoTabela:='SELECT * FROM SECRETARIASMUNICIPAIS';
    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='SECRETARIASMUNICIPAIS_ID';
    grid.Columns.Items[0].Title.Caption:= 'C�digo';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='NOMESECRETARIA';
    grid.Columns.Items[1].Title.Caption:= 'Secretaria';
    Grid.Columns.Add;
    grid.Columns.Items[2].FieldName:='NOMESECRETARIO';
    grid.Columns.Items[2].Title.Caption:= 'Secret�rio(a)';
    Grid.Columns.Add;
    grid.Columns.Items[3].FieldName:='PORTARIA';
    grid.Columns.Items[3].Title.Caption:= 'N�Portaria';

    //Adciona a op�oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('C�DIGO');
    EditOpcao.Items.Add('SECRETARIA');
    EditOpcao.Items.Add('SECRET�RIO(A)');

    //nome real da pesquisa
    CampoPesquisa[0]:='SECRETARIASMUNICIPAIS_ID';
    CampoPesquisa[1]:='NOMESECRETARIA';
    CampoPesquisa[2]:='NOMESECRETARIO';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
    MascaraPesquisa[2]:='';
  end;
  frmLocalizar.Caption :=
   'Localizar Ficha Or�ament�ria por Secretaria para Impress�o';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;

  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
     //monta relatorio
     with DMSisAD2 do begin
      QryFicha.Close;
      QryFicha.SQL.Clear;
      QryFicha.SQL.Add ('SELECT * FROM FICHA WHERE SECRETARIASMUNICIPAIS_ID = :PSEC ORDER BY FICHA_ID');
      QryFicha.ParamByName('PSEC').AsString := ResultadoPesquisa2;
      QryFicha.Open;

      QrySecretarias.Close;
      QrySecretarias.SQL.Clear;
      QrySecretarias.SQL.Add (
       'SELECT * FROM SECRETARIASMUNICIPAIS WHERE SECRETARIASMUNICIPAIS_ID = :PSEC');
      QrySecretarias.ParamByName('PSEC').AsInteger :=
              QryFichaSECRETARIASMUNICIPAIS_ID.AsInteger;
      QrySecretarias.Open;

      QrySaldoFicha.Close;
      QrySaldoFicha.SQL.Clear;
      QrySaldoFicha.SQL.Add (
       'SELECT SUM(VALORTOTALPROCESSO)T_PROC, '+
       'SUM(VALORTOTALANULACAO)T_ANU,SUM(VALORTOTALSUPLEMENTACAO) T_SUP,'+
       'SUM(DOTACAOINICIAL) T_DOTINI, '+
       ' (SUM(DOTACAOINICIAL)  - SUM(VALORTOTALPROCESSO) - '+
       'SUM(VALORTOTALANULACAO) + SUM(VALORTOTALSUPLEMENTACAO) ) T_TOTAL'+
       ' FROM  FICHA WHERE '+
       ' SECRETARIASMUNICIPAIS_ID = :PSEC');

      QrySaldoFicha.ParamByName('PSEC').AsInteger :=
              QryFichaSECRETARIASMUNICIPAIS_ID.AsInteger;
      QrySaldoFicha.Open;

      QryFichaSec.Close;
      QryFichaSec.SQL.Clear;
      QryFichaSec.SQL.Add (
       'SELECT * FROM FICHASECRETARIA WHERE SECRETARIASMUNICIPAIS_ID = :PATI');
      QryFichaSec.ParamByName('PATI').AsString :=
              QryFichaSECRETARIASMUNICIPAIS_ID.AsString;
      QryFichaSec.Open;

     end;

      frmRelFichaSec := TfrmRelFichaSec.Create(Application);
    try
      frmTelaImpressora := TfrmTelaImpressora.Create(Application);
      frmTelaImpressora.ShowModal;
      if TelaImpressora = True then begin
        frmRelFichaSec.Qrep.Preview;
      end else
        frmRelFichaSec.Qrep.Print;
    finally
      frmRelFichaSec.Release;
      frmRelFichaSec :=  nil;
    end;
      frmRelFichaSec.Free;
  end
  else
    ShowMessage('Registro N�o Encontrado!!!');
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmLocalizar.Free;
end;

procedure TfrmPrincipal.RelDecretoExecute(Sender: TObject);
begin
  //Carrega form na mem�ria
  frmLocalizar := TfrmLocalizar.Create(Application);

  with frmLocalizar do
  begin
    Qry_Localizar.Close;
    Qry_Localizar.SQL.Clear;//Limpa
    CampoTabela:='SELECT * FROM DECRETO';

    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='DECRETO_ID';
    grid.Columns.Items[0].Title.Caption:= 'Decreto';
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[1].FieldName:='DATA';
    grid.Columns.Items[1].Title.Caption:= 'Data';
    Grid.Columns.Add;
    grid.Columns.Items[2].FieldName:='AN_EX';
    grid.Columns.Items[2].Title.Caption:= 'Recurso';
    Grid.Columns.Add;
    grid.Columns.Items[3].FieldName:='SU_CE';
    grid.Columns.Items[3].Title.Caption:= 'Credito';

    //Adciona a op�oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('DECRETO');
    EditOpcao.Items.Add('DATA');
    EditOpcao.Items.Add('RECURSO');
    EditOpcao.Items.Add('CREDITO');

    //nome real da pesquisa
    CampoPesquisa[0]:='DECRETO_ID';
    CampoPesquisa[1]:='DATA';
    CampoPesquisa[2]:='AN_EX';
    CampoPesquisa[3]:='SU_CE';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
    MascaraPesquisa[2]:='';
    MascaraPesquisa[3]:='';
  end;
  frmLocalizar.Caption := 'Localizar Decreto para Impress�o';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;

  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
     //monta relatorio
     with DMSisAD2 do begin
      QryDecreto.Close;
      QryDecreto.SQL.Clear;
      QryDecreto.SQL.Add ('SELECT * FROM DECRETO WHERE DECRETO_ID = :PDEC ORDER BY DECRETO_ID');
      QryDecreto.ParamByName('PDEC').AsString := ResultadoPesquisa2;
      QryDecreto.Open;

      QryITENS_DEC_CREDITO.Close;
      QryITENS_DEC_CREDITO.SQL.Clear;
      QryITENS_DEC_CREDITO.SQL.Add (
       'SELECT * FROM ITENS_DEC_CREDITO WHERE DECRETO_ID = :PSEC');

      QryITENS_DEC_CREDITO.ParamByName('PSEC').AsString := ResultadoPesquisa2;
      QryITENS_DEC_CREDITO.Open;

      QryITENS_DEC_RECURSO.Close;
      QryITENS_DEC_RECURSO.SQL.Clear;
      QryITENS_DEC_RECURSO.SQL.Add (
       'SELECT * FROM ITENS_DEC_RECURSO WHERE DECRETO_ID = :PSEC');
      QryITENS_DEC_RECURSO.ParamByName('PSEC').AsString := ResultadoPesquisa2;
      QryITENS_DEC_RECURSO.Open;

      QryDecRecursoTotal.Close;
      QryDecRecursoTotal.SQL.Clear;
      QryDecRecursoTotal.SQL.Add('SELECT * FROM ITENS_DEC_RECURSO_TOTAL WHERE DECRETO_ID = :PDEC');
      QryDecRecursoTotal.ParamByName('PDEC').AsString := ResultadoPesquisa2;
      QryDecRecursoTotal.open;

      QryDecCreditoTotal.Close;
      QryDecCreditoTotal.SQL.Clear;
      QryDecCreditoTotal.SQL.Add('SELECT * FROM ITENS_DEC_CREDITO_TOTAL WHERE DECRETO_ID = :PDEC');
      QryDecCreditoTotal.ParamByName('PDEC').AsString := ResultadoPesquisa2;
      QryDecCreditoTotal.open;
     end;

      frmRelDecreto := TfrmRelDecreto.Create(Application);
    try
      frmTelaImpressora := TfrmTelaImpressora.Create(Application);
      frmTelaImpressora.ShowModal;
      if TelaImpressora = True then begin
        frmRelDecreto.Qrep.Preview;
      end else
        frmRelDecreto.Qrep.Print;
    finally
      frmRelDecreto.Release;
      frmRelDecreto :=  nil;
    end;
      frmRelDecreto.Free;
  end
  else
    ShowMessage('Registro N�o Encontrado!!!');
  //Aguarda a execu��o e depois Libera a Mem�ria
  frmLocalizar.Free;
end;

end.
