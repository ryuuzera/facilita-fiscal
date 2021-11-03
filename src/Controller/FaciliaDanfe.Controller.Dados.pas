unit FaciliaDanfe.Controller.Dados;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe, Vcl.Dialogs,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

type
  TDados = class(TDataModule)
    NotaFiscal: TACBrNFe;
    OpenDialog: TOpenDialog;
    XMLDocument: TXMLDocument;
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
