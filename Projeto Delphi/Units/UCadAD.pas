unit UCadAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ActnList, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, Mask, ExtCtrls;

type
  TfrmCadAD = class(TForm)
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnApagar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    DisabilitaCampo: TPanel;
    lbl01: TLabel;
    lbl04: TLabel;
    lbl06: TLabel;
    lbl07: TLabel;
    lbl08: TLabel;
    lbl09: TLabel;
    lbl12: TLabel;
    lbl14: TLabel;
    lbl13: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl05: TLabel;
    lbl02: TLabel;
    lbl03: TLabel;
    lbl15: TLabel;
    Edit01: TDBEdit;
    edit04: TDBEdit;
    edit08: TDBEdit;
    edit12: TDBEdit;
    edit14: TDBEdit;
    edit09: TDBComboBox;
    edit06: TDBComboBox;
    edit05: TDBEdit;
    edit02: TdxDBPopupEdit;
    edit03: TDBEdit;
    PainelPopup: TPanel;
    GridSecretaria: TDBGrid;
    Panel2: TPanel;
    btnSelecionar: TBitBtn;
    edit10: TDBEdit;
    edit11: TDBEdit;
    Panel3: TPanel;
    GridItens: TDBGrid;
    edit13: TDBEdit;
    Edit15: TDBEdit;
    edit07: TDBMemo;
    ActCadFicha: TActionList;
    Salvar: TAction;
    Cancelar: TAction;
    Editar: TAction;
    Sair: TAction;
    Novo: TAction;
    Apagar: TAction;
    Localizar: TAction;
    AddItem: TAction;
    Menu: TMainMenu;
    Arquivo1: TMenuItem;
    Novo1: TMenuItem;
    Salvar1: TMenuItem;
    cancelar1: TMenuItem;
    Editar1: TMenuItem;
    apagar1: TMenuItem;
    Localizar1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    DataSource1: TDataSource;
    DSUsa: TDataSource;
    DSSecretaria: TDataSource;
    DSFicha: TDataSource;
    DsItensAD: TDataSource;
    procedure SairExecute(Sender: TObject);
    procedure GridSecretariaDblClick(Sender: TObject);
    procedure GridSecretariaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edit02CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure edit02KeyPress(Sender: TObject; var Key: Char);
    procedure edit02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit02Popup(Sender: TObject; const EditText: String);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NovoExecute(Sender: TObject);
    procedure edit03Change(Sender: TObject);
    procedure GridItensEnter(Sender: TObject);
    procedure GridItensColExit(Sender: TObject);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure edit04KeyPress(Sender: TObject; var Key: Char);
    procedure edit07KeyPress(Sender: TObject; var Key: Char);
    procedure edit12Change(Sender: TObject);
    procedure edit10Change(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure LocalizarExecute(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure ApagarExecute(Sender: TObject);
    procedure GridItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edit02Enter(Sender: TObject);
    procedure edit04Enter(Sender: TObject);
    procedure edit05Enter(Sender: TObject);
    procedure edit06Enter(Sender: TObject);
    procedure Edit15Enter(Sender: TObject);
    procedure edit09Enter(Sender: TObject);
    procedure edit07Enter(Sender: TObject);
    procedure edit02Exit(Sender: TObject);
    procedure edit04Exit(Sender: TObject);
    procedure edit05Exit(Sender: TObject);
    procedure edit06Exit(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure edit09Exit(Sender: TObject);
    procedure edit07Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAD: TfrmCadAD;
  DS1,DS2:TDataSource;
  Fechar:Boolean;

implementation

uses UDataModule, UControlaTabela, ULocalizar, UPrincipal, IBQuery, URelAD,
  UTelaImpressora;

{$R *.dfm}

procedure TfrmCadAD.SairExecute(Sender: TObject);
begin
  Fechar:= True;
  close;
end;

procedure TfrmCadAD.GridSecretariaDblClick(Sender: TObject);
begin
  if GridSecretaria.ValidFieldIndex(GridSecretaria.SelectedIndex) then begin
   DMSisAD2.tblADFICHA_ID.AsString :=
                 GridSecretaria.SelectedField.AsString;
   Edit02.PopupForm.Close;
  end;
end;

procedure TfrmCadAD.GridSecretariaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    //GridSecretariaDblClick(sender);
    edit15.SetFocus;
end;

procedure TfrmCadAD.btnSelecionarClick(Sender: TObject);
begin
  GridSecretariaDblClick(Self);
end;

procedure TfrmCadAD.edit02CloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  GridSecretariaDblClick(Sender);
end;

procedure TfrmCadAD.edit02KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   Edit02.DroppedDown := true;
end;

procedure TfrmCadAD.edit02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //procedimento para mostrar o nome
  Edit01.SetFocus;
  Edit02.SetFocus;
end;

procedure TfrmCadAD.edit02Popup(Sender: TObject; const EditText: String);
begin
  DMSisAD2.QryUsa.SQL.Clear;
  DMSisAD2.QryUsa.SQL.Add
          ('SELECT * FROM PESQUISAFICHAAD ORDER BY FICHA_ID');
  DMSisAD2.QryUsa.Open;
end;

procedure TfrmCadAD.FormCreate(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
end;

procedure TfrmCadAD.FormShow(Sender: TObject);
begin
//cria o relacionamento em tempo de execucao
  DS1 := TDataSource.Create(application);
  DS1.DataSet := DMSisAD2.tblAD;
  DMSisAD2.tblFicha.MasterFields :=
            'FICHA_ID';
  DMSisAD2.tblFicha.MasterSource := DS1;

  //cria o relacionamento em tempo de execucao
  DS2 := TDataSource.Create(application);
  DS2.DataSet := DMSisAD2.tblFicha;
  DMSisAD2.tblSecretarias.MasterFields :=
            'SECRETARIASMUNICIPAIS_ID';
  DMSisAD2.tblSecretarias.MasterSource := DS2;
  Fechar:=False;
end;

procedure TfrmCadAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //destroi o relacionamento em tempo de execucao
  DS1.Destroy;
  DS2.Destroy;
end;

procedure TfrmCadAD.NovoExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  //
  DMSisAD2.tblSecretarias.Open;
  DMSisAD2.tblFicha.Open;
  DMSisAD2.tblitensAD.Open;
  //
  NovoRegistro(DMSisAD2.tblAD);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  Edit02.SetFocus;
end;

procedure TfrmCadAD.edit03Change(Sender: TObject);
begin
   if (Edit03.Text = '') and
         (DMSisAD2.tblSecretarias.Active=True)then
    Edit03.Text := 'Não Localizada';
end;

procedure TfrmCadAD.GridItensEnter(Sender: TObject);
begin
  //PROCEDIMENTO DO RELACIONAMENTO
  if (DMSisAD2.tblAD.State = dsEdit) or
     (DMSisAD2.tblAD.State = dsInsert) then begin
  //joga o valor do codigo da secretaria
   DMSisAD2.tblAD.Edit;
   DMSisAD2.tblADSECRETARIASMUNICIPAIS_ID.AsInteger :=
       DMSisAD2.tblSecretariasSECRETARIASMUNICIPAIS_ID.AsInteger;
  //
    DMSisAD2.tblAD.Post;//arruma relacionamento
  end;
end;

procedure TfrmCadAD.GridItensColExit(Sender: TObject);
begin
  //  ATUALIZA SOMA DE PROCESSOS
  with DMSisAD2 do begin
    QryFuncao.Close;
    QryFuncao.SQL.Clear;
    QryFuncao.SQL.Add
       ('Select SUM(VALORTOTALITENS) SOMA FROM ITENSAD '+
        'WHERE AD_ID =:NAD');
    QryFuncao.ParamByName('NAD').AsString :=
                      tblADAD_ID.AsString;
    QryFuncao.open;
    tblAD.Edit;
    tblADVALORTOTAL.AsString :=
              QryFuncao.Fields[0].AsString;
  end;
  // FIM
 with DMSisAD2 do begin
   tblADVALORSALDOORCAMENTARIO.AsCurrency :=
   tblADVALORORCAMENTODISPONIVEL.AsCurrency -
   tblADVALORTOTAL.AsCurrency;
 end;
 //
end;

procedure TfrmCadAD.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,'/'] ) then
  begin
   beep;{somente delphi 2.0 ou >}
   key:=#0;
  end;
end;

procedure TfrmCadAD.edit04KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then
  begin
   beep;{somente delphi 2.0 ou >}
   key:=#0;
  end;
end;

procedure TfrmCadAD.edit07KeyPress(Sender: TObject; var Key: Char);
begin
 Key:= Upcase(Key);
end;

procedure TfrmCadAD.edit12Change(Sender: TObject);
begin
  edit10Change(self);
end;

procedure TfrmCadAD.edit10Change(Sender: TObject);
begin
  if DMSisAD2.tblSecretarias.Active = true then begin
  //joga o valor do saldo disponivel
  if (DMSisAD2.tblAD.State = dsEdit) or
   (DMSisAD2.tblAD.State = dsInsert)  then begin
  with DMSisAD2 do begin
   if tblAD.Active = true then begin
    tblAD.Edit;
    tblADVALORORCAMENTODISPONIVEL.AsCurrency :=
         tblFichaDOTACAOINICIAL.AsCurrency -
         tblFichaVALORTOTALPROCESSO.AsCurrency -
         tblFichaVALORTOTALANULACAO.AsCurrency +
         tblFichaVALORTOTALSUPLEMENTACAO.AsCurrency;
    ///jdfsjdfsjhjsdfjhjdsfhjfsdhhjsdfhjfdsjjhfhsdfhj
    tblADVALORSALDOORCAMENTARIO.AsCurrency :=
         tblADVALORORCAMENTODISPONIVEL.AsCurrency -
         tblADVALORTOTAL.AsCurrency;
   end;
  end;
  end;
end;
end;

procedure TfrmCadAD.SalvarExecute(Sender: TObject);
Var NFicha :Integer;
    NAD:integer;
begin
  FocusControl(nil);
  //verifica dados editados
   if (edit03.Text = 'Não Localizada')or(edit03.Text = '') then begin
     edit02.SetFocus;
     lbl02.Font.Color := clred;
     exit;
   end;
   if edit04.Text = '' then begin
     edit04.SetFocus;
     lbl04.Font.Color := clred;
     exit;
   end;
   if edit05.Text = '' then begin
     edit05.SetFocus;
     lbl05.Font.Color := clred;
     exit;
   end;
   if edit06.Text = '' then begin
     edit06.SetFocus;
     lbl06.Font.Color := clred;
     exit;
   end;
   if edit15.Text = '' then begin
     edit15.SetFocus;
     lbl15.Font.Color := clred;
     exit;
   end;
   if edit09.Text = '' then begin
     edit09.SetFocus;
     lbl09.Font.Color := clred;
     exit;
   end;
  //
  //*************************
  NFicha := dmSisAD2.tblADFICHA_ID.AsInteger;
  NAD:=dmSisAD2.tblADAD_ID.AsInteger;
  //joga o valor do codigo da secretaria
   DMSisAD2.tblAD.Edit;
   DMSisAD2.tblADSECRETARIASMUNICIPAIS_ID.AsInteger :=
       DMSisAD2.tblSecretariasSECRETARIASMUNICIPAIS_ID.AsInteger;
  //
  SalvarRegistro(DMSisAD2.tblAD);
  DMSisAD2.tblSecretarias.Close;
  DMSisAD2.tblFicha.Close;
  DMSisAD2.tblitensAD.Close;
  //
  dmSisAD2.QryCommit.ExecSQL;  //Executa o Commit no Banco de Dados;
  //AtualizaFicha
  with dmSisAD2.QryAtuFicha do begin
    Close;
    ParamByName('PFicha').AsInteger := NFicha;
    Open;
    Close;
  end;
  dmSisAD2.QryCommit.ExecSQL;  //Executa o Commit no Banco de Dados;

  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  DisabilitaCampo.Enabled := False;
  //####################################################################
 case Application.MessageBox(
    'Deseja Imprimir a Autorização de Despesa?',
    'Aviso!!!',MB_YESNO+MB_ICONQUESTION) of
  IDYES :  begin
             //monta relatorio
             with DMSisAD2 do begin
              QryAD.Close;
              QryAD.SQL.Clear;
              QryAD.SQL.Add('SELECT * FROM AD WHERE AD_ID = :PAD');
              QryAD.ParamByName('PAD').AsInteger := NAD;
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


           end;
  IDNO  : exit;
  end;
end;

procedure TfrmCadAD.CancelarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  if (DMSisAD2.tblAD.State = dsEdit) or
     (DMSisAD2.tblAD.State = dsInsert) then
  CancelarRegistro(DMSisAD2.tblAD);
  //
  dmSisAD2.tblAD.Close;   
  DMSisAD2.tblSecretarias.Close;
  DMSisAD2.tblFicha.Close;
  DMSisAD2.tblitensAD.Close;
  dmSisAD2.QryRollback.ExecSQL;  //Executa o RollBack no BD  
  //
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
end;

procedure TfrmCadAD.LocalizarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := False;
  Salvar.Enabled := False;
  Cancelar.Enabled := True;
  Editar.Enabled := True;
  Apagar.Enabled := True;
  Localizar.Enabled := False;
  Sair.Enabled := False;

  frmLocalizar := TfrmLocalizar.Create(Application);

  with frmLocalizar do
  begin
    Qry_Localizar.Close;
    Qry_Localizar.SQL.Clear;//Limpa
    CampoTabela:='SELECT * FROM AD';

    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='AD_ID';
    grid.Columns.Items[0].Title.Caption:= 'Código';
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[1].FieldName:='NUMEROAD';
    grid.Columns.Items[1].Title.Caption:= 'Nº A.D.';
    Grid.Columns.Add;
    grid.Columns.Items[2].FieldName:='NUMEROPROCESSO';
    grid.Columns.Items[2].Title.Caption:= 'Nº Processo';
    Grid.Columns.Add;
    grid.Columns.Items[3].FieldName:='DATA';
    grid.Columns.Items[3].Title.Caption:= 'Data';

    //Adciona a opçoes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('N.º A.D.');
    EditOpcao.Items.Add('Nº PROCESSO');

    //nome real da pesquisa
    CampoPesquisa[0]:='NUMEROAD';
    CampoPesquisa[1]:='NUMEROPROCESSO';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';

  end;
  frmLocalizar.Caption := 'Localizar Autorização de Despesa';
  try
   frmLocalizar.ShowModal;

  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblAD.Open;
    DMSisAD2.tblAD.Locate
        ('AD_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
    //
    DMSisAD2.tblAD.open;
    DMSisAD2.tblItensAD.Open;
    DMSisAD2.tblSecretarias.Open;
    DMSisAD2.tblFicha.Open;
    //
  end
  else
    CancelarExecute(Sender);

  frmLocalizar.Free;
end;

procedure TfrmCadAD.EditarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  EditarRegistro(DMSisAD2.tblAD);
  //
  DMSisAD2.tblSecretarias.Open;
  DMSisAD2.tblFicha.Open;
  DMSisAD2.tblitensAD.Open;
  //
end;

procedure TfrmCadAD.ApagarExecute(Sender: TObject);
Var
  NFicha : Integer;
begin
    case Application.MessageBox(
      'A A.D. a ser Excluida pode Conter 1 ou Mais itens!!!'+#13+
      'Estes Itens Tambem Serão Ecluidos!!!'+#13+
      'Confirma a Exclusão da Autorização de Despesas?',
      'Atenção!!!',MB_YESNO+MB_ICONQUESTION) of
    IDYES :  begin
              NFicha := dmSisAD2.tblADFICHA_ID.AsInteger;
              DMSisAD2.tblSecretarias.Close;
              DMSisAD2.tblFicha.Close;
              DMSisAD2.tblitensAD.Close;

              DMSisAD2.tblAD.Delete;
              dmSisAD2.tblAD.Close;    

              dmSisAD2.QryCommit.ExecSQL;

              //AtualizaFicha
              with dmSisAD2.QryAtuFicha do begin
                Close;
                ParamByName('PFicha').AsInteger := NFicha;
                Open;
                Close;
              end;
              dmSisAD2.QryCommit.ExecSQL;  //Executa o Commit no Banco de Dados;

              edit03.Clear;
              DisabilitaCampo.Enabled := False;
              Novo.Enabled := True;
              Salvar.Enabled := False;
              Cancelar.Enabled := False;
              Editar.Enabled := False;
              Apagar.Enabled := False;
              Localizar.Enabled := True;
              Sair.Enabled := True;
             end;
    IDNO  :  begin
              CancelarExecute(Self);
             end;
    end;
end;

procedure TfrmCadAD.GridItensKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edit15.SetFocus;
end;

procedure TfrmCadAD.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

procedure TfrmCadAD.edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadAD.edit04Enter(Sender: TObject);
begin
  Edit04.Color := clMoneyGreen;

  dmSisAD2.QryNumAD.Close;
  dmSisAD2.QryNumAD.SQL.Clear;
  dmSisAD2.QryNumAD.SQL.Add('SELECT * FROM NUMEROAD(:PSEC)');
  dmSisAD2.QryNumAD.ParamByName('PSEC').AsInteger :=
       DMSisAD2.tblSecretariasSECRETARIASMUNICIPAIS_ID.AsInteger;
  dmSisAD2.QryNumAD.Open;
  edit04.Text := dmSisAD2.QryNumADNUM.AsString;
  EDIT05.Text := dmSisAD2.QryNumADDATA.AsString;  
end;

procedure TfrmCadAD.edit05Enter(Sender: TObject);
begin
  Edit05.Color := clMoneyGreen;
end;

procedure TfrmCadAD.edit06Enter(Sender: TObject);
begin
  Edit06.Color := clMoneyGreen;
end;

procedure TfrmCadAD.Edit15Enter(Sender: TObject);
begin
  Edit15.Color := clMoneyGreen;
end;

procedure TfrmCadAD.edit09Enter(Sender: TObject);
begin
  Edit09.Color := clMoneyGreen;
end;

procedure TfrmCadAD.edit07Enter(Sender: TObject);
begin
  Edit07.Color := clMoneyGreen;
end;

procedure TfrmCadAD.edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
end;

procedure TfrmCadAD.edit04Exit(Sender: TObject);
begin
  Edit04.Color := clWindow;
  lbl04.font.Color := clWindowText;
end;

procedure TfrmCadAD.edit05Exit(Sender: TObject);
begin
  Edit05.Color := clWindow;
  lbl05.font.Color := clWindowText;
end;

procedure TfrmCadAD.edit06Exit(Sender: TObject);
begin
  Edit06.Color := clWindow;
  lbl06.font.Color := clWindowText;
end;

procedure TfrmCadAD.Edit15Exit(Sender: TObject);
begin
  Edit15.Color := clWindow;
  lbl15.font.Color := clWindowText;
end;

procedure TfrmCadAD.edit09Exit(Sender: TObject);
begin
  Edit09.Color := clWindow;
  lbl09.font.Color := clWindowText;
end;

procedure TfrmCadAD.edit07Exit(Sender: TObject);
begin
  Edit07.Color := clWindow;
  lbl07.font.Color := clWindowText;
end;

end.
