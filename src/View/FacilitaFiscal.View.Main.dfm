object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Facilita Fiscal'
  ClientHeight = 558
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Tag = 4
    Left = 0
    Top = 0
    Width = 755
    Height = 558
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 0
    object pnBarraSuperior: TPanel
      Tag = 3
      Left = 2
      Top = 2
      Width = 751
      Height = 21
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnBackground'
      Color = 855309
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      OnMouseDown = pnBarraSuperiorMouseDown
      object Panel3: TPanel
        Left = 724
        Top = 0
        Width = 27
        Height = 21
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 0
        object Image2: TImage
          Left = 7
          Top = 3
          Width = 16
          Height = 16
          Cursor = crHandPoint
          AutoSize = True
          Center = True
          Picture.Data = {
            }
          OnClick = Image2Click
        end
      end
      object Panel13: TPanel
        Left = 697
        Top = 0
        Width = 27
        Height = 21
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 1
        object Image5: TImage
          Left = 11
          Top = 3
          Width = 16
          Height = 16
          Cursor = crHandPoint
          AutoSize = True
          Center = True
          Picture.Data = {
            }
          OnClick = Image2Click
        end
      end
    end
    object pnMain: TPanel
      Left = 2
      Top = 23
      Width = 751
      Height = 533
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnCenter'
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object pnCenter: TPanel
        Left = -8
        Top = -12
        Width = 763
        Height = 593
        BevelOuter = bvNone
        Caption = 'pnCenter'
        Color = 7824734
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object PageControl1: TPageControl
          Left = -6
          Top = 15
          Width = 800
          Height = 554
          ActivePage = tabExtrator
          TabOrder = 1
          object TabInicio: TTabSheet
            Caption = 'TabInicio'
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 792
              Height = 526
              Align = alClient
              BevelOuter = bvNone
              Caption = 'pnCenter'
              Color = 7824734
              ParentBackground = False
              ShowCaption = False
              TabOrder = 0
              object Label6: TLabel
                Left = 304
                Top = 224
                Width = 154
                Height = 13
                Caption = 'PAGINA EM DESENVOLVIMENTO'
              end
            end
          end
          object tabGeraDanfe: TTabSheet
            Caption = 'tabGeraDanfe'
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 792
              Height = 526
              Align = alClient
              BevelOuter = bvNone
              Caption = 'pnCenter'
              Color = 7824734
              ParentBackground = False
              ShowCaption = False
              TabOrder = 0
              object Image1: TImage
                Left = 0
                Top = 0
                Width = 792
                Height = 526
                Align = alClient
                Picture.Data = {
                  }
                Stretch = True
                ExplicitWidth = 4000
                ExplicitHeight = 2667
              end
              object Label1: TLabel
                Left = 575
                Top = 72
                Width = 103
                Height = 17
                Caption = 'Orienta'#231#227'o DANFe'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 598
                Top = 105
                Width = 39
                Height = 17
                Cursor = crHandPoint
                Caption = 'Retrato'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                OnClick = Label2Click
              end
              object Label3: TLabel
                Left = 596
                Top = 135
                Width = 59
                Height = 17
                Cursor = crHandPoint
                Caption = 'Paisagem'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Label3Click
              end
              object lbTitulo: TLabel
                Left = 58
                Top = 32
                Width = 144
                Height = 17
                Caption = 'Dados Arquivo Importado:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Tag = 1
                Left = 58
                Top = 176
                Width = 137
                Height = 17
                Caption = 'Quantidade de Produtos:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label7: TLabel
                Tag = 1
                Left = 58
                Top = 208
                Width = 112
                Height = 17
                Caption = 'Valor Total dos Itens:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label8: TLabel
                Tag = 1
                Left = 59
                Top = 113
                Width = 53
                Height = 17
                Caption = 'Emitente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label9: TLabel
                Tag = 1
                Left = 58
                Top = 143
                Width = 68
                Height = 17
                Caption = 'Destinat'#225'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label10: TLabel
                Tag = 1
                Left = 58
                Top = 248
                Width = 106
                Height = 17
                Caption = 'Valor Total da Nota:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object lbEmitente: TLabel
                Tag = 1
                Left = 223
                Top = 113
                Width = 27
                Height = 17
                Caption = 'texto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object lbDestinatario: TLabel
                Tag = 1
                Left = 223
                Top = 143
                Width = 27
                Height = 17
                Caption = 'texto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object lbQuantidadeItens: TLabel
                Tag = 1
                Left = 223
                Top = 176
                Width = 21
                Height = 17
                Caption = '000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object lbValorItens: TLabel
                Tag = 1
                Left = 223
                Top = 208
                Width = 49
                Height = 17
                Caption = 'R$ 0,000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object lbValorNota: TLabel
                Tag = 1
                Left = 223
                Top = 248
                Width = 49
                Height = 17
                Caption = 'R$ 0,000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object lbChave: TLabel
                Tag = 1
                Left = 58
                Top = 288
                Width = 21
                Height = 17
                Caption = '000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object Label19: TLabel
                Tag = 1
                Left = 59
                Top = 83
                Width = 74
                Height = 17
                Caption = 'Numero NFe:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object lbNumeroNFe: TLabel
                Tag = 1
                Left = 223
                Top = 83
                Width = 21
                Height = 17
                Caption = '000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object pnbGeraDanfe: TPanel
                Tag = 1
                Left = 526
                Top = 409
                Width = 185
                Height = 41
                BevelOuter = bvNone
                Caption = 'Gerar DANFe'
                Color = 4854649
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clHighlightText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                OnClick = pnbGeraDanfeClick
                OnMouseLeave = pnbGeraDanfeMouseLeave
                OnMouseMove = pnbGeraDanfeMouseMove
              end
              object rbRetrato: TRadioButton
                Left = 575
                Top = 108
                Width = 17
                Height = 22
                Cursor = crHandPoint
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Segoe UI Semibold'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                TabStop = True
              end
              object rbPaisagem: TRadioButton
                Left = 575
                Top = 138
                Width = 15
                Height = 22
                Cursor = crHandPoint
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Segoe UI Semibold'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object Panel6: TPanel
                Tag = 1
                Left = 526
                Top = 362
                Width = 185
                Height = 41
                BevelOuter = bvNone
                Caption = 'Importar XML'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clHighlightText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 3
                OnClick = Panel6Click
                OnMouseLeave = Panel6MouseLeave
                OnMouseMove = Panel6MouseMove
              end
            end
          end
          object tabExtrator: TTabSheet
            Caption = 'tabExtrator'
            ImageIndex = 2
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 792
              Height = 526
              Align = alClient
              BevelOuter = bvNone
              Caption = 'pnCenter'
              Color = 7824734
              ParentBackground = False
              ShowCaption = False
              TabOrder = 0
              object Image8: TImage
                Left = 0
                Top = 0
                Width = 792
                Height = 526
                Align = alClient
                Picture.Data = {
                  }
                Stretch = True
                ExplicitLeft = 10
              end
              object Label11: TLabel
                Left = 82
                Top = 40
                Width = 55
                Height = 13
                Caption = 'Parametros'
              end
              object Label12: TLabel
                Left = 82
                Top = 80
                Width = 42
                Height = 17
                Caption = 'DANFe:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label13: TLabel
                Left = 82
                Top = 112
                Width = 123
                Height = 17
                Caption = 'Diret'#243'rio Arquivo PDF:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label14: TLabel
                Left = 82
                Top = 176
                Width = 71
                Height = 17
                Caption = 'Utilizar Logo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Image6: TImage
                Left = 275
                Top = 139
                Width = 16
                Height = 16
                Cursor = crHandPoint
                AutoSize = True
                Center = True
                Picture.Data = {
                  }
                OnClick = Image2Click
              end
              object Image7: TImage
                Left = 275
                Top = 200
                Width = 16
                Height = 16
                Cursor = crHandPoint
                AutoSize = True
                Center = True
                Picture.Data = {
                  }
                Stretch = True
                OnClick = Image2Click
              end
              object sbDirPDF: TSpeedButton
                Left = 271
                Top = 135
                Width = 23
                Height = 22
                Cursor = crHandPoint
                Flat = True
                OnClick = sbDirPDFClick
              end
              object sbBuscaLogo: TSpeedButton
                Left = 271
                Top = 196
                Width = 23
                Height = 22
                Cursor = crHandPoint
                Flat = True
                OnClick = sbBuscaLogoClick
              end
              object edDirPDF: TEdit
                Left = 82
                Top = 135
                Width = 185
                Height = 18
                BorderStyle = bsNone
                Color = 3684408
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                Font.Quality = fqClearType
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                TextHint = 'Insira o diret'#243'rio'
              end
              object Panel7: TPanel
                Tag = 1
                Left = 82
                Top = 156
                Width = 185
                Height = 1
                BevelOuter = bvNone
                Caption = 'Panel7'
                Color = 4194432
                ParentBackground = False
                ShowCaption = False
                TabOrder = 1
              end
              object edImgLogo: TEdit
                Left = 82
                Top = 199
                Width = 185
                Height = 22
                BorderStyle = bsNone
                Color = 3158064
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                Font.Quality = fqClearType
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 2
                TextHint = 'Buscar Imagem (*.bmp)'
              end
              object Panel9: TPanel
                Tag = 1
                Left = 82
                Top = 220
                Width = 185
                Height = 1
                BevelOuter = bvNone
                Caption = 'Panel7'
                Color = 4194432
                ParentBackground = False
                ShowCaption = False
                TabOrder = 3
              end
              object pnbSvParamDANFe: TPanel
                Tag = 1
                Left = 608
                Top = 424
                Width = 103
                Height = 34
                BevelOuter = bvNone
                Caption = 'Salvar '
                Color = 4854649
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clHighlightText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 4
                OnClick = pnbSvParamDANFeClick
                OnMouseLeave = pnbSvParamDANFeMouseLeave
                OnMouseMove = pnbSvParamDANFeMouseMove
              end
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'TabParametrosLote'
            ImageIndex = 4
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 792
              Height = 526
              Align = alClient
              BevelOuter = bvNone
              Caption = 'pnCenter'
              Color = 7824734
              ParentBackground = False
              ShowCaption = False
              TabOrder = 0
              object Image4: TImage
                Left = 0
                Top = 0
                Width = 792
                Height = 526
                Align = alClient
                Center = True
                Picture.Data = {
                  }
                Stretch = True
                ExplicitLeft = 10
              end
              object Label15: TLabel
                Left = 82
                Top = 40
                Width = 55
                Height = 13
                Caption = 'Parametros'
              end
              object Label16: TLabel
                Left = 82
                Top = 80
                Width = 52
                Height = 17
                Caption = 'Lote XML'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label17: TLabel
                Left = 82
                Top = 112
                Width = 176
                Height = 17
                Caption = 'Diret'#243'rio Arquivo Listagem PDF:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Label18: TLabel
                Left = 82
                Top = 176
                Width = 4
                Height = 17
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                ParentFont = False
              end
              object Edit3: TEdit
                Left = 82
                Top = 135
                Width = 185
                Height = 18
                BorderStyle = bsNone
                Color = 3684408
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                Font.Quality = fqClearType
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                TextHint = 'Insira o diret'#243'rio'
              end
              object Panel11: TPanel
                Tag = 1
                Left = 82
                Top = 156
                Width = 185
                Height = 1
                BevelOuter = bvNone
                Caption = 'Panel7'
                Color = 4194432
                ParentBackground = False
                ShowCaption = False
                TabOrder = 1
              end
              object Edit4: TEdit
                Left = 82
                Top = 199
                Width = 185
                Height = 22
                BorderStyle = bsNone
                Color = 3158064
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI Light'
                Font.Style = []
                Font.Quality = fqClearType
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 2
                TextHint = 'Buscar Imagem (*.bmp)'
              end
              object Panel12: TPanel
                Tag = 1
                Left = 82
                Top = 220
                Width = 185
                Height = 1
                BevelOuter = bvNone
                Caption = 'Panel7'
                Color = 4194432
                ParentBackground = False
                ShowCaption = False
                TabOrder = 3
              end
            end
          end
        end
        object pnTop: TPanel
          Tag = 2
          Left = 0
          Top = 0
          Width = 763
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnBackground'
          Color = 4932157
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object lbInicio: TLabel
            Tag = 1
            Left = 56
            Top = 20
            Width = 25
            Height = 13
            Caption = 'Inicio'
            OnClick = lbInicioClick
            OnMouseMove = lbInicioMouseMove
            OnMouseLeave = lbInicioMouseLeave
          end
          object lbGeraDanfe: TLabel
            Tag = 1
            Left = 166
            Top = 20
            Width = 63
            Height = 13
            Caption = 'Gerar DANFe'
            OnClick = lbGeraDanfeClick
            OnMouseMove = lbGeraDanfeMouseMove
            OnMouseLeave = lbGeraDanfeMouseLeave
          end
          object lbExtrator: TLabel
            Tag = 1
            Left = 306
            Top = 20
            Width = 91
            Height = 13
            Caption = 'Extrator Lotes XML'
            OnClick = lbExtratorClick
            OnMouseMove = lbExtratorMouseMove
            OnMouseLeave = lbExtratorMouseLeave
          end
          object lbParametros: TLabel
            Tag = 1
            Left = 654
            Top = 20
            Width = 55
            Height = 13
            Caption = 'Parametros'
            OnClick = lbParametrosClick
            OnMouseMove = lbExtratorMouseMove
            OnMouseLeave = lbExtratorMouseLeave
          end
        end
      end
    end
  end
end
