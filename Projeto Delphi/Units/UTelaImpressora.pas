unit UTelaImpressora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmTelaImpressora = class(TForm)
    Panel1: TPanel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    btnTela: TBitBtn;
    btnImprimir: TBitBtn;
    procedure btnTelaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaImpressora: TfrmTelaImpressora;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TfrmTelaImpressora.btnTelaClick(Sender: TObject);
begin
  TelaImpressora := True;
  Close;
end;

procedure TfrmTelaImpressora.btnImprimirClick(Sender: TObject);
begin
  TelaImpressora := False;
  close;
end;

procedure TfrmTelaImpressora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Release;
 frmTelaImpressora := nil;
end;

end.
