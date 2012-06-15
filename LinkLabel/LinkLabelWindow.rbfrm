#tag Window
Begin Window LinkLabelWindow
   BackColor       =   16777215
   Backdrop        =   ""
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
      ActiveColor     =   16711680
      AltText         =   "Visit us on the web!"
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Draggable       =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      HilightColor    =   65535
      HoverPeriod     =   250
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   149
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
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
      TextColor       =   255
      TextFont        =   "Consolas"
      TextSize        =   15
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
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   218
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
      Text            =   "Not Hovering"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   23
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin HintTextField TextField1
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
      HasText         =   ""
      Height          =   22
      HelpTag         =   ""
      HintText        =   "Drag the link here"
      Index           =   -2147483648
      Italic          =   ""
      Left            =   250
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   286
   End
   Begin TextField TextField2
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
      Italic          =   ""
      Left            =   0
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Visit us on the web!"
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
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
