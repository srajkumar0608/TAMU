Operation =1
Option =0
Begin InputTables
    Name ="qry_tblStates_Email"
End
Begin OutputColumns
    Expression ="qry_tblStates_Email.State"
    Expression ="qry_tblStates_Email.ToEmailAddress"
    Expression ="qry_tblStates_Email.CCEmailAddress"
    Expression ="qry_tblStates_Email.EmailFrom"
    Expression ="qry_tblStates_Email.Subject"
    Expression ="qry_tblStates_Email.NameForEmail"
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
        dbText "Name" ="qry_tblStates_Email.State"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.NameForEmail"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.ToEmailAddress"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.EmailFrom"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.CCEmailAddress"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.Subject"
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
    Right =1615
    Bottom =407
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="qry_tblStates_Email"
        Name =""
    End
End
