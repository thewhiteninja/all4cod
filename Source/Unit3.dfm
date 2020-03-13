object Form3: TForm3
  Left = 365
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pr'#233'f'#233'rences'
  ClientHeight = 369
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = LabeledEdit1Change
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 0
    Top = 23
    Width = 110
    Height = 327
    Align = alLeft
    AutoExpand = True
    BorderStyle = bsNone
    ChangeDelay = 50
    Images = Form1.ImageList1
    Indent = 19
    ReadOnly = True
    RightClickSelect = True
    TabOrder = 1
    OnClick = TreeView1Click
    Items.NodeData = {
      010A0000002B0000004400000044000000FFFFFFFFFFFFFFFF00000000000000
      00094700E9006E00E900720061006C0065007300270000000E0000000E000000
      FFFFFFFFFFFFFFFF00000000000000000745006400690074006500750072002F
      0000005C0000005C000000FFFFFFFFFFFFFFFF00000000000000000B43006F00
      6C006F0072006100740065007500720073002D0000001E0000001E000000FFFF
      FFFFFFFFFFFF00000000000000000A43006F0072007200650063007400650075
      007200290000001900000019000000FFFFFFFFFFFFFFFF000000000000000008
      43006F006D00700069006C0065007200290000002A0000002A000000FFFFFFFF
      FFFFFFFF00000000000000000845007800E90063007500740065007200270000
      006000000060000000FFFFFFFFFFFFFFFF00000000000000000750006C007500
      670069006E0073002B0000005B0000005B000000FFFFFFFFFFFFFFFF00000000
      000000000954006900640079002000480054004D004C002B0000003F0000003F
      000000FFFFFFFFFFFFFFFF000000000000000009560061007200690061006200
      6C00650073002D0000003100000031000000FFFFFFFFFFFFFFFF000000000000
      00000A49006D007000720065007300730069006F006E00}
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 0
    Width = 605
    Height = 23
    Align = alTop
    AutoSize = False
    Color = clCaptionText
    ParentColor = False
    ShowAccelChar = False
    TabOrder = 2
    Transparent = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 350
    Width = 605
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Notebook1: TNotebook
    Left = 110
    Top = 23
    Width = 495
    Height = 327
    Align = alClient
    PageIndex = 2
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'G'#233'n'#233'rales'
      object Label8: TLabel
        Left = 277
        Top = 28
        Width = 22
        Height = 13
        Caption = 'secs'
      end
      object GroupBox1: TGroupBox
        Left = 320
        Top = 8
        Width = 161
        Height = 89
        Caption = 'Date et heure'
        TabOrder = 0
        object Bevel1: TBevel
          Left = 8
          Top = 59
          Width = 146
          Height = 21
        end
        object Label1: TLabel
          Left = 9
          Top = 60
          Width = 144
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Layout = tlCenter
        end
        object LabeledEdit1: TLabeledEdit
          Left = 8
          Top = 32
          Width = 145
          Height = 21
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Format'
          EditLabel.Layout = tlCenter
          TabOrder = 0
          Text = 'hh:mm:ss dd/mm/yyyy'
          OnChange = LabeledEdit1Change
        end
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 11
        Width = 193
        Height = 17
        Caption = 'Autoriser qu'#39'une instance de All4Cod'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object CheckBox6: TCheckBox
        Left = 16
        Top = 75
        Width = 145
        Height = 17
        Caption = 'Confirmer "Quitter All4Cod"'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object CheckBox7: TCheckBox
        Left = 16
        Top = 27
        Width = 153
        Height = 17
        Caption = 'Sauvegarde automatique'
        TabOrder = 3
      end
      object SpinEdit1: TSpinEdit
        Left = 213
        Top = 24
        Width = 60
        Height = 22
        AutoSize = False
        EditorEnabled = False
        Increment = 10
        MaxLength = 4
        MaxValue = 3600
        MinValue = 60
        TabOrder = 4
        Value = 60
      end
      object CheckBox8: TCheckBox
        Left = 346
        Top = 107
        Width = 121
        Height = 17
        Caption = 'Afficher Standard'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object CheckBox9: TCheckBox
        Left = 346
        Top = 123
        Width = 97
        Height = 17
        Caption = 'Afficher Edition'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CheckBox10: TCheckBox
        Left = 346
        Top = 139
        Width = 121
        Height = 17
        Caption = 'Afficher Language'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object CheckBox11: TCheckBox
        Left = 346
        Top = 155
        Width = 105
        Height = 17
        Caption = 'Afficher Affichage'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object CheckBox12: TCheckBox
        Left = 346
        Top = 171
        Width = 121
        Height = 17
        Caption = 'Afficher Recherche'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object CheckBox13: TCheckBox
        Left = 346
        Top = 187
        Width = 97
        Height = 17
        Caption = 'Afficher Outils'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object CheckBox14: TCheckBox
        Left = 346
        Top = 203
        Width = 97
        Height = 17
        Caption = 'Afficher Fen'#234'tre'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object CheckBox15: TCheckBox
        Left = 16
        Top = 211
        Width = 116
        Height = 17
        Caption = 'Afficher Explorateur'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object CheckBox16: TCheckBox
        Left = 16
        Top = 227
        Width = 149
        Height = 17
        Caption = 'Afficher Mod'#232'les de codes'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object CheckBox25: TCheckBox
        Left = 168
        Top = 227
        Width = 134
        Height = 17
        Caption = 'Colorateur automatique'
        Checked = True
        State = cbChecked
        TabOrder = 14
      end
      object CheckBox26: TCheckBox
        Left = 168
        Top = 211
        Width = 154
        Height = 17
        Caption = 'Afficher la boite "Nouveau"'
        Checked = True
        State = cbChecked
        TabOrder = 15
      end
      object CheckBox27: TCheckBox
        Left = 16
        Top = 251
        Width = 88
        Height = 17
        Caption = 'Ligne active'
        Checked = True
        State = cbChecked
        TabOrder = 16
      end
      object CheckBox28: TCheckBox
        Left = 16
        Top = 267
        Width = 103
        Height = 17
        Caption = 'Retour '#224' la ligne'
        TabOrder = 17
      end
      object CheckBox29: TCheckBox
        Left = 168
        Top = 251
        Width = 122
        Height = 17
        Caption = 'Caract'#232'res sp'#233'ciaux'
        TabOrder = 18
      end
      object CheckBox30: TCheckBox
        Left = 168
        Top = 267
        Width = 158
        Height = 17
        Caption = 'Compl'#233'tion des parenth'#232'ses'
        Checked = True
        State = cbChecked
        TabOrder = 19
      end
      object Button7: TButton
        Left = 363
        Top = 287
        Width = 103
        Height = 25
        Caption = 'Fermer'
        TabOrder = 20
        OnClick = Button7Click
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 99
        Width = 297
        Height = 97
        Caption = 'Fichiers syst'#232'mes'
        TabOrder = 21
        object ListBox1: TListBox
          Left = 2
          Top = 15
          Width = 191
          Height = 80
          Align = alLeft
          ItemHeight = 13
          MultiSelect = True
          Sorted = True
          TabOrder = 0
        end
        object Button8: TButton
          Left = 200
          Top = 15
          Width = 81
          Height = 22
          Caption = 'Ajouter'
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 200
          Top = 41
          Width = 81
          Height = 22
          Caption = 'Effacer'
          TabOrder = 2
          OnClick = Button9Click
        end
        object Button10: TButton
          Left = 200
          Top = 67
          Width = 81
          Height = 22
          Caption = 'Tout effacer'
          TabOrder = 3
          OnClick = Button10Click
        end
      end
      object CheckBox34: TCheckBox
        Left = 346
        Top = 243
        Width = 131
        Height = 17
        Caption = 'Afficher la table ASCII'
        TabOrder = 22
      end
      object CheckBox40: TCheckBox
        Left = 346
        Top = 262
        Width = 145
        Height = 13
        Caption = 'Afficher le Splash-Screen'
        Checked = True
        State = cbChecked
        TabOrder = 23
      end
      object CheckBox41: TCheckBox
        Left = 346
        Top = 219
        Width = 129
        Height = 17
        Caption = 'Afficher Configuration'
        Checked = True
        State = cbChecked
        TabOrder = 24
      end
      object CheckBox42: TCheckBox
        Left = 16
        Top = 43
        Width = 185
        Height = 17
        Caption = 'Reduire dans la barre des t'#226'ches'
        Checked = True
        State = cbChecked
        TabOrder = 25
      end
      object CheckBox43: TCheckBox
        Left = 16
        Top = 59
        Width = 185
        Height = 17
        Caption = 'Fermer dans la barre des t'#226'ches'
        TabOrder = 26
      end
      object CheckBox48: TCheckBox
        Left = 16
        Top = 291
        Width = 249
        Height = 17
        Caption = 'Afficher l'#39'onglet "All4Cod - Infos" au d'#233'marrage'
        Checked = True
        State = cbChecked
        TabOrder = 27
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Editeur'
      object Label12: TLabel
        Left = 16
        Top = 107
        Width = 118
        Height = 13
        Caption = 'Espace entre les lignes : '
      end
      object Label13: TLabel
        Left = 16
        Top = 131
        Width = 109
        Height = 13
        Caption = 'Taille de la tabulation : '
      end
      object Label14: TLabel
        Left = 16
        Top = 155
        Width = 83
        Height = 13
        Caption = 'Limite "D'#233'faire" : '
      end
      object Label15: TLabel
        Left = 16
        Top = 179
        Width = 54
        Height = 13
        Caption = 'Cot'#233' droit : '
      end
      object Label16: TLabel
        Left = 16
        Top = 203
        Width = 97
        Height = 13
        Caption = 'Barre de d'#233'filement :'
      end
      object Label17: TLabel
        Left = 16
        Top = 227
        Width = 76
        Height = 13
        Caption = 'Type de Caret : '
      end
      object Label18: TLabel
        Left = 16
        Top = 251
        Width = 45
        Height = 13
        Caption = 'Couleur : '
      end
      object Label19: TLabel
        Left = 16
        Top = 275
        Width = 50
        Height = 13
        Caption = 'S'#233'lection :'
      end
      object Label20: TLabel
        Left = 16
        Top = 299
        Width = 80
        Height = 13
        Caption = 'S'#233'lection (fond) :'
      end
      object Shape3: TShape
        Left = 136
        Top = 243
        Width = 86
        Height = 21
      end
      object Shape4: TShape
        Left = 136
        Top = 267
        Width = 86
        Height = 21
      end
      object Shape5: TShape
        Left = 136
        Top = 291
        Width = 86
        Height = 21
        Brush.Color = clNavy
      end
      object GroupBox2: TGroupBox
        Left = 280
        Top = 176
        Width = 201
        Height = 137
        Caption = 'Gouti'#232're'
        TabOrder = 0
        object Label9: TLabel
          Left = 16
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Largeur : '
        end
        object Label10: TLabel
          Left = 16
          Top = 48
          Width = 98
          Height = 13
          Caption = 'Nombre de chiffres : '
        end
        object CheckBox17: TCheckBox
          Left = 16
          Top = 75
          Width = 97
          Height = 17
          Caption = 'Visible'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CheckBox18: TCheckBox
          Left = 16
          Top = 91
          Width = 97
          Height = 17
          Caption = 'Partir de z'#233'ro'
          TabOrder = 1
        end
        object CheckBox19: TCheckBox
          Left = 16
          Top = 107
          Width = 97
          Height = 17
          Caption = 'Cacher les z'#233'ros'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object SpinEdit2: TSpinEdit
          Left = 120
          Top = 19
          Width = 65
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 10
        end
        object SpinEdit3: TSpinEdit
          Left = 120
          Top = 44
          Width = 65
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 280
        Top = 56
        Width = 201
        Height = 113
        Caption = 'Police'
        TabOrder = 1
        object Bevel2: TBevel
          Left = 16
          Top = 16
          Width = 169
          Height = 57
        end
        object Label11: TLabel
          Left = 17
          Top = 17
          Width = 167
          Height = 55
          Alignment = taCenter
          AutoSize = False
          Caption = 'All4Cod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object Button3: TButton
          Left = 49
          Top = 80
          Width = 100
          Height = 25
          Caption = 'Changer'
          TabOrder = 0
          OnClick = Button3Click
        end
      end
      object CheckBox20: TCheckBox
        Left = 16
        Top = 11
        Width = 121
        Height = 17
        Caption = 'Cacher la s'#233'lection'
        TabOrder = 2
      end
      object CheckBox21: TCheckBox
        Left = 16
        Top = 27
        Width = 137
        Height = 17
        Caption = 'Indentation automatique'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object CheckBox22: TCheckBox
        Left = 16
        Top = 43
        Width = 145
        Height = 17
        Caption = 'Autoriser les tabulations'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object CheckBox23: TCheckBox
        Left = 16
        Top = 59
        Width = 217
        Height = 17
        Caption = 'Effacer "D'#233'faire" apr'#233's une sauvegarde'
        TabOrder = 5
      end
      object CheckBox24: TCheckBox
        Left = 16
        Top = 75
        Width = 113
        Height = 17
        Caption = 'Tabulation rapide'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object SpinEdit4: TSpinEdit
        Left = 184
        Top = 101
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 7
        Value = 0
      end
      object SpinEdit5: TSpinEdit
        Left = 184
        Top = 125
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 8
        Value = 8
      end
      object SpinEdit6: TSpinEdit
        Left = 184
        Top = 149
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 9
        Value = 100
      end
      object SpinEdit7: TSpinEdit
        Left = 184
        Top = 173
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 10
        Value = 80
      end
      object ComboBox3: TComboBox
        Left = 136
        Top = 197
        Width = 113
        Height = 21
        Style = csDropDownList
        DropDownCount = 4
        ItemHeight = 0
        ItemIndex = 3
        TabOrder = 11
        Text = 'Les deux'
        Items.Strings = (
          'Aucune'
          'Verticale'
          'Horizontale'
          'Les deux')
      end
      object ComboBox4: TComboBox
        Left = 136
        Top = 220
        Width = 113
        Height = 21
        Style = csDropDownList
        DropDownCount = 4
        ItemHeight = 0
        TabOrder = 12
        Items.Strings = (
          'Verticale'
          'Horizontale'
          'Demi-Bloc'
          'Bloc')
      end
      object Button4: TButton
        Left = 225
        Top = 243
        Width = 24
        Height = 21
        Caption = '...'
        TabOrder = 13
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 225
        Top = 267
        Width = 24
        Height = 21
        Caption = '...'
        TabOrder = 14
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 225
        Top = 291
        Width = 24
        Height = 21
        Caption = '...'
        TabOrder = 15
        OnClick = Button6Click
      end
      object CheckBox31: TCheckBox
        Left = 280
        Top = 11
        Width = 161
        Height = 17
        Caption = 'Utiliser le glisser/d'#233'placer'
        Checked = True
        State = cbChecked
        TabOrder = 16
      end
      object CheckBox44: TCheckBox
        Left = 280
        Top = 27
        Width = 97
        Height = 17
        Caption = 'Afficher la r'#232'gle'
        Checked = True
        State = cbChecked
        TabOrder = 17
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Colorateurs'
      object Label2: TLabel
        Left = 23
        Top = 19
        Width = 57
        Height = 13
        Caption = 'Colorateur : '
      end
      object ComboBox1: TComboBox
        Left = 106
        Top = 15
        Width = 185
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnSelect = ComboBox1Select
      end
      object PageControl1: TPageControl
        Left = 15
        Top = 48
        Width = 466
        Height = 258
        ActivePage = TabSheet2
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Coloration'
          object Label3: TLabel
            Left = 24
            Top = 16
            Width = 44
            Height = 13
            Caption = 'Attributs :'
          end
          object Label4: TLabel
            Left = 24
            Top = 48
            Width = 45
            Height = 13
            Caption = 'Couleur : '
          end
          object Shape1: TShape
            Left = 24
            Top = 64
            Width = 153
            Height = 25
          end
          object Shape2: TShape
            Left = 248
            Top = 64
            Width = 153
            Height = 25
          end
          object Label5: TLabel
            Left = 248
            Top = 48
            Width = 33
            Height = 13
            Caption = 'Fond : '
          end
          object ComboBox2: TComboBox
            Left = 79
            Top = 12
            Width = 153
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnSelect = ComboBox2Select
          end
          object LabeledEdit2: TLabeledEdit
            Left = 24
            Top = 187
            Width = 242
            Height = 21
            EditLabel.Width = 76
            EditLabel.Height = 13
            EditLabel.Caption = 'Type de fichier :'
            TabOrder = 1
            OnChange = LabeledEdit2Change
          end
          object LabeledEdit3: TLabeledEdit
            Left = 280
            Top = 187
            Width = 152
            Height = 21
            EditLabel.Width = 67
            EditLabel.Height = 13
            EditLabel.Caption = 'Commentaire :'
            LabelSpacing = 4
            MaxLength = 10
            TabOrder = 3
            OnChange = LabeledEdit3Change
          end
          object Button1: TButton
            Left = 181
            Top = 64
            Width = 27
            Height = 25
            Caption = '...'
            TabOrder = 2
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 405
            Top = 64
            Width = 27
            Height = 25
            Caption = '...'
            TabOrder = 4
            OnClick = Button2Click
          end
          object GroupBox14: TGroupBox
            Left = 24
            Top = 104
            Width = 409
            Height = 57
            Caption = 'Styles'
            TabOrder = 5
            object CheckBox5: TCheckBox
              Left = 45
              Top = 25
              Width = 49
              Height = 17
              Caption = 'Gras'
              TabOrder = 0
            end
            object CheckBox2: TCheckBox
              Left = 217
              Top = 25
              Width = 65
              Height = 17
              Caption = 'Soulign'#233
              TabOrder = 1
              OnClick = CheckBox2Click
            end
            object CheckBox3: TCheckBox
              Left = 316
              Top = 25
              Width = 65
              Height = 17
              Caption = 'Barr'#233
              TabOrder = 2
            end
            object CheckBox4: TCheckBox
              Left = 125
              Top = 25
              Width = 65
              Height = 17
              Caption = 'Italique'
              TabOrder = 3
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Ach'#232'vement du code'
          ImageIndex = 1
          object Label23: TLabel
            Left = 28
            Top = 148
            Width = 40
            Height = 13
            Caption = 'Fichier : '
          end
          object GroupBox15: TGroupBox
            Left = 24
            Top = 24
            Width = 409
            Height = 97
            Caption = 'Valables pour tout les colorateurs'
            TabOrder = 0
            object Label6: TLabel
              Left = 231
              Top = 60
              Width = 156
              Height = 13
              Caption = 'Interval :                                  ms'
            end
            object Label7: TLabel
              Left = 16
              Top = 60
              Width = 58
              Height = 13
              Caption = 'Raccourci : '
            end
            object CheckBox45: TCheckBox
              Left = 16
              Top = 24
              Width = 121
              Height = 17
              Caption = 'Sensible '#224' la casse'
              TabOrder = 0
            end
            object CheckBox46: TCheckBox
              Left = 314
              Top = 24
              Width = 81
              Height = 17
              Caption = 'Ansi Strings'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object CheckBox47: TCheckBox
              Left = 160
              Top = 24
              Width = 129
              Height = 17
              Caption = 'Limit to the match text'
              TabOrder = 2
            end
            object SpinEdit8: TSpinEdit
              Left = 278
              Top = 56
              Width = 90
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 3
              Value = 1000
            end
            object HotKey1: THotKey
              Left = 80
              Top = 56
              Width = 113
              Height = 22
              AutoSize = False
              HotKey = 16416
              Modifiers = [hkCtrl]
              TabOrder = 4
            end
          end
          object LabeledEdit4: TLabeledEdit
            Left = 341
            Top = 144
            Width = 84
            Height = 21
            EditLabel.Width = 67
            EditLabel.Height = 13
            EditLabel.Caption = 'Trigger Char : '
            LabelPosition = lpLeft
            MaxLength = 2
            TabOrder = 1
            Text = '.'
            OnChange = LabeledEdit4Change
          end
          object ComboBox9: TComboBox
            Left = 72
            Top = 144
            Width = 161
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            OnSelect = ComboBox9Select
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Auto-completion'
          ImageIndex = 3
          object Label27: TLabel
            Left = 24
            Top = 28
            Width = 37
            Height = 13
            Caption = 'Fichier :'
          end
          object ComboBox7: TComboBox
            Left = 68
            Top = 24
            Width = 161
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnSelect = ComboBox7Select
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Aper'#231'u'
          ImageIndex = 2
          object SynEdit1: TSynEdit
            Left = 0
            Top = 0
            Width = 458
            Height = 230
            Align = alClient
            ActiveLineColor = clYellow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            BorderStyle = bsNone
            Gutter.DigitCount = 3
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.LeftOffset = 0
            Gutter.ShowLineNumbers = True
            MaxUndo = 10
            ReadOnly = True
            ScrollBars = ssNone
            WantTabs = True
            RemovedKeystrokes = <
              item
                Command = ecGotoMarker0
                ShortCut = 16432
              end
              item
                Command = ecGotoMarker1
                ShortCut = 16433
              end
              item
                Command = ecGotoMarker2
                ShortCut = 16434
              end
              item
                Command = ecGotoMarker3
                ShortCut = 16435
              end
              item
                Command = ecGotoMarker4
                ShortCut = 16436
              end
              item
                Command = ecGotoMarker5
                ShortCut = 16437
              end
              item
                Command = ecGotoMarker6
                ShortCut = 16438
              end
              item
                Command = ecGotoMarker7
                ShortCut = 16439
              end
              item
                Command = ecGotoMarker8
                ShortCut = 16440
              end
              item
                Command = ecGotoMarker9
                ShortCut = 16441
              end
              item
                Command = ecSetMarker0
                ShortCut = 24624
              end
              item
                Command = ecSetMarker1
                ShortCut = 24625
              end
              item
                Command = ecSetMarker2
                ShortCut = 24626
              end
              item
                Command = ecSetMarker3
                ShortCut = 24627
              end
              item
                Command = ecSetMarker4
                ShortCut = 24628
              end
              item
                Command = ecSetMarker5
                ShortCut = 24629
              end
              item
                Command = ecSetMarker6
                ShortCut = 24630
              end
              item
                Command = ecSetMarker7
                ShortCut = 24631
              end
              item
                Command = ecSetMarker8
                ShortCut = 24632
              end
              item
                Command = ecSetMarker9
                ShortCut = 24633
              end>
            AddedKeystrokes = <>
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Correcteur'
      object GroupBox5: TGroupBox
        Left = 16
        Top = 8
        Width = 466
        Height = 153
        Caption = 'Correcteur d'#39'orthographe'
        TabOrder = 0
        object Label42: TLabel
          Left = 16
          Top = 33
          Width = 65
          Height = 13
          Caption = 'Dictionnaire : '
        end
        object Label43: TLabel
          Left = 16
          Top = 59
          Width = 82
          Height = 13
          Caption = 'Montrer comme : '
        end
        object CheckBox32: TCheckBox
          Left = 264
          Top = 32
          Width = 177
          Height = 17
          Caption = 'Ignorer les mots d'#39'un caract'#232're'
          TabOrder = 0
        end
        object CheckBox33: TCheckBox
          Left = 264
          Top = 57
          Width = 185
          Height = 17
          Caption = 'Ignorer les mots avec des chiffres'
          TabOrder = 1
        end
        object ComboBox11: TComboBox
          Left = 104
          Top = 30
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
        end
        object ComboBox12: TComboBox
          Left = 104
          Top = 56
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          ItemIndex = 0
          TabOrder = 3
          Text = 'Corel Word Perfect'
          Items.Strings = (
            'Corel Word Perfect'
            'Microsoft Word')
        end
        object Button12: TButton
          Left = 56
          Top = 104
          Width = 153
          Height = 23
          Caption = 'Charger le dictionnaire'
          TabOrder = 4
          OnClick = Button12Click
        end
        object Button14: TButton
          Left = 249
          Top = 104
          Width = 153
          Height = 23
          Caption = 'D'#233'charger le dictionnaire'
          TabOrder = 5
          OnClick = Button14Click
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Compiler'
      object Label21: TLabel
        Left = 24
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Programme :'
      end
      object Label22: TLabel
        Left = 24
        Top = 56
        Width = 59
        Height = 13
        Caption = 'Param'#232'tres :'
      end
      object Edit1: TEdit
        Left = 24
        Top = 32
        Width = 404
        Height = 21
        OEMConvert = True
        TabOrder = 0
      end
      object Button11: TButton
        Left = 433
        Top = 31
        Width = 42
        Height = 23
        Caption = '...'
        TabOrder = 1
        OnClick = Button11Click
      end
      object Edit2: TEdit
        Left = 24
        Top = 72
        Width = 449
        Height = 21
        TabOrder = 2
      end
      object GroupBox9: TGroupBox
        Left = 24
        Top = 104
        Width = 451
        Height = 137
        Caption = 'Propri'#233't'#233's'
        TabOrder = 3
        object Label40: TLabel
          Left = 40
          Top = 24
          Width = 131
          Height = 13
          Caption = 'Timeout (apr'#233's lancement) :'
        end
        object Label41: TLabel
          Left = 40
          Top = 50
          Width = 148
          Height = 13
          Caption = 'Timeout (apr'#233's derni'#232're sortie) :'
        end
        object Label24: TLabel
          Left = 40
          Top = 102
          Width = 84
          Height = 13
          Caption = 'Type de fen'#234'tre : '
        end
        object Label25: TLabel
          Left = 40
          Top = 76
          Width = 41
          Height = 13
          Caption = 'Priorit'#233' : '
        end
        object ComboBox6: TComboBox
          Left = 280
          Top = 71
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          ItemIndex = 1
          TabOrder = 0
          Text = '8'
          Items.Strings = (
            '13'
            '8'
            '6'
            '24')
        end
        object ComboBox5: TComboBox
          Left = 280
          Top = 97
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
          Items.Strings = (
            'Cacher'
            'Maximiser'
            'Minimiser'
            'Normal')
        end
        object SpinEdit13: TSpinEdit
          Left = 280
          Top = 45
          Width = 121
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object SpinEdit12: TSpinEdit
          Left = 280
          Top = 19
          Width = 121
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
      end
      object GroupBox11: TGroupBox
        Left = 24
        Top = 256
        Width = 449
        Height = 49
        Caption = 'Profil'
        TabOrder = 4
        object Label26: TLabel
          Left = 192
          Top = 22
          Width = 85
          Height = 13
          Caption = 'Charger le fichier :'
        end
        object ComboBox18: TComboBox
          Tag = 1
          Left = 280
          Top = 17
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          Sorted = True
          TabOrder = 0
          OnSelect = ComboBox18Select
        end
        object Button18: TButton
          Left = 40
          Top = 19
          Width = 105
          Height = 21
          Caption = 'Sauvegarder ...'
          TabOrder = 1
          OnClick = Button18Click
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Ex'#233'cuter'
      object Label32: TLabel
        Left = 24
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Programme :'
      end
      object Label33: TLabel
        Left = 24
        Top = 64
        Width = 59
        Height = 13
        Caption = 'Param'#232'tres :'
      end
      object Edit7: TEdit
        Left = 24
        Top = 32
        Width = 404
        Height = 21
        OEMConvert = True
        TabOrder = 0
      end
      object Edit8: TEdit
        Left = 24
        Top = 80
        Width = 449
        Height = 21
        TabOrder = 1
      end
      object Button15: TButton
        Left = 433
        Top = 31
        Width = 42
        Height = 23
        Caption = '...'
        TabOrder = 2
        OnClick = Button15Click
      end
      object GroupBox7: TGroupBox
        Left = 24
        Top = 120
        Width = 451
        Height = 57
        Caption = 'Propri'#233't'#233's'
        TabOrder = 3
        object Label35: TLabel
          Left = 40
          Top = 30
          Width = 84
          Height = 13
          Caption = 'Type de fen'#234'tre : '
        end
        object ComboBox10: TComboBox
          Left = 280
          Top = 25
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          ItemIndex = 3
          TabOrder = 0
          Text = 'Normal'
          Items.Strings = (
            'Cacher'
            'Maximiser'
            'Minimiser'
            'Normal')
        end
      end
      object GroupBox13: TGroupBox
        Left = 24
        Top = 200
        Width = 449
        Height = 49
        Caption = 'Profil'
        TabOrder = 4
        object Label36: TLabel
          Left = 192
          Top = 22
          Width = 85
          Height = 13
          Caption = 'Charger le fichier :'
        end
        object ComboBox20: TComboBox
          Tag = 3
          Left = 280
          Top = 17
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          Sorted = True
          TabOrder = 0
          OnSelect = ComboBox18Select
        end
        object Button20: TButton
          Left = 40
          Top = 19
          Width = 105
          Height = 21
          Caption = 'Sauvegarder ...'
          TabOrder = 1
          OnClick = Button18Click
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Plugins'
      object GroupBox16: TGroupBox
        Left = 16
        Top = 8
        Width = 145
        Height = 308
        Caption = 'Liste des plugins'
        TabOrder = 0
        object ListBox2: TListBox
          Left = 2
          Top = 15
          Width = 141
          Height = 291
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 13
          TabOrder = 0
          OnClick = ListBox2Click
        end
      end
      object GroupBox17: TGroupBox
        Left = 168
        Top = 8
        Width = 313
        Height = 308
        Caption = 'Informations'
        TabOrder = 1
        object Label34: TLabel
          Left = 16
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Auteur :'
        end
        object Label37: TLabel
          Left = 16
          Top = 48
          Width = 29
          Height = 13
          Caption = 'Date :'
        end
        object Label55: TLabel
          Left = 16
          Top = 72
          Width = 59
          Height = 13
          Caption = 'Description :'
        end
        object Label56: TLabel
          Left = 16
          Top = 168
          Width = 72
          Height = 13
          Caption = 'Commentaires :'
        end
        object Label57: TLabel
          Left = 16
          Top = 192
          Width = 32
          Height = 13
          Caption = 'Outils :'
        end
        object Label58: TLabel
          Left = 16
          Top = 216
          Width = 50
          Height = 13
          Caption = 'Site Web :'
        end
        object Label59: TLabel
          Left = 16
          Top = 240
          Width = 31
          Height = 13
          Caption = 'Email :'
        end
        object Image2: TImage
          Left = 248
          Top = 47
          Width = 16
          Height = 16
          Center = True
          Proportional = True
          Transparent = True
        end
        object Label60: TLabel
          Left = 208
          Top = 48
          Width = 33
          Height = 13
          Caption = 'Icone :'
        end
        object Label63: TLabel
          Left = 69
          Top = 216
          Width = 3
          Height = 13
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = Label63Click
        end
        object Label64: TLabel
          Left = 50
          Top = 240
          Width = 3
          Height = 13
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = Label64Click
        end
        object Label52: TLabel
          Left = 56
          Top = 24
          Width = 3
          Height = 13
        end
        object Label53: TLabel
          Left = 52
          Top = 48
          Width = 3
          Height = 13
        end
        object Label54: TLabel
          Left = 96
          Top = 168
          Width = 3
          Height = 13
        end
        object Label65: TLabel
          Left = 53
          Top = 192
          Width = 3
          Height = 13
        end
        object Memo1: TMemo
          Left = 24
          Top = 88
          Width = 265
          Height = 65
          BorderStyle = bsNone
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Tidy HTML'
      object GroupBox18: TGroupBox
        Left = 16
        Top = 16
        Width = 201
        Height = 297
        Caption = 'Fichier de configuration personnalis'#233
        TabOrder = 0
        object Memo2: TMemo
          Left = 2
          Top = 15
          Width = 197
          Height = 280
          Align = alClient
          BorderStyle = bsNone
          ScrollBars = ssVertical
          TabOrder = 0
          WordWrap = False
        end
      end
      object GroupBox19: TGroupBox
        Left = 232
        Top = 16
        Width = 244
        Height = 297
        Caption = 'Liste des options'
        TabOrder = 1
        object ListView1: TListView
          Left = 2
          Top = 15
          Width = 240
          Height = 280
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsNone
          Columns = <
            item
              Caption = 'Nom'
              MaxWidth = 120
              MinWidth = 110
              Width = 115
            end
            item
              Alignment = taCenter
              AutoSize = True
              Caption = 'Type'
              MaxWidth = 60
              MinWidth = 54
            end
            item
              Alignment = taCenter
              AutoSize = True
              Caption = 'Valeur (d'#233'fault)'
              MinWidth = 55
            end>
          ColumnClick = False
          ReadOnly = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Variables'
      object GroupBox10: TGroupBox
        Left = 15
        Top = 10
        Width = 462
        Height = 269
        Caption = 'Variables utilisateurs'
        TabOrder = 0
        object StringGrid1: TStringGrid
          Left = 2
          Top = 15
          Width = 458
          Height = 252
          Align = alClient
          BorderStyle = bsNone
          ColCount = 2
          DefaultColWidth = 224
          DefaultRowHeight = 17
          FixedCols = 0
          RowCount = 10
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ScrollBars = ssVertical
          TabOrder = 0
          OnDrawCell = StringGrid1DrawCell
          OnSelectCell = StringGrid1SelectCell
          ColWidths = (
            134
            324)
        end
      end
      object Button16: TButton
        Left = 101
        Top = 288
        Width = 121
        Height = 25
        Caption = 'Ajouter une variable'
        TabOrder = 1
        OnClick = Button16Click
      end
      object Button17: TButton
        Left = 261
        Top = 288
        Width = 121
        Height = 25
        Caption = 'Supprimer une variable'
        TabOrder = 2
        OnClick = Button17Click
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Impression'
      object Label44: TLabel
        Left = 24
        Top = 16
        Width = 34
        Height = 13
        Caption = 'Unit'#233' : '
      end
      object Label45: TLabel
        Left = 24
        Top = 48
        Width = 44
        Height = 13
        Caption = 'Gauche :'
      end
      object Label46: TLabel
        Left = 24
        Top = 72
        Width = 28
        Height = 13
        Caption = 'Droite'
      end
      object Label47: TLabel
        Left = 24
        Top = 96
        Width = 23
        Height = 13
        Caption = 'Haut'
      end
      object Label48: TLabel
        Left = 24
        Top = 120
        Width = 18
        Height = 13
        Caption = 'Bas'
      end
      object Label49: TLabel
        Left = 24
        Top = 152
        Width = 40
        Height = 13
        Caption = 'Gouti'#232're'
      end
      object Label50: TLabel
        Left = 24
        Top = 176
        Width = 34
        Height = 13
        Caption = 'En-t'#234'te'
      end
      object Label51: TLabel
        Left = 24
        Top = 200
        Width = 69
        Height = 13
        Caption = 'Pied de page :'
      end
      object Image1: TImage
        Left = 232
        Top = 16
        Width = 230
        Height = 298
        AutoSize = True
        Center = True
        Picture.Data = {
          0A544A504547496D616765D12E0000FFD8FFE000104A46494600010101012C01
          2C0000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC0001108012A00E603012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          28A2800A28A2800A28AF1FF055A5D68BA3E9D7167A64105FDADA5B8BC8A2F0B4
          F6B3BC5BA359D5E77CF9CCAA59F6C6033BA29008CAB007B0515E4FA56A9F1166
          8E6B5D5FCFB4BE96587CD16F6BE67D995EEE253E4B79061DA21772774B33700F
          CBB5C575935C6BF2F83C2A49770EA43535B3F3D2DD4CA6017A22336D652B9308
          DE5B6EDE4B00063001D6515E7E359F14DBCCB05C457CDE6DDDB5ADB48B605F7A
          C77F2473C92154C26EB61136E6DAA724A639C737AE0F1C4BE03D4DE4BAD6750B
          89F42B32D62F61161E6B9324770988E257CC6BB580072A71BB238A00F64A2BCC
          F52D6BC656F650C9A70BB9ECC5C4BE4DE5E58C8B3CC0244504D0C76ECE10B9B8
          5388A225634C3A920C86AB7FE37B1885E5B4F772A4D7B7A3CB9AD0B2C0239D96
          DD36436F24AD13C7966240276AE244CE1C03D328AE1F4B3AA5CFC4813DFADF7E
          E2D2FE2F2DAD76DB4286E20F27CB97661DA48D03B0DED8208C260A8EE2800A28
          AE0F51B6B9FED4D574E16776D3DF6BB617F03ADBBB44608BEC9E6334A06C423C
          897E5660C70300EE5C8077945797FF006A78E6DBC3D6A1BEDD7134B696375777
          32DA849ADDA549BCD8D16381F3B5E3846DF25D944ADBB030C9635ED53C7A9A75
          B0D2E0F324BA8ACEE679A2B72BF67501BED4B1874665C6212AAF1BC87CD930AC
          576A007A4515E77A6EA5E2F9A4B7BB9E4BB68E24B2436EB64CB1CFE6DE4B14AC
          FE642926F48446E7688D41F9B6EC201D8D5EE35F87C50F25949766C204D3D56D
          96DD5A298CD732473B336DDF948F63FCAC02E01604120807594579BD96A3E2ED
          52FB4AD3A5B8D56C76C5690EA5729A7A2EDB810DDB4E55A488A329912DC6E5CA
          72369F9B9CF797C4B25BF86DB57B9D73F77F64BF9EF60D31649EDE596D6ED258
          C2242576AB08860A165F3793CAE003D628AF2FBFD73E204525C892CFECD71FD9
          4EF1C36F6F24C866FB217CA6D89D3CC1700A00F360AAE3CB2595DA4D52FF00C6
          FA5F881AC209EEEEAC43A27DA9ED0CB235B101A5994456FE589D099028670088
          D4792ECCA5C03D328AE6FC0B14D0F85944FF006B2EF7B7B206BB80C32BAB5D4A
          CAEC8557696521B1B475E82BA4A0028A28A0028A28A0028A28A0028A28A0028A
          28A002B9BF186B77BA2C3A58B168D1EF2F7ECEEED632DE155F265932B144C1D8
          E630383C0249E95D2557B8B1B7BB9ED269E3DF25A4A6680EE23639468C9E3AFC
          AEC39F5F5C50071F0FC4582C134BB6F11D8CF617D73A7ADE4ED98B6C78B769A4
          3E4F98670ABE5C8BCA7DE5C64F1992F3E2668DA5075D5ADAEF4D9E3B8686582E
          9E00C81638A467044855C059A3F950B487276A1C1C6A5FF83346D42FAE6FA58A
          717571BCB37DA1DE30ED0980BF92E4C45BCB3B7E64391D41AA7A57812CED2CA4
          4BEBABBB9BC96E1AE1EEA0BBB885C12888555FCD6976158A3CAB48C095078014
          2807594514500145145001451450014514500737E30D6EF745874B162D1A3DE5
          EFD9DDDAC65BC2ABE4CB265628983B1CC6070780493D2B2E1F88B05826976DE2
          3B19EC2FAE74F5BC9DB316D8F16ED3487C9F30CE157CB91794FBCB8C9E33D85C
          58DBDDCF6934F1EF92D2533407711B1CA3464F1D7E5761CFAFAE2B1EFF00C19A
          36A17D737D2C538BAB8DE59BED0EF187684C05FC972622DE59DBF321C8EA0D00
          65DE7C4CD1B4A0EBAB5B5DE9B3C770D0CB05D3C01902C7148CE0890AB80B347F
          2A1690E4ED43838ED2B93D2BC09676965225F5D5DDCDE4B70D70F7505DDC42E0
          94442AAFE6B4BB0AC51E55A4604A83C00A17ACA0028A28A0028A28A0028A28A0
          028A28A0028A28A002B9BBCBCD7AEBC5577A5E9779A6DA416B656F70CD7564F3
          B3B4AF32E06D990000423B1EA6BA4AE7ECFF00E4A1EB3FF60AB0FF00D1B77400
          7D8FC61FF41DD0FF00F04D37FF002551F63F187FD07743FF00C134DFFC955D05
          1401CFFD8FC61FF41DD0FF00F04D37FF002551F63F187FD07743FF00C134DFFC
          955D0561F89B58D4B45B5B7B8B0D3AD2F124B88ADDC4F78D015696548908C46F
          91B9F27A600E33D28023FB1F8C3FE83BA1FF00E09A6FFE4AA3EC7E30FF00A0EE
          87FF008269BFF92AA49FC55A669C258F54B98EDEE2DADCCD742359248A3658FC
          C74126C019C202FB38729F36DC56869BAA5A6AD6ED35A3C842394912589E2923
          6C0387470194E08201032181E841A00CBFB1F8C3FE83BA1FFE09A6FF00E4AA3E
          C7E30FFA0EE87FF8269BFF0092ABA0A280395BA6F175A5CD8C2757D11CDE4E61
          0C349946C22379338FB49CFF00AB231C75CE78C1B5F63F187FD07743FF00C134
          DFFC9556B57FF909E81FF5FEDFFA4D3D6B54C5EACDAA4528C1AEABF5679FF857
          5BF18789BFB6FF00E263A1DB7F666AB3E9BFF20B99FCDF2F6FCFFF001F2319DD
          D39C63A9AD5D49BC61A7DAA4DFDB3A1C9BA7861C7F644C31E64AB1E7FE3E7B6E
          CFBE2B2BE167FCCEBFF635DF7FEC95D5788FFE4190FF00D7FD9FFE94C5449DA2
          DA1508A9D58C65B36BF32AFD8FC61FF41DD0FF00F04D37FF002551F63F187FD0
          7743FF00C134DFFC955D051546473FF63F187FD07743FF00C134DFFC9547D8FC
          61FF0041DD0FFF0004D37FF2557415C7DC6BDAC69BE26D420BDBAB1974DB58AD
          E58E182C5C4F335C4B2C51441DA6DA1B7A20DC4053BB9D806400687D8FC61FF4
          1DD0FF00F04D37FF002551F63F187FD07743FF00C134DFFC9555E1F1D584D7F1
          DB0B2BE55FDD2DC4ECB1ECB69649E4B7589F0FB8B79D13265032F43BB6FCD5D4
          50073FF63F187FD07743FF00C134DFFC9547D8FC61FF0041DD0FFF0004D37FF2
          55741450073FF63F187FD07743FF00C134DFFC95527876FF0052BA9758B4D525
          B49A7D3EF45BACB6B0342AEA60865C9567720E6523AF615B95CFF87BFE439E2C
          FF00B0AC7FFA456B401D0514514005145140051451400573F67FF250F59FFB05
          587FE8DBBAE82B9FB3FF009287ACFF00D82AC3FF0046DDD007414514500154F5
          3D361D56D52DE7691512E20B80508077452ACAA39078DC801F6CF4EB58F178AE
          E6E8CED65E17D66EE08AE26B7F3E392D155DA291A36203CEAD8DC87A81527FC2
          43AA7FD099AE7FDFEB2FFE48A00A7E25F0543ACDA6AED6F3C8B737B6F318E191
          C0805D3DB9B7131214BE7CB3B3192B8E76EEE6B7349D2534A8A7FF00499EEAE2
          E65F3AE2E67DBBE57DAA80908AAA30888BF2A8FBB93924939FFF00090EA9FF00
          4266B9FF007FACBFF9228FF848754FFA1335CFFBFD65FF00C91401D0515CBDFF
          008BEEF4CD3AE6FEF3C23AE476B6B13CD33F996676A28258E05C64E003D2BA8A
          00C9D5FF00E427A07FD7FB7FE934F5AD593ABFFC84F40FFAFF006FFD269EB5AA
          63BBFEBA237ADF053F4FFDB99E7FF0B3FE675FFB1AEFBFF64AEABC47FF0020C8
          7FEBFECFFF004A62AE57E167FCCEBFF635DF7FEC95D5788FFE4190FF00D7FD9F
          FE94C544FE16185FE3C3D57E66B514565EB5AD0D18592AD85DDF4F7B71F67860
          B531862DE5BC849323AA801636EFE954606A567DDE89A75F4B752DC5BEF92EA2
          8A195C3B03B636678CA907E56567660CB860707390319FFF00090EA9FF004266
          B9FF007FACBFF9228FF848754FFA1335CFFBFD65FF00C914011DBF82B4C835E1
          A901234696F0C515B1964D9BE392593CD906EC4AE5A5DDB9C1219776771CD749
          5CFF00FC243AA7FD099AE7FDFEB2FF00E48A3FE121D53FE84CD73FEFF597FF00
          245007414561D8788A4BAD663D2EEF44D4B4E9E5B792E226BA68195D6368D580
          F2A5720E654EA077ADCA002B9FF0F7FC873C59FF006158FF00F48AD6BA0AE7FC
          3DFF0021CF167FD8563FFD22B5A00E828A28A0028A28A0028A28A002B9FB3FF9
          287ACFFD82AC3FF46DDD7415CFD9FF00C943D67FEC1561FF00A36EE803A0A28A
          28039FF06FFC80EE7FEC2BA97FE96CD5D0573FE0DFF901DCFF00D85752FF00D2
          D9ABA0A0028A28A00E7FC77FF24F3C4BFF0060ABAFFD14D5D0573FE3BFF9279E
          25FF00B055D7FE8A6AE828032757FF00909E81FF005FEDFF00A4D3D6B564EAFF
          00F213D03FEBFDBFF49A7AD6A98EEFFAE88DEB7C14FD3FF6E679FF00C2CFF99D
          7FEC6BBEFF00D92BAAF11FFC8321FF00AFFB3FFD298AB95F859FF33AFF00D8D7
          7DFF00B25755E23FF90643FF005FF67FFA531513F858617F8F0F55F99AD5CFF8
          87FE439E13FF00B0AC9FFA45755D0573FE21FF0090E784FF00EC2B27FE915D55
          181D05145140051451401CFDE7FC943D1BFEC157FF00FA36D2BA0AE7EF3FE4A1
          E8DFF60ABFFF00D1B695D050015CFF0087BFE439E2CFFB0AC7FF00A456B5D057
          3FE1EFF90E78B3FEC2B1FF00E915AD007414514500145145001451450015CFD9
          FF00C943D67FEC1561FF00A36EEBA0AE7ECFFE4A1EB3FF0060AB0FFD1B77401D
          0515E6FE37D796D3C5B656F63E32834EBA8ED2613D9CDA85BDBC29F344433B3C
          5291210C36A94E54310CB860FDC684BB7C3DA62FDA7ED58B4887DA3ED1F68F37
          E41F3F9B81E667AEEC0CE73819A00CFF0006FF00C80EE7FEC2BA97FE96CD5D05
          73FE0DFF00901DCFFD85752FFD2D9ABA0A0028A28A00E7FC77FF0024F3C4BFF6
          0ABAFF00D14D5D0573FE3BFF009279E25FFB055D7FE8A6ACFF001978B753F0E6
          A7A3DB58E91F6B8EF2564791D6660711C8DB57C98E460C360272BD3A061BDA30
          0DAD5FFE427A07FD7FB7FE934F5A51CF0CCF32452C6EF0BEC95558128DB4361B
          D0ED65383D883DEB99B5BEBDD4ADFC3579A8431C37126A53931A472A05510DC8
          5189511F3B42E4955C9C90304560EA906A317C4AFF0043D26F963B996199A58A
          7BC10CA55AD95A472920807EE44EBE5B2E49B7527709154CC777FD7446F5BE0A
          7E9FFB732C7C2CFF0099D7FEC6BBEFFD92BA2D52FADF53F0DE9F7F6727996B75
          7561342FB48DC8D71115383C8C823AD73BF0B3FE675FFB1AEFBFF64AE7741D26
          E6C6F52E26D3F46B38E79E07864B286D13ED71B5C589060310DE605712905F07
          6CB0EEDCDF749FC2C30BFC787AAFCCF62AE7FC43FF0021CF09FF00D8564FFD22
          BAACBF117C416F0EF8962D1DBC2BE20BF125BB4EB3E9F6CB30700A0F9406C900
          B10D9DA54EDE08706AC5DDE4DA83F816F6E2D24B39EE2F7CD92DA4CEE859AC2E
          4943900E4138E83A741546075945145001451450073F79FF00250F46FF00B055
          FF00FE8DB4AE82B9FBCFF9287A37FD82AFFF00F46DA572FE37D796D3C5B656F6
          3E32834EBA8ED2613D9CDA85BDBC29F344433B3C5291210C36A94E54310CB860
          E01E915CFF0087BFE439E2CFFB0AC7FF00A456B5A1A12EDF0F698BF69FB562D2
          21F68FB47DA3CDF907CFE6E07999EBBB0339CE066B3FC3DFF21CF167FD8563FF
          00D22B5A00E828A28A0028A28A0028A28A002B9FB3FF009287ACFF00D82AC3FF
          0046DDD7415CFD9FFC943D67FEC1561FFA36EE8039BF1F6B7636DAA5BA35F5D9
          96CADE792E2C22B8BEB50623E537DA1A4B6463B13054123612EFF302845741E0
          5B6B9B7F0ADAB4FABC9AA453A24D6D7121766688A2E1897F9C9721A4C37DCF33
          602420273F54F05EA579AEB5FDBEABA6AC1FDA69AA476F77A634FB665B616E32
          C2650400378E010C01CF15D840265B7896E248E49C20123C685159B1C90A4920
          67B64E3D4D0061F837FE40773FF615D4BFF4B66AE82B9FF06FFC80EE7FEC2BA9
          7FE96CD5D05001451450073FE3BFF9279E25FF00B055D7FE8A6A3C65A56B1ACF
          87A6B4D12FFEC776D9C379CF0EECA305FDE202C9B5CA49C0F9BCBD87E56268F1
          DFFC93CF12FF00D82AEBFF0045355CD4BC35A0EB370B71AA689A6DF4EA81164B
          AB549582E49C02C09C64938F7340183A54F35CDAE8525C4B2493FF006E5F2C9B
          D8B6C61F6B05158F25148DAA7032AAA76AFDD1C8EA7E1ED62C3C6577797BF6EF
          EC9B9F1059DCC73C2EEF1B664B708AC8D7831F38084985B00657002AA7A15D58
          59E9971E1CB3B0B482D2D63BF7D90C1188D1736F393851C0C924FE35C6D95BDC
          4DE21D37587B49CF894F911DDC2FA008E3572E56E4FDACC432A913158F6CBC88
          97997760CC777FD7446F5BE0A7E9FF00B732C7C3AB34D434EF1F594A711DC789
          751898EC57C06080FCAE0A9EBD18107B822B91F07E8F6BA65F58ADBCFA55FC90
          C36D0CB77A45DC1346A7ED969C4BE5DB46C19F692BBDDCE11FA9C9AE8BC1B0DF
          5C689E3B8F4E3279E7C5B74596293CB79220F119511B236BB461D55B2B8241DC
          BF786935AEA6977F6A6B6D66D2CE5BC85EE23D56F639CC92BDEC2D1F94A923AC
          688BE6AE06CC864CEF23209FC2C30BFC787AAFCCDEF16699AF6A074E9744BC8E
          336D7092CB6F25CBDBACBB6446E5D15891B5648F61054F9BB8F28A0E5DA4DF68
          D27E1BCFF699EEBCC9637F3EE0624973A75C1DCE32DF31EA793C9EA7AD7417DE
          13F0DEA77925E5FF0087F4ABBBA931BE69ECA391DB00019623270001F8553D6A
          086D753F075BDBC51C3045A9B2471C6A15514595C80001C000718AA303A4A28A
          2800A28A28039FBCFF009287A37FD82AFF00FF0046DA5737E3ED6EC6DB54B746
          BEBB32D95BCF25C5845717D6A0C47CA6FB43496C8C76260A8246C25DFE60508A
          E92F3FE4A1E8DFF60ABFFF00D1B69597AA782F52BCD75AFEDF55D3560FED34D5
          23B7BBD31A7DB32DB0B719613282001BC7008600E78A00D0F02DB5CDBF856D5A
          7D5E4D5229D126B6B890BB33445170C4BFCE4B90D261BEE799B01210132787BF
          E439E2CFFB0AC7FF00A456B5B900996DE25B892392708048F1A14566C7242924
          819ED938F53587E1EFF90E78B3FEC2B1FF00E915AD0074145145001451450014
          51450015CFD9FF00C943D67FEC1561FF00A36EEBA0AE7ECFFE4A1EB3FF0060AB
          0FFD1B77401D051451401CFF00837FE40773FF00615D4BFF004B66AE82B9FF00
          06FF00C80EE7FEC2BA97FE96CD5D05001451450073FE3BFF009279E25FFB055D
          7FE8A6AE82B9FF001DFF00C93CF12FFD82AEBFF453574140193ABFFC84F40FFA
          FF006FFD269EB5AB2757FF00909E81FF005FEDFF00A4D3D6B54C777FD7446F5B
          E0A7E9FF00B733CFFE167FCCEBFF00635DF7FEC95D5788FF00E4190FFD7FD9FF
          00E94C55CAFC2CFF0099D7FEC6BBEFFD92BAAF11FF00C8321FFAFF00B3FF00D2
          98A89FC2C30BFC787AAFCCD6AE7FC43FF21CF09FFD8564FF00D22BAAE82B9FF1
          0FFC873C27FF0061593FF48AEAA8C0E828A28A0028A28A00E7EF3FE4A1E8DFF6
          0ABFFF00D1B695D0573F79FF00250F46FF00B055FF00FE8DB4AE82800AE7FC3D
          FF0021CF167FD8563FFD22B5AE82B9FF000F7FC873C59FF6158FFF0048AD6803
          A0A28A2800A28A2800A28A2800AE7ECFFE4A1EB3FF0060AB0FFD1B775D0573F6
          7FF250F59FFB05587FE8DBBA00E828A28A00E7FC1BFF00203B9FFB0AEA5FFA5B
          357415CF9F06691E6CD246FAAC3E74AF33A41AC5DC49BDD8BB108B2851966278
          03AD1FF086E97FF3F5AE7FE0F6F7FF008F5007414573FF00F086E97FF3F5AE7F
          E0F6F7FF008F51FF00086E97FF003F5AE7FE0F6F7FF8F5001E3BFF009279E25F
          FB055D7FE8A6AE82B9B9FC0DA2DD5BCB6F712EB33412A14923935BBD65752304
          1065C104718AE928032757FF00909E81FF005FEDFF00A4D3D6B564EAFF00F213
          D03FEBFDBFF49A7AD6A98EEFFAE88DEB7C14FD3FF6E679FF00C2CFF99D7FEC6B
          BEFF00D92BAAF11FFC8321FF00AFFB3FFD298AB95F859FF33AFF00D8D77DFF00
          B25755E23FF90643FF005FF67FFA531513F858617F8F0F55F99AD5CFF887FE43
          9E13FF00B0AC9FFA45755D0567EADA2D96B71411DEACFF00E8F2F9D0BC173240
          E8FB59321E3656FBAEC3AF7AA303428AE7FF00E10DD2FF00E7EB5CFF00C1EDEF
          FF001EA3FE10DD2FFE7EB5CFFC1EDEFF00F1EA00E828AE7FFE10DD2FFE7EB5CF
          FC1EDEFF00F1EA3FE10DD2FF00E7EB5CFF00C1EDEFFF001EA002F3FE4A1E8DFF
          0060ABFF00FD1B695D0563E9FE18D374CD445FC06FA4BA589A157BBD42E2E76A
          3152C0095D80C945E9E82B62800AE7FC3DFF0021CF167FD8563FFD22B5AE82B9
          FF000F7FC873C59FF6158FFF0048AD6803A0A28A2800A28A2800A28A2800AE7E
          CFFE4A1EB3FF0060AB0FFD1B775D0573F67FF250F59FFB05587FE8DBBA00E828
          A28A00C7F165F5C699E0DD72FECE4F2EEAD74FB89A17DA0ED758D8A9C1E0E081
          D6B93B4F1C6A1A6C3A9DBEA163773CBA6BCF3CA6F648639C5AC30DBCB213E483
          1BCB9B901146D52A06E652093E813C10DD5BCB6F711473412A1492391432BA91
          82083C104718AA69A168F1D9DAD9C7A558A5ADA4A27B6856DD024320248745C6
          15B249C8E793401C5E91E3BD7A6B9D51753D2B4D54B678E0805B5D392D3497D3
          5A4618B27DCDD18CB019006E0A776C4B1378FB52691D2CB43B494C0F04173E76
          A0D1ED9A5BC96D309885B7209222771DA4A9076E78AEA13C35A0C77177709A26
          9AB3DEA3A5D48B6A81A7573970E71960C7920E73DEAC2693A6C68889A7DA2A22
          448AA215015626DD101C70118E547F09E4628023D1753FED7D305D187C991659
          6DE58C36E0B2452346FB5B032BB91B048048C1201E0685470C10DB2148228E24
          2ECE5514282CCC598F1DCB1249EE4935250064EAFF00F213D03FEBFDBFF49A7A
          D6AC9D5FFE427A07FD7FB7FE934F5AD531DDFF005D11BD6F829FA7FEDCCF3FF8
          59FF0033AFFD8D77DFFB25755E23FF0090643FF5FF0067FF00A531572BF0B3FE
          675FFB1AEFBFF64AEABC47FF0020C87FEBFECFFF004A62A27F0B0C2FF1E1EABF
          335A8A28AA303CDFC4DA9DFDBFC4CB5B6B2BAFDE18B4E31DBFF68488C51EEA55
          9D92D802937EE81DCCD8F2D5430391C571E34F106A17DA34706A1A569F1DD5DC
          714ED2DA348B0CB2C33B0B39332AFEFA36894360A3334B1FCA80157F50A2803C
          8F4BF893AD1F092DF3CDA6DFDDC7A63CCC89110EC56D0CFF006960AF8F284A3E
          CCC0003CC0D8653FBB1D469BAFEBD17891B4FD526D36E60FED33A6A9B5B47818
          37D8C5D7984B4AE08C6536E3B86DDC6D3DA5140051451400573FE1EFF90E78B3
          FEC2B1FF00E915AD7415CFF87BFE439E2CFF00B0AC7FFA456B401D0514514005
          145140051451400573F7BA36B1FF00090CFAB693AA58DB7DA2D21B6922BBB079
          FF00D5BCAC181599319F348C107A0AE828A00E7FEC7E30FF00A0EE87FF008269
          BFF92A8FB1F8C3FE83BA1FFE09A6FF00E4AADC9C4CD6F2ADBC91C73942237910
          BAAB6382541048CF6C8CFA8AE6F42D6AE069C4CED7DA9ACD2CE74E985B0F32E6
          28C7DE774558577B0631B128AE86339C96A00B1F63F187FD07743FFC134DFF00
          C9547D8FC61FF41DD0FF00F04D37FF0025573FA778F2FEF7589EC069D07DBE4F
          B3C505A9BB91234765B990F9BBEDD2589B6404E0A36418C80031635F45F896FF
          00D8F6D2DFE9B7D74B6DA547737F7B0C0D8F37EC8B72C78411052AC00FDE06DE
          C06C0A77500751F63F187FD07743FF00C134DFFC9547D8FC61FF0041DD0FFF00
          04D37FF25567DB789354B3D1FC61A96AD6D034DA3CAEF1DAC13EE4089690CBB0
          48635272598E4AF1BB1C802B3F5BF1D6A9696BA8DA45A4C0B7F63697935E325F
          E16210C50499859A06DEC56E508DE8A032907239201D07D8FC61FF0041DD0FFF
          0004D37FF2551F63F187FD07743FFC134DFF00C955CFEA3E3DD622291D9E8D63
          E64DA83DB5B34D7AF878E2BD4B4919C08FE462D2A6D0370C1627950AF1E99F12
          593458F50D434E90D825BA033ADC2C97124BF605BD6DC823440366E1B8119603
          E5507800DCB9D1FC57753D9CCFAF68A1AD6633205D1E5C1251D39FF49E9873F8
          E2AC7D8FC61FF41DD0FF00F04D37FF00255571E29BCB7D03C4B7F7FA6411DD68
          5E66F820BB3224BB6DD2718731A9191201F778C77AE6FC43F126FAD6DEF0E9DA
          7462E2CDEE08F36E3F77208C6A0A778F2C923FD0778552A496037000962C3726
          D24FA1A9A07843C49E1CFED4FB1F8874A7FED2D425D426F3B4890ED924C6E0B8
          B9185E0601C9F7AD1BBD1FC557D0AC33EBBA36C5963986CD22507723875EB727
          8DCA33ED9E475AADA5F893541E27BCD3F54B683ECF2EA09676ED0CFBCC32FD86
          3B864C18D7747C4A4393B89206D03914EE3C7DA95B4D712BE876874F813509DA
          51A8379A61B398452911F938DE73955DF83DD8526AEACC71938494A3BA373EC7
          E30FFA0EE87FF8269BFF0092A8FB1F8C3FE83BA1FF00E09A6FFE4AAE7CF8EB54
          49AEA1B3D260BB5B7BB585E4BBBFF29B32DFCF6918012020A83103CF2148FBC4
          126C4BE3DBC8A3553A3406E2794DBDB27DB4EC6912EE2B49B7B797955124A0A9
          018B2824843F2D324D8FB1F8C3FE83BA1FFE09A6FF00E4AA3EC7E30FFA0EE87F
          F8269BFF0092AB1EDFE204F2BDDC726853AB4528B58E55F37C86B8FB42DB1469
          5A255DBE6BF0537928AC4AAB0D86C59F8935483C18DA9DD5B4173A91D564B110
          79FB2305AFDADD079823CED5057E6D992172464D00687D8FC61FF41DD0FF00F0
          4D37FF002551F63F187FD07743FF00C134DFFC955CFB7C42D4E258A39F44B14B
          AB896EA3B7892FE694CBF6697CA97012D8B96DC5595551B281D98AEDC1934BF1
          F6A5AC476AF69A1DA0178F0C16FE6EA0CB999ECD2EC87C4276A08D9C061B8965
          03680C4A806E7D8FC61FF41DD0FF00F04D37FF002551F63F187FD07743FF00C1
          34DFFC955CBD9FC4AB89ADE4BD1A5EFB7168DA95C2C976018204B5B399D62022
          F9DBFD24E031192A7E60080BD6586B97377E25BCD2E7B18ED63810B44D2CAE25
          9802A372AF97B193E60494918AEE40C159B68008FEC7E30FFA0EE87FF8269BFF
          0092AAC683A4DE698DA9CF7F7B05DDD5FDD8B97682D8C08B88A3882852EE7A44
          0E73DEB628A0028A28A0028A28A0028A28A0028A28A008E7821BAB796DEE228E
          6825429247228657523041078208E3154ED742D1EC74E9F4EB3D2AC6DEC67DDE
          75B436E891C9B86D6DCA060E4000E7A8AD0A28032C786B415B07B05D134D166E
          8A8F6E2D53CB65572EA0AE3040666603B1627A9A91342D1E3BCB5BC8F4AB14BA
          B488416D32DBA07863008088D8CAAE09181C726B428A00C793C2FA3FFC23DA86
          876763069F637F14914C9631245F7D3633000637631C907A0AB11685A3C166B6
          71695631DAAC5240B0A5BA0411C8419102E31B588048E871CD68514019F73A16
          8F79034175A558CF0B6FCC72DBA329DEE247E08FE275563EAC013C8A3FB0F4B5
          B5FB3C56104118E57ECE9E53467CAF28323260A308FE40CA410BC02056851401
          8FE1BF0D58785F4E92CF4F5C2CB299A57F2E38F7B90173B235545F95547CAA3A
          64E4924D8FEC2D1FECBF65FECAB1FB3FFCF2FB3A6CFF0055E574C63FD5FC9FEE
          FCBD38AD0A28029C1A4E9B6A2216FA7DA422270F188E155D8C23F281181C111F
          C99FEEF1D38A1F49D3644747D3ED191D2546530A90CB2B6E941E390EC32C3F88
          F2735728A00A6349D354B95D3ED01775772215F9996432A93C72448CCE0F6662
          7A9CD0749D34DC5C5C1D3ED3CFB8789E793C95DD2B46418CB1C6495201527A63
          8C55CA28033DF42D1E4BCBABC934AB17BABB88C173335BA179A320028ED8CB2E
          00183C702A48349D36D6C22B0B7D3ED21B389C3C76F1C2AB1A307DE085030086
          F9B3EBCF5AB9450065DEF86B41D49234BFD134DBA48DE47459ED51C2B3B6E723
          2382CDC93DCF26ABEA9E13D2B52D19B4B5B78ECEDD9D1CADB431ED251422EE8D
          D5A370155540756036A9182AA46E51401976BE1BD16CEC96CE1D2ED040B6FF00
          65DAF1072D16C4428C5B258158E353927211739C0AB167A4E9BA7DC5D5C5969F
          696D3DDBEFB99218551A66C939720658E589C9F53EB5728A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          002B9BBCBCD7AEBC5577A5E9779A6DA416B656F70CD7564F3B3B4AF32E06D990
          000423B1EA6BA4AE7ECFFE4A1EB3FF0060AB0FFD1B774007D8FC61FF0041DD0F
          FF0004D37FF2551F63F187FD07743FFC134DFF00C955D051401CFF00D8FC61FF
          0041DD0FFF0004D37FF2551F63F187FD07743FFC134DFF00C955D051401CFF00
          D8FC61FF0041DD0FFF0004D37FF2551F63F187FD07743FFC134DFF00C955D051
          401CFF00D8FC61FF0041DD0FFF0004D37FF2551F63F187FD07743FFC134DFF00
          C955D051401CFF00D8FC61FF0041DD0FFF0004D37FF2551F63F187FD07743FFC
          134DFF00C955D051401CFF00D8FC61FF0041DD0FFF0004D37FF2551F63F187FD
          07743FFC134DFF00C955D051401CFF00D8FC61FF0041DD0FFF0004D37FF2551F
          63F187FD07743FFC134DFF00C955D051401CFF00D8FC61FF0041DD0FFF0004D3
          7FF25573FE1FF11EBFE23D635FD36CF5FD0CCDA35D8B697FE24B3FCD95FBDCDC
          0C7CE254C027FD5E7A30AEE2FE6B8B7D3AE66B3B5FB5DD4713BC36FE608FCD70
          0954DC785C9C0C9E99AF07F835E1DF1B681F103539B56D3E77B59B75BEA52BDF
          46DB272AB3ABB00C4C8D870323A79A79EA2803D83EC7E30FFA0EE87FF8269BFF
          0092A8FB1F8C3FE83BA1FF00E09A6FFE4AAD0BCD6F4EB0FED0FB4DC797FD9F68
          2F6EBE463E5C277E1B81CFFAA7E064FCBD3919D0A00E7FEC7E30FF00A0EE87FF
          008269BFF92A8FB1F8C3FE83BA1FFE09A6FF00E4AAD8B8BEB7B49ED219E4D925
          DCA61806D277B846908E3A7CA8C79F4F5C558A00E7FEC7E30FFA0EE87FF8269B
          FF0092AA4F0EDFEA5752EB169AA4B6934FA7DE8B7596D606855D4C10CB92ACEE
          41CCA475EC2B72B9FF000F7FC873C59FF6158FFF0048AD6803A0A28A2800A28A
          2800A28A2800AE7ECFFE4A1EB3FF0060AB0FFD1B775D0573F67FF250F59FFB05
          587FE8DBBA00E828A28A0028A28A002B9FD67C4A345F10E9B653C33C96B75697
          32B1B6B39AE240F1BC217E588310B891B248EA1791DFA0AAEF636F26A30DFB47
          9BA8629218DF71F951CA1618E9C98D3F2F73401C7E85F122C3534D32C655F335
          ABAD3E2B86B7B768C6E99ADC4E624577DC328721D8797FC25F77155EEBE28DAC
          FE19D52FF47B09EE2FAD22B96484C904A8043146ED2B3C729468D4CD10215CBF
          CC405E0E3A0FF842B4116BF654B59E3B5369F637822BC9923922F2BCAF9D0380
          EDB30BBD816C2AF3F28C472F80FC3D3594F692DB5DC8970EED348FA85C1964DE
          8A8CAD2EFDE50AC680A13B4EC5E3814014E5F891A22DFDFD8DBACF7777692AC2
          2081A22F2B99D206014B829B649157F79B339CAEE519A92EFC7316997BA8C7A9
          E9377656D63656D74D7134D0E0BCEEC8B11C3E14EE5DBB89DB90C49550ACDA8D
          E17D25AEA49CC33FEF2549DA1177288448B2ACA1C441B62B79881890A0925B39
          DCD992F3C3DA65FDECF7973048D3CF6E96CEC2791414472E8400C007562595C0
          0CA4F04500737A97C50D1ECB438F51B7827BA92E6D27B8B385193170D06EF3D0
          480951E5EC24B72AC0FEECC878AED2091A6B78A5786481DD033452152C848FBA
          7692323A7048F426B0EF3C15A0EA1662DAFAD67BA511342B25C5E4D24A88C497
          0B233975DC18AB608DCB85395000DC8215B6B78A0432148D0229924676200C72
          CC4963EE4927BD0049451450015CFF0087BFE439E2CFFB0AC7FF00A456B5A1AE
          68D67E21D0EF748BF4DF6B771344F80095CF465C820303820E38201AF9D3E04F
          84AEC7C4DBFB8BE86489F404923942C8842DC3168B6375DC36F9A72BC65473D8
          807B3F8A7C132F88AE35D9C5C491BDE68E9636A12F668544A0DC126558C80E9F
          BD4E183746E39E79FD5BE1D6B973ACDF5C20D375082EAE24959AFA58B3B598B2
          611AD241BE30446AD234988CB8509BFE5F54A2803CBE1F871AC470E970FDA6C6
          3B8B6B458BFB551DFED3698B06B5F2A11B4131890F9C0EF4E58FCA0F2743C37E
          0196C751D3EE355B5B1961B1FB4BC10974996091CDB1468956DE148F061909DA
          A0EE72D9258E3D028A002B9FF0F7FC873C59FF006158FF00F48AD6BA0AE7FC3D
          FF0021CF167FD8563FFD22B5A00E828A28A0028A28A0028A28A002B9FB3FF928
          7ACFFD82AC3FF46DDD7415CFD9FF00C943D67FEC1561FF00A36EE803A0A28A28
          00ACBD4A0D7A5B856D2F52D36DA0D80325D69EF3B16C9E432CC800C638C763CF
          3C6A51401CFF00D8FC61FF0041DD0FFF0004D37FF2551F63F187FD07743FFC13
          4DFF00C955D051401CFF00D8FC61FF0041DD0FFF0004D37FF2551F63F187FD07
          743FFC134DFF00C955D051401CFF00D8FC61FF0041DD0FFF0004D37FF2551F63
          F187FD07743FFC134DFF00C955D051401CFF00D8FC61FF0041DD0FFF0004D37F
          F2551F63F187FD07743FFC134DFF00C955D051401CFF00D8FC61FF0041DD0FFF
          0004D37FF2551F63F187FD07743FFC134DFF00C955D051401CFF00D8FC61FF00
          41DD0FFF0004D37FF25565E97E13D7B46BFD56F6CB54F0FC53EA9702E2E59743
          75CB040B8E2E41C6416E73F33B9EF5DA51401CFF00D8FC61FF0041DD0FFF0004
          D37FF2556C58A5E47671ADFCF04F7433BE482131237271852CC4718FE23EBC74
          AB145001451450015CFF0087BFE439E2CFFB0AC7FF00A456B5D0573FE1EFF90E
          78B3FEC2B1FF00E915AD007414514500145145001451450015CFD9FF00C943D6
          7FEC1561FF00A36EEBA0AE7ECFFE4A1EB3FF0060AB0FFD1B77401D0514514005
          799F88756F10C5AFCDF62D5B525B71AEC7A7B5ADA436EC52DFEC2B71248BBA17
          76707736DE4B01B54648AF4CAE5F46B1B7BBF11F88669E3DF25A6B693407711B
          1CE9F0464F1D7E5761CFAFAE28038BD3BC5AD36977F7D3F8BFC4135BDADC5F44
          2EAD20B068A43079B22C6B98725CDBC624DD8F2CE71B81F96AE7F6DEAFF6EFB1
          7DA3C73F68FB5FD8B66CD1BFD7793E7EDCE31FEAFE6CF4ED9CF15D645E01F0BC
          16F3DB43A4C715B4E932BDBC723AC5FBD0C1D8206DAAE55D937801821DA08500
          56A7F6269DF6EFB6FD9FFD23ED7F6DDFBDBFD7793E46EC671FEAFE5C74EF8CF3
          401E67AF78AE7D3ED1C5978ABC4124F71A64B7FA74D22699E5CCA2DDE7563179
          626087CB2B9283918C8E0D6A789353BDF0C6AD6F6D7BE23F119B396D24B86BD0
          34D544659238D508684632D2A02C70A37A9276EF64E83FE15E78636797F619FC
          9F2BC9F27EDD3F97B7ECFF0066CECDFB77793F26EC6EC77CF35A9AAF87B4CD6A
          E2DEE2FE092496DD1D22649E48F6872A4FDD61921911813CAB22B2E0806803CE
          F52F17C765A1C7A8DBF8AFC477525CDA4F71670A47A7E2E1A0DDE7A090405479
          7B092DCAB03FBB321E2BB48342D5A6B78A57F16788207740CD149158164247DD
          3B602323A7048F426A4BCF05683A8598B6BEB59EE9444D0AC971793492A23125
          C2C8CE5D77062AD82372E14E54003720856DADE2810C8523408A64919D88031C
          B31258FB9249EF40187FF08F6A9FF439EB9FF7E6CBFF0091E8FF00847B54FF00
          A1CF5CFF00BF365FFC8F5D051401CFFF00C23DAA7FD0E7AE7FDF9B2FFE47A3FE
          11ED53FE873D73FEFCD97FF23D741450073FFF0008F6A9FF00439EB9FF007E6C
          BFF91E8FF847B54FFA1CF5CFFBF365FF00C8F5D051401CFF00FC23DAA7FD0E7A
          E7FDF9B2FF00E47A3C312DEFDA75EB2BDD467BFF00B0EA0B0C334E91ABEC36D0
          4983E5A2A9F9A46ED5D0573FE1EFF90E78B3FEC2B1FF00E915AD007414514500
          15CFF87BFE439E2CFF00B0AC7FFA456B5D0573FE1EFF0090E78B3FEC2B1FFE91
          5AD0074145145001451450014514500154E3D3618B59B9D515A4F3EE2DE1B775
          246D0B1B48CA4719CE656CF3D874EF728A0028A28A002A9D969B0D8DD6A37113
          485EFEE05C4A188C06114716178E9B6353CE7927E82E51400514514005145140
          051451400514514005145140051451400557B7B1B7B49EEE6823D925DCA269CE
          E277B8458C1E7A7CA8A38F4F5CD58A2800A28A2800AAF6F636F693DDCD047B24
          BB944D39DC4EF708B183CF4F951471E9EB9AB1450014514500145145007FFFD9}
        Proportional = True
        Transparent = True
      end
      object ComboBox13: TComboBox
        Left = 101
        Top = 12
        Width = 107
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        ItemIndex = 0
        TabOrder = 0
        Text = 'Millim'#232'tres'
        Items.Strings = (
          'Millim'#232'tres'
          'Centim'#232'tres'
          'Pouces')
      end
      object SpinEdit14: TSpinEdit
        Left = 101
        Top = 43
        Width = 107
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 25
      end
      object SpinEdit15: TSpinEdit
        Left = 101
        Top = 67
        Width = 107
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 15
      end
      object SpinEdit16: TSpinEdit
        Left = 101
        Top = 91
        Width = 107
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 25
      end
      object SpinEdit17: TSpinEdit
        Left = 101
        Top = 115
        Width = 107
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 25
      end
      object SpinEdit18: TSpinEdit
        Left = 101
        Top = 147
        Width = 107
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 5
        Value = 10
      end
      object SpinEdit19: TSpinEdit
        Left = 101
        Top = 171
        Width = 107
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 6
        Value = 15
      end
      object SpinEdit20: TSpinEdit
        Left = 101
        Top = 195
        Width = 107
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 7
        Value = 15
      end
      object CheckBox35: TCheckBox
        Left = 24
        Top = 236
        Width = 177
        Height = 17
        Caption = 'Utiliser le colorateur syntaxique'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object CheckBox36: TCheckBox
        Left = 24
        Top = 252
        Width = 185
        Height = 17
        Caption = 'Utiliser les num'#233'ros de ligne'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object CheckBox37: TCheckBox
        Left = 24
        Top = 268
        Width = 169
        Height = 17
        Caption = 'Num'#233'ros dans la marge'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object CheckBox38: TCheckBox
        Left = 24
        Top = 284
        Width = 185
        Height = 17
        Caption = 'Titre avec chemin complet'
        TabOrder = 11
      end
      object CheckBox39: TCheckBox
        Left = 24
        Top = 300
        Width = 161
        Height = 17
        Caption = 'Texte s'#233'lectionn'#233' seulement'
        TabOrder = 12
      end
    end
  end
  object StaticText2: TStaticText
    Left = 186
    Top = 4
    Width = 127
    Height = 17
    Alignment = taCenter
    Caption = 'Pr'#233'f'#233'rences >> G'#233'n'#233'rales'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    Transparent = False
  end
  object SynCppSyn1: TSynCppSyn
    AsmAttri.Foreground = clBlue
    CommentAttri.Foreground = clHighlight
    DirecAttri.Foreground = clGreen
    IdentifierAttri.Foreground = clBlack
    InvalidAttri.Foreground = clMaroon
    NumberAttri.Foreground = clPurple
    FloatAttri.Foreground = clPurple
    HexAttri.Foreground = clPurple
    OctalAttri.Foreground = clPurple
    StringAttri.Foreground = clRed
    CharAttri.Foreground = clRed
    SymbolAttri.Foreground = clBlack
    Left = 32
    Top = 184
  end
  object SynEiffelSyn1: TSynEiffelSyn
    Left = 24
    Top = 184
  end
  object SynHC11Syn1: TSynHC11Syn
    Left = 32
    Top = 184
  end
  object SynADSP21xxSyn1: TSynADSP21xxSyn
    Left = 40
    Top = 184
  end
  object SynAWKSyn1: TSynAWKSyn
    Left = 32
    Top = 184
  end
  object SynBaanSyn1: TSynBaanSyn
    Left = 48
    Top = 184
  end
  object SynDfmSyn1: TSynDfmSyn
    Left = 40
    Top = 184
  end
  object SynCSSyn1: TSynCSSyn
    Left = 56
    Top = 184
  end
  object SynCacheSyn1: TSynCacheSyn
    Left = 64
    Top = 184
  end
  object SynCACSyn1: TSynCACSyn
    Left = 48
    Top = 184
  end
  object SynCssSyn1: TSynCssSyn
    Left = 32
    Top = 184
  end
  object SynCPMSyn1: TSynCPMSyn
    Left = 32
    Top = 184
  end
  object SynCobolSyn1: TSynCobolSyn
    AreaAStartPos = 7
    AreaBStartPos = 11
    CodeEndPos = 71
    Left = 24
    Top = 184
  end
  object SynIdlSyn1: TSynIdlSyn
    Left = 24
    Top = 184
  end
  object SynDOTSyn1: TSynDOTSyn
    Left = 32
    Top = 184
  end
  object SynFortranSyn1: TSynFortranSyn
    Left = 40
    Top = 184
  end
  object SynFoxproSyn1: TSynFoxproSyn
    Left = 64
    Top = 184
  end
  object SynGalaxySyn1: TSynGalaxySyn
    DefaultFilter = 'Galaxy Files (*.gtv;*.galrep)|*.gtv;*.galrep'
    KeyWords.Strings = (
      '#END'
      '#GALAXY'
      'A'
      'ANONYMOUS'
      'AUTOUNLOAD'
      'B'
      'BATTLEPROTOCOL'
      'C'
      'CAP'
      'CARGO'
      'COL'
      'COMPRESS'
      'D'
      'DRIVE'
      'E'
      'EMP'
      'F'
      'FLEET'
      'FLEETTABLES'
      'G'
      'GALAXYTV'
      'GPLUS'
      'GROUPFORECAST'
      'H'
      'I'
      'J'
      'L'
      'M'
      'MACHINEREPORT'
      'MAT'
      'N'
      'NAMECASE'
      'NO'
      'O'
      'OPTIONS'
      'P'
      'PLANETFORECAST'
      'PRODTABLE'
      'PRODUCE'
      'Q'
      'R'
      'ROUTESFORECAST'
      'S'
      'SEND'
      'SHIELDS'
      'SHIPTYPEFORECAST'
      'SORTGROUPS'
      'T'
      'TWOCOL'
      'U'
      'UNDERSCORES'
      'V'
      'W'
      'WAR'
      'WEAPONS'
      'X'
      'Y'
      'Z')
    Left = 56
    Top = 184
  end
  object SynDmlSyn1: TSynDmlSyn
    Left = 8
    Top = 184
  end
  object SynGeneralSyn1: TSynGeneralSyn
    Comments = []
    DetectPreprocessor = False
    IdentifierChars = 
      '!"#$%&'#39'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`' +
      'abcdefghijklmnopqrstuvwxyz{|}~'#8364#129#8218#402#8222#8230#8224#8225#710#8240#352#8249#338#141#381#143#144#8216#8217#8220#8221#8226#8211#8212#732#8482#353#8250#339#157#382#376#160 +
      #161#162#163#164#165#166#167#168#169#170#171#172#173#174#175#176#177#178#179#180#181#182#183#184#185#186#187#188#189#190#191#192#193#194#195#196#197#198#199#200#201#202#203#204#205#206#207#208#209#210#211#212#213#214#215#216#217#218#219#220#221#222#223#224 +
      #225#226#227#228#229#230#231#232#233#234#235#236#237#238#239#240#241#242#243#244#245#246#247#248#249#250#251#252#253#254#255
    Left = 64
    Top = 184
  end
  object SynGWScriptSyn1: TSynGWScriptSyn
    Left = 16
    Top = 184
  end
  object SynHaskellSyn1: TSynHaskellSyn
    DefaultFilter = 'C/C++ Files (*.c;*.cpp;*.h;*.hpp)|*.c;*.cpp;*.h;*.hpp'
    Left = 16
    Top = 184
  end
  object SynHP48Syn1: TSynHP48Syn
    BaseRange = rsRpl
    Left = 32
    Top = 184
  end
  object SynHTMLSyn1: TSynHTMLSyn
    Left = 24
    Top = 184
  end
  object SynIniSyn1: TSynIniSyn
    Left = 32
    Top = 184
  end
  object SynInnoSyn1: TSynInnoSyn
    Left = 64
    Top = 184
  end
  object SynJavaSyn1: TSynJavaSyn
    Left = 48
    Top = 184
  end
  object SynJScriptSyn1: TSynJScriptSyn
    Left = 64
    Top = 184
  end
  object SynKixSyn1: TSynKixSyn
    Left = 64
    Top = 184
  end
  object SynLDRSyn1: TSynLDRSyn
    Left = 48
    Top = 184
  end
  object SynModelicaSyn1: TSynModelicaSyn
    Left = 8
    Top = 184
  end
  object SynM3Syn1: TSynM3Syn
    Left = 24
    Top = 184
  end
  object SynVBScriptSyn1: TSynVBScriptSyn
    Left = 16
    Top = 184
  end
  object SynBatSyn1: TSynBatSyn
    Left = 40
    Top = 184
  end
  object SynPasSyn1: TSynPasSyn
    AsmAttri.Foreground = clBlack
    CommentAttri.Foreground = clNavy
    DirectiveAttri.Foreground = clGreen
    IdentifierAttri.Foreground = clBlack
    NumberAttri.Foreground = clNavy
    FloatAttri.Foreground = clNavy
    HexAttri.Foreground = clPurple
    StringAttri.Foreground = clNavy
    CharAttri.Foreground = clNavy
    Left = 40
    Top = 184
  end
  object SynPHPSyn1: TSynPHPSyn
    Left = 64
    Top = 184
  end
  object SynProgressSyn1: TSynProgressSyn
    Left = 48
    Top = 184
  end
  object SynPythonSyn1: TSynPythonSyn
    Left = 72
    Top = 184
  end
  object SynRCSyn1: TSynRCSyn
    Left = 64
    Top = 184
  end
  object SynRubySyn1: TSynRubySyn
    Left = 16
    Top = 184
  end
  object SynSDDSyn1: TSynSDDSyn
    Left = 16
    Top = 184
  end
  object SynSQLSyn1: TSynSQLSyn
    Left = 24
    Top = 184
  end
  object SynSMLSyn1: TSynSMLSyn
    Left = 32
    Top = 184
  end
  object SynSTSyn1: TSynSTSyn
    DefaultFilter = 
      'Pascal Files (*.pas;*.pp;*.dpr;*.dpk;*.inc)|*.pas;*.pp;*.dpr;*.d' +
      'pk;*.inc'
    Left = 40
    Top = 184
  end
  object SynMsgSyn1: TSynMsgSyn
    Left = 48
    Top = 184
  end
  object SynTclTkSyn1: TSynTclTkSyn
    Left = 48
    Top = 184
  end
  object SynTeXSyn1: TSynTeXSyn
    Left = 40
    Top = 184
  end
  object SynUNIXShellScriptSyn1: TSynUNIXShellScriptSyn
    Left = 56
    Top = 184
  end
  object SynUnrealSyn1: TSynUnrealSyn
    Left = 48
    Top = 184
  end
  object SynURISyn1: TSynURISyn
    Left = 16
    Top = 184
  end
  object SynVBSyn1: TSynVBSyn
    Left = 24
    Top = 184
  end
  object SynVrml97Syn1: TSynVrml97Syn
    Left = 40
    Top = 184
  end
  object SynAsmSyn1: TSynAsmSyn
    Left = 64
    Top = 184
  end
  object SynXMLSyn1: TSynXMLSyn
    WantBracesParsed = False
    Left = 48
    Top = 184
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 48
    Top = 184
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 1
    MaxFontSize = 100
    Left = 16
    Top = 184
  end
  object OpenDialog1: TOpenDialog
    InitialDir = 'C:\'
    Title = 'Choisir un programme '
    Left = 8
    Top = 208
  end
  object SynAnySyn1: TSynAnySyn
    Comments = []
    DetectPreprocessor = False
    IdentifierChars = 
      '!"#$%&'#39'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`' +
      'abcdefghijklmnopqrstuvwxyz{|}~'#8364#129#8218#402#8222#8230#8224#8225#710#8240#352#8249#338#141#381#143#144#8216#8217#8220#8221#8226#8211#8212#732#8482#353#8250#339#157#382#376#160 +
      #161#162#163#164#165#166#167#168#169#170#171#172#173#174#175#176#177#178#179#180#181#182#183#184#185#186#187#188#189#190#191#192#193#194#195#196#197#198#199#200#201#202#203#204#205#206#207#208#209#210#211#212#213#214#215#216#217#218#219#220#221#222#223#224 +
      #225#226#227#228#229#230#231#232#233#234#235#236#237#238#239#240#241#242#243#244#245#246#247#248#249#250#251#252#253#254#255
    Markup = False
    Entity = False
    DollarVariables = False
    ActiveDot = False
    DefaultLanguageName = 'Custom Highlighter'
    Left = 48
    Top = 184
  end
  object SynNSISSyn1: TSynNSISSyn
    DefaultFilter = 'NSIS Script Files (*.nsi)|*.nsi'
    HighlightVarsInsideStrings = True
    Left = 48
    Top = 184
  end
  object SynPerlSyn1: TSynPerlSyn
    Left = 32
    Top = 184
  end
  object SynRSyn1: TSynRSyn
    Left = 72
    Top = 184
  end
  object SynScilabSyn1: TSynScilabSyn
    Left = 64
    Top = 184
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.cfg'
    Filter = 'Configurations de PitiPad|*.cfg'
    Options = [ofHideReadOnly, ofNoChangeDir, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Sauvegarder la configuration'
    Left = 32
    Top = 208
  end
  object SynMPerlSyn1: TSynMPerlSyn
    DefaultFilter = 'Perl Files (*.pl;*.pm;*.cgi)|*.pl;*.pm;*.cgi'
    Options = []
    Left = 72
    Top = 184
  end
end
