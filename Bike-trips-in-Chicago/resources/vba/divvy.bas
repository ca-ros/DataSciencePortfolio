Attribute VB_Name = "divvy"
Sub divvy()
'
' divvy Macro
'
' Keyboard Shortcut: Ctrl+Shift+Y
'
    ActiveSheet.Name = "trips_stations"
    Range("A1").Value = "old_id"
    Range("B1").Value = "old_name"
    Range("C1").Value = "new_id"
    Range("D1").Value = "new_name"
    Range("E1").Value = "changes"
    Range("F1").Value = "verified"
    ActiveWorkbook.Queries.Add Name:="Stations", Formula:= _
        "let" & Chr(13) & "" & Chr(10) & "    Source = Csv.Document(File.Contents(""C:\Users\Chris\Documents\GitHub\divvy-bikeshare\data wrangling\csv files\stations_cleaning\Stations.csv""),[Delimiter="","", Columns=7, Encoding=1252, QuoteStyle=QuoteStyle.None])," & Chr(13) & "" & Chr(10) & "    #""Change Type"" = Table.TransformColumnTypes(Source,{{""Column1"", type text}, {""Column2"", type text}, {""Column3"", type text}, {""" & _
        "Column4"", type text}, {""Column5"", type text}, {""Column6"", type text}, {""Column7"", type text}})" & Chr(13) & "" & Chr(10) & "in" & Chr(13) & "" & Chr(10) & "    #""Change Type"""
    ActiveWorkbook.Worksheets.Add
    With ActiveSheet.ListObjects.Add(SourceType:=0, Source:= _
        "OLEDB;Provider=Microsoft.Mashup.OleDb.1;Data Source=$Workbook$;Location=Stations;Extended Properties=""""" _
        , Destination:=Range("$A$1")).QueryTable
        .CommandType = xlCmdSql
        .CommandText = Array("SELECT * FROM [Stations]")
        .RowNumbers = False
        .FillAdjacentFormulas = False
        .PreserveFormatting = True
        .RefreshOnFileOpen = False
        .BackgroundQuery = True
        .RefreshStyle = xlInsertDeleteCells
        .SavePassword = False
        .SaveData = True
        .AdjustColumnWidth = True
        .RefreshPeriod = 0
        .PreserveColumnInfo = True
        .ListObject.DisplayName = "Stations"
        .Refresh BackgroundQuery:=False
    End With
    ActiveSheet.Name = "Stations"
    ActiveSheet.ListObjects("Stations").Unlist
    Application.CommandBars("Queries and Connections").Visible = False
    Rows("1:1").Select
    Selection.Delete Shift:=xlUp
    Cells.Style = "Normal"
    Rows("1:1").Font.Bold = True
    Columns("C:C").Select
    Selection.Insert Shift:=xlToRight, CopyOrigin:=xlFormatFromLeftOrAbove
    Columns("A:A").Copy
    Range("C1").Select
    ActiveSheet.Paste
    Application.CutCopyMode = False
    Range("A1").Select
    Columns("A:A").ColumnWidth = 13.43
    Columns("B:B").ColumnWidth = 34
    Columns("C:C").ColumnWidth = 8.57
    Rows("1:1").Select
    Selection.AutoFilter
    Sheets("trips_stations").Select
    Rows("1:1").Select
    Selection.Font.Bold = True
    With ActiveWindow
        .SplitColumn = 0
        .SplitRow = 1
    End With
    ActiveWindow.FreezePanes = True
    Selection.AutoFilter
    Columns("B:B").ColumnWidth = 36.14
    Columns("C:C").EntireColumn.AutoFit
    Columns("D:D").ColumnWidth = 34.29
    Columns("E:E").EntireColumn.AutoFit
    Columns("F:F").EntireColumn.AutoFit
    ActiveCell.FormulaR1C1 = "old_id"
    Range("C2").Select
    With Selection
        .Formula = "=IFNA(VLOOKUP(TEXT(B2,0),Stations!$B:$D,2,FALSE),""same"")"
        .AutoFill Destination:=Range("C2:C" & Range("A" & Rows.Count).End(xlUp).Row)
    End With
    Range(Selection, Selection.End(xlDown)).Select
    Range("D2").Select
    With Selection
        .Formula = "=IFNA(VLOOKUP(TEXT(A2,0),Stations!$A:$B,2,FALSE),""same"")"
        .AutoFill Destination:=Range("D2:D" & Range("A" & Rows.Count).End(xlUp).Row)
    End With
    Range(Selection, Selection.End(xlDown)).Select
    Range("E2").Select
    With Selection
        .Formula = "=IF(C2 = """", ""missing"", IF(AND(D2=""same"",C2=""same""),""missing"",IF(B2=D2,""same"",IF(AND(A2<>C2,D2=""same""),""id"",IF(AND(B2<>D2,C2=""same""),""name"",IF(AND(A2<>C2,B2<>D2),""both""))))))"
        .AutoFill Destination:=Range("E2:E" & Range("A" & Rows.Count).End(xlUp).Row)
    End With
    Range(Selection, Selection.End(xlDown)).Select
    Columns("A:A").Select
    Selection.FormatConditions.AddUniqueValues
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    Selection.FormatConditions(1).DupeUnique = xlDuplicate
    With Selection.FormatConditions(1).Font
        .Color = -16383844
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 13551615
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Columns("B:B").Select
    Selection.FormatConditions.AddUniqueValues
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    Selection.FormatConditions(1).DupeUnique = xlDuplicate
    With Selection.FormatConditions(1).Font
        .Color = -16383844
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 13551615
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Columns("F:F").Select
    Selection.FormatConditions.Add Type:=xlTextString, String:="y", _
        TextOperator:=xlContains
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Font
        .Color = -16752384
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 13561798
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Columns("C:C").Select
    Selection.FormatConditions.Add Type:=xlTextString, String:="same", _
        TextOperator:=xlContains
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Font
        .Color = -16752384
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 13561798
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Columns("D:D").Select
    Selection.FormatConditions.Add Type:=xlTextString, String:="same", _
        TextOperator:=xlContains
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Font
        .Color = -16752384
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 13561798
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Columns("E:E").Select
    Selection.FormatConditions.Add Type:=xlTextString, String:="missing", _
        TextOperator:=xlContains
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Font
        .Color = -16383844
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 13551615
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Selection.FormatConditions.Add Type:=xlTextString, String:="name", _
        TextOperator:=xlContains
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Font
        .Color = -16754788
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 10284031
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Selection.FormatConditions.Add Type:=xlTextString, String:="id", _
        TextOperator:=xlContains
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Font
        .Color = -16752384
        .TintAndShade = 0
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .Color = 13561798
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Columns("E:E").Select
    Selection.FormatConditions.Add Type:=xlTextString, String:="both", _
        TextOperator:=xlContains
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Font
        .ThemeColor = xlThemeColorAccent1
        .TintAndShade = -0.499984740745262
    End With
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorAccent1
        .TintAndShade = 0.399945066682943
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    Sheets("trips_stations").Move Before:=Sheets(1)
    Range("A1").Select
End Sub

