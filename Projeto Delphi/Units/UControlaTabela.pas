unit UControlaTabela;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IBDatabase,ExtCtrls, Buttons, IBTable,Db, Mask, DBCtrls, IBQuery;

  Procedure NovoRegistro (TabelaDM:TDataSet);
  function AutoInc(DataBaseEnd:TIBDataBase;
      NomeTabela, NomeCampo: String): Integer;
  Procedure SalvarRegistro(TabelaDM:TDataSet);
  Procedure CancelarRegistro(TabelaDM:TDataSet);
  Procedure EditarRegistro(TabelaDM:TDataSet);
  Procedure ExcluirRegistro(TabelaDM:TDataSet);
implementation

uses UPrincipal, UDataModule;

Procedure NovoRegistro (TabelaDM:TDataSet);
Begin
Try
  TabelaDM.Open;
  TabelaDM.Append;
except
  Application.MessageBox(
  'Erro ao tentar criar um Novo Registro!!!'+#13#13+
  'Voc? deve reiniciar o Sistema e tentar novamente.',
  'Aviso'  ,MB_OK+mb_iconerror );
  application.terminate;
end;
end;

function AutoInc(DataBaseEnd:TIBDataBase;
      NomeTabela, NomeCampo: String): Integer;
var
  int : integer;
  vQry : TIBQuery;
begin
Try
 vQry := TIBQuery.Create(Application);
  with vQry do begin
    Database := DataBaseEnd;
    SQL.Clear;
    SQL.Add('Select Max(' + NomeCampo +') as Proximo');
    SQL.Add('From '+ NomeTabela);
    Open;
    int:= FieldByName('Proximo').asInteger + 1;
    Result := int;
    free;
  end; {with vQry}
except
  Application.MessageBox(
  'Erro ao tentar criar a Auto-Numera??o para o registro!!!'+#13#13+
  'Voc? deve reiniciar o Sistema e tentar novamente.',
  'Aviso',MB_OK+mb_iconerror );
  application.terminate;
end;
end;

Procedure SalvarRegistro(TabelaDM:TDataSet);
begin
try
  TabelaDM.Post;
  TabelaDM.Close;
  Application.MessageBox(
  'Registro Salvo com Sucesso!!!',
  'Aviso',MB_OK+MB_ICONINFORMATION);
except
  Application.MessageBox(
  'Erro ao tentar Salvar o Registro Atual!!!'+#13#13+
  'Voc? deve reiniciar o Sistema e tentar novamente.',
  'Aviso',MB_OK+mb_iconerror );
  application.terminate;
end;
end;

Procedure CancelarRegistro(TabelaDM:TDataSet);
begin
try
  TabelaDM.Cancel;
  TabelaDM.Close;
except
  Application.MessageBox(
  'Erro ao tentar Cancelar o Registro Atual!!!'+#13#13+
  'Voc? deve reiniciar o Sistema e tentar novamente.',
  'Aviso',MB_OK+mb_iconerror );
  application.terminate;
end;
end;

Procedure EditarRegistro(TabelaDM:TDataSet);
begin
try
  TabelaDM.Edit;
except
  Application.MessageBox(
  'Erro ao tentar colocar o Registro em modo de Edi??o!!!'+#13#13+
  'Voc? deve reiniciar o Sistema e tentar novamente.',
  'Aviso',MB_OK+mb_iconerror );
  application.terminate;
end;
end;

Procedure ExcluirRegistro(TabelaDM:TDataSet);
begin
try
  if Application.MessageBox
  ('Confirma Exclus?o?','Excluir?',Mb_YesNo+mb_IconQuestion) = mrYes then
begin
  TabelaDM.Delete;
  TabelaDM.Close;
end
else
  TabelaDM.Close;
except
  Application.MessageBox(
  'Erro ao tentar Excluir o Registro Atual!!!'+#13#13+
  'Voc? deve reiniciar o Sistema e tentar novamente.',
  'Aviso',MB_OK+mb_iconerror );
  application.terminate;
end;
end;

end.

