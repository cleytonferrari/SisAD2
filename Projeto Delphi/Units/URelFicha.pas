unit URelFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmRelFicha = class(TForm)
    Qrep: TQuickRep;
    v: TQRBand;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape6: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    lblVersao: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel7: TQRLabel;
    procedure QrepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFicha: TfrmRelFicha;

implementation

uses UDataModule, UFerramentas;

{$R *.dfm}

procedure TfrmRelFicha.QrepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  lblVersao.Caption := GetVersionInfo; 
end;

end.
