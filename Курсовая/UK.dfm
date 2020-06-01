object Form1: TForm1
  Left = 242
  Top = 141
  Width = 732
  Height = 503
  Caption = #1060#1091#1090#1073#1086#1083#1100#1085#1072#1103' '#1082#1086#1084#1072#1085#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelGoal: TLabel
    Left = 8
    Top = 416
    Width = 87
    Height = 19
    Caption = #1042#1089#1077#1075#1086' '#1075#1086#1083#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelNak: TLabel
    Left = 144
    Top = 416
    Width = 126
    Height = 19
    Caption = #1042#1089#1077#1075#1086' '#1085#1072#1088#1091#1096#1077#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelIgrok: TLabel
    Left = 320
    Top = 416
    Width = 104
    Height = 19
    Caption = #1042#1089#1077#1075#1086' '#1080#1075#1088#1086#1082#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SG: TStringGrid
    Left = 0
    Top = 0
    Width = 716
    Height = 409
    ColCount = 8
    DefaultColWidth = 88
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object EditGoal: TEdit
    Left = 104
    Top = 412
    Width = 33
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object EditNak: TEdit
    Left = 280
    Top = 413
    Width = 33
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EditIgrok: TEdit
    Left = 432
    Top = 413
    Width = 33
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 352
    object Rec: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082
      object App: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
        OnClick = AppClick
      end
      object Copy: TMenuItem
        Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
        OnClick = CopyClick
      end
      object DelEl: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
        OnClick = DelElClick
      end
      object Save: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
        OnClick = SaveClick
      end
    end
    object Help: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnClick = HelpClick
    end
  end
end
