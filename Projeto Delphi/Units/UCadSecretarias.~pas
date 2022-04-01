unit UCadSecretarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls;

type
  TfrmCadSecretarias = class(TForm)
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnApagar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    DisabilitaCampo: TPanel;
    ActCadSecretaria: TActionList;
    Salvar: TAction;
    Cancelar: TAction;
    Editar: TAction;
    Sair: TAction;
    Novo: TAction;
    Apagar: TAction;
    Localizar: TAction;
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
    lbl01: TLabel;
    Edit01: TDBEdit;
    DataSource1: TDataSource;
    lbl02: TLabel;
    Edit02: TDBEdit;
    lbl03: TLabel;
    Edit03: TDBEdit;
    lbl04: TLabel;
    Edit04: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure NovoExecute(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure ApagarExecute(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure LocalizarExecute(Sender: TObject);
    procedure Edit02Enter(Sender: TObject);
    procedure Edit03Enter(Sender: TObject);
    procedure Edit04Enter(Sender: TObject);
    procedure Edit02Exit(Sender: TObject);
    procedure Edit03Exit(Sender: TObject);
    procedure Edit04Exit(Sender: TObject);
    procedure Edit04KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSecretarias: TfrmCadSecretarias;
  Fechar:Boolean;

implementation

uses UDataModule, UControlaTabela, UPrincipal, ULocalizar;

{$R *.dfm}

procedure TfrmCadSecretarias.FormCreate(Sender: TObject);
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

procedure TfrmCadSecretarias.NovoExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  NovoRegistro(DMSisAD2.tblSecretarias);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  Edit02.SetFocus;
end;

procedure TfrmCadSecretarias.SalvarExecute(Sender: TObject);
begin
  FocusControl(nil);
  if Edit02.Text = '' then begin
    Edit02.SetFocus;
    lbl02.Font.Color := clred;
    exit;
  end;
  if Edit03.Text = '' then begin
    Edit03.SetFocus;
    lbl03.Font.Color := clred;
    exit;
  end;
  if Edit04.Text = '' then begin
    Edit04.SetFocus;
    lbl04.Font.Color := clred;
    exit;
  end;

  //*************************
  SalvarRegistro(DMSisAD2.tblSecretarias);
  dmSisAD2.QryCommit.ExecSQL;  //Executa o Commit no Banco de Dados;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  DisabilitaCampo.Enabled := False;
end;

procedure TfrmCadSecretarias.EditarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  EditarRegistro(DMSisAD2.tblSecretarias);
end;

procedure TfrmCadSecretarias.CancelarExecute(Sender: TObject);
begin
  FocusControl(nil);
  DisabilitaCampo.Enabled := False;
  CancelarRegistro(DMSisAD2.tblSecretarias);
  dmSisAD2.QryRollback.ExecSQL;  
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
end;

procedure TfrmCadSecretarias.ApagarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  ExcluirRegistro(DMSisAD2.tblSecretarias);
  dmSisAD2.QryCommit.ExecSQL;  
end;

procedure TfrmCadSecretarias.SairExecute(Sender: TObject);
begin
 Fechar:= True;
 close;
end;

procedure TfrmCadSecretarias.LocalizarExecute(Sender: TObject);
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
  //Carrega form na memória
  frmLocalizar := TfrmLocalizar.Create(Application);
  with frmLocalizar do
  begin
    Qry_Localizar.Close;
    Qry_Localizar.SQL.Clear;//Limpa
    CampoTabela:='SELECT * FROM SECRETARIASMUNICIPAIS';
    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='SECRETARIASMUNICIPAIS_ID';
    grid.Columns.Items[0].Title.Caption:= 'Código';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='NOMESECRETARIA';
    grid.Columns.Items[1].Title.Caption:= 'Secretaria';
    Grid.Columns.Add;
    grid.Columns.Items[2].FieldName:='NOMESECRETARIO';
    grid.Columns.Items[2].Title.Caption:= 'Secretário(a)';
    Grid.Columns.Add;
    grid.Columns.Items[3].FieldName:='PORTARIA';
    grid.Columns.Items[3].Title.Caption:= 'NºPortaria';

    //Adciona a opçoes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('CÓDIGO');
    EditOpcao.Items.Add('SECRETARIA');
    EditOpcao.Items.Add('SECRETÁRIO(A)');

    //nome real da pesquisa
    CampoPesquisa[0]:='SECRETARIASMUNICIPAIS_ID';
    CampoPesquisa[1]:='NOMESECRETARIA';
    CampoPesquisa[2]:='NOMESECRETARIO';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
    MascaraPesquisa[2]:='';
  end;
  frmLocalizar.Caption := 'Localizar Secretaria';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;
  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblSecretarias.Open;
    DMSisAD2.tblSecretarias.Locate
        ('SECRETARIASMUNICIPAIS_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
  end
  else
    CancelarExecute(Sender);
  //Aguarda a execução e depois Libera a Memória
  frmLocalizar.Free;
end;

procedure TfrmCadSecretarias.Edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadSecretarias.Edit03Enter(Sender: TObject);
begin
  Edit03.Color := clMoneyGreen;
end;

procedure TfrmCadSecretarias.Edit04Enter(Sender: TObject);
begin
  Edit04.Color := clMoneyGreen;
end;

procedure TfrmCadSecretarias.Edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
end;

procedure TfrmCadSecretarias.Edit03Exit(Sender: TObject);
begin
  Edit03.Color := clWindow;
  lbl03.font.Color := clWindowText;
end;

procedure TfrmCadSecretarias.Edit04Exit(Sender: TObject);
begin
  Edit04.Color := clWindow;
  lbl04.font.Color := clWindowText;
end;

procedure TfrmCadSecretarias.Edit04KeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8,'/'] ) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;
end;

procedure TfrmCadSecretarias.FormShow(Sender: TObject);
begin
  Fechar:=False;
end;

procedure TfrmCadSecretarias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

end.
