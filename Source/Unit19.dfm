object Form19: TForm19
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Options du projet'
  ClientHeight = 304
  ClientWidth = 562
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 285
    Width = 562
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 0
    Width = 562
    Height = 25
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Color = clWhite
    ParentColor = False
    TabOrder = 3
    Transparent = False
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 25
    Width = 121
    Height = 260
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Images = Form1.ImageList1
    Indent = 19
    ReadOnly = True
    RightClickSelect = True
    ShowLines = False
    TabOrder = 4
    OnClick = TreeView1Click
    Items.NodeData = {
      010400000031000000660000006600000066000000FFFFFFFF00000000000000
      000C49006E0066006F0072006D006100740069006F006E007300270000006900
      00006900000069000000FFFFFFFF000000000000000007560065007200730069
      006F006E0029000000190000001900000019000000FFFFFFFF00000000000000
      000843006F006D00700069006C0065007200290000002A0000002A0000002A00
      0000FFFFFFFF00000000000000000845007800E90063007500740065007200}
  end
  object StaticText2: TStaticText
    Left = 177
    Top = 5
    Width = 188
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Options > Informations'
    Color = clWhite
    ParentColor = False
    TabOrder = 6
    Transparent = False
  end
  object Notebook1: TNotebook
    Left = 121
    Top = 25
    Width = 441
    Height = 260
    Align = alClient
    TabOrder = 5
    object TPage
      Left = 0
      Top = 0
      Caption = 'Informations'
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Nom : '
      end
      object Label2: TLabel
        Left = 16
        Top = 44
        Width = 40
        Height = 13
        Caption = 'Auteur :'
      end
      object Label3: TLabel
        Left = 16
        Top = 68
        Width = 33
        Height = 13
        Caption = 'Date : '
      end
      object Label4: TLabel
        Left = 248
        Top = 12
        Width = 78
        Height = 13
        Caption = 'Commentaires : '
      end
      object Label5: TLabel
        Left = 49
        Top = 103
        Width = 34
        Height = 13
        Caption = 'Icone :'
      end
      object Image1: TImage
        Left = 128
        Top = 102
        Width = 72
        Height = 72
        Center = True
      end
      object RichEdit1: TRichEdit
        Left = 248
        Top = 29
        Width = 173
        Height = 188
        TabOrder = 4
      end
      object Edit1: TEdit
        Left = 60
        Top = 17
        Width = 165
        Height = 21
        TabOrder = 5
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 60
        Top = 41
        Width = 165
        Height = 21
        TabOrder = 6
        Text = 'Edit2'
      end
      object Edit3: TEdit
        Left = 60
        Top = 65
        Width = 165
        Height = 21
        TabOrder = 3
        Text = 'Edit3'
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 192
        Width = 217
        Height = 25
        Caption = 'Auto incr'#233'mentation du num'#233'ro de build'
        TabOrder = 0
      end
      object Button1: TButton
        Left = 41
        Top = 127
        Width = 57
        Height = 20
        Caption = 'Aucune'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 41
        Top = 151
        Width = 57
        Height = 20
        Caption = '...'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Version'
      object Label6: TLabel
        Left = 35
        Top = 18
        Width = 33
        Height = 13
        Caption = 'Majeur'
      end
      object Label20: TLabel
        Left = 131
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Mineur'
      end
      object Label7: TLabel
        Left = 227
        Top = 18
        Width = 38
        Height = 13
        Caption = 'Release'
      end
      object Label8: TLabel
        Left = 325
        Top = 18
        Width = 22
        Height = 13
        Caption = 'Build'
      end
      object SpinEdit1: TSpinEdit
        Left = 35
        Top = 34
        Width = 83
        Height = 22
        EditorEnabled = False
        MaxLength = 3
        MaxValue = 999
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object SpinEdit2: TSpinEdit
        Left = 131
        Top = 34
        Width = 83
        Height = 22
        EditorEnabled = False
        MaxLength = 3
        MaxValue = 999
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object SpinEdit3: TSpinEdit
        Left = 227
        Top = 34
        Width = 83
        Height = 22
        EditorEnabled = False
        MaxLength = 3
        MaxValue = 999
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object SpinEdit4: TSpinEdit
        Left = 323
        Top = 34
        Width = 83
        Height = 22
        EditorEnabled = False
        MaxLength = 3
        MaxValue = 999
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object StringGrid1: TStringGrid
        Left = 20
        Top = 71
        Width = 402
        Height = 148
        BevelInner = bvNone
        BevelOuter = bvNone
        ColCount = 2
        DefaultColWidth = 152
        DefaultRowHeight = 18
        RowCount = 10
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goAlwaysShowEditor]
        TabOrder = 4
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Compile'
      object LabeledEdit1: TLabeledEdit
        Left = 16
        Top = 32
        Width = 361
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Programme :'
        TabOrder = 0
      end
      object LabeledEdit2: TLabeledEdit
        Left = 16
        Top = 72
        Width = 409
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'Param'#232'tres :'
        TabOrder = 1
      end
      object Button5: TButton
        Left = 384
        Top = 29
        Width = 41
        Height = 25
        Caption = '...'
        TabOrder = 2
        OnClick = Button5Click
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 104
        Width = 409
        Height = 113
        Caption = 'Propri'#233't'#233's'
        TabOrder = 3
        object Label9: TLabel
          Left = 24
          Top = 16
          Width = 135
          Height = 13
          Caption = 'Timeout (apr'#233's lancement) :'
        end
        object Label10: TLabel
          Left = 24
          Top = 40
          Width = 156
          Height = 13
          Caption = 'Timeout (apr'#233's derniere sortie) :'
        end
        object Label11: TLabel
          Left = 24
          Top = 64
          Width = 41
          Height = 13
          Caption = 'Priorit'#233' :'
        end
        object Label12: TLabel
          Left = 24
          Top = 88
          Width = 88
          Height = 13
          Caption = 'Type de fen'#234'tre : '
        end
        object SpinEdit5: TSpinEdit
          Left = 264
          Top = 12
          Width = 113
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object SpinEdit6: TSpinEdit
          Left = 264
          Top = 36
          Width = 113
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object ComboBox1: TComboBox
          Left = 264
          Top = 61
          Width = 114
          Height = 21
          ItemHeight = 0
          ItemIndex = 1
          TabOrder = 2
          Text = '8'
          Items.Strings = (
            '13'
            '8'
            '6'
            '24')
        end
        object ComboBox2: TComboBox
          Left = 264
          Top = 85
          Width = 114
          Height = 21
          ItemHeight = 0
          ItemIndex = 0
          TabOrder = 3
          Text = 'Cacher'
          Items.Strings = (
            'Cacher'
            'Maximiser'
            'Minimiser'
            'Normal')
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Execute'
      object LabeledEdit5: TLabeledEdit
        Left = 16
        Top = 32
        Width = 361
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Programme :'
        TabOrder = 0
      end
      object LabeledEdit6: TLabeledEdit
        Left = 16
        Top = 72
        Width = 409
        Height = 21
        EditLabel.Width = 65
        EditLabel.Height = 13
        EditLabel.Caption = 'Param'#232'tres : '
        TabOrder = 1
      end
      object GroupBox3: TGroupBox
        Left = 16
        Top = 104
        Width = 409
        Height = 57
        Caption = 'Propri'#233't'#233's'
        TabOrder = 2
        object Label17: TLabel
          Left = 16
          Top = 24
          Width = 85
          Height = 13
          Caption = 'Type de fen'#234'tre :'
        end
        object ComboBox5: TComboBox
          Left = 272
          Top = 21
          Width = 105
          Height = 21
          ItemHeight = 0
          ItemIndex = 0
          TabOrder = 0
          Text = 'Cacher'
          Items.Strings = (
            'Cacher'
            'Maximiser'
            'Minimiser'
            'Normal')
        end
      end
      object Button7: TButton
        Left = 384
        Top = 29
        Width = 41
        Height = 25
        Caption = '...'
        TabOrder = 3
        OnClick = Button7Click
      end
    end
  end
  object Button3: TButton
    Left = 371
    Top = 251
    Width = 82
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 467
    Top = 251
    Width = 74
    Height = 25
    Caption = 'Annuler'
    TabOrder = 2
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Tout les fichiers|*.*'
    Title = 'Choisir un programme'
    Left = 432
    Top = 32
  end
end
