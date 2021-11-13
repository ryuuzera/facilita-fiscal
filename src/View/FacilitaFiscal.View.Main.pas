unit FacilitaFiscal.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, ACBrNFeDANFEFR, ACBrDFe, ACBrNFe, FaciliaDanfe.Controller.Dados,
  FacilitaDanfe.Controller.Biblioteca, FileCtrl,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, ACBrGIF, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMain = class(TForm)
    Panel2: TPanel;
    pnBarraSuperior: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    pnMain: TPanel;
    pnCenter: TPanel;
    PageControl1: TPageControl;
    tabGeraDanfe: TTabSheet;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbTitulo: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbEmitente: TLabel;
    lbDestinatario: TLabel;
    lbQuantidadeItens: TLabel;
    lbValorItens: TLabel;
    lbValorNota: TLabel;
    lbChave: TLabel;
    pnbGeraDanfe: TPanel;
    rbRetrato: TRadioButton;
    rbPaisagem: TRadioButton;
    Panel6: TPanel;
    TabInicio: TTabSheet;
    Panel4: TPanel;
    Label6: TLabel;
    tabExtrator: TTabSheet;
    Panel8: TPanel;
    pnTop: TPanel;
    lbInicio: TLabel;
    lbGeraDanfe: TLabel;
    lbExtrator: TLabel;
    lbParametros: TLabel;
    TabParametros: TTabSheet;
    Panel5: TPanel;
    Label11: TLabel;
    Image3: TImage;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edDirPDF: TEdit;
    Panel7: TPanel;
    edImgLogo: TEdit;
    Panel9: TPanel;
    TabSheet1: TTabSheet;
    Panel10: TPanel;
    Image4: TImage;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit3: TEdit;
    Panel11: TPanel;
    Edit4: TEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    sbDirPDF: TSpeedButton;
    sbBuscaLogo: TSpeedButton;
    pnbSvParamDANFe: TPanel;
    Label19: TLabel;
    lbNumeroNFe: TLabel;
    Image8: TImage;
    Panel14: TPanel;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    procedure pnbGeraDanfeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure pnBarraSuperiorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbInicioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbInicioMouseLeave(Sender: TObject);
    procedure lbGeraDanfeMouseLeave(Sender: TObject);
    procedure lbGeraDanfeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbExtratorMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbExtratorMouseLeave(Sender: TObject);
    procedure pnbGeraDanfeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnbGeraDanfeMouseLeave(Sender: TObject);
    procedure Panel6MouseLeave(Sender: TObject);
    procedure Panel6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure lbGeraDanfeClick(Sender: TObject);
    procedure lbInicioClick(Sender: TObject);
    procedure lbExtratorClick(Sender: TObject);
    procedure lbParametrosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnbSvParamDANFeMouseLeave(Sender: TObject);
    procedure pnbSvParamDANFeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbDirPDFClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pnbSvParamDANFeClick(Sender: TObject);
    procedure sbBuscaLogoClick(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
  private
    { Private declarations }
    Timer: TTimer;
    NFe: TACBrNFe;
    DANFe: TACBrNFeDANFEFR;
    iNumeroNFe, iQuantidadeItens : integer;
    ValorTotal : Double;
    ValorTotalItens : Double;
    DataEmissao: TDate;
    sSerieNFe,
    sChaveAcesso,
    sEmitente,
    sDestinatario,
    sCNPJ,
    sArquivoXML,
    sPathTemp: String;
    procedure importaXML(aFileName: string);
    procedure importaLoteXML(aFileName: string);
    procedure carregaConfiguracoes;
    procedure aplicaEstilos;
    procedure LeaveLabel(aLabel : TLabel);
    procedure MoveLabel(aLabel : TLabel);
    procedure LeaveBtnPanel(aPanel : TPanel);
    procedure MoveBtnPanel(aPanel : TPanel);
    procedure FadeIn;
    procedure FadeOut;
    procedure OnTimer(Sender:TObject);
    function formatarChaveAcesso(aChave: String): string;
    function paginaParametro: boolean;
    procedure VerificaOrientacao;
    procedure GeraPDF;
    function mascaraData(aData: String): string;
    function mascaraHora(aHora: String): string;
  public
    FPath: String;
    { Public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

uses
  pcnConversao, FacilitaFiscal.View.Styles.Colors, Winapi.ShellAPI,
  Xml.XMLIntf, Xml.xmldom, Xml.XMLDoc, ACBrConsts, System.AnsiStrings;

{$R *.dfm}

procedure TfrmMain.aplicaEstilos;
var
 i : integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    {Label}
    if (frmMain.Components[i].ClassName = 'TLabel') then
    begin
      if TLabel(frmMain.Components[i]).Tag = 0 then
      begin
        TLabel(Components[i]).Font.Size := H5;
        TLabel(Components[i]).Font.Name := FONT_STANDARD;
        TLabel(Components[i]).Font.Color := COLOR_WHITE;
        TLabel(Components[i]).Font.Style := [fsBold];
      end;
      if TLabel(frmMain.Components[i]).Tag = 1 then
      begin
        TLabel(Components[i]).Font.Size := H6;
        TLabel(Components[i]).Font.Name := FONT_STANDARD;
        TLabel(Components[i]).Font.Color := COLOR_WHITE;
        TLabel(Components[i]).Font.Quality := fqClearType;
        TLabel(Components[i]).Cursor := crHandPoint;
      end;
    end;
    {RadioButton}
    if (frmMain.Components[i].ClassName = 'TRadioButton') then
    begin
      TRadioButton(Components[i]).Font.Size := H6;
      TRadioButton(Components[i]).Font.Name := FONT_STANDARD;
      TRadioButton(Components[i]).Font.Color := COLOR_WHITE;
    end;
    {Panel}
    if (frmMain.Components[i].ClassName = 'TPanel') then
    begin
      if TPanel(frmMain.Components[i]).Tag = 1 then
      begin
        TPanel(frmMain.Components[i]).Font.Size := H6;
        TPanel(frmMain.Components[i]).Font.Name := FONT_STANDARD;
        TPanel(frmMain.Components[i]).Font.Color := COLOR_WHITE;
        TPanel(frmMain.Components[i]).Color := COLOR_BUTTON;
        TLabel(Components[i]).Cursor := crHandPoint;
      end;
      if TPanel(frmMain.Components[i]).Tag = 2 then
      begin
        TPanel(frmMain.Components[i]).Color := COLOR_BACKGROUND;
      end;
      if TPanel(frmMain.Components[i]).Tag = 3 then
      begin
        TPanel(frmMain.Components[i]).Color := COLOR_BACKGROUND_DARK;
      end;
       if TPanel(frmMain.Components[i]).Tag = 4 then
      begin
        TPanel(frmMain.Components[i]).Color := COLOR_HIGHLIGHT;
      end;
    end;
  end;
end;

procedure TfrmMain.LeaveBtnPanel(aPanel: TPanel);
begin
  TPanel(aPanel).Color := COLOR_BUTTON;
end;

procedure TfrmMain.LeaveLabel(aLabel: TLabel);
begin
   aLabel.Font.Color := COLOR_WHITE;
end;

function TfrmMain.mascaraData(aData: String): string;
var
dia, mes, ano: string;
begin
  ano := copy(aData, 0, 4);
  mes := copy(aData, 5, 2);
  dia := copy(aData, 7, 2);
  aData := dia + '/' + mes + '/' + ano;
  Result := aData;
end;

function TfrmMain.mascaraHora(aHora: String): string;
begin
  insert(':', aHora, 3);
  insert(':', aHora, 5);
  Result := aHora;
end;

procedure TfrmMain.MoveBtnPanel(aPanel: TPanel);
begin
  TPanel(aPanel).Color := COLOR_BUTTON_HOVER;
end;

procedure TfrmMain.MoveLabel(aLabel : TLabel);
begin
  aLabel.Font.Color := COLOR_HIGHLIGHT_MAIN;
end;

procedure TfrmMain.OnTimer(Sender: TObject);
begin
  if Self.AlphaBlendValue > 250 then
  begin
    Self.AlphaBlendValue := 255;
    Timer.Enabled := False;
  end
  else
    Self.AlphaBlendValue := Self.AlphaBlendValue + 17;
end;


function TfrmMain.paginaParametro: Boolean;
begin
  Result := ((PageControl1.ActivePageIndex <> 3) and
             (PageControl1.ActivePageIndex <> 4) and
             (PageControl1.ActivePageIndex <> 5));
end;

procedure TfrmMain.VerificaOrientacao;
begin
  if rbPaisagem.checked then
    DANFE.FastFile := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DANFePaisagem.fr3';
  if rbRetrato.Checked then
    DANFE.FastFile := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DANFeRetrato.fr3';
end;

procedure TfrmMain.GeraPDF;
var
  sXML: string;
  sPath: string;
begin
  sXML := sArquivoXML;
  NFe.NotasFiscais.LoadFromString(sXML);
  ForceDirectories('C:\temp');
  if FPath = '' then
    FPath := 'C:\temp';
  sPath := (FPath + '\' + sChaveAcesso + '-nfe.PDF');
  NFe.DANFE.PathPDF := sPath;
  NFe.NotasFiscais.ImprimirPDF;
  if FileExists('%programfiles%\Google\Chrome\Application\chrome.exe') then
    ShellExecute(0, nil, 'cmd.exe', PWideChar('/c start chrome --start-maximized --app=' + '"' + sPath + '"'), nil, SW_HIDE)
  else if FileExists('%programfiles(x86)%\Microsoft\Edge\Application\msedge.exe') then
    ShellExecute(0, nil, 'cmd.exe', PWideChar('/c start msedge ' + '"' + sPath + '"'), nil, SW_HIDE)
  else if FileExists('%programfiles%\Microsoft\Edge\Application\msedge.exe') then
    ShellExecute(0, nil, 'cmd.exe', PWideChar('/c start msedge ' + '"' + sPath + '"'), nil, SW_HIDE)
  else
    Biblioteca.AbrirArquivo(sPath);
end;

procedure TfrmMain.carregaConfiguracoes;
begin
  NFE.DANFE := DANFE;
  NFe.NotasFiscais.Clear;
  NFe.Configuracoes.WebServices.Ambiente := taProducao ;
  DANFE.Sistema := 'Facilita Fiscal ' + Biblioteca.getVersao;
  DANFE.PathPDF := 'C:\Projetos';
end;

procedure TfrmMain.FadeIn;
begin
  Self.AlphaBlend := True;
  Self.AlphaBlendValue := 0;
  Timer.OnTimer := OnTimer;
  Timer.Interval := 3;
  Timer.Enabled := True;
end;

procedure TfrmMain.FadeOut;
begin
  Self.AlphaBlend := True;
  Self.AlphaBlendValue := 255;
  Timer.Interval := 3;
  Timer.Enabled := True;
end;

function TfrmMain.formatarChaveAcesso(aChave: String): string;
var
  i: integer;
  espaços: integer;
begin
  espaços := 0;
  for i := 0 to 9 do
  begin
    insert(' ', aChave, 5 + espaços);
    espaços := espaços + 5;
  end;
  Result := aChave;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := messagedlg('Deseja fechar?', mtInformation, [mbYes, mbNo], 0) = mryes;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Application.UpdateFormatSettings := false;
  DecimalSeparator := ',';
  try
    NFe := TACBrNFe.Create(nil);
    Timer := TTimer.Create(nil);
    FadeIn;
    DANFE := TACBrNFeDANFEFR.Create(nil);
    carregaConfiguracoes;
    aplicaEstilos;
  except on E:exception do
    MessageDlg(e.Message, mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmMain.Image2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.importaLoteXML(aFileName: string);
var
  Lista: TStringlist;
  Node: IXMLDocument;
  NodeCFe, nodenode: IXMLNode;
  i: integer;
  sNumeroCFe, sTotal, sIdLote,
  sNumeroSerie, sData, sHora: string;
  fTotal: double;
  ffTotal: double;
  sChaveAcesso: variant;
begin

  Try
    try
      Lista := Tstringlist.Create;
      Node := TXMLDocument.Create(nil);
      Node.Active := True;
      Node.LoadFromFile(aFileName);
      NodeCFe := Node.ChildNodes.FindNode('envCFe').ChildNodes.FindNode('LoteCFe');
      fTotal := 0.0;
      for i := 0 to NodeCFe.ChildNodes.Count -1 do
      begin
          NodeCFe.ChildNodes[i].Attributes['xmlns'] := 'http://www.fazenda.sp.gov.br/sat';
          Lista.Add(NodeCFe.ChildNodes[i].XML);
          NodeCFe.ChildNodes[i].XML;
          {Extrai Chave Acesso}
          sChaveAcesso := NodeCFe.ChildNodes[i]
                           .ChildNodes.FindNode('infCFe')
                            .Attributes['Id'];
          sChaveAcesso := copy(sChaveAcesso, 4,44);
          {Extrai Numero Cupom}
          sNumeroCFe := NodeCFe.ChildNodes[i]
                          .ChildNodes
                            .FindNode('infCFe')
                              .ChildNodes
                                .FindNode('ide')
                                  .ChildNodes
                                    .FindNode('nCFe')
                                      .Text;
          {Extrai Extrai Valor Total Cupom}
          sTotal := NodeCFe.ChildNodes[i]
                      .ChildNodes
                        .FindNode('infCFe')
                          .ChildNodes
                            .FindNode('total')
                              .ChildNodes
                                .FindNode('vCFe')
                                  .Text;
          {Extrai Numero Serie SAT}
          sNumeroSerie := NodeCFe.ChildNodes[i]
                          .ChildNodes
                            .FindNode('infCFe')
                              .ChildNodes
                                .FindNode('ide')
                                  .ChildNodes
                                    .FindNode('nserieSAT')
                                      .Text;
          {Extrai Data}
          sData := NodeCFe.ChildNodes[i]
                      .ChildNodes
                        .FindNode('infCFe')
                          .ChildNodes
                            .FindNode('ide')
                              .ChildNodes
                                .FindNode('dEmi')
                                  .Text;
          sData := mascaraData(sData);

          {Extrai Hora}
          sHora := NodeCFe.ChildNodes[i]
                      .ChildNodes
                        .FindNode('infCFe')
                          .ChildNodes
                            .FindNode('ide')
                              .ChildNodes
                                .FindNode('hEmi')
                                  .Text;
          sHora := mascaraHora(sHora);

          {Extrai Lote}
          sIdLote := Node.ChildNodes
                      .FindNode('envCFe')
                        .ChildNodes
                          .FindNode('idLote')
                            .Text;

          sTotal := ReplaceStr(sTotal, '.',',');
          ffTotal := strToFloat(sTotal);
          FTotal := FTotal + ffTotal;
//          Listbox1.Items.Add('Cupom: '+sNumeroCFe+'   Valor Total:  R$'+sTotal+' '+sData+' '+sHora);
          with Dados.cdsCupons do
          begin
            Append;
            fieldbyname('NumeroCFe').AsString := sNumeroCFe;
            fieldbyname('SerieSAT').AsString := sNumeroSerie;
            fieldbyname('ValorTotal').AsString := sTotal;
            fieldbyname('DataEmissao').AsString := sData;
            fieldbyname('HoraEmissao').AsString := sHora;
            Post;
          end;
          Lista.SaveToFile('C:\temp\'+'AD'+VarToStr(sChaveAcesso)+'.xml');
          Lista.Clear;
      end;
      Listbox1.Items.Add('Valor Total Cupons Importados: R$' +FormatFloat('#,0.00', fTotal) );
    except on E:exception do
      MessageDlg('Não foi possível importar algum arquivo selecionado! Confira se os arquivos se tratam de Lotes de Cupons SAT.', mtInformation, [mbOK], 0);

    end;
  Finally
    FreeAndNil(lista);
    FreeAndNil(Node);
  End;
end;


procedure TfrmMain.importaXML;
var i: integer;
begin
  iQuantidadeItens := 0;
  Nfe.NotasFiscais.Clear;
  if not NFe.NotasFiscais.LoadFromFile(aFileName, false) then
    Exit;

  DataEmissao             := NFe.NotasFiscais.Items[0].NFe.Ide.dEmi;
  iNumeroNFe              := NFe.NotasFiscais.Items[0].NFe.Ide.nNF;
  sSerieNFe               := IntToStr(NFe.NotasFiscais.Items[0].NFe.Ide.serie);
  sChaveAcesso            := copy(NFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44);
  sCNPJ                   := NFe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
  ValorTotal              := NFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
  ValorTotalItens         := NFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vProd;
  sEmitente               := NFe.NotasFiscais.Items[0].NFe.Emit.xNome;
  sDestinatario           := NFe.NotasFiscais.Items[0].NFe.Dest.xNome;
  sArquivoXML             := NFe.NotasFiscais.Items[0].XML;
  for i := 0 to NFe.NotasFiscais.Items[0].NFe.Det.Count -1 do
  begin
    with NFe.NotasFiscais.Items[0].NFe.Det do
    begin
      iQuantidadeItens  := iQuantidadeItens  + 1;
    end;
  end;

  lbEmitente.Caption        := copy(sEmitente, 0, 40);
  lbEmitente.Visible        := True;
  lbNumeroNFe.Caption       := intToStr(iNumeroNFe);
  lbNumeroNFe.Visible       := True;
  lbDestinatario.Caption    := copy(sDestinatario, 0, 40);
  lbDestinatario.Visible    := True;
  lbQuantidadeItens.Caption := inttostr(iQuantidadeItens);
  lbQuantidadeItens.Visible := True;
  lbChave.Caption           := formatarChaveAcesso(sChaveAcesso);
  lbChave.Visible           := True;
  lbValorNota.Caption       := 'R$ '+ FormatFloat('#,0.00', ValorTotal);
  lbValorNota.Visible       := True;
  lbValorItens.Caption      := 'R$ '+ FormatFloat('#,0.00', ValorTotalItens);
  lbValorItens.Visible      := True;
end;


procedure TfrmMain.Label2Click(Sender: TObject);
begin
  rbRetrato.Checked := not rbRetrato.Checked;
end;

procedure TfrmMain.Label3Click(Sender: TObject);
begin
  rbPaisagem.Checked := not rbPaisagem.Checked;
end;

procedure TfrmMain.lbExtratorClick(Sender: TObject);
begin
  PageControl1.ActivePage := PageControl1.Pages[2];
end;

procedure TfrmMain.lbExtratorMouseLeave(Sender: TObject);
begin
  LeaveLabel(TLabel(Sender));
end;

procedure TfrmMain.lbExtratorMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveLabel(TLabel(Sender));
end;

procedure TfrmMain.lbGeraDanfeClick(Sender: TObject);
begin
  PageControl1.ActivePage := PageControl1.Pages[1];
end;

procedure TfrmMain.lbGeraDanfeMouseLeave(Sender: TObject);
begin
  LeaveLabel(TLabel(Sender));
end;

procedure TfrmMain.lbGeraDanfeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveLabel(TLabel(Sender));
end;

procedure TfrmMain.lbInicioClick(Sender: TObject);
begin
  PageControl1.ActivePage := PageControl1.Pages[0];
end;

procedure TfrmMain.lbInicioMouseLeave(Sender: TObject);
begin
  LeaveLabel(TLabel(Sender));
end;

procedure TfrmMain.lbInicioMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveLabel(TLabel(Sender));
end;

procedure TfrmMain.lbParametrosClick(Sender: TObject);
begin
  if paginaParametro then
    PageControl1.ActivePage := PageControl1.Pages[3];
end;

procedure TfrmMain.pnBarraSuperiorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmMain.pnbGeraDanfeClick(Sender: TObject);
var
 NomeArquivo, sPath: string;
begin
  NFe.NotasFiscais.Clear;
  Try
    if sArquivoXML <> '' then
    begin
      VerificaOrientacao;
      GeraPDF;
    end
    else
      MessageDlg('É necessário importar um arquivo XML para gerar o DANFe.', mtInformation, [mbOK], 0);
  Finally
    sPath := '';
  End;

end;

procedure TfrmMain.pnbGeraDanfeMouseLeave(Sender: TObject);
begin
  LeaveBtnPanel(TPanel(Sender));
end;

procedure TfrmMain.pnbGeraDanfeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveBtnPanel(TPanel(Sender));
end;

procedure TfrmMain.pnbSvParamDANFeClick(Sender: TObject);
begin
  FPath := edDirPDF.Text;
  DANFE.Logo := edImgLogo.Text;
  MEssagedlg('Parametros salvos', mtinformation, [mbok], 0);
end;

procedure TfrmMain.pnbSvParamDANFeMouseLeave(Sender: TObject);
begin
  LeaveBtnPanel(TPanel(Sender));
end;

procedure TfrmMain.pnbSvParamDANFeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  MoveBtnPanel(TPanel(Sender));
end;

procedure TfrmMain.sbBuscaLogoClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  try
    Filter := 'Imagens | *.bmp';
    DefaultExt := '*.bmp';
    if Execute then
      edImgLogo.Text := FileName;
  finally

  end;
end;

procedure TfrmMain.sbDirPDFClick(Sender: TObject);
begin
  sPathTemp := '';
  with TFileOpenDialog.Create(nil) do
  try
    Title := 'Select Directory';
    Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
    OkButtonLabel := 'Selecionar';
    DefaultFolder := '%USERPROFILE%\Documents';
    if Execute then
      edDirPDF.Text := FileName;
  finally
    Free;
  end
end;


procedure TfrmMain.Panel14Click(Sender: TObject);
begin
  if Dados.OpenDialog.Execute then
    ImportaLoteXML(Dados.OpenDialog.FileName);
end;

procedure TfrmMain.Panel6Click(Sender: TObject);
begin
  if Dados.OpenDialog.Execute then
    ImportaXML(Dados.OpenDialog.FileName);
end;

procedure TfrmMain.Panel6MouseLeave(Sender: TObject);
begin
  LeaveBtnPanel(TPanel(Sender));
end;

procedure TfrmMain.Panel6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveBtnPanel(TPanel(Sender));
end;

end.
