Operation =1
Option =0
Where ="(((qry_tblTemp_PDFTextImport_Claborn.Field1) Like \"NPIP:*\")) OR (((qry_tblStat"
    "es.StateName) Is Not Null))"
Begin InputTables
    Name ="qry_tblTemp_PDFTextImport_Claborn"
    Name ="qry_tblStates"
End
Begin OutputColumns
    Expression ="qry_tblTemp_PDFTextImport_Claborn.ID"
    Expression ="qry_tblTemp_PDFTextImport_Claborn.Field1"
    Alias ="PageNumber"
    Expression ="CInt([qry_tblTemp_PDFTextImport_Claborn].[PageNumber])"
    Expression ="qry_tblStates.StateName"
    Expression ="qry_tblStates.FileName_Claborn"
    Expression ="qry_tblStates.StateID"
End
Begin Joins
    LeftTable ="qry_tblTemp_PDFTextImport_Claborn"
    RightTable ="qry_tblStates"
    Expression ="qry_tblTemp_PDFTextImport_Claborn.State = qry_tblStates.StateName"
    Flag =1
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
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3540"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="qry_tblStates.StateID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblTemp_PDFTextImport_Claborn.ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates.StateName"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates.FileName_Claborn"
        dbInteger "ColumnWidth" ="2145"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PageNumber"
        dbInteger "ColumnWidth" ="1635"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =165
    Top =222
    Right =1468
    Bottom =678
    Left =-1
    Top =-1
    Right =1285
    Bottom =136
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =171
        Top =10
        Right =412
        Bottom =154
        Top =0
        Name ="qry_tblTemp_PDFTextImport_Claborn"
        Name =""
    End
    Begin
        Left =960
        Top =9
        Right =1104
        Bottom =153
        Top =0
        Name ="qry_tblStates"
        Name =""
    End
End
