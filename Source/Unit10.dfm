object Form10: TForm10
  Left = 253
  Top = 130
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ligne'
  ClientHeight = 67
  ClientWidth = 195
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
  object LabeledEdit1: TLabeledEdit
    Left = 2
    Top = 20
    Width = 191
    Height = 21
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Num'#233'ro :'
    TabOrder = 0
    OnKeyPress = LabeledEdit1KeyPress
  end
  object Button1: TButton
    Left = 57
    Top = 45
    Width = 79
    Height = 20
    Caption = 'Aller'
    ModalResult = 1
    TabOrder = 1
  end
end
