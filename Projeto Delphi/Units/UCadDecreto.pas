unit UCadDecreto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ActnList, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids,
  DBGrids, Buttons;

type
  TfrmCadDecreto = class(TForm)
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSair: TSpeedButton;
    btnNovo: TSpeedButton;
    btnApagar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    DisabilitaCampo: TPanel;
    lbl02: TLabel;
    lbl03: TLabel;
    Panel2: TPanel;
    Bevel2: TBevel;
    lblSaldo2: TDBText;
    Label4: TLabel;
    dbCredito: TDBRadioGroup;
    DBGridCredito: TDBGrid;
    Panel3: TPanel;
    dbRecurso: TDBRadioGroup;
    NBpaginas: TNotebook;
    Bevel1: TBevel;
    Label8: TLabel;
    DBText1: TDBText;
    DBGrid1: TDBGrid;
    DBEdit4: TDBEdit;
    Bevel4: TBevel;
    Label6: TLabel;
    LblSaldo1: TDBText;
    DBgridRecurso: TDBGrid;
    Edit02: TDBEdit;
    Edit03: TDBEdit;
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
    DSDecreto: TDataSource;
    DSRecurso: TDataSource;
    DSCredito: TDataSource;
    procedure SairExecute(Sender: TObject);
    procedure NovoExecute(Sender: TObject);
    procedure dbRecursoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit02KeyPress(Sender: TObject; var Key: Char);
    procedure SalvarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBgridRecursoEnter(Sender: TObject);
    procedure DBGridCreditoEnter(Sender: TObject);
    procedure ApagarExecute(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure LocalizarExecute(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure Edit02Exit(Sender: TObject);
    procedure Edit02Enter(Sender: TObject);
    procedure Edit03Enter(Sender: TObject);
    procedure Edit03Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDecreto: TfrmCadDecreto;
  Pesq:Boolean;
  Fechar:Boolean;

implementation

uses UDataModule, UControlaTabela, ULocalizar, UPrincipal;

{$R *.dfm}

procedure TfrmCadDecreto.SairExecute(Sender: TObject);
begin
 Fechar:= True;
 close;
end;

procedure TfrmCadDecreto.NovoExecute(Sender: TObject);
begin
//
 pesq := true;
//
  DisabilitaCampo.Enabled := True;
  NovoRegistro(DMSisAD2.tblDecreto);
  Novo.Enabled := False;
  Salvar.Enabled := True;
  Cancelar.Enabled := True;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := False;
  Sair.Enabled := False;

  DMSisAD2.tblItensDECrecurso.Open;
  DMSisAD2.tblItensDECcredito.Open;
  dbRecurso.ItemIndex := 0;
  dbCredito.ItemIndex := 0;
  DisabilitaCampo.Enabled := True;
  Edit02.SetFocus;
end;

procedure TfrmCadDecreto.dbRecursoChange(Sender: TObject);
begin
  if dbRecurso.ItemIndex = 0 then begin
    NBpaginas.ActivePage :=  'AN';
    if (DMSisAD2.tblItensDECrecurso.State <> dsEdit) and
    (DMSisAD2.tblItensDECrecurso.State <> dsInsert)  then begin
      if dmSisAD2.tblItensDecRecurso.Active = false then
       dmSisAD2.tblItensDecRecurso.Open;

       DMSisAD2.tblItensDECrecurso.Cancel;
    end;
  end;
  if dbRecurso.ItemIndex = 1 then begin
    NBpaginas.ActivePage :=  'EX';
    if (DMSisAD2.tblItensDECrecurso.State <> dsEdit) and
    (DMSisAD2.tblItensDECrecurso.State <> dsInsert)  then begin
      if dmSisAD2.tblItensDecRecurso.Active = false then
       dmSisAD2.tblItensDecRecurso.Open;

       DMSisAD2.tblItensDECrecurso.Edit;
    end;
  end;
end;

procedure TfrmCadDecreto.FormShow(Sender: TObject);
begin
  Fechar:=False;
  pesq := False;
  NBpaginas.ActivePage :=  'AN';
  DisabilitaCampo.Enabled := False;
end;

procedure TfrmCadDecreto.Edit02KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,'/'] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TfrmCadDecreto.SalvarExecute(Sender: TObject);
Var
  NfichaCRE, NfichaREC :Array[1..100] of integer;
  I,J,nCre,nRec:Integer;
begin
 for I:=1 to 100 do begin
   NfichaCRE[i]:= 0;
   NfichaREC[i]:= 0;
 end;

 FocusControl(nil);
 if edit02.Text = '' then begin
   edit02.SetFocus;
   lbl02.Font.Color := clred;
   exit;
 end;
 if edit03.Text = '' then begin
   edit03.SetFocus;
   lbl03.Font.Color := clred;
   exit;
 end;
 if (DMSisAD2.tblItensDECrecurso.State = dsEdit) or
    (DMSisAD2.tblItensDECrecurso.State = dsInsert) then
 DMSisAD2.tblItensDECrecurso.Post;

 //verifica se os dados do tblrecurso foram preenchido corretamente
   DMSisAD2.QryUsa.Close; DMSisAD2.QryUsa.SQL.Clear;
   DMSisAD2.QryUsa.SQL.Add('SELECT * FROM ITENS_DEC_RECURSO WHERE DECRETO_ID = :PDEC');
   DMSisAD2.QryUsa.ParamByName('PDEC').AsString :=
          DMSisAD2.tblDecretoDECRETO_ID.AsString;
   DMSisAD2.QryUsa.Open;
   if DMSisAD2.QryUsa.RecordCount <= 0 then begin
     Application.MessageBox(
      'Insira pelo menos Um Item no Recurso!!!',
      'Aviso',MB_OK+MB_ICONINFORMATION);
     exit;
   end;

 if (DMSisAD2.tblItensDECcredito.State = dsEdit) or
    (DMSisAD2.tblItensDECcredito.State = dsInsert) then
   DMSisAD2.tblItensDECcredito.Post;

 //verifica se os dados do tblcredito foram preenchido corretamente
   DMSisAD2.QryUsa.Close; DMSisAD2.QryUsa.SQL.Clear;
   DMSisAD2.QryUsa.SQL.Add('SELECT * FROM ITENS_DEC_CREDITO WHERE DECRETO_ID = :PDEC');
   DMSisAD2.QryUsa.ParamByName('PDEC').AsString :=
          DMSisAD2.tblDecretoDECRETO_ID.AsString;
   DMSisAD2.QryUsa.Open;
   if DMSisAD2.QryUsa.RecordCount <= 0 then begin
     Application.MessageBox(
      'Insira pelo menos Um Item no Cr?dito!!!',
      'Aviso',MB_OK+MB_ICONINFORMATION);
     exit;
   end;

  if LblSaldo1.Caption <> lblSaldo2.Caption then begin
       Application.MessageBox(
      'O Saldo do Recurso n?o confere com o Saldo do Cr?dito!!!',
      'Aviso',MB_OK+MB_ICONINFORMATION);
     exit;
  end;

  if (DMSisAD2.tblItensDecCredito.State = dsEdit) or
     (DMSisAD2.tblItensDecCredito.State = dsInsert) then
      DMSisAD2.tblItensDECCredito.Post;

  if (DMSisAD2.tblItensDecRecurso.State = dsEdit) or
     (DMSisAD2.tblItensDecRecurso.State = dsInsert) then
      DMSisAD2.tblItensDECRecurso.Post;

  dmSisAD2.tblItensDecCredito.First;
  nCre:=dmSisAD2.tblItensDecCredito.RecordCount;
  i:=1;
  while not dmSisAD2.tblItensDecCredito.Eof do begin
     NfichaCRE[i] := dmSisAD2.tblItensDecCreditoFICHA.AsInteger;
     inc(i);
     dmSisAD2.tblItensDecCredito.Next;
  end;

  dmSisAD2.tblItensDecRecurso.First;
  nRec:=dmSisAD2.tblItensDecRecurso.RecordCount;
  j:=1;
  while not dmSisAD2.tblItensDecRecurso.Eof do begin
     NfichaREC[j] := dmSisAD2.tblItensDecRecursoFICHA.AsInteger;
     inc(j);
     dmSisAD2.tblItensDecRecurso.Next;
  end;

  if (DMSisAD2.tblDecreto.State = dsEdit) or
     (DMSisAD2.tblDecreto.State = dsInsert) then
     SalvarRegistro(DMSisAD2.tblDecreto) else  begin
    dmSisAD2.tblDecreto.Close;
    Application.MessageBox(
      'Registro Salvo com Sucesso!!!',
      'Aviso',MB_OK+MB_ICONINFORMATION);
    end;


  dmSisAD2.QryCommit.ExecSQL;

for i:=1 to nCre do begin
  with dmSisAD2.QryAtuFicha do begin
    Close;
    if nFichaCre[i]>=1 then begin
     ParamByName('PFicha').AsInteger := nfichaCRE[i];
     Open;
     Close;
    end;
  end;
 dmSisAD2.QryCommit.ExecSQL;
end;
for j:=1 to nRec do begin
  with dmSisAD2.QryAtuFicha do begin
    Close;
    if nFichaRec[j]>=1 then begin
     ParamByName('PFicha').AsInteger := nfichaRec[j];
     Open;
     Close;
    end;
  end;
 dmSisAD2.QryCommit.ExecSQL;
end;

  dmSisAD2.tblItensDecCredito.Close;
  dmSisAD2.tblItensDecRecurso.Close;

  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  DisabilitaCampo.Enabled := False;

  edit02.Enabled := True;
  edit02.Color := clWindow;
end;

procedure TfrmCadDecreto.CancelarExecute(Sender: TObject);
begin
  DisabilitaCampo.Enabled := False;
  CancelarRegistro(DMSisAD2.tblDecreto);
  CancelarRegistro(DMSisAD2.tblItensDECrecurso);
  CancelarRegistro(DMSisAD2.tblItensDECcredito);

  DMSisAD2.tblItensDECrecurso.Close;
  DMSisAD2.tblItensDECcredito.Close;
  DMSisAD2.tblDecreto.Close;

  dmSisAD2.QryRollback.ExecSQL;  //Executa o RollBack no BD

  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
  edit02.Enabled := True;
  edit02.Color := clWindow;
end;

procedure TfrmCadDecreto.FormCreate(Sender: TObject);
begin
  Novo.Enabled := True;
  Salvar.Enabled := False;
  Cancelar.Enabled := False;
  Editar.Enabled := False;
  Apagar.Enabled := False;
  Localizar.Enabled := True;
  Sair.Enabled := True;
end;

procedure TfrmCadDecreto.DBgridRecursoEnter(Sender: TObject);
begin
  if (DMSisAD2.tblDecreto.State = dsEdit) or
     (DMSisAD2.tblDecreto.State = dsInsert) then begin
    DMSisAD2.tbldecreto.Post;//arruma relacionamento
  end;
end;

procedure TfrmCadDecreto.DBGridCreditoEnter(Sender: TObject);
begin
  if (DMSisAD2.tblDecreto.State = dsEdit) or
     (DMSisAD2.tblDecreto.State = dsInsert) then begin
    DMSisAD2.tbldecreto.Post;//arruma relacionamento
  end;
end;

procedure TfrmCadDecreto.ApagarExecute(Sender: TObject);
Var
  NfichaCRE, NfichaREC :Array[1..100] of integer;
  I,J,nCre,nRec:Integer;
begin
 for I:=1 to 100 do begin
   NfichaCRE[i]:= 0;
   NfichaREC[i]:= 0;
 end;

  dmSisAD2.tblItensDecCredito.First;
  nCre:=dmSisAD2.tblItensDecCredito.RecordCount;
  i:=1;
  while not dmSisAD2.tblItensDecCredito.Eof do begin
     NfichaCRE[i] := dmSisAD2.tblItensDecCreditoFICHA.AsInteger;
     inc(i);
     dmSisAD2.tblItensDecCredito.Next;
  end;

  dmSisAD2.tblItensDecRecurso.First;
  nRec:=dmSisAD2.tblItensDecRecurso.RecordCount;
  j:=1;
  while not dmSisAD2.tblItensDecRecurso.Eof do begin
     NfichaREC[j] := dmSisAD2.tblItensDecRecursoFICHA.AsInteger;
     inc(j);
     dmSisAD2.tblItensDecRecurso.Next;
  end;

  dmSisAD2.tblItensDecCredito.Close;
  dmSisAD2.tblItensDecRecurso.Close;
  ExcluirRegistro(dmSisAD2.tblDecreto);
  dmSisAD2.QryCommit.ExecSQL;

    for i:=1 to nCre do begin
      with dmSisAD2.QryAtuFicha do begin
        Close;
        if nFichaCre[i]>=1 then begin
         ParamByName('PFicha').AsInteger := nfichaCRE[i];
         Open;
         Close;
        end;
      end;
     dmSisAD2.QryCommit.ExecSQL;
    end;
    for j:=1 to nRec do begin
      with dmSisAD2.QryAtuFicha do begin
        Close;
        if nFichaRec[j]>=1 then begin
         ParamByName('PFicha').AsInteger := nfichaRec[j];
         Open;
         Close;
        end;
      end;
     dmSisAD2.QryCommit.ExecSQL;
    end;

    DisabilitaCampo.Enabled := False;
    Novo.Enabled := True;
    Salvar.Enabled := False;
    Cancelar.Enabled := False;
    Editar.Enabled := False;
    Apagar.Enabled := False;
    Localizar.Enabled := True;
    Sair.Enabled := True;
    DBEdit4.Clear;
    NBpaginas.ActivePage := 'AN';
end;

procedure TfrmCadDecreto.EditarExecute(Sender: TObject);
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
  EditarRegistro(DMSisAD2.tblDecreto);

  edit02.Enabled := False;
  edit02.Color := clBtnFace;
end;

procedure TfrmCadDecreto.LocalizarExecute(Sender: TObject);
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

    //Adciona a op?oes de pesquisa
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
  frmLocalizar.Caption := 'Localizar Decreto';
  try
   frmLocalizar.ShowModal;

  finally
   frmLocalizar.Release;
   frmLocalizar := nil;
  end;
  if ResultadoPesquisa2 <> '0' then
  begin
    DMSisAD2.tblDecreto.Open;
    DMSisAD2.tblDecreto.Locate
        ('DECRETO_ID',ResultadoPesquisa2,[]);
    ResultadoPesquisa2:='0';
    //
    DMSisAD2.tblDecreto.open;
    DMSisAD2.tblItensDecCredito.Open;
    DMSisAD2.tblItensDecRecurso.Open;
    //
  end
  else
    CancelarExecute(Sender);

  frmLocalizar.Free;
end;

procedure TfrmCadDecreto.DBEdit4Enter(Sender: TObject);
begin
  if (DMSisAD2.tblDecreto.State = dsEdit) or
     (DMSisAD2.tblDecreto.State = dsInsert) then begin
    DMSisAD2.tbldecreto.Post;//arruma relacionamento
    NovoRegistro(dmSisAD2.tblItensDecRecurso);  
  end;
end;

procedure TfrmCadDecreto.Edit02Exit(Sender: TObject);
begin
  Edit02.Color := clWindow;
  lbl02.font.Color := clWindowText;
//deve ocorrer quando a tabela estiver em edi??o
if pesq = true then begin
 if (DMSisAD2.tblDecreto.State = dsEdit) or
    (DMSisAD2.tblDecreto.State = dsInsert) then begin
    dmSisAD2.QryUsa.Close;
    dmSisAD2.QryUsa.sql.Clear;
    dmSisAD2.QryUsa.SQL.Add('SELECT DECRETO_ID FROM DECRETO WHERE DECRETO_ID = :PDEC');
    dmSisAD2.QryUsa.ParamByName('pdec').AsString := Edit02.Text;
    dmSisAD2.QryUsa.open;
    if dmSisAD2.QryUsa.recordcount >=1 then
    begin
       Application.MessageBox(
       'O Numero do Decreto J? Existe!!!',
       'Aviso',MB_OK+MB_ICONINFORMATION);
       dmSisAD2.tblDecretoDECRETO_ID.AsString := '';  
    end;
 end;
end;
end;

procedure TfrmCadDecreto.Edit02Enter(Sender: TObject);
begin
  Edit02.Color := clMoneyGreen;
end;

procedure TfrmCadDecreto.Edit03Enter(Sender: TObject);
begin
  Edit03.Color := clMoneyGreen;
end;

procedure TfrmCadDecreto.Edit03Exit(Sender: TObject);
begin
  Edit03.Color := clWindow;
  lbl03.font.Color := clWindowText;
end;

procedure TfrmCadDecreto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=Fechar;
end;

end.
