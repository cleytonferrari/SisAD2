program Prot2003mostrar;

uses
  Forms,
  UMostrar in 'UMostrar.pas' {frmProt2003mostrar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmProt2003mostrar, frmProt2003mostrar);
  Application.Run;
end.
