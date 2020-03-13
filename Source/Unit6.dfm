object Form6: TForm6
  Left = 458
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Conversion de bases'
  ClientHeight = 217
  ClientWidth = 271
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 198
    Width = 271
    Height = 19
    Panels = <>
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 24
    Width = 257
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Base 16'
    TabOrder = 1
    OnChange = LabeledEdit1Change
    OnKeyPress = LabeledEdit1KeyPress
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 64
    Width = 257
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Base 10'
    TabOrder = 2
    OnChange = LabeledEdit2Change
    OnKeyPress = LabeledEdit2KeyPress
  end
  object LabeledEdit3: TLabeledEdit
    Left = 8
    Top = 104
    Width = 257
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Base 8'
    TabOrder = 3
    OnChange = LabeledEdit3Change
    OnKeyPress = LabeledEdit3KeyPress
  end
  object LabeledEdit4: TLabeledEdit
    Left = 8
    Top = 144
    Width = 257
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Base 2'
    TabOrder = 4
    OnChange = LabeledEdit4Change
    OnKeyPress = LabeledEdit4KeyPress
  end
  object Button1: TButton
    Left = 80
    Top = 172
    Width = 106
    Height = 25
    Caption = 'Fermer'
    TabOrder = 5
    OnClick = Button1Click
  end
end
