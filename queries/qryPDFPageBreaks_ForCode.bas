Operation =1
Option =0
Where ="(((qry_tblTemp_PDFTextImport.Field1) Like \"*Page:*\")) OR (((tblStates.StateNam"
    "e) Is Not Null)) OR (((qry_tblTemp_PDFTextImport.Field2) Like \"*Page:*\")) OR ("
    "((qry_tblTemp_PDFTextImport.Field3) Like \"*Page:*\"))"
Begin InputTables
    Name ="tblStates"
    Name ="qry_tblTemp_PDFTextImport"
End
Begin OutputColumns
    Expression ="qry_tblTemp_PDFTextImport.ID"
    Expression ="qry_tblTemp_PDFTextImport.Field1"
    Expression ="qry_tblTemp_PDFTextImport.Field2"
    Expression ="qry_tblTemp_PDFTextImport.Field3"
    Expression ="tblStates.StateName"
    Expression ="tblStates.FileName"
    Expression ="tblStates.StateID"
End
Begin Joins
    LeftTable ="qry_tblTemp_PDFTextImport"
    RightTable ="tblStates"
    Expression ="qry_tblTemp_PDFTextImport.Field1 = tblStates.StateName"
    Flag =2
End
Begin OrderBy
    Expression ="qry_tblTemp_PDFTextImport.ID"
    Flag =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="tblStates.StateName"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblStates.FileName"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblStates.StateID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblTemp_PDFTextImport.Field1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblTemp_PDFTextImport.ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblTemp_PDFTextImport.Field3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblTemp_PDFTextImport.Field2"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =663
    Top =24
    Right =1408
    Bottom =480
    Left =-1
    Top =-1
    Right =721
    Bottom =55
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =459
        Top =40
        Right =603
        Bottom =184
        Top =0
        Name ="tblStates"
        Name =""
    End
    Begin
        Left =42
        Top =19
        Right =186
        Bottom =163
        Top =0
        Name ="qry_tblTemp_PDFTextImport"
        Name =""
    End
End
