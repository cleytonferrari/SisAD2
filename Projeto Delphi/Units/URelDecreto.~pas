unit URelDecreto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmRelDecreto = class(TForm)
    Qrep: TQuickRep;
    v: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    lblVersao: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel33: TQRLabel;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QrepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelDecreto: TfrmRelDecreto;

implementation

uses UDataModule, UFerramentas;

{$R *.dfm}

procedure TfrmRelDecreto.QrepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  lblVersao.Caption := GetVersionInfo; 
end;

end.
