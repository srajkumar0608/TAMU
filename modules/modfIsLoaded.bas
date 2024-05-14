Attribute VB_Name = "modfIsLoaded"
Option Compare Database
Option Explicit

Function fIsLoaded(ByVal strFormName As String) As Integer
'Returns a 0 if form is not open or a -1 if Open
    If SysCmd(acSysCmdGetObjectState, acForm, strFormName) <> 0 Then
        If Forms(strFormName).CurrentView <> 0 Then
            fIsLoaded = True
        End If
    End If
End Function
