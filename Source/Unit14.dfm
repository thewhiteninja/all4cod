object Form14: TForm14
  Left = 244
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ajouter une variable'
  ClientHeight = 123
  ClientWidth = 336
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
  object Button1: TButton
    Left = 72
    Top = 94
    Width = 81
    Height = 25
    Caption = 'Ajouter'
    ModalResult = 1
    TabOrder = 0
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 24
    Width = 321
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Nom :'
    TabOrder = 1
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 64
    Width = 321
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Valeur :'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 176
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 3
  end
end
