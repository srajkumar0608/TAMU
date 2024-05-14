Attribute VB_Name = "modSendEmails_Outlook_StateID_Auto"
Option Compare Database


Function SendEmails_Outlook_StateID_Auto()
'Sub SendEmails_Outlook()

On Error GoTo Err_SendEmails_Outlook_Name

Dim oApp As Outlook.Application
Dim oMail As MailItem
Dim rstEmailPTTesters As Recordset
Dim MyDB As Database
Dim strTo As String
Dim strCC As String
Dim strFrom As String
Dim strSubject As String
Dim strBody As Variant
Dim Attachments As Attachment
Dim rsAttachments As Recordset
Dim rsStateEmail As Recordset
Dim GetCurUser As String
Dim Test As String
Dim rs As Object
Dim fso As Object, SourceFolder As Object, SourceFile As Object
Dim strFileName As String
Dim strFileName_Claborn As String

GetCurUser = GetCurrentUser

Set MyDB = CurrentDb()
Set oApp = CreateObject("Outlook.application")

    ' Find the record that matches the specific record the code is on.
            If fIsLoaded("frmEmails") = True Then
                Set rsStateEmail = MyDB.OpenRecordset("qryEmails")
            End If

            If fIsLoaded("frmEmails_Auto") = True Then
                Set rsStateEmail = MyDB.OpenRecordset("qryEmails")
            End If

'    'Make sure temp folder does not exist
'    If Dir("c:\Users\" & GetCurUser & "\Downloads\dbtemp", vbDirectory) = "" Then
'    Else
'        'Remove temp files and folder
'        If Len(Dir("c:\Users\" & GetCurUser & "\Downloads\dbtemp\*.*")) = 0 Then
'        Else
'            Kill "c:\Users\" & GetCurUser & "\Downloads\dbtemp\*.*" ' delete all files in the folder
'        End If
'        RmDir "c:\Users\" & GetCurUser & "\Downloads\dbtemp\" ' delete folder
'    End If

    'Goto First recordset in the form
    'DoCmd.GoToRecord , , acFirst
    Do While Not rsStateEmail.EOF

    If IsNull(rsStateEmail.Fields("FileName").Value) Then
    Else
        strFileName = rsStateEmail.Fields("FileName").Value
    End If

    If IsNull(rsStateEmail.Fields("FileName_Claborn").Value) Then
    Else
        strFileName_Claborn = rsStateEmail.Fields("FileName_Claborn").Value
    End If

        If IsNull(rsStateEmail.Fields("ToEmailAddress").Value) Then
            GoTo BlankemailGoNext
        Else

            ' Find the record that matches the specific record the code is on.
            If fIsLoaded("frmEmails") = True Then
                Set rs = [Forms]![frmEmails].Recordset.Clone
            End If

            If fIsLoaded("frmEmails_Auto") = True Then
                Set rs = [Forms]![frmEmails_Auto].Recordset.Clone
            End If

            rs.FindFirst "[StateID] = " & rsStateEmail.Fields("StateID").Value

            If fIsLoaded("frmEmails_Auto") = True Then
                If Not rs.EOF Then [Forms]![frmEmails_Auto].Bookmark = rs.Bookmark
            End If

            If fIsLoaded("frmEmails") = True Then
                If Not rs.EOF Then [Forms]![frmEmails].Bookmark = rs.Bookmark
            End If


            ' Instantiate the child recordset to find all the attachments appended.
            'Set rsAttachments = rsStateEmail.Fields("FileName").Value

            Set oMail = oApp.CreateItem(olMailItem)

            strTo = rsStateEmail.Fields("ToEmailAddress").Value

            If IsNull(rsStateEmail.Fields("CCEmailAddress").Value) Then
            Else
            strCC = rsStateEmail.Fields("CCEmailAddress").Value
            End If

            strFrom = rsStateEmail.Fields("EmailFrom").Value
            strSubject = rsStateEmail.Fields("Subject").Value


            If fIsLoaded("frmEmails") = True Then
                strBody = [Forms]![frmEmails]![txtBody] & [Forms]![frmEmails]![txtBody2]
            End If

            If fIsLoaded("frmEmails_Auto") = True Then
                strBody = [Forms]![frmEmails_Auto]![txtBody] & [Forms]![frmEmails_Auto]![txtBody2]
            End If


            oMail.Body = strBody
            oMail.Subject = strSubject
            oMail.To = strTo
            oMail.CC = strCC
            oMail.SentOnBehalfOfName = strFrom

 '           'Make sure temp director exists so can copy attachment file to folder
 '           If Dir("c:\Users\" & GetCurUser & "\Downloads\dbtemp", vbDirectory) = "" Then
 '               MkDir ("c:\Users\" & GetCurUser & "\Downloads\dbtemp")
 '           Else
                'do nothing for the "C:\dbtemp" directory already exists
                'MsgBox "C:\dbtemp\ directory already exists"
 '           End If

            'Check to see if there are attachments
            '  Loop through the attachments.
 '           While Not rsAttachments.EOF
 '               rsAttachments.OpenRecordset
 '               rsAttachments.Fields("FileData").SaveToFile ("c:\Users\" & GetCurUser & "\Downloads\dbtemp\")
 '               rsAttachments.MoveNext

 '           Wend

            Set fso = CreateObject("Scripting.FileSystemObject")
            If IsNull(rsStateEmail.Fields("FileName").Value) Then
            Else
                oMail.Attachments.Add strFileName
            End If

            If IsNull(rsStateEmail.Fields("FileName_Claborn").Value) Then
            Else
                oMail.Attachments.Add strFileName_Claborn
            End If
                'oMail.Attachments.Add strFileName

                oMail.Display

'            Next

            'oMail.Display
            oMail.Send

            'Remove temp files and folder
 '           If Len(Dir("c:\Users\" & GetCurUser & "\Downloads\dbtemp\*.*")) = 0 Then
 '           Else
 '               Kill "c:\Users\" & GetCurUser & "\Downloads\dbtemp\*.*" ' delete all files in the folder
 '           End If
            'Kill "c:\Users\" & GetCurUser & "\Downloads\dbtemp\*.*" ' delete all files in the folder
 '           RmDir "c:\Users\" & GetCurUser & "\Downloads\dbtemp\" ' delete folder
            GoTo BlankemailGoNext
         End If
BlankemailGoNext:
        'Next recordset in the query
        rsStateEmail.MoveNext

        Loop

        Set oMail = Nothing
        Set oApp = Nothing

Exit_SendEmails_Outlook_Name:
    DoCmd.SetWarnings True
    Exit Function

Err_SendEmails_Outlook_Name:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume Exit_SendEmails_Outlook_Name
End Function
