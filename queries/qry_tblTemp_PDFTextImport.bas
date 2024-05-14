Operation =1
Option =0
Begin InputTables
    Name ="tblTemp_PDFTextImport"
End
Begin OutputColumns
    Expression ="tblTemp_PDFTextImport.ID"
    Alias ="Field1"
    Expression ="tblTemp_PDFTextImport.F1"
    Alias ="Field2"
    Expression ="tblTemp_PDFTextImport.F2"
    Alias ="Field3"
    Expression ="tblTemp_PDFTextImport.F3"
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
        dbText "Name" ="Field2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Field1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTemp_PDFTextImport.ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Field3"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1683
    Bottom =862
    Left =-1
    Top =-1
    Right =1621
    Bottom =407
    Left =32
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="tblTemp_PDFTextImport"
        Name =""
    End
End
