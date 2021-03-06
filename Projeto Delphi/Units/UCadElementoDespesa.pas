unit UCadElementoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Menus, ActnList, Buttons, ExtCtrls;

type
  TfrmCadElementoDespesa = class(TForm)
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
    procedure Edit01Enter(Sender: TObject);
    procedure Edit02Enter(Sender: TObject);
    procedure Edit02Exit(Sender: TObject);
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
  frmCadElementoDespesa: TfrmCadElementoDespesa;
  Fechar:Boolean;
  Pesq:Boolean;

implementation

uses UDataModule, UPrincipal, UControlaTabela, ULocalizar;

{$R *.dfm}

procedure TfrmCadElementoDespesa.Edit01Enter(Sender: TObject);
begin
  Edit01.Color := clMoneyGreen;
end;

procedure TfrmCadElementoDespesa.Edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadElementoDespesa.Edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
end;

procedure TfrmCadElementoDespesa.Edit01Exit(Sender: TObject);
begin
  Edit01.Color := clWindow;
  lbl01.font.Color := clWindowText;
if pesq = true then begin
 if (DMSisAD2.tblElementoDespesa.State = dsEdit) or
    (DMSisAD2.tblElementoDespesa.State = dsInsert) then begin
  dmSisAD2.QryUsa.Close;
  dmSisAD2.QryUsa.sql.Clear;
  dmSisAD2.QryUsa.SQL.Add('SELECT ELEMENTODESPESA_ID FROM ELEMENTODESPESA WHERE ELEMENTODESPESA_ID = :PDEC');
  dmSisAD2.QryUsa.ParamByName('pdec').AsString := Edit01.Text;
  dmSisAD2.QryUsa.open;
  if dmSisAD2.QryUsa.recordcount >=1 then
  begin
     Application.MessageBox(
     'Elemento de Despesa J? Existe!!!',
     'Aviso',MB_OK+MB_ICONINFORMATION);
     dmSisAD2.tblElementoDespesaELEMENTODESPESA_ID.AsString := ''; 
  end;
 end;
end;
end;


procedure TfrmCadElementoDespesa.FormCreate(Sender: TObject);
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

procedure TfrmCadElementoDespesa.NovoExecute(Sender: TObject);
begin
//
 pesq := true;
//

  DisabilitaCampo.Enabled := True;
  NovoRegistro(DMSisAD2.tblElementoDespesa);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  Edit01.SetFocus;
end;

procedure TfrmCadElementoDespesa.SalvarExecute(Sender: TObject);
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
  SalvarRegistro(DMSisAD2.tblElementoDespesa);
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

procedure TfrmCadElementoDespesa.CancelarExecute(Sender: TObject);
begin
  FocusControl(nil);
  DisabilitaCampo.Enabled := False;
  CancelarRegistro(DMSisAD2.tblElementoDespesa);
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

procedure TfrmCadElementoDespesa.EditarExecute(Sender: TObject);
begin
//
 pesq := false;
//

  DisabilitaCampo.Enabled := True;
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  EditarRegistro(DMSisAD2.tblElementoDespesa);
  edit01.Enabled := False;
  edit01.Color := clBtnFace;
end;

procedure TfrmCadElementoDespesa.ApagarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  ExcluirRegistro(DMSisAD2.tblElementoDespesa);
  dmSisAD2.QryCommit.ExecSQL;
end;

procedure TfrmCadElementoDespesa.LocalizarExecute(Sender: TObject);
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
    CampoTabela:='SELECT * FROM ELEMENTODESPESA';
    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='ELEMENTODESPESA_ID';
    grid.Columns.Items[0].Title.Caption:= 'Elemento Despesa';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='DESCRICAO';
    grid.Columns.Items[1].Title.Caption:= 'Descri??o';

    //Adciona a op?oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('EL.DESPESA');
    EditOpcao.Items.Add('DESCRI??O');

    //nome real da pesquisa
    CampoPesquisa[0]:='ELEMENTODESPESA_ID';
    CampoPesquisa[1]:='DESCRICAO';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
  end;
  frmLocalizar.Caption := 'Localizar Elemento de Despesa';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;
  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblElementoDespesa.Open;
    DMSisAD2.tblElementoDespesa.Locate
        ('ELEMENTODESPESA_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
  end
  else
    CancelarExecute(Sender);
  //Aguarda a execu??o e depois Libera a Mem?ria
  frmLocalizar.Free;
end;

procedure TfrmCadElementoDespesa.SairExecute(Sender: TObject);
begin
 Fechar:= True;
 close;
end;

procedure TfrmCadElementoDespesa.FormShow(Sender: TObject);
begin
  Fechar:=False;
  pesq := False;
end;

procedure TfrmCadElementoDespesa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

end.
