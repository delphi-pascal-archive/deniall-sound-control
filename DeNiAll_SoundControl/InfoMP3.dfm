object Form4: TForm4
  Left = 279
  Top = 161
  Width = 390
  Height = 410
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1083#1103' MP3'
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
    Top = 363
    Width = 382
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 375
    Height = 316
    Caption = '&'#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 34
      Width = 66
      Height = 16
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label2: TLabel
      Left = 20
      Top = 74
      Width = 46
      Height = 16
      Caption = #1040#1088#1090#1080#1089#1090
    end
    object Label3: TLabel
      Left = 20
      Top = 116
      Width = 49
      Height = 16
      Caption = #1040#1083#1100#1073#1086#1084
    end
    object Label4: TLabel
      Left = 20
      Top = 158
      Width = 23
      Height = 16
      Caption = #1043#1086#1076
    end
    object Label5: TLabel
      Left = 138
      Top = 156
      Width = 37
      Height = 16
      Caption = #1046#1072#1085#1088
    end
    object Label6: TLabel
      Left = 20
      Top = 187
      Width = 80
      Height = 16
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Edit1: TEdit
      Left = 98
      Top = 30
      Width = 258
      Height = 21
      MaxLength = 30
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 98
      Top = 69
      Width = 258
      Height = 21
      MaxLength = 30
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 98
      Top = 108
      Width = 258
      Height = 21
      MaxLength = 30
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 59
      Top = 149
      Width = 70
      Height = 21
      MaxLength = 4
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 187
      Top = 148
      Width = 169
      Height = 21
      MaxLength = 30
      TabOrder = 4
    end
    object Memo1: TMemo
      Left = 20
      Top = 208
      Width = 337
      Height = 90
      Lines.Strings = (
        'DeNiAll SoundControl')
      MaxLength = 30
      TabOrder = 5
    end
  end
  object BitBtn1: TBitBtn
    Left = 177
    Top = 325
    Width = 93
    Height = 31
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 276
    Top = 325
    Width = 92
    Height = 31
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
