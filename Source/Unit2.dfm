object Form2: TForm2
  Left = 388
  Top = 199
  Width = 441
  Height = 318
  Caption = 'Sans titre 0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 184
    Width = 433
    Height = 5
    Cursor = crVSplit
    Align = alBottom
  end
  object SynEdit1: TSynEdit
    Left = 0
    Top = 14
    Width = 433
    Height = 170
    Align = alClient
    ActiveLineColor = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    PopupMenu = Form1.PopupMenu4
    TabOrder = 0
    OnKeyPress = SynEdit1KeyPress
    Gutter.DigitCount = 3
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 0
    Gutter.ShowLineNumbers = True
    Gutter.ZeroStart = True
    Gutter.Gradient = True
    Gutter.GradientStartColor = clBtnFace
    Gutter.GradientEndColor = clWhite
    SearchEngine = SynEditSearch1
    OnChange = SynEdit1Change
    OnStatusChange = SynEdit1StatusChange
    RemovedKeystrokes = <
      item
        Command = ecGotoMarker0
        ShortCut = 16432
      end
      item
        Command = ecGotoMarker1
        ShortCut = 16433
      end
      item
        Command = ecGotoMarker2
        ShortCut = 16434
      end
      item
        Command = ecGotoMarker3
        ShortCut = 16435
      end
      item
        Command = ecGotoMarker4
        ShortCut = 16436
      end
      item
        Command = ecGotoMarker5
        ShortCut = 16437
      end
      item
        Command = ecGotoMarker6
        ShortCut = 16438
      end
      item
        Command = ecGotoMarker7
        ShortCut = 16439
      end
      item
        Command = ecGotoMarker8
        ShortCut = 16440
      end
      item
        Command = ecGotoMarker9
        ShortCut = 16441
      end
      item
        Command = ecSetMarker0
        ShortCut = 24624
      end
      item
        Command = ecSetMarker1
        ShortCut = 24625
      end
      item
        Command = ecSetMarker2
        ShortCut = 24626
      end
      item
        Command = ecSetMarker3
        ShortCut = 24627
      end
      item
        Command = ecSetMarker4
        ShortCut = 24628
      end
      item
        Command = ecSetMarker5
        ShortCut = 24629
      end
      item
        Command = ecSetMarker6
        ShortCut = 24630
      end
      item
        Command = ecSetMarker7
        ShortCut = 24631
      end
      item
        Command = ecSetMarker8
        ShortCut = 24632
      end
      item
        Command = ecSetMarker9
        ShortCut = 24633
      end>
    AddedKeystrokes = <
      item
        Command = ecAutoCompletion
        ShortCut = 16458
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 265
    Width = 433
    Height = 19
    Panels = <
      item
        Text = 'Aucun'
        Width = 140
      end
      item
        Alignment = taCenter
        Text = '1 : 1'
        Width = 90
      end
      item
        Alignment = taCenter
        Width = 70
      end
      item
        Alignment = taCenter
        Text = 'Insertion'
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 189
    Width = 433
    Height = 76
    Align = alBottom
    Caption = 'Messages'
    TabOrder = 2
    object SynMemo1: TSynMemo
      Left = 2
      Top = 15
      Width = 429
      Height = 59
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      PopupMenu = Form1.PopupMenu7
      TabOrder = 0
      BorderStyle = bsNone
      Gutter.DigitCount = 3
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.LeftOffset = 0
      Gutter.Width = 26
      Gutter.Gradient = True
      Gutter.GradientStartColor = clBtnFace
      Gutter.GradientEndColor = clWhite
      MaxUndo = 0
      Options = [eoEnhanceEndKey, eoScrollPastEol, eoSmartTabDelete, eoSmartTabs]
      ReadOnly = True
      RightEdge = 0
      ScrollBars = ssVertical
    end
  end
  object Ruler1: TRuler
    Left = 0
    Top = 0
    Width = 433
    Height = 14
    Align = alTop
    CaptionAlign = caTopLeft
    CaptionIndent1 = 0
    CaptionIndent2 = 0
    Color = clBtnFace
    EnableRepaint = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    FontRotation = fr0
    NumberAlign = naCenter
    NumberIndent = 1
    Orientation = orHoriz
    RollEnabled = True
    RollLimits.MinValid = True
    RollLimits.Min = -10.000000000000000000
    RollLimits.MaxValid = True
    RollLimits.Max = 10.000000000000000000
    StartValue = -0.730000000000000000
    TickAlign = taBottomRight
    TickColor = clBlack
    TickSizeBig = 35
    TickSizeMiddle = 25
    TickSizeSmall = 15
    UnitSize = 40.000000000000000000
    UnitPrice = 1.000000000000000000
    UnitPrecision = 0
  end
  object SynEditSearch1: TSynEditSearch
    Left = 104
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.log'
    FileName = '*.log'
    Filter = 'Fichier log|*.log'
    Title = 'Enregistrer les messages ...'
    Left = 136
    Top = 24
  end
  object SynCompletionProposal1: TSynCompletionProposal
    Options = [scoUseInsertList, scoUsePrettyText, scoUseBuiltInTimer, scoEndCharCompletion, scoCompleteWithTab, scoCompleteWithEnter]
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        BiggestWord = 'CONSTRUCTOR'
      end>
    ShortCut = 16416
    Editor = SynEdit1
    TimerInterval = 500
    Left = 168
    Top = 24
  end
end
