Attribute VB_Name = "modDelete_Error_Tables"
Option Compare Database

'Delete Import Error tables

Function Delete_Error_Tables()
    Do Until IsNull(DLookup("Name", "Msysobjects", "Name like '*ImportErrors*'"))
        DoCmd.DeleteObject acTable, DLookup("Name", "Msysobjects", "Name like '*ImportErrors*'")
    Loop
End Function
