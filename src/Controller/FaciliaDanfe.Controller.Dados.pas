unit FaciliaDanfe.Controller.Dados;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe, Vcl.Dialogs,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Data.DB, Datasnap.DBClient;

type
  TDados = class(TDataModule)
    NotaFiscal: TACBrNFe;
    OpenDialog: TOpenDialog;
    dsCupons: TDataSource;
    cdsCupons: TClientDataSet;
    cdsCuponsNumeroCFe: TStringField;
    cdsCuponsSerieSAT: TStringField;
    cdsCuponsValorTotal: TStringField;
    cdsCuponsDataEmissao: TStringField;
    cdsCuponsHoraEmissao: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
