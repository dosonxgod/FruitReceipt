object Report: TReport
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1095#1105#1090#1072
  ClientHeight = 593
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lData: TLabel
    Left = 352
    Top = 0
    Width = 152
    Height = 15
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1095#1105#1090#1072
  end
  object lStart: TLabel
    Left = 209
    Top = 24
    Width = 12
    Height = 15
    Caption = #1086#1090
  end
  object lEnd: TLabel
    Left = 433
    Top = 24
    Width = 13
    Height = 15
    Caption = #1076#1086
  end
  object frxPreview1: TfrxPreview
    AlignWithMargins = True
    Left = 3
    Top = 120
    Width = 804
    Height = 470
    Margins.Top = 120
    Align = alClient
    OutlineVisible = False
    OutlineWidth = 120
    ThumbnailVisible = False
    FindFmVisible = False
    UseReportHints = True
    OutlineTreeSortType = dtsUnsorted
    HideScrolls = False
  end
  object eStart: TEdit
    Left = 240
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object eEnd: TEdit
    Left = 464
    Top = 21
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object btGo: TButton
    Left = 336
    Top = 72
    Width = 168
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1090#1095#1105#1090
    TabOrder = 3
    OnClick = btGoClick
  end
  object frxReport1: TfrxReport
    Version = '2024.2.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    Preview = frxPreview1
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45488.129559652780000000
    ReportOptions.LastChange = 45488.129845694440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 408
    Top = 248
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 257.008033880000000000
          Top = -3.779530330000000000
          Width = 359.055328370000000000
          Height = 22.677180290000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #1054#1090#1095#1105#1090' '#1087#1086' '#1087#1086#1089#1090#1072#1074#1082#1072#1084' ')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530048370361000
          Top = 3.779533261718750000
          Width = 128.504024028778100000
          Height = 15.118118286132810000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Provider"]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401672360000000000
          Top = 3.779529880000000000
          Width = 181.417425390000000000
          Height = 22.677177430000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Product_Name"]')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937239790000000000
          Top = 3.779533260000000000
          Width = 98.267797540000000000
          Height = 15.118118290000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Total_Price"]')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559369340000000000
          Top = 3.779533260000000000
          Width = 139.842606410000000000
          Height = 15.118118290000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Total_weight"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530050000000000
          Top = 3.779533260000000000
          Width = 128.504026560000000000
          Height = 22.677174900000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            #1055#1086#1089#1090#1072#1074#1097#1080#1082)
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401672360000000000
          Top = 3.779533260000000000
          Width = 185.196960450000000000
          Height = 26.456710820000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            #1055#1088#1086#1076#1091#1082#1090)
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937225341796900000
          Top = 7.559059018554688000
          Width = 102.047302246093800000
          Height = 26.456710815429690000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072)
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559376190000000000
          Top = 7.559059020000000000
          Width = 154.960693360000000000
          Height = 22.677185060000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Memo.UTF8W = (
            #1054#1073#1097#1080#1081' '#1074#1077#1089)
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 256
    Top = 248
  end
end
