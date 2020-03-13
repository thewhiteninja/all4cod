object Form5: TForm5
  Left = 608
  Top = 34
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Empreinte digitale MD5'
  ClientHeight = 301
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 240
    Width = 51
    Height = 13
    Caption = 'Hash MD5'
  end
  object RadioButton1: TRadioButton
    Left = 12
    Top = 9
    Width = 57
    Height = 12
    Caption = 'Texte'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 12
    Top = 96
    Width = 89
    Height = 15
    Caption = 'Fichier ouvert'
    TabOrder = 1
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 12
    Top = 184
    Width = 113
    Height = 15
    Caption = 'Fichier sur le disque'
    TabOrder = 2
    OnClick = RadioButton3Click
  end
  object RichEdit1: TRichEdit
    Left = 14
    Top = 24
    Width = 361
    Height = 65
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
    OnChange = RichEdit1Change
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 282
    Width = 387
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object ListBox1: TListBox
    Left = 14
    Top = 112
    Width = 363
    Height = 65
    Enabled = False
    ItemHeight = 13
    TabOrder = 5
    OnClick = ListBox1Click
  end
  object Edit1: TEdit
    Left = 14
    Top = 200
    Width = 332
    Height = 21
    Enabled = False
    TabOrder = 6
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 349
    Top = 199
    Width = 28
    Height = 23
    Caption = '...'
    Enabled = False
    TabOrder = 7
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 14
    Top = 256
    Width = 311
    Height = 21
    TabOrder = 8
  end
  object Button2: TButton
    Left = 328
    Top = 255
    Width = 49
    Height = 23
    Caption = 'Copier'
    TabOrder = 9
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Tous les fichiers|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Ouvrir un fichier ...'
    Left = 248
    Top = 40
  end
end
