object Form9: TForm9
  Left = 413
  Top = 275
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Correcteur d'#39'orthographe'
  ClientHeight = 256
  ClientWidth = 300
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
    Left = 8
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Mot'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 237
    Width = 300
    Height = 19
    Panels = <>
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 153
    Height = 21
    AutoSize = False
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 8
    Top = 48
    Width = 153
    Height = 185
    ItemHeight = 13
    TabOrder = 2
    OnClick = ListBox1Click
  end
  object Button1: TButton
    Left = 168
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Ignorer'
    ModalResult = 7
    TabOrder = 3
  end
  object Button2: TButton
    Left = 168
    Top = 40
    Width = 129
    Height = 25
    Caption = 'Ignorer toujours'
    ModalResult = 9
    TabOrder = 4
  end
  object Button3: TButton
    Left = 168
    Top = 88
    Width = 129
    Height = 25
    Caption = 'Ajouter au dictionnaire'
    ModalResult = 8
    TabOrder = 5
  end
  object Button4: TButton
    Left = 168
    Top = 128
    Width = 129
    Height = 25
    Caption = 'Remplacer'
    ModalResult = 1
    TabOrder = 6
  end
  object Button5: TButton
    Left = 168
    Top = 160
    Width = 129
    Height = 25
    Caption = 'Remplacer + Ajouter'
    ModalResult = 10
    TabOrder = 7
  end
  object Button6: TButton
    Left = 168
    Top = 208
    Width = 129
    Height = 25
    Caption = 'Annuler'
    ModalResult = 3
    TabOrder = 8
  end
end
