object Form8: TForm8
  Left = 427
  Top = 115
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Evaluateur d'#39'expressions'
  ClientHeight = 353
  ClientWidth = 556
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
    Top = 334
    Width = 556
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 337
    Height = 334
    ActivePage = TabSheet1
    Align = alLeft
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Num'#233'rique'
      object RichEdit1: TRichEdit
        Left = 0
        Top = 0
        Width = 329
        Height = 284
        Align = alTop
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
      object Edit1: TEdit
        Left = 0
        Top = 285
        Width = 329
        Height = 21
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
    end
  end
  object Button1: TButton
    Left = 416
    Top = 8
    Width = 65
    Height = 24
    Caption = 'Haut'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 350
    Top = 21
    Width = 64
    Height = 24
    Caption = 'Gauche'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 483
    Top = 21
    Width = 64
    Height = 24
    Caption = 'Droite'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 416
    Top = 34
    Width = 65
    Height = 24
    Caption = 'Bas'
    TabOrder = 5
    OnClick = Button4Click
  end
  object GroupBox1: TGroupBox
    Left = 352
    Top = 64
    Width = 192
    Height = 105
    Caption = 'Math'
    TabOrder = 6
    object ListBox1: TListBox
      Left = 2
      Top = 15
      Width = 188
      Height = 88
      Align = alClient
      ItemHeight = 13
      Items.Strings = (
        '^'
        'e '
        'pi '
        '! '
        'Ln()'
        'Cos()'
        'Sin()'
        'Tan()'
        'Ctg()'
        'Abs()'
        'Sqrt()')
      TabOrder = 0
      OnClick = ListBox1Click
    end
  end
  object Button5: TButton
    Left = 352
    Top = 240
    Width = 45
    Height = 24
    Caption = '1'
    TabOrder = 7
    OnClick = Button14Click
  end
  object Button6: TButton
    Left = 401
    Top = 240
    Width = 45
    Height = 24
    Caption = '2'
    TabOrder = 8
    OnClick = Button14Click
  end
  object Button7: TButton
    Left = 450
    Top = 240
    Width = 45
    Height = 24
    Caption = '3'
    TabOrder = 9
    OnClick = Button14Click
  end
  object Button8: TButton
    Left = 352
    Top = 208
    Width = 45
    Height = 24
    Caption = '4'
    TabOrder = 10
    OnClick = Button14Click
  end
  object Button9: TButton
    Left = 401
    Top = 208
    Width = 45
    Height = 24
    Caption = '5'
    TabOrder = 11
    OnClick = Button14Click
  end
  object Button10: TButton
    Left = 450
    Top = 208
    Width = 45
    Height = 24
    Caption = '6'
    TabOrder = 12
    OnClick = Button14Click
  end
  object Button11: TButton
    Left = 352
    Top = 176
    Width = 45
    Height = 24
    Caption = '7'
    TabOrder = 13
    OnClick = Button14Click
  end
  object Button12: TButton
    Left = 401
    Top = 176
    Width = 45
    Height = 24
    Caption = '8'
    TabOrder = 14
    OnClick = Button14Click
  end
  object Button13: TButton
    Left = 450
    Top = 176
    Width = 45
    Height = 24
    Caption = '9'
    TabOrder = 15
    OnClick = Button14Click
  end
  object Button14: TButton
    Left = 352
    Top = 272
    Width = 94
    Height = 24
    Caption = '0'
    TabOrder = 16
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 499
    Top = 176
    Width = 45
    Height = 24
    Caption = '/'
    TabOrder = 17
    OnClick = Button14Click
  end
  object Button16: TButton
    Left = 499
    Top = 208
    Width = 45
    Height = 24
    Caption = '*'
    TabOrder = 18
    OnClick = Button14Click
  end
  object Button17: TButton
    Left = 499
    Top = 240
    Width = 45
    Height = 24
    Caption = '-'
    TabOrder = 19
    OnClick = Button14Click
  end
  object Button18: TButton
    Left = 450
    Top = 272
    Width = 45
    Height = 24
    Caption = '.'
    TabOrder = 20
    OnClick = Button14Click
  end
  object Button19: TButton
    Left = 499
    Top = 272
    Width = 45
    Height = 24
    Caption = '+'
    TabOrder = 21
    OnClick = Button14Click
  end
  object Button20: TButton
    Left = 416
    Top = 304
    Width = 129
    Height = 25
    Caption = 'Entr'#233'e'
    TabOrder = 22
    OnClick = Button20Click
  end
  object Button21: TButton
    Left = 353
    Top = 304
    Width = 56
    Height = 24
    Caption = 'Rep'
    TabOrder = 23
    OnClick = Button14Click
  end
end
