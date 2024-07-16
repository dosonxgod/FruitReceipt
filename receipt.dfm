object receiptScreen: TreceiptScreen
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1085#1103#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091
  ClientHeight = 416
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  StyleName = 'Tablet Dark'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lProvider: TLabel
    Left = 8
    Top = 8
    Width = 126
    Height = 15
    Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072':'
    StyleName = 'Tablet Dark'
  end
  object lProduct: TLabel
    Left = 8
    Top = 77
    Width = 103
    Height = 15
    Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1087#1088#1086#1076#1091#1082#1090':'
  end
  object lWeight: TLabel
    Left = 8
    Top = 139
    Width = 70
    Height = 15
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1074#1077#1089':'
  end
  object lPrice: TLabel
    Left = 8
    Top = 200
    Width = 110
    Height = 15
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1089#1090#1086#1080#1084#1086#1089#1090#1100':'
  end
  object lJourName: TLabel
    Left = 480
    Top = 8
    Width = 196
    Height = 15
    Caption = #1046#1059#1056#1053#1040#1051' '#1044#1054#1041#1040#1042#1051#1045#1053#1053#1067#1061' '#1058#1054#1042#1040#1056#1054#1042
  end
  object lHandText: TLabel
    Left = 8
    Top = 251
    Width = 120
    Height = 15
    Caption = #1048#1083#1080' '#1074#1074#1077#1076#1080#1090#1077' '#1074#1088#1091#1095#1085#1091#1102
  end
  object eWeight: TEdit
    Left = 8
    Top = 160
    Width = 145
    Height = 23
    MaxLength = 10
    TabOrder = 0
    OnChange = eChange
  end
  object ePrice: TEdit
    Left = 8
    Top = 272
    Width = 145
    Height = 23
    MaxLength = 10
    TabOrder = 1
    OnChange = eChange
  end
  object btAccept: TButton
    Left = 583
    Top = 342
    Width = 274
    Height = 62
    Caption = #1055#1056#1048#1053#1071#1058#1068' '#1055#1054#1057#1058#1040#1042#1050#1059
    TabOrder = 2
    OnClick = btAcceptClick
  end
  object btAddProd: TButton
    Left = 8
    Top = 301
    Width = 241
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088' '#1074' '#1087#1086#1089#1090#1072#1074#1082#1091
    TabOrder = 3
    OnClick = btAddProdClick
  end
  object liProviders: TComboBox
    Left = 8
    Top = 29
    Width = 145
    Height = 23
    TabOrder = 4
    Text = 'liProviders'
  end
  object liProducts: TComboBox
    Left = 8
    Top = 98
    Width = 145
    Height = 23
    TabOrder = 5
    Text = 'liProviders'
  end
  object mTovarList: TMemo
    Left = 302
    Top = 29
    Width = 555
    Height = 297
    TabOrder = 6
  end
  object liPrice: TComboBox
    Left = 8
    Top = 221
    Width = 145
    Height = 23
    TabOrder = 7
    Text = #1042#1099#1073#1077#1088#1077#1090#1077' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    OnDropDown = liPriceDropDown
  end
end
