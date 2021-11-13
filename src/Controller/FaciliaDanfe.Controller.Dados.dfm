object Dados: TDados
  OldCreateOrder = False
  Height = 200
  Width = 349
  object NotaFiscal: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 16
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Left = 72
  end
  object dsCupons: TDataSource
    DataSet = cdsCupons
    Left = 136
    Top = 16
  end
  object cdsCupons: TClientDataSet
    PersistDataPacket.Data = {
      B40000009619E0BD010000001800000005000000000003000000B400094E756D
      65726F4346650100490000000100055749445448020002001400085365726965
      5341540100490000000100055749445448020002000F000A56616C6F72546F74
      616C0100490000000100055749445448020002001E000B44617461456D697373
      616F0100490000000100055749445448020002000A000B486F7261456D697373
      616F0100490000000100055749445448020002000A000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 16
    object cdsCuponsNumeroCFe: TStringField
      FieldName = 'NumeroCFe'
    end
    object cdsCuponsSerieSAT: TStringField
      FieldName = 'SerieSAT'
      Size = 15
    end
    object cdsCuponsValorTotal: TStringField
      FieldName = 'ValorTotal'
      Size = 30
    end
    object cdsCuponsDataEmissao: TStringField
      FieldName = 'DataEmissao'
      Size = 10
    end
    object cdsCuponsHoraEmissao: TStringField
      FieldName = 'HoraEmissao'
      Size = 10
    end
  end
end
