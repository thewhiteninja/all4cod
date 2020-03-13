object Form21: TForm21
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nouveau projet'
  ClientHeight = 335
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 416
    Top = 176
    Width = 72
    Height = 72
    Center = True
    Proportional = True
  end
  object Label1: TLabel
    Left = 417
    Top = 205
    Width = 71
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Icone'
    Transparent = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 316
    Width = 529
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 161
    Height = 316
    Align = alLeft
    Caption = 'Dossiers'
    TabOrder = 1
    object ShellTreeView1: TShellTreeView
      Left = 2
      Top = 15
      Width = 157
      Height = 299
      AutoContextMenus = False
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      ShellListView = ShellListView1
      UseShellImages = True
      Align = alClient
      AutoRefresh = True
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 240
    Top = 288
    Width = 97
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 360
    Top = 288
    Width = 97
    Height = 25
    Caption = 'Annuler'
    TabOrder = 3
    OnClick = Button2Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 168
    Top = 176
    Width = 201
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Nom :'
    TabOrder = 4
  end
  object LabeledEdit2: TLabeledEdit
    Left = 168
    Top = 216
    Width = 201
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Auteur :'
    TabOrder = 5
  end
  object LabeledEdit3: TLabeledEdit
    Left = 168
    Top = 256
    Width = 201
    Height = 21
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'Date'
    TabOrder = 6
  end
  object Button3: TButton
    Left = 400
    Top = 258
    Width = 49
    Height = 17
    Caption = 'Aucune'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 456
    Top = 258
    Width = 49
    Height = 17
    Caption = '...'
    TabOrder = 8
    OnClick = Button4Click
  end
  object GroupBox2: TGroupBox
    Left = 165
    Top = 0
    Width = 363
    Height = 153
    Caption = 'Templates'
    TabOrder = 9
    object ShellListView1: TShellListView
      Left = 2
      Top = 15
      Width = 359
      Height = 136
      AutoContextMenus = False
      AutoRefresh = True
      ObjectTypes = [otNonFolders]
      Root = 'rfDesktop'
      ShellTreeView = ShellTreeView1
      Sorted = True
      Align = alClient
      OnClick = ShellListView1Click
      ReadOnly = False
      HideSelection = False
      TabOrder = 0
    end
  end
end
