object Form1: TForm1
  Left = 179
  Top = 144
  Width = 619
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    object ZapMas: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1084#1072#1089#1089#1080#1074'...'
      object Hands: TMenuItem
        Caption = #1074#1088#1091#1095#1085#1091#1102
        OnClick = HandsClick
      end
      object Random: TMenuItem
        Caption = #1089#1083#1091#1095#1072#1081#1085#1086
        OnClick = RandomClick
      end
    end
    object Write: TMenuItem
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100'...'
      object WriteTxt: TMenuItem
        Caption = #1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
        OnClick = WriteTxtClick
      end
      object WriteType: TMenuItem
        Caption = #1074' '#1090#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
      end
    end
    object Result: TMenuItem
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      OnClick = ResultClick
    end
    object Open: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      object OpenTxt: TMenuItem
        Caption = #1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
        OnClick = OpenTxtClick
      end
      object OpenType: TMenuItem
        Caption = #1090#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
        OnClick = OpenTypeClick
      end
    end
    object Close: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100'...'
      object CloseTxt: TMenuItem
        Caption = #1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
        OnClick = CloseTxtClick
      end
      object CloseType: TMenuItem
        Caption = #1090#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
        OnClick = CloseTypeClick
      end
    end
    object Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1072#1089#1089#1080#1074
      OnClick = DeleteClick
    end
  end
  object OpenDialog1: TOpenDialog
    FileName = 'C:\Users\'#1071'\Desktop\'#1059#1095#1077#1073#1072'\'#1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077'\Z136E\T136E.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt|'#1058#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1092#1072#1081#1083'|*.bat'
    FilterIndex = 0
    Left = 32
  end
end
