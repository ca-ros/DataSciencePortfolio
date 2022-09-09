Attribute VB_Name = "newtables"
Sub newtables()
Attribute newtables.VB_ProcData.VB_Invoke_Func = " \n14"
'
' newtables Macro
'

'
    ActiveSheet.Range("$A$1:$F" & Range("A" & Rows.Count).End(xlUp).Row).AutoFilter Field:=5, Criteria1:="missing"
    Range("A:A,B:B").Select
    Range("B1").Activate
    Selection.Copy
    Sheets.Add After:=ActiveSheet
    ActiveSheet.Paste
    Application.CutCopyMode = False
    Columns("A:A").ColumnWidth = 36.43
    Columns("B:B").ColumnWidth = 33.14
    ActiveSheet.Name = "missing_stations"
    Range("A1").Select
    Sheets("trips_stations").Select
    ActiveSheet.Range("$A$1:$F" & Range("A" & Rows.Count).End(xlUp).Row).AutoFilter Field:=5, Criteria1:="=both", _
        Operator:=xlOr, Criteria2:="=id"
    Range("B:B,C:C").Select
    Range("C1").Activate
    Selection.Copy
    Sheets.Add After:=ActiveSheet
    ActiveSheet.Paste
    Application.CutCopyMode = False
    Columns("A:A").ColumnWidth = 36.43
    Columns("B:B").ColumnWidth = 33.14
    ActiveSheet.Name = "id_changes"
    Range("A1").Select
    Sheets("trips_stations").Select
    ActiveSheet.Range("$A$1:$F" & Range("A" & Rows.Count).End(xlUp).Row).AutoFilter Field:=5, Criteria1:="=both", _
        Operator:=xlOr, Criteria2:="=name"
    Range("B:B,D:D").Select
    Range("D1").Activate
    Selection.Copy
    Sheets.Add After:=ActiveSheet
    ActiveSheet.Paste
    Application.CutCopyMode = False
    Columns("A:A").ColumnWidth = 36.43
    Columns("B:B").ColumnWidth = 33.14
    ActiveSheet.Name = "name_changes"
    Range("A1").Select
    Sheets("trips_stations").Select
    Range("A1").Select
    ActiveSheet.Range("$A$1:$F$164").AutoFilter Field:=5
End Sub
