program FacilitaFiscal;

uses
  Vcl.Forms,
  FacilitaFiscal.View.Main in '..\View\FacilitaFiscal.View.Main.pas' {frmMain},
  FaciliaDanfe.Controller.Dados in '..\Controller\FaciliaDanfe.Controller.Dados.pas' {Dados: TDataModule},
  FacilitaFiscal.View.Styles.Colors in '..\View\Styles\FacilitaFiscal.View.Styles.Colors.pas',
  FacilitaDanfe.Controller.Biblioteca in '..\Controller\FacilitaDanfe.Controller.Biblioteca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDados, Dados);
  Application.Run;
end.
