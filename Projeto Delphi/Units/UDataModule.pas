unit UDataModule;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmSisAD2 = class(TDataModule)
    BaseDados: TIBDatabase;
    Transacao: TIBTransaction;
    tblUsuario: TIBDataSet;
    tblUsuarioUSUARIO_ID: TIntegerField;
    tblUsuarioNOME: TIBStringField;
    tblUsuarioSENHA: TIBStringField;
    QryCommit: TIBQuery;
    tblExecutivo: TIBDataSet;
    tblExecutivoEXECUTIVOMUNICIPAL_ID: TIntegerField;
    tblExecutivoNOMEPREFEITO: TIBStringField;
    tblExecutivoMANDATOINICIO: TDateField;
    tblExecutivoMANDATOFIM: TDateField;
    tblExecutivoMUNICIPIO: TIBStringField;
    tblExecutivoUF: TIBStringField;
    tblAD: TIBTable;
    tblItensAD: TIBTable;
    tblFicha: TIBTable;
    tblADAD_ID: TIntegerField;
    tblADITENSFICHA_ID: TIntegerField;
    tblADNUMEROAD: TIBStringField;
    tblADSERVICOMATERIAL: TIBStringField;
    tblADEXPOSICAOMOTIVOS: TIBStringField;
    tblADVALORTOTAL: TIBBCDField;
    tblADFONTERECURSO: TIBStringField;
    tblADVALORORCAMENTODISPONIVEL: TIBBCDField;
    tblADVALORSALDOORCAMENTARIO: TIBBCDField;
    tblADFICHA_ID: TIntegerField;
    tblADDATA: TDateField;
    tblADSECRETARIASMUNICIPAIS_ID: TIntegerField;
    tblADNUMEROPROCESSO: TIBStringField;
    tblItensADITENSAD_ID: TIntegerField;
    tblItensADAD_ID: TIntegerField;
    tblItensADNUMEROITEM: TIntegerField;
    tblItensADUND: TIBStringField;
    tblItensADQUANT: TIBBCDField;
    tblItensADESPECIFICACAO: TIBStringField;
    tblItensADVALORUNIT: TIBBCDField;
    tblItensADVALORTOTALITENS: TIBBCDField;
    tblFichaFICHA_ID: TIntegerField;
    tblFichaSECRETARIASMUNICIPAIS_ID: TIntegerField;
    tblFichaNUMEROFICHA: TIBStringField;
    tblFichaPROJETOATIVIDADE: TIBStringField;
    tblFichaELEMENTODESPESA: TIBStringField;
    tblFichaVALORTOTALPROCESSO: TIBBCDField;
    tblFichaVALORTOTALANULACAO: TIBBCDField;
    tblFichaVALORTOTALSUPLEMENTACAO: TIBBCDField;
    tblFichaDOTACAOINICIAL: TIBBCDField;
    QryUsa: TIBQuery;
    tblSecretarias: TIBTable;
    tblSecretariasSECRETARIASMUNICIPAIS_ID: TIntegerField;
    tblSecretariasNOMESECRETARIA: TIBStringField;
    tblSecretariasNOMESECRETARIO: TIBStringField;
    tblSecretariasPORTARIA: TIBStringField;
    QryFuncao: TIBQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    QryRollback: TIBQuery;
    QryAtuFicha: TIBQuery;
    QryItensFicha: TIBQuery;
    QryItensFichaITENSFICHA_ID: TIntegerField;
    QryItensFichaFICHA_ID: TIntegerField;
    QryItensFichaVALORANULACAO: TIBBCDField;
    QryItensFichaVALORSUPLEMENTACAO: TIBBCDField;
    QryItensFichaSALDOATUALDOTACAOINICIAL: TIBBCDField;
    QryItensFichaVALORPROCESSO: TIBBCDField;
    QryItensFichaDATA: TDateField;
    QryItensFichaNUMEROAD: TIBStringField;
    QryItensFichaNUMPROCESSO: TIBStringField;
    QryItensFichaNUMDECRETO: TIBStringField;
    QryItensFichaNUMANULACAO: TIBStringField;
    QryAD: TIBQuery;
    QryADAD_ID: TIntegerField;
    QryADITENSFICHA_ID: TIntegerField;
    QryADNUMEROAD: TIBStringField;
    QryADSERVICOMATERIAL: TIBStringField;
    QryADEXPOSICAOMOTIVOS: TIBStringField;
    QryADVALORTOTAL: TIBBCDField;
    QryADFONTERECURSO: TIBStringField;
    QryADVALORORCAMENTODISPONIVEL: TIBBCDField;
    QryADVALORSALDOORCAMENTARIO: TIBBCDField;
    QryADFICHA_ID: TIntegerField;
    QryADDATA: TDateField;
    QryADSECRETARIASMUNICIPAIS_ID: TIntegerField;
    QryADNUMEROPROCESSO: TIBStringField;
    QryFicha: TIBQuery;
    QryFichaFICHA_ID: TIntegerField;
    QryFichaSECRETARIASMUNICIPAIS_ID: TIntegerField;
    QryFichaNUMEROFICHA: TIBStringField;
    QryFichaPROJETOATIVIDADE: TIBStringField;
    QryFichaELEMENTODESPESA: TIBStringField;
    QryFichaVALORTOTALPROCESSO: TIBBCDField;
    QryFichaVALORTOTALANULACAO: TIBBCDField;
    QryFichaVALORTOTALSUPLEMENTACAO: TIBBCDField;
    QryFichaDOTACAOINICIAL: TIBBCDField;
    QrySecretarias: TIBQuery;
    QryExecutivo: TIBQuery;
    QryExecutivoEXECUTIVOMUNICIPAL_ID: TIntegerField;
    QryExecutivoNOMEPREFEITO: TIBStringField;
    QryExecutivoMANDATOINICIO: TDateField;
    QryExecutivoMANDATOFIM: TDateField;
    QryExecutivoMUNICIPIO: TIBStringField;
    QryExecutivoUF: TIBStringField;
    QryItensAD: TIBQuery;
    QryItensADITENSAD_ID: TIntegerField;
    QryItensADAD_ID: TIntegerField;
    QryItensADNUMEROITEM: TIntegerField;
    QryItensADUND: TIBStringField;
    QryItensADQUANT: TIBBCDField;
    QryItensADESPECIFICACAO: TIBStringField;
    QryItensADVALORUNIT: TIBBCDField;
    QryItensADVALORTOTALITENS: TIBBCDField;
    tblDecreto: TIBTable;
    tblItensDecCredito: TIBTable;
    tblItensDecRecurso: TIBTable;
    tblDecretoDECRETO_ID: TIBStringField;
    tblDecretoDATA: TDateField;
    tblDecretoAN_EX: TIBStringField;
    tblDecretoSU_CE: TIBStringField;
    tblItensDecCreditoITENS_DEC_CREDITO_ID: TIntegerField;
    tblItensDecCreditoFICHA: TIntegerField;
    tblItensDecCreditoVALOR: TIBBCDField;
    tblItensDecCreditoDECRETO_ID: TIBStringField;
    tblItensDecRecursoITENS_DEC_RECURSO_ID: TIntegerField;
    tblItensDecRecursoFICHA: TIntegerField;
    tblItensDecRecursoVALOR: TIBBCDField;
    tblItensDecRecursoDECRETO_ID: TIBStringField;
    DataSource3: TDataSource;
    tblItensDecRecursoTotal: TCurrencyField;
    tblItensDecCreditototal: TCurrencyField;
    tblElementoDespesa: TIBTable;
    tblProjetoAtividade: TIBTable;
    tblElementoDespesaELEMENTODESPESA_ID: TIBStringField;
    tblElementoDespesaDESCRICAO: TIBStringField;
    tblProjetoAtividadePROJETOATIVIDADE_ID: TIBStringField;
    tblProjetoAtividadeDESCRICAO: TIBStringField;
    QryNumAD: TIBQuery;
    QryNumADNUM: TIBStringField;
    QryNumADDATA: TDateField;
    QryElementoDespesa: TIBQuery;
    QryProjetoAtividade: TIBQuery;
    QryElementoDespesaELEMENTODESPESA_ID: TIBStringField;
    QryElementoDespesaDESCRICAO: TIBStringField;
    QryProjetoAtividadePROJETOATIVIDADE_ID: TIBStringField;
    QryProjetoAtividadeDESCRICAO: TIBStringField;
    QrySaldoFicha: TIBQuery;
    QrySaldoFichaT_PROC: TIBBCDField;
    QrySaldoFichaT_ANU: TIBBCDField;
    QrySaldoFichaT_SUP: TIBBCDField;
    QrySaldoFichaT_DOTINI: TIBBCDField;
    QrySaldoFichaTotalSaldoAtual: TCurrencyField;
    QryDecreto: TIBQuery;
    QryITENS_DEC_CREDITO: TIBQuery;
    QryITENS_DEC_RECURSO: TIBQuery;
    QryDecretoDECRETO_ID: TIBStringField;
    QryDecretoDATA: TDateField;
    QryDecretoAN_EX: TIBStringField;
    QryDecretoSU_CE: TIBStringField;
    QryITENS_DEC_CREDITOITENS_DEC_CREDITO_ID: TIntegerField;
    QryITENS_DEC_CREDITOFICHA: TIntegerField;
    QryITENS_DEC_CREDITOVALOR: TIBBCDField;
    QryITENS_DEC_CREDITODECRETO_ID: TIBStringField;
    QryITENS_DEC_RECURSOITENS_DEC_RECURSO_ID: TIntegerField;
    QryITENS_DEC_RECURSOFICHA: TIntegerField;
    QryITENS_DEC_RECURSOVALOR: TIBBCDField;
    QryITENS_DEC_RECURSODECRETO_ID: TIBStringField;
    QryFichaSec: TIBQuery;
    QryFichaSecFICHA_ID: TIntegerField;
    QryFichaSecSECRETARIASMUNICIPAIS_ID: TIntegerField;
    QryFichaSecPROJETOATIVIDADE: TIBStringField;
    QryFichaSecPADESCRICAO: TIBStringField;
    QryFichaSecELEMENTODESPESA: TIBStringField;
    QryFichaSecEDDESCRICAO: TIBStringField;
    QryFichaSecDOTACAOINICIAL: TIBBCDField;
    QryFichaSecVTPROCESSO: TIBBCDField;
    QryFichaSecVTANULACAO: TIBBCDField;
    QryFichaSecVTSUPLEMENTACAO: TIBBCDField;
    QryFichaSecVALORTOTAL: TIBBCDField;
    QrySaldoFichaT_TOTAL: TIBBCDField;
    QryDecRecursoTotal: TIBQuery;
    QryDecCreditoTotal: TIBQuery;
    QryDecCreditoTotalDECRETO_ID: TIBStringField;
    QryDecCreditoTotalT_TOTAL: TIBBCDField;
    QryDecRecursoTotalDECRETO_ID: TIBStringField;
    QryDecRecursoTotalT_TOTAL: TIBBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tblUsuarioNewRecord(DataSet: TDataSet);
    procedure tblExecutivoNewRecord(DataSet: TDataSet);
    procedure tblSecretariasNewRecord(DataSet: TDataSet);
    procedure tblADNewRecord(DataSet: TDataSet);
    procedure tblItensADNewRecord(DataSet: TDataSet);
    procedure tblFichaNewRecord(DataSet: TDataSet);
    procedure tblItensDecCreditoNewRecord(DataSet: TDataSet);
    procedure tblItensDecRecursoNewRecord(DataSet: TDataSet);
    procedure tblItensDecCreditoCalcFields(DataSet: TDataSet);
    procedure tblItensDecRecursoCalcFields(DataSet: TDataSet);
    procedure QrySaldoFichaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSisAD2: TdmSisAD2;

implementation

uses UControlaTabela;

{$R *.dfm}

procedure TdmSisAD2.DataModuleCreate(Sender: TObject);
begin
  BaseDados.DatabaseName:= GetCurrentDir + '\Dados\SisAD2.gdb';
  BaseDados.Connected := True;
end;

procedure TdmSisAD2.tblUsuarioNewRecord(DataSet: TDataSet);
begin
  tblUsuarioUSUARIO_ID.AsInteger :=
  AutoInc(BaseDados,'USUARIOS','USUARIO_ID');
end;

procedure TdmSisAD2.tblExecutivoNewRecord(DataSet: TDataSet);
begin
  tblExecutivoEXECUTIVOMUNICIPAL_ID.AsInteger :=
  AutoInc(BaseDados,'EXECUTIVOMUNICIPAL','EXECUTIVOMUNICIPAL_ID'); 
end;

procedure TdmSisAD2.tblSecretariasNewRecord(DataSet: TDataSet);
begin
  tblSecretariasSECRETARIASMUNICIPAIS_ID.AsInteger :=
  AutoInc(BaseDados,'SECRETARIASMUNICIPAIS','SECRETARIASMUNICIPAIS_ID');
end;

procedure TdmSisAD2.tblADNewRecord(DataSet: TDataSet);
begin
  tblADAD_ID.AsInteger :=
  AutoInc(BaseDados,'AD','AD_ID');  
end;

procedure TdmSisAD2.tblItensADNewRecord(DataSet: TDataSet);
begin
 tblItensADITENSAD_ID.AsInteger :=
 AutoInc(BaseDados,'ITENSAD','ITENSAD_ID');
end;

procedure TdmSisAD2.tblFichaNewRecord(DataSet: TDataSet);
begin
 tblFichaFICHA_ID.AsInteger :=
 AutoInc(BaseDados,'FICHA','FICHA_ID');
end;

procedure TdmSisAD2.tblItensDecCreditoNewRecord(DataSet: TDataSet);
begin
  tblItensDecCreditoITENS_DEC_CREDITO_ID.AsInteger :=
  AutoInc(BaseDados,'ITENS_DEC_CREDITO','ITENS_DEC_CREDITO_ID');
end;

procedure TdmSisAD2.tblItensDecRecursoNewRecord(DataSet: TDataSet);
begin
  tblItensDecRecursoITENS_DEC_RECURSO_ID.AsInteger :=
  AutoInc(BaseDados,'ITENS_DEC_RECURSO','ITENS_DEC_RECURSO_ID');
end;

procedure TdmSisAD2.tblItensDecCreditoCalcFields(DataSet: TDataSet);
begin
  QryUsa.Close;
  QryUsa.SQL.Clear;
  QryUsa.SQL.Add('SELECT SUM(VALOR) total FROM ITENS_DEC_CREDITO WHERE DECRETO_ID = :PDEC');
  QryUsa.ParamByName('PDEC').AsString  := tblDecretoDECRETO_ID.AsString;
  QryUsa.Open;

  tblItensDECcreditototal.AsCurrency :=
    QryUsa.FieldByName('total').AsCurrency;

end;

procedure TdmSisAD2.tblItensDecRecursoCalcFields(DataSet: TDataSet);
begin
  QryUsa.Close;
  QryUsa.SQL.Clear;
  QryUsa.SQL.Add('SELECT SUM(VALOR) total FROM ITENS_DEC_RECURSO WHERE DECRETO_ID = :PDEC');
  QryUsa.ParamByName('PDEC').AsString := tblDecretoDECRETO_ID.asString;
  QryUsa.Open;

  tblItensDECrecursoTotal.AsCurrency :=
    QryUsa.FieldByName('total').AsCurrency;
end;

procedure TdmSisAD2.QrySaldoFichaCalcFields(DataSet: TDataSet);
begin
{  QrySaldoFichaTotalSaldoAtual.AsCurrency :=
   QrySaldoFichaT_PROC.AsCurrency -
   QrySaldoFichaT_ANU.AsCurrency  -
   QrySaldoFichaT_SUP.AsCurrency -
   QrySaldoFichaT_DOTINI.AsCurrency ;}
end;

end.


