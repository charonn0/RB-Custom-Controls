#tag Window
Begin Window ProgressBarwindow
   BackColor       =   -586433280
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   298
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "ProgBar Test"
   Visible         =   True
   Width           =   486
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   523
      LockedInPosition=   False
      Mode            =   0
      Period          =   50
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   60
      Width           =   32
   End
   Begin Oval BoxColor
      AutoDeactivate  =   True
      BorderColor     =   "&c00000000"
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   "&cFFFFFF00"
      Height          =   24
      HelpTag         =   "Box Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   27
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Oval barColor
      AutoDeactivate  =   True
      BorderColor     =   "&c00000000"
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   "&cFFFFFF00"
      Height          =   24
      HelpTag         =   "Bar Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   136
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   54
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Box Color"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   53
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   165
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Bar Color"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   49
   End
   Begin CheckBox hasBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Has Box"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   45
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   72
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
   End
   Begin CheckBox hasGradient
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Gradient"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   204
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   72
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   67
   End
   Begin Oval barWellColor
      AutoDeactivate  =   True
      BorderColor     =   "&c00000000"
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   "&cFFFFFF00"
      Height          =   24
      HelpTag         =   "Barwell Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   243
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText5
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   271
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      Text            =   "Barwell"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   54
   End
   Begin CheckBox hasText
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Text"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   351
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   72
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   55
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Text Properties"
      Enabled         =   True
      Height          =   97
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   98
      Underline       =   False
      Visible         =   True
      Width           =   466
      Begin FontPicker textFont
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   27
         ListIndex       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   124
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin PopupMenu textFont1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   152
         ListIndex       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   124
         Underline       =   False
         Visible         =   True
         Width           =   46
      End
      Begin Oval stringColor
         AutoDeactivate  =   True
         BorderColor     =   "&c00000000"
         BorderWidth     =   1
         Enabled         =   True
         FillColor       =   "&cFFFFFF00"
         Height          =   24
         HelpTag         =   "Color"
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Left            =   210
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         Top             =   124
         Visible         =   True
         Width           =   24
      End
      Begin CheckBox bold
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Bold"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   252
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   127
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   59
      End
      Begin CheckBox italic
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Italic"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   323
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   128
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   53
      End
      Begin CheckBox underline
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Underline"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   382
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   128
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   77
      End
      Begin TextField textFormat
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   "&cFFFFFF00"
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   159
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "###.#\\%"
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   165
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   161
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   53
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         Text            =   "Text Format:"
         TextAlign       =   2
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   166
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin Oval gradientColor
      AutoDeactivate  =   True
      BorderColor     =   "&c00000000"
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   "&cFFFFFF00"
      Height          =   24
      HelpTag         =   "Gradient Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   337
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText51
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   365
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   33
      TabPanelIndex   =   0
      Text            =   "Gradient End"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin GroupBox GroupBox2
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Run Settings"
      Enabled         =   True
      Height          =   66
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   198
      Underline       =   False
      Visible         =   True
      Width           =   466
      Begin TextField maximum
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   "&cFFFFFF00"
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   134
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   100
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   236
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   55
      End
      Begin Label StaticText4
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   134
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         Text            =   "ProgBar Max:"
         TextAlign       =   0
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   218
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Slider Slider1
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Left            =   243
         LineStep        =   1
         LiveScroll      =   False
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Maximum         =   500
         Minimum         =   25
         PageStep        =   20
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TickStyle       =   0
         Top             =   242
         Value           =   50
         Visible         =   True
         Width           =   143
      End
      Begin Label StaticText41
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   243
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         Text            =   "Timer Speed:"
         TextAlign       =   0
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   218
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Go"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   191
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   270
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin ProgressCanvas ProgressCanvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColor =   "&c80808000"
      BarColor        =   "&c00FF0000"
      BarThickness    =   ""
      Bold            =   False
      Border          =   False
      BorderColor     =   "&c00000000"
      DoubleBuffer    =   True
      Enabled         =   True
      Gradated        =   False
      GradientEndColor=   "&c00400000"
      Height          =   22
      HelpTag         =   ""
      Hilight         =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   4
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      ShowCaption     =   False
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      Ticks           =   ""
      Top             =   4
      Underline       =   False
      UseFocusRing    =   True
      Value           =   0
      Visible         =   True
      Width           =   478
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  BoxColor.FillColor = ProgressCanvas1.BorderColor
		  barColor.FillColor = ProgressCanvas1.barColor
		  barWellColor.FillColor = ProgressCanvas1.BackgroundColor
		  stringColor.FillColor = ProgressCanvas1.textColor
		  gradientColor.FillColor = ProgressCanvas1.GradientEndColor
		  hasBox.Value = ProgressCanvas1.Border
		  hasGradient.Value = ProgressCanvas1.Gradated
		  hasText.Value = ProgressCanvas1.ShowCaption
		  bold.Value = ProgressCanvas1.bold
		  italic.Value = ProgressCanvas1.italic
		  underline.Value = ProgressCanvas1.underline
		  maximum.Text = Str(ProgressCanvas1.maximum)
		  GroupBox1.Enabled = False
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  Static pass As Integer
		  If pass = 0 Then
		    If ProgressCanvas1.Value > 1 Then
		      ProgressCanvas1.Value = ProgressCanvas1.Value -1
		    Else
		      ProgressCanvas1.Value = 0
		      pass = 1
		    End If
		  Else
		    If ProgressCanvas1.Value < ProgressCanvas1.maximum - 1 Then
		      ProgressCanvas1.Value = ProgressCanvas1.Value + 1
		    Else
		      ProgressCanvas1.Value = ProgressCanvas1.maximum
		      pass = 0
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BoxColor
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused  X
		  #pragma Unused  Y
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Box Color")
		  Me.FillColor = c
		  ProgressCanvas1.BorderColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events barColor
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused  X
		  #pragma Unused  Y
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Bar Color")
		  Me.FillColor = c
		  ProgressCanvas1.barColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events hasBox
	#tag Event
		Sub Action()
		  ProgressCanvas1.Border = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events hasGradient
	#tag Event
		Sub Action()
		  ProgressCanvas1.Gradated = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events barWellColor
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused  X
		  #pragma Unused  Y
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Barwell Color")
		  Me.FillColor = c
		  ProgressCanvas1.BackgroundColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events hasText
	#tag Event
		Sub Action()
		  ProgressCanvas1.ShowCaption = Me.Value
		  GroupBox1.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textFont
	#tag Event
		Sub FontSelected(FontName As String)
		  ProgressCanvas1.textFont = FontName
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textFont1
	#tag Event
		Sub Open()
		  Me.AddRow("Size")
		  Me.ListIndex = 0
		  For i As Integer = 8 To 72
		    Me.AddRow(Str(i))
		    If ProgressCanvas1.textSize = i Then Me.ListIndex = i - 7
		  Next
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex <> 0 Then ProgressCanvas1.textSize = Val(Me.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events stringColor
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused  X
		  #pragma Unused  Y
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Text Color")
		  Me.FillColor = c
		  ProgressCanvas1.textColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events bold
	#tag Event
		Sub Action()
		  ProgressCanvas1.bold = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events italic
	#tag Event
		Sub Action()
		  ProgressCanvas1.italic = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events underline
	#tag Event
		Sub Action()
		  ProgressCanvas1.underline = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gradientColor
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused  X
		  #pragma Unused  Y
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Gradient End Color")
		  Me.FillColor = c
		  ProgressCanvas1.GradientEndColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events maximum
	#tag Event
		Sub TextChange()
		  ProgressCanvas1.maximum = Val(Me.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  Timer1.Period = (Me.Maximum - Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Value = (Me.Maximum - Timer1.Period)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  If Timer1.Mode = Timer.ModeOff Then
		    Timer1.Mode = Timer.ModeMultiple
		    Me.Caption = "Stop"
		  Else
		    Timer1.Mode = Timer.ModeOff
		    Me.Caption = "Go"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProgressCanvas1
	#tag Event
		Function GetText() As String
		  Return Format((Me.Value*100) / Me.maximum, textFormat.Text)
		End Function
	#tag EndEvent
#tag EndEvents
