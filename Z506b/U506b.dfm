object F506b: TF506b
  Left = 303
  Top = 169
  Width = 301
  Height = 216
  Caption = 'F506b'
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
    object MFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenTxtFile: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        OnClick = OpenTxtFileClick
      end
      object CloseTxtFile: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = CloseTxtFileClick
      end
    end
    object List: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082
      object Build: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        object BuildFromFile: TMenuItem
          Caption = #1048#1079' '#1092#1072#1081#1083#1072
          OnClick = BuildFromFileClick
        end
        object BuildList: TMenuItem
          Caption = #1042#1088#1091#1095#1085#1091#1102
          OnClick = BuildListClick
        end
      end
      object SaveList: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        object SaveListTxt: TMenuItem
          Caption = #1042' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
          OnClick = SaveListTxtClick
        end
        object SaveListTip: TMenuItem
          Caption = #1042' '#1090#1080#1087#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
          OnClick = SaveListTipClick
        end
      end
      object FindBag: TMenuItem
        Caption = #1053#1072#1081#1090#1080' '#1086#1090#1074#1077#1090' '#1076#1083#1103' '#1087#1077#1088#1074#1086#1075#1086' '#1091#1089#1083#1086#1074#1080#1103
        OnClick = FindBagClick
      end
      object FindBag2: TMenuItem
        Caption = #1053#1072#1081#1090#1080' '#1086#1090#1074#1077#1090' '#1076#1083#1103' '#1074#1090#1086#1088#1086#1075#1086' '#1091#1089#1083#1086#1074#1080#1103
        OnClick = FindBag2Click
      end
      object AddUzels: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090#1099
        OnClick = AddUzelsClick
      end
    end
    object Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100'...'
      object DeleteList: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082
        OnClick = DeleteListClick
      end
    end
    object Help: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnClick = HelpClick
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    Left = 24
  end
end
