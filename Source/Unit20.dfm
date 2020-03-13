object Form20: TForm20
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = ' Informations sur le projet'
  ClientHeight = 216
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 279
    Top = 44
    Width = 27
    Height = 13
    Caption = 'Icone'
  end
  object Image1: TImage
    Left = 256
    Top = 16
    Width = 72
    Height = 72
    Center = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 197
    Width = 341
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Button1: TButton
    Left = 256
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 81
    Caption = 'Informations'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nom : '
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Date : '
    end
    object Label8: TLabel
      Left = 16
      Top = 40
      Width = 43
      Height = 13
      Caption = 'Auteur : '
    end
    object Label9: TLabel
      Left = 80
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Label9'
    end
    object Label10: TLabel
      Left = 80
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Label10'
    end
    object Label11: TLabel
      Left = 80
      Top = 56
      Width = 37
      Height = 13
      Caption = 'Label11'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 233
    Height = 97
    Caption = 'Statistiques'
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 99
      Height = 13
      Caption = 'Nombre de fichiers : '
    end
    object Label4: TLabel
      Left = 16
      Top = 40
      Width = 123
      Height = 13
      Caption = 'Nombre de lignes totale : '
    end
    object Label5: TLabel
      Left = 16
      Top = 72
      Width = 78
      Height = 13
      Caption = 'Ouvert depuis : '
    end
    object Label6: TLabel
      Left = 16
      Top = 56
      Width = 119
      Height = 13
      Caption = 'Taille totale des fichiers :'
    end
    object Label12: TLabel
      Left = 152
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Label12'
    end
    object Label13: TLabel
      Left = 152
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Label13'
    end
    object Label14: TLabel
      Left = 152
      Top = 56
      Width = 37
      Height = 13
      Caption = 'Label14'
    end
    object Label15: TLabel
      Left = 152
      Top = 72
      Width = 37
      Height = 13
      Caption = 'Label15'
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 280
    Top = 112
  end
end
