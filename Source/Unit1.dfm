object Form1: TForm1
  Left = 79
  Top = 124
  Width = 913
  Height = 764
  Caption = 'All4Cod'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  WindowMenu = Fentre1
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 225
    Top = 86
    Width = 5
    Height = 582
  end
  object Splitter2: TSplitter
    Left = 762
    Top = 86
    Width = 5
    Height = 582
    Align = alRight
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 691
    Width = 905
    Height = 19
    AutoHint = True
    Panels = <>
    SimplePanel = True
    SimpleText = 'Enregistrer'
  end
  object Panel1: TPanel
    Left = 0
    Top = 86
    Width = 225
    Height = 582
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    OnCanResize = Panel1CanResize
    object Splitter4: TSplitter
      Left = 0
      Top = 161
      Width = 225
      Height = 4
      Cursor = crVSplit
      Align = alTop
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 165
      Width = 225
      Height = 417
      ActivePage = TabSheet1
      Align = alClient
      Images = ImageList1
      MultiLine = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Explorateur'
        ImageIndex = 43
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 217
          Height = 61
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object CheckBox1: TCheckBox
            Left = 8
            Top = 0
            Width = 89
            Height = 17
            Caption = 'Shell Windows'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox1Click
          end
          object CheckBox2: TCheckBox
            Left = 8
            Top = 17
            Width = 145
            Height = 17
            Caption = 'Afficher les fichiers cach'#233's'
            TabOrder = 1
            OnClick = CheckBox2Click
          end
          object ShellComboBox1: TShellComboBox
            Left = 0
            Top = 39
            Width = 217
            Height = 22
            Root = 'rfDesktop'
            ShellTreeView = ShellTreeView1
            UseShellImages = True
            DropDownCount = 8
            TabOrder = 2
          end
        end
        object ShellTreeView1: TShellTreeView
          Left = 0
          Top = 61
          Width = 217
          Height = 327
          ObjectTypes = [otFolders, otNonFolders]
          Root = 'rfDesktop'
          ShellComboBox = ShellComboBox1
          UseShellImages = True
          Align = alClient
          AutoRefresh = True
          Indent = 19
          ParentColor = False
          RightClickSelect = True
          ShowRoot = False
          TabOrder = 1
          OnDblClick = ShellTreeView1DblClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Ouverts'
        ImageIndex = 94
        object Panel4: TPanel
          Left = 0
          Top = 363
          Width = 217
          Height = 25
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Button3: TButton
            Left = 1
            Top = 3
            Width = 158
            Height = 21
            Caption = 'Tout fermer'
            TabOrder = 0
            OnClick = outfermer1Click
          end
        end
        object ListBox3: TListBox
          Left = 0
          Top = 0
          Width = 217
          Height = 363
          Align = alClient
          ItemHeight = 13
          TabOrder = 1
          OnClick = ListBox3Click
          OnDblClick = ListBox3DblClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Notes'
        ImageIndex = 93
        object RichEdit1: TRichEdit
          Left = 0
          Top = 0
          Width = 217
          Height = 363
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object Panel5: TPanel
          Left = 0
          Top = 363
          Width = 217
          Height = 25
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Button4: TButton
            Left = 1
            Top = 3
            Width = 78
            Height = 21
            Caption = 'Ouvrir'
            TabOrder = 0
            OnClick = Button4Click
          end
          object Button6: TButton
            Left = 82
            Top = 3
            Width = 78
            Height = 21
            Caption = 'Effacer'
            TabOrder = 1
            OnClick = Button6Click
          end
        end
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 0
      Width = 225
      Height = 161
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 225
        Height = 161
        Align = alClient
        Caption = 'Projet'
        TabOrder = 0
        object TreeView1: TTreeView
          Left = 2
          Top = 15
          Width = 221
          Height = 144
          Align = alClient
          Images = ImageList1
          Indent = 19
          PopupMenu = PopupMenu6
          TabOrder = 0
          OnClick = TreeView1Click
          OnDblClick = TreeView1DblClick
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 767
    Top = 86
    Width = 138
    Height = 582
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 138
      Height = 582
      Align = alClient
      Caption = 'Mod'#232'les de codes'
      TabOrder = 0
      object Splitter3: TSplitter
        Left = 2
        Top = 177
        Width = 134
        Height = 5
        Cursor = crVSplit
        Align = alTop
      end
      object ListBox1: TListBox
        Left = 2
        Top = 15
        Width = 134
        Height = 162
        Align = alTop
        ItemHeight = 13
        PopupMenu = PopupMenu3
        Sorted = True
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object ListBox2: TListBox
        Left = 2
        Top = 182
        Width = 134
        Height = 398
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
        OnDblClick = ListBox2DblClick
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 621
    Top = 86
    Width = 141
    Height = 582
    Align = alRight
    Caption = 'Table ASCII'
    TabOrder = 3
    Visible = False
    object StringGrid1: TStringGrid
      Left = 2
      Top = 15
      Width = 137
      Height = 565
      Align = alClient
      BorderStyle = bsNone
      ColCount = 3
      DefaultColWidth = 38
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 257
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDrawCell = StringGrid1DrawCell
      OnKeyPress = StringGrid1KeyPress
      ColWidths = (
        40
        39
        39)
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 668
    Width = 905
    Height = 23
    Align = alBottom
    BevelEdges = [beTop, beBottom]
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    object TabControl1: TTabControl
      Left = 0
      Top = 0
      Width = 905
      Height = 23
      Align = alClient
      PopupMenu = PopupMenu4
      Style = tsFlatButtons
      TabHeight = 22
      TabOrder = 0
      TabWidth = 75
      OnChange = TabControl1Change
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 905
    Height = 86
    Align = alTop
    AutoSize = True
    BevelEdges = [beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkSoft
    RowSize = 28
    TabOrder = 5
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 389
      Height = 24
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'Barre Principale'
      Customizable = True
      EdgeBorders = []
      EdgeOuter = esNone
      Images = ImageList1
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 2
        AutoSize = True
        Caption = 'Fichier vide'
        ImageIndex = 62
        MenuItem = Fichiervide1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 2
        Hint = 'Ouvrir ...'
        Caption = 'Ouvrir ...'
        DropdownMenu = PopupMenu1
        ImageIndex = 66
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = Ouvrir1Click
      end
      object ToolButton3: TToolButton
        Left = 60
        Top = 2
        Hint = 'Enregistrer'
        AutoSize = True
        Caption = 'Enregistrer'
        ImageIndex = 39
        MenuItem = Enregistrer1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 83
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 91
        Top = 2
        Hint = 'Enregistrer-sous ...'
        Caption = 'Enregistrer-sous ...'
        ImageIndex = 40
        MenuItem = Enregistrersous1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton6: TToolButton
        Left = 115
        Top = 2
        Hint = 'Tout enregistrer'
        Caption = 'Tout enregistrer'
        ImageIndex = 77
        MenuItem = outenregsitrer1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton7: TToolButton
        Left = 139
        Top = 2
        Hint = 'Fermer'
        Caption = 'Fermer'
        ImageIndex = 46
        MenuItem = Fermer1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton8: TToolButton
        Left = 163
        Top = 2
        Hint = 'Tout fermer'
        Caption = 'Tout fermer'
        ImageIndex = 78
        MenuItem = outfermer1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton9: TToolButton
        Left = 187
        Top = 2
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton10: TToolButton
        Left = 195
        Top = 2
        Hint = 'Compiler'
        Caption = 'Compiler'
        ImageIndex = 25
        MenuItem = Compiler1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton12: TToolButton
        Left = 219
        Top = 2
        Hint = 'Ex'#233'cuter'
        Caption = 'Ex'#233'cuter'
        ImageIndex = 42
        MenuItem = Excuter2
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton66: TToolButton
        Left = 243
        Top = 2
        Hint = 'Stopper'
        Caption = 'Stopper'
        ImageIndex = 84
        MenuItem = Stopper1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton13: TToolButton
        Left = 267
        Top = 2
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton14: TToolButton
        Left = 275
        Top = 2
        Hint = 'Pr'#233'f'#233'rences'
        Caption = 'Pr'#233'f'#233'rences'
        ImageIndex = 68
        MenuItem = Prfrences1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton15: TToolButton
        Left = 299
        Top = 2
        Width = 8
        Caption = 'ToolButton15'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object ToolButton16: TToolButton
        Left = 307
        Top = 2
        Hint = 'Aper'#231'u avant impression ...'
        Caption = 'Aper'#231'u avant impression ...'
        ImageIndex = 12
        MenuItem = Aperuavantimpression1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton17: TToolButton
        Left = 331
        Top = 2
        Hint = 'Imprimer ...'
        Caption = 'Imprimer ...'
        ImageIndex = 49
        MenuItem = Imprimer1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton18: TToolButton
        Left = 355
        Top = 2
        Width = 8
        Caption = 'ToolButton18'
        ImageIndex = 13
        Style = tbsSeparator
      end
      object ToolButton19: TToolButton
        Left = 363
        Top = 2
        Hint = 'A propos de All4Cod'
        Caption = 'A propos de All4Cod'
        ImageIndex = 13
        MenuItem = AproposdePitiPad1
        ParentShowHint = False
        ShowHint = True
      end
    end
    object ToolBar2: TToolBar
      Left = 620
      Top = 30
      Width = 226
      Height = 24
      Hint = 'Langage'
      ButtonWidth = 24
      Caption = 'Langage'
      Customizable = True
      EdgeBorders = []
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object Panel6: TPanel
        Left = 0
        Top = 2
        Width = 225
        Height = 22
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 5
          Width = 57
          Height = 13
          Caption = 'Language : '
        end
        object ComboBox1: TComboBox
          Left = 62
          Top = 1
          Width = 165
          Height = 21
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnSelect = ComboBox1Select
        end
      end
    end
    object ToolBar6: TToolBar
      Left = 413
      Top = 2
      Width = 194
      Height = 24
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'ToolBar6'
      Customizable = True
      EdgeBorders = []
      Images = ImageList1
      TabOrder = 2
      object ToolButton52: TToolButton
        Left = 0
        Top = 2
        Hint = 'Commande Dos'
        Caption = 'Commande Dos'
        ImageIndex = 24
        MenuItem = CommandeDos1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton53: TToolButton
        Left = 24
        Top = 2
        Hint = 'Correcteur d'#39'orthographe'
        Caption = 'Correcteur d'#39'orthographe'
        ImageIndex = 30
        MenuItem = Correcteurdorthographe1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton54: TToolButton
        Left = 48
        Top = 2
        Hint = 'Table ASCII'
        Caption = 'Table ASCII'
        ImageIndex = 76
        MenuItem = ableASCII1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton55: TToolButton
        Left = 72
        Top = 2
        Hint = 'Evaluateur d'#39'expressions'
        Caption = 'Evaluateur d'#39'expressions'
        ImageIndex = 41
        MenuItem = Evaluateurdexpressions1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton56: TToolButton
        Left = 96
        Top = 2
        Hint = 'Couleurs'
        Caption = 'Couleurs'
        ImageIndex = 31
        MenuItem = Couleurs1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton57: TToolButton
        Left = 120
        Top = 2
        Hint = 'Editer les fichiers syst'#232'mes'
        Caption = 'Editer les fichiers syst'#232'mes'
        ImageIndex = 37
        MenuItem = Editerlesfichierssystmes1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton58: TToolButton
        Left = 144
        Top = 2
        Hint = 'Conversion de bases'
        Caption = 'Conversion de bases'
        ImageIndex = 16
        MenuItem = Conversiondebases1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton59: TToolButton
        Left = 168
        Top = 2
        Hint = '"Empreinte digitale" MD5'
        Caption = '"Empreinte digitale" MD5'
        ImageIndex = 38
        MenuItem = EmpreintedigitaleMD51
        ParentShowHint = False
        ShowHint = True
      end
    end
    object ToolBar3: TToolBar
      Left = 11
      Top = 30
      Width = 290
      Height = 24
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'ToolBar3'
      Customizable = True
      EdgeBorders = []
      Images = ImageList1
      TabOrder = 3
      object ToolButton20: TToolButton
        Left = 0
        Top = 2
        Hint = 'D'#233'faire'
        Caption = 'D'#233'faire'
        ImageIndex = 35
        MenuItem = Dfaire1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton21: TToolButton
        Left = 24
        Top = 2
        Hint = 'Refaire'
        Caption = 'Refaire'
        ImageIndex = 72
        MenuItem = Refaire1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton22: TToolButton
        Left = 48
        Top = 2
        Width = 8
        Caption = 'ToolButton22'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton23: TToolButton
        Left = 56
        Top = 2
        Hint = 'Couper'
        Caption = 'Couper'
        ImageIndex = 32
        MenuItem = Couper1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton24: TToolButton
        Left = 80
        Top = 2
        Hint = 'Copier'
        Caption = 'Copier'
        ImageIndex = 28
        MenuItem = Copier1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton25: TToolButton
        Left = 104
        Top = 2
        Hint = 'Coller'
        Caption = 'Coller'
        ImageIndex = 22
        MenuItem = Coller1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton26: TToolButton
        Left = 128
        Top = 2
        Hint = 'Supprimer'
        Caption = 'Supprimer'
        ImageIndex = 75
        MenuItem = Supprimer1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton27: TToolButton
        Left = 152
        Top = 2
        Hint = 'Tout s'#233'lectionner'
        Caption = 'Tout s'#233'lectionner'
        ImageIndex = 79
        MenuItem = outslectionner1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton28: TToolButton
        Left = 176
        Top = 2
        Width = 8
        Caption = 'ToolButton28'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton29: TToolButton
        Left = 184
        Top = 2
        Hint = 'Voir le Presse-papiers'
        Caption = 'Voir le Presse-papiers'
        ImageIndex = 69
        MenuItem = VoirlePressepapiers1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton30: TToolButton
        Left = 208
        Top = 2
        Hint = 'Ins'#233'rer Date et Heure'
        Caption = 'Ins'#233'rer Date et Heure'
        ImageIndex = 52
        MenuItem = InsrerDateetHeure1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton31: TToolButton
        Left = 232
        Top = 2
        Hint = 'Trier par ordre croissant'
        Caption = 'Ordre croissant'
        ImageIndex = 80
        MenuItem = Ordrecroissant1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton32: TToolButton
        Left = 256
        Top = 2
        Width = 8
        Caption = 'ToolButton32'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton33: TToolButton
        Left = 264
        Top = 2
        Hint = 'Lecture seule'
        Caption = 'Lecture seule'
        ImageIndex = 53
        MenuItem = Lectureseule1
        ParentShowHint = False
        ShowHint = True
      end
    end
    object ToolBar4: TToolBar
      Left = 11
      Top = 58
      Width = 279
      Height = 24
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'ToolBar4'
      Customizable = True
      EdgeBorders = []
      Images = ImageList1
      TabOrder = 4
      object ToolButton34: TToolButton
        Left = 0
        Top = 2
        Hint = 'Barre d'#39'outils'
        Caption = 'ToolButton34'
        DropdownMenu = PopupMenu2
        ImageIndex = 15
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton35: TToolButton
        Left = 37
        Top = 2
        Width = 8
        Caption = 'ToolButton35'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton36: TToolButton
        Left = 45
        Top = 2
        Hint = 'Explorateur'
        Caption = 'Explorateur'
        ImageIndex = 43
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = Explorateur1Click
      end
      object ToolButton37: TToolButton
        Left = 69
        Top = 2
        Hint = 'Mod'#232'les de codes'
        Caption = 'Mod'#232'les de codes'
        ImageIndex = 59
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = Modlesdecodes1Click
      end
      object ToolButton38: TToolButton
        Left = 93
        Top = 2
        Width = 8
        Caption = 'ToolButton38'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton39: TToolButton
        Left = 101
        Top = 2
        Hint = 'Ligne active'
        Caption = 'Ligne active'
        ImageIndex = 54
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = Ligneactive1Click
      end
      object ToolButton40: TToolButton
        Left = 125
        Top = 2
        Hint = 'Retour '#224' la ligne'
        Caption = 'Retour '#224' la ligne'
        ImageIndex = 74
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = Retourlaligne1Click
      end
      object ToolButton41: TToolButton
        Left = 149
        Top = 2
        Hint = 'Num'#233'ro de ligne'
        Caption = 'Num'#233'ro de ligne'
        ImageIndex = 63
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = Numrodeligne1Click
      end
      object ToolButton42: TToolButton
        Left = 173
        Top = 2
        Hint = 'Caract'#232'res sp'#233'ciaux'
        Caption = 'Caract'#232'res sp'#233'ciaux'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = Caractresspciaux1Click
      end
      object ToolButton43: TToolButton
        Left = 197
        Top = 2
        Hint = 'Auto-Compl'#233'tion des parenth'#232'ses'
        Caption = 'Auto-Compl'#233'tion des parenth'#232'ses'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = AutoCompltiondesparenthses1Click
      end
      object ToolButton44: TToolButton
        Left = 221
        Top = 2
        Width = 8
        Caption = 'ToolButton44'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object ToolButton45: TToolButton
        Left = 229
        Top = 2
        Hint = 'Police ...'
        Caption = 'Police ...'
        ImageIndex = 67
        MenuItem = Police1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton67: TToolButton
        Left = 253
        Top = 2
        Hint = 'Rester au dessus de l'#39#233'cran'
        Caption = 'Rester au dessus de l'#39#233'cran'
        ImageIndex = 86
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = ToolButton67Click
      end
    end
    object ToolBar5: TToolBar
      Left = 314
      Top = 30
      Width = 130
      Height = 24
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'ToolBar5'
      Customizable = True
      EdgeBorders = []
      Images = ImageList1
      TabOrder = 5
      object ToolButton46: TToolButton
        Left = 0
        Top = 2
        Hint = 'Rechercher'
        Caption = 'Rechercher'
        ImageIndex = 71
        MenuItem = Rechercher1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton47: TToolButton
        Left = 24
        Top = 2
        Hint = 'Remplacer'
        Caption = 'Remplacer'
        ImageIndex = 73
        MenuItem = Remplacer1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton48: TToolButton
        Left = 48
        Top = 2
        Hint = 'Occurence suivante'
        Caption = 'Occurence suivante'
        ImageIndex = 65
        MenuItem = Occurencesuivante1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton49: TToolButton
        Left = 72
        Top = 2
        Hint = 'Occurence pr'#233'c'#233'dente'
        Caption = 'Occurence pr'#233'c'#233'dente'
        ImageIndex = 64
        MenuItem = Occurenceprcdente1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton50: TToolButton
        Left = 96
        Top = 2
        Width = 8
        Caption = 'ToolButton50'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton51: TToolButton
        Left = 104
        Top = 2
        Hint = 'Aller '#224' la ligne ...'
        Caption = 'Aller '#224' la ligne ...'
        ImageIndex = 11
        MenuItem = Allerlaligne1
        ParentShowHint = False
        ShowHint = True
      end
    end
    object ToolBar7: TToolBar
      Left = 303
      Top = 58
      Width = 130
      Height = 24
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'ToolBar7'
      Customizable = True
      EdgeBorders = []
      Images = ImageList1
      TabOrder = 6
      object ToolButton60: TToolButton
        Left = 0
        Top = 2
        Hint = 'Pr'#233'c'#233'dente'
        Caption = 'Pr'#233'c'#233'dente'
        ImageIndex = 44
        MenuItem = Prcdente1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton61: TToolButton
        Left = 24
        Top = 2
        Hint = 'Suivante'
        Caption = 'Suivante'
        ImageIndex = 45
        MenuItem = Suivante1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton62: TToolButton
        Left = 48
        Top = 2
        Width = 8
        Caption = 'ToolButton62'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton63: TToolButton
        Left = 56
        Top = 2
        Hint = 'Cascade'
        Caption = 'Cascade'
        ImageIndex = 20
        MenuItem = Cascade1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton64: TToolButton
        Left = 80
        Top = 2
        Hint = 'Moza'#239'que horizontale'
        Caption = 'Moza'#239'que horizontale'
        ImageIndex = 60
        MenuItem = Mozaque1
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton65: TToolButton
        Left = 104
        Top = 2
        Hint = 'Moza'#239'que verticale'
        Caption = 'Moza'#239'que verticale'
        ImageIndex = 61
        MenuItem = Mozaqueverticale1
        ParentShowHint = False
        ShowHint = True
      end
    end
    object ToolBar8: TToolBar
      Left = 620
      Top = 2
      Width = 226
      Height = 24
      Hint = 'Configuration'
      ButtonWidth = 24
      Caption = 'ToolBar8'
      Customizable = True
      EdgeBorders = []
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      object Panel7: TPanel
        Left = 0
        Top = 2
        Width = 228
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 5
          Top = 5
          Width = 71
          Height = 13
          Caption = 'Configuration : '
          Layout = tlCenter
        end
        object ComboBox2: TComboBox
          Tag = 4
          Left = 76
          Top = 1
          Width = 151
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          Sorted = True
          TabOrder = 0
          OnSelect = ComboBox2Select
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 296
    Top = 128
    object Fichier1: TMenuItem
      Caption = 'Fichier'
      Hint = 'Fichier'
      object Nouveau1: TMenuItem
        Caption = 'Nouveau'
        Hint = 'Nouveau'
        object Fichiervide1: TMenuItem
          Caption = 'Fichier vide'
          ImageIndex = 62
          ShortCut = 16462
          OnClick = Nouveau1Click
        end
        object Fichieravecmodle1: TMenuItem
          Caption = 'Fichier avec mod'#232'le ...'
          ImageIndex = 108
          OnClick = Fichieravecmodle1Click
        end
        object N47: TMenuItem
          Caption = '-'
        end
        object Projetvide1: TMenuItem
          Caption = 'Projet vide'
          ImageIndex = 109
          OnClick = Vide1Click
        end
        object Projetavecmodle1: TMenuItem
          Caption = 'Projet avec mod'#232'le ...'
          ImageIndex = 110
          OnClick = Modles1Click
        end
      end
      object Ouvrir1: TMenuItem
        Caption = 'Ouvrir ...'
        Hint = 'Ouvrir ...'
        ImageIndex = 66
        ShortCut = 16463
        OnClick = Ouvrir1Click
      end
      object Rouvrir1: TMenuItem
        Caption = 'R'#233'ouvrir'
        Hint = 'R'#233'ouvrir'
        object Aucun1: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'0'
          ImageIndex = 0
          OnClick = Aucun1Click
        end
        object Aucun2: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'1'
          ImageIndex = 1
          OnClick = Aucun1Click
        end
        object Aucun3: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'2'
          ImageIndex = 2
          OnClick = Aucun1Click
        end
        object Aucun4: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'3'
          ImageIndex = 3
          OnClick = Aucun1Click
        end
        object Aucun5: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'4'
          ImageIndex = 4
          OnClick = Aucun1Click
        end
        object Aucun6: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'5'
          ImageIndex = 5
          OnClick = Aucun1Click
        end
        object Aucun7: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'6'
          ImageIndex = 6
          OnClick = Aucun1Click
        end
        object Aucun8: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'7'
          ImageIndex = 7
          OnClick = Aucun1Click
        end
        object Aucun9: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'8'
          ImageIndex = 8
          OnClick = Aucun1Click
        end
        object Aucun10: TMenuItem
          Hint = 'Reouvrir le fichier n'#176'9'
          ImageIndex = 9
          OnClick = Aucun1Click
        end
        object N19: TMenuItem
          Caption = '-'
        end
        object outeffacer1: TMenuItem
          Caption = 'Tout effacer'
          Hint = 'Effacer les fichiers r'#233'cemment ouverts'
          OnClick = outeffacer1Click
        end
      end
      object Recharger1: TMenuItem
        Caption = 'Recharger'
        Hint = 'Recharger'
        object Lefichierencours1: TMenuItem
          Caption = 'Le fichier en cours'
          Hint = 'Recharger le fichier en cours'
          OnClick = Lefichierencours1Click
        end
        object outlesfichiersouverts1: TMenuItem
          Caption = 'Tout les fichiers ouverts'
          Hint = 'Recharger tout les fichiers ouverts'
          OnClick = outlesfichiersouverts1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Enregistrer1: TMenuItem
        Caption = 'Enregistrer'
        Hint = 'Enregistrer'
        ImageIndex = 39
        ShortCut = 16467
        OnClick = Enregistrer1Click
      end
      object Enregistrersous1: TMenuItem
        Caption = 'Enregistrer-sous ...'
        Hint = 'Enregistrer-sous ...'
        ImageIndex = 40
        OnClick = Enregistrersous1Click
      end
      object Enregistrerleprojetsous1: TMenuItem
        Caption = 'Enregistrer le projet sous ...'
        OnClick = Enregistrersous3Click
      end
      object outenregsitrer1: TMenuItem
        Caption = 'Tout enregistrer'
        Hint = 'Tout enregistrer'
        ImageIndex = 77
        OnClick = outenregsitrer1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object AperuenHTML1: TMenuItem
        Caption = 'Aper'#231'u en HTML'
        Hint = 'Aper'#231'u en HTML'
        ImageIndex = 85
        ShortCut = 123
        OnClick = AperuenHTML1Click
      end
      object Exporter1: TMenuItem
        Caption = 'Exporter'
        Hint = 'Exporter'
        object FormatHTML1: TMenuItem
          Caption = 'Format HTML'
          Hint = 'Exporter au format html'
          OnClick = FormatHTML1Click
        end
        object FormatRTF1: TMenuItem
          Tag = 1
          Caption = 'Format RTF'
          Hint = 'Exporter au format rtf'
          OnClick = FormatHTML1Click
        end
        object FormatLaTex1: TMenuItem
          Tag = 2
          Caption = 'Format LaTex'
          Hint = 'Exporter au format latex'
          OnClick = FormatHTML1Click
        end
        object N27: TMenuItem
          Caption = '-'
        end
        object FormatRTFPressepapiers1: TMenuItem
          Caption = 'Format HTML > Presse papiers'
          Hint = 'Format HTML > Presse papiers'
          OnClick = FormatRTFPressepapiers1Click
        end
        object FormatRTFPressepapiers2: TMenuItem
          Tag = 1
          Caption = 'Format RTF > Presse papiers'
          Hint = 'Format RTF > Presse papiers'
          OnClick = FormatRTFPressepapiers1Click
        end
        object FormatLaTexPressepapiers1: TMenuItem
          Tag = 2
          Caption = 'Format LaTex > Presse papiers'
          Hint = 'Format LaTex > Presse papiers'
          OnClick = FormatRTFPressepapiers1Click
        end
        object N33: TMenuItem
          Caption = '-'
        end
        object Modledecodes1: TMenuItem
          Caption = 'Mod'#232'les de codes'
          Hint = 'Exporter comme mod'#232'le de code'
          OnClick = Modledecodes1Click
        end
      end
      object N26: TMenuItem
        Caption = '-'
      end
      object Fermer1: TMenuItem
        Caption = 'Fermer'
        Hint = 'Fermer'
        ImageIndex = 46
        ShortCut = 16499
        OnClick = Fermer1Click
      end
      object outfermer1: TMenuItem
        Caption = 'Tout fermer'
        Hint = 'Tout fermer'
        ImageIndex = 78
        ShortCut = 24691
        OnClick = outfermer1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Proprits1: TMenuItem
        Caption = 'Propri'#233't'#233's'
        Hint = 'Propri'#233't'#233's'
        OnClick = Proprits1Click
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object Configurerlimpression1: TMenuItem
        Caption = 'Configurer l'#39'impression ...'
        Hint = 'Configurer l'#39'impression ...'
        ImageIndex = 26
        OnClick = Configurerlimpression1Click
      end
      object Aperuavantimpression1: TMenuItem
        Caption = 'Aper'#231'u avant impression ...'
        Hint = 'Aper'#231'u avant impression ...'
        ImageIndex = 12
        ShortCut = 16464
        OnClick = Aperuavantimpression1Click
      end
      object Imprimer1: TMenuItem
        Caption = 'Imprimer ...'
        Hint = 'Imprimer ...'
        ImageIndex = 49
        OnClick = Imprimer1Click
      end
      object N29: TMenuItem
        Caption = '-'
      end
      object Quitter1: TMenuItem
        Caption = 'Quitter'
        Hint = 'Quitter'
        ShortCut = 32883
        OnClick = Quitter1Click
      end
    end
    object Edition1: TMenuItem
      Caption = 'Edition'
      Hint = 'Edition'
      object Dfaire1: TMenuItem
        Caption = 'D'#233'faire'
        Hint = 'D'#233'faire'
        ImageIndex = 35
        ShortCut = 16474
        OnClick = Dfaire1Click
      end
      object Refaire1: TMenuItem
        Caption = 'Refaire'
        Hint = 'Refaire'
        ImageIndex = 72
        ShortCut = 24666
        OnClick = Refaire1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Couper1: TMenuItem
        Caption = 'Couper'
        Hint = 'Couper'
        ImageIndex = 32
        ShortCut = 16472
        OnClick = Couper1Click
      end
      object CouperPressepapier1: TMenuItem
        Caption = 'Couper + Presse-papiers'
        Hint = 'Couper + Presse-papiers'
        ImageIndex = 33
        ShortCut = 24664
        OnClick = CouperPressepapier1Click
      end
      object Copier1: TMenuItem
        Caption = 'Copier'
        Hint = 'Copier'
        ImageIndex = 28
        ShortCut = 16451
        OnClick = Copier1Click
      end
      object CopierPressepapiers1: TMenuItem
        Caption = 'Copier + Presse-papiers'
        Hint = 'Copier + Presse-papiers'
        ImageIndex = 29
        ShortCut = 24643
        OnClick = CopierPressepapiers1Click
      end
      object Coller1: TMenuItem
        Caption = 'Coller'
        Hint = 'Coller'
        ImageIndex = 22
        ShortCut = 16470
        OnClick = Coller1Click
      end
      object Supprimer1: TMenuItem
        Caption = 'Supprimer'
        Hint = 'Supprimer'
        ImageIndex = 75
        OnClick = Supprimer1Click
      end
      object outslectionner1: TMenuItem
        Caption = 'Tout s'#233'lectionner'
        Hint = 'Tout s'#233'lectionner'
        ImageIndex = 79
        ShortCut = 16449
        OnClick = outslectionner1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object VoirlePressepapiers1: TMenuItem
        Caption = 'Voir le Presse-papiers'
        Hint = 'Voir le Presse-papiers'
        ImageIndex = 69
        OnClick = VoirlePressepapiers1Click
      end
      object InsrerDateetHeure1: TMenuItem
        Caption = 'Ins'#233'rer Date et Heure'
        Hint = 'Ins'#233'rer Date et Heure'
        ImageIndex = 52
        OnClick = InsrerDateetHeure1Click
      end
      object Insrerunfichier1: TMenuItem
        Caption = 'Ins'#233'rer un fichier ...'
        Hint = 'Ins'#233'rer un fichier ...'
        OnClick = Insrerunfichier1Click
      end
      object Format1: TMenuItem
        Caption = 'Format'
        Hint = 'Format'
        ImageIndex = 48
        object abulationsEspaces1: TMenuItem
          Caption = 'Tabulations > Espaces'
          Hint = 'Format : Tabulations > Espaces'
          OnClick = abulationsEspaces1Click
        end
        object EspacesTabulations1: TMenuItem
          Caption = 'Espaces > Tabulations'
          Hint = 'Format : Espaces > Tabulations'
          OnClick = EspacesTabulations1Click
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object OEMAnsi1: TMenuItem
          Caption = 'OEM > Ansi'
          Hint = 'Format : OEM > Ansi'
          OnClick = OEMAnsi1Click
        end
        object AnsiOEM1: TMenuItem
          Caption = 'Ansi > OEM'
          Hint = 'Format : Ansi > OEM'
          OnClick = AnsiOEM1Click
        end
      end
      object Changerlacasse1: TMenuItem
        Caption = 'Changer la casse'
        Hint = 'Changer la casse'
        ImageIndex = 21
        object Inverser1: TMenuItem
          Caption = 'Inverser'
          Hint = 'Inverser'
          ImageIndex = 83
          OnClick = Inverser1Click
        end
        object Capitaliser1: TMenuItem
          Caption = 'Capitaliser'
          Hint = 'Capitaliser'
          ImageIndex = 18
          OnClick = Capitaliser1Click
        end
        object N10: TMenuItem
          Caption = '-'
        end
        object SlectionMajuscule1: TMenuItem
          Caption = 'S'#233'lection > Majuscule'
          Hint = 'S'#233'lection > Majuscule'
          ImageIndex = 57
          OnClick = SlectionMajuscule1Click
        end
        object SlectionMinuscule1: TMenuItem
          Caption = 'S'#233'lection > Minuscule'
          Hint = 'S'#233'lection > Minuscule'
          ImageIndex = 56
          OnClick = SlectionMinuscule1Click
        end
        object outMajuscule1: TMenuItem
          Caption = 'Tout > Majuscule'
          Hint = 'Tout > Majuscule'
          OnClick = outMajuscule1Click
        end
        object outMinuscule1: TMenuItem
          Caption = 'Tout > Minuscule'
          Hint = 'Tout > Minuscule'
          OnClick = outMinuscule1Click
        end
      end
      object Cloque1: TMenuItem
        Caption = 'Bloque'
        Hint = 'Bloque'
        ImageIndex = 17
        object Augmenterlindentation1: TMenuItem
          Caption = 'Augmenter l'#39'indentation'
          Hint = 'Bloque : Augmenter l'#39'indentation'
          ImageIndex = 51
          ShortCut = 24649
          OnClick = Augmenterlindentation1Click
        end
        object Diminuerlindentation1: TMenuItem
          Caption = 'Diminuer l'#39'indentation'
          Hint = 'Bloque : Diminuer l'#39'indentation'
          ImageIndex = 50
          ShortCut = 24661
          OnClick = Diminuerlindentation1Click
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object Commenter1: TMenuItem
          Caption = 'Commenter'
          Hint = 'Bloque : Commenter'
          ImageIndex = 23
          OnClick = Commenter1Click
        end
        object Dcommenter1: TMenuItem
          Caption = 'D'#233'commenter'
          Hint = 'Bloque : D'#233'commenter'
          ImageIndex = 34
          OnClick = Dcommenter1Click
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object Sauvegarder1: TMenuItem
          Caption = 'Sauvegarder ...'
          Hint = 'Sauvegarder ...'
          OnClick = Sauvegarder1Click
        end
      end
      object Findeligne1: TMenuItem
        Caption = 'Fin de ligne'
        Hint = 'Fin de ligne : '
        ImageIndex = 47
        object DosWindows1: TMenuItem
          Caption = 'Dos\Windows'
          Hint = 'Fin de ligne : Dos\Windows'
          ImageIndex = 36
          OnClick = DosWindows1Click
        end
        object Unix1: TMenuItem
          Caption = 'Unix'
          Hint = 'Fin de ligne : Unix'
          ImageIndex = 82
          OnClick = Unix1Click
        end
        object Mac1: TMenuItem
          Caption = 'Mac'
          Hint = 'Fin de ligne : Mac'
          ImageIndex = 55
          OnClick = Mac1Click
        end
      end
      object rier1: TMenuItem
        Caption = 'Trier'
        Hint = 'Trier'
        object Ordrecroissant1: TMenuItem
          Caption = 'Ordre croissant'
          Hint = 'Trier par ordre croissant'
          ImageIndex = 80
          OnClick = Ordrecroissant1Click
        end
        object Ordredcroissant1: TMenuItem
          Caption = 'Ordre d'#233'croissant'
          Hint = 'Trier par ordre d'#233'croissant'
          ImageIndex = 81
          OnClick = Ordredcroissant1Click
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Lectureseule1: TMenuItem
        Caption = 'Lecture seule'
        Hint = 'Lecture seule'
        ImageIndex = 53
        ShortCut = 16460
        OnClick = Lectureseule1Click
      end
    end
    object Affichage1: TMenuItem
      Caption = 'Affichage'
      Hint = 'Affichage'
      object Barredoutils1: TMenuItem
        Caption = 'Barre d'#39'outils'
        Hint = 'Barre d'#39'outils'
        ImageIndex = 15
        object Standard1: TMenuItem
          Caption = 'Standard'
          Hint = 'Barre d'#39'outils : Standard'
          OnClick = Standard1Click
        end
        object Edition2: TMenuItem
          Caption = 'Edition'
          Hint = 'Barre d'#39'outils : Edition'
          OnClick = Edition2Click
        end
        object Langage1: TMenuItem
          Caption = 'Langage'
          Hint = 'Barre d'#39'outils : Langage'
          OnClick = Langage1Click
        end
        object Affichage2: TMenuItem
          Caption = 'Affichage'
          Hint = 'Barre d'#39'outils : Affichage'
          OnClick = Affichage2Click
        end
        object Configuration1: TMenuItem
          Caption = 'Configuration'
          Hint = 'Barre d'#39'outils : Configuration'
          OnClick = Configuration1Click
        end
        object Recherche1: TMenuItem
          Caption = 'Recherche'
          Hint = 'Barre d'#39'outils : Recherche'
          OnClick = Recherche1Click
        end
        object Outils2: TMenuItem
          Caption = 'Outils'
          Hint = 'Barre d'#39'outils : Outils'
          OnClick = Outils2Click
        end
        object Fentre2: TMenuItem
          Caption = 'Fen'#234'tre'
          Hint = 'Barre d'#39'outils : Fen'#234'tre'
          OnClick = Fentre2Click
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object outafficher1: TMenuItem
          Caption = 'Tout afficher'
          Hint = 'Barre d'#39'outils : Tout afficher'
          OnClick = outafficher1Click
        end
        object outmasquer1: TMenuItem
          Caption = 'Tout masquer'
          Hint = 'Barre d'#39'outils : Tout masquer'
          OnClick = outmasquer1Click
        end
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object Explorateur1: TMenuItem
        Caption = 'Explorateur'
        Hint = 'Explorateur'
        ImageIndex = 43
        OnClick = Explorateur1Click
      end
      object Modlesdecodes1: TMenuItem
        Caption = 'Mod'#232'les de codes'
        Hint = 'Mod'#232'les de codes'
        ImageIndex = 59
        OnClick = Modlesdecodes1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object Langues1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Langues'
        object Dfaut1: TMenuItem
          Tag = -1
          AutoHotkeys = maManual
          Caption = 'D'#233'faut (Fr)'
          ImageIndex = 113
          OnClick = Dfaut1Click
        end
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object Ligneactive1: TMenuItem
        Caption = 'Ligne active'
        Hint = 'Ligne active'
        ImageIndex = 54
        OnClick = Ligneactive1Click
      end
      object Retourlaligne1: TMenuItem
        Caption = 'Retour '#224' la ligne'
        Hint = 'Retour '#224' la ligne'
        ImageIndex = 74
        OnClick = Retourlaligne1Click
      end
      object Numrodeligne1: TMenuItem
        Caption = 'Num'#233'ro de ligne'
        Hint = 'Num'#233'ro de ligne'
        ImageIndex = 63
        OnClick = Numrodeligne1Click
      end
      object Caractresspciaux1: TMenuItem
        Caption = 'Caract'#232'res sp'#233'ciaux'
        Hint = 'Caract'#232'res sp'#233'ciaux'
        ImageIndex = 19
        OnClick = Caractresspciaux1Click
      end
      object AutoCompltiondesparenthses1: TMenuItem
        Caption = 'Auto-Compl'#233'tion des parenth'#232'ses'
        Hint = 'Auto-Compl'#233'tion des parenth'#232'ses'
        ImageIndex = 14
        OnClick = AutoCompltiondesparenthses1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object Police1: TMenuItem
        Caption = 'Police ...'
        Hint = 'Police ...'
        ImageIndex = 67
        OnClick = Police1Click
      end
      object Resteraudessusdelcran1: TMenuItem
        Caption = 'Rester au dessus de l'#39#233'cran'
        Hint = 'Rester au dessus de l'#39#233'cran'
        ImageIndex = 86
        OnClick = Resteraudessusdelcran1Click
      end
    end
    object Chercher1: TMenuItem
      Caption = 'Chercher'
      Hint = 'Chercher'
      object Rechercher1: TMenuItem
        Caption = 'Rechercher'
        Hint = 'Rechercher'
        ImageIndex = 71
        ShortCut = 16466
        OnClick = Rechercher1Click
      end
      object Remplacer1: TMenuItem
        Caption = 'Remplacer'
        Hint = 'Remplacer'
        ImageIndex = 73
        ShortCut = 24658
        OnClick = Remplacer1Click
      end
      object Occurencesuivante1: TMenuItem
        Caption = 'Occurence suivante'
        Hint = 'Occurence suivante'
        ImageIndex = 65
        ShortCut = 114
        OnClick = Occurencesuivante1Click
      end
      object Occurenceprcdente1: TMenuItem
        Caption = 'Occurence pr'#233'c'#233'dente'
        Hint = 'Occurence pr'#233'c'#233'dente'
        ImageIndex = 64
        ShortCut = 8306
        OnClick = Occurenceprcdente1Click
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object Allerlaligne1: TMenuItem
        Caption = 'Aller '#224' la ligne ...'
        Hint = 'Aller '#224' la ligne ...'
        ImageIndex = 11
        ShortCut = 16455
        OnClick = Allerlaligne1Click
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object Crerunsignet1: TMenuItem
        Caption = 'Cr'#233'er un signet'
        Hint = 'Cr'#233'er un signet'
        object Signet01: TMenuItem
          Caption = 'Signet 0'
          Hint = 'Cr'#233'er le signet n'#176'0'
          ImageIndex = 0
          ShortCut = 16432
          OnClick = Signet01Click
        end
        object Signet11: TMenuItem
          Tag = 1
          Caption = 'Signet 1'
          Hint = 'Cr'#233'er le signet n'#176'1'
          ImageIndex = 1
          ShortCut = 16433
          OnClick = Signet01Click
        end
        object Signet21: TMenuItem
          Tag = 2
          Caption = 'Signet 2'
          Hint = 'Cr'#233'er le signet n'#176'2'
          ImageIndex = 2
          ShortCut = 16434
          OnClick = Signet01Click
        end
        object Signet31: TMenuItem
          Tag = 3
          Caption = 'Signet 3'
          Hint = 'Cr'#233'er le signet n'#176'3'
          ImageIndex = 3
          ShortCut = 16435
          OnClick = Signet01Click
        end
        object Signet41: TMenuItem
          Tag = 4
          Caption = 'Signet 4'
          Hint = 'Cr'#233'er le signet n'#176'4'
          ImageIndex = 4
          ShortCut = 16436
          OnClick = Signet01Click
        end
        object Signet51: TMenuItem
          Tag = 5
          Caption = 'Signet 5'
          Hint = 'Cr'#233'er le signet n'#176'5'
          ImageIndex = 5
          ShortCut = 16437
          OnClick = Signet01Click
        end
        object Signet61: TMenuItem
          Tag = 6
          Caption = 'Signet 6'
          Hint = 'Cr'#233'er le signet n'#176'6'
          ImageIndex = 6
          ShortCut = 16438
          OnClick = Signet01Click
        end
        object Signet71: TMenuItem
          Tag = 7
          Caption = 'Signet 7'
          Hint = 'Cr'#233'er le signet n'#176'7'
          ImageIndex = 7
          ShortCut = 16439
          OnClick = Signet01Click
        end
        object Signet81: TMenuItem
          Tag = 8
          Caption = 'Signet 8'
          Hint = 'Cr'#233'er le signet n'#176'8'
          ImageIndex = 8
          ShortCut = 16440
          OnClick = Signet01Click
        end
        object Signet91: TMenuItem
          Tag = 9
          Caption = 'Signet 9'
          Hint = 'Cr'#233'er le signet n'#176'9'
          ImageIndex = 9
          ShortCut = 16441
          OnClick = Signet01Click
        end
      end
      object Allerunsignet1: TMenuItem
        Caption = 'Aller '#224' un signet'
        Hint = 'Aller '#224' un signet'
        object Signet02: TMenuItem
          Caption = 'Signet 0'
          Hint = 'Aller au signet n'#176'0'
          ImageIndex = 0
          ShortCut = 32816
          OnClick = Signet02Click
        end
        object Signet12: TMenuItem
          Tag = 1
          Caption = 'Signet 1'
          Hint = 'Aller au signet n'#176'1'
          ImageIndex = 1
          ShortCut = 32817
          OnClick = Signet02Click
        end
        object Signet22: TMenuItem
          Tag = 2
          Caption = 'Signet 2'
          Hint = 'Aller au signet n'#176'2'
          ImageIndex = 2
          ShortCut = 32818
          OnClick = Signet02Click
        end
        object Signet32: TMenuItem
          Tag = 3
          Caption = 'Signet 3'
          Hint = 'Aller au signet n'#176'3'
          ImageIndex = 3
          ShortCut = 32819
          OnClick = Signet02Click
        end
        object Signet42: TMenuItem
          Tag = 4
          Caption = 'Signet 4'
          Hint = 'Aller au signet n'#176'4'
          ImageIndex = 4
          ShortCut = 32820
          OnClick = Signet02Click
        end
        object Signet52: TMenuItem
          Tag = 5
          Caption = 'Signet 5'
          Hint = 'Aller au signet n'#176'5'
          ImageIndex = 5
          ShortCut = 32821
          OnClick = Signet02Click
        end
        object Signet62: TMenuItem
          Tag = 6
          Caption = 'Signet 6'
          Hint = 'Aller au signet n'#176'6'
          ImageIndex = 6
          ShortCut = 32822
          OnClick = Signet02Click
        end
        object Signet72: TMenuItem
          Tag = 7
          Caption = 'Signet 7'
          Hint = 'Aller au signet n'#176'7'
          ImageIndex = 7
          ShortCut = 32823
          OnClick = Signet02Click
        end
        object Signet82: TMenuItem
          Tag = 8
          Caption = 'Signet 8'
          Hint = 'Aller au signet n'#176'8'
          ImageIndex = 8
          ShortCut = 32824
          OnClick = Signet02Click
        end
        object Signet92: TMenuItem
          Tag = 9
          Caption = 'Signet 9'
          Hint = 'Aller au signet n'#176'9'
          ImageIndex = 9
          ShortCut = 32825
          OnClick = Signet02Click
        end
      end
      object Effacerlessignets1: TMenuItem
        Caption = 'Effacer les signets'
        Hint = 'Effacer les signets'
        ShortCut = 24689
        OnClick = Effacerlessignets1Click
      end
    end
    object Projet1: TMenuItem
      Caption = 'Projet'
      object Nouveau3: TMenuItem
        Caption = 'Nouveau'
        object Vide1: TMenuItem
          Caption = 'Vide'
          ImageIndex = 109
          OnClick = Vide1Click
        end
        object Modles1: TMenuItem
          Caption = 'Mod'#232'le ...'
          ImageIndex = 110
          OnClick = Modles1Click
        end
      end
      object Ouvrir3: TMenuItem
        Caption = 'Ouvrir ...'
        ImageIndex = 66
        OnClick = Ouvrir3Click
      end
      object N43: TMenuItem
        Caption = '-'
      end
      object Enregistrer3: TMenuItem
        Caption = 'Enregistrer'
        ImageIndex = 39
        OnClick = Enregistrer3Click
      end
      object Enregistrersous3: TMenuItem
        Caption = 'Enregistrer-sous ...'
        ImageIndex = 40
        OnClick = Enregistrersous3Click
      end
      object N46: TMenuItem
        Caption = '-'
      end
      object Ajouterauprojet1: TMenuItem
        Caption = 'Ajouter au projet ...'
        ImageIndex = 111
        OnClick = Ajouterauprojet1Click
      end
      object Retirerduprojet1: TMenuItem
        Caption = 'Retirer du projet ...'
        ImageIndex = 112
        OnClick = Retirerduprojet1Click
      end
      object N44: TMenuItem
        Caption = '-'
      end
      object Informationssurleprojet1: TMenuItem
        Caption = 'Informations sur le projet'
        ImageIndex = 102
        OnClick = Informationssurleprojet1Click
      end
      object Options1: TMenuItem
        Caption = 'Options ...'
        ImageIndex = 104
        OnClick = Options1Click
      end
      object N45: TMenuItem
        Caption = '-'
      end
      object Fermer4: TMenuItem
        Caption = 'Fermer'
        ImageIndex = 46
        OnClick = Fermer4Click
      end
    end
    object Excuter1: TMenuItem
      Caption = 'Ex'#233'cuter'
      Hint = 'Ex'#233'cuter'
      object Compiler1: TMenuItem
        Caption = 'Compiler'
        Hint = 'Compiler'
        ImageIndex = 25
        ShortCut = 16504
        OnClick = Compiler1Click
      end
      object Excuter2: TMenuItem
        Caption = 'Ex'#233'cuter'
        Hint = 'Ex'#233'cuter'
        ImageIndex = 42
        ShortCut = 16506
        OnClick = Excuter2Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object outfaire1: TMenuItem
        Caption = 'Compiler && Ex'#233'cuter'
        Hint = 'Tout faire'
        ShortCut = 120
        OnClick = outfaire1Click
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object Stopper1: TMenuItem
        Caption = 'Stopper'
        Hint = 'Stopper'
        ImageIndex = 84
        ShortCut = 16507
        OnClick = Stopper1Click
      end
    end
    object Outils1: TMenuItem
      Caption = 'Outils'
      Hint = 'Outils'
      object CommandeDos1: TMenuItem
        Caption = 'Commande Dos'
        Hint = 'Commande Dos'
        ImageIndex = 24
        OnClick = CommandeDos1Click
      end
      object Correcteurdorthographe1: TMenuItem
        Caption = 'Correcteur d'#39'orthographe'
        Hint = 'Correcteur d'#39'orthographe'
        ImageIndex = 30
        OnClick = Correcteurdorthographe1Click
      end
      object ableASCII1: TMenuItem
        Caption = 'Table ASCII'
        Hint = 'Table ASCII'
        ImageIndex = 76
        OnClick = ableASCII1Click
      end
      object Evaluateurdexpressions1: TMenuItem
        Caption = 'Evaluateur d'#39'expressions'
        Hint = 'Evaluateur d'#39'expressions'
        ImageIndex = 41
        OnClick = Evaluateurdexpressions1Click
      end
      object Couleurs1: TMenuItem
        Caption = 'Couleurs'
        Hint = 'Couleurs'
        ImageIndex = 31
        OnClick = Couleurs1Click
      end
      object Editerlesfichierssystmes1: TMenuItem
        Caption = 'Editer les fichiers syst'#232'mes'
        Hint = 'Editer les fichiers syst'#232'mes'
        ImageIndex = 37
        OnClick = Editerlesfichierssystmes1Click
      end
      object Conversiondebases1: TMenuItem
        Caption = 'Conversion de bases'
        Hint = 'Conversion de bases'
        ImageIndex = 16
        OnClick = Conversiondebases1Click
      end
      object EmpreintedigitaleMD51: TMenuItem
        Caption = '"Empreinte digitale" MD5'
        Hint = '"Empreinte digitale" MD5'
        ImageIndex = 38
        OnClick = EmpreintedigitaleMD51Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Prfrences1: TMenuItem
        Caption = 'Pr'#233'f'#233'rences'
        Hint = 'Pr'#233'f'#233'rences'
        ImageIndex = 68
        OnClick = Prfrences1Click
      end
    end
    object HTML1: TMenuItem
      Caption = 'HTML'
      Hint = 'HTML'
      object Aperudanslenavigateur1: TMenuItem
        Caption = 'Aper'#231'u dans le navigateur'
        Hint = 'Aper'#231'u dans le navigateur'
        ImageIndex = 85
        OnClick = AperuenHTML1Click
      end
      object N38: TMenuItem
        Caption = '-'
      end
      object ReformaterlecodeHTML1: TMenuItem
        Caption = 'Reformater le code HTML'
        Hint = 'Reformater le code HTML'
        ImageIndex = 87
        OnClick = ReformaterlecodeHTML1Click
      end
      object CompresserlecodeHTML1: TMenuItem
        Caption = 'Compresser le code HTML'
        Hint = 'Compresser le code HTML'
        ImageIndex = 90
        OnClick = CompresserlecodeHTML1Click
      end
      object N37: TMenuItem
        Caption = '-'
      end
      object Balisesenmajuscules1: TMenuItem
        Caption = 'Balises en majuscules'
        Hint = 'Balises en majuscules'
        ImageIndex = 88
        OnClick = Balisesenmajuscules1Click
      end
      object Balisesenminuscules1: TMenuItem
        Caption = 'Balises en minuscules'
        Hint = 'Balises en minuscules'
        ImageIndex = 89
        OnClick = Balisesenminuscules1Click
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object ControlerlecodeHTML1: TMenuItem
        Caption = 'Controler le code HTML'
        Hint = 'Controler le code HTML'
        ImageIndex = 91
        OnClick = ControlerlecodeHTML1Click
      end
      object idy1: TMenuItem
        Caption = 'Tidy'
        Hint = 'Tidy'
        object Cleandocumentnowrapnoindent1: TMenuItem
          Caption = 'Clean document - nowrap - no indent'
          Hint = 'Clean document - nowrap - no indent'
          OnClick = Cleandocumentnowrapnoindent1Click
        end
        object Cleandocumentnowrap1: TMenuItem
          Caption = 'Clean document - nowrap'
          Hint = 'Clean document - nowrap'
          OnClick = Cleandocumentnowrap1Click
        end
        object Cleandocumentquote1: TMenuItem
          Caption = 'Clean document - quote'
          Hint = 'Clean document - quote'
          OnClick = Cleandocumentquote1Click
        end
        object Cleandocumentwrap1: TMenuItem
          Caption = 'Clean document - wrap'
          Hint = 'Clean document - wrap'
          OnClick = Cleandocumentwrap1Click
        end
        object CleanMicrosoftWord20001: TMenuItem
          Caption = 'Clean - Microsoft Word 2000 document'
          Hint = 'Clean - Microsoft Word 2000 document'
          OnClick = CleanMicrosoftWord20001Click
        end
        object N34: TMenuItem
          Caption = '-'
        end
        object UpgradetoCSS1: TMenuItem
          Caption = 'Upgrade to CSS'
          Hint = 'Upgrade to CSS'
          OnClick = UpgradetoCSS1Click
        end
        object UpgradetoXHTML1: TMenuItem
          Caption = 'Upgrade to XHTML'
          Hint = 'Upgrade to XHTML'
          OnClick = UpgradetoXHTML1Click
        end
        object UpgradetoXML1: TMenuItem
          Caption = 'Upgrade to XML'
          Hint = 'Upgrade to XML'
          OnClick = UpgradetoXML1Click
        end
        object N35: TMenuItem
          Caption = '-'
        end
        object Personnalis1: TMenuItem
          Caption = 'Personnalis'#233
          Hint = 'Personnalis'#233
          OnClick = Personnalis1Click
        end
      end
    end
    object Fentre1: TMenuItem
      Caption = 'Fen'#234'tre'
      Hint = 'Fen'#234'tre'
      object Prcdente1: TMenuItem
        Caption = 'Pr'#233'c'#233'dente'
        Hint = 'Pr'#233'c'#233'dente'
        ImageIndex = 44
        OnClick = Prcdente1Click
      end
      object Suivante1: TMenuItem
        Caption = 'Suivante'
        Hint = 'Suivante'
        ImageIndex = 45
        OnClick = Suivante1Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object Cascade1: TMenuItem
        Caption = 'Cascade'
        Hint = 'Cascade'
        ImageIndex = 20
        OnClick = Cascade1Click
      end
      object Mozaque1: TMenuItem
        Caption = 'Moza'#239'que horizontale'
        Hint = 'Moza'#239'que horizontale'
        ImageIndex = 60
        OnClick = Mozaque1Click
      end
      object Mozaqueverticale1: TMenuItem
        Caption = 'Moza'#239'que verticale'
        Hint = 'Moza'#239'que verticale'
        ImageIndex = 61
        OnClick = Mozaqueverticale1Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object Fermer2: TMenuItem
        Caption = 'Fermer'
        Hint = 'Fermer'
        ImageIndex = 46
        OnClick = Fermer1Click
      end
      object outfermer2: TMenuItem
        Caption = 'Tout fermer'
        Hint = 'Tout fermer'
        ImageIndex = 78
        OnClick = outfermer1Click
      end
      object N40: TMenuItem
        Caption = '-'
      end
      object AfficherAll4CodInfos1: TMenuItem
        Caption = 'Afficher "All4Cod - Infos"'
        ImageIndex = 100
        OnClick = AfficherAll4CodInfos1Click
      end
    end
    object N7: TMenuItem
      Caption = '?'
      Hint = '?'
      object Aide1: TMenuItem
        Caption = 'Aide'
        Hint = 'Aide'
        ImageIndex = 10
        ShortCut = 112
        OnClick = Aide1Click
      end
      object Misejour1: TMenuItem
        Caption = 'Mise '#224' jour'
        Hint = 'Mise '#224' jour'
        ImageIndex = 58
        OnClick = Misejour1Click
      end
      object Envoyerunrapportderreur1: TMenuItem
        Caption = 'Envoyer un rapport d'#39'erreur(s)'
        Hint = 'Envoyer un rapport d'#39'erreur(s)'
        ImageIndex = 70
        OnClick = Envoyerunrapportderreur1Click
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object AproposdePitiPad1: TMenuItem
        Caption = 'A propos de All4Cod'
        Hint = 'A propos de All4Cod'
        ImageIndex = 13
        OnClick = AproposdePitiPad1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Ouvrir ...'
    Left = 328
    Top = 128
  end
  object SaveDialog1: TSaveDialog
    Title = 'Enregistrer-sous ...'
    Left = 360
    Top = 128
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 264
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 264
    Top = 160
    object Aucun11: TMenuItem
      ImageIndex = 0
      OnClick = Aucun11Click
    end
    object Aucun12: TMenuItem
      ImageIndex = 1
      OnClick = Aucun11Click
    end
    object Aucun13: TMenuItem
      ImageIndex = 2
      OnClick = Aucun11Click
    end
    object Aucun14: TMenuItem
      ImageIndex = 3
      OnClick = Aucun11Click
    end
    object Aucun15: TMenuItem
      ImageIndex = 4
      OnClick = Aucun11Click
    end
    object Aucun16: TMenuItem
      ImageIndex = 5
      OnClick = Aucun11Click
    end
    object Aucun17: TMenuItem
      ImageIndex = 6
      OnClick = Aucun11Click
    end
    object Aucun18: TMenuItem
      ImageIndex = 7
      OnClick = Aucun11Click
    end
    object Aucun19: TMenuItem
      ImageIndex = 8
      OnClick = Aucun11Click
    end
    object Acun1: TMenuItem
      ImageIndex = 9
      OnClick = Aucun11Click
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object outeffacer2: TMenuItem
      Caption = 'Tout effacer'
      OnClick = outeffacer1Click
    end
  end
  object DosCommand1: TDosCommand
    OnTerminated = DosCommand1Terminated
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    ShowWindow = swHIDE
    CreationFlag = fCREATE_NEW_CONSOLE
    ReturnCode = rcCRLF
    Left = 296
    Top = 160
  end
  object SynSpellCheck1: TSynSpellCheck
    Apostrophes = #39'`'#180
    CheckAttribs.Strings = (
      'Comment'
      'Text'
      'String'
      'Documentation')
    DictionaryPath = 'C:\Program Files\Fichiers communs\SynSpell\'
    Options = [sscoHourGlass, sscoMaintainCase, sscoSelectWord, sscoSuggestWords]
    UserDirectory = 'C:\Program Files\Fichiers communs\SynSpell\'
    OnAbort = SynSpellCheck1Abort
    OnCheckWord = SynSpellCheck1CheckWord
    OnDictClose = SynSpellCheck1DictClose
    OnDictLoad = SynSpellCheck1DictLoad
    OnDone = SynSpellCheck1Done
    Left = 328
    Top = 160
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 360
    Top = 160
  end
  object ReplaceDialog1: TReplaceDialog
    OnFind = ReplaceDialog1Find
    OnReplace = ReplaceDialog1Replace
    Left = 264
    Top = 192
  end
  object SynExporterHTML1: TSynExporterHTML
    Color = clWindow
    DefaultFilter = 'HTML Documents (*.htm;*.html)|*.htm;*.html'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Untitled'
    UseBackground = False
    Left = 296
    Top = 192
  end
  object SynExporterRTF1: TSynExporterRTF
    Color = clWindow
    DefaultFilter = 'Rich Text Format Documents (*.rtf)|*.rtf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Untitled'
    UseBackground = False
    Left = 328
    Top = 192
  end
  object SynEditPrint1: TSynEditPrint
    Copies = 1
    Header.DefaultFont.Charset = DEFAULT_CHARSET
    Header.DefaultFont.Color = clBlack
    Header.DefaultFont.Height = -13
    Header.DefaultFont.Name = 'Arial'
    Header.DefaultFont.Style = []
    Footer.DefaultFont.Charset = DEFAULT_CHARSET
    Footer.DefaultFont.Color = clBlack
    Footer.DefaultFont.Height = -13
    Footer.DefaultFont.Name = 'Arial'
    Footer.DefaultFont.Style = []
    Margins.Left = 25.000000000000000000
    Margins.Right = 15.000000000000000000
    Margins.Top = 25.000000000000000000
    Margins.Bottom = 25.000000000000000000
    Margins.Header = 15.000000000000000000
    Margins.Footer = 15.000000000000000000
    Margins.LeftHFTextIndent = 2.000000000000000000
    Margins.RightHFTextIndent = 2.000000000000000000
    Margins.HFInternalMargin = 0.500000000000000000
    Margins.MirrorMargins = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabWidth = 8
    Color = clWhite
    Left = 264
    Top = 224
  end
  object PrintDialog1: TPrintDialog
    Left = 296
    Top = 224
  end
  object PopupMenu2: TPopupMenu
    Left = 328
    Top = 224
    object Standard2: TMenuItem
      Caption = 'Standard'
      OnClick = Standard1Click
    end
    object Edition3: TMenuItem
      Caption = 'Edition'
      OnClick = Edition2Click
    end
    object Langage2: TMenuItem
      Caption = 'Langage'
      OnClick = Langage1Click
    end
    object Affichage3: TMenuItem
      Caption = 'Affichage'
      OnClick = Affichage2Click
    end
    object Configuration2: TMenuItem
      Caption = 'Configuration'
      OnClick = Configuration1Click
    end
    object Recherche2: TMenuItem
      Caption = 'Recherche'
      OnClick = Recherche1Click
    end
    object Outils3: TMenuItem
      Caption = 'Outils'
      OnClick = Outils2Click
    end
    object Fentre3: TMenuItem
      Caption = 'Fen'#234'tre'
      OnClick = Fentre2Click
    end
    object N30: TMenuItem
      Caption = '-'
    end
    object outafficher2: TMenuItem
      Caption = 'Tout afficher'
      OnClick = outafficher1Click
    end
    object outmasquer2: TMenuItem
      Caption = 'Tout masquer'
      OnClick = outmasquer1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 360
    Top = 224
    object Editer1: TMenuItem
      Caption = 'Editer'
      OnClick = Editer1Click
    end
    object N31: TMenuItem
      Caption = '-'
    end
    object Ractualiserlaliste1: TMenuItem
      Caption = 'Actualiser la liste'
      OnClick = Ractualiserlaliste1Click
    end
  end
  object PopupMenu4: TPopupMenu
    Images = ImageList1
    Left = 264
    Top = 256
    object MenuItem1: TMenuItem
      Caption = 'D'#233'faire'
      ImageIndex = 35
      OnClick = Dfaire1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Refaire'
      ImageIndex = 72
      OnClick = Refaire1Click
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Caption = 'Cr'#233'er un signet'
      object Signet03: TMenuItem
        Caption = 'Signet 0'
        ImageIndex = 0
        OnClick = Signet03Click
      end
      object Signet13: TMenuItem
        Tag = 1
        Caption = 'Signet 1'
        ImageIndex = 1
        OnClick = Signet03Click
      end
      object Signet23: TMenuItem
        Tag = 2
        Caption = 'Signet 2'
        ImageIndex = 2
        OnClick = Signet03Click
      end
      object Signet33: TMenuItem
        Tag = 3
        Caption = 'Signet 3'
        ImageIndex = 3
        OnClick = Signet03Click
      end
      object Signet43: TMenuItem
        Tag = 4
        Caption = 'Signet 4'
        ImageIndex = 4
        OnClick = Signet03Click
      end
      object Signet53: TMenuItem
        Tag = 5
        Caption = 'Signet 5'
        ImageIndex = 5
        OnClick = Signet03Click
      end
      object Signet63: TMenuItem
        Tag = 6
        Caption = 'Signet 6'
        ImageIndex = 6
        OnClick = Signet03Click
      end
      object Signet73: TMenuItem
        Tag = 7
        Caption = 'Signet 7'
        ImageIndex = 7
        OnClick = Signet03Click
      end
      object Signet83: TMenuItem
        Tag = 8
        Caption = 'Signet 8'
        ImageIndex = 8
        OnClick = Signet03Click
      end
      object Signet93: TMenuItem
        Tag = 9
        Caption = 'Signet 9'
        ImageIndex = 9
        OnClick = Signet03Click
      end
    end
    object MenuItem5: TMenuItem
      Caption = 'Aller '#224' un signet'
      object Signet04: TMenuItem
        Caption = 'Signet 0'
        ImageIndex = 0
        OnClick = Signet04Click
      end
      object Signet14: TMenuItem
        Tag = 1
        Caption = 'Signet 1'
        ImageIndex = 1
        OnClick = Signet04Click
      end
      object Signet24: TMenuItem
        Tag = 2
        Caption = 'Signet 2'
        ImageIndex = 2
        OnClick = Signet04Click
      end
      object Signet34: TMenuItem
        Tag = 3
        Caption = 'Signet 3'
        ImageIndex = 3
        OnClick = Signet04Click
      end
      object Signet44: TMenuItem
        Tag = 4
        Caption = 'Signet 4'
        ImageIndex = 4
        OnClick = Signet04Click
      end
      object Signet54: TMenuItem
        Tag = 5
        Caption = 'Signet 5'
        ImageIndex = 5
        OnClick = Signet04Click
      end
      object Signet64: TMenuItem
        Tag = 6
        Caption = 'Signet 6'
        ImageIndex = 6
        OnClick = Signet04Click
      end
      object Signet74: TMenuItem
        Tag = 7
        Caption = 'Signet 7'
        ImageIndex = 7
        OnClick = Signet04Click
      end
      object Signet84: TMenuItem
        Tag = 8
        Caption = 'Signet 8'
        ImageIndex = 8
        OnClick = Signet04Click
      end
      object Signet94: TMenuItem
        Tag = 9
        Caption = 'Signet 9'
        ImageIndex = 9
        OnClick = Signet04Click
      end
    end
    object MenuItem6: TMenuItem
      Caption = 'Effacer les signets'
      OnClick = Effacerlessignets1Click
    end
    object MenuItem7: TMenuItem
      Caption = '-'
    end
    object MenuItem8: TMenuItem
      Caption = 'Couper'
      ImageIndex = 32
      OnClick = Couper1Click
    end
    object MenuItem9: TMenuItem
      Caption = 'Copier'
      ImageIndex = 28
      OnClick = Copier1Click
    end
    object MenuItem10: TMenuItem
      Caption = 'Coller'
      ImageIndex = 22
      OnClick = Coller1Click
    end
    object MenuItem11: TMenuItem
      Caption = 'Supprimer'
      ImageIndex = 75
      OnClick = Supprimer1Click
    end
    object MenuItem12: TMenuItem
      Caption = 'Tout s'#233'lectionner'
      ImageIndex = 79
      OnClick = outslectionner1Click
    end
    object MenuItem13: TMenuItem
      Caption = '-'
    end
    object MenuItem14: TMenuItem
      Caption = 'Recharger'
      OnClick = Lefichierencours1Click
    end
    object MenuItem15: TMenuItem
      Caption = '-'
    end
    object MenuItem16: TMenuItem
      Caption = 'Enregistrer'
      ImageIndex = 39
      OnClick = Enregistrer1Click
    end
    object Enregistrersous2: TMenuItem
      Caption = 'Enregistrer-sous ... '
      ImageIndex = 40
      OnClick = Enregistrersous1Click
    end
    object MenuItem17: TMenuItem
      Caption = '-'
    end
    object MenuItem18: TMenuItem
      Caption = 'Fermer'
      ImageIndex = 46
      OnClick = Fermer1Click
    end
  end
  object ImageList1: TImageList
    Left = 296
    Top = 256
    Bitmap = {
      494C010172007700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000E0010000010020000000000000E0
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A800666666003D3D3D003D3D
      3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D
      3D003D3D3D00A7A7A70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006666660055DFD4003D3D3D0055DF
      FF0055DFFF0055DFFF0055DFFF0055DFFF0055DFD40055DFFF0055DFD40055DF
      FF0055C0D4003D3D3D000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006666660000F2FF0055DFD4003D3D
      3D00A9FFFF0055DFFF0055DFFF0055DFFF0055DFFF0055DFFF0055DFFF0055DF
      D40055DFFF0055DFD4003D3D3D0000000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730054FFFF0000F2FF0055DF
      D4003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D
      3D003D3D3D003D3D3D003D3D3D003D3D3D00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730054FFFF0054FFFF0000F2
      FF0055DFD40000F2FF0055DFD400FFFFFF0098F7FF0099F7FF0098F7FF0098F7
      FF0098F7FF0098F7FF0098F7FF00B4B4B400FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000081818100A9FFFF0054FFFF0054FF
      FF0000F2FF0055DFD400B4B4B400FFFFFF0099F8FF00AAFFFF0099F8FF00AAFF
      FF0099F8FF00AAFFFF0099F8FF00B4B4B400FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008181810054FFFF00A9FFFF008181
      8100737373005959590059595900595959005959590073737300AAFFFF0099F8
      FF00AAFFFF0099F8FF00AAFFFF0076767600FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A9A9A00A9FFFF0054FFFF008181
      8100005FFF00001FFF00001FFF00001FFF00001FFF005959590099F8FF00AAFF
      FF0099F8FF00AAFFFF0099F8FF0076767600FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A9A9A0054FFFF00A9FFFF008181
      81001D94F7001D94F700005FFF00001FFF00001FFF0059595900AAFFFF0099F8
      FF00AAFFFF0099F8FF00AAFFFF0081818100FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A7A700A7A7A70000F2FF00A7A7
      A7009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A00A7A7A70099F8FF00AAFF
      FF0099F8FF00AAFFFF0099F8FF008E8E8E00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A70000F2FF0000F2
      FF0000F2FF0000F2FF00B4B4B400FFFFFF00AAFFFF00AAFFFF00AAFFFF0099F8
      FF0055DFFF0055DFFF0055C0D4009A9A9A00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B9B9B0054FFFF0067F4
      FF0067F4FF0067F4FF0091919100FFFFFF00AAFFFF00AAFFFF00AAFFFF00B4B4
      B400A0A0A0008D8D8D0081818100A7A7A700FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009B9B9B008D8D
      8D008D8D8D00B4B4B40090909000FFFFFF00FFFFFF00AAFFFF00AAFFFF00A1A1
      A100E6E6E600DADADA00DADADA00B4B4B400FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091919100FFFFFF00AAFFFF00FFFFFF00AAFFFF00A7A7
      A700FFFFFF00E7E7E700B4B4B40000000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091919100FFFFFF00FFFFFF00AAFFFF00FFFFFF008D8D
      8D00FFFFFF00B4B4B4000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B4B4B400A7A7A700A7A7A7009A9A9A008E8E8E008181
      8100C1C1C1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A800666666003D3D3D003D3D
      3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D
      3D003D3D3D00A7A7A700000000000000000000000000C6A59C00FFEFD600F7E7
      C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE9400EFCE
      9400F7D69C00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002020200040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400020202000000000006666660055DFD4003D3D3D0055DF
      FF0055DFFF0055DFFF0055DFFF0055DFFF0055DFD40055DFFF0055DFD40055DF
      FF0055C0D4003D3D3D00000000000000000000000000C6A59C00FFEFD6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFCE9C00B584840000000000000000002020200040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000606060003F3F3F006F6F6F006F6F6F006F6F
      6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F
      6F006F6F6F003F3F3F0040404000000000006666660000F2FF0055DFD4003D3D
      3D00A9FFFF0055DFFF0055DFFF0055DFFF0055DFFF0055DFFF0055DFFF0055DF
      D40055DFFF0055DFD4003D3D3D000000000000000000C6ADA500FFEFE700F7E7
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE9C00EFCE
      9400EFCE9C00B584840000000000000000007F7F7F00AFAFAF00AFAFAF00AFAF
      AF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00AFAFAF00AFAFAF0090909000404040007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00AFAFAF0040404000404040004040400040404000404040004040
      4000404040002020200040404000606060007373730054FFFF0000F2FF0055DF
      D4003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D3D003D3D
      3D003D3D3D003D3D3D003D3D3D003D3D3D0000000000C6ADA500FFF7E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFCE9400B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF007F7F7F00FFFFFF00FFFFFF00AFAFAF007F7F7F007F7F7F00EFEF
      EF007F7F7F007F7F7F00BFBFBF00404040007373730054FFFF0054FFFF0000F2
      FF0055DFD40000F2FF0055DFD40099F8FF0099F8FF0099F8FF0099F8FF0099F8
      FF0099F8FF0099F8FF00B4B4B4000000000000000000CEB5AD00FFFFF700FFEF
      E700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE
      9C00EFCE9C00B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF007F7F7F00FFFFFF00FFFFFF00CFCFCF00DFDFDF009F9F9F00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF004040400081818100A9FFFF0054FFFF0054FF
      FF0000F2FF00EFAD00007F5B0000EFAD0000AAFFFF0099F8FF00AAFFFF0099F8
      FF00AAFFFF0099F8FF00767676000000000000000000D6B5AD00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7D6A500B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00404040008181810054FFFF00A9FFFF0054FF
      FF0054FFFF007F5B0000D9A77D007F5B0000FFFFFF00AAFFFF0099F8FF00AAFF
      FF0099F8FF00AAFFFF00767676000000000000000000D6BDB500FFFFFF00FFF7
      F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      B500F7D6AD00B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00404040009A9A9A00A9FFFF0054FFFF00EFAD
      0000A2760000A2760000D9A77D00A37700007F5B0000EFAD0000AAFFFF0099F8
      FF00AAFFFF0099F8FF00767676000000000000000000D6BDB500FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7DEB500B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF007F7F7F007F0000007F0000007F0000007F0000007F0000007F00
      0000303030003030300030303000404040009A9A9A0054FFFF00A9FFFF00AA7F
      0000FFFFCC00D9A77D00D9A77D00D9A77D00D9A77D007F5B0000AAFFFF00AAFF
      FF0099F8FF00AAFFFF00818181000000000000000000DEBDB500FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DEC600F7DE
      C600F7D6B500B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040007F7F7F00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F003F3F3F002020200000000000A7A7A700A7A7A70055C0D400F7D0
      6C00E5B72600E2B62900F6CF6D00AA7F0000AA7F0000F7CF6C00AAFFFF0099F8
      FF00AAFFFF0099F8FF008E8E8E000000000000000000DEC6B500FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000E7DE
      C600C6BDAD00B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040003F3F3F006F6F6F006F6F6F006F6F
      6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F
      6F006F6F6F0030303000404040000000000000000000A7A7A70000F2FF0000F2
      FF0000F1FF00F1BF2B00FFFFCC00AA7F0000AAFFFF00AAFFFF00AAFFFF0055DF
      FF0055DFFF0055C0D4009A9A9A000000000000000000E7C6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A59400B594
      8C00B58C8400B584840000000000000000007F7F7F00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00AFAFAF00404040007F7F7F007F7F7F00AFAFAF00BFBF
      BF007F7F7F00EFEFEF007F7F7F00AFAFAF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF007F7F7F004040400000000000000000009B9B9B0054FFFF0067F4
      FF0067F4FF00F8D06D00FDC83100F7CF6C00AAFFFF00AAFFFF00B4B4B400A0A0
      A0008D8D8D0081818100A7A7A7000000000000000000E7C6B500FFFFFF000000
      00000000000000000000000000000000000000000000E7CECE00BD8C6B00EFB5
      6B00EFA54200C684630000000000000000003F3F3F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00404040003F0000007F0000007F0000007F00
      00007F0000007F0000007F0000007F0000007F0000007F0000003F0000003030
      30003030300030303000404040000000000000000000000000009B9B9B008D8D
      8D008D8D8D00B4B4B40090909000FFFFFF00AAFFFF00FFFFFF00A1A1A100E6E6
      E600DADADA00DADADA00B4B4B4000000000000000000EFCEBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C6947300FFC6
      6B00CE946B000000000000000000000000003F0000007F0000007F0000007F00
      00007F0000007F0000007F0000007F0000007F0000007F0000007F0000007F00
      0000303030003030300030303000202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091919100FFFFFF00FFFFFF00AAFFFF00A7A7A700FFFF
      FF00E7E7E700B4B4B400000000000000000000000000E7C6B500FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C6947300CE9C
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091919100FFFFFF00FFFFFF00FFFFFF008D8D8D00FFFF
      FF00B4B4B40000000000000000000000000000000000E7C6B500EFCEB500EFCE
      B500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD8473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B4B4B4009A9A9A009A9A9A008E8E8E0081818100C1C1
      C100000000000000000000000000000000000DB3C00076767600767676007676
      76007676760076767600767676000DB3C0000000000000000000000000000000
      000000000000000000000000000000000000000000008D8D8D00515151005151
      5100515151005151510051515100515151005151510051515100515151005151
      51005151510051515100515151008D8D8D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000076767600AAFFFF00AAFFFF00AAFF
      FF00AAFFFF00AAFFFF00AAFFFF00767676000000000000000000000000000000
      0000000000000000000000000000000000000000000051515100A7F4F600A7F4
      F600A7F4F600A7F4F600A7F4F600A7F4F600A7F4F600A7F4F600A7F4F600A7F4
      F600A7F4F600A7F4F600A7F4F600515151000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A0A0004040
      4000404040004040400040404000404040004040400040404000404040004040
      40004040400040404000A4A0A0000000000076767600AAFFFF000DB3C0007676
      76007676760076767600AAFFFF00767676000000000000000000000000000000
      0000000000000000000000000000000000000000000051515100FFFFFF00DFFB
      FD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD00DFFBFD00A7F4F600515151000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004040400080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E00080E0E000404040000000000076767600AAFFFF00AAFFFF00AAFF
      FF00AAFFFF00AAFFFF00AAFFFF00767676007676760076767600767676000000
      0000000000000000000000000000000000000000000051515100FFFFFF00DFFB
      FD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD00DFFBFD00A7F4F600515151000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF0080E0E000404040000000000076767600AAFFFF000DB3C0007676
      76007676760076767600AAFFFF0076767600A1F3F900A1F3F900767676007676
      7600000000000000000000000000000000000000000051515100FFFFFF008D8D
      8D008D8D8D008D8D8D008D8D8D008D8D8D00DFFBFD00DFFBFD008D8D8D008D8D
      8D008D8D8D008D8D8D00A7F4F600515151000000000000000000000000000000
      000000000000D19F9F00A6474700890A0A00890A0A00A6474700D19F9F000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF000020E00080A0E000F0FBFF00F0FBFF00F0FBFF0080A0E0000020
      E000F0FBFF0080E0E000404040000000000076767600AAFFFF00AAFFFF00AAFF
      FF00AAFFFF00AAFFFF00AAFFFF0076767600DFFBFD00DFFBFD0076767600A1F3
      F900767676000000000000000000000000000000000051515100FFFFFF008D8D
      8D00FFFFFF00FFFFFF00FFFFFF008D8D8D00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD008D8D8D00A7F4F600515151000000000000000000000000000000
      0000D19F9F00A1050500D1000000F8000000F8000000D1000000A1050500D19F
      9F0000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF0080A0E0000020E00080A0E000F0FBFF0080A0E0000020E00080A0
      E000F0FBFF0080E0E000404040000000000076767600AAFFFF000DB3C0007676
      7600AAFFFF00767676007676760076767600DFFBFD00DFFBFD00767676007676
      7600767676007676760000000000000000000000000051515100FFFFFF008D8D
      8D00FFFFFF00FFFFFF00FFFFFF008D8D8D00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD00DFFBFD00A7F4F600515151000000000000000000000000000000
      0000A6474700D1000000FF000000FF000000FF000000FF000000D1000000A647
      470000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF0080A0E0000020E00080A0E0000020E00080A0E000F0FB
      FF00F0FBFF0080E0E000404040000000000076767600AAFFFF00AAFFFF00AAFF
      FF00AAFFFF0076767600A1F3F90076767600DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00A1F3F9007676760000000000000000000000000051515100FFFFFF008D8D
      8D00FFFFFF00FFFFFF00FFFFFF008D8D8D00DFFBFD00DFFBFD008D8D8D008D8D
      8D008D8D8D008D8D8D00A7F4F600515151000000000000000000000000000000
      0000890A0A00F8000000FF000000FF000000FF000000FF000000F8000000890A
      0A0000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF0080A0E0000020E00080A0E000F0FBFF00F0FB
      FF00F0FBFF0080E0E00040404000000000000DB3C00076767600767676007676
      7600767676007676760076767600DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00A1F3F9007676760000000000000000000000000051515100FFFFFF008D8D
      8D00FFFFFF00FFFFFF00FFFFFF008D8D8D00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD008D8D8D00A7F4F600515151000000000000000000000000000000
      0000890A0A00F8000000FF000000FF000000FF000000FF000000F8000000890A
      0A0000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF0080A0E0000020E00080A0E0000020E00080A0E000F0FB
      FF00F0FBFF0080E0E0004040400000000000000000000000000021212100A1F3
      F900A1F3F900A1F3F900A1F3F900A1F3F900A1F3F900A1F3F90021212100A1F3
      F900A1F3F9007676760000000000000000000000000051515100FFFFFF008D8D
      8D00FFFFFF00FFFFFF00FFFFFF008D8D8D00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD00DFFBFD00A7F4F600515151000000000000000000000000000000
      0000A6004700FFFF0000FF000000FF000000FF000000FF000000D1000000A647
      470000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF0080A0E0000020E00080A0E000F0FBFF0080A0E0000020E00080A0
      E000F0FBFF0080E0E00040404000000000000000000021212100212121002121
      2100B1B1B100767676007676760076767600B1B1B10021212100212121002121
      2100B1B1B1007676760000000000000000000000000051515100FFFFFF008D8D
      8D008D8D8D008D8D8D008D8D8D008D8D8D00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD00DFFBFD00A7F4F600515151000000000000000000000000000000
      0000D19F9F00A6004700FFFF0000F8000000F8000000D1000000A6004700D19F
      9F0000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF000020E00080A0E000F0FBFF00F0FBFF00F0FBFF0080A0E0000020
      E000F0FBFF0080E0E00040404000000000002121210021212100000000002121
      2100212121000000000000000000000000002121210021212100000000002121
      2100212121000000000000000000000000000000000051515100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00515151000000000000000000000000000000
      000000000000D19F9F00A600470089000A0089000A00A6474700D19F9F000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF0080E0E00080E0E00040404000000000002121210000000000000000000000
      0000212121002121210000000000000000002121210000000000000000000000
      0000212121002121210000000000000000000000000051515100515151005151
      5100515151005151510051515100515151005151510051515100515151005151
      5100515151005151510051515100515151000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF004060
      6000406060004060600040404000000000000000000000000000000000000000
      0000000000002121210021212100000000000000000000000000000000000000
      0000000000002121210021212100000000000000000051515100B0903D00B090
      3D00B0903D00B0903D00B0903D00B0903D00B0903D00B0903D00B0903D005151
      5100C6C6C60051515100C6C6C600515151000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF004060
      6000F0FBFF00F0FBFF0040404000000000000000000000000000000000000000
      0000000000000000000021212100000000000000000000000000000000000000
      000000000000000000002121210000000000000000008D8D8D00515151005151
      5100515151005151510051515100515151005151510051515100515151005151
      51005151510051515100515151008D8D8D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF004060
      6000F0FBFF004040400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A0A0004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040000000000000000000000000000000000000000000404040004040
      400040404000404040004040400040404000404040004040400080E0E00080E0
      E000404040004040400040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000919191004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A009191910000000000000000000000000040404000C0A0
      6000C0A06000C0A06000C0A06000C0A06000C0A060004040400080E0E00080E0
      E00040404000C0A0600040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D000000
      000000000000000000000000000000000000000000000000000066666600DFFB
      FD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFB
      FD00DFFBFD00DFFBFD004D4D4D0000000000000000000000000040404000C0A0
      600040404000404040004040400040404000C0A060004040400080E0E00080E0
      E00040404000C0A0600040404000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00004D4D4D004D4D4D00D4999900D4999900D4999900D4999900D49999004D4D
      4D004D4D4D00000000000000000000000000000000000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DFFBFD004D4D4D0000000000000000000000000040404000C0A0
      60004040400080E0E00080E0E00040404000C0A060004040400080E0E00080E0
      E00040404000C0A0600040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000004D4D
      4D00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00D499
      9900D49999004D4D4D000000000000000000000000000000000066666600FFFF
      FF00FFFFFF00B0903D00B0903D00B0903D00B0903D00B0903D00B0903D00B090
      3D00FFFFFF00DFFBFD004D4D4D0000000000000000000000000040404000C0A0
      600040404000806060008060600040404000C0A0600040404000404040004040
      400040404000C0A0600040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000BF676700DDAF
      AF00DDAFAF00DDAFAF00DDAFAF004D4D4D004D4D4D004D4D4D00DDAFAF00DDAF
      AF00DDAFAF00D49999004D4D4D0000000000000000000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DFFBFD004D4D4D0000000000000000000000000040404000C0A0
      60004040400080E0E00080E0E00040404000C0A06000C0A06000C0A06000C0A0
      6000C0A06000C0A0600040404000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      00000000000084848400FFFFFF00000000000000000000000000BF676700DDAF
      AF00DDAFAF00DDAFAF00DDAFAF004D4D4D004D4D4D004D4D4D00DDAFAF00DDAF
      AF00DDAFAF00D49999004D4D4D0000000000000000000000000066666600FFFF
      FF00FFFFFF00B0903D00B0903D00B0903D00B0903D00B0903D00B0903D00B090
      3D00FFFFFF00DFFBFD004D4D4D0000000000000000000000000040404000C0A0
      600040404000404040004040400040404000C0A06000C0A06000C0A06000C0A0
      6000C0A06000C0A0600040404000000000000000000000000000000000000000
      00008484840000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000084848400848484008484840000000000BF676700FFCCCC00DDAF
      AF00DDAFAF00DDAFAF00DDAFAF004D4D4D004D4D4D004D4D4D00DDAFAF00DDAF
      AF00DDAFAF00DDAFAF00D49999004D4D4D00000000000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DFFBFD004D4D4D0000000000000000004040400080E0E0004040
      4000C0A06000C0A06000C0A06000C0A06000C0A06000C0A06000C0A06000C0A0
      6000C0A060004040400080E0E000404040000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000BF676700FFCCCC00DDAF
      AF00DDAFAF00DDAFAF00DDAFAF004D4D4D004D4D4D004D4D4D00DDAFAF00DDAF
      AF00DDAFAF00DDAFAF00D49999004D4D4D00000000000000000066666600FFFF
      FF00FFFFFF00B0903D00B0903D00B0903D00B0903D00B0903D00B0903D00B090
      3D00FFFFFF00DFFBFD004D4D4D000000000000000000000000004040400080E0
      E00040404000C0A06000C0A06000C0A06000C0A06000C0A06000C0A06000C0A0
      60004040400080E0E00040404000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000084848400000000000000000000000000BF676700FFCCCC00DDAF
      AF00DDAFAF00DDAFAF00DDAFAF00CF8C8C004D4D4D00CF8C8C00DDAFAF00DDAF
      AF00DDAFAF00DDAFAF00D49999004D4D4D00000000000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DFFBFD004D4D4D00000000000000000000000000000000004040
      400080E0E00040404000C0A06000C0A06000C0A06000C0A06000C0A060004040
      400080E0E0008060600040404000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000084848400FFFFFF000000000000000000BF676700FFCCCC00DDAF
      AF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAF
      AF00DDAFAF00DDAFAF00D49999004D4D4D00000000000000000066666600FFFF
      FF00FFFFFF00B0903D00B0903D00B0903D00B0903D00B0903D00B0903D00B090
      3D00DFFBFD00DFFBFD004D4D4D00000000000000000000000000000000000000
      00004040400080E0E00040404000C0A06000C0A06000C0A060004040400080E0
      E00040404000C060A00040404000000000000000000000000000000000000000
      00000000FF000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000008484840084848400848484000000000000000000BF676700FFCC
      CC00DDAFAF00DDAFAF00DDAFAF004D4D4D004D4D4D004D4D4D00DDAFAF00DDAF
      AF00DDAFAF00DDAFAF004D4D4D0000000000000000000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DFFBFD00DFFBFD004D4D4D00000000000000000000000000000000000000
      0000000000004040400080E0E00040404000C0A060004040400080E0E0008060
      600040404000C060A00040404000000000000000000000000000000000000000
      FF00FFFFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000BF676700FFCC
      CC00DDAFAF00DDAFAF00DDAFAF004D4D4D004D4D4D004D4D4D00DDAFAF00DDAF
      AF00DDAFAF00DDAFAF004D4D4D0000000000000000000000000066666600FFFF
      FF00FFFFFF00B0903D00B0903D00B0903D00B0903D00FFFFFF00FFFFFF006666
      660066666600666666004D4D4D00000000000000000000000000000000000000
      000000000000000000004040400080E0E0004040400080E0E000404040000000
      000040404000C060A000404040000000000000000000000000000000FF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF0000000000000000000000000000000000000000000000000000000000BF67
      6700FFCCCC00FFCCCC00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAFAF00DDAF
      AF00DDAFAF004D4D4D000000000000000000000000000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006666
      6600EAFFFF00EAFFFF004D4D4D00000000000000000000000000000000000000
      00000000000000000000000000004040400080E0E00040404000000000000000
      000040404000404040004040400000000000000000000000FF00FFFFFF000000
      8400000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000BF676700BF676700FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC004D4D
      4D004D4D4D00000000000000000000000000000000000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006666
      6600EAFFFF006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004040400000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BF676700BF676700BF676700BF676700BF6767000000
      0000000000000000000000000000000000000000000000000000999999006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A0A0004040
      4000404040004040400040404000404040004040400040404000404040004040
      40004040400040404000A4A0A000000000000000000000000000000000003163
      730031637300316373005A739400398CBD00398CBD0000639400006394000063
      9400006394000063940000000000000000000000000000000000000000000000
      00000000000000000000CF9808007F5B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F5B0000CF980800000000000000
      00000000000000000000000000000000000000000000000000004040400080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E00080E0E00040404000000000000000000000000000000000003163
      7300F7EFE700F7EFE700F7EFDE00F7EFDE00F7EFE700F7EFE700F7F7EF00F7F7
      EF00F7EFE7000063940000000000000000000000000000000000000000000000
      000000000000000000007F5B0000CF9808007F5B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F5B0000CF9808007F5B0000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF0080208000F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF0080E0E00040404000000000000000000000000000000000003163
      73005A739400293139005A739400EFE7DE00F7EFE700F7EFE700F7EFE700F7F7
      EF00F7EFE7000873AD0000000000000000000000000000000000000000000000
      000000000000000000007F5B0000F6CB9700CF9808007F5B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000CF980800F6CB97007F5B0000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF008020800080208000F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF0080E0E00040404000000000000000000000000000316373003163
      730029313900318CD600293139003163730031637300F7EFE700F7EFE700F7EF
      E700F7EFE7000873AD0000000000000000000000000000000000000000000000
      000000000000000000007F5B0000F6CB9700F6CB9700CF9808007F5B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000CF980800F6CB9700F6CB97007F5B0000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF008060A00080208000802080008020800080208000C0A0C000F0FB
      FF00F0FBFF0080E0E00040404000000000000000000000000000104A8C00398C
      BD00318CD60031A5FF00318CD600398CBD00104A8C00F7EFDE00F7EFE700F7EF
      E700F7EFE7000873AD0000000000000000000000000000000000CF9808007F5B
      00007F5B00007F5B00007F5B0000F6CB9700F6CB9700F6CB9700CF9808007F5B
      0000000000000000000000000000000000000000000000000000000000000000
      00007F5B0000CF980800F6CB9700F6CB9700F6CB97007F5B00007F5B00007F5B
      00007F5B0000CF9808000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF008060A00080208000F0FBFF00F0FBFF0080208000F0FB
      FF00F0FBFF0080E0E0004040400000000000000000005A7394002931390029D6
      FF0063949C002931390063949C0029D6FF00293139005A739400EFE7EF00F7EF
      E700F7EFE7000073AD00000000000000000000000000000000007F5B0000F6CB
      9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700CF98
      08007F5B00000000000000000000000000000000000000000000000000007F5B
      0000CF980800F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB
      9700F6CB97007F5B00000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF008060A000F0FBFF00F0FBFF0080208000F0FB
      FF00F0FBFF0080E0E000404040000000000000000000293139004AB5FF0029D6
      FF0029313900F7F7F700293139004AB5FF0029D6FF0029313900F7EFEF00F7F7
      EF00EFEFEF006BB5C600000000000000000000000000000000007F5B0000F6CB
      9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB
      9700CF9808007F5B0000000000000000000000000000000000007F5B0000CF98
      0800F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB
      9700F6CB97007F5B00000000000000000000000000000000000040404000F0FB
      FF00F0FBFF0080208000F0FBFF00F0FBFF00F0FBFF00F0FBFF0080208000F0FB
      FF00F0FBFF0080E0E0004040400000000000000000005A739400293139006BCE
      F70063949C002931390063949C006BCEF700293139005A739400F7F7EF00F7F7
      EF00FFF7E700398CBD00000000000000000000000000000000007F5B0000F6CB
      9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB
      9700FFF3D500CF98080000000000000000000000000000000000CF980800FFF3
      D500F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB
      9700F6CB97007F5B00000000000000000000000000000000000040404000F0FB
      FF00F0FBFF0080208000F0FBFF00F0FBFF0080208000F0FBFF00F0FBFF00F0FB
      FF00F0FBFF0080E0E0004040400000000000000000000000000000086B00398C
      BD006BCEF7006BCEF7006BCEF700398CBD0031637300F7F7F700F7F7EF00F7F7
      EF00F7F7EF00398CBD00000000000000000000000000000000007F5B0000FFF3
      D500FFF3D500FFF3D500FFF3D500FFF3D500F6CB9700F6CB9700F6CB9700FFF3
      D500CF980800000000000000000000000000000000000000000000000000CF98
      0800FFF3D500F6CB9700F6CB9700F6CB9700FFF3D500FFF3D500FFF3D500FFF3
      D500FFF3D5007F5B00000000000000000000000000000000000040404000F0FB
      FF00F0FBFF0080208000F0FBFF00F0FBFF008020800080208000F0FBFF00F0FB
      FF00F0FBFF0080E0E00040404000000000000000000000000000316373003163
      7300293139009CFFFF0029313900104A8C0031637300FFFFF700F7F7EF00FFFF
      EF00F7F7EF002973AD0000000000000000000000000000000000CF980800CF98
      0800CF980800CF9808007F5B0000FFF3D500F6CB9700F6CB9700FFF3D500CF98
      0800000000000000000000000000000000000000000000000000000000000000
      0000CF980800FFF3D500F6CB9700F6CB9700FFF3D5007F5B0000CF980800CF98
      0800CF980800CF9808000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00C0A0C000802080008020800080208000802080008060A000F0FB
      FF0080E0E00080E0E00040404000000000000000000000000000000000002973
      AD005A739400293139005A739400FFFFFF00FFFFFF00FFFFF7008CC6E70073B5
      DE005AADD6002973AD0000000000000000000000000000000000000000000000
      000000000000000000007F5B0000FFF3D500F6CB9700FFF3D500CF9808000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CF980800FFF3D500F6CB9700FFF3D5007F5B0000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00802080008060A000F0FBFF004060
      600040606000406060004040400000000000000000000000000000000000398C
      BD00FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF70073B5DE005AAD
      D600398CBD000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000FFF3D500FFF3D500CF980800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CF980800FFF3D500FFF3D5007F5B0000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF008060A000F0FBFF00F0FBFF004060
      6000F0FBFF00F0FBFF0040404000000000000000000000000000000000002973
      AD00F7F7F700F7F7F700FFFFF700F7F7F700F7F7F700F7F7F7005AADD600398C
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000FFF3D500CF98080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CF980800FFF3D5007F5B0000000000000000
      000000000000000000000000000000000000000000000000000040404000F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF004060
      6000F0FBFF00404040000000000000000000000000000000000000000000398C
      BD002973AD00398CBD002973AD00398CBD002973AD00398CBD002973AD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000CF9808000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF9808007F5B0000000000000000
      0000000000000000000000000000000000000000000000000000A4A0A0004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD948400F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00AD94840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD948400F7E7DE00EFE7
      DE00F7E7DE00EFE7DE00F7E7DE00EFE7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00AD948400000000000000000000000000000000000000
      000000000000A5E7FF00A5E7FF00A5E7FF00A5E7FF0000000000000000000000
      00000000000000000000000000000000000000000000AD948400F7E7DE00B58C
      7300B58C7300B58C7300F7E7DE00F7E7DE00F7E7DE00F7EFDE00F7E7DE00F7E7
      DE00F7E7DE00AD94840000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000000000000000FF00000000000000
      FF000000000000000000000000000000000000000000AD948400F7E7DE005A63
      E7005A63E7005A63E7005A63E7005A63E7005A63E700F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00AD948400000000000000000000000000000000000000
      0000A5E7FF00000000000000000000000000A5E7FF0000000000000000000000
      00000000000000000000000000000000000000000000A59C9400F7E7DE009463
      29009463290094632900F7E7DE00D6CEC600D6C6B500D6CEC600D6C6B500D6CE
      C600F7E7DE00AD94840000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000000000000000FF00000000000000
      FF000000000000000000000000000000000000000000AD948400F7EFDE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7EFDE00F7EFE700F7F7E700F7F7E700F7F7
      E700F7F7E700F7EFDE00A59C9400000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF0000000000A5E7FF0000000000000000000000
      00000000000000000000000000000000000000000000A59C9400F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFDE00F7EFE700F7EFE700F7EF
      DE00F7EFE700A59C940000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      FF000000FF000000FF00000000000000000000000000A59C9400F7EFE700008C
      DE00008CDE00008CDE00008CDE00F7EFE7005AA55A005AA55A005AA55A005AA5
      5A005AA55A00F7EFE700A59C9400000000000000000000000000000000000000
      0000A5E7FF00000000000000000000000000A5E7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000F7EFE700F7EF
      E700086BA500F7EFE700F7EFE700D6CEC600D6CEC600F7EFE700D6CEC600D6CE
      C600F7EFE7009C9C9C0000000000000000000000000000000000000000000000
      000000000000000000000000FF0008BDEF0031D6FF000000FF0063ADDE000000
      FF0000000000000000000000FF0000000000000000009C9C9C00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE7009C9C9C00000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF0000000000A5E7FF0000000000A5E7FF000000
      0000000000000000000000000000000000000000000000000000F7EFE700086B
      A50084DEF700086BA500F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE7009C9C9C000000000000000000D6B5AD0000000000000000000000
      000094524A00000000000000FF0008BDEF0031D6FF000000FF0008BDEF000000
      FF000000FF000000FF000000000000000000000000009C9C9C00F7EFE7009463
      290094632900946329009463290094632900946329009463290094632900F7EF
      E700F7EFE700F7EFE7009C9C9C00000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF0000000000A5E7FF0000000000A5E7FF000000
      0000000000000000000000000000000000000000000000000000086BA50084DE
      F70084DEF70084DEF700086BA500F7F7EF00F7F7EF00D6CEC600D6C6B500D6CE
      C600F7EFE70094ADAD000000000000000000AD7B6300D6AD9400C69C8C00B594
      730094422900C69C8C001084BD0008BDEF0031D6FF0031D6FF0000F7FF000000
      0000000000000000000000000000000000000000000094ADAD00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF0094ADAD00000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF0000000000A5E7FF0000000000A5E7FF000000
      000000000000000000000000000000000000000000000873AD0084DEF70084DE
      F70084DEF70084DEF70084DEF7000873AD00F7EFEF00F7F7EF00F7F7EF00F7EF
      EF00F7F7EF0094ADAD000000000000000000CE845200E7CEBD00E7BDA500D694
      6B00AD5A42009442290039C6DE0010ADDE0000F7FF0031D6FF0000F7FF0063AD
      DE00000000000000000000000000000000000000000094ADAD00F7EFEF009463
      290094632900946329009463290094632900F7F7EF00008CDE00008CDE00008C
      DE00008CDE00F7EFEF0094ADAD00000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF0000000000A5E7FF0000000000A5E7FF000000
      0000000000000000000000000000000000000873AD0094E7F70094E7F70094E7
      F70094E7F70094E7F70094E7F70094E7F7000873AD00F7F7EF00D6CEC600D6CE
      C600F7F7EF0094ADAD000000000000000000E7CEBD00E7BDA500E7CEBD00CE9C
      7B00AD735A0094524A00B5DEF7001084BD0031D6FF006BD6FF006BD6FF0008BD
      EF00000000000000000000000000000000000000000094ADAD00F7F7EF00F7F7
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF0094ADAD00000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF0000000000A5E7FF0000000000A5E7FF000000
      0000000000000000000000000000000000000873AD000873AD000873AD00A5E7
      FF00A5E7FF00A5E7FF000873AD000873AD000873AD00F7F7EF00F7F7EF00F7F7
      EF00FFF7F70094ADAD00000000000000000000000000D6946B00E7CEBD00EFAD
      8400CE845200AD5A4200CECECE00B5C6C60029C6730029C6730029C6730084B5
      840094ADAD000000000000000000000000000000000094ADAD00F7F7F7005A63
      E7005A63E7005A63E7005A63E7005A63E7005A63E700F7F7F700F7F7EF00F7F7
      EF00F7F7EF00F7F7EF0094ADAD00000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF0000000000A5E7FF0000000000A5E7FF000000
      00000000000000000000000000000000000000000000000000000873AD00B5EF
      F700B5EFF700B5EFF7000873AD00FFF7F700FFF7F700FFF7F700D6CEC600D6C6
      B500F7F7F70084ADBD00000000000000000000000000CE9C7B00E7BDA500D6AD
      9400CE845200AD735A00BDBDBD002184520029C6730029C6730029C6730029C6
      7300218452000000000000000000000000000000000084ADBD00FFFFFF00F7FF
      F700FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFFF
      F700FFFFF700FFF7F70084ADBD00000000000000000000000000000000000000
      0000A5E7FF0000000000A5E7FF00A5E7FF00A5E7FF0000000000A5E7FF000000
      0000000000000000000000000000000000000000000000000000107BBD00D6F7
      FF00D6F7FF00C6F7FF000873AD00FFFFF700FFF7F700FFF7F700F7F7F700FFF7
      F700F7F7F70084ADBD000000000000000000000000004284EF004284EF007BBD
      E7007384EF004284EF002921CE0063A55A0029C6730029C6730029C6730029C6
      730029C673000000000000000000000000000000000084ADBD00000000005AA5
      5A005AA55A005AA55A000000000000000000008CDE00008CDE00008CDE00008C
      DE00008CDE000000000084ADBD00000000000000000000000000000000000000
      0000A5E7FF000000000000000000A5E7FF000000000000000000A5E7FF000000
      0000000000000000000000000000000000000000000000000000107BBD00D6F7
      FF00D6F7FF00D6F7FF00107BBD0000000000D6CEC600D6CEC600D6CEC600D6CE
      C6000000000084ADBD00000000000000000000000000C6CEEF00218CF70039C6
      DE00218CF700214ADE00214ADE009CDEA5002184520029C6730029C6730029C6
      730029C673000000000000000000000000000000000084ADBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084ADBD00000000000000000000000000000000000000
      0000A5E7FF00A5E7FF00000000000000000000000000A5E7FF00A5E7FF000000
      0000000000000000000000000000000000000000000000000000107BBD00EFFF
      FF00EFFFFF00EFFFFF00107BBD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004284EF004ABD
      FF00218CF700214ADE001839BD00C6DEDE002184520029C6730029C6730029C6
      730029C6730084A5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5E7FF00A5E7FF00A5E7FF00A5E7FF00A5E7FF00000000000000
      0000000000000000000000000000000000000000000000000000107BBD00EFFF
      FF00EFFFFF00EFFFFF00107BBD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CC6E70031A5
      FF00398CDE00218CF700214ADE009C9CE700218452009CDEA500000000000000
      0000C6CECE0063A55A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000107B
      BD00107BBD00107BBD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000218C
      F700218CF700218CF700214ADE009C9CE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005AA5
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000397BE7000021A50000000000000000000000
      00000000000000000000000000000000000000000000000000005AA55A0021C6
      73005AA55A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000397BE700397BE700397BE7000021A5000021A500000000000000
      00000000000000000000000000000000000000000000000000005AA55A006BEF
      9C0021C673005AA55A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B8484007B84
      8400A5A5A5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B8484007B84
      8400A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000397BE7000021A50000BDE700397BE7000021A5000021A500000000000021
      A50000000000000000000000000000000000000000005AA55A005AA55A009CEF
      C6006BEF9C0021C6730031A53100000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B8484007B848400A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B8484007B848400A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000397B
      E70000BDE7000021A50000BDE7000021A500000000000021A500000000000021
      A5000021A5000000000000000000000000000000000031A531006BEF9C009CEF
      C6006BEF9C009CEFC6005AA55A005AA55A000000000000000000000000000000
      0000000000000000000000000000000000007B8484007B848400A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B8484007B848400A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000BD
      E70000BDE7000021A5000021A500397BE7000021A50000000000000000000021
      A5000021A50000000000000000000000000084AD7B006BEF9C009CEFC6005AA5
      5A009CDEA5009CEFC6006BEF9C0021C673005AA55A0000000000000000000000
      0000000000000000000000000000000000007B848400A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B848400A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000BD
      E7000021A5000021A50000BDE700397BE7000021A5000021A500000000000000
      00000021A50000000000000000000000000031A531009CEFC6005AA55A0031A5
      310031A531006BEF9C009CEFC6009CEFC60021C673005AA55A00000000000000
      000000000000000000000000000000000000A5A5A5007B8484007B8484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A5007B8484007B8484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000021
      A50000BDE7000021A50000BDE700397BE700397BE7000021A500000000000021
      A500000000000000000000000000000000005AA55A006BEF9C005AA55A000000
      00000000000031A531005AA55A006BEF9C009CEFC60021C673005AA55A000000
      00000000000000000000000000000000000000000000A5A5A5007B8484007B84
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A5007B8484007B84
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000BD
      E70000BDE7000021A50000BDE70000F7FF0000F7FF00397BE7000021A5000021
      A5000021A5000000000000000000000000005AA55A005AA55A00000000000000
      000000000000000000005AA55A0031A531006BEF9C009CEFC60021C6730084AD
      7B00000000000000000000000000000000000000000000000000A5A5A5007B84
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5007B84
      84007B8484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000BD
      E70000BDE70000F7FF000021A5000021A50000F7FF000021A50000F7FF00397B
      E7000021A5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031A531006BEF9C006BEF9C0021C6
      730084AD7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000BD
      E70000F7FF0000F7FF0000F7FF0000F7FF000021A50000F7FF0000F7FF0000F7
      FF00397BE7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031A5310021C673006BEF
      9C0031A5310084AD7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000F7FF0000F7FF000021A5000021A50000F7FF000021A50000F7FF0000F7
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005AA55A0031A5
      31006BEF9C0031A5310084AD7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000F7FF0000F7FF0000F7FF0000F7FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009CDE
      A50031A5310021C6730031A53100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031A5310031A53100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B8484000000000000000000000000000000
      00000000000000000000000000007B8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A5A50000000000846B6300000000000000000000000000000000000000
      00000000000000000000846B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B4A00006B210000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B7373000000000000000000000000000000000000000000000000007B4A
      00007B4A00007B4A00006B2100000000000000000000C6C68400C6C68400C6C6
      8400C6C68400C6C6840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A5A5000000000000000000A5A5A50000000000846B6300000000000000
      00000000000000000000846B630000000000000000000000000000000000D6D6
      D600CECEC600CECEC600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600CECE
      C6000000000000000000000000000000000000000000000000007B4A0000CE63
      1800CE6318007B4A00006B210000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000073AD000000000000000000000000000000
      0000000000000000000000639400000000000000000000000000000000006B21
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6BDB500000000000000000000000000000000000000000000000000FFFF
      FF00D6D6D6007B84840021212100000000002121210094949400FFFFFF00D6D6
      D60000000000000000000000000000000000000000007B4A0000CE631800CE63
      1800CE6318007B4A00006B2100000000000000000000C6C68400C6C68400C6C6
      8400C6C68400C6C6840000000000000000000000000000000000000000000000
      0000000000000000000000000000107BBD000073AD0000000000000000000000
      000000000000006394000073AD00000000000000000000000000000000008C00
      00006B2100000000000000000000A5A5A5000000000000000000000000000000
      0000846B630000000000846B630000000000000000000000000000000000FFFF
      FF007B8484000000080000009C000000AD0000009C000000080094949400D6D6
      D6000000000000000000000000000000000000000000CE631800CE631800CE63
      1800CE6318007B4A00006B210000000000000000000000000000000000000000
      000000000000000000007B8484000000000000000000000000009C9C9C005A5A
      5A0000000000000000000000000029D6FF00107BBD00006394000073AD000073
      AD00107BBD000073AD0029D6FF00000000008C0000008C0000008C0000008C00
      00006B2100006B21000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00212121001039B5002921C6001039B5002921C6001039B50021212100D6D6
      D6000000000000000000000000000000000000000000CE631800CE631800CE63
      1800CE6318007B4A00006B2100000000000000000000C6C68400C6C684000000
      00000000000000000000000000000000000000000000424A420000000000E7E7
      E70000000000E7E7E70000000000A5E7FF0094E7F7008CC6E70084DEF700A5E7
      FF0094E7F70073B5DE0094E7F700101010000000000000000000000000008C00
      00008C0000000000000000000000A5A5A50000000000846B6300000000000000
      00000000000000000000846B630000000000000000000000000000000000FFFF
      FF00000000003952C6003952C6003952C6003952C6003952C60000000000D6D6
      D6000000000000000000000000000000000000000000CE631800CE631800CE63
      1800CE631800CE6318007B4A0000000000000000000000000000000000000000
      0000000000007B848400000000000000000000000000000000009C9C9C005A5A
      5A000000000000000000000000004AB5FF0084DEF70008ADDE00008CDE0029D6
      FF00008CDE0008ADDE004AB5FF00000000000000000000000000000000008C00
      0000000000000000000000000000A5A5A50000000000C6BDB500000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00212121005A63E7005A63E7005A63E7005A63E7005A63E70021212100D6D6
      D6000000000000000000000000000000000000000000CE631800CE631800CE63
      1800CE631800F79C0000F79C00000000000000000000FFFFF700000000007B84
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000BDE70000BDE70000000000000000002931
      3900000000000073AD0029D6FF00000000000000000000000000000000000000
      0000A5A5A5000000000000000000A5A5A50000000000846B6300000000000000
      00000000000000000000846B630000000000000000000000000000000000FFFF
      FF006B737300293139006B7BEF00949CE7006B7BEF002931390000000000D6D6
      D6000000000000000000000000000000000000000000CE631800CE631800F79C
      0000F79C0000F79C0000F79C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008CDE000000000000000000000000000000
      00000000000000000000008CDE00000000000000000000000000000000000000
      0000A5A5A5000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BDBDBD006B7373002121210000000000212121007B848400D6D6D600CECE
      C6000000000000000000000000000000000000000000CE631800F79C0000F79C
      0000F79C0000F79C0000F79C0000F79C0000F79C0000F79C00008C0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A5A50000000000846B6300000000000000000000000000000000000000
      00000000000000000000846B630000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000F79C0000F79C
      0000F79C0000F79C0000F79C0000F79C0000F79C0000F79C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B7373000000000000000000000000000000000000000000000000000000
      0000F79C0000F79C0000F79C0000F79C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000846B
      6300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000846B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000BD000000BD000000
      BD000000BD000000BD000000BD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000BD000000BD00
      000000000000BD000000BD000000BD0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000BD000000BD000000
      000000000000000000000000BD00000000000000000000000000000000007B7B
      7B00000000007B7B7B000000000000000000000000007B7B7B00BD0000000000
      00000000000000000000BD0000007B7B7B000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000084008400008484000084
      8400008484000084840000000000000000000000000000000000008484000084
      8400000000008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BD000000
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD000000BD00
      0000BD000000BD000000BD000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084840000FFFF0000FF
      FF0000FFFF0000848400C6C6C600C6C6C600C6C6C600000000000084840000FF
      FF00008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      BD000000BD0000000000000000000000000000000000000000007B7B7B000000
      000000000000000000007B7B7B000000000000000000000000007B7B7B00BD00
      000000000000BD0000007B7B7B000000000000000000000000007B7B7B000000
      000000000000000000007B7B7B0000000000000000000084840000FFFF0000FF
      FF000084840000840000FFFFFF00FFFFFF00FFFFFF00C6C6C6008484840000FF
      FF0000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000BD000000BD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD00
      0000BD000000BD00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840084000084
      840000848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000008484008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000000000000000000008484840000000000000000000000BD00000000000000
      0000000000000000BD000000BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00BD0000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400000000000000000000000000000000000000BD000000BD000000
      BD000000BD000000BD000000BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000000000000000000000000000BD000000BD000000BD00
      000000000000BD000000BD000000BD0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BD000000
      BD000000BD000000BD000000BD000000BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848400000000
      0000840084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400000000000000000000000000000000007B7B7B00BD0000000000
      00000000000000000000BD0000007B7B7B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BD000000
      BD000000000000000000000000000000BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C600000000008400
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD000000BD00
      0000BD000000BD000000BD000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      BD000000BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084008400C6C6C60084848400C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00BD00
      000000000000BD0000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000BD000000BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840000FFFF0000FFFF0000FFFF0000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000008400000084000000840000000000
      000000000000000000000000000000000000000000000000000000000000BD00
      0000BD000000BD00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000BD000000BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084848400008484008484840000000000840084000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00BD0000007B7B7B0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BD000000
      000000000000000000000000BD000000BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000840084008484840000000000C6C6C60000000000840084000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000008400000000000000000000008400000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BD000000
      BD000000BD000000BD000000BD000000BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B50052525200424242003939
      3900000000000000000000000000000000000000FF00CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005252520042424200D6D6
      D6006363630073737300B5B5B500D6D6D600DEDEDE0052525200424242004242
      420000000000000000000000000000000000CE6300000000FF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD000000FF00CE63000000000000000000000000000000000000BD00
      00000000000000000000BD0000000000000000000000BD000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005252520042424200D6D6
      D6005252520063636300B5B5B500CECECE00D6D6D60052525200424242004242
      420042424200393939000000000000000000CE630000FFFFFF000000FF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD000000FF00FFD6AD00CE6300000000000000000000BD000000000000000000
      0000BD0000000000000000000000BD0000000000000000000000BD0000000000
      000000000000BD0000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000005252520042424200DEDE
      DE00D6D6D600D6D6D600D6D6D600D6D6D600CECECE0052525200424242004A4A
      4A0042424200424242000000000000000000CE630000FFFFFF00FFFFFF000000
      FF000000FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB5000000FF000000
      FF00FFD6AD00FFD6AD00CE630000000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD00000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000052525200424242004242
      4200424242004242420042424200424242004242420042424200424242004A4A
      4A0042424200424242004242420039393900CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFF700FFF7E700FFEFD6000000FF00FFDEB500FFD6
      AD00FFD6AD00FFD6AD00CE63000000000000000000000000000000000000BD00
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005252520042424200FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700424242005252
      5200424242004A4A4A004242420042424200CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFF7000000FF00FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00CE6300000000000000000000BD000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD0000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000005252520042424200FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700424242006363
      6300424242004A4A4A004242420042424200CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00CE630000000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD00000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000005252520042424200FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700424242006363
      63004242420052525200424242004A4A4A00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFF700FFF7E700FFEF
      D600FFE7C600FFDEB500CE63000000000000000000000000000000000000BD00
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005252520042424200FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700424242006363
      63004242420063636300424242004A4A4A00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFF700FFF7
      E700FFEFD600FFE7C600CE6300000000000000000000BD000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD00000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000005252520042424200FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700424242006363
      630042424200636363004242420052525200CE630000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFF7E700FFEFD600CE630000000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000005252520042424200EF8C
      3100EF8C2900E78C2900E7842100DE842100DE7B2100D67B1800424242006363
      630042424200636363004242420063636300CE630000FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF00FFF7E700CE63000000000000000000000000000000000000BD00
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      520042424200FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F70042424200636363004242420063636300CE6300000000FF00CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE6300000000FF00CE6300000000000000000000BD000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      000000000000BD00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      520042424200EF8C3100EF8C2900E78C2900E7842100DE842100DE7B2100D67B
      1800424242006363630042424200636363000000FF00CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000FF00000000000000000000000000BD0000000000
      000000000000BD0000000000000000000000BD0000000000000000000000BD00
      00000000000000000000BD000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005252520042424200FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F70042424200636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD00
      00000000000000000000BD0000000000000000000000BD000000000000000000
      0000BD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005252520042424200EF8C3100EF8C2900E78C2900E7842100DE84
      2100DE7B2100D67B180042424200636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006329100063291000632910006329100063291000632910000000
      0000000000000000000000000000000000000000000042637300BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B29
      100063291000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A00006329
      100063291000000000000000000000000000639CC600108CE700427BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000808080008080800080808000808
      0800080808000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000029DE000029DE00000000000000000084310800B542
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000B54A000063291000000000000000000042B5FF004AB5FF00188CEF00427B
      A500C69494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF080800000000000000
      000000000000000000000000000000000000000000000029DE000029DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000029DE000029DE00000000000000000084310800B5420000BD4A
      0000B5420000B5420000B5420000B5420000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000B54A00006329100000000000000000004AB5FF004AB5FF001084
      E700427BA500C694940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000808080008080800080808000808
      080008080800080808000000000000000000FF080800FF080800000000000000
      000000000000000000000000000000000000000000000029DE000029DE000029
      DE00000000000000000000000000000000000000000000000000000000000000
      00000029DE000029DE00000000000000000000000000AD420000B5420000B542
      0000B5420000B5521000C6733100CE7B4200CE7B4200C66B2900BD4A0000BD4A
      0000BD4A0000BD4A00006B2910000000000000000000000000004AB5FF0042B5
      FF00108CE700427BA500BD949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF080800FF080800FF080800FF080800FF08
      0800FF080800000000000000000000000000000000000029DE000029DE000029
      DE000029DE000000000000000000000000000000000000000000000000000029
      DE000029DE0000000000000000000000000094390000BD4A0000B54A0000B54A
      0000CE844200FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7B58C00B5420000BD4A
      0000BD4A0000BD4A0000BD4A0000632910000000000000000000000000004AB5
      FF0042B5FF001884DE00526B6B00004A0000004A0000004A0000005A0000004A
      0000000000000000000000000000000000000808080008080800080808000808
      080008080800080808000000000000000000FF080800FF080800000000000000
      0000FF08080000000000000000000000000000000000000000000029EF000029
      DE000029DE000029DE00000000000000000000000000000000000029DE000029
      DE000000000000000000000000000000000094390000BD520800BD520800BD52
      0800FFFFFF00DEAD8400BD631800B55A1000B5520800AD420000B5420000BD4A
      0000BD4A0000BD4A0000BD4A00006B2910000000000000000000000000000000
      00004ABDFF00B5D6EF00105A180039632100295A1000215A0800007308000073
      080018520800CEADA50000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF080800000000000000
      0000FF0808000000000000000000000000000000000000000000000000000000
      00000029DE000029DE000029DE00000000000029DE000029DE000029DE000000
      00000000000000000000000000000000000094390000C66B1800C6631800BD63
      1800FFFFFF00C66B2100BD5A1000B5520800B54A0000DEB58C00B5420000B542
      0000BD4A0000BD4A0000BD4A00006B2910000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD6001063080010BD
      4200006B00006B733900B58C8C00000000000808080008080800080808000808
      0800080808000808080000000000000000000000000000000000000000000000
      0000FF0808000000000000000000000000000000000000000000000000000000
      0000000000000029DE000029E7000029E7000029E7000029DE00000000000000
      00000000000000000000000000000000000094390800D68C4A00CE7B3100C673
      2900FFFFFF00DEA56B00C66B2100BD631000B5520800FFFFFF00DEAD8400B542
      0000BD4A0000BD4A0000BD4A00006B291000000000000000000000000000004A
      0000004A0000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD6005A9C520010AD
      310010AD31004A732900DED6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000029E7000029E7000029EF0000000000000000000000
      00000000000000000000000000000000000094390000DEA56B00DE9C6300CE84
      3900EFC6A500FFFFFF00F7DECE00F7DEC600F7E7DE00FFFFFF00FFFFFF00E7C6
      9C00BD4A0000BD4A0000BD4A00006B2910000000000000000000004A0000106B
      1000005A000031631800FFE7AD00F7CE9400004A0000004A0000006B000021C6
      4A0021CE520000730800004A0000004A00000808080008080800080808000808
      0800080808000808080008080800080808000808080008080800080808000808
      0800080808000808080000000000000000000000000000000000000000000000
      0000000000000029DE000029EF000029E7000029EF000029F700000000000000
      00000000000000000000000000000000000094390000E79C6300EFC6A500DE9C
      5A00DE945200E7B58400EFCEAD00E7C69C00EFD6BD00FFFFFF00FFFFFF00E7BD
      9400BD4A0000BD4A0000BD4A00006329100000000000000000000052000018B5
      390018B53900086310004A8C3100EFBD84004A8C3100188C39000894210039EF
      6B0029E763000884180031631800C6AD9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000029F7000029EF000029E70000000000000000000029F7000029F7000000
      000000000000000000000000000000000000000000009C421000EFCEAD00F7CE
      AD00E7AD7300DE945200D6844200CE732900C66B1800FFFFFF00E7AD7B00BD4A
      0000BD4A0000BD4A00006B2910000000000000000000004A00000884180029E7
      630039EF6B0008942100188C39004A8C3100F7CE94004A9439000863100018B5
      390018B53900106B2100F7EFD600C6A59C000808080008080800080808000808
      0800080808000808080008080800080808000808080008080800080808000808
      0800080808000808080008080800000000000000000000000000000000000029
      FF000029EF000029F700000000000000000000000000000000000029FF000029
      F700000000000000000000000000000000000000000094390000E7A56B00F7E7
      CE00F7D6BD00E7AD7300D68C4200CE732900C66B1800E7AD7300C65A0800BD4A
      0000BD4A0000B54A00006329100000000000004A0000004A00000073080021CE
      520021C64A00006B0000004A0000004A0000F7D6A500F7CE9C004A8C3100005A
      0000106B1000427B2900E7DEBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000029F7000029
      F7000029FF000000000000000000000000000000000000000000000000000029
      F7000029F700000000000000000000000000000000000000000094390000E7A5
      6B00F7D6BD00F7DEC600EFC69C00E7A57300DE945200D68C4200CE732900C652
      0000B54A00007329080000000000000000000000000000000000004A000010AD
      310010AD3100215A1000DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD84005A94
      39005A9C4200FFF7C600BD9C8C00000000000808080008080800080808000808
      0800080808000808080008080800080808000808080008080800080808000808
      080008080800000000000000000000000000000000000029F7000029F7000029
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000029F70000000000000000000000000000000000000000009439
      00009C4A1000E7AD7300EFBD9400EFBD8C00E7AD7300DE8C4A00C66310009C42
      08006B2910000000000000000000000000000000000000000000004A0000006B
      000010BD4200004A000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000029F7000029F7000029F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C3900009C4208009C4208009C4208009C420800843108000000
      000000000000000000000000000000000000000000000000000000000000004A
      00000073080000730800004A0000105200004263210031631800DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000029F7000029F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042637300BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADA5008C8C8C00636B
      6300BDB5AD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CC600108CE700427BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADA59C009C522100844A
      18006B4218005A311800424A4200BDB5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF007B7B7B0000000000000000005AADD6006B8CCE006B8C
      CE006B8CCE006B8CCE006B8CCE006B8CCE006B8CCE006B8CCE006B8CCE006B8C
      CE006B8CCE006B8CCE006B8CCE006B8CCE0042B5FF004AB5FF00188CEF00427B
      A500C69494000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A59C9400AD4A0000DEAD
      7300EFB58C00C67B39009C5221005A311800424A4200BDB5AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF007B7B7B0000000000000000005AADD600ADDEEF00D6EF
      F700D6F7FF00C6F7FF00C6EFFF00C6EFFF00B5EFF700A5E7FF0094E7F70084DE
      F70084DEF7006BCEF70073B5DE006B8CCE00000000004AB5FF004AB5FF001084
      E700427BA500C694940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C948C00B5520800E7BD
      9400FFEFD600FFDEC600FFDEB500F7BD8400C68442009C5221004A2918000000
      0000000000000000000000000000000000000000000000000000BD000000FFFF
      FF0000000000FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD000000000000FFFF007B7B7B0000000000000000005AADD600D6EFF7008CC6
      E700D6EFF700EFFFFF00EFFFFF00D6F7FF00D6F7FF00C6EFFF00C6EFFF00B5EF
      F7009CCEE70073B5DE006BCEF7006B8CCE0000000000000000004AB5FF0042B5
      FF00108CE700427BA500BD949400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000948C7300B5520800E7C6
      AD00FFE7D600FFDEC600FFDEB500FFE7BD00FFD68400FFAD52006B3108009494
      9400000000000000000000000000000000000000000000000000BD000000BD00
      0000FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF007B7B7B0000000000000000005AADD600EFFFFF00D6EF
      F7008CC6E700D6E7E700EFFFFF00E7EFF700D6E7E700D6F7FF00C6F7FF009CCE
      E700949CE70084DEF7006BCEF7006B8CCE000000000000000000000000004AB5
      FF0042B5FF001884DE00526B6B0000000000AD7B6B00C6A59C00D6B5A500CEA5
      9C000000000000000000000000000000000000000000948C7300BD631000E7CE
      B500FFEFD600CED6CE00009CCE00FFDEB500FFC65200F7B56B005A3118008484
      84000000000000000000000000000000000000000000BD000000BD000000BD00
      0000BD000000FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD000000000000FFFF007B7B7B0000000000000000005AADD600EFFFFF00EFFF
      FF00D6F7FF0073B5DE00BDCEEF0073B5DE0073B5DE006B8CCE009CCEE70073B5
      DE009CCEE70084DEF7006BCEF7006B8CCE000000000000000000000000000000
      00004ABDFF00B5D6EF00A5948C00B59C8C00F7E7CE00FFFFD600FFFFD600FFFF
      D600E7DEBD00CEADA500000000000000000000000000948C7300BD631000FFDE
      C600DEE7DE00009CCE00009CCE00BDBDA50094946B00D6945A00844A10008484
      84009494940000000000000000000000000000000000BD000000BD000000BD00
      0000BD000000BD000000FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF007B7B7B0000000000000000005AADD600EFFFFF00EFFF
      FF00EFFFFF00C6F7FF006B8CCE00C6F7FF00C6F7FF00B5EFF7006B8CCE009CCE
      E70094E7F70084DEF70084DEF7006B8CCE000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD600FFFFD600FFFF
      DE00FFFFEF00F7F7EF00B58C8C0000000000000000009C846300C66B2100FFE7
      D60031ADD600BDD6DE00ADD6D600009CCE00A59C8400EFB58C00FFCE9400C684
      420094633100636B6300949494000000000000000000BD000000BD000000BD00
      0000BD000000BD000000BDBDBD00FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD000000000000FFFF007B7B7B0000000000000000005AADD600F7F7FF00EFFF
      FF00D6EFF700949CE700D6F7FF00D6F7FF00D6F7FF00C6F7FF00B5EFF70073B5
      DE009CCEE70094E7F70084DEF7006B8CCE000000000000000000000000000000
      000000000000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600FFFFDE00FFFF
      EF00FFFFF700FFFFFF00DED6BD0000000000000000009C846300C66B2100F7EF
      E700F7F7EF00FFF7E700DEE7DE0031A5BD00FFE7C600E7AD6B00C6844200FFCE
      9400FFCE9400BD946300525A8400636B63000000000000000000BD000000BD00
      0000FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF007B7B7B0000000000000000005AADD600F7FFFF00E7EF
      F7008CC6E700E7EFF700F7FFFF00EFFFFF00EFFFFF00D6F7FF00C6F7FF00C6EF
      FF0073B5DE00ADDEEF0094E7F7006B8CCE000000000000000000000000000000
      000000000000DEBDA500FFE7AD00F7CE9400FFF7CE00FFFFDE00FFFFE700FFFF
      F700FFFFF700FFFFEF00F7EFD600C69C9400000000009C846300C66B2100FFF7
      EF00FFF7F700FFF7E700FFF7E70042ADCE00F7EFDE00E7BD94005A3110008C7B
      5A00EFB58C00AD9C9C00295AD6004252B5000000000000000000BD000000BD00
      000000000000FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD000000000000FFFF007B7B7B0000000000000000005AADD600E7EFF7009CCE
      E700EFFFFF00FFFFFF00F7FFFF00F7FFFF00EFFFFF00EFFFFF00D6F7FF00C6F7
      FF00B5EFF7008CC6E7009CCEE7006B8CCE000000000000000000000000000000
      000000000000E7C6AD00FFDEAD00EFBD8400F7E7B500FFFFD600FFFFDE00FFFF
      E700FFFFE700FFFFDE00F7F7D600C6AD9C00000000009C846300CE7B3900FFF7
      F700FFFFFF00FFF7F700FFF7EF00ADD6D600CEE7E700F7BD94004A2918008484
      840000000000BDB5AD00396BD600394A9C000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF007B7B7B0000000000000000005AADD600ADDEEF00E7EF
      F700F7FFFF00F7FFFF00E7EFF700EFFFFF00E7EFF700D6F7FF00D6F7FF00D6F7
      FF00C6EFFF00B5EFF7009CCEE7006B8CCE000000000000000000000000000000
      000000000000DEBDAD00FFE7B500EFBD8400F7CE9400FFEFC600FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00F7EFD600C6A59C0000000000AD8C6300CE7B3900FFF7
      F700FFFFFF00FFFFFF00FFFFFF00D6EFEF00CEE7E700F7BD84004A2918008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF000000000000FFFF007B7B7B0000000000000000005AADD6005AADD6005AAD
      D6005AADD6005AADD6005AADD6005AADD6005AADD6005AADD6005AADD6005AAD
      D6005AADD6005AADD6005AADD6005AADD6000000000000000000000000000000
      000000000000C69C9400FFEFC600FFEFC600F7D6A500F7CE9C00F7E7B500FFF7
      CE00FFF7D600FFFFD600E7DEBD000000000000000000ADA59C00CE630800C673
      3100D6945A00DEB59C00EFCEC600F7EFE700FFFFFF00E7BD9400524221008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF00BDBDBD0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD8400F7CE
      9C00FFE7B500FFF7C600BD9C8C000000000000000000BDB5AD00E78C2100C65A
      0000C65A0000C65A0000BD520000C65A0800C67B3900C6733100524A29009494
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C000000000000000000000000000000000000000000BDB5
      AD00ADA59C009C948C00CE8C3900D6842900D6730800D66B0000949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400CEAD9C00DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B00000000000000000000000000000000000000AD948400AD94
      8400AD948400AD948400AD948400AD948400AD948400AD948400AD948400AD94
      8400000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
      00007B0000007B0000007B000000000000000000000000000000000000000000
      0000000000007B0000007B000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B0000007B000000000000000000000000000000AD948400F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00AD94
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000007B0000007B0000007B0000007B0000007B000000000000007B00
      0000000000007B000000000000007B0000000000000000000000000000000000
      00007B000000000000007B000000000000007B000000000000007B0000007B00
      00007B0000007B0000007B0000007B0000000000000000000000A59C9400F7EF
      E700CEB5A500CEB5A500CEB5A500B5A59400BD9C8400BD9C8400F7EFE700A59C
      9400000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B0000007B0000007B0000000000000000000000000000007B00
      00007B0000007B0000007B000000000000000000000000000000000000000000
      0000000000007B0000007B000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B0000007B0000000000000000000000000000009C9C9C00F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE7009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000007B0000007B000000000000000000000000000000000000000000
      00007B0000007B00000000000000000000000000000000000000000000000000
      000000000000000000007B000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B000000000000000000000000000000000000009C9C9C00F7EF
      E700CEB5A500CEB5A500CEB5A500CEAD9400BD9C8400BD9C8400F7EFE7009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B0000007B0000000000000000000000000000000000
      00007B0000007B00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094ADAD00F7F7
      EF00F7F7EF00F7F7EF00F7EFE700FFF7E700F7F7EF00F7F7EF00F7F7EF0094AD
      AD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B0000007B0000007B0000007B0000007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094ADAD00F7F7
      EF00CEB5A500CEB5A500CEB5A500B5A59400BD9C8400BD9C8400F7F7EF0094AD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B000000000000000000
      00007B0000007B00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094ADAD00F7F7
      EF00F7F7EF00F7F7EF00F7EFEF00F7F7EF00F7F7EF00F7F7EF00F7F7EF0094AD
      AD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B0000007B0000000000
      00007B0000007B000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084ADBD00FFF7
      F700CEB5A500CEB5A500CEB5A500CEAD9400BD9C8400FFF7F700188452001884
      520000000000000000000000000000000000000000007B7B7B00000000007B7B
      7B000000000000000000000000000000000000000000000000007B0000007B00
      00007B0000007B00000000000000000000000000000000000000BDBDBD000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084ADBD00F7F7
      F700FFFFF700F7F7F700F7F7F700FFFFF700FFF7F700FFF7F700188452001884
      5200000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084ADBD00FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF7001884520018845200188452001884
      5200188452001884520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000007B00000000000000000000000000000000000000000000007B7B
      7B000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000000000000000000000007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084ADBD0084AD
      BD0084ADBD0084ADBD0084ADBD0084ADBD001884520018845200188452001884
      5200188452001884520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000188452001884
      520000000000000000000000000000000000000000007B7B7B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000188452001884
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000C6A59C00FFEFD600F7E7
      C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE9400EFCE
      9400F7D69C00B58484000000000000000000000000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFF7E700FFEFD600FFEFD600FFE7C600FFDEBD00FFDEBD00FFDE
      B500FFD6AD00FFD6AD00CE6300000000000000000000CE630000FFE7C600FFDE
      BD00FFDEBD00FFDEB500FFD6AD00FFD6AD00CE630000FFE7C600FFDEBD00FFDE
      BD00FFDEB500FFD6AD00FFD6AD00CE63000000000000C6A59C00FFEFD600F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE9400EFCE
      9400EFCE9C00B584840000000000000000000000000000000000000000007B00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEF
      D600FFE7C600FFDEB500CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFF7E700FFEFD600FFE7C600FFDEB500CE630000FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE63000000000000C6ADA500FFEFE700F7E7
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE9C00EFCE
      9400EFCE9C00B5848400000000000000000000000000000000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFF7E700FFEFD600FFDEB500CE630000FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600CE63000000000000C6ADA500FFF7E700F7E7
      D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400B58484000000000000000000000000007B0000007B0000007B00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7E700FFEFD600CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE63000000000000CEB5AD00FFFFF700FFEF
      E700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE
      9C00EFCE9C00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE63000000000000D6B5AD00FFFFFF00FFF7
      EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6AD00F7D6
      A500F7D6A500B58484000000000000000000000000007B0000007B0000007B00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000D6BDB500FFFFFF00FFF7
      F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      B500F7D6AD00B5848400000000000000000000000000000000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFF7E700FFF7E700FFEFD600FFEFD600FFEFD600FFEFD600FFDEBD00FFDE
      BD00FFDEBD00FFDEBD00CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000D6BDB500FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DEBD00F7DE
      B500F7DEB500B584840000000000000000000000000000000000000000007B00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000DEBDB500FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DEC600F7DE
      C600F7D6B500B58484000000000000000000000000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFFF00FFFFFF00CE63000000000000DEC6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEFD600E7DE
      C600C6BDAD00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE63000000000000E7C6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A59400B594
      8C00B58C8400B58484000000000000000000000000007B0000007B0000007B00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000E7C6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C6B00EFB5
      6B00EFA54200C6846300000000000000000000000000000000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000EFCEBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C6947300FFC6
      6B00CE946B00000000000000000000000000000000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7C6B500FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C6947300CE9C
      84000000000000000000000000000000000000000000000000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7C6B500EFCEB500EFCE
      B500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD8473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD5A5200AD5A5200E7C6C600E7C6C600E7C6C600C6CE
      C600C6CEC600C6CEC600AD5A5200942929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A52008C5A52008C5A
      52008C5A52008C5A5200BD7B6B00C65A5200E7C6C6009C313100B5736B00C6CE
      C600F7F7F700F7F7F700C65A5200942929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500BD7B6B00C65A5200C6948C009C3131009C4A4200E7C6
      C600C6C6C600F7F7F700C65A5200942929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFD6A500FFD6A500FFD6
      A500FFD6A500FFD6A500BD7B6B00C65A5200C6948C00C6948C00BDA5A500BDA5
      A500E7C6C600C6CEC600C65A52009429290000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000000000000000000008484840000000000B58C8C00F7DEC600F7DEC600F7DE
      C600F7DEC600F7DEC600BD7B6B00AD524200B55A5200C65A5200C65A5200C65A
      5200C65A5200C65A5200C65A52009429290000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400000000000000000000000000B58C8C00F7DEC600F7DEC600F7DE
      C6008484840000000000BD7B6B00AD524200FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700C65A52009429290000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000848484000000000000000000B58C8C00F7EFDE00F7EFDE008484
      840084000000FF000000BD7B6B00AD524200FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A52009429290000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000B58C8C00F7EFDE00F7EFDE008484
      0000FF00000084840000BD7B6B00AD524200FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFF700FFF7F700C65A52009429290000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400000000000000000000000000B58C8C00FFF7EF00FFF7EF008484
      0000C6C6C600C6C6C600BD7B6B00AD524200FFF7F700FFF7F700FFFFF700FFFF
      F700FFFFF700FFF7F700C65A52009429290000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFF7EF008484
      0000C6C6C60084840000BD7B6B00AD524200D6D6D600CEB5B500CEB5B500CEB5
      B500CEB5B500D6D6D600AD5242009429290000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7EF00FFF7EF00C6C6
      C6008484000084848400FF0000000084000084840000C6C6C600FFF7EF00BDAD
      AD00A57B6B0000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000008400000084000000840000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600848400008484000084840000C6C6C600FFFFFF00FFFFFF00BDAD
      AD00B5846B0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000840000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000084000000840000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00B58C8C00B58C
      8C00B58C8C0000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000840000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000008400000000000000000000008400000000000000840000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56300BD84
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      0000000000000000000000000000840000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00BD8484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C7B0094632900A57B4A00000000000000000000000000D6A54A00BD73
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      7B007B4A0000945A0000945A0000945A0000945A0000C67B0000945A0000C67B
      0000945A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00FFDED600FFE7E7005A6B
      5200FFBDBD00FFBDBD008C8C8C00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C42
      0000945A0000C67B0000C67B0000C67B0000C67B0000C67B0000C67B0000945A
      0000945A0000945A000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C00FFDED600FFE7E700FFCECE00FFCE
      CE00FFCECE00FFBDBD00FFBDBD008C8C8C000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF000000FF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A57B4A00945A
      0000C67B0000C67B0000C67B0000C67B0000C67B0000C67B0000C67B0000C67B
      0000945A0000945A0000A57B6300000000000000000000000000315AAD003152
      9C0031529C0031529C0031529C008C8C8C00FFE7E700FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFBDBD008C8C8C000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000945A0000C67B
      0000C67B0000C67B0000F79C0000C67B0000F79C0000C67B0000C67B0000C67B
      0000945A0000945A0000000000000000000000000000426BBD00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C008C8C8C005A6B5200FFCECE00FFCECE003942
      390039423900394239005A6B52008C8C8C000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF000000FF000000FF000000000000FF
      FF0000FFFF000000000000000000000000003163730031637300316373003163
      7300316373003163730031637300316373003163730031637300316373003163
      7300316373003163730031637300316373000000000000000000945A0000C67B
      0000C67B0000C67B0000C67B0000F79C0000C67B0000F79C0000C67B0000C67B
      0000C67B000000000000000000000000000000000000426BBD00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7008C8C8C00FFEFEF00FFCECE00FFCECE003942
      3900FFCECE00FFCECE00FFBDBD008C8C8C0000007B0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000009C940031637300009C9400009C
      940031637300009C9400009C940031637300009C9400009C940031637300009C
      9400009C940031637300009C9400009C940000000000A57B4A00C67B0000C67B
      0000C67B0000C67B0000F79C0000F79C0000F79C0000F79C0000C67B0000C67B
      0000BD73290000000000000000000000000000000000426BBD00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7008C8C8C00FFEFEF00FFE7E700FFCECE003942
      3900FFCECE00FFBDBD00FFBDBD008C8C8C0000007B0000007B00000000000000
      0000FFFFFF000000FF000000FF0000007B000000FF000000FF00FFFFFF000000
      000000007B0000007B000000000000000000009C94003163730000F7FF0000BD
      E7003163730000F7FF0000F7FF003163730000F7FF0000BDE7003163730000F7
      FF0000BDE7003163730000F7FF00009C94000000000094632900C67B0000F79C
      0000F79C0000C67B0000F79C0000C67B0000C67B0000C67B0000C67B0000C67B
      0000D6A54A0000000000000000000000000000000000426BBD00F7F7F700F7F7
      F70000008400F7F7F70000008400000084008C8C8C00FFEFEF00FFDED6005A6B
      5200FFBDBD00FFBDBD008C8C8C00000000007B7B7B0000007B007B7B7B00FFFF
      FF00FFFFFF007B7B7B0000007B007B7B7B00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000009C940000F7FF0000F7FF0000F7
      FF0000F7FF0000F7FF0000F7FF003163730000F7FF0000F7FF0000F7FF0000F7
      FF0000F7FF0000F7FF0000F7FF00009C940000000000B58C7300C67B0000F79C
      0000F79C0000F79C0000F79C0000F79C0000F79C0000C67B0000C67B0000C67B
      0000BD732900000000000000000000000000000000005273C600F7F7F700F7F7
      F70000008400F7F7F70000008400F7F7F700F7F7F7008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C0000000000000000000000000000007B0000007B007B7B
      7B007B7B7B0000007B0000007B00FFFFFF00FFFFFF0000000000000000000000
      00007B7B7B00000000000000000000000000009C940000F7FF0000F7FF0000F7
      FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7FF0000F7
      FF0000F7FF0000F7FF0000F7FF00009C94000000000000000000945A0000F79C
      0000C67B0000F79C0000F79C0000F79C0000F79C0000F79C0000F79C0000C67B
      0000945A0000000000000000000000000000000000005273C600F7F7F7000000
      840000008400F7F7F700FFEFDE0000008400F7F7F70031529C00000000000000
      000000000000000000000000000000000000000000007B7B7B0000007B000000
      7B0000007B0000007B00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000009C940031637300316373003163
      7300316373003163730031637300316373003163730031637300316373003163
      730031637300316373003163730000639400000000000000000000000000C67B
      0000F79C0000F79C0000F79C0000F79C0000F79C0000F79C0000F79C0000C67B
      0000C67B0000945A00000000000000000000000000005273C600F7F7F700F7F7
      F70000008400F7F7F7000000840000008400F7F7F70031529C00000000000000
      000000000000000000000000000000000000000000007B7B7B0000007B000000
      7B0000007B00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E79C6B00D6A54A00D6A54A00000000000000000000000000BD732900C67B
      0000945A0000000000000000000000000000000000005A84CE00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F70031529C00000000000000
      0000000000000000000000000000000000007B7B7B0000007B0000007B000000
      7B0000007B007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A84CE00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00315AAD00000000000000
      00000000000000000000000000000000000000007B0000007B007B7B7B000000
      000000007B0000007B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6A54A00C67B0000000000000000
      00000000000000000000000000000000000000000000000000005A84CE005273
      C6005273C600426BBD00426BBD00426BBD00426BBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007B0000007B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F79C0000D6A54A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB5A500A5735200A573
      5200A5735200A5735200A5735200A5735200A5735200A5735200A5735200A573
      5200A5735200CEB5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB5A500A5735200CE9C7B00CE9C
      7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C
      7B00CE9C7B00A5735200CEB5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B6300A57B6300A5735200A57B
      6300A5735200A57B6300A5735200A57B6300A5735200A57B6300A5735200A57B
      6300A5735200A57B6300A57B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000840000000000
      000084000000000000008400000000000000A57B6300E7CEB500E7CEB500E7CE
      B500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CE
      B500E7CEB500E7CEB500A57B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B6300E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600A57B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C7300E7DECE00E7DECE00E7DE
      CE00E7DECE00E7DECE00E7DECE00E7DECE00E7DECE00E7DECE00E7DECE00E7DE
      CE00E7DECE00E7DECE00B58C7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C7300EFEFE700EFEFE700B5A5
      9400B5A59400B5A59400B5A59400B5A59400B5A59400B5A59400B5A59400B5A5
      9400EFE7DE00EFE7DE00B58C7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C7300F7EFE700EFEFE700B5A5
      9400F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00B5A5
      9400EFEFEF00EFEFEF00B58C7300000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C7300F7F7EF00F7EFEF00B5A5
      9400F7EFE700BD9C8400BD9C8400B58C7300A57B6300A5735200F7E7DE00B5A5
      9400F7EFEF00F7F7EF00B58C73000000000000000000BD000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD000000BD000000BD000000BD00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB5A500B58C730094632900B5A5
      9400F7EFE700F7EFDE00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700B5A5
      940094632900B58C7300CEB5A50000000000BD000000BD000000BD000000BD00
      0000BD0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000008400000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9400F7EFE700CEAD9400BD9C8400B58C7300A57B6300A5735200EFEFEF00B5A5
      94000000000000000000000000000000000000000000BD000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000008400000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9400F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00FFF7E700F7F7EF00B5A5
      9400000000000000000000000000000000000000000000000000BD0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9400F7F7EF00F7F7EF00F7F7EF00F7F7EF00B5A59400B5A59400B5A59400B5A5
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000008400000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9400F7F7F700FFFFF700F7F7F700F7F7F700B5A5940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000008400000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5A5
      9400B5A59400B5A59400B5A59400B5A59400B5A5940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084B58400087308001073
      10001073100010731000107B1000107B1000087B0800087B0800007B0000007B
      0000007B00000073000073B57300FFFFFF00FFFFFF0084B58400087308001073
      10001073100010731000107B1000107B1000087B0800087B0800007B0000007B
      0000007B00000073000073B57300FFFFFF00CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0008840800188C18002194
      2100299429002994290021942100219C2100189C180010A5100010A5100008A5
      080000A5000000940000006B0000FFFFFF00FFFFFF0008840800188C18002194
      2100299429002994290021942100219C2100189C180010A5100010A5100008A5
      080000A5000000940000006B0000FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00108C100021942100319C
      3100319C3100319C310031A53100FFFFFF00A5D6A50042A5420042A5420042A5
      420000AD0000009C0000007B0000FFFFFF00FFFFFF00108C100021942100319C
      3100319C3100319C310031A53100A5D6A500FFFFFF0018AD180010AD100008B5
      080000AD0000009C0000007B0000FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0018941800319C310039A5
      390042A5420039A53900FFFFFF00FFFFFF00FFFFFF0042A5420042A5420042A5
      420008AD080000A50000007B0000FFFFFF00FFFFFF0018941800319C310039A5
      390042A5420039A5390039A53900FFFFFF00FFFFFF00FFFFFF0018B5180010B5
      100008AD080000A50000007B0000FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0021942100399C390042A5
      42004AA54A00FFFFFF00FFFFFF00FFFFFF0042A5420042A5420042A5420042A5
      420008AD080008A5080000840000FFFFFF00FFFFFF0021942100399C390042A5
      42004AA54A0042A5420039A5390039AD3900FFFFFF00FFFFFF00FFFFFF0010B5
      100008AD080008A5080000840000FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00299C290042A542004AA5
      4A00FFFFFF00FFFFFF00FFFFFF0042A5420042A5420042A5420042A5420042A5
      420010AD100010A5100008840800FFFFFF00FFFFFF00299C290042A542004AA5
      4A004AA54A0042A5420042A5420039A5390031AD3100FFFFFF00FFFFFF00FFFF
      FF0010AD100010A5100008840800FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00CE63000000000000000000000000000000000000FF00
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00399C39004AA54A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00189C180010841000FFFFFF00FFFFFF00399C39004AA54A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00189C180010841000FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7
      C600FFDEB500FFD6AD00CE630000000000000000000000000000FF000000FF00
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0039A5390052AD5200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00189C1800187B1800FFFFFF00FFFFFF0039A5390052AD5200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00189C1800187B1800FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEF
      D600FFE7C600FFDEB500CE630000000000000000000000000000FF000000FF00
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF004AA54A005AAD5A005AAD
      5A00FFFFFF00FFFFFF00FFFFFF00399C3900399C3900399C3900399C39002194
      21002194210021942100187B1800FFFFFF00FFFFFF004AA54A005AAD5A005AAD
      5A0052AD52004AA54A0042A54200399C3900319C3100FFFFFF00FFFFFF00FFFF
      FF00219C210021942100187B1800FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600CE630000000000000000000000000000FF000000FF00
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF004AA54A0063B5630063B5
      630052AD5200FFFFFF00FFFFFF00FFFFFF00399C3900399C3900399C39002194
      21002194210021942100187B1800FFFFFF00FFFFFF004AA54A0063B5630063B5
      630052AD52004AA54A0042A54200399C3900FFFFFF00FFFFFF00FFFFFF002194
      21002194210021942100187B1800FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000029E7000021A500FFFF
      F700FFF7E7000029E7000021A50000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0052AD520073BD73006BBD
      6B005AAD5A0052AD5200FFFFFF00FFFFFF00FFFFFF00399C3900299C2900299C
      29002994290029942900187B1800FFFFFF00FFFFFF0052AD520073BD73006BBD
      6B005AAD5A0052AD52004AA54A00FFFFFF00FFFFFF00FFFFFF00299C2900299C
      29002994290029942900187B1800FFFFFF00CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000029E7000021
      A5000029E7000021A500CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0063B563008CC68C0073BD
      730063B563005AB55A005AAD5A00FFFFFF00B5DEB50042A5420042A5420039A5
      3900319C310029942900187B1800FFFFFF00FFFFFF0063B563008CC68C0073BD
      730063B563005AB55A005AAD5A00B5DEB500FFFFFF0042A5420042A5420039A5
      3900319C310029942900187B1800FFFFFF00CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE6300000029
      E7000021A500CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF006BBD6B009CCE9C008CC6
      8C0073BD73006BBD6B0063B563005AB55A005AAD5A0052AD52004AAD4A0042A5
      420039A539002994290010731000FFFFFF00FFFFFF006BBD6B009CCE9C008CC6
      8C0073BD73006BBD6B0063B563005AB55A005AAD5A0052AD52004AAD4A0042A5
      420039A539002994290010731000FFFFFF0000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE6300000029E7000021
      A5000029E7000021A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00B5DEB5006BBD6B005AB5
      5A0052AD52004AA54A004AA54A0042A5420042A5420039A53900399C3900319C
      310029942900188C18008CBD8C00FFFFFF00FFFFFF00B5DEB5006BBD6B005AB5
      5A0052AD52004AA54A004AA54A0042A5420042A5420039A53900399C3900319C
      310029942900188C18008CBD8C00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000029E7000021A5000000
      0000000000000029E7000021A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000847B6B000000000000000000000000005AA55A0031A531005AA5
      5A00000000000000000000000000000000000000000094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C7B6B006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B630000000000000000007B634A005AA55A0084AD7B005AA5
      5A005AA55A000000000000000000000000000000000000000000B57373000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B573730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C7B6B006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B6300847B6B00846B630031A531005AA55A005AA55A005AA5
      5A0031A53100000000000000000000000000000000000000000000000000AD5A
      5A00AD5A5A00E7C6C600E7C6C600E7C6C600C6CEC600C6CEC600C6CEC600AD5A
      5A00943131000000000000000000000000000000000000000000000000000000
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C7B6B006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000847B6B0000000000000000005AA55A0084AD7B0084AD7B005AA5
      5A005AA55A00000000000000000000000000000000000000000000000000BD7B
      7300C65A5A00E7C6C6009C393900B5737300C6CEC600F7F7F700F7F7F700C65A
      5A009431310000000000000000000000000000000000000000007B7B7B000000
      BD007B7B7B0000000000000000000000000000000000BD000000BD000000BD00
      00000000000000000000BD000000BD000000000000008C7B6B006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B63000000000000000000000000005AA55A005AA55A005AA5
      5A0000000000000000000000000000000000000000000000000000000000BD7B
      7300C65A5A00C6948C009C3939009C4A4A00E7C6C600C6C6C600F7F7F700C65A
      5A009431310000000000000000000000000000000000000000000000BD007B7B
      7B000000BD00000000000000000000000000BD000000BD000000000000000000
      0000BD000000BD0000007B7B7B007B7B7B00000000008C7B6B006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000847B6B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD7B
      7300C65A5A00C6948C00C6948C00BDA5A500BDA5A500E7C6C600C6CEC600C65A
      5A0094313100000000000000000000000000000000007B7B7B000000BD000000
      00000000BD000000000000000000BD000000BD00000000000000000000000000
      000000000000BD0000000000000000000000000000008C7B6B006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B63000000000000000000000000005AA55A0031A531007B63
      4A0000000000000000000000000000000000000000000000000000000000BD7B
      7300AD524A00B55A5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A
      5A00943131000000000000000000000000000000BD000000BD007B7B7B000000
      00000000BD000000000000000000BD000000BD00000000000000000000000000
      000000000000BD0000000000000000000000000000008C7B6B006B634A0000A5
      100000A5100000A5100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000847B6B0000000000000000005AA55A005AA55A0084AD7B005AA5
      5A005AA55A00000000000000000000000000000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A
      5A0094313100000000000000000000000000000000000000BD007B7B7B000000
      00000000BD007B7B7B0000000000BD000000BD00000000000000000000000000
      000000000000BD0000007B7B7B0000000000000000008C7B6B006B634A0000A5
      100018B5290018B5290000A5100000A510000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B6300847B6B00846B630031A531005AA55A005AA55A005AA5
      5A0031A53100000000000000000000000000000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFFFF700FFF7F700C65A
      5A00943131000000000000000000000000000000000000000000000000000000
      00007B7B7B000000BD000000000000000000BD000000BD000000000000000000
      0000BD000000BD000000BD0000007B7B7B00000000008C7B6B006B634A0000A5
      100018B5290018D6310018B5290018B5290000A5100000A5100000A510000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000846B630000000000000000005AA55A005AA55A0084AD7B0084AD
      7B005AA55A00000000000000000000000000000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFFFF700FFF7F700C65A
      5A00943131000000000000000000000000000000000000000000000000000000
      0000000000000000BD00000000000000000000000000BD000000BD000000BD00
      00007B7B7B00000000007B7B7B00BD000000000000008C7B6B006B634A0000A5
      100018B5290018D6310018D6310018B5290018B5290018D6310018B5290000A5
      100000A510000000000000000000000000000000000000000000000000000000
      000000000000846B63000000000000000000000000005AA55A005AA55A005AA5
      5A0000000000000000000000000000000000000000000000000000000000BD7B
      7300AD524A00FFF7F700FFF7F700FFFFF700FFFFF700FFFFF700FFF7F700C65A
      5A00943131000000000000000000000000000000000000000000000000000000
      0000000000000000BD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C7B6B006B634A0000A5
      100018B5290018D6310018D6310018B5290018B5290018D6310018B5290018B5
      290018C6290000A5100000000000000000000000000000000000000000000000
      00005AA55A005AA55A007B634A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD7B
      7300AD524A00D6D6D600CEB5B500CEB5B500CEB5B500CEB5B500D6D6D600AD52
      4A00943131000000000000000000000000000000000000000000000000000000
      0000000000000000BD007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B00000000008C7B6B006B634A0000A5
      100018B5290018D6310018D6310018B5290018B5290000A5100000A5100000A5
      100000A510000000000000000000000000000000000000000000000000005AA5
      5A005AA55A005AA55A005AA55A005AA55A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57373000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B573730000000000000000000000000000000000000000000000
      0000000000000000BD000000BD000000BD000000BD000000BD000000BD000000
      BD000000BD000000BD000000BD000000BD00000000008C7B6B006B634A0000A5
      100018B5290018D6310000A5100000A5100000A5100000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031A5
      31005AA55A005AA55A0084AD7B0031A531000000000000000000000000000000
      0000000000000000000000000000000000000000000094313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C7B6B006B634A0000A5
      100000A5100000A5100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005AA5
      5A005AA55A009CDEA5005AA55A005AA55A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005AA55A005AA55A005AA55A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A5200AD52
      4A00A54A4200AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4239009C423900A5524A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B6B00CE635A00CE6B
      6300B55A52009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942121009C292900C65A5200AD5A52000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B6B00CE635A00CE63
      5A00B55A52009C7B73009C423900B5736B00E7DEDE00FFF7F700FFFFFF00D6B5
      B500942929009C292900BD5A5200AD5A52000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B6B00CE635A00CE63
      5A00B55A5200AD8484009C3131009C313100CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009421210094292900BD5A5200AD5A52000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      00007B7B7B007B7B7B00000000000000000000000000BD7B6B00CE635A00CE63
      5A00B55A5200B58C8C009C4A420094292900A59C9C00D6D6D600FFFFFF00E7C6
      C6009421210094292900BD5A5200AD5A52000000000000000000000000000000
      000000000000848484000000000000000000000000000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B00000000000000000000000000BD7B6B00CE635A00CE63
      5A00BD5A5200C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5313100A5313100C65A5200AD5A52000000000000000000000000008484
      8400000000000000000000000000FF000000FF0000000000000000FFFF0000FF
      FF00000000008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00000000000000000000000000BD7B6B00CE635A00CE63
      5A00CE635A00CE635A00CE635A00CE635A00CE635A00C65A5200C65A5200CE63
      5A00CE635A00CE635A00CE6B6300AD5252000000000084848400000000008484
      8400FF0000008484840000000000FF000000FF00000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B6B00B5524A00B55A
      5200C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE635A00AD524A008484840000000000000000000000
      000084848400FF00000000000000000000008400000000000000000000000084
      000000FF000000000000848484000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B0000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000000000000000000000BD7B6B00AD524200E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5200AD525200000000000000000084848400FF00
      000084848400000000000000000000000000000084000000FF00000000000084
      000000FF000000840000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFFFF00000000000000000000000000000000007B7B7B007B7B
      7B0000000000000000000000000000000000000000007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000BD7B6B00B5524200EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5200AD5252000000000084848400000000000000
      000000000000848484000000FF0000000000000084000000FF00000084000000
      000000FF000000840000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000000007B7B7B007B7B
      7B00000000000000000000000000000000007B7B7B007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000BD7B6B00B5524200EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5200AD5252000000000000000000000000008484
      84000000FF00848484000000FF000000FF00000000000000FF000000FF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000BD7B6B00B5524200EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5200AD5252000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B007B7B7B00000000000000
      00000000000000000000000000000000000000000000BD7B6B00B5524200EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5200AD5252000000000000000000000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B6B00B5524200EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5200AD5252000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B6B00B5524200E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5200AD5252000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD524200CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4200000000000000000000000000000000000000
      000000000000000000008C290000942900008C29000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C29
      0000942900008C29000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006329100063291000632910006329100063291000632910000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C2900008C2900008C2900008C29000000000000000000000000
      00000000000000000000000000000000000000000000000000008C2900008C29
      00008C2900008C29000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B29
      100063291000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A00006329
      1000632910000000000000000000000000000000000000000000000000000000
      0000000000009429000000000000000000008C2900008C290000000000008C29
      0000942900000000000000000000000000000000000000000000942900000000
      0000000000008C2900008C290000000000008C29000094290000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084310800B542
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000B54A00006329100000000000000000000000000000000000000000000000
      0000000000009429000000000000000000008C290000000000008C2900008C29
      00008C2900008C29000000000000000000000000000000000000942900000000
      0000000000008C290000000000008C2900008C2900008C2900008C2900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084310800B5420000BD4A
      0000B5420000B5420000B5420000B5420000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000B54A000063291000000000000000000000000000000000000000
      0000000000008C2900008C2900008C2900008C290000000000008C2900000000
      00000000000094290000000000000000000000000000000000008C2900008C29
      00008C2900008C290000000000008C2900000000000000000000942900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD420000B5420000B542
      0000B5420000AD420000C66B2900CE7B4200CE7B4200CE733100C65A1000BD4A
      0000BD4A0000BD4A00006B291000000000000000000000000000000000000000
      000000000000000000008C290000942900008C2900008C2900008C2900000000
      0000000000008C29000000000000000000000000000000000000000000008C29
      0000942900008C2900008C2900008C29000000000000000000008C2900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094390000BD4A0000B54A0000B54A
      0000B54A0000B54A0000E7B58C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D684
      3900BD4A0000BD4A0000BD4A0000632910000000000000000000000000000000
      0000000000000000000000000000842900008C3110008C290000942900008C29
      00008C2900008C29000000000000000000000000000000000000000000000000
      0000842900008C3110008C290000942900008C2900008C2900008C2900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094390000BD520800BD520800BD52
      0800B5520800B5520800B5520800B5520800B5520800B5520800DEA57300FFFF
      FF00BD4A0000BD4A0000BD4A00006B2910000000000000000000000000000000
      00000000000000000000000000007B635A00735A52008C4221008C2900008C29
      00008C2900000000000000000000000000000000000000000000000000000000
      00007B635A00735A52008C4221008C2900008C2900008C290000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000094390000C66B1800C6631800BD63
      1800BD631800BD631800E7BD9400B5520800B54A0000AD420000B54A0800FFFF
      FF00BD4A0000BD4A0000BD4A00006B2910000000000000000000000000000000
      0000000000000000000073635200947B73007363520073635200000000000000
      0000000000000000000000000000000000000000000000000000000000007363
      5200947B73007363520073635200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094390800D68C4A00CE7B3100C673
      2900C6732900E7C69C00FFFFFF00BD631000B5520800B54A0000CE844200FFFF
      FF00BD4A0000BD4A0000BD4A00006B2910000000000000000000000000000000
      00000000000073635200C6ADAD00736352009C7B730073635200000000000000
      000000000000000000000000000000000000000000000000000073635200C6AD
      AD00736352009C7B730073635200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094390000DEA56B00DE9C6300CE84
      3900F7D6BD00FFFFFF00FFFFFF00F7EFDE00EFDEC600EFD6BD00FFFFFF00DEA5
      7300BD4A0000BD4A0000BD4A00006B2910000000000000000000000000000000
      000073635200E7D6D60073635200947B7300C6A5A50073635200000000000000
      0000000000000000000000000000000000000000000073635200E7D6D6007363
      5200947B7300C6A5A50073635200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008400000084848400FFFF
      0000FFFF0000FFFF0000000000000000000094390000E79C6300EFC6A500DE9C
      5A00F7DEBD00FFFFFF00FFFFFF00F7DEC600E7BD9400E7B58C00D6844200B54A
      0000BD4A0000BD4A0000BD4A0000632910000000000000000000000000007363
      5200FFFFFF00736352000000000073635200D6C6C60073635200000000000000
      00000000000000000000000000000000000073635200FFFFFF00736352000000
      000073635200D6C6C60073635200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000840000008484
      840000000000000000000000000000000000000000009C421000EFCEAD00F7CE
      AD00E7AD7300EFCEAD00FFFFFF00CE732900C66B1800BD5A1000BD520000BD4A
      0000BD4A0000BD4A00006B291000000000000000000000000000000000007363
      520073635200000000000000000073635200E7DEDE0073635200000000000000
      0000000000000000000000000000000000007363520073635200000000000000
      000073635200E7DEDE0073635200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000094390000E7A56B00F7E7
      CE00F7D6BD00E7AD7300EFC69C00CE732900C66B1800C65A1000C65A0800BD4A
      0000BD4A0000B54A000063291000000000000000000000000000000000007363
      520000000000000000000000000073635200F7F7F70073635200000000000000
      0000000000000000000000000000000000007363520000000000000000000000
      000073635200F7F7F70073635200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000008400
      000000000000000000000000000000000000000000000000000094390000E7A5
      6B00F7D6BD00F7DEC600EFC69C00E7A57300DE945200D68C4200CE732900C652
      0000B54A00007329080000000000000000000000000000000000000000000000
      0000000000000000000000000000736352007363520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000736352007363520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000008400000084848400000000000000000000000000840000008484
      8400000000000000000000000000000000000000000000000000000000009439
      00009C4A1000E7AD7300EFBD9400EFBD8C00E7AD7300DE8C4A00C66310009C42
      08006B2910000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000736352000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000736352000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C3900009C4208009C4208009C4208009C420800843108000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0073424200000000000000000000000000000000000000
      00008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A007342420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094635A00FFDEBD00FFDEB500FFD6AD00FFD6A500FFCE9C00FFCE
      9400FFC69400FFC68C0073424200000000000000000000000000000000000000
      000094635A00FFDEBD00FFDEB500FFD6AD00FFD6A500FFCE9C00FFCE9400FFC6
      9400FFC68C007342420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C635A00FFE7C600DE943900DE943900DE943900DE943900DE94
      3900DE943900FFC6940073424200000000000000000000000000000000000000
      00009C635A00FFE7C600DE943900DE943900DE943900DE943900DE943900DE94
      3900FFC694007342420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5C6C6000000000000000000000000000000000000000000000000000000
      000000000000A56B5A00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6
      AD00FFD6A500FFCE9C0073424200000000000000000000000000000000000000
      0000A56B5A00FFEFD600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6AD00FFD6
      A500FFCE9C007342420000000000000000000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000000000000000
      00000000000000000000000000000000000000000000000000000010F7000010
      F7000010F700000000004A42EF004A42EF004A42EF0000000000BDCEEF000000
      0000BDCEEF000000000000000000000000008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A00A5736300FFEFDE00DE943900DE943900DE943900DE943900DE94
      3900DE943900FFD6A50073424200000000008C5A5A008C5A5A008C5A5A008C5A
      5A00A5736300FFEFDE00DE943900DE943900DE943900DE943900DE943900DE94
      3900FFD6A5007342420000000000000000000000000000000000000000000000
      00000000000000000000BD000000BD000000BD000000BD000000BD0000000000
      00000000000000000000000000000000000000000000000000000000AD000010
      F7000000AD00000000000010F7000010F7000010F70000000000000000004A42
      EF000000000000000000000000000000000094635A00FFDEBD00FFDEB500FFD6
      AD00FFD6A500B57B6300FFF7E700FFEFDE00FFEFDE00FFE7CE00FFE7C600FFDE
      BD00FFDEB500FFD6AD00734242000000000094635A00FFDEBD00FFDEB500FFD6
      AD00B57B6300FFF7E700FFEFDE00FFEFDE00FFE7CE00FFE7C600FFDEBD00FFDE
      B500FFD6AD007342420000000000000000000000000000000000000000000000
      000000000000BD000000BD000000BD00000000000000BD000000BD0000000000
      000000000000000000000000000000000000000000000000000000086B000000
      9C0000086B00000000000000AD0000009C000000AD00000000000010F7000000
      00000010F7000000000000000000000000009C635A00FFE7C600DE943900DE94
      3900DE943900BD846B00FFF7EF00DE943900DE943900DE943900DE943900DE94
      3900DE943900FFDEBD0073424200000000009C635A00FFE7C600DE943900DE94
      3900BD846B00FFF7EF00DE943900DE943900DE943900DE943900DE943900DE94
      3900FFDEBD0073424200000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00BD000000BD000000BD000000FFFFFF000000000000000000BD000000BD00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A56B5A00FFEFD600FFE7CE00FFE7
      C600FFDEBD00C68C6B00FFFFF700FFF7F700FFF7EF00FFF7E700FFEFDE00FFEF
      D600FFE7CE00FFE7C6007342420000000000A56B5A00FFEFD600FFE7CE00FFE7
      C600C68C6B00FFFFF700FFF7F700FFF7EF00FFF7E700FFEFDE00FFEFD600FFE7
      CE00FFE7C60073424200000000000000000000000000FFFFFF007B7B7B007B7B
      7B007B7B7B00BD000000FFFFFF00FFFFFF00000000000000000000000000BD00
      0000BD000000000000000000000000000000000000000000000000DE000000DE
      000000DE0000000000006BEF9C006BEF9C006BEF9C0000000000C6BDB500C6BD
      B50000000000000000000000000000000000A5736300FFEFDE00DE943900DE94
      3900DE943900CE947300FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7E700E7D6
      D600C6B5AD00A59494007342420000000000A5736300FFEFDE00DE943900DE94
      3900CE947300FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7E700E7D6D600C6B5
      AD00A594940073424200000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000BD000000000000000000000000000000000000000000000000DE000000DE
      000000DE00000000000000DE000000DE000000DE0000000000006BEF9C006BEF
      9C0000000000000000000000000000000000B57B6300FFF7E700FFEFDE00FFEF
      DE00FFE7CE00D69C7300FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00A563
      5A00A5635A00A5635A009C635A0000000000B57B6300FFF7E700FFEFDE00FFEF
      DE00D69C7300FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00A5635A00A563
      5A00A5635A009C635A00000000000000000000000000FFFFFF007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00FFFFFF000000000000000000000000000000
      000000000000BD00000000000000000000000000000000000000006B0000006B
      0000006B00000000000000DE000000DE000000DE00000000000000DE000000DE
      000000DE0000000000000000000000000000BD846B00FFF7EF00DE943900DE94
      3900DE943900DEA57300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700A563
      5A00E7A55200DE8429000000000000000000BD846B00FFF7EF00DE943900DE94
      3900DEA57300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700A5635A00E7A5
      5200DE84290000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000BD000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C68C6B00FFFFF700FFF7F700FFF7
      EF00FFF7E700E7A57300D6946B00D6946B00D6946B00D6946B00D6946B00A563
      5A00EF9C4200000000000000000000000000C68C6B00FFFFF700FFF7F700FFF7
      EF00E7A57300D6946B00D6946B00D6946B00D6946B00D6946B00A5635A00EF9C
      42000000000000000000000000000000000000000000FFFFFF007B7B7B007B7B
      7B00BDBDBD00BDBDBD00BDBDBD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE631800CE63
      1800FF00000000000000E78C4A00E78C4A00E79C6B0000000000F7CEA500F7CE
      A500EFC6AD00000000000000000000000000CE947300FFFFFF00FFFFFF00FFFF
      F700FFF7EF00FFF7E700E7D6D600C6B5AD00A594940073424200000000000000
      000000000000000000000000000000000000CE947300FFFFFF00FFFFFF00FFFF
      F700FFF7EF00FFF7E700E7D6D600C6B5AD00A594940073424200000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B54A0800B54A
      0800B54A080000000000E78C4A00F79C0000CE63180000000000EFAD8400EFAD
      8400EFAD8400000000000000000000000000D69C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00A5635A00A5635A00A5635A009C635A00000000000000
      000000000000000000000000000000000000D69C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00A5635A00A5635A00A5635A009C635A00000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B7B007B7B
      7B00BDBDBD0000000000BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B54A0800B54A
      0800B54A080000000000FF000000CE631800CE63180000000000E78C4A00E78C
      4A00E78C4A00000000000000000000000000DEA57300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700A5635A00E7A55200DE84290000000000000000000000
      000000000000000000000000000000000000DEA57300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700A5635A00E7A55200DE84290000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7A57300D6946B00D6946B00D694
      6B00D6946B00D6946B00A5635A00EF9C42000000000000000000000000000000
      000000000000000000000000000000000000E7A57300D6946B00D6946B00D694
      6B00D6946B00D6946B00A5635A00EF9C42000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C9494008C9494008C94
      94008C9494008C9494008C9494008C9494008C9494008C9494008C9494008C94
      94008C94940000000000000000000000000000000000CEB5A500A5735200A573
      5200A5735200A5735200A5735200A5735200A5735200A5735200A5735200A573
      5200A5735200CEB5A500000000000000000000000000000000008C9494008C94
      94008C9494008C9494008C9494008C9494008C9494008C9494008C9494008C94
      94008C9494008C94940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C949400F7E7DE00EFE7
      DE00EFEFE700F7E7DE00F7E7DE00EFEFE700EFEFE700F7E7DE00F7E7DE00EFEF
      E7008C949400000000000000000000000000CEB5A500A5735200CE9C7B00CE9C
      7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C7B00CE9C
      7B00CE9C7B00A5735200CEB5A5000000000000000000000000008C949400F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE008C9494000000000000000000C6B5AD00A5948400A5948400A594
      8400A5948400A5948400A5948400A5948400A5948400A5948400A5948400A594
      8400A5948400A5948400A5948400C6BDB500000000008C949400EFEFE700B5A5
      94006B210000A5A5A500F7EFDE00DED6CE006B210000CECEC600F7E7DE00A59C
      94006B210000A5A5A5000000000000000000A57B6300A57B6300A5735200A57B
      6300A5735200A57B6300A5735200A57B6300A5735200A57B6300A57352005A5A
      5A00A5735200A57B6300000000000000000000000000000000008C949400F7E7
      DE00E7E7E7006B737300E7E7E700F7EFDE00E7E7E7006B737300E7E7E700F7E7
      DE00E7E7E7006B73730000000000000000008C5A390052311800523118005231
      1800523118005231180052311800523118005231180052311800523118005231
      180052311800523118006B311800846B5200000000008C949400EFEFE7006B21
      0000D6D6D6006B210000EFF7E700D6CEC6006B210000D6D6D600EFEFE7006B21
      0000D6D6D6006B2100000000000000000000A57B6300E7CEB500E7CEB500E7CE
      B500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB5005A5A
      5A00D6C6B500E7CEB500000000000000000000000000000000008C949400EFEF
      E7006B737300E7E7E7006B737300F7EFDE00E7E7E7006B737300E7E7E700F7EF
      DE006B737300E7E7E7006B73730000000000635A420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A2108008C735A00000000008C949400EFEFE7006B21
      0000D6D6D6006B210000EFEFE700DED6CE006B210000DED6CE00EFEFEF006B21
      0000DED6CE006B2100000000000000000000A57B6300E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C6005A5A
      5A005A5A5A0000000000000000000000000000000000000000008C949400F7EF
      E7006B737300E7E7E7006B737300F7EFE700E7E7E7006B737300E7E7E700F7EF
      E7006B737300E7E7E7006B73730000000000635A420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A2108008C735A00000000007BA5AD00EFEFEF006B21
      0000D6D6D6006B210000F7EFE700CECEC6006B210000D6CEC600EFEFEF006B21
      0000D6D6D6006B2100000000000000000000B58C7300E7DECE00E7DECE00E7DE
      CE00E7DECE00E7DECE00E7DECE00E7DECE00E7DECE00E7DECE00E7DECE00E7DE
      CE005A5A5A0000000000B58C73000000000000000000000000007BA5AD00F7EF
      E7006B737300E7E7E7006B737300F7EFE7006B7373006B737300E7E7E700F7EF
      E7006B737300E7E7E7006B73730000000000635A420000000000424A4200FFFF
      FF00FFFFFF00424A420000000000000000000000000000000000424A4200FFFF
      FF0000000000000000004A2108008C735A00000000007BA5AD00F7EFE700C6BD
      B5006B210000B5A59400F7EFE700B5A594006B210000DED6CE00F7EFE700C6BD
      B5006B210000A59C94000000000000000000B58C7300EFE7DE00EFE7DE00B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500424A420000000000B58C73000000000000000000000000007BA5AD00F7EF
      E700E7E7E7006B737300E7E7E700F7EFE700E7E7E7006B737300E7E7E700F7EF
      E700E7E7E7006B73730000000000000000006352420000000000FFFFFF00424A
      4200424A4200FFFFFF0000000000FFFFFF000000000000000000FFFFFF00424A
      420000000000000000004A210800846B5200000000007BA5AD00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF007BA5AD00000000000000000000000000B58C7300F7EFE700EFEFEF00B5B5
      B500F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00B5B5
      B5005A5A5A0000000000B58C73000000000000000000000000007BA5AD00F7EF
      EF00F7F7EF00F7EFE700F7EFE700F7EFE700F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF007BA5AD0000000000000000005A52420000000000FFFFFF000000
      00000000000000000000000000000000000000000000424A4200FFFFFF000000
      000000000000000000004A2108008C735A00000000007BA5AD00F7F7EF00F7EF
      EF00F7F7EF00F7F7EF00F7F7EF00F7EFEF00F7EFEF00F7F7EF00F7F7EF00F7F7
      EF007BA5AD00000000000000000000000000B58C7300F7F7EF00F7EFEF00B5B5
      B500F7EFDE00E7E7E700D6D6D600C6BDB500A5A5A500848C8C00F7E7DE00B5B5
      B5005A5A5A0000000000B58C73000000000000000000000000007BA5AD00F7EF
      EF00F7EFE700F7EFE700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7F7EF00F7F7
      EF00F7F7EF007BA5AD0000000000000000005A52420000000000FFFFFF00424A
      4200424A4200FFFFFF0000000000FFFFFF0000000000FFFFFF00424A42000000
      000000000000000000004A2108008C735A00000000007BA5AD00F7F7EF00CEAD
      9400BD9C8400BD9C8400BD9C8400B58C7300B58C7300A57B6300A57B6300F7F7
      EF007BA5AD00000000000000000000000000CEB5A500B58C730094632900B5B5
      B500F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700ADAD
      AD005A5A5A0000000000CEB5A5000000000000000000000000007BA5AD00F7EF
      EF00CEAD9400CEAD94002921C600BD9C8400B58C7300B58C7300A57B6300A57B
      6300F7F7EF007BA5AD000000000000000000635A420000000000424A4200FFFF
      FF00FFFFFF00424A4200000000000000000000000000FFFFFF00000000000000
      000000000000000000004A2108008C735A00000000006BB5C600F7F7EF00FFF7
      F700F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00FFF7EF00F7F7
      EF006BB5C600000000000000000000000000000000000000000000000000B5B5
      B500F7EFE700E7E7E700D6D6D600C6BDB500A5A5A500848C8C00F7EFE700B5B5
      B5005A5A5A0000000000000000000000000000000000000000006BB5C600F7F7
      EF00FFF7F7000010F7000010F700FFF7F700FFF7F700F7F7EF00F7F7EF00FFF7
      EF00F7F7EF006BB5C60000000000000000006352420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A210800846B5200000000006BB5C600FFF7F700BD9C
      8400BD9C8400BD9C8400B58C7300A57B6300FFF7F7008CC6E70073B5DE005AAD
      D6006BB5C600000000000000000000000000000000000000000000000000B5B5
      B500F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00B5B5
      B5005A5A5A0000000000000000000000000000000000000000006BB5C600FFF7
      F7002921C6000010F7002921C6000010F700A57B6300FFF7F7008CC6E70073B5
      DE005AADD6006BB5C6000000000000000000A57B4A006B5A29006B5A29006B5A
      29006B5A29006B5A29006B5A29006B5A29006B5A29006B5A29006B6331006B63
      31006B633100635A390084522100846B5200000000006BB5C600FFFFF700FFFF
      F700F7F7F700F7F7F700F7F7F700FFFFF700F7F7F70073B5DE005AADD6006BB5
      C60000000000000000000000000000000000000000000000000000000000B5B5
      B500F7F7EF00F7F7EF00F7F7EF00FFF7F700B5B5B500B5B5B500B5B5B500424A
      42005A5A5A0000000000000000000000000000000000000000006BB5C600FFFF
      F7000010F700F7F7F700F7F7FF002921C6000010F700FFFFFF0073B5DE005AAD
      D6006BB5C600000000000000000000000000DE841800EF8C1000EF8C1000EF8C
      1000EF8C1000EF8C1000EF8C1000EF8C1000EF8C1000EF8C1000FFB55200FFAD
      4A00FFB55A00A58C9400A55A31009C846B00000000006BB5C600FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF7005AADD6006BB5C6000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500FFFFF700FFFFF700FFFFF700FFFFF700B5B5B50000000000000000005A5A
      5A000000000000000000000000000000000000000000000000006BB5C600FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF7000010F7002921C6005AADD6006BB5
      C60000000000000000000000000000000000B5845200BD733100C6733900C673
      3900C6733900C6733900C6733900C6733900C6733900C6733900C67B3900C67B
      3900C67B3900B5734200AD7B5200C6BDB500000000006BB5C6006BB5C6006BB5
      C6006BB5C6006BB5C6006BB5C6006BB5C6006BB5C6006BB5C600000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B50000000000000000005A5A
      5A000000000000000000000000000000000000000000000000006BB5C6006BB5
      C6006BB5C6006BB5C6006BB5C6006BB5C6006BB5C6000010F7006BB5C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004A
      8400004A8400004A84008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE630000FFFFFF00FFF7E700FFF7E700FFF7E700FFF7E700FFEFD600FFE7
      C600FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A840021AD
      DE0021A5DE0018A5D600A5636B00FFE7D600FFEFDE00F7EFD600F7EFD600F7EF
      D600F7E7D600F7E7CE00F7E7CE00734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700FFF7E700FFEF
      D600FFE7C600FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A840029B5
      DE0029ADDE0021ADDE00A5636B00F7DECE00DE944200DE943900DE943900DE94
      3900DE943900DE943900EFDEC600734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000CE63
      0000CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700FFEFD600FFE7C600CE630000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000007B7B7B0000000000000000000000000000000000004A840031BD
      E70029B5E70029ADDE00A56B6B00F7E7D600F7DEC600F7D6AD00F7D6AD00F7D6
      AD00F7CEA500F7D6B500EFDEC600734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7E700FFEFD600CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B000000000000000000004A840039BD
      E70031BDE70031B5E700AD6B6B00F7E7DE00DE944200DE943900DE943900DE94
      3900DE943900DE943900EFDECE00734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE630000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700CE63000000000000000000007B7B7B00000000000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A840042C6
      EF0039C6E70039BDE700AD736B00FFEFE700FFE7D600FFDEC600F7DEC600F7DE
      BD00F7DEBD00F7DEC600EFE7D600734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000FFFF
      FF00CE630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7E700CE630000000000000000000000000000000000007B7B
      7B00000000007B7B7B00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000004A84004ACE
      EF0042C6EF0042C6EF00B5736B00FFF7EF00DE944200DE943900DE943900DE94
      3900DE943900DE944200F7EFDE00734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00CE630000FFFF
      FF00CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000000000007B7B7B000000
      000000000000000000007B7B7B00000000000000000000000000000000007B7B
      7B00000000000000000000000000000000000000000000000000004A840052D6
      F7004ACEEF0042C6EF00BD7B6B00FFF7F700FFF7EF00FFEFDE00FFEFDE00FFE7
      D600FFEFDE00F7EFDE00E7DED600734242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00CE630000FFFF
      FF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A84005AD6
      F70052D6F7004ACEF700BD846B00FFF7F700FFFFFF00FFFFFF00FFFFF700FFFF
      F700A5635A00A5635A00A5635A00A5635A000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000CE630000FFFFFF00CE630000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      E700CE6300000000000000000000000000000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000004A84005ADE
      FF005ADEF70052D6F700C6846B00FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5635A00D6945200F77B4200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000004A840063DE
      FF0063DEFF005ADEF700C68C7300D6946B00D6946B00D6946B00D6946B00D694
      6B00A5635A00B59C6B00004A8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFFFFF00FFFFFF00CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A84006BE7
      FF0063DEFF0063DEFF0063DEFF005ADEFF0052D6F70052CEF7004ACEEF0042C6
      EF0039BDE70039BDE700004A8400000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E700CE6300000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000000000000000000000004A84006BE7
      FF006BE7FF005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A0042C6EF0042C6EF00004A8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE6300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A84006BE7
      FF006BE7FF005A5A5A00C6B5AD00C6B5AD00C6B5AD00C6B5AD00C6ADA5005A5A
      5A004ACEF70042C6EF00004A8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004A
      8400004A84005A5A5A00DECEC600FFF7F700F7F7F700F7F7F700C6B5AD005A5A
      5A00004A8400004A840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6520000C6520000C652
      0000C6520000C6520000C6520000C6520000C6520000C6520000C6520000C652
      0000C6520000C6520000C6520000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AD1800EFBD9C00EFBD9C00EFBD
      9C00EFBD9C00EFBD9C00EFBD9C00EFBD9C00EFBD9C00EFBD9C00EFBD9C00EFBD
      9C00EFBD9C00EFBD9C00EFBD9C00C65200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B0000007B0000007B0000007B7B7B00000000007B0000007B00
      00007B0000007B7B7B000000000000000000E7AD1800FFDEBD00EFBD9C00EFBD
      9C00FFD6B500EFBD9C00EFBD9C00FFCEA500EFBD9C00EFBD9C00FFD6B500EFBD
      9C00EFBD9C00FFCEA500EFBD9C00C65200000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B0000007B0000007B00000000000000000000007B0000007B00
      00007B000000000000000000000000000000E7AD1800FFEFD600CE5A2100BD4A
      0000FFD6B500C6520000BD4A0000FFCEA500C6520000BD4A0000FFCEA500C652
      0000BD4A0000FFCEA500EFBD9C00C65200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B0000007B7B7B0000000000000000007B0000007B00
      00007B7B7B00000000000000000000000000E7AD1800FFEFD600EFBD9C00EFBD
      9C00FFDEBD00EFBD9C00EFBD9C00FFD6B500EFBD9C00EFBD9C00FFCEA500EFBD
      9C00EFBD9C00FFCEA500EFBD9C00C65200000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B0000007B7B7B0000000000000000007B0000007B00
      00007B7B7B00000000000000000000000000E7AD1800FFEFD600CE5A2100BD4A
      0000FFEFD600C6520000BD4A0000FFD6B500C6520000BD4A0000FFCEA500C652
      0000BD4A0000FFCEA500EFBD9C00C65200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B0000007B7B7B0000000000000000007B0000007B00
      00007B7B7B00000000000000000000000000E7AD1800FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFDEBD00FFD6B500FFD6B500FFD6B500FFD6B500FFCE
      A500FFCEA500FFCEA500EFBD9C00C65200000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B007B0000007B7B7B0000000000000000007B0000007B00
      00007B7B7B00000000000000000000000000E7AD1800FFEFD600CE8C6300CE8C
      6300CE8C6300CE8C6300CE8C6300CE8C6300CE8C6300CE8C6300CE8C6300FFD6
      B500FFCEA500FFCEA500EFBD9C00C65200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B0000007B0000007B7B7B0000000000000000007B0000007B00
      00007B7B7B00000000000000000000000000E7AD1800FFEFD600A5636300FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00CE8C6300FFD6
      B500FFD6B500FFCEA500EFBD9C00C65200000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B00000000007B0000007B7B7B0000000000000000007B0000007B00
      00007B7B7B00000000000000000000000000E7AD1800FFEFD600A5636300A563
      6300A5636300A5636300A5636300A5636300A5636300A5636300A5636300FFDE
      BD00FFD6B500FFD6B500EFBD9C00C65200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B007B0000007B7B7B007B7B7B007B7B7B007B0000007B00
      00007B7B7B007B7B7B000000000000000000E7AD1800FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFDEBD00EFBD9C00C65200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
      00007B0000007B000000000000000000000000000000E79C2100E79C2100E79C
      2100E79C2100E79C2100E79C2100E79C2100E79C2100E79C2100E79C2100E79C
      2100E79C2100E79C2100CE841000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636300A563
      6300A5636300A5636300A5636300A5636300A5636300A5636300A5636300A563
      6300A5636300A5636300A5636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042525A00FFEF
      C600F7D6B500EFD6AD00EFCE9C00EFCE9400EFC68C00EFBD8400EFBD7300EFBD
      8400EFBD8400EFC68400A563630000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B8484000000
      00000000000000000000000000007B8484000000000000000000000000000000
      000000000000000000000000000000000000000000005A6B8400106BC6005A6B
      8400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFBD8400EFBD
      7300EFBD7300EFC68400A563630000000000CE630000FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000029A5FF000873
      D600636B8400F7DEBD00EFD6B500EFCEA500EFCE9C00EFC69400EFC68C00EFBD
      8400EFBD7300EFC68400A563630000000000CE630000FFFFFF00FFC68400FFC6
      8400FFFFF700FFC68400FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A5000000000000000000A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A563520029A5
      FF000873D60052638400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFBD8400EFC68400A563630000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000000000000000000000000000A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5736300FFF7
      EF0029A5FF00397BAD008C635200AD7B6B0094635200AD7B6300CEA58400EFC6
      9400EFC68C00EFC68400A563630000000000CE630000FFFFFF00FFC68400FFC6
      8400FFFFFF00FFC68400FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000000000000000000A5A5
      A5000000000000000000A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5736300FFFF
      FF00F7EFE700AD8C8C00B58C8400DEBDA500EFD6B500D6B59C00B58C6B00CEA5
      8400EFC69400EFC68C00A563630000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000000000000000000A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD846300FFFF
      FF00FFF7EF00AD847300DEC6B500F7E7CE00F7E7C600FFFFF700D6B59C00AD7B
      6300EFCE9C00EFCE9400A563630000000000CE630000FFFFFF00FFC68400FFC6
      8400FFFFFF00FFC68400FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFD6AD00CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000000000000000000A5A5
      A5000000000000000000A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD846300FFFF
      FF00FFFFFF0094635A00F7EFDE00F7EFDE00F7E7CE00FFFFEF00EFD6B5009463
      5200EFCEA500F7D6A500A563630000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEF
      D600FFD6A500FFDEB500CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000000000000000000000000000A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6946300FFFF
      FF00FFFFFF00B58C8400DEC6C600F7EFE700F7EFDE00FFFFD600DEBDA500AD7B
      6B00F7D6AD00EFCEA500A563630000000000CE630000FFFFFF00FFC68400FFC6
      8400FFFFFF00FFC68400FFC68400FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFE7C600CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000007B84
      840000000000000000007B848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6946300FFFF
      FF00FFFFFF00D6BDBD00BD949400DEC6C600F7EFDE00DEC6B500B58C8400B58C
      7300DECEB500B5AD9400A563630000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7E700FFEFD600CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000007B84
      84007B8484007B8484007B848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE9C6B00FFFF
      FF00FFFFFF00FFFFFF00D6BDBD00B58C840094635A00AD847300CEA59C00A56B
      5200A56B5200A56B5200A563630000000000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B848400000000000000000000000000DE9C6B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700D6BDBD00A56B
      5200E79C4A00E78C2900B56B420000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000000000000F7FF0000F7
      FF0000F7FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF007B848400000000000000000000000000E7AD7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5200FFB55200BD7B5200000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B848400000000000000000000000000E7AD7300F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D6BDBD00A56B
      5200BD8463000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7300D694
      6300D6946300D6946300D6946300D6946300D6946300D6946300D6946300A56B
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00636B63004A524A00424A4200424A4200424A42004A524A009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00E7CEC600EFDED600F7E7D600F7E7D600EFDED600EFDED600CEBDB500525A
      52006B736B009C9C9C000000000000000000000000000000000000000000AD94
      8400F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7DE00F7E7
      DE00F7E7DE00F7E7DE00F7E7DE00AD9484000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000CEC6BD00F7E7
      D600F7F7F700E7E7E700CEB5A500D6AD9400DEC6BD00EFF7F700F7EFEF00EFDE
      D6008C847300636B63009C9C9C0000000000000000000000000000000000AD94
      8400F7E7DE00F7E7DE00F7E7DE00D6CEC600D6CEC600D6CEC600F7E7DE00F7E7
      DE00D6CEC600D6CEC600F7E7DE00AD9484000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C000000000000000000000000000000000000000000E7D6CE00F7E7DE00F7FF
      FF00CE9C8400B54A0800BD633100D6AD9C00C65A1800BD521800D6AD9C00F7FF
      FF00F7DED600737363006B736B0000000000000000000000000000000000AD94
      84000063940000639400F7EFDE00F7E7DE00F7EFDE00F7E7DE00F7E7DE00F7EF
      DE00F7E7DE00F7E7DE00F7EFDE00A59C94000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C0000000000000000000000000000000000EFDED600F7FFFF00C67B
      5200BD4A0800C6521000C6A59400FFFFFF00DE946B00BD4A0800B54A0800CE9C
      8400F7FFFF00EFDED600525A52009C9C9C00000000000000000000000000AD94
      8400006394006BCEF70000639400EFEFE700F7EFE700D6CEC600D6CEC600D6C6
      B500D6CEC600F7EFE700F7EFE700A59C94000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C00000000000000000000000000F7E7E700F7F7F700D6AD9400BD4A
      0800CE632900CE632100CE6B3100DE8C6300CE632100CE632900C65A2100B54A
      0800DEC6BD00F7EFE700A59C94005A635A000000000000639400006394000063
      94000063940084DEF7006BCEF70000639400F7EFE700F7EFE700EFE7EF00EFE7
      EF00EFE7EF00F7EFE700F7EFE7009C9C9C000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C00000000000000000000000000F7EFE700F7F7F700C6632900C65A
      2100CE6B2900CE5A1800CE8C6300F7E7DE00CE6B3100C65A1800CE632900C652
      1000C67B4A00F7FFFF00DECEC6004A524A000873AD0094E7F70094E7F70094E7
      F70094E7F70094E7F70094E7F70084DEF700086BA50000F7FF0000F7FF0000F7
      FF0000F7FF0000F7FF0000F7FF009C9C9C000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C00000000000000000000000000F7EFE700EFDED600C65A1800CE63
      2900CE632900CE5A1800C6846300FFFFFF00EFAD9400C64A0800CE632900CE63
      2100C65A2100F7EFEF00EFDED6004A524A000873AD00B5EFFF00B5EFFF00B5EF
      FF00B5EFFF00B5EFFF00B5EFFF0084DEF700086BA50000F7FF0000F7FF0000F7
      FF0000F7FF0000F7FF0000F7FF0094ADAD000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C
      8C008C8C8C00000000000000000000000000F7EFE700F7DECE00CE5A1800CE63
      2900CE632900CE632100C6521800CEB5A500FFFFFF00E79C7300C6521000CE63
      2100C65A2100F7EFEF00EFDED6004A524A00000000000873AD000873AD000873
      AD000873AD00EFFFFF00ADDEEF000873AD00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7EFEF00F7EFEF0094ADAD000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C00000000000000000000000000F7EFE700F7EFE700DE6B2900D66B
      2900CE632100C65A1800C6521000BD4A0800DECEC600FFFFFF00D6733900CE5A
      1800CE6B3100FFF7F700EFDED600636B630000000000000000000000000094AD
      AD000873AD00EFFFFF000873AD00F7F7EF00F7F7EF00D6CEC600F7F7EF00F7F7
      EF00D6CEC600D6CEC600F7F7EF0094ADAD000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C00000000000000000000000000F7E7E700FFFFFF00F79C6300E763
      2100CE8C6300EFE7DE00D67B4A00BD290000D69C7300FFFFFF00DE8C5A00CE52
      1000E79C6B00FFFFFF00DEC6BD00ADADAD0000000000000000000000000094AD
      AD000873AD000873AD00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF0094ADAD000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C00000000000000000000000000F7EFE700F7EFEF00FFEFDE00FF8C
      4200DE845200EFFFFF00FFFFFF00E7BDA500F7FFFF00EFFFFF00E7733100E773
      3100FFEFEF00F7E7DE00A59C94000000000000000000000000000000000084AD
      BD00FFF7F700FFF7F700FFF7F700FFF7F700D6CEC600D6CEC600D6CEC600FFF7
      F700D6CEC600D6C6B500F7F7F70084ADBD000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C000000000000000000000000000000000000000000EFDED600FFFFFF00FFEF
      CE00FFB56B00EFAD8400EFE7DE00EFF7F700EFE7DE00F7A57300FF8C4200FFDE
      CE00FFFFFF00EFDED600CECEC6000000000000000000000000000000000084AD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084ADBD000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      00000000000000000000000000000000000000000000F7EFEF00EFDED600FFFF
      FF00FFFFFF00FFF7C600FFDEAD00FFCE9400FFCE9400FFD6AD00FFF7F700FFFF
      FF00EFDED600CECEC600000000000000000000000000000000000000000084AD
      BD0000000000D6CEC600D6CEC600D6CEC6000000000000000000D6CEC600D6CE
      C600D6CEC600D6CEC600D6CEC60084ADBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7EFEF00EFDE
      D600F7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7DE00EFDE
      D600DEDEDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7EF
      E700F7F7EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C00FFFFFF008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C00FFFFFF00FFFFFF008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000E00100000100010000000000000F00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000003FFFF000000000003000000000000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000000000008000000000000000C000000000000000FC01000000000000
      FC03000000000000FC07FFFF000000008003FFFFFFFF00038003FFFF00010003
      8003000000010001800300000000000080030000000000018003000000000001
      8003000000000001800300000000000180030000000000018003000000000001
      80030000000180018003000000018001800300000001C001800700000003FC03
      800FFFFFFFFFFC07801FFFFFFFFFFC0F00FF8000FFFFFFFF00FF8000FFFFC001
      00FF8000FFFFC001001F8000FFFFC001000F8000F81FC00100078000F00FC001
      00038000F00FC00100038000F00FC00100038000F00FC001C0038000F00FC001
      80038000F00FC00127278000F81FC00173738000FFFFC001F9F98000FFFFC001
      FDFD8000FFFFC003FFFFFFFFFFFFC007C001FF7FFFFFC001C001FF47FC1FC001
      C001FF07F007C001C001FF47E003C001C001FF78C001C001C001F820C001C001
      C001F0288000C0018000F00F8000C001C001F0088000C001E001F0008000C001
      F001E028C001C001F801C047C001C001FC118307E003C001FE3107C7F007C003
      FF7F0FFFFC1FC007FFFF9FFFFFFFFFFFFFFFFFFFFFFFC001E003FCFFFF3FC001
      E003FC7FFE3FC001E003FC3FFC3FC001C003FC1FF83FC001C003C00FF003C001
      8003C007E003C0018003C003C003C0018003C003C003C001C003C007E003C001
      C003C00FF003C001E003FC1FF83FC001E007FC3FFC3FC001E00FFC7FFE3FC003
      E01FFCFFFF3FC007FFFFFFFFFFFFFFFFFFFFF87F8003FFFF8001F03F8003FDAF
      8001E03F8003FDAF8001E03F8003FE638001E00FC003FC0D8001E00FC0037403
      8001E00FC003001F8001E00F8003000F8001E00F0003000F8001E00F00038007
      8001E00FC00380078001E00FC0038007A305E00FC10B8007BFFDE00FC1FFC003
      FFFFF01FC1FFC033FFFFF83FE3FFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFE7FEFFF
      FFFFFFF9F81FC7FFFFFFFFF6F00FC3FFC2D8C518E00781FF8AD68B57C00380FF
      1A161B11C003007F3AD43BD6C003003F1AD71939C003181F8AD68BFFC0033C0F
      C139C7FFC003FF07FFFFFFFFC003FF83FFFFFFFFE007FFC1FFFFFFFFF00FFFE1
      FFFFFFFFFC3FFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800FFFFF401
      FFFFE0FEFFFFFFFFE007C082FCFCF681C00780FEFC78EFF7C0070082FC00E6F1
      C00700FCC00003FFC00700908800E681C00700F1C000EEBFC00700A3FC00F681
      C0270007FC78F7FFC007000FFCFCF401C007801FFFFFFFFFC007C03FFFFFE001
      FFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFF81F788F7E3CFFFFF9DE39CE38003FFFF
      CFE3C1E38003FE38E7C1C9C18003FF7DF3C1E3C1C003CB01B9F7E3F7E007B793
      81F7F7F7E007B793FFF7FFF7E007C7C788F7C0F7F007B7C79CF7CEF7F00FCFEF
      C1F7E7F7F81FFFFFC9F7F3F7F81FE31FE3F7F9F7F81FE79FE3F7DCF7F81FEB5F
      F7F7C0F7F83FFCFFFFFFFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFC00F0001FFFF
      FFFF800F0001EDB7C00180030001B6DBC00180030001DFFDC00180000001EC17
      C00180000001B99BC00180000001D99DC00180000001EC97C00180000001BE1B
      FC0180000001DB9DFC0180000001EC37FC01E0000001B7FBFFFFE0000001DB6D
      FFFFF800FFFFEDB7FFFFF800FFFFFFFFF81F9FFFFFFFFFFFE0070FFF03FFFFFC
      C00307FFFFBF9FF9800183FF033F8FF38001C1FFFE0787E70000E00F0337C3CF
      0000F003FFB7F11F0000F80103F7F83F0000E001FFFFFC7F0000C0000003F83F
      0000C000FFFFF19F800180000001E3CF80010001FFFFC7E7C003C00100078FFB
      E007C203FFFF1FFFF81FE00FFFFF3FFFFFFFFFFFFFFF9FFF87FFF001FFFF0FFF
      80FFE001800007FF803FE001800083FF801FC0018000C1FF800FC0018000E10F
      800F80018000F003800780018000F801800180018000F8018000C0018000F800
      8000C0018000F8008008E0018000F800800FE0018000F801800FE003FFFFFC01
      800FF003FFFFFE03E01FFE3FFFFFFF0FFFFFFFFFFFFFFFFFFDFFFFFBC00FE001
      F9FFFFF9C00FFFFFF02AF540C00FE0E1F9FFFFF9C00FF9F3FDFFFFFBC00FFCF3
      FFFFFFFFC00FFE038E3F8E3FC00FFF338E3F8E3FC00F7793843F843FC00F27C3
      843F843FC00F07E3803F803FC003AFF3C07FC07FC003AFFFE4FFE4FFFFCF8FFF
      E4FFE4FFFFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFF8003FFFF0001808080039FFF
      000180008003EFFF000180008003DC010001800080038FFF000180008003FFFF
      0001800080038FFF000180008003DFFF000180008003EC010001800080039FFF
      000180008003FFFF0001800080038FFF000180008003DFFF8003C08180079C01
      FFFFFFFF800FDFFFFFFFFFFF801FFFFFFFFFFFFFFC00FFFFFFFFFFFF0000FFFF
      1C7FFE3800008003BEE5FF7D0000000180DBCB0100000001C9DBB79300000001
      C9E3B79300000001E3DBC7C700000001E3E7B7C700000001F7FFCFEF00000001
      FFFFFFFF00070001FE1FE31F00070001DF1FE79F00070001DF1FEB5F000F0001
      EEDFFCFF001F8003F1FFFFFF003FFFFFFFFFFF9FFFFFF1CFFF83E00FFFFFE007
      FF01E00FFFFFE003FE00E007FFFFC001C000E007FFFFC0038000E0030000C007
      800060010000800780002001000080078001000300008007800380070000C007
      803F800F0000E003803F801FFFFFF1C7803F003FFFFFFFFF803F11FFFFFFFF3F
      C07FF8FFFFFFFF9FFFFFFFFFFFFFFFFFFFFF8003FFFFFFFFFFFF0001FEFFFDFF
      FFFF0001FFFFFFFFF7550001C27FC4FFFBFF0001FFFFFFFFFDFF0001C200C401
      FEFF0001FFFFFFFFFF7F0001DE07DC1FFFBF00019E070FFFFFDF000107FFDC03
      FB6FE00F9E00DC03F977E00FDE00FFFF007FE00FFFFFC403F97FE07FC200FFFF
      FB7FE07FFFFFFDFFFFFFFFFFFEFFFFFF80018001FFFFFFFF000000000001FFFF
      000000000001FFFF000000000001F5FF000000000001F5FF000000000001F5FF
      000000000001E5FF000000000001C5D7000000000001C5D7000000000001C5D7
      000000000001E097000000000001FF17000000000001FF17000000008003FF17
      00000000FF99FF8380018001FFFFFFFFFFFFFFFFFFFFFB8FBFFDFFFF9FFFFB07
      DFFBFFFF9FFFF807E007EFFF9FFFFB07E007C78C9FFFFB8FE007C7309FFFFBFF
      E007967B9FFFFB8FE007167B83FFFB07E007927980FFF807E007F330801FFB07
      E007FB848007FB8FE007FBFF8003F1FFE007F8008007E0FFDFFBF800807FE0FF
      BFFDFFFF83FFE0FFFFFFFFFFFFFFF1FFFFFFFFFFFFFFC001FFFFFFFFFFFF8000
      FFFFFFFFFCFF8000FFCFFC01F8738000FF07FC01FC618000F807E001E6E18000
      E003E001E3F1800080030001C1DB800070010001838F8000C0010001870F8000
      B8010001860F8000E0030001DC1F8000DC07000FFC1F8000F1FF000FFE3F8000
      E7FF007FFFFF8000EFFF007FFFFFC001FC7FE3FFFFFFF81FF87FC3FFE003E007
      FB27D93FFFFFC003FB43DA1FFFFF8001F85BC2DFFC038001FC1BE0DFFFFF0000
      FE03F01FFFFF0000FE07F03FF0030000FC3FE1FFFFFF0000F83FC1FFFFFF0000
      F03F81EFF0030000E23F11EFC3CF8001E63F3183C7EF8001EE3F71EFC7EFC003
      FE7FF3EFD9CFE007FEFFF7FFFC1FF81FF801F003FFFFFFFFF801F003FFFFBFFF
      F801F003FF7F82B7F801F003FE3F805700010003FC1F802F00010003001F8057
      00010003004F802B000100030067800F000100030077800B00010003007B8007
      00030007007D80030007000B007F8003003F003B007F8003003F002000FF8003
      007F007B01FF800100FF00FB03FFFFFFFFFF80078003C003FFFF80070001C003
      000080030001C003000080030001C001000080030001C001000080030001C001
      000080030001C003000080070001C003000080070001C003000080070001C003
      00008007E003C00300008007E003C0030000800FE001C0070000801FE06DC00F
      0000803FE06DC01FFFFFFFFFFFFFFFFFF001FFFFE000FFFFF001FFFFC000FFFF
      F001FFFFC000F001C0011C40C000FFFFC001BED8C000FFFFC00180DDC000FE01
      0001C9CDC000FFFF0001C9E1C000FFFF0003E3FDC000F8010007E3D9C001FFFF
      0007F7E1C001FFFF000FFFFFC001F801001F5555C001FFFF001FFFFFC001FFFF
      803FFFFFE003C801FFFFFFFFFC1FFFFFFFFF8001FFFFFFFFFFFFFFFFFFFFFFFF
      80018001FFFFFFFF0000FFFFFFFFF8430000C007FFFFF8C70000FFFFFFFFFCC7
      0000C0071039FCC70000FFFF38D6FCC70000C007BAD7F0C70000FFFF8237E0C7
      0000C007D6D6C4C70000FFFFD438C00300008001C7FFE0038001FFFFEFFFF003
      FFFF8001FFFFFFFFFFFFFFFFFFFFFFFFC001FFFFFFFFFFFFC0010001FFFFC0FF
      80010001FFFFC0FFC0010001FFFFC0FFC0010001CE73C0FFC0010001DE7BC0FF
      C0010001DE7BC0FFC0010001DE7BC0FFC0010001BE7DC0FFC0010001BE7DC0FF
      C0010001DE7BC0FFC0010001DE7B8001C0010001DE7B8001C0038003CE738001
      C007FFFFFFFFFFFFC00FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFE003E000
      F81FF81FC001E000F00FF00F8001E000E007E0078000E000E007E00700008000
      E007E00700000000E007E00700000000E007E00700008000E007E0070000E000
      E007E0070000E000E007E0070001E000F00FF00F8001EFFEF81FF81F8003E8C0
      FFFFFFFFC007FFFFFFFFFFFFE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F81FF81FF81FF81FF00FF00FF00FF00FE007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007F00FF00FF00FF00FF81FF81FF81FF81F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F81FF81FF81FF81FF00FF00FF00FF00FE007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007E007
      E007E007E007E007E007E007E007E007F00FF00FF00FF00FF81FF81FF81FF81F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu5: TPopupMenu
    Left = 328
    Top = 256
    object Cacher1: TMenuItem
      Caption = 'Cacher'
      OnClick = Cacher1Click
    end
    object Restaurer1: TMenuItem
      Caption = 'Restaurer'
      OnClick = Restaurer1Click
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object Quitter2: TMenuItem
      Caption = 'Quitter'
      OnClick = Quitter2Click
    end
  end
  object SynExporterTeX1: TSynExporterTeX
    Color = clWindow
    DefaultFilter = 'TeX Files (*.tex)|*.tex'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Untitled'
    UseBackground = False
    Left = 360
    Top = 192
  end
  object PopupMenu6: TPopupMenu
    Images = ImageList1
    Left = 360
    Top = 256
    object Nouveau2: TMenuItem
      Caption = 'Nouveau'
      object Fichiervide2: TMenuItem
        Caption = 'Vide'
        ImageIndex = 109
        OnClick = Vide1Click
      end
      object Modle1: TMenuItem
        Caption = 'Mod'#232'le ... '
        ImageIndex = 110
        OnClick = Modles1Click
      end
    end
    object Ouvrir2: TMenuItem
      Caption = 'Ouvrir ...'
      ImageIndex = 66
      OnClick = Ouvrir3Click
    end
    object N48: TMenuItem
      Caption = '-'
    end
    object Enregistrer2: TMenuItem
      Caption = 'Enregistrer'
      ImageIndex = 39
      OnClick = Enregistrer3Click
    end
    object Enregsitrersous1: TMenuItem
      Caption = 'Enregistrer-sous ...'
      ImageIndex = 40
      OnClick = Enregistrersous3Click
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object Ajouterunfichier1: TMenuItem
      Caption = 'Ajouter au projet ...'
      ImageIndex = 111
      OnClick = Ajouterauprojet1Click
    end
    object Supprimerdesfichiers1: TMenuItem
      Caption = 'Retirer du projet ...'
      ImageIndex = 112
      OnClick = Retirerduprojet1Click
    end
    object N41: TMenuItem
      Caption = '-'
    end
    object Informationssurleprojet2: TMenuItem
      Caption = 'Informations sur le projet'
      ImageIndex = 102
      OnClick = Informationssurleprojet1Click
    end
    object Options2: TMenuItem
      Caption = 'Options ...'
      ImageIndex = 104
      OnClick = Options1Click
    end
    object N49: TMenuItem
      Caption = '-'
    end
    object Fermer3: TMenuItem
      Caption = 'Fermer'
      ImageIndex = 46
      OnClick = Fermer4Click
    end
  end
  object XPManifest1: TXPManifest
    Left = 264
    Top = 288
  end
  object PopupMenu7: TPopupMenu
    Left = 296
    Top = 288
    object Copier2: TMenuItem
      Caption = 'Copier'
      OnClick = Copier2Click
    end
    object Effacer1: TMenuItem
      Caption = 'Effacer'
      OnClick = Effacer1Click
    end
    object Enregistrersous4: TMenuItem
      Caption = 'Enregistrer-sous'
      OnClick = Enregistrersous4Click
    end
  end
end
