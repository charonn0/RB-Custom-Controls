#tag Window
Begin Window SliderWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   237
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
   Title           =   "Slider Test"
   Visible         =   True
   Width           =   486
   Begin SliderCanvas Slider1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      BarColor        =   65280
      BarWell         =   12632256
      Border          =   True
      BoxColor        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Gradated        =   True
      GradientEnd     =   39758
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   3
      LiveScroll      =   False
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      ThumbColor      =   0
      ThumbStyle      =   2
      TickColor       =   0
      Ticks           =   True
      Top             =   5
      UseFocusRing    =   True
      Value           =   0
      Visible         =   True
      Width           =   480
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
      Left            =   127
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   65
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
      Left            =   127
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   103
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
      Left            =   154
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Box Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   67
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
      Left            =   156
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Bar Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   105
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   49
   End
   Begin CheckBox Border
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
      Left            =   207
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   33
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   64
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
      Left            =   283
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   33
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
      Left            =   127
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      Top             =   143
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
      Left            =   155
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      Text            =   "Barwell"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   145
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   54
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
      Left            =   245
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      Top             =   103
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
      Left            =   273
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   33
      TabPanelIndex   =   0
      Text            =   "Gradient End"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   105
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   94
   End
   Begin Oval ThumbColor
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Gradient Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   245
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      Top             =   67
      Visible         =   True
      Width           =   24
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
      Left            =   273
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   37
      TabPanelIndex   =   0
      Text            =   "Thumb Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   69
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   94
   End
   Begin CheckBox HasTicks
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Has Ticks"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   127
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   33
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   80
   End
   Begin Oval TickColor
      AutoDeactivate  =   True
      BorderColor     =   0
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   16777215
      Height          =   24
      HelpTag         =   "Gradient Color"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   245
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   39
      TabPanelIndex   =   0
      Top             =   141
      Visible         =   True
      Width           =   24
   End
   Begin Label StaticText512
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
      Left            =   273
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   40
      TabPanelIndex   =   0
      Text            =   "Tick Color"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   143
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   94
   End
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   140
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   100
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   195
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   43
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   42
      TabPanelIndex   =   0
      Text            =   "Slider Maximum"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   195
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label sliderval
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
      Left            =   324
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   43
      TabPanelIndex   =   0
      Text            =   0
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   195
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   242
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   44
      TabPanelIndex   =   0
      Text            =   "Current Value:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   195
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   76
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Enabled"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   362
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   1
      TabIndex        =   45
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   33
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox LiveScroll
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Live Scroll"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   43
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   46
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   33
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   80
   End
   Begin ComboBox ComboBox1
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "SmallRect\r\nBigRect\r\nSmallOval\r\nBigOval"
      Italic          =   ""
      Left            =   362
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   47
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   65
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   91
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  ThumbColor.FillColor = Slider1.ThumbColor
		  TickColor.FillColor = Slider1.TickColor
		  BoxColor.FillColor = Slider1.boxColor
		  barColor.FillColor = Slider1.barColor
		  barWellColor.FillColor = Slider1.barWell
		  gradientColor.FillColor = Slider1.gradientEnd
		  
		  Border.Value = Slider1.Border
		  hasGradient.Value = Slider1.Gradated
		  maximum.Text = Str(Slider1.maximum)
		  sliderval.Text = Str(Slider1.value)
		  HasTicks.Value = Slider1.Ticks
		  LiveScroll.Value = Slider1.LiveScroll
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  sliderval.Text = Str(Me.value)
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
		  #pragma Unused X
		  #pragma Unused Y
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Box Color")
		  Me.FillColor = c
		  Slider1.boxColor = c
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
		  #pragma Unused X
		  #pragma Unused Y
		  
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Bar Color")
		  Me.FillColor = c
		  Slider1.barColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Border
	#tag Event
		Sub Action()
		  Slider1.Border = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events hasGradient
	#tag Event
		Sub Action()
		  Slider1.Gradated = Me.Value
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
		  #pragma Unused X
		  #pragma Unused Y
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Barwell Color")
		  Me.FillColor = c
		  Slider1.barWell = c
		End Function
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
		  #pragma Unused X
		  #pragma Unused Y
		  
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Gradient End Color")
		  Me.FillColor = c
		  Slider1.gradientEnd = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ThumbColor
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
		  #pragma Unused X
		  #pragma Unused Y
		  
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Thumb Color")
		  Me.FillColor = c
		  Slider1.ThumbColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events HasTicks
	#tag Event
		Sub Action()
		  Slider1.Ticks = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TickColor
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
		  #pragma Unused X
		  #pragma Unused Y
		  
		  Dim c As Color = Me.FillColor
		  Call SelectColor(c, "Choose a Tick Color")
		  Me.FillColor = c
		  Slider1.TickColor = c
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events maximum
	#tag Event
		Sub TextChange()
		  Slider1.maximum = Val(Me.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub Action()
		  Slider1.Enabled = Me.Value
		  Slider1.Refresh(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LiveScroll
	#tag Event
		Sub Action()
		  Slider1.LiveScroll = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ComboBox1
	#tag Event
		Sub Change()
		  Slider1.ThumbStyle = Me.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
