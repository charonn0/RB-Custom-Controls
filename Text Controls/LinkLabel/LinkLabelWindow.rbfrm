#tag Window
Begin Window LinkLabelWindow
   BackColor       =   -256
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   77
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2094170111
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "LinkLabel Test"
   Visible         =   True
   Width           =   536
   Begin LinkLabel LinkLabel1
      AltText         =   "Visit us on the web!"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Draggable       =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      HilightColor    =   "&c0080FF00"
      HoverPeriod     =   250
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   149
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      ResetPeriod     =   1000
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Boredom Software"
      TextAlign       =   1
      TextFont        =   "Consolas"
      TextSize        =   15.0
      TextUnit        =   0
      Top             =   44
      Transparent     =   True
      Underline       =   False
      URL             =   "http://www.boredomsoft.org"
      Visible         =   True
      Width           =   238
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   218
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Not Hovering"
      TextAlign       =   1
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   23
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin HintTextField TextField1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      HasText         =   False
      Height          =   22
      HelpTag         =   ""
      HintText        =   "Drag the link here"
      Index           =   -2147483648
      Italic          =   False
      Left            =   250
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   286
   End
   Begin TextField TextField2
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
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
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Visit us on the web!"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   247
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events LinkLabel1
	#tag Event
		Sub Action()
		  ShowURL(Me.URL)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Hover()
		  Label1.Text = "Hovering!"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Label1.Text = "Not Hovering"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextField1
	#tag Event
		Sub Open()
		  Me.AcceptTextDrop()
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(Obj As DragItem, action As Integer)
		  #pragma Unused action
		  If obj.TextAvailable Then
		    Me.Text = Obj.Text
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextField2
	#tag Event
		Sub TextChange()
		  LinkLabel1.AltText = Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
