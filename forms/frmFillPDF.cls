Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub cmdAddLocation_Claborn_Click()
On Error GoTo Err_cmdAddLocation_Claborn_Click

    Dim f As Object
    Dim strFile As String
    Dim strFolder As String
    Dim varItem As Variant

    Set f = Application.FileDialog(3)
    f.AllowMultiSelect = True
    If f.Show Then
        For Each varItem In f.SelectedItems
            strFile = Dir(varItem)
            strFolder = Left(varItem, Len(varItem) - Len(strFile))
            Me.txtFileFolder_Claborn = strFolder
            Me.txtFileLocation_Claborn = strFolder & strFile
            Me.txtFileName_Claborn = strFile
        Next
    End If
    Set f = Nothing

Exit_cmdAddLocation_Claborn_Click:
    Exit Sub

Err_cmdAddLocation_Claborn_Click:
    DoCmd.SetWarnings True
    If Err.Number = 3315 Then
        Exit Sub
    Else
        MsgBox Err.Description
        Resume Exit_cmdAddLocation_Claborn_Click
    End If
End Sub

Private Sub cmdAddLocation_Click()
On Error GoTo Err_cmdAddLocation_Click

    Dim f As Object
    Dim strFile As String
    Dim strFolder As String
    Dim varItem As Variant

    Set f = Application.FileDialog(3)
    f.AllowMultiSelect = True
    If f.Show Then
        For Each varItem In f.SelectedItems
            strFile = Dir(varItem)
            strFolder = Left(varItem, Len(varItem) - Len(strFile))
            Me.txtFileFolder = strFolder
            Me.txtFileLocation = strFolder & strFile
            Me.txtFileName = strFile
        Next
    End If
    Set f = Nothing

Exit_cmdAddLocation_Click:
    Exit Sub

Err_cmdAddLocation_Click:
    DoCmd.SetWarnings True
    If Err.Number = 3315 Then
        Exit Sub
    Else
        MsgBox Err.Description
        Resume Exit_cmdAddLocation_Click
    End If
End Sub

Private Sub cmdAddPDFLocation_Claborn_Click()
On Error GoTo Err_cmdAddPDFLocation_Claborn_Click

    Dim f As Object
    Dim strFile As String
    Dim strFolder As String
    Dim varItem As Variant

    Set f = Application.FileDialog(3)
    f.AllowMultiSelect = True
    If f.Show Then
        For Each varItem In f.SelectedItems
            strFile = Dir(varItem)
            strFolder = Left(varItem, Len(varItem) - Len(strFile))
            Me.PDFFileFolder_Claborn = strFolder
            Me.PDFFileLocation_Claborn = strFolder & strFile
            Me.PDFFileName_Claborn = strFile
        Next
    End If
    Set f = Nothing

Exit_cmdAddPDFLocation_Claborn_Click:
    Exit Sub

Err_cmdAddPDFLocation_Claborn_Click:
    DoCmd.SetWarnings True
    If Err.Number = 3315 Then
        Exit Sub
    Else
        MsgBox Err.Description
        Resume Exit_cmdAddPDFLocation_Claborn_Click
    End If
End Sub

Private Sub cmdCreateSeperateFiles_Claborn_Click()
On Error GoTo cmdCreateSeperateFiles_Claborn_Click_Err

Dim PDDoc As Acrobat.CAcroPDDoc, newPDF As Acrobat.CAcroPDDoc
Dim PDPage As Acrobat.CAcroPDPage
Dim thePDF As String, PNum As Long
Dim strPDFFullPathNameToSplit As String
Dim rtPageCount, rsFilename As Recordset
Dim x, y As Double
Dim MyDB As Database
Dim intStateID As Double
Dim strCriteria As String
Dim strPDFFolder As String
Dim strPDFLocation As String
Dim strPDFLocation_NewName As String
Dim dfltPrinter As String
Dim newPrinter As Object
Dim strFileNamePart As String
Dim dtDate As Date

Set newPrinter = CreateObject("WScript.Network")
dfltPrinter = Me.txtDefaultPrinter

Set MyDB = CurrentDb()
x = 0
y = 1

'Need reset default printer back
'Set the printer back to the original default
newPrinter.SetDefaultPrinter (dfltPrinter)

    If IsNull(Me.PDFSignedFileLocation_Claborn) Then
        MsgBox "First select the new signed .pdf file that you saved in step 3 before creating the seperate files."
        Exit Sub
    End If

    If IsNull(Me.SavedFileName_Claborn) Then
        MsgBox "First add the company to be added to the file name before continuing with this step.."
        Exit Sub
    End If

    If IsNull(Me.dtDate_Claborn) Then
        MsgBox "First add the date to be added to the file name before continuing with this step.."
        Exit Sub
    End If

    strPDFLocation = Forms![frmFillPDF]![PDFSignedFileLocation_Claborn]
    'strPDFLocation_NewName = Left(strPDFLocation, Len(strPDFLocation) - 4) & "_Filled.pdf"
    strPDFFolder = Forms![frmFillPDF]![PDFSignedFileFolder_Claborn]
'strPDFLocation_NewName & "_Filled.pdf"
    strFileNamePart = SavedFileName_Claborn
    dtDate = Me.dtDate_Claborn

DoCmd.SetWarnings False
DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName_Claborn = Null;"
DoCmd.SetWarnings True

'Finds the page counts needed per state.
Set rtPageCount = MyDB.OpenRecordset("qryPDFPageBreaks_ForCode_Claborn")
    If rtPageCount.RecordCount = 0 Then
    Else
        rtPageCount.MoveLast
        rtPageCount.MoveFirst
    End If

'Add in the file name and location of each states file.
Set rsFilename = MyDB.OpenRecordset("qryState_FileNames_ForCode_Claborn")

strPDFFullPathNameToSplit = strPDFLocation

Set PDDoc = CreateObject("AcroExch.pdDoc")
Result = PDDoc.Open(strPDFFullPathNameToSplit)

    If Not Result Then
       MsgBox "Can't open file: " & strPDFFullPathNameToSplit
       GoTo cmdCreateSeperateFiles_Claborn_Click_Exit
       'GoTo Exit_
    End If

    PNum = PDDoc.GetNumPages

    While Not rtPageCount.EOF
        'rtPageCount.OpenRecordset
        'rtPageCount.MoveLast
        'rtPageCount.MoveFirst

    For i = 0 To PNum - 1

'State+Date+Company+Page #

                'rtPageCount.Fields("FileData").SaveToFile ("c:\Users\" & GetCurUser & "\Downloads\dbtemp\")
            'If it is a state then run this
            If Not (rtPageCount.Fields("PageNumber").Value) > 1 Then
            'If rtPageCount.Fields("StateName").Value <> "" Then
                If i = 0 Then
                Else
                    NewName = NewName & y & ".pdf"
                    newPDF.Save 1, NewName
                    'Add in file name to tblStates
                    strCriteria = "[StateID] = " & intStateID
                    rsFilename.FindFirst strCriteria
                    rsFilename.Edit
                    rsFilename![FileName_Claborn] = NewName
                    rsFilename.Update

                'MsgBox i
                    newPDF.Close
                    Set newPDF = Nothing

                End If
                x = 1
                y = 1
                Set newPDF = CreateObject("AcroExch.pdDoc")
                newPDF.Create
                NewName = strPDFFolder & rtPageCount.Fields("StateName").Value & "_" & Format(dtDate, "yyyymmdd") & "_" & strFileNamePart & "_" & x & "_of_"
                '& y & ".pdf"
                intStateID = rtPageCount.Fields("StateID").Value
            'MsgBox rtPageCount.Fields("StateName").Value
                newPDF.InsertPages newPDF.GetNumPages - 1, PDDoc, i, 1, 0
'                rtPageCount.MoveNext
                    'If this is the last page.
                    If i = PNum - 1 Then
                        NewName = NewName & y & ".pdf"
                        newPDF.Save 1, NewName
                        'Add in file name to tblStates
                        strCriteria = "[StateID] = " & intStateID
                        rsFilename.FindFirst strCriteria
                        rsFilename.Edit
                        rsFilename![FileName_Claborn] = NewName
                        rsFilename.Update
                        newPDF.Close
                        Set newPDF = Nothing
                        'rtPageCount.EOF
                    End If
            'If just the next page then only add the next page to the file.
            Else
                y = 1 + y
                'This is the last page. Need to save the last file.
                If i = PNum - 1 Then
                    NewName = NewName & y & ".pdf"
                    newPDF.Save 1, NewName
                    'Add in file name to tblStates
                    strCriteria = "[StateID] = " & intStateID
                    rsFilename.FindFirst strCriteria
                    rsFilename.Edit
                    rsFilename![FileName_Claborn] = NewName
                    rsFilename.Update
                    newPDF.Close
                    Set newPDF = Nothing
                    'rtPageCount.EOF
                Else
                    newPDF.InsertPages newPDF.GetNumPages - 1, PDDoc, i, 1, 0
                End If
            End If
            rtPageCount.MoveNext
   Next i
        Wend

    Me.img_Check3_Claborn.Visible = True
    Me.img_Check4.Visible = False

    Set PDDoc = Nothing

'Exit_:

cmdCreateSeperateFiles_Claborn_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdCreateSeperateFiles_Claborn_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdCreateSeperateFiles_Claborn_Click_Exit
End Sub

Private Sub cmdFillPDF_Claborn_Click()
Dim jsFile As String
Dim joApp As AcroApp
Dim joAVDoc As AcroAVDoc
Dim joPDDoc As Acrobat.AcroPDDoc
Dim joFormApp As AFORMAUTLib.AFormApp
Dim joFormFields As AFORMAUTLib.Fields
Dim joFormField As AFORMAUTLib.Field
Dim strSignature As String
Dim strPDFLocation As String
Dim strPDFLocation_NewName As String
Dim dtDate As String

    If IsNull(Me.Signature_Name_Claborn) Then
        MsgBox "Add in the text of the signature you want to sign in the PDF file first."
        Exit Sub
    End If

    If IsNull(Me.dtDate_Claborn) Then
        MsgBox "Filling the date field you want to add in the PDF file first."
        Exit Sub
    End If

    If IsNull(Me.PDFFileLocation_Claborn) Then
        MsgBox "First fill in the PDF file location and name first."
        Exit Sub
    End If

    strPDFLocation = Forms![frmFillPDF]![PDFFileLocation_Claborn]
    strPDFLocation_NewName = Left(strPDFLocation, Len(strPDFLocation) - 4)
    strSignature = Forms![frmFillPDF]![Signature_Name_Claborn]
    dtDate = Forms![frmFillPDF]![dtDate_Claborn]

    On Error GoTo Error_Handler

    jsFile = strPDFLocation
    Set joApp = New AcroApp
    Set joAVDoc = CreateObject("AcroExch.AVDoc")
    If joAVDoc.Open(jsFile, "") Then

        Set joPDDoc = joAVDoc.GetPDDoc()

        Set joFormApp = CreateObject("AFormAut.App")
        Set joFormFields = joFormApp.Fields
        For Each joFormField In joFormFields

            'If joFormField.Type = "text" Then
            '    If Left(joFormField.Name, 3) <> "TC " _
            '    And Left(joFormField.Name, 6) <> "PRICE " _
            '    Then
            '        joFormField.Value = joFormField.Name    '<-- this is the main line of code
            '    End If
            'Else
                If Left(joFormField.Name, 12) = "clean flocks" Then
                    joFormField.Value = strSignature
                    joFormField.TextFont = "BrushScriptMT,Italic"
                    joFormField.TextSize = 18
                    'Brush Script
                    '"f.value = ""any Text""; " &vblf _
                    '& "f.flatten"
                End If
                If Left(joFormField.Name, 4) = "Date" Then
                    joFormField.Value = dtDate
                    joFormField.TextSize = 10
                End If
            'End If

                'joFormField.Item(nNodeCount).Access = "readOnly"
                'set the attributes to read-only
                'SetAttr PathName:=NewName, Attributes:=vbReadOnly
                'Reference_Syntax.lockType = "readONly"

        Next joFormField

        'PDDoc.Save PDSaveIncremental, Path ' save changes to the PDF document
        'PDDoc.Close ' close the PDF document

        jsFile = strPDFLocation
        'jsFile = strPDFLocation_NewName & "_Filled.pdf"
        joPDDoc.Save PDSaveIncremental, jsFile
        joPDDoc.Close

        jsFile = strPDFLocation_NewName & "_ReadOnly.pdf"
        PrintAnyDocument (strPDFLocation)


        'Const PDSaveFull = 1
        'Const PDSaveBinaryOK = 16 (&H10)
        'Const PDSaveCollectGarbage = 32 (&H20)
        'Const PDSaveCopy = 2
        'Const PDSaveIncremental = 0
        'Const PDSaveLinearized = 4
        'Const PDSaveWithPSHeader = 8
    End If

    Me.img_Check2_Claborn.Visible = True
    Me.img_Check3_Claborn.Visible = False
    Me.img_Check4.Visible = False

    Me.PDFSignedFileLocation = Null

    'MsgBox "Done"

Exit_Handler:
    joAVDoc.Close True
    Set joPDDoc = Nothing
    Set joAVDoc = Nothing
    Set joApp = Nothing
    'MsgBox "Done processing"
    Exit Sub

Error_Handler:
    MsgBox Err.Number & ": " & Err.Description, vbCritical, "Adobe Testing"
    GoTo Exit_Handler
    Resume
End Sub

Private Sub cmdFinished_Click()

    img_Check01.Visible = True

End Sub

Private Sub cmdImportFile_Click()
On Error GoTo cmdImportFile_Click_Err

Dim srtFileLocation As String

    If IsNull(Me.txtFileLocation) Then
        MsgBox "The txt file location is a required field.  Fill in the location and file name before comtinuing."
        Exit Sub
    End If

    If Me.img_Check01.Visible = False Then
        MsgBox "Be sure to follow the instructions on step 1 to prepare your pdf document for import.  If you have, then first click on the 'Yes' button in step 1."
        Exit Sub
    End If

    srtFileLocation = Me.txtFileLocation

    DoCmd.SetWarnings False

    'delete the temp table for the txt file.
    DoCmd.RunSQL "DELETE tblTemp_PDFTextImport.* FROM tblTemp_PDFTextImport;"

    DoCmd.TransferText acImportDelim, , "tblTemp_PDFTextImport", srtFileLocation, False

    Me.img_Check1.Visible = True

    Me.img_Check2.Visible = False
    Me.img_Check3.Visible = False
    Me.img_Check4.Visible = False

    'Delete errors tables
    Delete_Error_Tables

    DoCmd.SetWarnings True

cmdImportFile_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdImportFile_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdImportFile_Click_Exit
End Sub

Private Sub cmdImportTextFile_Claborn_Click()
On Error GoTo cmdImportTextFile_Claborn_Click_Err

Dim srtFileLocation As String

    If IsNull(Me.txtFileLocation_Claborn) Then
        MsgBox "The txt file location is a required field.  Fill in the location and file name before comtinuing."
        Exit Sub
    End If

    If Me.img_Check01_Claborn.Visible = False Then
        MsgBox "Be sure to follow the instructions on step 1 to prepare your pdf document for import.  If you have, then first click on the 'Yes' button in step 1."
        Exit Sub
    End If

    srtFileLocation = Me.txtFileLocation_Claborn

    DoCmd.SetWarnings False

    'delete the temp table for the txt file.
    DoCmd.RunSQL "DELETE tblTemp_PDFTextImport_Claborn.* FROM tblTemp_PDFTextImport_Claborn;"

    DoCmd.TransferText acImportDelim, "Claborn_Text Import Specification", "tblTemp_PDFTextImport_Claborn", srtFileLocation, False

    Me.img_Check1_Claborn.Visible = True

    Me.img_Check2_Claborn.Visible = False
    Me.img_Check3_Claborn.Visible = False
    Me.img_Check4.Visible = False

    'Delete errors tables
    Delete_Error_Tables

    DoCmd.SetWarnings True

cmdImportTextFile_Claborn_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdImportTextFile_Claborn_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdImportTextFile_Claborn_Click_Exit
End Sub

Private Sub cmdNotFinished_Click()
img_Check01.Visible = False
End Sub

Private Sub cmdOpenInstructions_Click()
On Error GoTo cmdOpenInstructions_Click_Err

    'Open the Email form to automatically create welcome emails.
    DoCmd.OpenForm "frmInstructions", acNormal, "", "", , acNormal

cmdOpenInstructions_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdOpenInstructions_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdOpenInstructions_Click_Exit
End Sub

Private Sub cmdOpenSendEmails_Click()
On Error GoTo cmdOpenSendEmails_Click_Err

    If Me!tglIdealHatchery.Value = False Then
        DoCmd.SetWarnings False
        DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName = Null;"
        DoCmd.SetWarnings True
    End If

    If Me!tglClabornFarm.Value = False Then
        DoCmd.SetWarnings False
        DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName_Claborn = Null;"
        DoCmd.SetWarnings True
    End If


    'Open the Email form to automatically create welcome emails.
    DoCmd.OpenForm "frmEmails", acNormal, "", "", , acNormal

cmdOpenSendEmails_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdOpenSendEmails_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdOpenSendEmails_Click_Exit
End Sub

Private Sub cmdOpenSendEmailsAuto_Click()
On Error GoTo cmdOpenSendEmailsAuto_Click_Err

    If Me!tglIdealHatchery.Value = False Then
        DoCmd.SetWarnings False
        DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName = Null;"
        DoCmd.SetWarnings True
    End If

    If Me!tglClabornFarm.Value = False Then
        DoCmd.SetWarnings False
        DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName_Claborn = Null;"
        DoCmd.SetWarnings True
    End If


    'Open the Email form to automatically create welcome emails.
    DoCmd.OpenForm "frmEmails_Auto", acNormal, "", "", , acNormal

cmdOpenSendEmailsAuto_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdOpenSendEmailsAuto_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdOpenSendEmailsAuto_Click_Exit
End Sub

Private Sub cmdSignPDFLocation_Claborn_Click()
On Error GoTo cmdSignPDFLocation_Claborn_Click_Err

    Dim f As Object
    Dim strFile As String
    Dim strFolder As String
    Dim varItem As Variant

    Set f = Application.FileDialog(3)
    f.AllowMultiSelect = True
    If f.Show Then
        For Each varItem In f.SelectedItems
            strFile = Dir(varItem)
            strFolder = Left(varItem, Len(varItem) - Len(strFile))
            Me.PDFSignedFileFolder_Claborn = strFolder
            Me.PDFSignedFileLocation_Claborn = strFolder & strFile
            Me.PDFSignedFileName_Claborn = strFile
        Next
    End If
    Set f = Nothing

cmdSignPDFLocation_Claborn_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

cmdSignPDFLocation_Claborn_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume cmdSignPDFLocation_Claborn_Click_Exit
End Sub

Private Sub Command25_Click()
    Dim f As Object
    Dim strFile As String
    Dim strFolder As String
    Dim varItem As Variant

    Set f = Application.FileDialog(3)
    f.AllowMultiSelect = True
    If f.Show Then
        For Each varItem In f.SelectedItems
            strFile = Dir(varItem)
            strFolder = Left(varItem, Len(varItem) - Len(strFile))
            Me.PDFFileFolder = strFolder
            Me.PDFFileLocation = strFolder & strFile
            Me.PDFFileName = strFile
        Next
    End If
    Set f = Nothing
End Sub

Private Sub Command49_Click()
'To print a PDF file transparently the ShellToFile procedure is called like this:

ShellToFile "C:\Users\boykin.wheel\Documents\Felicia\Work\Tools\MSAccess\JCs_AutoPDFSigning\Documents\Alabama_20180420_1_of_2.pdf", OP_PRINT, SW_HIDE

End Sub

Private Sub Command5_Click()
Dim jsFile As String
Dim joApp As AcroApp
Dim joAVDoc As AcroAVDoc
Dim joPDDoc As Acrobat.AcroPDDoc
Dim joFormApp As AFORMAUTLib.AFormApp
Dim joFormFields As AFORMAUTLib.Fields
Dim joFormField As AFORMAUTLib.Field
Dim strSignature As String
Dim strPDFLocation As String
Dim strPDFLocation_NewName As String
Dim dtDate As String
Dim Cnts As Integer
Dim c As Integer
Dim sc As Integer
Dim dc As Integer
Dim sName As String
Dim dName As String
Dim objJSO As Object
Dim f As String


    If IsNull(Me.Signature_Name) Then
        MsgBox "Add in the text of the signature you want to sign in the PDF file first."
        Exit Sub
    End If

    If IsNull(Me.dtDate) Then
        MsgBox "Filling the date field you want to add in the PDF file first."
        Exit Sub
    End If

    If IsNull(Me.PDFFileLocation) Then
        MsgBox "First fill in the PDF file location and name first."
        Exit Sub
    End If

    strPDFLocation = Forms![frmFillPDF]![PDFFileLocation]
    strPDFLocation_NewName = Left(strPDFLocation, Len(strPDFLocation) - 4)
    strSignature = Forms![frmFillPDF]![Signature_Name]
    dtDate = Forms![frmFillPDF]![dtDate]

    On Error GoTo 0

    jsFile = strPDFLocation
    'MsgBox jsFile
    Set joApp = New AcroApp
    Set joAVDoc = CreateObject("AcroExch.AVDoc")
    If joAVDoc.Open(jsFile, "") Then

        Set joPDDoc = joAVDoc.GetPDDoc()
        Set objJSO = joPDDoc.GetJSObject
        'Set f = objJSO.all
        'MsgBox objJSO.getnthfieldname(190)
        'MsgBox joPDDoc.GetNumPages
        'MsgBox joPDDoc.GetJSObject
        'MsgBox objJSO.numfields

        Set joFormApp = CreateObject("AFormAut.App")
        Set joFormFields = joFormApp.Fields
        Cnts = joFormFields.Count
        'MsgBox Cnts
        'Set joFormField = joFormFields.Item("Date_47")
        'MsgBox joFormField
        'sc = UBound(joFormFields) - 1
        'MsgBox TypeName(joFormField)
        sc = 1
        dc = 1
        For c = 1 To Cnts
            f = objJSO.getnthfieldname(c)
            'MsgBox
            If Left(f, 27) = "NPIP Contact Representative" Then
                'sName = "NPIP Contact Representative"
                'MsgBox f
                joFormFields.Item(f).Value = strSignature
                joFormFields.Item(f).TextFont = "BrushScriptMT,Italic"
                joFormFields.Item(f).TextSize = 18
                'sc = sc + 1
            End If
            If Left(f, 4) = "Date" Then
                'MsgBox f
                'dName = "Date"
                objJSO.getField(f).Value = dtDate
                objJSO.getField(f).TextSize = 10
                'joFormFields.Item(f).Value = dtDate
                'joFormFields.Item(f).TextSize = 10
                'dc = dc + 1
            End If

            'set joFormField = joFormFields.Item(Name)
            'MsgBox joFormField
            'If joFormField.Type = "text" Then
            '    If Left(joFormField.Name, 3) <> "TC " _
            '    And Left(joFormField.Name, 6) <> "PRICE " _
            '    Then
            '        joFormField.Value = joFormField.Name    '<-- this is the main line of code
            '    End If
            'Else
            'If Left(joFormFields.Item(sName).Name, 27) = "NPIP Contact Representative" Then
            '    joFormFields.Item(sName).Value = strSignature
            '    joFormFields.Item(sName).TextFont = "BrushScriptMT,Italic"
            '    joFormFields.Item(sName).TextSize = 18
                'Brush Script
                '"f.value = ""any Text""; " &vblf _
                '& "f.flatten"
            '    sc = sc + 1
            'End If
            'If Left(joFormFields.Item(dName).Name, 4) = "Date" Then
            '    joFormFields.Item(dName).Value = dtDate
            '    joFormFields.Item(dName).TextSize = 10
            '    dc = dc + 1
            'End If
            'End If

                'joFormField.Item(nNodeCount).Access = "readOnly"
                'set the attributes to read-only
                'SetAttr PathName:=NewName, Attributes:=vbReadOnly
                'Reference_Syntax.lockType = "readONly"

        Next c

        'PDDoc.Save PDSaveIncremental, Path ' save changes to the PDF document
        'PDDoc.Close ' close the PDF document

        jsFile = strPDFLocation
        'jsFile = strPDFLocation_NewName & "_Filled.pdf"
        joPDDoc.Save PDSaveIncremental, jsFile
        'joPDDoc.Close

        'jsFile = strPDFLocation_NewName & "_ReadOnly.pdf"
        'PrintAnyDocument (strPDFLocation)


        'Const PDSaveFull = 1
        'Const PDSaveBinaryOK = 16 (&H10)
        'Const PDSaveCollectGarbage = 32 (&H20)
        'Const PDSaveCopy = 2
        'Const PDSaveIncremental = 0
        'Const PDSaveLinearized = 4
        'Const PDSaveWithPSHeader = 8
    End If

    Me.img_Check2.Visible = True
    Me.img_Check3.Visible = False
    Me.img_Check4.Visible = False

    Me.PDFSignedFileLocation = Null

    'MsgBox "Done"

Exit_Handler:
    'joAVDoc.Close True
    Set joPDDoc = Nothing
    Set joAVDoc = Nothing
    Set joApp = Nothing
    'MsgBox "Done processing"
    Exit Sub

Error_Handler:
    'MsgBox Err.Number & ": " & Err.Description, vbCritical, "Adobe Testing"
    'GoTo Exit_Handler
    'Exit For
    'Resume
End Sub

Private Sub Command50_Click()

PrintAnyDocument ("C:\Users\boykin.wheel\Documents\Felicia\Work\Tools\MSAccess\JCs_AutoPDFSigning\Documents\Alabama_20180420_1_of_2.pdf")

'PrintPdfFile "C:\Users\boykin.wheel\Documents\Felicia\Work\Tools\MSAccess\JCs_AutoPDFSigning\Documents\Alabama_20180420_1_of_2.pdf", "Adobe PDF"

End Sub

Private Sub Command53_Click()
Dim f As Object
    Dim strFile As String
    Dim strFolder As String
    Dim varItem As Variant

    Set f = Application.FileDialog(3)
    f.AllowMultiSelect = True
    If f.Show Then
        For Each varItem In f.SelectedItems
            strFile = Dir(varItem)
            strFolder = Left(varItem, Len(varItem) - Len(strFile))
            Me.PDFSignedFileFolder = strFolder
            Me.PDFSignedFileLocation = strFolder & strFile
            Me.PDFSignedFileName = strFile
        Next
    End If
    Set f = Nothing
End Sub

Private Sub Command6_Click()
On Error GoTo Command6_Click_Err
'On Error GoTo 0

Dim PDDoc As Acrobat.CAcroPDDoc, newPDF As Acrobat.CAcroPDDoc
Dim PDPage As Acrobat.CAcroPDPage
Dim thePDF As String, PNum As Long
Dim strPDFFullPathNameToSplit As String
Dim rtPageCount, rsFilename As Recordset
Dim x, y As Double
Dim MyDB As Database
Dim intStateID As Double
Dim strCriteria As String
Dim strPDFFolder As String
Dim strPDFLocation As String
Dim strPDFLocation_NewName As String
Dim dfltPrinter As String
Dim newPrinter As Object
Dim strFileNamePart As String
Dim dtDate As Date

Set newPrinter = CreateObject("WScript.Network")
'dfltPrinter = Me.txtDefaultPrinter

Set MyDB = CurrentDb()
x = 0
y = 1

'Need reset default printer back
'Set the printer back to the original default
'newPrinter.SetDefaultPrinter (dfltPrinter)

    If IsNull(Me.PDFSignedFileLocation) Then
        MsgBox "First select the new signed .pdf file that you saved in step 3 before creating the seperate files."
        Exit Sub
    End If

    If IsNull(Me.SavedFileName) Then
        MsgBox "First add the company to be added to the file name before continuing with this step.."
        Exit Sub
    End If

    If IsNull(Me.dtDate) Then
        MsgBox "First add the date to be added to the file name before continuing with this step.."
        Exit Sub
    End If

    strPDFLocation = Forms![frmFillPDF]![PDFSignedFileLocation]
    'strPDFLocation_NewName = Left(strPDFLocation, Len(strPDFLocation) - 4) & "_Filled.pdf"
    strPDFFolder = Forms![frmFillPDF]![PDFSignedFileFolder]
'strPDFLocation_NewName & "_Filled.pdf"
    strFileNamePart = SavedFileName
    dtDate = Me.dtDate

DoCmd.SetWarnings False
DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName = Null;"
DoCmd.SetWarnings True

'Finds the page counts needed per state.
Set rtPageCount = MyDB.OpenRecordset("qryPDFPageBreaks_ForCode")
    If rtPageCount.RecordCount = 0 Then
    Else
        rtPageCount.MoveLast
        rtPageCount.MoveFirst
    End If

'Add in the file name and location of each states file.
Set rsFilename = MyDB.OpenRecordset("qryState_FileNames_ForCode")

strPDFFullPathNameToSplit = strPDFLocation

Set PDDoc = CreateObject("AcroExch.pdDoc")
Result = PDDoc.Open(strPDFFullPathNameToSplit)

    If Not Result Then
       MsgBox "Can't open file: " & strPDFFullPathNameToSplit
       GoTo Command6_Click_Exit
       'GoTo Exit_
    End If

    PNum = PDDoc.GetNumPages

    While Not rtPageCount.EOF
        'rtPageCount.OpenRecordset
        'rtPageCount.MoveLast
        'rtPageCount.MoveFirst

    For i = 0 To PNum - 1

                'rtPageCount.Fields("FileData").SaveToFile ("c:\Users\" & GetCurUser & "\Downloads\dbtemp\")
            'If it is a state then run this
            If Not (rtPageCount.Fields("StateName").Value) Like "*Page:*" Then
            'If rtPageCount.Fields("StateName").Value <> "" Then
                If i = 0 Then
                Else
                    NewName = NewName & y & ".pdf"
                    newPDF.Save 1, NewName
                    'Add in file name to tblStates
                    strCriteria = "[StateID] = " & intStateID
                    rsFilename.FindFirst strCriteria
                    rsFilename.Edit
                    rsFilename![FileName] = NewName
                    rsFilename.Update

                'MsgBox i
                    newPDF.Close
                    Set newPDF = Nothing

                End If
                x = 1
                y = 1
                Set newPDF = CreateObject("AcroExch.pdDoc")
                newPDF.Create
                NewName = strPDFFolder & rtPageCount.Fields("StateName").Value & "_" & Format(dtDate, "yyyymmdd") & "_" & strFileNamePart & "_" & x & "_of_"
                '& y & ".pdf"
                intStateID = rtPageCount.Fields("StateID").Value
            'MsgBox rtPageCount.Fields("StateName").Value
                newPDF.InsertPages newPDF.GetNumPages - 1, PDDoc, i, 1, 0
                rtPageCount.MoveNext
                    'If this is the last page.
                    If i = PNum - 1 Then
                        NewName = NewName & y & ".pdf"
                        newPDF.Save 1, NewName
                        'Add in file name to tblStates
                        strCriteria = "[StateID] = " & intStateID
                        rsFilename.FindFirst strCriteria
                        rsFilename.Edit
                        rsFilename![FileName] = NewName
                        rsFilename.Update
                        newPDF.Close
                        Set newPDF = Nothing
                        'rtPageCount.EOF
                    End If
            'If just the next page then only add the next page to the file.
            Else
                y = 1 + y
                'This is the last page. Need to save the last file.
                If i = PNum - 1 Then
                    NewName = NewName & y & ".pdf"
                    newPDF.Save 1, NewName
                    'Add in file name to tblStates
                    strCriteria = "[StateID] = " & intStateID
                    rsFilename.FindFirst strCriteria
                    rsFilename.Edit
                    rsFilename![FileName] = NewName
                    rsFilename.Update
                    newPDF.Close
                    Set newPDF = Nothing
                    'rtPageCount.EOF
                Else
                    newPDF.InsertPages newPDF.GetNumPages - 1, PDDoc, i, 1, 0
                End If
            End If
            rtPageCount.MoveNext
   Next i
        Wend

    Me.img_Check3.Visible = True
    Me.img_Check4.Visible = False

    Set PDDoc = Nothing

'Exit_:

Command6_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

Command6_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume Command6_Click_Exit
End Sub

Private Sub Command87_Click()
On Error GoTo Command87_Click_Err

    'Open the Email form to automatically create welcome emails.
    DoCmd.OpenForm "frmInstructions", acNormal, "", "", , acNormal

Command87_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

Command87_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume Command87_Click_Exit
End Sub

Private Sub Command89_Click()

    img_Check01_Claborn.Visible = True

End Sub

Private Sub Command90_Click()
img_Check01_Claborn.Visible = False
End Sub

Private Sub Form_Load()

    Forms![frmFillPDF]!PDFFileLocation = Null
    Forms![frmFillPDF]!PDFSignedFileLocation = Null
    Forms![frmFillPDF]!txtFileLocation = Null
    Forms![frmFillPDF]!PDFFileLocation_Claborn = Null
    Forms![frmFillPDF]!PDFSignedFileLocation_Claborn = Null
    Forms![frmFillPDF]!txtFileLocation_Claborn = Null

    'Me.tglIdealHatchery.Value = True
    'Me.tglClabornFarm.Value = True


End Sub

Private Sub Form_Open(Cancel As Integer)

    'Rehide the check marks
    Me.img_Check01.Visible = False
    Me.img_Check1.Visible = False
    Me.img_Check2.Visible = False
    Me.img_Check3.Visible = False
    Me.img_Check4.Visible = False
    Me.img_Check01_Claborn.Visible = False
    Me.img_Check1_Claborn.Visible = False
    Me.img_Check2_Claborn.Visible = False
    Me.img_Check3_Claborn.Visible = False
    'Me.img_Check4_Claborn.Visible = False

    HideIdealHatchery
    HideClaborn
    Me.tglClabornFarm.Value = False
    Me.tglIdealHatchery.Value = False

    DoCmd.SetWarnings False
    DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName = Null;"
    DoCmd.RunSQL "UPDATE qry_tblStates SET qry_tblStates.FileName_Claborn = Null;"
    DoCmd.SetWarnings True


End Sub

Private Sub tglClabornFarm_Click()
On Error GoTo tglClabornFarm_Click_Err

    If Me!tglClabornFarm.Value = True Then
        UnHideClaborn
    Else
        HideClaborn
    End If

tglClabornFarm_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

tglClabornFarm_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume tglClabornFarm_Click_Exit
End Sub

Private Sub tglIdealHatchery_Click()
On Error GoTo tglIdealHatchery_Click_Err

    If Me!tglIdealHatchery.Value = True Then
        UnHideIdealHatchery
    Else
        HideIdealHatchery
    End If

tglIdealHatchery_Click_Exit:
    DoCmd.SetWarnings True
    Exit Sub

tglIdealHatchery_Click_Err:
    DoCmd.SetWarnings True
    MsgBox Err.Description
    Resume tglIdealHatchery_Click_Exit
End Sub

Public Sub HideIdealHatchery()

    Label35.Visible = False
    Box34.Visible = False
    Label40.Visible = False
    cmdOpenInstructions.Visible = False
    Label42.Visible = False
    cmdFinished.Visible = False
    cmdNotFinished.Visible = False
    img_Check01.Visible = False
    Box10.Visible = False
    Label47.Visible = False
    Label9.Visible = False
    txtFileLocation.Visible = False
    cmdImportFile.Visible = False
    img_Check1.Visible = False
    Label17.Visible = False
    Box16.Visible = False
    Label1.Visible = False
    Signature_Name.Visible = False
    Label2.Visible = False
    dtDate.Visible = False
    Command25.Visible = False
    cmdAddLocation.Visible = False
    Label48.Visible = False
    Label24.Visible = False
    PDFFileLocation.Visible = False
    Command5.Visible = False
    img_Check2.Visible = False
    Label19.Visible = False
    Box18.Visible = False
    Label54.Visible = False
    Label52.Visible = False
    PDFSignedFileLocation.Visible = False
    Label102.Visible = False
    qryFillPDF.Visible = False
    Command6.Visible = False
    cmdAddLocation.Visible = False
    img_Check4.Visible = False
    img_Check3.Visible = False
    Command53.Visible = False
    Label11.Visible = False

    If Label21.Visible = True And Me.tglClabornFarm.Value = False Then
        Label21.Visible = False
        Box20.Visible = False
        Label46.Visible = False
        cmdOpenSendEmails.Visible = False
        cmdOpenSendEmailsAuto.Visible = False
    End If

End Sub

Public Sub UnHideIdealHatchery()

    Label35.Visible = True
    Box34.Visible = True
    Label40.Visible = True
    cmdOpenInstructions.Visible = True
    Label42.Visible = True
    cmdFinished.Visible = True
    cmdNotFinished.Visible = True
    'img_Check01.Visible = True
    Box10.Visible = True
    Label47.Visible = True
    Label9.Visible = True
    txtFileLocation.Visible = True
    cmdImportFile.Visible = True
    'img_Check1.Visible = True
    Label17.Visible = True
    Box16.Visible = True
    Label1.Visible = True
    Signature_Name.Visible = True
    Label2.Visible = True
    dtDate.Visible = True
    Command25.Visible = True
    cmdAddLocation.Visible = True
    Label48.Visible = True
    Label24.Visible = True
    PDFFileLocation.Visible = True
    Command5.Visible = True
    'img_Check2.Visible = True
    Label19.Visible = True
    Box18.Visible = True
    Label54.Visible = True
    Label52.Visible = True
    PDFSignedFileLocation.Visible = True
    Label102.Visible = True
    qryFillPDF.Visible = True
    Command6.Visible = True
    cmdAddLocation.Visible = True
    Command53.Visible = True
    Label11.Visible = True

    If Label21.Visible = True Then
    Else
        Label21.Visible = True
        Box20.Visible = True
        Label46.Visible = True
        cmdOpenSendEmails.Visible = True
        cmdOpenSendEmailsAuto.Visible = True
    End If

End Sub

Public Sub UnHideClaborn()

    Label84.Visible = True
    Box83.Visible = True
    Label86.Visible = True
    Command87.Visible = True
    Label88.Visible = True
    Command89.Visible = True
    Command90.Visible = True
    Label67.Visible = True
    Box66.Visible = True
    Label91.Visible = True
    Label65.Visible = True
    txtFileLocation_Claborn.Visible = True
    cmdAddLocation_Claborn.Visible = True
    cmdImportTextFile_Claborn.Visible = True
    Label72.Visible = True
    Box71.Visible = True
    Label58.Visible = True
    Signature_Name_Claborn.Visible = True
    cmdAddPDFLocation_Claborn.Visible = True
    Label60.Visible = True
    dtDate_Claborn.Visible = True
    Label92.Visible = True
    Label77.Visible = True
    PDFFileLocation_Claborn.Visible = True
    cmdFillPDF_Claborn.Visible = True
    Label74.Visible = True
    Box73.Visible = True
    Label98.Visible = True
    Label96.Visible = True
    PDFSignedFileLocation_Claborn.Visible = True
    cmdSignPDFLocation_Claborn.Visible = True
    cmdCreateSeperateFiles_Claborn.Visible = True
    Label103.Visible = True
    SavedFileName_Claborn.Visible = True

    If Label21.Visible = True Then
    Else
        Label21.Visible = True
        Box20.Visible = True
        Label46.Visible = True
        cmdOpenSendEmails.Visible = True
        cmdOpenSendEmailsAuto.Visible = True
    End If

End Sub

Public Sub HideClaborn()

    Label84.Visible = False
    Box83.Visible = False
    Label86.Visible = False
    Command87.Visible = False
    Label88.Visible = False
    Command89.Visible = False
    Command90.Visible = False
    img_Check01_Claborn.Visible = False
    Label67.Visible = False
    Box66.Visible = False
    Label91.Visible = False
    Label65.Visible = False
    txtFileLocation_Claborn.Visible = False
    cmdAddLocation_Claborn.Visible = False
    cmdImportTextFile_Claborn.Visible = False
    img_Check1_Claborn.Visible = False
    Label72.Visible = False
    Box71.Visible = False
    Label58.Visible = False
    Signature_Name_Claborn.Visible = False
    cmdAddPDFLocation_Claborn.Visible = False
    Label60.Visible = False
    dtDate_Claborn.Visible = False
    Label92.Visible = False
    Label77.Visible = False
    PDFFileLocation_Claborn.Visible = False
    cmdFillPDF_Claborn.Visible = False
    img_Check2_Claborn.Visible = False
    Label74.Visible = False
    Box73.Visible = False
    Label98.Visible = False
    Label96.Visible = False
    PDFSignedFileLocation_Claborn.Visible = False
    cmdSignPDFLocation_Claborn.Visible = False
    cmdCreateSeperateFiles_Claborn.Visible = False
    Label103.Visible = False
    SavedFileName_Claborn.Visible = False
    img_Check3_Claborn.Visible = False

    If Label21.Visible = True And Me.tglIdealHatchery.Value = False Then
        Label21.Visible = False
        Box20.Visible = False
        Label46.Visible = False
        cmdOpenSendEmails.Visible = False
        cmdOpenSendEmailsAuto.Visible = False
    End If

End Sub
