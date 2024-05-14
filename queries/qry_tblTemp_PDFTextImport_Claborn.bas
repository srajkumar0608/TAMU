Operation =1
Option =0
Begin InputTables
    Name ="tblTemp_PDFTextImport_Claborn"
End
Begin OutputColumns
    Expression ="tblTemp_PDFTextImport_Claborn.ID"
    Alias ="Field1"
    Expression ="tblTemp_PDFTextImport_Claborn.F1"
    Alias ="FindStateLine"
    Expression ="InStr(1,[F1],\"NPIP:\")"
    Alias ="FindFirstSpace"
    Expression ="IIf([FindStateLine]>0,InStr(1,[F1],\" \"))"
    Alias ="FindSecondSpace"
    Expression ="IIf([FindFirstSpace]>0,InStr([FindFirstSpace]+1,[F1],\" \"))"
    Alias ="FindThirdSpace"
    Expression ="IIf([FindFirstSpace]>0,InStr([FindSecondSpace]+1,[F1],\" \"))"
    Alias ="State"
    Expression ="IIf([FindSecondSpace]>1,Mid([F1],[FindSecondSpace]+1,([FindPage]-[FindSecondSpac"
        "e])-2))"
    Alias ="FindPage"
    Expression ="InStr(1,[F1],\"Page:\")"
    Alias ="PageNumber"
    Expression ="Mid([F1],[FindPage]+5,Len([F1])-([FindPage]))"
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
        dbText "Name" ="FindThirdSpace"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FindsecondSpace"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="tblTemp_PDFTextImport_Claborn.ID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FindStateLine"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FindFirstSpace"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="State"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Field1"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="9840"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="PageNumber"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FindPage"
        dbInteger "ColumnWidth" ="2070"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1612
    Bottom =845
    Left =-1
    Top =-1
    Right =1550
    Bottom =343
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =349
        Bottom =156
        Top =0
        Name ="tblTemp_PDFTextImport_Claborn"
        Name =""
    End
End
