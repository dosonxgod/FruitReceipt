object mainScreen: TmainScreen
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1105#1084' '#1087#1086#1089#1090#1072#1074#1086#1082
  ClientHeight = 309
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lAdd: TLabel
    Left = 296
    Top = 8
    Width = 96
    Height = 15
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
  end
  object btAcceptReceipt: TButton
    Left = 8
    Top = 8
    Width = 265
    Height = 65
    Caption = #1055#1088#1080#1085#1103#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091
    TabOrder = 0
    OnClick = btAcceptReceiptClick
  end
  object btAddNewProvider: TButton
    Left = 8
    Top = 150
    Width = 265
    Height = 65
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
    TabOrder = 1
    OnClick = btAddNewProviderClick
  end
  object btAddNewProduct: TButton
    Left = 8
    Top = 79
    Width = 265
    Height = 65
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1088#1086#1076#1091#1082#1090
    TabOrder = 2
    OnClick = btAddNewProductClick
  end
  object btAdd: TButton
    Left = 296
    Top = 96
    Width = 127
    Height = 31
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = btAddClick
  end
  object eAdd: TEdit
    Left = 296
    Top = 29
    Width = 431
    Height = 23
    TabOrder = 4
  end
  object btReport: TButton
    Left = 8
    Top = 221
    Width = 265
    Height = 65
    Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1086#1090#1095#1105#1090
    TabOrder = 5
    OnClick = btReportClick
  end
  object liTypes: TComboBox
    Left = 296
    Top = 58
    Width = 145
    Height = 23
    TabOrder = 6
  end
end
