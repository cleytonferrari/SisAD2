unit ULoggin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxfShapedForm, ExtCtrls, Mask, StdCtrls;

type
  TfrmLoggin = class(TForm)
    fig5: TImage;
    fig2: TImage;
    fig6: TImage;
    fig3: TImage;
    fig4: TImage;
    fig11: TImage;
    fig8: TImage;
    fig12: TImage;
    fig10: TImage;
    fig9: TImage;
    fig7: TImage;
    fig13: TImage;
    fig14: TImage;
    btnCancelarP: TImage;
    btnCancelar: TImage;
    btnConfirmaP: TImage;
    btnConfirma: TImage;
    fig1: TImage;
    fig15: TImage;
    EditUsuario: TEdit;
    EditSenha: TMaskEdit;
    Relogio1: TTimer;
    Trans: TdxfShapedForm;
    procedure FormCreate(Sender: TObject);
    procedure Relogio1Timer(Sender: TObject);
    procedure btnConfirmaPMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnConfirmaPMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCancelarPMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCancelarPMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnConfirmaPClick(Sender: TObject);
    procedure btnCancelarPClick(Sender: TObject);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure fig15DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure fig14DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoggin: TfrmLoggin;
  Cont:Integer;
  Entra:Boolean;
  Usuario:STring;
  Fechar:Boolean;

implementation

uses USplash, UDataModule;

{$R *.dfm}

procedure TfrmLoggin.FormCreate(Sender: TObject);
begin
  brush.Style := bsClear;
  Relogio1.Interval := 200;
  cont:=1;
  Fechar:= False;//Desabilita o alt + F4
end;

procedure TfrmLoggin.Relogio1Timer(Sender: TObject);
begin
  case cont of
  1: begin
      fig1.Visible := true;
      fig15.Visible := True;
     end;
  2: begin
      fig2.Visible := True;
      fig14.Visible := True;
     end;
  3: begin
      fig3.Visible := true;
      fig13.Visible := true;
     end;
  4: begin
      fig4.Visible := True;
      fig12.Visible := True;
     end;
  5: begin
      fig5.Visible := true;
      fig11.Visible := true;
     end;
  6: begin
      fig6.Visible := True;
      fig10.Visible := True;
     end;
  7: begin
      fig7.Visible := true;
      fig9.Visible := true;
     end;
  8: fig8.Visible := True;
  9: begin
       Trans.Active := true;
       trans.Visible := True;
       fig15.BringToFront;
       fig1.BringToFront;
       EditUsuario.Visible := true;
       EditSenha.Visible := true;
       btnConfirmaP.Visible := true;
       btnCancelarP.Visible := true;
       EditUsuario.SetFocus;
       relogio1.Interval := 0;
     end;
  end;
  inc(cont);

end;

procedure TfrmLoggin.btnConfirmaPMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnConfirmaP.Visible := False;
  btnConfirma.Visible := True;
end;

procedure TfrmLoggin.btnConfirmaPMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  btnConfirmaP.Visible := True;
  btnConfirma.Visible := False;
end;

procedure TfrmLoggin.btnCancelarPMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnCancelarP.Visible := False;
  btnCancelar.Visible := True;
end;

procedure TfrmLoggin.btnCancelarPMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  btnCancelarP.Visible := True;
  btnCancelar.Visible := False;
end;

procedure TfrmLoggin.btnConfirmaPClick(Sender: TObject);
begin
dmSisAD2.tblUsuario.Open;
if  dmSisAD2.tblUsuario.Locate
     ('NOME',EditUsuario.Text,[]) then
   begin
     if dmSisAD2.tblUsuarioSENHA.AsString =
        EditSenha.Text then
         begin
            Fechar:=True;
            FrmLoggin.Close;
            Entra := True;
            Usuario:=EditUsuario.Text;
         end
         else
          begin
            Application.MessageBox
           ('Usuário/Senha Inválidos','SisAD2',Mb_Ok+mb_IconError);
           exit;
          end;
   end
   else
    begin
      Application.MessageBox
           ('Usuário/Senha Inválidos','SisAD2',Mb_Ok+mb_IconError);
      Exit;
    end;
   dmSisAD2.tblUsuario.Close;
end;

procedure TfrmLoggin.btnCancelarPClick(Sender: TObject);
begin
   Fechar:=True;
   Entra := False;
   dmSisAD2.BaseDados.Connected := false;
   dmSisAD2 := nil;
   dmSisAD2.Free;
   Application.Terminate;
end;

procedure TfrmLoggin.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnConfirmaPClick(Sender);
end;

procedure TfrmLoggin.fig15DblClick(Sender: TObject);
begin
 if cont = 100 then begin
   dmSisAD2.tblUsuario.Close;
   Entra := True;
   Fechar:=True;
   FrmLoggin.Close;
   Usuario:='Cleyton Ferrari';
 end;
end;

procedure TfrmLoggin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= Fechar;
end;

procedure TfrmLoggin.FormShow(Sender: TObject);
begin
  frmSplash.Visible := False;
  frmSplash.Release;
  frmSplash:= nil;
end;

procedure TfrmLoggin.fig14DblClick(Sender: TObject);
begin
 cont:=100;
end;

end.
