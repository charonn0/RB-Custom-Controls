#tag Window
Begin Window ProgressBarwindow
   BackColor       =   14486461
   Backdrop        =   ""
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
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "ProgBar Test"
   Visible         =   True
   Width           =   486
   Begin ProgBar ProgBar1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      barColor        =   65280
      barWell         =   12632256
      bold            =   False
      boxColor        =   0
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      gradientEnd     =   39758
      hasBox          =   False
      hasGradient     =   True
      hasText         =   False
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      italic          =   False
      Left            =   3
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      maximum         =   100
      PreText         =   ""
      Scope           =   0
      ShowValue1      =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      textColor       =   0
      textFont        =   "System"
      textFormat      =   "###.0\\%"
      textSize        =   0
      Top             =   5
      underline       =   False
      UseFocusRing    =   True
      value           =   0
      value1          =   ""
      Visible         =   True
      Width           =   483
   End
   Begin Timer Timer1
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   523
      LockedInPosition=   False
      Mode            =   0
      Period          =   50
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   60
      Visible         =   True
      Width           =   32
   End
   Begin Oval BoxColor
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Box Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   27
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Oval barColor
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Bar Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   136
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   54
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Box Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   53
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   165
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Bar Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   49
   End
   Begin CheckBox hasBox
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Has Box"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   45
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   72
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   80
   End
   Begin CheckBox hasGradient
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Gradient"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   204
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   72
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   67
   End
   Begin Oval barWellColor
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Barwell Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   243
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText5
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   271
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Barwell"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   54
   End
   Begin CheckBox hasText
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Text"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   351
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   72
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   55
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Text Properties"
      Enabled         =   True
      Height          =   97
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   98
      Underline       =   ""
      Visible         =   True
      Width           =   466
      Begin PopupMenu textFont
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   27
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   124
         Underline       =   ""
         Visible         =   True
         Width           =   120
      End
      Begin PopupMenu textFont1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   152
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   124
         Underline       =   ""
         Visible         =   True
         Width           =   46
      End
      Begin Oval stringColor
         AutoDeactivate  =   True
         BorderColor     =   0
         BorderWidth     =   1
         Enabled         =   True
         FillColor       =   16777215
         Height          =   24
         HelpTag         =   "Color"
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Left            =   210
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   124
         Visible         =   True
         Width           =   24
      End
      Begin CheckBox bold
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Bold"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   252
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   127
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   59
      End
      Begin CheckBox italic
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Italic"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   323
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   128
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   53
      End
      Begin CheckBox underline
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Underline"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   382
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   128
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   77
      End
      Begin TextField textFormat
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   16777215
         Bold            =   ""
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
         Italic          =   ""
         Left            =   159
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "###.#\\%"
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   165
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   161
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   ""
         Left            =   53
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Text Format:"
         TextAlign       =   2
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   166
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   100
      End
   End
   Begin Oval gradientColor
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Gradient Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   337
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   38
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText51
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   365
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gradient End"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   94
   End
   Begin GroupBox GroupBox2
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Run Settings"
      Enabled         =   True
      Height          =   66
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   198
      Underline       =   ""
      Visible         =   True
      Width           =   466
      Begin TextField maximum
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   16777215
         Bold            =   ""
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
         Italic          =   ""
         Left            =   134
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   100
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   236
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   55
      End
      Begin Label StaticText4
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   134
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "ProgBar Max:"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   218
         Transparent     =   True
         Underline       =   ""
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
         LiveScroll      =   ""
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
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
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   ""
         Left            =   243
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Timer Speed:"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   218
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   100
      End
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Go"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   191
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   270
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  BoxColor.FillColor = progBar1.boxColor
		  barColor.FillColor = progBar1.barColor
		  barWellColor.FillColor = progBar1.barWell
		  stringColor.FillColor = ProgBar1.textColor
		  gradientColor.FillColor = ProgBar1.gradientEnd
		  hasBox.Value = ProgBar1.hasBox
		  hasGradient.Value = ProgBar1.hasGradient
		  hasText.Value = ProgBar1.hasText
		  bold.Value = ProgBar1.bold
		  italic.Value = ProgBar1.italic
		  underline.Value = ProgBar1.underline
		  textFormat.Text = ProgBar1.textFormat
		  maximum.Text = Str(ProgBar1.maximum)
		  GroupBox1.Enabled = False
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  Static pass As Integer
		  If pass = 0 Then
		    If ProgBar1.Value > 1 Then
		      ProgBar1.Value = ProgBar1.Value -1
		    Else
		      ProgBar1.Value = 0
		      pass = 1
		    End If
		  Else
		    If ProgBar1.Value < ProgBar1.maximum - 1 Then
		      ProgBar1.Value = ProgBar1.Value + 1
		    Else
		      ProgBar1.Value = ProgBar1.maximum
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
		  ProgBar1.boxColor = c
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
		  ProgBar1.barColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events hasBox
	#tag Event
		Sub Action()
		  ProgBar1.hasBox = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events hasGradient
	#tag Event
		Sub Action()
		  ProgBar1.hasGradient = Me.Value
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
		  ProgBar1.barWell = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events hasText
	#tag Event
		Sub Action()
		  ProgBar1.hasText = Me.Value
		  GroupBox1.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textFont
	#tag Event
		Sub Open()
		  Me.AddRow("Font")
		  Me.ListIndex = 0
		  Dim fonts() As String
		  For i As Integer = 1 To FontCount - 1
		    Dim textfont As String = Font(i)
		    fonts.Append(textfont)
		  Next
		  fonts.Sort
		  For i As Integer = 0 To fonts.Ubound
		    Me.AddRow(fonts(i))
		    If ProgBar1.textFont = fonts(i) Then Me.ListIndex = i
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex <> 0 Then ProgBar1.textFont = Me.Text
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
		    If ProgBar1.textSize = i Then Me.ListIndex = i - 7
		  Next
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex <> 0 Then ProgBar1.textSize = Val(Me.Text)
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
		  ProgBar1.textColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events bold
	#tag Event
		Sub Action()
		  ProgBar1.bold = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events italic
	#tag Event
		Sub Action()
		  ProgBar1.italic = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events underline
	#tag Event
		Sub Action()
		  ProgBar1.underline = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textFormat
	#tag Event
		Sub TextChange()
		  ProgBar1.textFormat = Me.Text
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
		  ProgBar1.gradientEnd = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events maximum
	#tag Event
		Sub TextChange()
		  ProgBar1.maximum = Val(Me.Text)
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
