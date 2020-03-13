object Form7: TForm7
  Left = 106
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Couleurs'
  ClientHeight = 208
  ClientWidth = 469
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
  object Shape1: TShape
    Left = 1
    Top = 152
    Width = 304
    Height = 33
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 189
    Width = 469
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 305
    Height = 145
    Caption = 'RVB'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Rouge : 255'
    end
    object Label2: TLabel
      Left = 16
      Top = 58
      Width = 46
      Height = 13
      Caption = 'Vert : 255'
    end
    object Label3: TLabel
      Left = 16
      Top = 100
      Width = 48
      Height = 13
      Caption = 'Bleu : 255'
    end
    object TrackBar1: TTrackBar
      Left = 10
      Top = 30
      Width = 287
      Height = 20
      Max = 255
      Frequency = 6
      Position = 255
      TabOrder = 0
      ThumbLength = 15
      OnChange = TrackBar1Change
    end
    object TrackBar2: TTrackBar
      Left = 10
      Top = 72
      Width = 287
      Height = 20
      Max = 255
      Frequency = 6
      Position = 255
      TabOrder = 1
      ThumbLength = 15
      OnChange = TrackBar2Change
    end
    object TrackBar3: TTrackBar
      Left = 10
      Top = 114
      Width = 287
      Height = 20
      Max = 255
      Frequency = 6
      Position = 255
      TabOrder = 2
      ThumbLength = 15
      OnChange = TrackBar3Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 312
    Top = 0
    Width = 153
    Height = 145
    Caption = 'Num'#233'rique'
    TabOrder = 2
    object LabeledEdit1: TLabeledEdit
      Left = 8
      Top = 32
      Width = 137
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = 'Normale'
      TabOrder = 0
      Text = 'FFFFFF'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 8
      Top = 79
      Width = 137
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = 'Format HTML'
      TabOrder = 1
      Text = '#FFFFFF'
    end
    object Button1: TButton
      Left = 8
      Top = 111
      Width = 137
      Height = 25
      Caption = '>> Presse-papiers'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Button2: TButton
    Left = 312
    Top = 152
    Width = 153
    Height = 33
    Caption = 'Palette de couleurs ...'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen]
    Left = 176
    Top = 8
  end
end
