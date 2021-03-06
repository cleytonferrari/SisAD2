unit UCadFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ActnList, Buttons, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, dxDBELib, StdCtrls, Grids, DBGrids, Mask, DBCtrls, ExtCtrls;

type
  TfrmCadFicha = class(TForm)
    DisabilitaCampo: TPanel;
    lbl02: TLabel;
    lbl01: TLabel;
    lbl07: TLabel;
    lbl08: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbl09: TLabel;
    lbl03: TLabel;
    lbl04: TLabel;
    lbl05: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edit01: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    edit09: TDBEdit;
    PainelPopup: TPanel;
    GridSecretaria: TDBGrid;
    Panel2: TPanel;
    btnNovaSecretaria: TBitBtn;
    btnSelecionar: TBitBtn;
    edit02: TdxDBPopupEdit;
    edit03: TDBEdit;
    edit04: TDBEdit;
    edit05: TDBEdit;
    Panel3: TPanel;
    GridItens: TDBGrid;
    Edit10: TDBEdit;
    Edit11: TDBEdit;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnApagar: TSpeedButton;
    btnLocalizar: TSpeedButton;
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
    DsItens: TDataSource;
    Label1: TLabel;
    DataSource2: TDataSource;
    Edit08: TDBLookupComboBox;
    Label2: TLabel;
    DataSource3: TDataSource;
    Edit07: TDBLookupComboBox;
    procedure SairExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnNovaSecretariaClick(Sender: TObject);
    procedure GridSecretariaDblClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure GridSecretariaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure NovoExecute(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure LocalizarExecute(Sender: TObject);
    procedure edit02Popup(Sender: TObject; const EditText: String);
    procedure edit02KeyPress(Sender: TObject; var Key: Char);
    procedure edit02CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edit03Change(Sender: TObject);
    procedure edit04Change(Sender: TObject);
    procedure edit05Change(Sender: TObject);
    procedure edit09Exit(Sender: TObject);
    procedure edit01KeyPress(Sender: TObject; var Key: Char);
    procedure edit07KeyPress(Sender: TObject; var Key: Char);
    procedure edit08KeyPress(Sender: TObject; var Key: Char);
    procedure ApagarExecute(Sender: TObject);
    procedure edit02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit01Enter(Sender: TObject);
    procedure edit02Enter(Sender: TObject);
    procedure edit09Enter(Sender: TObject);
    procedure edit07Enter(Sender: TObject);
    procedure edit08Enter(Sender: TObject);
    procedure edit01Exit(Sender: TObject);
    procedure edit02Exit(Sender: TObject);
    procedure edit07Exit(Sender: TObject);
    procedure edit08Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFicha: TfrmCadFicha;
  Fechar:Boolean;
  DS1:TDataSource;
    
implementation

uses UDataModule, UCadSecretarias, UControlaTabela, ULocalizar, UPrincipal;

{$R *.dfm}

procedure TfrmCadFicha.SairExecute(Sender: TObject);
begin
 Fechar:= True;
 close;
end;

procedure TfrmCadFicha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

procedure TfrmCadFicha.FormShow(Sender: TObject);
begin
  Fechar := False;
//cria o relacionamento em tempo de execucao
  DS1 := TDataSource.Create(application);
  DS1.DataSet := DMSisAD2.tblFicha;
  DMSisAD2.tblSecretarias.MasterFields :=
            'SECRETARIASMUNICIPAIS_ID';
  DMSisAD2.tblSecretarias.MasterSource := DS1;

  if   dmSisAD2.QryItensFicha.Active =  true then
      dmSisAD2.QryItensFicha.Close;

end;

procedure TfrmCadFicha.btnNovaSecretariaClick(Sender: TObject);
begin
  Edit02.PopupForm.Close;
  frmCadSecretarias := TfrmCadSecretarias.Create(Application);
  try
   DMSisAD2.tblSecretarias.Close;//fechar as tabelas envolvidas
   DS1.Destroy; //distruir o relacionamento

   frmCadSecretarias.ShowModal;

  //cria o relacionamento em tempo de execucao
  DS1 := TDataSource.Create(application);
  DS1.DataSet := DMSisAD2.tblFicha;
  DMSisAD2.tblSecretarias.MasterFields :=
            'SECRETARIASMUNICIPAIS_ID';
  DMSisAD2.tblSecretarias.MasterSource := DS1;
  DMSisAD2.tblSecretarias.Open;//reabre a tabela

  finally
   frmCadSecretarias.Release;
   frmCadSecretarias:=nil;
  end;
   frmCadSecretarias.Free;
end;

procedure TfrmCadFicha.GridSecretariaDblClick(Sender: TObject);
begin
  if GridSecretaria.ValidFieldIndex(GridSecretaria.SelectedIndex) then begin
   DMSisAD2.tblFichaSECRETARIASMUNICIPAIS_ID.AsString :=
                 GridSecretaria.SelectedField.AsString;
   Edit02.PopupForm.Close;
  end;
end;

procedure TfrmCadFicha.btnSelecionarClick(Sender: TObject);
begin
  GridSecretariaDblClick(Self);
end;

procedure TfrmCadFicha.GridSecretariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    GridSecretariaDblClick(sender);
end;

procedure TfrmCadFicha.FormCreate(Sender: TObject);
begin
  //DMSisAD2.tblItensFicha.Close;   
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
end;

procedure TfrmCadFicha.NovoExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  //
  DMSisAD2.tblSecretarias.Open;
  dmSisAD2.tblElementoDespesa.Open;
  dmSisAD2.tblProjetoAtividade.Open;    
  //
  //relacionamento do itens da ficha
  //DMSisAD.tblItensFicha.open;
  //
  NovoRegistro(DMSisAD2.tblFicha);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  Edit02.SetFocus;
end;

procedure TfrmCadFicha.SalvarExecute(Sender: TObject);
begin
  FocusControl(nil);
  //verifica dados editados
   if edit01.Text = '' then begin
     edit01.SetFocus;
     lbl01.Font.Color := clred;
     exit;
   end;
   if (Edit03.Text = 'N?O LOCALIZADA')or(edit03.Text = '') then begin
     edit02.SetFocus;
     lbl02.Font.Color := clred;
     exit;
   end;
   if edit09.Text = '' then begin
     edit09.SetFocus;
     lbl09.Font.Color := clred;
     exit;
   end;
   if DMSisAD2.tblFichaPROJETOATIVIDADE.AsString =''    then begin
     edit07.SetFocus;
     lbl07.Font.Color := clred;
     exit;
   end;
   if edit10.Text = '' then begin
     edit10.SetFocus;
     lbl10.Font.Color := clred;
     exit;
   end;
   if DMSisAD2.tblFichaELEMENTODESPESA.AsString =''  then begin
     edit08.SetFocus;
     lbl08.Font.Color := clred;
     exit;
   end;
   if edit11.Text = '' then begin
     edit11.SetFocus;
     lbl11.Font.Color := clred;
     exit;
   end;
  //
  DMSisAD2.tblSecretarias.Close;
  dmSisAD2.tblElementoDespesa.close;
  dmSisAD2.tblProjetoAtividade.close;
  //
  //DMSisAD.tblItensFicha.Close;
  //
  SalvarRegistro(DMSisAD2.tblFicha);
  dmSisAD2.QryCommit.ExecSQL;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  DisabilitaCampo.Enabled := False;
  //
  edit01.Enabled := True;
  edit01.Color := clWindow;
  //
  dmSisAD2.QryItensFicha.Close;  
end;

procedure TfrmCadFicha.CancelarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  CancelarRegistro(DMSisAD2.tblFicha);
  dmSisAD2.QryRollback.ExecSQL;  
  //
  DMSisAD2.tblSecretarias.Close;
    dmSisAD2.tblElementoDespesa.close;
  dmSisAD2.tblProjetoAtividade.close;
  //
  edit03.Clear; edit04.Clear; edit05.Clear;   
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  //
  edit01.Enabled := True;
  edit01.Color := clWindow;
  //
  dmSisAD2.QryItensFicha.Close;
end;

procedure TfrmCadFicha.EditarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  EditarRegistro(DMSisAD2.tblFicha);
  //
  DMSisAD2.tblSecretarias.Open;
    dmSisAD2.tblElementoDespesa.Open;
  dmSisAD2.tblProjetoAtividade.Open;
  //
  //DMSisAD.tblItensFicha.Open;
  //
  edit01.Enabled := False;
  edit01.Color := clBtnFace;
  //
end;

procedure TfrmCadFicha.LocalizarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := False;
  Salvar.Enabled := False;
  Cancelar.Enabled := True;
  Editar.Enabled := True;
  Apagar.Enabled := True;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  //********************
  //Carrega form na mem?ria
  frmLocalizar := TfrmLocalizar.Create(Application);

  with frmLocalizar do
  begin
    Qry_Localizar.Close;
    Qry_Localizar.SQL.Clear;//Limpa
    CampoTabela:='SELECT * FROM PESQUISAFICHA';

    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='FICHA_ID';
    grid.Columns.Items[0].Title.Caption:= 'N?Ficha';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='NOMESECRETARIA';
    grid.Columns.Items[1].Title.Caption:= 'Secretaria';
    Grid.Columns.Add;
    grid.Columns.Items[2].FieldName:='PROJETOATIVIDADE';
    grid.Columns.Items[2].Title.Caption:= 'Proj. Atividade';
    Grid.Columns.Add;
    grid.Columns.Items[3].FieldName:='ELEMENTODESPESA';
    grid.Columns.Items[3].Title.Caption:= 'Elem.Despesa';

    //Adciona a op?oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('N.? FICHA');
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
  frmLocalizar.Caption := 'Localizar Ficha';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;

  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblFicha.Open;
    DMSisAD2.tblFicha.Locate
        ('FICHA_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
    //
    DMSisAD2.tblFicha.open;
    DMSisAD2.tblSecretarias.Open;
      dmSisAD2.tblElementoDespesa.Open;
  dmSisAD2.tblProjetoAtividade.Open;

     dmSisAD2.QryItensFicha.Close;
     dmSisAD2.QryItensFicha.SQL.Clear;
     dmSisAD2.QryItensFicha.SQL.Add(' SELECT * FROM ITENSFICHA '+
     'WHERE FICHA_ID = :NFICHA ORDER BY DATA, NUMPROCESSO, NUMDECRETO, NUMEROAD, NUMANULACAO, ITENSFICHA_ID');
     dmSisAD2.QryItensFicha.ParamByName('NFicha').AsInteger :=
       dmSisAD2.tblFichaFICHA_ID.AsInteger;
     dmSisAD2.QryItensFicha.Open;
    //
  end
  else
    CancelarExecute(Sender); //eRRRRRROOOOOOOOOOORRRRRRRRR
  //Aguarda a execu??o e depois Libera a Mem?ria
  frmLocalizar.Free;
end;

procedure TfrmCadFicha.edit02Popup(Sender: TObject;
  const EditText: String);
begin
  DMSisAD2.QryUsa.SQL.Clear;
  DMSisAD2.QryUsa.SQL.Add
          ('SELECT * FROM SECRETARIASMUNICIPAIS ORDER BY NOMESECRETARIA');
  DMSisAD2.QryUsa.Open;
end;

procedure TfrmCadFicha.edit02KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
   Edit02.DroppedDown := true;
end;

procedure TfrmCadFicha.edit02CloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  GridSecretariaDblClick(Sender);
end;

procedure TfrmCadFicha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DS1.Destroy;
end;

procedure TfrmCadFicha.edit03Change(Sender: TObject);
begin
   if (Edit03.Text = '') and
         (DMSisAD2.tblSecretarias.Active=True)then
    Edit03.Text := 'N?o Localizada';
end;

procedure TfrmCadFicha.edit04Change(Sender: TObject);
begin
   if (Edit04.Text = '') and
         (DMSisAD2.tblSecretarias.Active=True)then
    Edit04.Text := 'N?o Localizado';
end;

procedure TfrmCadFicha.edit05Change(Sender: TObject);
begin
   if (Edit05.Text = '') and
         (DMSisAD2.tblSecretarias.Active=True)then
    Edit05.Text := 'N?o Localizada';
end;

procedure TfrmCadFicha.edit09Exit(Sender: TObject);
begin
  Edit09.Color := clWindow;
  lbl09.font.Color := clWindowText;
  //atualizar saldo se modificado
with DMSisAD2 do begin
  QryUsa.Close;
  QryUsa.SQL.Clear;
  QryUsa.SQL.Add( 'SELECT * FROM ITENSFICHA WHERE FICHA_ID = :PFICHA');
  QryUsa.ParamByName('PFicha').AsString := Edit01.Text;
  QryUsa.Open;
  if QryUsa.RecordCount >=1 then begin
    with dmSisAD2.QryAtuFicha do begin
    Close;
    ParamByName('PFicha').AsString := Edit01.text;
    Open;
    Close;
    //pode dar erro 13/06/2004
  end;

  end;

end;
//fim
end;

procedure TfrmCadFicha.edit01KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TfrmCadFicha.edit07KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,'.'] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TfrmCadFicha.edit08KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,'.'] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TfrmCadFicha.ApagarExecute(Sender: TObject);
begin
 //verifica se existe ad associada a ficha
  with DMSisAD2 do begin
    QryUsa.Close;
    QryUsa.SQL.Clear;
    QryUsa.SQL.Add( 'SELECT * FROM ITENSFICHA WHERE FICHA_ID = :PFICHA');
    QryUsa.ParamByName('PFicha').AsString := Edit01.Text;
    QryUsa.Open;
    if QryUsa.RecordCount >=1 then begin
      Application.MessageBox(
      'A Ficha a ser Excluida Cont?m Uma ou Mais Itens!!!'+#13+
      'Voc? deve exclui-los antes de tentar excluir a Ficha.',
      'Aten??o!!!',MB_OK+MB_ICONINFORMATION);
      exit;
    end;
  end;


    ExcluirRegistro(DMSisAD2.tblFicha);
    dmSisAD2.QryCommit.ExecSQL;
    edit03.Clear; edit04.Clear; edit05.Clear;
    DisabilitaCampo.Enabled := False;
    Novo.Enabled := True;
    Salvar.Enabled := False;
    Cancelar.Enabled := False;
    Editar.Enabled := False;
    Apagar.Enabled := False;
    Localizar.Enabled := True;
    Sair.Enabled := True;
    //
   dmSisAD2.QryItensFicha.Close;
     dmSisAD2.tblElementoDespesa.close;
  dmSisAD2.tblProjetoAtividade.close;
end;

procedure TfrmCadFicha.edit02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //procedimento para mostrar o nome
  Edit03.SetFocus;
  Edit02.SetFocus;
end;

procedure TfrmCadFicha.edit01Enter(Sender: TObject);
begin
  Edit01.Color := clMoneyGreen;
end;

procedure TfrmCadFicha.edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadFicha.edit09Enter(Sender: TObject);
begin
  Edit09.Color := clMoneyGreen;
end;

procedure TfrmCadFicha.edit07Enter(Sender: TObject);
begin
  Edit07.Color := clMoneyGreen;
end;

procedure TfrmCadFicha.edit08Enter(Sender: TObject);
begin
  Edit08.Color := clMoneyGreen;
end;

procedure TfrmCadFicha.edit01Exit(Sender: TObject);
begin
  Edit01.Color := clWindow;
  lbl01.font.Color := clWindowText;
end;

procedure TfrmCadFicha.edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
end;

procedure TfrmCadFicha.edit07Exit(Sender: TObject);
begin
  Edit07.Color := clWindow;
  lbl07.font.Color := clWindowText;
end;

procedure TfrmCadFicha.edit08Exit(Sender: TObject);
begin
  Edit08.Color := clWindow;
  lbl08.font.Color := clWindowText;
end;

end.
