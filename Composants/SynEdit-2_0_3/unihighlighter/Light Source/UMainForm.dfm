object MainForm: TMainForm
  Left = 187
  Top = 112
  Width = 696
  Height = 480
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Edit: TSynEdit
    Left = 0
    Top = 0
    Width = 688
    Height = 415
    Cursor = crIBeam
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnKeyPress = EditKeyPress
    Gutter.AutoSize = True
    Gutter.DigitCount = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Terminal'
    Gutter.Font.Style = []
    Gutter.ShowLineNumbers = True
    Highlighter = SynUniSyn
    Keystrokes = <
      item
        Command = ecUp
        ShortCut = 38
      end
      item
        Command = ecSelUp
        ShortCut = 8230
      end
      item
        Command = ecScrollUp
        ShortCut = 16422
      end
      item
        Command = ecDown
        ShortCut = 40
      end
      item
        Command = ecSelDown
        ShortCut = 8232
      end
      item
        Command = ecScrollDown
        ShortCut = 16424
      end
      item
        Command = ecLeft
        ShortCut = 37
      end
      item
        Command = ecSelLeft
        ShortCut = 8229
      end
      item
        Command = ecWordLeft
        ShortCut = 16421
      end
      item
        Command = ecSelWordLeft
        ShortCut = 24613
      end
      item
        Command = ecRight
        ShortCut = 39
      end
      item
        Command = ecSelRight
        ShortCut = 8231
      end
      item
        Command = ecWordRight
        ShortCut = 16423
      end
      item
        Command = ecSelWordRight
        ShortCut = 24615
      end
      item
        Command = ecPageDown
        ShortCut = 34
      end
      item
        Command = ecSelPageDown
        ShortCut = 8226
      end
      item
        Command = ecPageBottom
        ShortCut = 16418
      end
      item
        Command = ecSelPageBottom
        ShortCut = 24610
      end
      item
        Command = ecPageUp
        ShortCut = 33
      end
      item
        Command = ecSelPageUp
        ShortCut = 8225
      end
      item
        Command = ecPageTop
        ShortCut = 16417
      end
      item
        Command = ecSelPageTop
        ShortCut = 24609
      end
      item
        Command = ecLineStart
        ShortCut = 36
      end
      item
        Command = ecSelLineStart
        ShortCut = 8228
      end
      item
        Command = ecEditorTop
        ShortCut = 16420
      end
      item
        Command = ecSelEditorTop
        ShortCut = 24612
      end
      item
        Command = ecLineEnd
        ShortCut = 35
      end
      item
        Command = ecSelLineEnd
        ShortCut = 8227
      end
      item
        Command = ecEditorBottom
        ShortCut = 16419
      end
      item
        Command = ecSelEditorBottom
        ShortCut = 24611
      end
      item
        Command = ecToggleMode
        ShortCut = 45
      end
      item
        Command = ecCopy
        ShortCut = 16429
      end
      item
        Command = ecCut
        ShortCut = 8238
      end
      item
        Command = ecPaste
        ShortCut = 8237
      end
      item
        Command = ecDeleteChar
        ShortCut = 46
      end
      item
        Command = ecDeleteLastChar
        ShortCut = 8
      end
      item
        Command = ecDeleteLastChar
        ShortCut = 8200
      end
      item
        Command = ecDeleteLastWord
        ShortCut = 16392
      end
      item
        Command = ecUndo
        ShortCut = 32776
      end
      item
        Command = ecRedo
        ShortCut = 40968
      end
      item
        Command = ecLineBreak
        ShortCut = 13
      end
      item
        Command = ecLineBreak
        ShortCut = 8205
      end
      item
        Command = ecTab
        ShortCut = 9
      end
      item
        Command = ecShiftTab
        ShortCut = 8201
      end
      item
        Command = ecContextHelp
        ShortCut = 16496
      end
      item
        Command = ecSelectAll
        ShortCut = 16449
      end
      item
        Command = ecCopy
        ShortCut = 16451
      end
      item
        Command = ecPaste
        ShortCut = 16470
      end
      item
        Command = ecCut
        ShortCut = 16472
      end
      item
        Command = ecBlockIndent
        ShortCut = 24649
      end
      item
        Command = ecBlockUnindent
        ShortCut = 24661
      end
      item
        Command = ecLineBreak
        ShortCut = 16461
      end
      item
        Command = ecInsertLine
        ShortCut = 16462
      end
      item
        Command = ecDeleteWord
        ShortCut = 16468
      end
      item
        Command = ecDeleteLine
        ShortCut = 16473
      end
      item
        Command = ecDeleteEOL
        ShortCut = 24665
      end
      item
        Command = ecUndo
        ShortCut = 16474
      end
      item
        Command = ecRedo
        ShortCut = 24666
      end
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
      end
      item
        Command = ecNormalSelect
        ShortCut = 24654
      end
      item
        Command = ecColumnSelect
        ShortCut = 24643
      end
      item
        Command = ecLineSelect
        ShortCut = 24652
      end
      item
        Command = ecMatchBracket
        ShortCut = 24642
      end>
    MaxLeftChar = 32767
    MaxUndo = 32767
    Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceHomeKey, eoGroupUndo, eoScrollPastEof, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
    TabWidth = 1
    WantTabs = True
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 415
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
    SizeGrip = False
  end
  object FormStorage: TFormStorage
    Options = [fpPosition]
    StoredValues = <>
    Left = 48
    Top = 48
  end
  object SynEditPrint1: TSynEditPrint
    Copies = 1
    Header.DefaultFont.Charset = DEFAULT_CHARSET
    Header.DefaultFont.Color = clBlack
    Header.DefaultFont.Height = -13
    Header.DefaultFont.Name = 'Arial'
    Header.DefaultFont.Style = []
    Footer.DefaultFont.Charset = DEFAULT_CHARSET
    Footer.DefaultFont.Color = clBlack
    Footer.DefaultFont.Height = -13
    Footer.DefaultFont.Name = 'Arial'
    Footer.DefaultFont.Style = []
    Margins.Left = 25
    Margins.Right = 15
    Margins.Top = 25
    Margins.Bottom = 25
    Margins.Header = 15
    Margins.Footer = 15
    Margins.LeftHFTextIndent = 2
    Margins.RightHFTextIndent = 2
    Margins.HFInternalMargin = 0.5
    Margins.MirrorMargins = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabWidth = 8
    Color = clWhite
    Left = 88
    Top = 48
  end
  object MainMenu: TMainMenu
    Left = 408
    Top = 136
    object mFile: TMenuItem
      Caption = 'File'
      object mFileNew: TMenuItem
        Caption = 'New'
        ShortCut = 16462
        OnClick = mFileNewClick
      end
      object NewFromClipboard1: TMenuItem
        Caption = 'New From Clipboard'
        ShortCut = 24654
        OnClick = NewFromClipboard1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mFileOpen: TMenuItem
        Caption = 'Open'
        ShortCut = 16463
        OnClick = mFileOpenClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mFileSave: TMenuItem
        Caption = 'Save'
        ShortCut = 16467
        OnClick = mFileSaveClick
      end
      object mSaveAs: TMenuItem
        Caption = 'Save as'
        ShortCut = 24659
        OnClick = mSaveAsClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mClose: TMenuItem
        Caption = 'Close'
        ShortCut = 32883
        OnClick = mCloseClick
      end
    end
    object mEdit: TMenuItem
      Caption = 'Edit'
      object mEditUndo: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
        OnClick = mEditUndoClick
      end
      object mEditRedo: TMenuItem
        Caption = 'Redo'
        ShortCut = 24666
        OnClick = mEditRedoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mEditCut: TMenuItem
        Caption = 'Cut'
        ShortCut = 16472
        OnClick = mEditCutClick
      end
      object mEditCopy: TMenuItem
        Caption = 'Copy'
        ShortCut = 16451
        OnClick = mEditCopyClick
      end
      object mEditPaste: TMenuItem
        Caption = 'Paste'
        ShortCut = 16470
        OnClick = mEditPasteClick
      end
      object mEditSelectAll: TMenuItem
        Caption = 'Select All'
        ShortCut = 16449
        OnClick = mEditSelectAllClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mEditFind: TMenuItem
        Caption = 'Find'
        ShortCut = 16454
        OnClick = mEditFindClick
      end
      object mEditFindNext: TMenuItem
        Caption = 'Find Next'
        ShortCut = 114
        OnClick = mEditFindNextClick
      end
      object mEditReplace: TMenuItem
        Caption = 'Replace'
        ShortCut = 16466
        OnClick = mEditReplaceClick
      end
      object mEditIncrementalSearch: TMenuItem
        Caption = 'Incremental Search'
        ShortCut = 16453
        OnClick = mEditIncrementalSearchClick
      end
      object mEditGotoLine: TMenuItem
        Caption = 'Go to line'
        ShortCut = 16455
        OnClick = mEditGotoLineClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mEditDateTime: TMenuItem
        Caption = 'Date/Time'
        ShortCut = 116
        OnClick = mEditDateTimeClick
      end
    end
    object mSyntax: TMenuItem
      Caption = 'Syntax'
    end
  end
  object SynUniSyn: TSynUniSyn
    Left = 360
    Top = 80
  end
  object SaveDialog: TSaveDialog
    Left = 200
    Top = 64
  end
  object OpenDialog: TOpenDialog
    Left = 128
    Top = 104
  end
end
