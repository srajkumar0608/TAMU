Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    ViewsAllowed =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridX =24
    GridY =24
    Width =17160
    DatasheetFontHeight =11
    ItemSuffix =14
    Left =3885
    Top =585
    Right =21330
    Bottom =10995
    RecSrcDt = Begin
        0x3b2b68051419e540
    End
    RecordSource ="qryEmail_EditFeilds"
    Caption ="Edit/Add/Delete Email Fields"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Calibri"
    AllowDatasheetView =0
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
        Begin Line
            BorderLineStyle =0
            BorderThemeColorIndex =0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
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
        Begin FormHeader
            Height =315
            Name ="FormHeader"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =93
                    TextAlign =1
                    Width =1980
                    Height =315
                    BorderColor =8355711
                    Name ="State_Label"
                    Caption ="State"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =1980
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =1
                    Left =1980
                    Width =3600
                    Height =315
                    BorderColor =8355711
                    Name ="ToEmailAddress_Label"
                    Caption ="To Email"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =1980
                    LayoutCachedWidth =5580
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =1
                    Left =5580
                    Width =2760
                    Height =315
                    BorderColor =8355711
                    Name ="CCEmailAddress_Label"
                    Caption ="CC Email"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =5580
                    LayoutCachedWidth =8340
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =1
                    Left =8340
                    Width =3900
                    Height =315
                    BorderColor =8355711
                    Name ="EmailFrom_Label"
                    Caption ="Email From"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =8340
                    LayoutCachedWidth =12240
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =1
                    Left =12240
                    Width =2580
                    Height =315
                    BorderColor =8355711
                    Name ="Subject_Label"
                    Caption ="Subject"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =12240
                    LayoutCachedWidth =14820
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =95
                    TextAlign =1
                    Left =14820
                    Width =2340
                    Height =315
                    BorderColor =8355711
                    Name ="NameForEmail_Label"
                    Caption ="Name"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =14820
                    LayoutCachedWidth =17160
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin Line
                    OverlapFlags =87
                    Top =300
                    Width =17160
                    Name ="Line13"
                    GridlineColor =10921638
                    LayoutCachedTop =300
                    LayoutCachedWidth =17160
                    LayoutCachedHeight =300
                End
            End
        End
        Begin Section
            Height =360
            Name ="Detail"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =93
                    IMESentenceMode =3
                    ColumnCount =2
                    Width =1980
                    Height =330
                    ColumnWidth =3000
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="State"
                    ControlSource ="State"
                    RowSourceType ="Table/Query"
                    RowSource ="tblStates"
                    ColumnWidths ="0;1440"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedWidth =1980
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =1980
                    Width =3600
                    Height =360
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ToEmailAddress"
                    ControlSource ="ToEmailAddress"
                    GridlineColor =10921638

                    LayoutCachedLeft =1980
                    LayoutCachedWidth =5580
                    LayoutCachedHeight =360
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =5580
                    Width =2760
                    Height =360
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CCEmailAddress"
                    ControlSource ="CCEmailAddress"
                    GridlineColor =10921638

                    LayoutCachedLeft =5580
                    LayoutCachedWidth =8340
                    LayoutCachedHeight =360
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =8340
                    Width =3900
                    Height =360
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="EmailFrom"
                    ControlSource ="EmailFrom"
                    GridlineColor =10921638

                    LayoutCachedLeft =8340
                    LayoutCachedWidth =12240
                    LayoutCachedHeight =360
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =95
                    IMESentenceMode =3
                    Left =12240
                    Width =2580
                    Height =360
                    ColumnWidth =3000
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Subject"
                    ControlSource ="Subject"
                    GridlineColor =10921638

                    LayoutCachedLeft =12240
                    LayoutCachedWidth =14820
                    LayoutCachedHeight =360
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =14820
                    Width =2340
                    Height =360
                    ColumnWidth =3000
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NameForEmail"
                    ControlSource ="NameForEmail"
                    GridlineColor =10921638

                    LayoutCachedLeft =14820
                    LayoutCachedWidth =17160
                    LayoutCachedHeight =360
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="FormFooter"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "frmEmail_EditFeilds.cls"
