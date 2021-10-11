object Form5: TForm5
  Left = 234
  Top = 183
  Width = 487
  Height = 150
  Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072' '#1087#1086#1076#1086#1078#1076#1080#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 169
    Height = 16
    Caption = #1048#1076#1105#1090' '#1086#1073#1088#1072#1073#1086#1090#1082#1072' '#1092#1072#1081#1083#1086#1074'...'
    Transparent = True
  end
  object Label2: TLabel
    Left = 118
    Top = 30
    Width = 95
    Height = 16
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1092#1072#1081#1083
    Transparent = True
  end
  object Label3: TLabel
    Left = 118
    Top = 59
    Width = 346
    Height = 16
    AutoSize = False
    Transparent = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 103
    Width = 479
    Height = 19
    Panels = <>
  end
  object Animate1: TAnimate
    Left = 10
    Top = 30
    Width = 98
    Height = 61
    CommonAVI = aviFindFolder
    StopFrame = 29
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 168
    Top = 8
  end
end
