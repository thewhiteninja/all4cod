object Form4: TForm4
  Left = 136
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nouveau fichier'
  ClientHeight = 334
  ClientWidth = 534
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
    Left = 216
    Top = 8
    Width = 74
    Height = 13
    Caption = 'Nom du fichier :'
  end
  object Label2: TLabel
    Left = 264
    Top = 48
    Width = 206
    Height = 13
    Caption = '(Le fichier sera cr'#233#233' lors de l'#39'enregistrement)'
  end
  object Label3: TLabel
    Left = 216
    Top = 72
    Width = 40
    Height = 13
    Caption = 'Aper'#231'u :'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 315
    Width = 534
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 209
    Height = 315
    ActivePage = TabSheet2
    Align = alLeft
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Fichier vide'
      object ListBox1: TListBox
        Left = 0
        Top = 48
        Width = 201
        Height = 241
        Enabled = False
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object RadioButton2: TRadioButton
        Left = 16
        Top = 24
        Width = 185
        Height = 17
        Caption = 'Utiliser un colorateur syntaxique'
        TabOrder = 1
        OnClick = RadioButton2Click
      end
      object RadioButton1: TRadioButton
        Left = 16
        Top = 8
        Width = 113
        Height = 12
        Caption = 'Aucun colorateurs'
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = RadioButton1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Mod'#232'les'
      ImageIndex = 1
      object ShellTreeView1: TShellTreeView
        Left = 0
        Top = 0
        Width = 201
        Height = 287
        AutoContextMenus = False
        ObjectTypes = [otFolders, otNonFolders]
        Root = 'rfDesktop'
        UseShellImages = True
        Align = alClient
        AutoRefresh = True
        Indent = 19
        ParentColor = False
        RightClickSelect = True
        ShowRoot = False
        TabOrder = 0
        OnClick = ShellTreeView1Click
      end
    end
  end
  object Edit1: TEdit
    Left = 216
    Top = 24
    Width = 265
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 489
    Top = 23
    Width = 40
    Height = 23
    Caption = '...'
    TabOrder = 3
    OnClick = Button1Click
  end
  object SynEdit1: TSynEdit
    Left = 216
    Top = 88
    Width = 313
    Height = 193
    ActiveLineColor = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 4
    Gutter.DigitCount = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 0
    Gutter.ShowLineNumbers = True
    MaxScrollWidth = 1
    MaxUndo = 1
    ReadOnly = True
    WordWrap = True
  end
  object Button2: TButton
    Left = 240
    Top = 288
    Width = 121
    Height = 25
    Caption = 'Annuler'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 288
    Width = 121
    Height = 25
    Caption = 'OK'
    TabOrder = 6
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 336
    Top = 64
  end
end
