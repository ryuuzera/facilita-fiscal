unit FacilitaFiscal.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, ACBrNFeDANFEFR, ACBrDFe, ACBrNFe, FaciliaDanfe.Controller.Dados,
  FacilitaDanfe.Controller.Biblioteca,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, ACBrGIF;

type
  TfrmMain = class(TForm)
    Panel2: TPanel;
    pnBarraSuperior: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    pnMain: TPanel;
    pnCenter: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    Image3: TImage;
    Label6: TLabel;
    TabSheet3: TTabSheet;
    Panel8: TPanel;
    Image4: TImage;
    Label5: TLabel;
    pnTop: TPanel;
    lbInicio: TLabel;
    lbGeraDanfe: TLabel;
    lbExtrator: TLabel;
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
  private
    { Private declarations }
    Timer: TTimer;
    NFe: TACBrNFe;
    DANFe: TACBrNFeDANFEFR;
    iNumeroNFe : integer;
    ValorTotal : Double;
    ValorTotalItens : Double;
    DataEmissao: TDate;
    sSerieNFe,
    sChaveAcesso,
    sEmitente,
    sDestinatario,
    sCNPJ,
    XML,
    sArquivoXML: String;
    procedure importaXML(aFileName: string);
    procedure carregaConfiguracoes;
    procedure aplicaEstilos;
    procedure LeaveLabel(aLabel : TLabel);
    procedure MoveLabel(aLabel : TLabel);
    procedure LeaveBtnPanel(aPanel : TPanel);
    procedure MoveBtnPanel(aPanel : TPanel);
    procedure FadeIn;
    procedure OnTimer(Sender:TObject);
    function formatarChaveAcesso(aChave: String): string;
  public
    { Public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

uses
  pcnConversao, FacilitaFiscal.View.Styles.Colors;

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

procedure TfrmMain.carregaConfiguracoes;
begin
  NFE.DANFE := DANFE;
  NFe.NotasFiscais.Clear;
  NFe.Configuracoes.WebServices.Ambiente := taProducao ;
  DANFE.Site := 'fmsoftware.online';
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
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
   try
    close;
  finally
    freeandnil(frmMain);
  end;
end;

procedure TfrmMain.importaXML;
begin
    Nfe.NotasFiscais.Clear;
    if not NFe.NotasFiscais.LoadFromFile(aFileName, false) then
      Exit;

    DataEmissao             := NFe.NotasFiscais.Items[0].NFe.Ide.dEmi;
    iNumeroNFe              := NFe.NotasFiscais.Items[0].NFe.Ide.nNF;
    sSerieNFe               := IntToStr(NFe.NotasFiscais.Items[0].NFe.Ide.serie);
    sChaveAcesso            := copy(NFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44);
    ValorTotal              := NFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
    ValorTotalItens         := NFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vProd;
    sEmitente               := NFe.NotasFiscais.Items[0].NFe.Emit.xNome;
    sDestinatario           := NFe.NotasFiscais.Items[0].NFe.Dest.xNome;
    sArquivoXML             := NFe.NotasFiscais.Items[0].XML;

    lbEmitente.Caption      := copy(sEmitente, 0, 40);
    lbEmitente.Visible      := True;
    lbDestinatario.Caption  := copy(sDestinatario, 0, 40);
    lbDestinatario.Visible  := True;
    lbChave.Caption         := formatarChaveAcesso(sChaveAcesso);
    lbChave.Visible         := True;
    lbValorNota.Caption     := 'R$ '+ FormatFloat('#,0.00', ValorTotal);
    lbValorNota.Visible     := True;
    lbValorItens.Caption    := 'R$ '+ FormatFloat('#,0.00', ValorTotalItens);
    lbValorItens.Visible    := True;

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
 sXML, NomeArquivo: string;
 SaveDialog: TSaveDialog;
begin
  Try
    SaveDialog := TSaveDialog.Create(nil);
    if sArquivoXML <> '' then
    begin
    if rbPaisagem.checked then
        DANFE.FastFile := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DANFePaisagem.fr3';
      if rbRetrato.Checked then
        DANFE.FastFile := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DANFeRetrato.fr3';
      sXML := sArquivoXML;
      NFe.NotasFiscais.LoadFromString(sXML);
      ForceDirectories('C:\temp');
      NFe.DANFE.PathPDF := ('C:\temp\' + sChaveAcesso + '-nfe.PDF');
      NFe.NotasFiscais.ImprimirPDF;
      Biblioteca.AbrirArquivo('C:\temp\' + sChaveAcesso + '-nfe.PDF');
//      if SaveDialog.Execute then
//      begin
//        SaveDialog.DefaultExt := '.PDF';
//        NFe.DANFE.PathPDF := SaveDialog.FileName;
//        NFe.NotasFiscais.ImprimirPDF;
//      end;

    end
    else
      MessageDlg('É necessário importar um arquivo XML para gerar o DANFe.', mtInformation, [mbOK], 0);
  Finally
    FreeAndNil(SaveDialog);
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
