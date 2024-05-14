Operation =1
Option =0
Begin InputTables
    Name ="qry_tblStates"
End
Begin OutputColumns
    Expression ="qry_tblStates.StateID"
    Expression ="qry_tblStates.StateName"
    Expression ="qry_tblStates.FileName_Claborn"
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
        dbText "Name" ="qry_tblStates.StateName"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates.StateID"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates.FileName_Claborn"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =168
    Top =167
    Right =1567
    Bottom =561
    Left =-1
    Top =-1
    Right =1381
    Bottom =155
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="qry_tblStates"
        Name =""
    End
End
