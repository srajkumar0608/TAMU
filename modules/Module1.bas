Attribute VB_Name = "Module1"
' basShellExecute Module
Option Compare Database
Option Explicit

Public Const SW_HIDE = 0
Public Const SW_SHOWNORMAL = 1
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMAXIMIZED = 3
Public Const OP_OPEN = "Open"
Public Const OP_PRINT = "Print"


Declare PtrSafe Function ShellExecute& Lib "shell32.dll" Alias "ShellExecuteA" (ByVal _
hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal _
lpParameters As String, ByVal lpDirectory As String, ByVal nshowcm As Long)

Sub ShellToFile(strPath As String, _
            Optional strOperation As String = OP_OPEN, _
            Optional lngShow As Long = SW_SHOWNORMAL)

    Dim lngRetVal As Long
    Dim lngHwnd As Long

    lngHwnd = Application.hWndAccessApp

    lngRetVal = ShellExecute(lngHwnd, strOperation, strPath, _
        vbNullString, CurDir, lngShow)

    If lngRetVal <= 32 Then
        MsgBox "Unable to open file " & strPath, vbInformation, "Warning"
    End If

End Sub
' module ends
