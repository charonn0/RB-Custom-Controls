#tag Window
Begin Window GraphWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   499
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   853391359
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "LineGraph Test"
   Visible         =   True
   Width           =   871
   Begin graph graph1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      background      =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      graphColor      =   65280
      gridColor       =   3618615
      gridHeight      =   10
      gridWidth       =   10
      hasGrid         =   True
      Height          =   449
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      LastX           =   0
      LastY           =   0
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   871
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Add Points"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   453
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Link Points"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   477
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Add Linked Point"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   112
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   453
      Underline       =   ""
      Visible         =   True
      Width           =   109
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Clear"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   112
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   477
      Underline       =   ""
      Visible         =   True
      Width           =   109
   End
   Begin Slider gridWidth
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   245
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Maximum         =   100
      Minimum         =   5
      PageStep        =   20
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   477
      Value           =   5
      Visible         =   True
      Width           =   193
   End
   Begin Slider gridHeight
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   245
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Maximum         =   100
      Minimum         =   5
      PageStep        =   20
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   452
      Value           =   5
      Visible         =   True
      Width           =   193
   End
   Begin Label StaticText511
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
      Left            =   489
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Background"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   455
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   94
   End
   Begin ColorSelector gradientColor1
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Gradient Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   461
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   453
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText5111
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
      Left            =   623
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Graph Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   455
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   94
   End
   Begin Label StaticText51111
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
      Left            =   742
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Grid Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   455
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   94
   End
   Begin ColorSelector gradientColor11
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Gradient Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   595
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   453
      Visible         =   True
      Width           =   24
   End
   Begin ColorSelector gradientColor111
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Gradient Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   716
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   453
      Visible         =   True
      Width           =   24
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Dim rand As New Random
		  graph1.Clear
		  For x As Integer = 0 To Graph1.Width Step 15
		    Graph1.addPoint(x, rand.InRange(0, Graph1.Height))
		  Next
		  graph1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Dim rand As New Random
		  graph1.Clear
		  For x As Integer = 0 To Graph1.Width Step 15
		    Graph1.LinkPoints(x, rand.InRange(0, Graph1.Height), x + 10, rand.InRange(0, Graph1.Height))
		  Next
		  graph1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Dim rand As New Random
		  graph1.Clear
		  For x As Integer = 0 To Graph1.Width Step 15
		    Graph1.addLinkedPoint(x, rand.InRange(0, Graph1.Height))
		  Next
		  graph1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  Graph1.Clear
		  graph1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gridWidth
	#tag Event
		Sub ValueChanged()
		  Graph1.gridWidth = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gridHeight
	#tag Event
		Sub ValueChanged()
		  Graph1.gridHeight = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gradientColor1
	#tag Event
		Sub ColorSelected(c As Color)
		  graph1.background = c
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.FillColor = Graph1.background
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gradientColor11
	#tag Event
		Sub ColorSelected(c As Color)
		  graph1.graphColor = c
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.FillColor = Graph1.graphColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gradientColor111
	#tag Event
		Sub ColorSelected(c As Color)
		  graph1.gridColor = c
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.FillColor = Graph1.gridColor
		End Sub
	#tag EndEvent
#tag EndEvents
