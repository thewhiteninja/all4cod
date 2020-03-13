object Find: TFind
  Left = 292
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Find'
  ClientHeight = 227
  ClientWidth = 353
  Color = clBtnFace
  Constraints.MinHeight = 254
  Constraints.MinWidth = 361
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 59
    Height = 13
    Caption = 'Text to Find:'
  end
  object Options: TGroupBox
    Left = 8
    Top = 40
    Width = 161
    Height = 65
    Caption = 'Options'
    TabOrder = 0
    object CaseSensitive: TCheckBox
      Left = 8
      Top = 18
      Width = 97
      Height = 17
      Caption = 'Case Sensitive'
      TabOrder = 0
    end
    object Wholewords: TCheckBox
      Left = 8
      Top = 37
      Width = 117
      Height = 17
      Caption = 'Whole Words Only'
      TabOrder = 1
    end
  end
  object Scope: TRadioGroup
    Left = 8
    Top = 113
    Width = 161
    Height = 65
    Caption = 'Scope'
    ItemIndex = 0
    Items.Strings = (
      'Global'
      'Selected Text')
    TabOrder = 1
  end
  object Direction: TRadioGroup
    Left = 184
    Top = 40
    Width = 161
    Height = 65
    Caption = 'Scope'
    ItemIndex = 0
    Items.Strings = (
      'Forward'
      'Backward')
    TabOrder = 2
  end
  object Origin: TRadioGroup
    Left = 184
    Top = 113
    Width = 161
    Height = 65
    Caption = 'Scope'
    ItemIndex = 0
    Items.Strings = (
      'From Cursor'
      'Entire Scope')
    TabOrder = 3
  end
  object Button1: TButton
    Left = 184
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object FindText: TComboBox
    Left = 76
    Top = 12
    Width = 269
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 6
    OnKeyPress = FindTextKeyPress
  end
  object FormStorage: TFormStorage
    IniSection = 'Find'
    StoredProps.Strings = (
      'Origin.ItemIndex'
      'Scope.ItemIndex'
      'Wholewords.Checked'
      'CaseSensitive.Checked'
      'FindText.Items'
      'Direction.ItemIndex')
    StoredValues = <>
    Left = 104
    Top = 192
  end
  object PopupMenu1: TPopupMenu
    AutoPopup = False
    Left = 74
    Top = 191
    object Ok1: TMenuItem
      Caption = 'Ok'
      ShortCut = 13
      OnClick = Button1Click
    end
    object Cancel1: TMenuItem
      Caption = 'Cancel'
      ShortCut = 27
      OnClick = Cancel1Click
    end
  end
end
