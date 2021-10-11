object Form2: TForm2
  Left = 239
  Top = 132
  Width = 466
  Height = 270
  AutoSize = True
  Caption = #1057#1078#1072#1090#1100' '#1092#1072#1081#1083#1099
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
  object Bevel1: TBevel
    Left = 0
    Top = 194
    Width = 458
    Height = 48
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 200
    Width = 374
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 458
    Height = 188
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1079#1074#1091#1082#1072
    TabOrder = 1
    object RadioGroup1: TRadioGroup
      Left = 15
      Top = 122
      Width = 429
      Height = 58
      Caption = #1056#1077#1078#1080#1084
      TabOrder = 0
    end
    object RadioButton3: TRadioButton
      Left = 167
      Top = 148
      Width = 139
      Height = 21
      Caption = #1057#1090#1077#1088#1077#1086' (2 '#1082#1072#1085#1072#1083#1072')'
      TabOrder = 1
    end
    object RadioButton4: TRadioButton
      Left = 315
      Top = 148
      Width = 119
      Height = 21
      Caption = #1052#1086#1085#1086' (1 '#1082#1072#1085#1072#1083')'
      TabOrder = 2
    end
    object RadioButton5: TRadioButton
      Left = 30
      Top = 148
      Width = 129
      Height = 21
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 20
      Width = 429
      Height = 99
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1072#1095#1077#1089#1090#1074#1086
      TabOrder = 4
      object Label2: TLabel
        Left = 367
        Top = 33
        Width = 30
        Height = 16
        Caption = 'kbps'
      end
      object ComboBox1: TComboBox
        Left = 12
        Top = 49
        Width = 197
        Height = 24
        ItemHeight = 16
        ItemIndex = 3
        TabOrder = 0
        Text = #1057#1090#1091#1076#1080#1103' (256 - KGPS)'
        Items.Strings = (
          'HI-FI (160 - KGPS)'
          'FM/'#1056#1072#1076#1080#1086'/'#1040#1091#1076#1080#1086' '#1050#1072#1089#1077#1090#1072' (112 - KGPS)'
          'CD-'#1076#1080#1089#1082' (192 - KGPS)'
          #1057#1090#1091#1076#1080#1103' (256 - KGPS)'
          #1058#1077#1083#1077#1092#1086#1085' (16 - KGPS)'
          #1058#1077#1083#1077#1092#1086#1085' + (24 - KGPS)'
          #1043#1086#1083#1086#1089' (56 - KGPS)'
          #1057#1090#1072#1085#1076#1072#1088#1090' MW-US (40 KGPS)')
      end
      object RadioButton1: TRadioButton
        Left = 12
        Top = 20
        Width = 138
        Height = 21
        Caption = #1043#1086#1090#1086#1074#1099#1077
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 236
        Top = 20
        Width = 100
        Height = 21
        Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077
        TabOrder = 2
        OnClick = RadioButton2Click
      end
      object ComboBox2: TComboBox
        Left = 236
        Top = 49
        Width = 179
        Height = 24
        Enabled = False
        ItemHeight = 16
        ItemIndex = 4
        TabOrder = 3
        Text = '80kbit 32000Hz'
        Items.Strings = (
          '32kbit 11025Hz'
          '40kbit 16000HZ'
          '56kbit 22050Hz'
          '64kbit 22050Hz'
          '80kbit 32000Hz'
          '96kbit 32000Hz'
          '112kbit 44100Hz'
          '128kbit 44100Hz'
          '160kbit 44100Hz'
          '192kbit 44100Hz'
          '224kbit 44100Hz'
          '256kbit 44100Hz')
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 258
    Top = 203
    Width = 93
    Height = 31
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 357
    Top = 203
    Width = 92
    Height = 31
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 10
    Top = 204
    Width = 178
    Height = 31
    Caption = '&'#1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1083#1103' MP3'
    TabOrder = 4
    OnClick = BitBtn3Click
    Kind = bkRetry
  end
end
