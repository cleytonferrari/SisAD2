unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ActnList, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfrmCadUsuario = class(TForm)
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnApagar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    DisabilitaCampo: TPanel;
    ActCadUsuario: TActionList;
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
    Edit04: TMaskEdit;
    Edit03: TDBEdit;
    lbl04: TLabel;
    procedure Edit02Enter(Sender: TObject);
    procedure Edit03Enter(Sender: TObject);
    procedure Edit04Enter(Sender: TObject);
    procedure Edit02Exit(Sender: TObject);
    procedure Edit03Exit(Sender: TObject);
    procedure Edit04Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NovoExecute(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure ApagarExecute(Sender: TObject);
    procedure LocalizarExecute(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;
  Fechar:Boolean;
  
implementation

uses UDataModule, UControlaTabela, ULocalizar, UPrincipal;

{$R *.dfm}

procedure TfrmCadUsuario.Edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadUsuario.Edit03Enter(Sender: TObject);
begin
  Edit03.Color := clMoneyGreen;
end;

procedure TfrmCadUsuario.Edit04Enter(Sender: TObject);
begin
  Edit04.Color := clMoneyGreen;
end;

procedure TfrmCadUsuario.Edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
end;

procedure TfrmCadUsuario.Edit03Exit(Sender: TObject);
begin
  Edit03.Color := clWindow;
  lbl03.font.Color := clWindowText;
end;

procedure TfrmCadUsuario.Edit04Exit(Sender: TObject);
begin
  Edit04.Color := clWindow;
  lbl04.font.Color := clWindowText;
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
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

procedure TfrmCadUsuario.NovoExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  NovoRegistro(DMSisAD2.tblUsuario);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  Edit02.SetFocus;
end;

procedure TfrmCadUsuario.SalvarExecute(Sender: TObject);
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
  SalvarRegistro(DMSisAD2.tblUsuario);
  dmSisAD2.QryCommit.ExecSQL;  //Executa o Commit no Banco de Dados;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  DisabilitaCampo.Enabled := False;
  Edit04.Clear;
end;

procedure TfrmCadUsuario.CancelarExecute(Sender: TObject);
begin
  FocusControl(nil);
  DisabilitaCampo.Enabled := False;
  CancelarRegistro(DMSisAD2.tblUsuario);
  dmSisAD2.QryRollback.ExecSQL;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  Edit04.Clear;
end;

procedure TfrmCadUsuario.EditarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  EditarRegistro(DMSisAD2.tblUsuario);
end;

procedure TfrmCadUsuario.ApagarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  ExcluirRegistro(DMSisAD2.tblUsuario);
  dmSisAD2.QryCommit.ExecSQL;
end;

procedure TfrmCadUsuario.LocalizarExecute(Sender: TObject);
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
    CampoTabela:='SELECT * FROM USUARIOS';
    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='USUARIO_ID';
    grid.Columns.Items[0].Title.Caption:= 'C?digo';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='NOME';
    grid.Columns.Items[1].Title.Caption:= 'Usu?rio';

    //Adciona a op?oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('C?DIGO');
    EditOpcao.Items.Add('USU?RIO');

    //nome real da pesquisa
    CampoPesquisa[0]:='USUARIO_ID';
    CampoPesquisa[1]:='NOME';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
  end;
  frmLocalizar.Caption := 'Localizar Usu?rio';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;
  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblUsuario.Open;
    DMSisAD2.tblUsuario.Locate
        ('USUARIO_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
  end
  else
    CancelarExecute(Sender);
  //Aguarda a execu??o e depois Libera a Mem?ria
  frmLocalizar.Free;
end;

procedure TfrmCadUsuario.SairExecute(Sender: TObject);
begin
 Fechar:= True;
 close;
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
  Fechar:=False;
end;

procedure TfrmCadUsuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

end.
