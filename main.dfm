object MainForm: TMainForm
  Left = 200
  Top = 104
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1043#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1076#1072#1082#1090#1086#1088' '
  ClientHeight = 600
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 105
    Width = 731
    Height = 470
    Align = alClient
    ExplicitLeft = -6
    ExplicitWidth = 911
    ExplicitHeight = 599
  end
  object Panel1: TPanel
    Left = 731
    Top = 105
    Width = 167
    Height = 470
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 14
      Width = 55
      Height = 13
      Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
    end
    object Label2: TLabel
      Left = 27
      Top = 150
      Width = 113
      Height = 13
      Caption = #1062#1074#1077#1090' '#1082#1086#1085#1090#1091#1088#1072' '#1092#1080#1075#1091#1088#1099
    end
    object Label3: TLabel
      Left = 48
      Top = 277
      Width = 70
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1092#1080#1075#1091#1088
    end
    object ListBox1: TListBox
      Left = 16
      Top = 296
      Width = 137
      Height = 159
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object ListBox2: TListBox
      Left = 24
      Top = 33
      Width = 121
      Height = 97
      ItemHeight = 13
      TabOrder = 1
      OnClick = ListBox2Click
    end
    object ListBox3: TListBox
      Left = 24
      Top = 174
      Width = 121
      Height = 97
      ItemHeight = 13
      TabOrder = 2
      OnClick = ListBox3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 898
    Height = 105
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 353
      Top = 13
      Width = 148
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1088#1072#1079#1084#1077#1088#1072
    end
    object Label5: TLabel
      Left = 560
      Top = 13
      Width = 204
      Height = 13
      Caption = #1042#1088#1072#1097#1077#1085#1080#1077' '#1092#1080#1075#1091#1088#1099' '#1086#1090' 1 '#1076#1086' 360 '#1075#1088#1072#1076#1091#1089#1086#1074
    end
    object Button5: TButton
      Left = 190
      Top = 32
      Width = 40
      Height = 40
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 236
      Top = 9
      Width = 40
      Height = 40
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 236
      Top = 55
      Width = 40
      Height = 40
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 282
      Top = 32
      Width = 40
      Height = 40
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button8Click
    end
    object TrackBar1: TTrackBar
      Left = 341
      Top = 32
      Width = 173
      Height = 25
      Min = 1
      Position = 1
      TabOrder = 4
    end
    object Button10: TButton
      Left = 439
      Top = 63
      Width = 75
      Height = 25
      Caption = #1059#1084#1077#1085#1100#1096#1080#1090#1100
      TabOrder = 5
      OnClick = Button10Click
    end
    object TrackBar2: TTrackBar
      Left = 536
      Top = 32
      Width = 241
      Height = 25
      Max = 360
      Frequency = 10
      Position = 1
      TabOrder = 6
      OnChange = TrackBar2Change
    end
    object Button11: TButton
      Left = 536
      Top = 63
      Width = 241
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1091#1102' '#1092#1080#1075#1091#1088#1091
      TabOrder = 7
      OnClick = Button11Click
    end
    object Button9: TButton
      Left = 341
      Top = 63
      Width = 75
      Height = 25
      Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100
      TabOrder = 8
      OnClick = Button9Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 575
    Width = 898
    Height = 25
    Align = alBottom
    TabOrder = 2
    object Label6: TLabel
      Left = 402
      Top = 6
      Width = 60
      Height = 13
      Caption = 'figure_name'
    end
    object Label7: TLabel
      Left = 8
      Top = 6
      Width = 79
      Height = 13
      Caption = #1055#1086#1079#1080#1094#1080#1103' (x, y): '
    end
    object Label8: TLabel
      Left = 88
      Top = 6
      Width = 31
      Height = 13
      Caption = 'Label8'
    end
    object Label9: TLabel
      Left = 142
      Top = 6
      Width = 42
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088': '
    end
    object Label10: TLabel
      Left = 190
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Label10'
    end
    object Label11: TLabel
      Left = 218
      Top = 6
      Width = 82
      Height = 13
      Caption = #1059#1075#1086#1083' '#1087#1086#1074#1086#1088#1086#1090#1072': '
    end
    object Label12: TLabel
      Left = 306
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Label12'
    end
    object Label13: TLabel
      Left = 341
      Top = 6
      Width = 55
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077': '
    end
  end
  object Panel4: TPanel
    Left = -1
    Top = 0
    Width = 185
    Height = 105
    TabOrder = 3
    object Button4: TButton
      Left = 95
      Top = 8
      Width = 81
      Height = 41
      Caption = #1058#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 8
      Top = 55
      Width = 81
      Height = 41
      Caption = #1047#1074#1077#1079#1076#1072
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 8
      Width = 81
      Height = 41
      Caption = #1050#1088#1091#1075
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 95
      Top = 55
      Width = 81
      Height = 41
      Caption = #1050#1074#1072#1076#1088#1072#1090
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object Button12: TButton
    Left = 783
    Top = 55
    Width = 104
    Height = 33
    Caption = #1043#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 783
    Top = 16
    Width = 104
    Height = 33
    Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    TabOrder = 5
    OnClick = Button13Click
  end
end
