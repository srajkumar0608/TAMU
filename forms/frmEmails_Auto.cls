Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub cmdEdirFields_Click()
On Error GoTo cmdEdirFields_Click_Err

    'Open the Email form to edit emails
    DoCmd.OpenForm "frmEmail_EditFeilds", acNormal, "", "", , acNormal

cmdEdirFields_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdEdirFields_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdEdirFields_Click_Exit
End Sub

Private Sub cmdSendEmails_Click()
On Error GoTo Err_cmdSendEmails_Click

Dim Msg, style, Title, Help, Ctxt, Response, MyString
Dim dtTrainingDate As Date
Dim rsTotal, rsTotal_Name As Recordset
Dim rsFNameCheck, rsFNameCheck_Name As Recordset
Dim rsLNameCheck, rsLNameCheck_Name As Recordset
Dim rsPhoneNumCheck, rsPhoneNumCheck_Name As Recordset
Dim rsTesterIDCheck, rsTesterIDCheck_Name As Recordset
Dim rsEmailCheck, rsEmailCheck_Name As Recordset
Dim strCheckMessage, strCheckMessage_Name As String
Dim intTesterName As Double
Dim rsStateEmail As Recordset
Dim intStateID As Double
Dim MyDB As Database

    Set MyDB = CurrentDb()

    intStateID = Me.StateID

    Me.lblMissingChecks.Visible = False
    Me.txtMissingChecks.Visible = False


    'Send emails ****************************************************************************************************************************

        'Do a check on all required fields so that the emails will create successfully.
        Set rsStateEmail = MyDB.OpenRecordset("qryEmails")

        Set rsEmailCheck = MyDB.OpenRecordset("qryEmails_CheckEmails")

        'Get the total count of each recordset
         If rsStateEmail.RecordCount = 0 Then
        Else
            rsStateEmail.MoveLast
            rsStateEmail.MoveFirst
        End If
        If rsEmailCheck.RecordCount = 0 Then
        Else
            rsEmailCheck.MoveLast
            rsEmailCheck.MoveFirst
        End If


        'Make sure there are records to send emails too.
        If rsStateEmail.RecordCount = 0 Then
            MsgBox "There are no attachment prepared to send emails With.  Make sure you followed the steps on the main menu to properly prepare your PDFs."
            Exit Sub
        End If


        strCheckMessage = ""

        'Create the missing data checks.
        If rsEmailCheck.RecordCount > 0 Then
            strCheckMessage = strCheckMessage & "Missing Email = " & rsEmailCheck.RecordCount
        Else
        End If

        'If there are some missing data from the checks then make the ckect text box visibile and add the text message to it.
        If Len(strCheckMessage) > 1 Then
            'Turn on the Missing Checks text box.
            Me.lblMissingChecks.Visible = True
            Me.txtMissingChecks.Visible = True

            Me.txtMissingChecks = strCheckMessage

            'Let user know there are errors on the email fields.
            Msg = "There are some missing fields that will be left blank in the email.  Did you still want to contine to send the emails?"   ' Define message.
            style = vbYesNo + vbExclamation + vbDefaultButton1 ' Define buttons.
            Title = "Important"  ' Define title.
            Help = "DEMO.HLP"   ' Define Help file.
            Ctxt = 1000 ' Define topic
                                ' context.
                                ' Display message.
            Response = MsgBox(Msg, style, Title, Help, Ctxt)

            If Response = vbYes Then
                'creates all the emails to be created in outlook.
                SendEmails_Outlook_StateID
                Forms![frmFillPDF]![img_Check4].Visible = True
                Exit Sub
            Else
                Exit Sub
            End If

            'MsgBox strCheckMessage
        End If

        'Prompt to make sure that user is wanting to create emails.
        Msg = "Are you sure you want to create these email messages?"   ' Define message.
        style = vbYesNo + vbQuestion + vbDefaultButton1 ' Define buttons.
        Title = "Important"  ' Define title.
        Help = "DEMO.HLP"   ' Define Help file.
        Ctxt = 1000 ' Define topic
                            ' context.
                            ' Display message.
        Response = MsgBox(Msg, style, Title, Help, Ctxt)

        If Response = vbYes Then
            'creates all the emails to be created in outlook.
            SendEmails_Outlook_StateID_Auto
            Forms![frmFillPDF]![img_Check4].Visible = True
        Else
            Exit Sub
        End If

        'Close all recordsets
        rsStateEmail.Close
        rsEmailCheck.Close

        MsgBox "Emails created."

Exit_cmdSendEmails_Click:
    DoCmd.SetWarnings True
    Exit Sub
Err_cmdSendEmails_Click:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume Exit_cmdSendEmails_Click
End Sub
