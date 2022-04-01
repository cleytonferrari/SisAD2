object dmSisAD2: TdmSisAD2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 260
  Top = 74
  Height = 496
  Width = 382
  object BaseDados: TIBDatabase
    DatabaseName = 'C:\SisAD2\Dados\SISAD2.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=171099')
    LoginPrompt = False
    DefaultTransaction = Transacao
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 8
    Top = 8
  end
  object Transacao: TIBTransaction
    Active = False
    DefaultDatabase = BaseDados
    AutoStopAction = saNone
    Left = 56
    Top = 8
  end
  object tblUsuario: TIBDataSet
    Database = BaseDados
    Transaction = Transacao
    OnNewRecord = tblUsuarioNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from USUARIOS'
      'where'
      '  USUARIO_ID = :OLD_USUARIO_ID and'
      '  NOME = :OLD_NOME and'
      '  SENHA = :OLD_SENHA')
    InsertSQL.Strings = (
      'insert into USUARIOS'
      '  (USUARIO_ID, NOME, SENHA)'
      'values'
      '  (:USUARIO_ID, :NOME, :SENHA)')
    RefreshSQL.Strings = (
      'Select '
      '  USUARIO_ID,'
      '  NOME,'
      '  SENHA'
      'from USUARIOS '
      'where'
      '  USUARIO_ID = :USUARIO_ID and'
      '  NOME = :NOME and'
      '  SENHA = :SENHA')
    SelectSQL.Strings = (
      'select  * from USUARIOS')
    ModifySQL.Strings = (
      'update USUARIOS'
      'set'
      '  USUARIO_ID = :USUARIO_ID,'
      '  NOME = :NOME,'
      '  SENHA = :SENHA'
      'where'
      '  USUARIO_ID = :OLD_USUARIO_ID and'
      '  NOME = :OLD_NOME and'
      '  SENHA = :OLD_SENHA')
    Left = 16
    Top = 64
    object tblUsuarioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIOS.USUARIO_ID'
      Required = True
    end
    object tblUsuarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'USUARIOS.NOME'
    end
    object tblUsuarioSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'USUARIOS.SENHA'
      Size = 8
    end
  end
  object QryCommit: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'COMMIT WORK;')
    Left = 224
    Top = 8
  end
  object tblExecutivo: TIBDataSet
    Database = BaseDados
    Transaction = Transacao
    OnNewRecord = tblExecutivoNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from EXECUTIVOMUNICIPAL'
      'where'
      '  EXECUTIVOMUNICIPAL_ID = :OLD_EXECUTIVOMUNICIPAL_ID and'
      '  NOMEPREFEITO = :OLD_NOMEPREFEITO and'
      '  MANDATOINICIO = :OLD_MANDATOINICIO and'
      '  MANDATOFIM = :OLD_MANDATOFIM and'
      '  MUNICIPIO = :OLD_MUNICIPIO and'
      '  UF = :OLD_UF')
    InsertSQL.Strings = (
      'insert into EXECUTIVOMUNICIPAL'
      
        '  (EXECUTIVOMUNICIPAL_ID, NOMEPREFEITO, MANDATOINICIO, MANDATOFI' +
        'M, '
      'MUNICIPIO, '
      '   UF)'
      'values'
      '  (:EXECUTIVOMUNICIPAL_ID, :NOMEPREFEITO, :MANDATOINICIO, '
      ':MANDATOFIM, '
      '   :MUNICIPIO, :UF)')
    RefreshSQL.Strings = (
      'Select '
      '  EXECUTIVOMUNICIPAL_ID,'
      '  NOMEPREFEITO,'
      '  MANDATOINICIO,'
      '  MANDATOFIM,'
      '  MUNICIPIO,'
      '  UF'
      'from EXECUTIVOMUNICIPAL '
      'where'
      '  EXECUTIVOMUNICIPAL_ID = :EXECUTIVOMUNICIPAL_ID and'
      '  NOMEPREFEITO = :NOMEPREFEITO and'
      '  MANDATOINICIO = :MANDATOINICIO and'
      '  MANDATOFIM = :MANDATOFIM and'
      '  MUNICIPIO = :MUNICIPIO and'
      '  UF = :UF')
    SelectSQL.Strings = (
      'select  * from EXECUTIVOMUNICIPAL')
    ModifySQL.Strings = (
      'update EXECUTIVOMUNICIPAL'
      'set'
      '  EXECUTIVOMUNICIPAL_ID = :EXECUTIVOMUNICIPAL_ID,'
      '  NOMEPREFEITO = :NOMEPREFEITO,'
      '  MANDATOINICIO = :MANDATOINICIO,'
      '  MANDATOFIM = :MANDATOFIM,'
      '  MUNICIPIO = :MUNICIPIO,'
      '  UF = :UF'
      'where'
      '  EXECUTIVOMUNICIPAL_ID = :OLD_EXECUTIVOMUNICIPAL_ID and'
      '  NOMEPREFEITO = :OLD_NOMEPREFEITO and'
      '  MANDATOINICIO = :OLD_MANDATOINICIO and'
      '  MANDATOFIM = :OLD_MANDATOFIM and'
      '  MUNICIPIO = :OLD_MUNICIPIO and'
      '  UF = :OLD_UF')
    Left = 16
    Top = 112
    object tblExecutivoEXECUTIVOMUNICIPAL_ID: TIntegerField
      FieldName = 'EXECUTIVOMUNICIPAL_ID'
      Origin = 'EXECUTIVOMUNICIPAL.EXECUTIVOMUNICIPAL_ID'
      Required = True
    end
    object tblExecutivoNOMEPREFEITO: TIBStringField
      FieldName = 'NOMEPREFEITO'
      Origin = 'EXECUTIVOMUNICIPAL.NOMEPREFEITO'
      Size = 50
    end
    object tblExecutivoMANDATOINICIO: TDateField
      FieldName = 'MANDATOINICIO'
      Origin = 'EXECUTIVOMUNICIPAL.MANDATOINICIO'
    end
    object tblExecutivoMANDATOFIM: TDateField
      FieldName = 'MANDATOFIM'
      Origin = 'EXECUTIVOMUNICIPAL.MANDATOFIM'
    end
    object tblExecutivoMUNICIPIO: TIBStringField
      FieldName = 'MUNICIPIO'
      Origin = 'EXECUTIVOMUNICIPAL.MUNICIPIO'
      Size = 50
    end
    object tblExecutivoUF: TIBStringField
      FieldName = 'UF'
      Origin = 'EXECUTIVOMUNICIPAL.UF'
      Size = 2
    end
  end
  object tblAD: TIBTable
    Database = BaseDados
    Transaction = Transacao
    OnNewRecord = tblADNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AD'
    Left = 16
    Top = 160
    object tblADAD_ID: TIntegerField
      FieldName = 'AD_ID'
    end
    object tblADITENSFICHA_ID: TIntegerField
      FieldName = 'ITENSFICHA_ID'
    end
    object tblADNUMEROAD: TIBStringField
      FieldName = 'NUMEROAD'
      Size = 8
    end
    object tblADSERVICOMATERIAL: TIBStringField
      FieldName = 'SERVICOMATERIAL'
      Size = 11
    end
    object tblADEXPOSICAOMOTIVOS: TIBStringField
      FieldName = 'EXPOSICAOMOTIVOS'
      Size = 255
    end
    object tblADVALORTOTAL: TIBBCDField
      FieldName = 'VALORTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblADFONTERECURSO: TIBStringField
      FieldName = 'FONTERECURSO'
    end
    object tblADVALORORCAMENTODISPONIVEL: TIBBCDField
      FieldName = 'VALORORCAMENTODISPONIVEL'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblADVALORSALDOORCAMENTARIO: TIBBCDField
      FieldName = 'VALORSALDOORCAMENTARIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblADFICHA_ID: TIntegerField
      FieldName = 'FICHA_ID'
    end
    object tblADDATA: TDateField
      FieldName = 'DATA'
    end
    object tblADSECRETARIASMUNICIPAIS_ID: TIntegerField
      FieldName = 'SECRETARIASMUNICIPAIS_ID'
    end
    object tblADNUMEROPROCESSO: TIBStringField
      FieldName = 'NUMEROPROCESSO'
      Size = 10
    end
  end
  object tblItensAD: TIBTable
    Database = BaseDados
    Transaction = Transacao
    OnNewRecord = tblItensADNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'AD_ID'
    MasterFields = 'AD_ID'
    MasterSource = DataSource2
    TableName = 'ITENSAD'
    Left = 56
    Top = 160
    object tblItensADITENSAD_ID: TIntegerField
      FieldName = 'ITENSAD_ID'
    end
    object tblItensADAD_ID: TIntegerField
      FieldName = 'AD_ID'
    end
    object tblItensADNUMEROITEM: TIntegerField
      FieldName = 'NUMEROITEM'
    end
    object tblItensADUND: TIBStringField
      FieldName = 'UND'
      Size = 5
    end
    object tblItensADQUANT: TIBBCDField
      FieldName = 'QUANT'
      Precision = 18
      Size = 2
    end
    object tblItensADESPECIFICACAO: TIBStringField
      FieldName = 'ESPECIFICACAO'
      Size = 255
    end
    object tblItensADVALORUNIT: TIBBCDField
      FieldName = 'VALORUNIT'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblItensADVALORTOTALITENS: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VALORTOTALITENS'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 4
    end
  end
  object tblFicha: TIBTable
    Database = BaseDados
    Transaction = Transacao
    OnNewRecord = tblFichaNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FICHA'
    Left = 208
    Top = 112
    object tblFichaFICHA_ID: TIntegerField
      FieldName = 'FICHA_ID'
    end
    object tblFichaSECRETARIASMUNICIPAIS_ID: TIntegerField
      FieldName = 'SECRETARIASMUNICIPAIS_ID'
    end
    object tblFichaNUMEROFICHA: TIBStringField
      FieldName = 'NUMEROFICHA'
      Size = 3
    end
    object tblFichaPROJETOATIVIDADE: TIBStringField
      FieldName = 'PROJETOATIVIDADE'
    end
    object tblFichaELEMENTODESPESA: TIBStringField
      FieldName = 'ELEMENTODESPESA'
      Size = 15
    end
    object tblFichaVALORTOTALPROCESSO: TIBBCDField
      FieldName = 'VALORTOTALPROCESSO'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblFichaVALORTOTALANULACAO: TIBBCDField
      FieldName = 'VALORTOTALANULACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblFichaVALORTOTALSUPLEMENTACAO: TIBBCDField
      FieldName = 'VALORTOTALSUPLEMENTACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblFichaDOTACAOINICIAL: TIBBCDField
      FieldName = 'DOTACAOINICIAL'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QryUsa: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 64
  end
  object tblSecretarias: TIBTable
    Database = BaseDados
    Transaction = Transacao
    OnNewRecord = tblSecretariasNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SECRETARIASMUNICIPAIS'
    Left = 80
    Top = 64
    object tblSecretariasSECRETARIASMUNICIPAIS_ID: TIntegerField
      FieldName = 'SECRETARIASMUNICIPAIS_ID'
    end
    object tblSecretariasNOMESECRETARIA: TIBStringField
      FieldName = 'NOMESECRETARIA'
      Size = 75
    end
    object tblSecretariasNOMESECRETARIO: TIBStringField
      FieldName = 'NOMESECRETARIO'
      Size = 50
    end
    object tblSecretariasPORTARIA: TIBStringField
      FieldName = 'PORTARIA'
      Size = 15
    end
  end
  object QryFuncao: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    Left = 208
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = tblItensAD
    Left = 160
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = tblAD
    Left = 104
    Top = 8
  end
  object QryRollback: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'ROLLBACK WORK;')
    Left = 296
    Top = 8
  end
  object QryAtuFicha: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM ATUALIZA_FICHA(:PFICHA);')
    Left = 144
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFICHA'
        ParamType = ptUnknown
      end>
  end
  object QryItensFicha: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      ' SELECT *'
      ' FROM'
      
        '   ITENSFICHA WHERE FICHA_ID = :NFICHA ORDER BY DATA, NUMPROCESS' +
        'O, NUMDECRETO, NUMEROAD, NUMANULACAO, ITENSFICHA_ID')
    Left = 272
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NFICHA'
        ParamType = ptUnknown
      end>
    object QryItensFichaITENSFICHA_ID: TIntegerField
      FieldName = 'ITENSFICHA_ID'
      Origin = 'ITENSFICHA.ITENSFICHA_ID'
      Required = True
    end
    object QryItensFichaFICHA_ID: TIntegerField
      FieldName = 'FICHA_ID'
      Origin = 'ITENSFICHA.FICHA_ID'
    end
    object QryItensFichaVALORANULACAO: TIBBCDField
      FieldName = 'VALORANULACAO'
      Origin = 'ITENSFICHA.VALORANULACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryItensFichaVALORSUPLEMENTACAO: TIBBCDField
      FieldName = 'VALORSUPLEMENTACAO'
      Origin = 'ITENSFICHA.VALORSUPLEMENTACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryItensFichaSALDOATUALDOTACAOINICIAL: TIBBCDField
      FieldName = 'SALDOATUALDOTACAOINICIAL'
      Origin = 'ITENSFICHA.SALDOATUALDOTACAOINICIAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryItensFichaVALORPROCESSO: TIBBCDField
      FieldName = 'VALORPROCESSO'
      Origin = 'ITENSFICHA.VALORPROCESSO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryItensFichaDATA: TDateField
      FieldName = 'DATA'
      Origin = 'ITENSFICHA.DATA'
    end
    object QryItensFichaNUMEROAD: TIBStringField
      FieldName = 'NUMEROAD'
      Origin = 'ITENSFICHA.NUMEROAD'
      Size = 8
    end
    object QryItensFichaNUMPROCESSO: TIBStringField
      FieldName = 'NUMPROCESSO'
      Origin = 'ITENSFICHA.NUMPROCESSO'
      Size = 9
    end
    object QryItensFichaNUMDECRETO: TIBStringField
      FieldName = 'NUMDECRETO'
      Origin = 'ITENSFICHA.NUMDECRETO'
      Size = 9
    end
    object QryItensFichaNUMANULACAO: TIBStringField
      FieldName = 'NUMANULACAO'
      Origin = 'ITENSFICHA.NUMANULACAO'
      Size = 9
    end
  end
  object QryAD: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from AD')
    Left = 152
    Top = 112
    object QryADAD_ID: TIntegerField
      FieldName = 'AD_ID'
      Origin = 'AD.AD_ID'
      Required = True
    end
    object QryADITENSFICHA_ID: TIntegerField
      FieldName = 'ITENSFICHA_ID'
      Origin = 'AD.ITENSFICHA_ID'
    end
    object QryADNUMEROAD: TIBStringField
      FieldName = 'NUMEROAD'
      Origin = 'AD.NUMEROAD'
      Size = 8
    end
    object QryADSERVICOMATERIAL: TIBStringField
      FieldName = 'SERVICOMATERIAL'
      Origin = 'AD.SERVICOMATERIAL'
      Size = 11
    end
    object QryADEXPOSICAOMOTIVOS: TIBStringField
      FieldName = 'EXPOSICAOMOTIVOS'
      Origin = 'AD.EXPOSICAOMOTIVOS'
      Size = 255
    end
    object QryADVALORTOTAL: TIBBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'AD.VALORTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryADFONTERECURSO: TIBStringField
      FieldName = 'FONTERECURSO'
      Origin = 'AD.FONTERECURSO'
    end
    object QryADVALORORCAMENTODISPONIVEL: TIBBCDField
      FieldName = 'VALORORCAMENTODISPONIVEL'
      Origin = 'AD.VALORORCAMENTODISPONIVEL'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryADVALORSALDOORCAMENTARIO: TIBBCDField
      FieldName = 'VALORSALDOORCAMENTARIO'
      Origin = 'AD.VALORSALDOORCAMENTARIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryADFICHA_ID: TIntegerField
      FieldName = 'FICHA_ID'
      Origin = 'AD.FICHA_ID'
    end
    object QryADDATA: TDateField
      FieldName = 'DATA'
      Origin = 'AD.DATA'
    end
    object QryADSECRETARIASMUNICIPAIS_ID: TIntegerField
      FieldName = 'SECRETARIASMUNICIPAIS_ID'
      Origin = 'AD.SECRETARIASMUNICIPAIS_ID'
    end
    object QryADNUMEROPROCESSO: TIBStringField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'AD.NUMEROPROCESSO'
      Size = 10
    end
  end
  object QryFicha: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FICHA')
    Left = 168
    Top = 160
    object QryFichaFICHA_ID: TIntegerField
      FieldName = 'FICHA_ID'
      Origin = 'FICHA.FICHA_ID'
      Required = True
    end
    object QryFichaSECRETARIASMUNICIPAIS_ID: TIntegerField
      FieldName = 'SECRETARIASMUNICIPAIS_ID'
      Origin = 'FICHA.SECRETARIASMUNICIPAIS_ID'
    end
    object QryFichaNUMEROFICHA: TIBStringField
      FieldName = 'NUMEROFICHA'
      Origin = 'FICHA.NUMEROFICHA'
      Size = 3
    end
    object QryFichaPROJETOATIVIDADE: TIBStringField
      FieldName = 'PROJETOATIVIDADE'
      Origin = 'FICHA.PROJETOATIVIDADE'
    end
    object QryFichaELEMENTODESPESA: TIBStringField
      FieldName = 'ELEMENTODESPESA'
      Origin = 'FICHA.ELEMENTODESPESA'
      Size = 15
    end
    object QryFichaVALORTOTALPROCESSO: TIBBCDField
      FieldName = 'VALORTOTALPROCESSO'
      Origin = 'FICHA.VALORTOTALPROCESSO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryFichaVALORTOTALANULACAO: TIBBCDField
      FieldName = 'VALORTOTALANULACAO'
      Origin = 'FICHA.VALORTOTALANULACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryFichaVALORTOTALSUPLEMENTACAO: TIBBCDField
      FieldName = 'VALORTOTALSUPLEMENTACAO'
      Origin = 'FICHA.VALORTOTALSUPLEMENTACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryFichaDOTACAOINICIAL: TIBBCDField
      FieldName = 'DOTACAOINICIAL'
      Origin = 'FICHA.DOTACAOINICIAL'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QrySecretarias: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SECRETARIASMUNICIPAIS')
    Left = 216
    Top = 160
  end
  object QryExecutivo: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from EXECUTIVOMUNICIPAL')
    Left = 304
    Top = 160
    object QryExecutivoEXECUTIVOMUNICIPAL_ID: TIntegerField
      FieldName = 'EXECUTIVOMUNICIPAL_ID'
      Origin = 'EXECUTIVOMUNICIPAL.EXECUTIVOMUNICIPAL_ID'
      Required = True
    end
    object QryExecutivoNOMEPREFEITO: TIBStringField
      FieldName = 'NOMEPREFEITO'
      Origin = 'EXECUTIVOMUNICIPAL.NOMEPREFEITO'
      Size = 50
    end
    object QryExecutivoMANDATOINICIO: TDateField
      FieldName = 'MANDATOINICIO'
      Origin = 'EXECUTIVOMUNICIPAL.MANDATOINICIO'
    end
    object QryExecutivoMANDATOFIM: TDateField
      FieldName = 'MANDATOFIM'
      Origin = 'EXECUTIVOMUNICIPAL.MANDATOFIM'
    end
    object QryExecutivoMUNICIPIO: TIBStringField
      FieldName = 'MUNICIPIO'
      Origin = 'EXECUTIVOMUNICIPAL.MUNICIPIO'
      Size = 50
    end
    object QryExecutivoUF: TIBStringField
      FieldName = 'UF'
      Origin = 'EXECUTIVOMUNICIPAL.UF'
      Size = 2
    end
  end
  object QryItensAD: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ITENSAD')
    Left = 256
    Top = 160
    object QryItensADITENSAD_ID: TIntegerField
      FieldName = 'ITENSAD_ID'
      Origin = 'ITENSAD.ITENSAD_ID'
      Required = True
    end
    object QryItensADAD_ID: TIntegerField
      FieldName = 'AD_ID'
      Origin = 'ITENSAD.AD_ID'
    end
    object QryItensADNUMEROITEM: TIntegerField
      FieldName = 'NUMEROITEM'
      Origin = 'ITENSAD.NUMEROITEM'
    end
    object QryItensADUND: TIBStringField
      FieldName = 'UND'
      Origin = 'ITENSAD.UND'
      Size = 5
    end
    object QryItensADQUANT: TIBBCDField
      FieldName = 'QUANT'
      Origin = 'ITENSAD.QUANT'
      Precision = 18
      Size = 2
    end
    object QryItensADESPECIFICACAO: TIBStringField
      FieldName = 'ESPECIFICACAO'
      Origin = 'ITENSAD.ESPECIFICACAO'
      Size = 255
    end
    object QryItensADVALORUNIT: TIBBCDField
      FieldName = 'VALORUNIT'
      Origin = 'ITENSAD.VALORUNIT'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryItensADVALORTOTALITENS: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VALORTOTALITENS'
      Origin = 'ITENSAD.VALORTOTALITENS'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 4
    end
  end
  object tblDecreto: TIBTable
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DECRETO'
    Left = 16
    Top = 208
    object tblDecretoDECRETO_ID: TIBStringField
      FieldName = 'DECRETO_ID'
      Size = 9
    end
    object tblDecretoDATA: TDateField
      FieldName = 'DATA'
    end
    object tblDecretoAN_EX: TIBStringField
      FieldName = 'AN_EX'
      Size = 2
    end
    object tblDecretoSU_CE: TIBStringField
      FieldName = 'SU_CE'
      Size = 2
    end
  end
  object tblItensDecCredito: TIBTable
    Database = BaseDados
    Transaction = Transacao
    OnCalcFields = tblItensDecCreditoCalcFields
    OnNewRecord = tblItensDecCreditoNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'DECRETO_ID'
    MasterFields = 'DECRETO_ID'
    MasterSource = DataSource3
    TableName = 'ITENS_DEC_CREDITO'
    Left = 56
    Top = 208
    object tblItensDecCreditoITENS_DEC_CREDITO_ID: TIntegerField
      FieldName = 'ITENS_DEC_CREDITO_ID'
    end
    object tblItensDecCreditoFICHA: TIntegerField
      FieldName = 'FICHA'
    end
    object tblItensDecCreditoVALOR: TIBBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblItensDecCreditoDECRETO_ID: TIBStringField
      FieldName = 'DECRETO_ID'
      Size = 9
    end
    object tblItensDecCreditototal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
  end
  object tblItensDecRecurso: TIBTable
    Database = BaseDados
    Transaction = Transacao
    OnCalcFields = tblItensDecRecursoCalcFields
    OnNewRecord = tblItensDecRecursoNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'DECRETO_ID'
    MasterFields = 'DECRETO_ID'
    MasterSource = DataSource3
    TableName = 'ITENS_DEC_RECURSO'
    Left = 104
    Top = 160
    object tblItensDecRecursoITENS_DEC_RECURSO_ID: TIntegerField
      FieldName = 'ITENS_DEC_RECURSO_ID'
    end
    object tblItensDecRecursoFICHA: TIntegerField
      FieldName = 'FICHA'
    end
    object tblItensDecRecursoVALOR: TIBBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object tblItensDecRecursoDECRETO_ID: TIBStringField
      FieldName = 'DECRETO_ID'
      Size = 9
    end
    object tblItensDecRecursoTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
  end
  object DataSource3: TDataSource
    DataSet = tblDecreto
    Left = 88
    Top = 112
  end
  object tblElementoDespesa: TIBTable
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ELEMENTODESPESA'
    Left = 56
    Top = 288
    object tblElementoDespesaELEMENTODESPESA_ID: TIBStringField
      FieldName = 'ELEMENTODESPESA_ID'
      Size = 15
    end
    object tblElementoDespesaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object tblProjetoAtividade: TIBTable
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PROJETOATIVIDADE'
    Left = 168
    Top = 288
    object tblProjetoAtividadePROJETOATIVIDADE_ID: TIBStringField
      FieldName = 'PROJETOATIVIDADE_ID'
    end
    object tblProjetoAtividadeDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object QryNumAD: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM NUMEROAD(1)')
    Left = 264
    Top = 288
    object QryNumADNUM: TIBStringField
      FieldName = 'NUM'
      Origin = 'NUMEROAD.NUM'
      Size = 9
    end
    object QryNumADDATA: TDateField
      FieldName = 'DATA'
      Origin = 'NUMEROAD.DATA'
    end
  end
  object QryElementoDespesa: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ELEMENTODESPESA')
    Left = 56
    Top = 344
    object QryElementoDespesaELEMENTODESPESA_ID: TIBStringField
      FieldName = 'ELEMENTODESPESA_ID'
      Origin = 'ELEMENTODESPESA.ELEMENTODESPESA_ID'
      Required = True
      Size = 15
    end
    object QryElementoDespesaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'ELEMENTODESPESA.DESCRICAO'
      Size = 50
    end
  end
  object QryProjetoAtividade: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PROJETOATIVIDADE')
    Left = 176
    Top = 344
    object QryProjetoAtividadePROJETOATIVIDADE_ID: TIBStringField
      FieldName = 'PROJETOATIVIDADE_ID'
      Origin = 'PROJETOATIVIDADE.PROJETOATIVIDADE_ID'
      Required = True
    end
    object QryProjetoAtividadeDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PROJETOATIVIDADE.DESCRICAO'
      Size = 50
    end
  end
  object QrySaldoFicha: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    OnCalcFields = QrySaldoFichaCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  SUM(VALORTOTALPROCESSO)T_PROC,'
      
        '  SUM(VALORTOTALANULACAO)T_ANU,SUM(VALORTOTALSUPLEMENTACAO) T_SU' +
        'P,'
      '  SUM(DOTACAOINICIAL) T_DOTINI, '
      
        '(SUM(DOTACAOINICIAL)  - SUM(VALORTOTALPROCESSO) - SUM(VALORTOTAL' +
        'ANULACAO) + SUM(VALORTOTALSUPLEMENTACAO) ) T_TOTAL'
      ''
      'FROM'
      '  FICHA'
      'WHERE'
      '  SECRETARIASMUNICIPAIS_ID = 3')
    Left = 264
    Top = 344
    object QrySaldoFichaT_PROC: TIBBCDField
      FieldName = 'T_PROC'
      currency = True
      Precision = 18
      Size = 2
    end
    object QrySaldoFichaT_ANU: TIBBCDField
      FieldName = 'T_ANU'
      currency = True
      Precision = 18
      Size = 2
    end
    object QrySaldoFichaT_SUP: TIBBCDField
      FieldName = 'T_SUP'
      currency = True
      Precision = 18
      Size = 2
    end
    object QrySaldoFichaT_DOTINI: TIBBCDField
      FieldName = 'T_DOTINI'
      currency = True
      Precision = 18
      Size = 2
    end
    object QrySaldoFichaTotalSaldoAtual: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalSaldoAtual'
      Calculated = True
    end
    object QrySaldoFichaT_TOTAL: TIBBCDField
      FieldName = 'T_TOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QryDecreto: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DECRETO')
    Left = 48
    Top = 392
    object QryDecretoDECRETO_ID: TIBStringField
      FieldName = 'DECRETO_ID'
      Origin = 'DECRETO.DECRETO_ID'
      Required = True
      Size = 9
    end
    object QryDecretoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DECRETO.DATA'
    end
    object QryDecretoAN_EX: TIBStringField
      FieldName = 'AN_EX'
      Origin = 'DECRETO.AN_EX'
      Size = 2
    end
    object QryDecretoSU_CE: TIBStringField
      FieldName = 'SU_CE'
      Origin = 'DECRETO.SU_CE'
      Size = 2
    end
  end
  object QryITENS_DEC_CREDITO: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ITENS_DEC_CREDITO'
      '')
    Left = 144
    Top = 208
    object QryITENS_DEC_CREDITOITENS_DEC_CREDITO_ID: TIntegerField
      FieldName = 'ITENS_DEC_CREDITO_ID'
      Origin = 'ITENS_DEC_CREDITO.ITENS_DEC_CREDITO_ID'
      Required = True
    end
    object QryITENS_DEC_CREDITOFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'ITENS_DEC_CREDITO.FICHA'
    end
    object QryITENS_DEC_CREDITOVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_DEC_CREDITO.VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryITENS_DEC_CREDITODECRETO_ID: TIBStringField
      FieldName = 'DECRETO_ID'
      Origin = 'ITENS_DEC_CREDITO.DECRETO_ID'
      Required = True
      Size = 9
    end
  end
  object QryITENS_DEC_RECURSO: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ITENS_DEC_RECURSO')
    Left = 288
    Top = 208
    object QryITENS_DEC_RECURSOITENS_DEC_RECURSO_ID: TIntegerField
      FieldName = 'ITENS_DEC_RECURSO_ID'
      Origin = 'ITENS_DEC_RECURSO.ITENS_DEC_RECURSO_ID'
      Required = True
    end
    object QryITENS_DEC_RECURSOFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'ITENS_DEC_RECURSO.FICHA'
    end
    object QryITENS_DEC_RECURSOVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_DEC_RECURSO.VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryITENS_DEC_RECURSODECRETO_ID: TIBStringField
      FieldName = 'DECRETO_ID'
      Origin = 'ITENS_DEC_RECURSO.DECRETO_ID'
      Required = True
      Size = 9
    end
  end
  object QryFichaSec: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM FICHASECRETARIA')
    Left = 272
    Top = 408
    object QryFichaSecFICHA_ID: TIntegerField
      FieldName = 'FICHA_ID'
      Origin = 'FICHASECRETARIA.FICHA_ID'
    end
    object QryFichaSecSECRETARIASMUNICIPAIS_ID: TIntegerField
      FieldName = 'SECRETARIASMUNICIPAIS_ID'
      Origin = 'FICHASECRETARIA.SECRETARIASMUNICIPAIS_ID'
    end
    object QryFichaSecPROJETOATIVIDADE: TIBStringField
      FieldName = 'PROJETOATIVIDADE'
      Origin = 'FICHASECRETARIA.PROJETOATIVIDADE'
    end
    object QryFichaSecPADESCRICAO: TIBStringField
      FieldName = 'PADESCRICAO'
      Origin = 'FICHASECRETARIA.PADESCRICAO'
      Size = 50
    end
    object QryFichaSecELEMENTODESPESA: TIBStringField
      FieldName = 'ELEMENTODESPESA'
      Origin = 'FICHASECRETARIA.ELEMENTODESPESA'
      Size = 15
    end
    object QryFichaSecEDDESCRICAO: TIBStringField
      FieldName = 'EDDESCRICAO'
      Origin = 'FICHASECRETARIA.EDDESCRICAO'
      Size = 50
    end
    object QryFichaSecDOTACAOINICIAL: TIBBCDField
      FieldName = 'DOTACAOINICIAL'
      Origin = 'FICHASECRETARIA.DOTACAOINICIAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryFichaSecVTPROCESSO: TIBBCDField
      FieldName = 'VTPROCESSO'
      Origin = 'FICHASECRETARIA.VTPROCESSO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryFichaSecVTANULACAO: TIBBCDField
      FieldName = 'VTANULACAO'
      Origin = 'FICHASECRETARIA.VTANULACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryFichaSecVTSUPLEMENTACAO: TIBBCDField
      FieldName = 'VTSUPLEMENTACAO'
      Origin = 'FICHASECRETARIA.VTSUPLEMENTACAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryFichaSecVALORTOTAL: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VALORTOTAL'
      Origin = 'FICHASECRETARIA.VALORTOTAL'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QryDecRecursoTotal: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM ITENS_DEC_RECURSO_TOTAL')
    Left = 112
    Top = 264
    object QryDecRecursoTotalDECRETO_ID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'DECRETO_ID'
      Origin = 'ITENS_DEC_RECURSO_TOTAL.DECRETO_ID'
      ReadOnly = True
      Size = 9
    end
    object QryDecRecursoTotalT_TOTAL: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'T_TOTAL'
      Origin = 'ITENS_DEC_RECURSO_TOTAL.T_TOTAL'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QryDecCreditoTotal: TIBQuery
    Database = BaseDados
    Transaction = Transacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM ITENS_DEC_CREDITO_TOTAL')
    Left = 208
    Top = 264
    object QryDecCreditoTotalDECRETO_ID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'DECRETO_ID'
      Origin = 'ITENS_DEC_CREDITO_TOTAL.DECRETO_ID'
      ReadOnly = True
      Size = 9
    end
    object QryDecCreditoTotalT_TOTAL: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'T_TOTAL'
      Origin = 'ITENS_DEC_CREDITO_TOTAL.T_TOTAL'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
end
