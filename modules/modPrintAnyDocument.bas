Attribute VB_Name = "modPrintAnyDocument"
Option Compare Database
Option Explicit

'Written by Andrew Fergus
'set a reference to Windows Script Host Object Model
'
' agpuzon
' added x64 support
'
#If Win64 Then
Private Declare PtrSafe Sub Sleep Lib "kernel32" _
    (ByVal dwMilliseconds As Long)

Private Declare PtrSafe Function ShellExecute Lib _
    "shell32.dll" Alias "ShellExecuteA" _
        (ByVal hwnd As LongPtr, _
        ByVal lpOperation As String, _
        ByVal lpFile As String, _
        ByVal lpParameters As String, _
        ByVal lpDirectory As String, _
        ByVal nShowCmd As Long) As LongPtr
#Else
'Private Declare Sub Sleep Lib "kernel32" _
'    (ByVal dwMilliseconds As Long)

'Private Declare Function ShellExecute Lib _
'    "shell32.dll" Alias "ShellExecuteA" _
'        (ByVal hwnd As Long, _
'        ByVal lpOperation As String, _
'        ByVal lpFile As String, _
'        ByVal lpParameters As String, _
'        ByVal lpDirectory As String, _
        ByVal nShowCmd As Long) As Long
#End If
Const SW_SHOWNORMAL = 1

Public Sub PrintAnyDocument(strPathAndFileNamePlusExtension As String)

Dim dfltPrinter As String
Dim newPrinter As Object

    ' Create a new WshNetwork object to access network properties.
    Set newPrinter = CreateObject("WScript.Network")
    'Get the name of the default printer
    dfltPrinter = Printer.DeviceName

    Forms![frmFillPDF]!txtDefaultPrinter = dfltPrinter

    'Set the default to the new printer
    'USE YOUR ACTUAL PRINTER NAME BELOW
    newPrinter.SetDefaultPrinter ("Adobe PDF")

    'Pause
    'Sleep 100

    'Print the pdf document
    'USE YOUR ACTUAL DOCUMENT NAME & PATH BELOW
    Call ShellExecute(0, "print", strPathAndFileNamePlusExtension, "", 0, SW_SHOWNORMAL)

    'Pause
    'Sleep 2000 'wait for 2 seconds - increase this if the code doesn't appear to work

    'Pause
    'Sleep 100

    'Set the printer back to the original default
    'newPrinter.SetDefaultPrinter (dfltPrinter)

End Sub
