program SisAD2exe;

uses
  Forms,
  UProt in 'UProt.pas' {frmProt2003},
  ULogo in 'ULogo.pas' {frmLogo},
  UFerramentas in 'UFerramentas.pas';

{$R *.res}


begin
 Application.Initialize;
 Application.Title := 'ProtSisAD2';
  Application.CreateForm(TfrmProt2003, frmProt2003);
 Application.Run;
end.
