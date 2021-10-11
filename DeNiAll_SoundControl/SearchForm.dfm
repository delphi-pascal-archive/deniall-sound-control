object Form3: TForm3
  Left = 281
  Top = 163
  Width = 291
  Height = 142
  AutoSize = True
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1092#1072#1081#1083#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object StatusBar1: TStatusBar
    Left = 0
    Top = 95
    Width = 232
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 283
    Height = 110
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1092#1072#1081#1083#1072' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 10
      Top = 26
      Width = 267
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = '*.*mp3'
      Items.Strings = (
        '*.*mp3'
        '*.*wav')
    end
    object BitBtn1: TBitBtn
      Left = 30
      Top = 65
      Width = 109
      Height = 31
      TabOrder = 1
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 143
      Top = 65
      Width = 109
      Height = 31
      TabOrder = 2
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
end
