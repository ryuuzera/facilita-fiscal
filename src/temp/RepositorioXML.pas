unit RepositorioXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormularioPadrao2, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, RxToolEdit, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.Buttons, Classe_NFe,
  ACBrNFe, ACBrNFeDANFEFR, Biblioteca, pcnConversao,
  Data.FMTBcd, Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider, ZipMstr,
  JvExMask, JvToolEdit;

type

  TfrmRepositorioXML = class(TfrmPadrao2)
    spImportaXML: TSpeedButton;
    eDATA_INICIAL: TDateEdit;
    eDATA_FINAL: TDateEdit;
    Label2: TLabel;
    Label1: TLabel;
    OpenDialog: TOpenDialog;
    rbDatas: TRadioGroup;
    pnTopo: TPanel;
    pnCentro: TPanel;
    BSearch: TSpeedButton;
    spEliminaItem: TSpeedButton;
    GroupBox1: TGroupBox;
    dbgXMLRepositorio: TDBGrid;
    spSalvaPDF: TSpeedButton;
    spExportaXML: TSpeedButton;
    dsArquivosXML: TDataSource;
    cdsArquivosXML: TClientDataSet;
    sdsArquivosXML: TSQLDataSet;
    dspArquivosXML: TDataSetProvider;
    SaveDialog: TSaveDialog;
    tsGerarArquivos: TTabSheet;
    btGerar: TSpeedButton;
    gbFiltros: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    eDATA_FINAL_XML: TDateEdit;
    eDATA_INICIAL_XML: TDateEdit;
    edDestino: TJvDirectoryEdit;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    sdsXMLs: TSQLDataSet;
    spEnviarEmail: TSpeedButton;
    ZipMaster: TZipMaster;
    cdsXMLs: TClientDataSet;
    dspXMLs: TDataSetProvider;
    rbDatasXML: TRadioGroup;
    procedure spImportaXMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure spEliminaItemClick(Sender: TObject);
    procedure spExportaXMLClick(Sender: TObject);
    procedure spSalvaPDFClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btGerarClick(Sender: TObject);
    procedure spEnviarEmailClick(Sender: TObject);
    procedure pcDadosChange(Sender: TObject);
    procedure frmBaseActivate(Sender: TObject);
  private
    { Private declarations }
    iSucesso, iErro: Integer;
    FEmissaoNFe: TEmissaoNFe;
    procedure ImportaXML(aFileName: String);
    procedure EliminaItem;
    function ValidarDados: Boolean;
    function MontarQuery: Boolean;
    procedure GerarArquivos;
    procedure EnviarEmail;
    function ValidarDadosEnvioContador: Boolean;
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  frmRepositorioXML: TfrmRepositorioXML;

implementation

{$R *.dfm}

uses ModuloDados, Classe_ComunsDB, Classe_EnviarEmail, ListagemDFe;

procedure TfrmRepositorioXML.BSearchClick(Sender: TObject);
var
  sSQL: String;
  b: boolean;
begin
  sdsArquivosXML.Close;
  cdsArquivosXML.Close;
  sSQL := 'Select * from ARQUIVOS_XML_COMPRAS';
  b := ((eDATA_INICIAL.Date > 0) and (eDATA_FINAL.Date > 0));
  if b then
  begin
    if rbDatas.ItemIndex = 0 then
    begin
      sSQL := sSQL + ' where DATA_COMPRA between ' +
            quotedStr(FormatDateTime('dd.mm.yyyy',eDATA_INICIAL.Date)) +
            ' and ' + quotedStr(FormatDateTime('dd.mm.yyyy',eDATA_FINAL.Date));
      sdsArquivosXML.SQLConnection := frmModuloDados.SQLConnection;
      sdsArquivosXML.CommandText := sSQL;
      sdsArquivosXML.Open;
      cdsArquivosXML.Open;

    end
    else
    begin
      sSQL := sSQL + ' where DATA between ' +
            quotedStr(FormatDateTime('dd.mm.yyyy',eDATA_INICIAL.Date)) +
            ' and ' + quotedStr(FormatDateTime('dd.mm.yyyy',eDATA_FINAL.Date));
      sdsArquivosXML.SQLConnection := frmModuloDados.SQLConnection;
      sdsArquivosXML.CommandText := sSQL;
      sdsArquivosXML.Open;
      cdsArquivosXML.Open;
    end;
  end
  else
  begin
    sdsArquivosXML.SQLConnection := frmModuloDados.SQLConnection;
    sdsArquivosXML.CommandText := sSQL;
    sdsArquivosXML.Open;
    cdsArquivosXML.Open;
  end;
end;

procedure TfrmRepositorioXML.btGerarClick(Sender: TObject);
begin
  inherited;
  if not ValidarDados then
    Exit;
  if not MontarQuery then
    Exit;
  GerarArquivos;
end;

destructor TfrmRepositorioXML.Destroy;
begin
  inherited;
  if Assigned(FEmissaoNFe) then
    FEmissaoNFe.Free;
end;

procedure TfrmRepositorioXML.EliminaItem;
var
  Registro : TParams;
  SQL, qPesq : TSQLQuery;
  iEntradaCompra: Integer;
begin
  SQL := TSQLQuery.Create(nil);
  qPesq := TSQLQuery.Create(nil);
  SQL.SQLConnection := frmModuloDados.SQLConnection;
  qPesq.SQLConnection := frmMOduloDados.SQLConnection;
  try
    qPesq.Close;
    qPesq.CommandText := 'select ENTRADA_COMPRA from ARQUIVOS_XML_COMPRAS where ID = ' + cdsArquivosXML.FieldByName('ID').AsString;
    qPesq.Open;
    iEntradaCompra := qPesq.FieldByName('ENTRADA_COMPRA').AsInteger;
    if iEntradaCompra = 0 then
    begin
      try
        SQL.Close;
        SQL.CommandText := 'delete from ARQUIVOS_XML_COMPRAS where ID = ' + cdsArquivosXML.FieldByName('ID').AsString;
        if not cdsArquivosXML.IsEmpty then
          cdsArquivosXML.Delete;
        SQL.ExecSQL;
      except on E:exception do
        Mensagem('Erro ao excluir registro !' + sLinebreak + 'Erro: ' + E.Message);
      end;
    end
    else
      Mensagem('O Arquivo selecionado está vinculado a uma entrada de compra lançada que deve ser excluida para efetuar essa operação !', 2);
  finally
    SQL.Free;
    qPesq.Free;
  end;
end;

procedure TfrmRepositorioXML.EnviarEmail;
var
  sPath: String;
  sZipFile: String;
  iCount: Integer;
  Email: TEnviarEmail;
  sXML: TStringList;
  sFileNameListagem: String;

    function GetNameByDate: String;
    var
      iDia_Ini, iMes_Ini, iAno_Ini: Word;
      iDia_Fim, iMes_Fim, iAno_Fim: Word;
    begin
      DecodeDate(eDATA_INICIAL_XML.Date, iAno_Ini, iMes_Ini, iDia_Ini);
      DecodeDate(eDATA_FINAL_XML.Date, iAno_Fim, iMes_Fim, iDia_Fim);
      if iAno_Ini = iAno_Fim then
      begin
        if iMes_Ini <> iMes_Fim then
          Result := NomeMesAbreviado(iMes_Ini) + '_' + NomeMesAbreviado(iMes_Fim) + IntToStr(iAno_Ini)
        else
          Result := NomeMesAbreviado(iMes_Ini) + IntToStr(iAno_Ini);
      end
      else
        Result := NomeMesAbreviado(iMes_Ini) + IntToStr(iAno_Ini) + '_' + NomeMesAbreviado(iMes_Fim) + IntToStr(iAno_Fim);
    end;

    procedure GerarXMLs;
    var
      sFileName: String;
    begin
      sXML := TStringList.Create;
      cdsXMLs.First;
      CriaStatus('Gerando arquivos xml...', False, cdsXMLs.RecordCount);
      try
        while not cdsXMLs.Eof do
        begin
          sFileName := cdsXMLs.FieldByName('Chave_Acesso').AsString+'-nfe.xml';
          sXML.Clear;
          sXML.Text := cdsXMLs.FieldByName('XML').AsString;
          sXML.SaveToFile(sPath + sFileName);
          ZipMaster.FSpecArgs.Add(sFileName);
          Inc(iCount);

          cdsXMLs.Next;
          Application.ProcessMessages;
          AtualizaStatus('');
        end;
      finally
        sXML.Free;
        FinalizaStatus;
      end;
    end;

    function GetAssunto: String;
    var
      sAssunto, sSoftwareHouse: String;
    begin
      if (frmModuloDados.Partner.DllLoaded) then
      begin
        sSoftwareHouse := frmModuloDados.Partner.Nome;
      end
      else
      begin
        sSoftwareHouse := 'FRONTYS SISTEMAS';
      end;
      sAssunto := sSoftwareHouse + '  - Arquivos XML NFe Compras: '+ EmpresaAtual.Nome;
      Result := sAssunto;
    end;

    function GetDestinatarios: String;
    begin
      Result := frmModuloDados.sdsParametrosEMAIL_CONTADOR.AsString;
    end;

    function GetMensagem: String;
    var
      sMsg,
      sSoftwareHouse,
      sSite: String;
    begin
      if (frmModuloDados.Partner.DllLoaded) then
      begin
        if Trim(frmModuloDados.Partner.Nome) <> '' then
          sSoftwareHouse := frmModuloDados.Partner.Nome;
        if Trim(frmModuloDados.Partner.Site) <> '' then
          sSite := frmModuloDados.Partner.Site;
      end
      else
      begin
        sSoftwareHouse := 'FRONTYS SISTEMAS';
        sSite          := 'www.frontys.com.br'
      end;

      sMsg := 'Email automatico enviado pelo sistema da '+ sSoftwareHouse +sLineBreak+
              'Os arquivos XML são referentes as compras importadas no periodo informado.'+sLineBreak+
              ''+sLineBreak+
              'Por favor não responda esse email. Caso precise responder, utilize o email: '+ EmpresaAtual.Email + sLineBreak+
              'Os arquivos xmls estão zipados e foram enviados como anexo.'+sLineBreak+
              'Para visualizar os arquivos, utilize algum programa zip de sua preferência.'+sLineBreak+
              ''+sLineBreak+
              ''+sLineBreak+
              'Atenciosamente,'+sLineBreak+
              sSoftwareHouse+sLineBreak+
              sSite;

      Result := sMsg;
    end;

    function GetAnexos: String;
    begin
      Result := '';
      if FileExists(sZipFile + '.zip') then
        Result := sZipFile + '.zip';
      if FileExists(sFileNameListagem) then
        Result := Iif(Trim(Result) = '', Result, Result + ';') + sFileNameListagem;
    end;

    function GetSMTP: String;
    begin
      if (frmModuloDados.Partner.DllLoaded) and (Trim(frmModuloDados.Partner.SMTP) <> '') then
        Result := frmModuloDados.Partner.SMTP
      else
      begin
      {$IFDEF HUSK}
        Result := 'smtp.husksistemas.com';
      {$ELSE}
        Result := 'smtp.frontys.com.br';
      {$ENDIF}
      end;
    end;

    function GetEmailRemetente: String;
    begin
      if (frmModuloDados.Partner.DllLoaded) and (Trim(frmModuloDados.Partner.Email) <> '') then
        Result := frmModuloDados.Partner.Email
      else
      begin
      {$IFDEF HUSK}
        Result := 'smartcfe@husksistemas.com';
      {$ELSE}
        Result := 'smartcfe@frontys.com.br';
      {$ENDIF}
      end;
    end;

    function GetSenhaRemetente: String;
    begin
      if (frmModuloDados.Partner.DllLoaded) and (Trim(frmModuloDados.Partner.Senha_Email) <> '') then
        Result := frmModuloDados.Partner.Senha_Email
      else
        Result := 'p0o9i8u7y6T5R4E3W2Q1';  //senha frontys e husk sao iguais
    end;

    function GetNomeRemetente: String;
    begin
      if (frmModuloDados.Partner.DllLoaded) and (Trim(frmModuloDados.Partner.Remetente_NFCe) <> '') then
        Result := frmModuloDados.Partner.Remetente_NFCe
      else
      begin
      {$IFDEF HUSK}
        Result := 'Smart CFe HUSK';
      {$ELSE}
        Result := 'Smart CFe FRONTYS';
      {$ENDIF}
      end;
    end;

//    procedure GerarListagem;
//    begin
//      sFileNameListagem := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'listagemCompras_' + GetNameByDate + '.pdf';
//      if not TfrmListagemDFe.SalvarPDF(sFileNameListagem, eDATA_INICIAL_XML.Date, eDATA_FINAL_XML.Date, '55') then
//        sFileNameListagem := '';
//    end;

begin
  iCount := 0;
  sPath  := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + '\compras_'+ FormatDateTime('dd-mm-yy-hh-nn', Now) + '\';
  if not DirectoryExists(sPath) then
    ForceDirectories(sPath);
  sZipFile       := sPath + 'comprasNFe_' + GetNameByDate;
  Email := TEnviarEmail.Create(nil, GetSMTP, 587, False, True, GetEmailRemetente, GetSenhaRemetente,
                              GetNomeRemetente);
  try
    ZipMaster.DLL_Load := True;
    ZipMaster.RootDir := sPath;
    ZipMaster.ZipFileName := sZipFile;

    GerarXMLs;
    //GerarListagem;

    CriaStatus('Compactando arquivos...', True, 0);
    try
      if iCount> 0 then
        ZipMaster.Add;
    finally
      FinalizaStatus;
    end;

    if iCount > 0 then
    begin
      CriaStatus('Enviando email...', True, 0);
      try
        Email.Enviar(GetAssunto, GetDestinatarios, GetMensagem, GetAnexos);
      finally
        FinalizaStatus;
      end;
      Mensagem('Processo concluido !', 2);
    end;
  finally
    Email.Free;
    ApagarDiretorio(sPath);
    DeleteFile(sFileNameListagem);
    ZipMaster.DLL_Load := False;
    ZipMaster.FSpecArgs.Clear;
  end;
end;

procedure TfrmRepositorioXML.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(frmRepositorioXML);
  FreeAndNil(FEmissaoNFe);
end;

procedure TfrmRepositorioXML.FormCreate(Sender: TObject);
begin
  inherited;
  FEmissaoNFe := TEmissaoNFe.Create(nil);
  FEmissaoNFe.CarregaConfiguracoes;
  rbDatas.ItemIndex := 0;
  rbDatasXML.ItemIndex := 0;
  sdsXMLs.SQLConnection := frmModuloDados.SQLConnection;
  dbgXMLRepositorio.Columns[0].width := 80;
  dbgXMLRepositorio.Columns[1].width := 180;
  dbgXMLRepositorio.Columns[2].width := 50;
  dbgXMLRepositorio.Columns[3].width := 80;
  dbgXMLRepositorio.Columns[4].width := 100;
  dbgXMLRepositorio.Columns[5].width := 80;
end;

procedure TfrmRepositorioXML.frmBaseActivate(Sender: TObject);
begin
  inherited;
  pcDados.ActivePage := pcDados.Pages[0];
end;

procedure TfrmRepositorioXML.GerarArquivos;
var
  sPath: String;
  sList: TStringList;
  sFileName: String;
begin
  sPath        := IncludeTrailingPathDelimiter(edDestino.Text) + 'Compras\';
  if not DirectoryExists(sPath) then
    ForceDirectories(sPath);
  sList := TStringList.Create;
  cdsXMLs.First;
  CriaStatus('Gerando arquivos xml...', False, cdsXMLs.RecordCount);
   try
    while not cdsXMLs.Eof do
    begin
      sFileName := cdsXMLs.FieldByName('Chave_Acesso').AsString+'-nfe.xml';
      sList.Clear;
      sList.Text := cdsXMLs.FieldByName('XML').AsString;
      sList.SaveToFile(sPath + sFileName);
      cdsXMLs.Next;
      Application.ProcessMessages;
      AtualizaStatus('');
    end;
  finally
    sList.Free;
    FinalizaStatus;
    Mensagem('Processo concluido.', 2);
  end;
end;

procedure TfrmRepositorioXML.ImportaXML(aFileName: String);
var
  qPesq: TSQLQuery;
  Registro: TParams;
  DataEmissao, DataImportacao: TDate;
  iNumeroNFe: integer;
  ValorTotal : Double;
  sSerieNFe,
  sChaveAcesso,
  sEmitente,
  sDestinatario,
  sCNPJ,
  sArquivoXML: String;
begin
  try
    try
      qPesq := TSQLQuery.Create(nil);
      qPesq.SQLConnection := frmModuloDados.SQLConnection;
      Registro := TParams.Create;
      FEmissaoNFe.ComercioNFe.NotasFiscais.Clear;

      if not FEmissaoNFe.ComercioNFe.NotasFiscais.LoadFromFile(aFileName, False) then
      begin
        iErro := iErro + 1;
        Exit;
      end;
      DataEmissao           := FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].NFe.Ide.dEmi;
      DataImportacao        := Now();
      iNumeroNFe            := FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].NFe.Ide.nNF;
      sSerieNFe             := IntToStr(FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].NFe.Ide.serie);
      sChaveAcesso          := copy(FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44);
      ValorTotal            := FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
      sEmitente             := FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].NFe.Emit.xNome;
      sDestinatario         := FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].NFe.Dest.CNPJCPF;
      qPesq.CommandText     := 'select CHAVE_ACESSO from ARQUIVOS_XML_COMPRAS where CHAVE_ACESSO = ' +
                                quotedStr(sChaveAcesso);
      qPesq.Open;
      if qPesq.RecordCount > 0 then
      begin
        iErro := iErro + 1;
        exit
      end;
      qPesq.Close;
      qPesq.CommandText     := 'select CNPJ from EMPRESAS';
      qPesq.Open;
      sCNPJ                 := qPesq.FieldByName('CNPJ').AsString;
      if (sCNPJ <> MascaraCNPJ(sDestinatario))  then
      begin
        iErro := iErro + 1;
        exit
      end;
      Registro.CreateParam(ftInteger, 'ID', ptInputOutput);
      Registro.CreateParam(ftString, 'EMITENTE', ptInputOutput);
      Registro.CreateParam(ftDate, 'DATA_COMPRA', ptInputOutput);
      Registro.CreateParam(ftDate, 'DATA', ptInputOutput);
      Registro.CreateParam(ftInteger, 'NUMERO_NFE', ptInputOutput);
      Registro.CreateParam(ftFloat, 'VALOR_TOTAL', ptInputOutput);
      Registro.CreateParam(ftString, 'CHAVE_ACESSO', ptInputOutput);
      Registro.CreateParam(ftMemo, 'XML', ptInputOutput);
      Registro.CreateParam(ftMemo, 'SERIE', ptInputOutput);
      Registro.CreateParam(ftInteger, 'ENTRADA_COMPRA', ptInputOutput);

      Registro.ParamByName('ID').AsInteger := TFuncsDB.GetID('ARQUIVOS_XML_COMPRAS');
      Registro.ParamByName('EMITENTE').AsString := sEmitente;
      Registro.ParamByName('DATA_COMPRA').AsDate := DataEmissao;
      Registro.ParamByName('DATA').AsDate := DataImportacao;
      Registro.ParamByName('NUMERO_NFE').AsInteger := iNumeroNFe;
      Registro.ParamByName('VALOR_TOTAL').AsFloat := ValorTotal;
      Registro.ParamByName('CHAVE_ACESSO').AsString := sChaveAcesso;
      Registro.ParamByName('XML').AsMemo := FEmissaoNFe.ComercioNFe.NotasFiscais.Items[0].XML;
      Registro.ParamByName('SERIE').AsMemo := sSerieNFe;

      frmModuloDados.Database.Insert('ARQUIVOS_XML_COMPRAS', Registro);
      iSucesso := iSucesso + 1;
    except on E:Exception do
      Mensagem('Erro na importação dos arquivos XML !' + sLineBreak + E.Message);
    end;

  finally
    Registro.Free;
    qPesq.Close;
    qPesq.Free;
  end;

end;

function TfrmRepositorioXML.MontarQuery: Boolean;
var
  sSQL: String;
  bData: Boolean;
begin
  sdsXMLs.Close;
  cdsXMLs.Close;

  bData  := (eDATA_INICIAL_XML.Date > 0) and (eDATA_FINAL_XML.Date > 0);

  if not bData then
  begin
    Result := False;
    Mensagem('Nenhum filtro foi informado!', 2);
    Exit;
  end;

  if rbDatasXML.ItemIndex = 0 then
    sSQL := 'select A.* from Arquivos_XML_COMPRAS as A '+
           ' where A.ID > 0 and A.DATA_COMPRA between :DataInicial and :DataFinal '
  else
    sSQL := 'select A.* from Arquivos_XML_COMPRAS as A '+
           ' where A.ID > 0 and A.DATA between :DataInicial and :DataFinal ';

  sdsXMLs.CommandText := sSQL;
  if bData then
  begin
    sdsXMLs.ParamByName('DataInicial').AsDate := eDATA_INICIAL_XML.Date;
    sdsXMLs.ParamByName('DataFinal').AsDate   := eDATA_FINAL_XML.Date;
  end;

  sdsXMLs.Open;
  cdsXMLs.Open;
  Result := not cdsXMLs.IsEmpty;
  if not Result then
    Mensagem('Nenhuma nota encontrada com os filtros informados!', 2);
end;

procedure TfrmRepositorioXML.pcDadosChange(Sender: TObject);
begin
  inherited;
  if pcDados.ActivePageIndex = 1 then
    spImportaXML.Enabled := False
  else if pcDados.ActivePageIndex = 0 then
    spImportaXML.Enabled := True;
end;

procedure TfrmRepositorioXML.spEliminaItemClick(Sender: TObject);
begin
  if not cdsArquivosXML.IsEmpty then
    EliminaItem;
end;

procedure TfrmRepositorioXML.spEnviarEmailClick(Sender: TObject);
begin
  inherited;
  if not ValidarDadosEnvioContador then
    Exit;
  if not MontarQuery then
    Exit;
  if Questionar('Esse processo pode ser demorado! Não interrompa até que seja concluido!'+sLineBreak+
                'Deseja prosseguir?') then
    EnviarEmail;
end;

procedure TfrmRepositorioXML.spExportaXMLClick(Sender: TObject);
var
  sXML, NomeArquivo : String;
  Arquivo: TStringList;
begin
  if not cdsArquivosXML.IsEmpty then
  begin
    try
      Arquivo := TStringlist.Create;
      sXML := cdsArquivosXML.FieldByName('XML').asString;
      NomeArquivo := cdsArquivosXML.FieldByName('CHAVE_ACESSO').asString;
      SaveDialog.FilterIndex := 0;
      SaveDialog.Filename := NomeArquivo + '.xml';
      Arquivo.Add(sXML);
      if SaveDialog.Execute then
      begin
        Arquivo.SaveToFile(SaveDialog.Filename);
      end;
    finally
      FreeAndNil(Arquivo);
    end;
  end;
end;

procedure TfrmRepositorioXML.spImportaXMLClick(Sender: TObject);
var
  i: integer;
begin
  iErro    := 0;
  iSucesso := 0;
  if OpenDialog.Execute then
  begin
    for i := 0 to OpenDialog.Files.Count -1 do
      ImportaXML(OpenDialog.Files[i]);
    if iErro > 0 then
      Mensagem('A Importação de ' + intToStr(iSucesso) + ' Arquivo(s) XML foi Concluída !' +slinebreak+
               intToStr(iErro) + ' Arquivo(s) não foram importados', 2)
    else if iSucesso = 0 then
      Mensagem('Nenhum arquivo XML foi Importado !', 2)
    else
      Mensagem('A Importação de ' + intToStr(iSucesso) + ' Arquivo(s) XML foi Concluída !', 2);
  end;
end;

procedure TfrmRepositorioXML.spSalvaPDFClick(Sender: TObject);
var
  sXML, NomeArquivo: string;
begin
  if not cdsArquivosXML.IsEmpty then
  begin
    try
      sXML := cdsArquivosXML.FieldByName('XML').AsString;
      FEmissaoNFe.ComercioNFe.NotasFiscais.Clear;
      FEmissaoNFe.ComercioNFe.NotasFiscais.LoadFromString(sXML);
      FEmissaoNFe.ComercioNFe.NotasFiscais.Imprimir;
    except on E:exception do
      Mensagem('Erro ao gerar Impressão !' + sLineBreak + E.Message);
    end;

  end;
end;

function TfrmRepositorioXML.ValidarDados: Boolean;
begin
  Result := True;
  if Trim(edDestino.Text) = '' then
  begin
    Result := False;
    Mensagem('Destino deve ser informado.', 2);
    edDestino.SetFocus;
    Exit;
  end;
  if not DirectoryExists(edDestino.Text) then
  begin
    Result := False;
    Mensagem('Diretório informado não existe.', 2);
    edDestino.SetFocus;
    Exit;
  end;
end;


function TfrmRepositorioXML.ValidarDadosEnvioContador: Boolean;
begin
  Result := True;
  if Trim(frmModuloDados.sdsParametrosEMAIL_CONTADOR.AsString) = '' then
  begin
    Result := False;
    Mensagem('Email do contador deve ser informado nos parâmetros do sistema.', 2);
    Exit;
  end;
  if (eDATA_INICIAL_XML.Date = 0) or (eDATA_FINAL_XML.Date = 0) then
  begin
    Result := False;
    if eDATA_INICIAL_XML.Date = 0 then
    begin
      Mensagem('Data inicial deve ser informada.', 2);
      eDATA_INICIAL_XML.SetFocus;
    end
    else
    begin
      Mensagem('Data final deve ser informada.', 2);
      eDATA_FINAL_XML.SetFocus;
    end;
    Exit;
  end;
end;

end.
