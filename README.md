# Facilita Fiscal (OpenSource)
<a href="https://github.com/ryuuzera"><img src="https://img.shields.io/github/followers/ryuuzera?label=follow%20me&style=social"></a> <a href="#"><img src="https://img.shields.io/badge/Delphi-10.3.3-red">
 <h6>English/Português(Brasil)<br/></h6>
 <p>Ferramenta Open Source com funcionalidades relacionadas a documentos fiscais (NFe, CFe).<br/><b>Toda interface foi construída utilizando apenas os componentes nativos do Delphi Community 10.3.3 Rio.</b><br/>Algumas funcionalidades dependem dos <a href="https://projetoacbr.com.br/">componentes ACBr.</a>
 <h6>Open Source tool to facilitate brazilian invoice and tax document operations<br/>The entire interface was develop using only VCL Delphi 10.3.3 Rio components.<br/>For extras funcionalities I've use the <a href="https://projetoacbr.com.br/">ACBr lib.</a></h6></p>
 
 <div align="center">
 <p><h4> Fade-in effect when starting (Delphi Native)<h6>Efeito ao passar o mouse sobre os componentes</h6></p></h4>
 <img src="https://github.com/ryuuzera/facilita-fiscal/blob/main/assets/gifs/fade-in.gif"/></div>


 <div align="center">
 <p><h4> Mouse Hover effect (Delphi Native)<h6>Efeito ao passar o mouse sobre os componentes</h6></p></h4>
 <img src="https://github.com/ryuuzera/facilita-fiscal/blob/main/assets/gifs/hover-effects.gif"/>
 </div>
 

 
 <div align="center">
 <p><h4> Invoice XML to DANFe<br/><h6>Conversor XML(NFe) Para DANFe</h6></p></h4>
 <img src="https://github.com/ryuuzera/facilita-fiscal/blob/main/assets/gifs/xml-to-danfe.gif"/>
 </div>
 
 ## Fade-in Effect
 
  
  ```pascal
 {runtime Timer create in OnCreate event}
 procedure form.OnCreate;
 begin
  Timer := TTimer.Create(nil);
  try
   FadeIn; {function}
  except
   {exception}
  end
  
{fadeIn Event} 
procedure FadeIn;
begin
 Self.AlphaBlend := True;
 Self.AlphaBlendValue := 0;
 Timer.OnTimer := OnTimer;
 Timer.Interval := 3;
 Timer.Enabled := True;
end;

{Timer event}
procedure OnTimer(Sender: TObject);
begin
  if Self.AlphaBlendValue > 250 then
  begin
    Self.AlphaBlendValue := 255;
    Timer.Enabled := False;
  end
  else
    Self.AlphaBlendValue := Self.AlphaBlendValue + 17;
end;

end. 
```

## Hover-like effect

  ```pascal
 {Move Leave Events Button / Panels}
 
procedure PanelMouseLeave(Sender: TObject);
begin
  LeaveBtnPanel(TPanel(Sender));
end;
procedure PanelMouseLeave(Sender: TObject);
begin
  MoveBtnPanel(TPanel(Sender));
end;

{functions (Same for Labels, Replacing TPanel for TLabel(aLabel).Font.Color)}
procedure MoveBtnPanel(aPanel: TPanel);
begin
  TPanel(aPanel).Color := COLOR_BUTTON_HOVER;
end;
procedure TfrmMain.LeaveBtnPanel(aPanel: TPanel);
begin
  TPanel(aPanel).Color := COLOR_BUTTON;
end;

{I Have create a Styles Class to able change the font sizes, colors and the style of interface at the same time}

unit FacilitaFiscal.View.Styles.Colors;
interface
  const
  H0 = 28;
  H1 = 24;
  H2 = 18;
  H3 = 16;
  H4 = 14;
  H5 = 12;
  H6 = 10;
  H7 = 8;
  COLOR_BACKGROUND = $001E1213;
  COLOR_BACKGROUND_DARK = $00110A0B;
  COLOR_HIGHLIGHT_MAIN = $00620FDD;
  COLOR_HILIGHT_SECOND = $004600FA;
  COLOR_BUTTON = $004A1379;
  COLOR_BUTTON_HOVER = $004734FA;
  COLOR_WHITE = $FFFFFF;
  FONT_STANDARD = 'Segoe UI Light';
implementation
end.
 ```
