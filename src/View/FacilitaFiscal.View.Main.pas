unit FacilitaFiscal.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, ACBrNFeDANFEFR, ACBrDFe, ACBrNFe, FaciliaDanfe.Controller.Dados,
  Vcl.StdCtrls, Vcl.Imaging.jpeg;

type
  TfrmMain = class(TForm)
    pnMain: TPanel;
    pnCenter: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    pnbGeraDanfe: TPanel;
    rbRetrato: TRadioButton;
    rbPaisagem: TRadioButton;
    Panel6: TPanel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    pnTop: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    lbInicio: TLabel;
    lbGeraDanfe: TLabel;
    lbExtrator: TLabel;
    procedure pnbGeraDanfeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
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
  private
    { Private declarations }
    NFe: TACBrNFe;
    DANFe: TACBrNFeDANFEFR;
    iNumeroNFe : integer;
    ValorTotal : Double;
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
  public
    { Public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

uses
  pcnConversao, FacilitaFiscal.View.Styles.Colors, Winapi.ShellAPI;

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
    end;


  end;
end;

procedure TfrmMain.LeaveLabel(aLabel: TLabel);
begin
   aLabel.Font.Color := COLOR_WHITE;
end;

procedure TfrmMain.MoveLabel(aLabel : TLabel);
begin
  aLabel.Font.Color := COLOR_HIGHLIGHT_MAIN;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  close;
  freeandnil(self);
end;

procedure TfrmMain.carregaConfiguracoes;
begin
  NFE.DANFE := DANFE;
  NFe.NotasFiscais.Clear;
  NFe.Configuracoes.WebServices.Ambiente := taProducao ;
  DANFE.Site := 'fmsoftware.online';
  DANFE.Sistema := 'Facilita Fiscal v1.0';
  DANFE.PathPDF := 'C:\Projetos';
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    NFe := TACBrNFe.Create(nil);
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

procedure TfrmMain.importaXML;
begin
    Nfe.NotasFiscais.Clear;
    if not NFe.NotasFiscais.LoadFromFile(aFileName, false) then
      Exit;

    DataEmissao           := NFe.NotasFiscais.Items[0].NFe.Ide.dEmi;
    iNumeroNFe            := NFe.NotasFiscais.Items[0].NFe.Ide.nNF;
    sSerieNFe             := IntToStr(NFe.NotasFiscais.Items[0].NFe.Ide.serie);
    sChaveAcesso          := copy(NFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44);
    ValorTotal            := NFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
    sEmitente             := NFe.NotasFiscais.Items[0].NFe.Emit.xNome;
    sDestinatario         := NFe.NotasFiscais.Items[0].NFe.Dest.CNPJCPF;
    sArquivoXML           := NFe.NotasFiscais.Items[0].XML;
end;


procedure TfrmMain.lbExtratorMouseLeave(Sender: TObject);
begin
  LeaveLabel(lbExtrator);
end;

procedure TfrmMain.lbExtratorMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveLabel(lbExtrator);
end;

procedure TfrmMain.lbGeraDanfeMouseLeave(Sender: TObject);
begin
  LeaveLabel(lbGeraDanfe);
end;

procedure TfrmMain.lbGeraDanfeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveLabel(lbGeraDanfe);
end;

procedure TfrmMain.lbInicioMouseLeave(Sender: TObject);
begin
  LeaveLabel(lbInicio);
end;

procedure TfrmMain.lbInicioMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  MoveLabel(lbInicio);
end;

procedure TfrmMain.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
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
      ShellExecute(Handle, nil, PChar('C:\temp\' + sChaveAcesso + '-nfe.PDF'), nil, nil, SW_SHOWNORMAL)
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

procedure TfrmMain.Panel6Click(Sender: TObject);
begin
  if Dados.OpenDialog.Execute then
    ImportaXML(Dados.OpenDialog.FileName);
end;

end.
