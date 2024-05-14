Operation =1
Option =0
Where ="(((qry_tblTemp_PDFTextImport_Claborn.Field1) Like \"*NPIP:*\"))"
Begin InputTables
    Name ="qry_tblTemp_PDFTextImport_Claborn"
End
Begin OutputColumns
    Expression ="qry_tblTemp_PDFTextImport_Claborn.ID"
    Expression ="qry_tblTemp_PDFTextImport_Claborn.Field1"
End
Begin OrderBy
    Expression ="qry_tblTemp_PDFTextImport_Claborn.ID"
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
        dbText "Name" ="qry_tblTemp_PDFTextImport_Claborn.Field1"
        dbInteger "ColumnWidth" ="3540"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblTemp_PDFTextImport_Claborn.ID"
        dbLong "AggregateType" ="-1"
    End
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
    Left =174
    Top =57
    Right =1389
    Bottom =772
    Left =-1
    Top =-1
    Right =1197
    Bottom =341
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =24
        Top =15
        Right =365
        Bottom =159
        Top =0
        Name ="qry_tblTemp_PDFTextImport_Claborn"
        Name =""
    End
End
