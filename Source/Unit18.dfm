object Form18: TForm18
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Supprimer des fichiers de'
  ClientHeight = 183
  ClientWidth = 533
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
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 533
    Height = 145
    Align = alTop
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 101
    Top = 151
    Width = 97
    Height = 25
    Caption = 'Supprimer'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 213
    Top = 151
    Width = 97
    Height = 25
    Caption = 'Tout supprimer'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 325
    Top = 151
    Width = 97
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = Button3Click
  end
end
