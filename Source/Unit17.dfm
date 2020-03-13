object Form17: TForm17
  Tag = 1
  Left = 0
  Top = 0
  Width = 511
  Height = 383
  Caption = 'All4Cod - Infos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 24
    Width = 503
    Height = 306
    Align = alClient
    TabOrder = 0
    OnStatusTextChange = WebBrowser1StatusTextChange
    OnProgressChange = WebBrowser1ProgressChange
    OnCommandStateChange = WebBrowser1CommandStateChange
    OnNavigateComplete2 = WebBrowser1NavigateComplete2
    ControlData = {
      4C000000FD330000A01F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 330
    Width = 503
    Height = 19
    Panels = <
      item
        Width = 375
      end
      item
        Width = 0
      end>
    OnResize = StatusBar1Resize
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 503
    Height = 24
    AutoSize = True
    ButtonHeight = 24
    ButtonWidth = 24
    Caption = 'ToolBar1'
    EdgeBorders = []
    Flat = True
    Images = Form1.ImageList1
    TabOrder = 2
    Transparent = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 98
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 24
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 97
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 48
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 56
      Top = 0
      Caption = 'ToolButton4'
      ImageIndex = 107
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
    object ToolButton5: TToolButton
      Left = 80
      Top = 0
      Caption = 'ToolButton5'
      ImageIndex = 99
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton5Click
    end
    object ToolButton6: TToolButton
      Left = 104
      Top = 0
      Caption = 'ToolButton6'
      ImageIndex = 100
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton6Click
    end
    object ToolButton7: TToolButton
      Left = 128
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object Panel1: TPanel
      Left = 136
      Top = 0
      Width = 342
      Height = 24
      TabOrder = 0
      object ComboBox1: TComboBox
        Left = 1
        Top = 1
        Width = 339
        Height = 21
        AutoCloseUp = True
        ItemHeight = 0
        TabOrder = 0
        OnKeyPress = ComboBox1KeyPress
      end
    end
    object ToolButton8: TToolButton
      Left = 478
      Top = 0
      Caption = 'ToolButton8'
      ImageIndex = 97
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton8Click
    end
  end
  object ProgressBar1: TProgressBar
    Left = 208
    Top = 224
    Width = 120
    Height = 17
    Smooth = True
    TabOrder = 3
  end
end
