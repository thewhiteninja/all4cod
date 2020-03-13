object Form11: TForm11
  Left = 169
  Top = 264
  Width = 589
  Height = 375
  Caption = 'Aper'#231'u avant impression'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 322
    Width = 581
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 532
      Top = 7
      Width = 33
      Height = 13
      Caption = 'Zoom :'
    end
    object Button1: TButton
      Left = 3
      Top = 2
      Width = 75
      Height = 23
      Caption = 'Premi'#232're'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 81
      Top = 2
      Width = 75
      Height = 23
      Caption = 'Pr'#233'c'#233'dente'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 159
      Top = 2
      Width = 75
      Height = 23
      Caption = 'Suivante'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 237
      Top = 2
      Width = 75
      Height = 23
      Caption = 'Derni'#232're'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 347
      Top = 2
      Width = 75
      Height = 23
      Caption = 'Imprimer ...'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 425
      Top = 2
      Width = 75
      Height = 23
      Caption = 'Fermer'
      TabOrder = 5
      OnClick = Button6Click
    end
    object ComboBox1: TComboBox
      Left = 568
      Top = 3
      Width = 108
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnSelect = ComboBox1Select
      Items.Strings = (
        'Taille de la page'
        'Page enti'#232're'
        '25%'
        '50%'
        '75%'
        '100%'
        '200%'
        '400%'
        '800%')
    end
  end
  object SynEditPrintPreview1: TSynEditPrintPreview
    Left = 0
    Top = 27
    Width = 581
    Height = 295
    SynEditPrint = Form1.SynEditPrint1
  end
end
