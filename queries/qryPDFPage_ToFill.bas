Operation =1
Option =0
Where ="(((qry_tblTemp_PDFTextImport.Field1) Like \"*(NPIP Contact Representative)*\"))"
Begin InputTables
    Name ="qry_tblTemp_PDFTextImport"
End
Begin OutputColumns
    Expression ="qry_tblTemp_PDFTextImport.ID"
    Expression ="qry_tblTemp_PDFTextImport.Field1"
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
        dbText "Name" ="qry_tblTemp_PDFTextImport.ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblTemp_PDFTextImport.Field1"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =427
    Top =56
    Right =1642
    Bottom =771
    Left =-1
    Top =-1
    Right =1197
    Bottom =290
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =22
        Top =6
        Right =301
        Bottom =150
        Top =0
        Name ="qry_tblTemp_PDFTextImport"
        Name =""
    End
End
