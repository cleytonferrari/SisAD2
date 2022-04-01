unit URelFichaSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TfrmRelFichaSec = class(TForm)
    Qrep: TQuickRep;
    v: TQRBand;
    QRLabel2: TQRLabel;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText13: TQRDBText;
    QRBand2: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel14: TQRLabel;
    lblVersao: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel33: TQRLabel;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    procedure QrepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFichaSec: TfrmRelFichaSec;

implementation

uses UDataModule, UFerramentas;

{$R *.dfm}

procedure TfrmRelFichaSec.QrepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 lblVersao.Caption := GetVersionInfo;  
end;

end.
