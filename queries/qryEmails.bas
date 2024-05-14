Operation =1
Option =0
Where ="(((qry_tblStates.FileName) Is Not Null)) OR (((qry_tblStates.FileName_Claborn) I"
    "s Not Null))"
Begin InputTables
    Name ="qry_tblStates_Email"
    Name ="qry_tblStates"
End
Begin OutputColumns
    Expression ="qry_tblStates_Email.StateEmailIDs"
    Expression ="qry_tblStates_Email.State"
    Expression ="qry_tblStates_Email.ToEmailAddress"
    Expression ="qry_tblStates_Email.CCEmailAddress"
    Expression ="qry_tblStates_Email.EmailFrom"
    Expression ="qry_tblStates_Email.Subject"
    Expression ="qry_tblStates_Email.NameForEmail"
    Expression ="qry_tblStates.StateName"
    Expression ="qry_tblStates.FileName"
    Expression ="qry_tblStates.FileName_Claborn"
    Expression ="qry_tblStates.StateID"
End
Begin Joins
    LeftTable ="qry_tblStates_Email"
    RightTable ="qry_tblStates"
    Expression ="qry_tblStates_Email.State = qry_tblStates.StateID"
    Flag =1
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
dbInteger "RowHeight" ="345"
Begin
    Begin
        dbText "Name" ="qry_tblStates_Email.Subject"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.NameForEmail"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.StateEmailIDs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates.StateName"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.ToEmailAddress"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="qry_tblStates_Email.State"
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
        dbText "Name" ="qry_tblStates.FileName"
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
    Left =42
    Top =34
    Right =1335
    Bottom =579
    Left =-1
    Top =-1
    Right =1275
    Bottom =132
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =247
        Bottom =194
        Top =0
        Name ="qry_tblStates_Email"
        Name =""
    End
    Begin
        Left =514
        Top =10
        Right =658
        Bottom =154
        Top =0
        Name ="qry_tblStates"
        Name =""
    End
End
