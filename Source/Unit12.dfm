object Form12: TForm12
  Left = 310
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Propri'#233't'#233's'
  ClientHeight = 336
  ClientWidth = 302
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
    Top = 317
    Width = 302
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 302
    Height = 317
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'G'#233'n'#233'rales'
      object ListView1: TListView
        Left = 0
        Top = 0
        Width = 294
        Height = 289
        Align = alClient
        BorderStyle = bsNone
        Columns = <
          item
            Caption = 'Informations'
            Width = 160
          end
          item
            Alignment = taCenter
            Caption = 'Valeurs'
            Width = 130
          end>
        GridLines = True
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Mots'
      ImageIndex = 1
      object ListView2: TListView
        Left = 0
        Top = 0
        Width = 294
        Height = 289
        Align = alClient
        BorderStyle = bsNone
        Columns = <
          item
            AutoSize = True
            Caption = 'Mots'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'Occurence'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'Fr'#233'quence'
          end>
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
end
