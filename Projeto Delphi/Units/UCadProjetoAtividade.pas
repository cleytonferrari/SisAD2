unit UCadProjetoAtividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls;

type
  TfrmCadProjetoAtividade = class(TForm)
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
    edit02: TDBEdit;
    procedure Edit01Enter(Sender: TObject);
    procedure edit02Enter(Sender: TObject);
    procedure edit02Exit(Sender: TObject);
    procedure Edit01Exit(Sender: TObject);
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
  frmCadProjetoAtividade: TfrmCadProjetoAtividade;
  Fechar : Boolean;
  Pesq : Boolean;
implementation

uses UDataModule, UControlaTabela, ULocalizar, UPrincipal;

{$R *.dfm}

procedure TfrmCadProjetoAtividade.Edit01Enter(Sender: TObject);
begin
  Edit01.Color := clMoneyGreen;
end;

procedure TfrmCadProjetoAtividade.edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadProjetoAtividade.edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
end;

procedure TfrmCadProjetoAtividade.Edit01Exit(Sender: TObject);
begin
  Edit01.Color := clWindow;
  lbl01.font.Color := clWindowText;
//deve ocorrer quando a tabela estiver em edição
if pesq = true then begin
 if (DMSisAD2.tblProjetoAtividade.State = dsEdit) or
    (DMSisAD2.tblProjetoAtividade.State = dsInsert) then begin
  dmSisAD2.QryUsa.Close;
  dmSisAD2.QryUsa.sql.Clear;
  dmSisAD2.QryUsa.SQL.Add('SELECT PROJETOATIVIDADE_ID FROM PROJETOATIVIDADE WHERE PROJETOATIVIDADE_ID = :PDEC');
  dmSisAD2.QryUsa.ParamByName('pdec').AsString := Edit01.Text;
  dmSisAD2.QryUsa.open;
  if dmSisAD2.QryUsa.recordcount >=1 then
  begin
     Application.MessageBox(
     'O Projeto Atividade Já Existe!!!',
     'Aviso',MB_OK+MB_ICONINFORMATION);
     dmSisAD2.tblProjetoAtividadePROJETOATIVIDADE_ID.AsString := ''; 
  end;
 end;
end;
end;

procedure TfrmCadProjetoAtividade.FormCreate(Sender: TObject);
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

procedure TfrmCadProjetoAtividade.NovoExecute(Sender: TObject);
begin
//
 pesq := true;
//

  DisabilitaCampo.Enabled := True;
  NovoRegistro(DMSisAD2.tblProjetoAtividade);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  Edit01.SetFocus;
end;

procedure TfrmCadProjetoAtividade.SalvarExecute(Sender: TObject);
begin
  FocusControl(nil);
  if Edit01.Text = '' then begin
    Edit01.SetFocus;
    lbl01.Font.Color := clred;
    exit;
  end;
  if Edit02.Text = '' then begin
    Edit02.SetFocus;
    lbl02.Font.Color := clred;
    exit;
  end;
  //*************************
  SalvarRegistro(DMSisAD2.tblProjetoAtividade);
  dmSisAD2.QryCommit.ExecSQL;  //Executa o Commit no Banco de Dados;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  DisabilitaCampo.Enabled := False;
  edit01.Enabled := True;
  edit01.Color := clWindow;
end;

procedure TfrmCadProjetoAtividade.CancelarExecute(Sender: TObject);
begin
  FocusControl(nil);
  DisabilitaCampo.Enabled := False;
  CancelarRegistro(DMSisAD2.tblProjetoAtividade);
  dmSisAD2.QryRollback.ExecSQL;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  edit01.Enabled := True;
  edit01.Color := clWindow;  
end;

procedure TfrmCadProjetoAtividade.EditarExecute(Sender: TObject);
begin
//
 pesq:= False;
//

  DisabilitaCampo.Enabled := True;
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  EditarRegistro(DMSisAD2.tblProjetoAtividade);
  edit01.Enabled := False;
  edit01.Color := clBtnFace;
end;

procedure TfrmCadProjetoAtividade.ApagarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  ExcluirRegistro(DMSisAD2.tblProjetoAtividade);
  dmSisAD2.QryCommit.ExecSQL;
end;

procedure TfrmCadProjetoAtividade.LocalizarExecute(Sender: TObject);
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
    CampoTabela:='SELECT * FROM PROJETOATIVIDADE';
    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='PROJETOATIVIDADE_ID';
    grid.Columns.Items[0].Title.Caption:= 'Projeto Atividade';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='DESCRICAO';
    grid.Columns.Items[1].Title.Caption:= 'Descrição';

    //Adciona a opçoes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('PROJ.ATIVIDADE');
    EditOpcao.Items.Add('DESCRIÇÃO');

    //nome real da pesquisa
    CampoPesquisa[0]:='PROJETOATIVIDADE_ID';
    CampoPesquisa[1]:='DESCRICAO';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
  end;
  frmLocalizar.Caption := 'Localizar Projeto Atividade';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;
  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblProjetoAtividade.Open;
    DMSisAD2.tblProjetoAtividade.Locate
        ('PROJETOATIVIDADE_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
  end
  else
    CancelarExecute(Sender);
  //Aguarda a execução e depois Libera a Memória
  frmLocalizar.Free;
end;

procedure TfrmCadProjetoAtividade.SairExecute(Sender: TObject);
begin
 Fechar:= True;
 close;
end;

procedure TfrmCadProjetoAtividade.FormShow(Sender: TObject);
begin
  Fechar:=False;
  Pesq := False;
end;

procedure TfrmCadProjetoAtividade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

end.
