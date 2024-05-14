Version =20
VersionRequired =20
Begin Form
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridX =24
    GridY =24
    Width =16200
    DatasheetFontHeight =11
    ItemSuffix =14
    Left =1393
    Top =1740
    Right =17880
    Bottom =10013
    RecSrcDt = Begin
        0x8aa6da112b19e540
    End
    RecordSource ="qryEmails"
    Caption ="Send Emails - Automatically"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin CommandButton
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            LabelX =-1800
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ComboBox
            AddColon = NotDefault
            BorderLineStyle =0
            LabelX =-1800
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Attachment
            BackStyle =0
            BorderLineStyle =0
            PictureSizeMode =3
            Width =4800
            Height =3840
            LabelX =-1800
            AddColon =0
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =660
            Name ="FormHeader"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =7
            BackTint =20.0
            Begin
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =6360
                    Width =9780
                    Height =660
                    ColumnOrder =0
                    BackColor =14277081
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtMissingChecks"
                    GridlineColor =10921638

                    LayoutCachedLeft =6360
                    LayoutCachedWidth =16140
                    LayoutCachedHeight =660
                    BackShade =85.0
                    Begin
                        Begin Label
                            Visible = NotDefault
                            OverlapFlags =85
                            Left =5520
                            Width =810
                            Height =660
                            BorderColor =8355711
                            Name ="lblMissingChecks"
                            Caption ="Missing Checks:"
                            GridlineColor =10921638
                            LayoutCachedLeft =5520
                            LayoutCachedWidth =6330
                            LayoutCachedHeight =660
                            ForeTint =100.0
                        End
                    End
                End
            End
        End
        Begin Section
            Height =8100
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1440
                    Top =60
                    Width =5640
                    Height =360
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="E-Mail"
                    ControlSource ="ToEmailAddress"
                    EventProcPrefix ="E_Mail"
                    GridlineColor =10921638

                    LayoutCachedLeft =1440
                    LayoutCachedTop =60
                    LayoutCachedWidth =7080
                    LayoutCachedHeight =420
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Top =60
                            Width =1380
                            Height =315
                            BorderColor =8355711
                            Name ="Label8"
                            Caption ="EmailTo"
                            GridlineColor =10921638
                            LayoutCachedTop =60
                            LayoutCachedWidth =1380
                            LayoutCachedHeight =375
                            BackThemeColorIndex =7
                            BackTint =20.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1440
                    Top =960
                    Width =5640
                    Height =315
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="EmailFrom"
                    ControlSource ="EmailFrom"
                    GridlineColor =10921638

                    LayoutCachedLeft =1440
                    LayoutCachedTop =960
                    LayoutCachedWidth =7080
                    LayoutCachedHeight =1275
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Top =960
                            Width =1170
                            Height =315
                            BorderColor =8355711
                            Name ="Label9"
                            Caption ="EmailFrom*"
                            GridlineColor =10921638
                            LayoutCachedTop =960
                            LayoutCachedWidth =1170
                            LayoutCachedHeight =1275
                            BackThemeColorIndex =7
                            BackTint =20.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1440
                    Top =540
                    Width =5640
                    Height =300
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CC"
                    ControlSource ="CCEmailAddress"
                    GridlineColor =10921638

                    LayoutCachedLeft =1440
                    LayoutCachedTop =540
                    LayoutCachedWidth =7080
                    LayoutCachedHeight =840
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Top =540
                            Width =420
                            Height =315
                            BorderColor =8355711
                            Name ="Label10"
                            Caption ="CC*"
                            GridlineColor =10921638
                            LayoutCachedTop =540
                            LayoutCachedWidth =420
                            LayoutCachedHeight =855
                            BackThemeColorIndex =7
                            BackTint =20.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1440
                    Top =1440
                    Width =5640
                    Height =315
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Subject"
                    ControlSource ="Subject"
                    GridlineColor =10921638

                    LayoutCachedLeft =1440
                    LayoutCachedTop =1440
                    LayoutCachedWidth =7080
                    LayoutCachedHeight =1755
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Top =1440
                            Width =870
                            Height =315
                            BorderColor =8355711
                            Name ="Label11"
                            Caption ="Subject*"
                            GridlineColor =10921638
                            LayoutCachedTop =1440
                            LayoutCachedWidth =870
                            LayoutCachedHeight =1755
                            BackThemeColorIndex =7
                            BackTint =20.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    IMESentenceMode =3
                    Top =2280
                    Width =16200
                    Height =420
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtBody"
                    ControlSource ="=\"Please see the attached VS 9-3i report.\" & Chr(13) & Chr(10) & Chr(13) & Chr"
                        "(10)"
                    GridlineColor =10921638

                    LayoutCachedTop =2280
                    LayoutCachedWidth =16200
                    LayoutCachedHeight =2700
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Top =1920
                    Width =1140
                    Height =300
                    BorderColor =8355711
                    Name ="Label1"
                    Caption ="TextBody"
                    GridlineColor =10921638
                    LayoutCachedTop =1920
                    LayoutCachedWidth =1140
                    LayoutCachedHeight =2220
                    BackThemeColorIndex =7
                    BackTint =20.0
                    ForeTint =100.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =13980
                    Top =60
                    Width =2040
                    Height =660
                    TabIndex =5
                    Name ="cmdSendEmails"
                    Caption ="Send Emails (Automatically)"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =13980
                    LayoutCachedTop =60
                    LayoutCachedWidth =16020
                    LayoutCachedHeight =720
                    ForeTint =100.0
                    Gradient =2
                    BackThemeColorIndex =7
                    BackTint =100.0
                    BorderThemeColorIndex =7
                    BorderTint =100.0
                    HoverThemeColorIndex =7
                    HoverTint =80.0
                    PressedThemeColorIndex =7
                    PressedShade =80.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    QuickStyle =26
                    QuickStyleMask =-1
                End
                Begin TextBox
                    Locked = NotDefault
                    TabStop = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =95
                    IMESentenceMode =3
                    Top =2700
                    Width =16200
                    Height =4800
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtBody2"
                    ControlSource ="=\"If you have any questions, please contact me.  \" & Chr(13) & Chr(10) & Chr(1"
                        "3) & Chr(10) & \"Thank you \" & Chr(13) & Chr(10) & \"JC  \" & Chr(13) & Chr(10)"
                        " & Chr(13) & Chr(10) & \"J.C. Essler \" & Chr(13) & Chr(10) & \"Executive Vice-P"
                        "resident TPF\" & Chr(13) & Chr(10) & \"Texas Poultry Improvement Association \""
                    GridlineColor =10921638

                    LayoutCachedTop =2700
                    LayoutCachedWidth =16200
                    LayoutCachedHeight =7500
                End
                Begin Rectangle
                    OverlapFlags =247
                    Top =2280
                    Width =16200
                    Height =5760
                    BorderColor =10921638
                    Name ="Box5"
                    GridlineColor =10921638
                    LayoutCachedTop =2280
                    LayoutCachedWidth =16200
                    LayoutCachedHeight =8040
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2820
                    Top =1800
                    Width =4740
                    Height =360
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NameForEmail"
                    ControlSource ="NameForEmail"
                    GridlineColor =10921638

                    LayoutCachedLeft =2820
                    LayoutCachedTop =1800
                    LayoutCachedWidth =7560
                    LayoutCachedHeight =2160
                    Begin
                        Begin Label
                            Visible = NotDefault
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =2040
                            Top =1800
                            Width =720
                            Height =315
                            BorderColor =8355711
                            Name ="Label0"
                            Caption ="Name:"
                            GridlineColor =10921638
                            LayoutCachedLeft =2040
                            LayoutCachedTop =1800
                            LayoutCachedWidth =2760
                            LayoutCachedHeight =2115
                            BackThemeColorIndex =7
                            BackTint =20.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    ColumnCount =2
                    Left =9960
                    Top =1560
                    Height =315
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="State"
                    ControlSource ="StateName"
                    RowSourceType ="Table/Query"
                    RowSource ="tblStates"
                    ColumnWidths ="0;1440"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =9960
                    LayoutCachedTop =1560
                    LayoutCachedWidth =11400
                    LayoutCachedHeight =1875
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =12240
                    Top =1380
                    Height =315
                    TabIndex =9
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="StateID"
                    ControlSource ="StateID"
                    GridlineColor =10921638

                    LayoutCachedLeft =12240
                    LayoutCachedTop =1380
                    LayoutCachedWidth =13680
                    LayoutCachedHeight =1695
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =13980
                    Top =1740
                    Width =1860
                    Height =420
                    TabIndex =10
                    Name ="cmdEdirFields"
                    Caption ="Edit Email Fields"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =13980
                    LayoutCachedTop =1740
                    LayoutCachedWidth =15840
                    LayoutCachedHeight =2160
                    ForeTint =100.0
                    Gradient =2
                    BackThemeColorIndex =0
                    BackTint =100.0
                    BorderThemeColorIndex =0
                    BorderTint =100.0
                    HoverThemeColorIndex =0
                    HoverTint =80.0
                    PressedThemeColorIndex =0
                    PressedShade =80.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    QuickStyle =22
                    QuickStyleMask =-1
                    Overlaps =1
                End
                Begin TextBox
                    Locked = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =7200
                    Top =420
                    Width =6600
                    Height =780
                    TabIndex =11
                    BackColor =15921906
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="FileName"
                    ControlSource ="FileName"
                    GridlineColor =10921638

                    LayoutCachedLeft =7200
                    LayoutCachedTop =420
                    LayoutCachedWidth =13800
                    LayoutCachedHeight =1200
                    BackShade =95.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =85
                            TextAlign =1
                            Left =7200
                            Top =60
                            Width =2580
                            Height =315
                            BorderColor =8355711
                            Name ="Label12"
                            Caption ="Attachment Ideal Hatchery:"
                            GridlineColor =10921638
                            LayoutCachedLeft =7200
                            LayoutCachedTop =60
                            LayoutCachedWidth =9780
                            LayoutCachedHeight =375
                            BackThemeColorIndex =7
                            BackTint =20.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    ScrollBars =2
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =7200
                    Top =1560
                    Width =6600
                    Height =660
                    TabIndex =12
                    BackColor =15921906
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="FileName_Claborn"
                    ControlSource ="FileName_Claborn"
                    GridlineColor =10921638

                    LayoutCachedLeft =7200
                    LayoutCachedTop =1560
                    LayoutCachedWidth =13800
                    LayoutCachedHeight =2220
                    BackShade =95.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OverlapFlags =87
                            TextAlign =1
                            Left =7200
                            Top =1200
                            Width =3240
                            Height =315
                            BorderColor =8355711
                            Name ="Label13"
                            Caption ="Attachment Claborn Family Farm:"
                            GridlineColor =10921638
                            LayoutCachedLeft =7200
                            LayoutCachedTop =1200
                            LayoutCachedWidth =10440
                            LayoutCachedHeight =1515
                            BackThemeColorIndex =7
                            BackTint =20.0
                            ForeTint =100.0
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="FormFooter"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "frmEmails_Auto.cls"
