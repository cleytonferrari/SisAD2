unit UCadExecutivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls;

type
  TfrmCadExecutivo = class(TForm)
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnApagar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    DisabilitaCampo: TPanel;
    ActCadExecutivo: TActionList;
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
    lbl05: TLabel;
    Edit05: TDBEdit;
    lbl06: TLabel;
    edit06: TDBComboBox;
    procedure NovoExecute(Sender: TObject);
    procedure SalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure ApagarExecute(Sender: TObject);
    procedure LocalizarExecute(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure Edit02Enter(Sender: TObject);
    procedure Edit03Enter(Sender: TObject);
    procedure Edit04Enter(Sender: TObject);
    procedure Edit05Enter(Sender: TObject);
    procedure edit06Enter(Sender: TObject);
    procedure Edit02Exit(Sender: TObject);
    procedure Edit03Exit(Sender: TObject);
    procedure Edit04Exit(Sender: TObject);
    procedure Edit05Exit(Sender: TObject);
    procedure edit06Exit(Sender: TObject);
    procedure Edit03KeyPress(Sender: TObject; var Key: Char);
    procedure Edit04KeyPress(Sender: TObject; var Key: Char);
    procedure edit06KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadExecutivo: TfrmCadExecutivo;
  Fechar:Boolean;
  
implementation

uses UDataModule, UCadUsuario, UControlaTabela, UPrincipal, ULocalizar;

{$R *.dfm}

procedure TfrmCadExecutivo.NovoExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  NovoRegistro(DMSisAD2.tblExecutivo);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  Edit02.SetFocus;
end;

procedure TfrmCadExecutivo.SalvarExecute(Sender: TObject);
begin
  FocusControl(nil);
  if Edit02.Text = '' then begin
    Edit02.SetFocus;
    lbl02.Font.Color := clred;
    exit;
  end;
{  if VerificaData(Edit03.Text) = false then begin
    Edit03.SetFocus;
    lbl03.Font.Color := clred;
    exit;
  end;
  if VerificaData(Edit04.Text) = false then begin
    Edit04.SetFocus;
    lbl04.Font.Color := clred;
    exit;
  end; }
  if Edit05.Text = '' then begin
    Edit05.SetFocus;
    lbl05.Font.Color := clred;
    exit;
  end;
  if Edit06.Text = '' then begin
    Edit06.SetFocus;
    lbl06.Font.Color := clred;
    exit;
  end;

  //*************************
  SalvarRegistro(DMSisAD2.tblExecutivo);
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

procedure TfrmCadExecutivo.FormCreate(Sender: TObject);
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

procedure TfrmCadExecutivo.CancelarExecute(Sender: TObject);
begin
  FocusControl(nil);
  DisabilitaCampo.Enabled := False;
  CancelarRegistro(DMSisAD2.tblExecutivo);
  dmSisAD2.QryRollback.ExecSQL;  
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
end;

procedure TfrmCadExecutivo.EditarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := True;
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;
  EditarRegistro(DMSisAD2.tblExecutivo);
end;

procedure TfrmCadExecutivo.ApagarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  ExcluirRegistro(DMSisAD2.tblExecutivo);
  dmSisAD2.QryCommit.ExecSQL;  
end;

procedure TfrmCadExecutivo.LocalizarExecute(Sender: TObject);
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
    CampoTabela:='SELECT * FROM EXECUTIVOMUNICIPAL';
    Grid.Columns.Clear;//Limpa
    Grid.Columns.Add;//Adciona um coluna na grid
    grid.Columns.Items[0].FieldName:='EXECUTIVOMUNICIPAL_ID';
    grid.Columns.Items[0].Title.Caption:= 'C?digo';
    Grid.Columns.Add;
    grid.Columns.Items[1].FieldName:='NomePrefeito';
    grid.Columns.Items[1].Title.Caption:= 'Nome';

    //Adciona a op?oes de pesquisa
    EditOpcao.Items.Clear;
    EditOpcao.Items.Add('C?DIGO');
    EditOpcao.Items.Add('NOME');

    //nome real da pesquisa
    CampoPesquisa[0]:='EXECUTIVOMUNICIPAL_ID';
    CampoPesquisa[1]:='NOMEPREFEITO';

    //Mascara para a pesquisa
    MascaraPesquisa[0]:='';
    MascaraPesquisa[1]:='';
  end;
  frmLocalizar.Caption := 'Localizar Executivo Municipal';
  //Mostra form em modo exclusivo
  try
   frmLocalizar.ShowModal;
  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblExecutivo.Open;
    DMSisAD2.tblExecutivo.Locate
        ('EXECUTIVOMUNICIPAL_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
  end
  else
    CancelarExecute(Sender);
  //Aguarda a execu??o e depois Libera a Mem?ria
  frmLocalizar.Free;
end;

procedure TfrmCadExecutivo.SairExecute(Sender: TObject);
begin
 Fechar:= True;
 close;
end;

procedure TfrmCadExecutivo.Edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadExecutivo.Edit03Enter(Sender: TObject);
begin
  Edit03.Color := clMoneyGreen;
end;

procedure TfrmCadExecutivo.Edit04Enter(Sender: TObject);
begin
  Edit04.Color := clMoneyGreen;
end;

procedure TfrmCadExecutivo.Edit05Enter(Sender: TObject);
begin
  Edit05.Color := clMoneyGreen;
end;

procedure TfrmCadExecutivo.edit06Enter(Sender: TObject);
begin
  Edit06.Color := clMoneyGreen;
end;

procedure TfrmCadExecutivo.Edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
end;

procedure TfrmCadExecutivo.Edit03Exit(Sender: TObject);
begin
  Edit03.Color := clWindow;
  lbl03.font.Color := clWindowText;
end;

procedure TfrmCadExecutivo.Edit04Exit(Sender: TObject);
begin
  Edit04.Color := clWindow;
  lbl04.font.Color := clWindowText;
end;

procedure TfrmCadExecutivo.Edit05Exit(Sender: TObject);
begin
  Edit05.Color := clWindow;
  lbl05.font.Color := clWindowText;
end;

procedure TfrmCadExecutivo.edit06Exit(Sender: TObject);
begin
  Edit06.Color := clWindow;
  lbl06.font.Color := clWindowText;
end;

procedure TfrmCadExecutivo.Edit03KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,'/'] ) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;
end;

procedure TfrmCadExecutivo.Edit04KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,'/'] ) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;
end;

procedure TfrmCadExecutivo.edit06KeyPress(Sender: TObject; var Key: Char);
begin
  If ( key in['0'..'9'] ) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;
end;

procedure TfrmCadExecutivo.FormShow(Sender: TObject);
begin
  Fechar:=False;
end;

procedure TfrmCadExecutivo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

end.
