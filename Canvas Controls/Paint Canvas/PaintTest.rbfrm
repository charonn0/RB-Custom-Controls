#tag Window
Begin Window PaintTest
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.63e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   499095551
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Paint Test"
   Visible         =   True
   Width           =   7.35e+2
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   0
      ListIndex       =   0
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
      Top             =   542
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PaintCanvas PaintCanvas1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      DrawingColor    =   16711680
      Enabled         =   True
      Height          =   530
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PenSize         =   4
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   735
   End
   Begin TextField TextField1
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
      Left            =   104
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   540
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   225
   End
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   341
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   534
      UseFocusRing    =   True
      Visible         =   True
      Width           =   23
   End
   Begin PopupMenu PopupMenu2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   376
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   534
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
			PaintCanvas1.Clear
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUndo() As Boolean Handles EditUndo.Action
			'Call PaintCanvas1.UnDo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReDoItem() As Boolean Handles ReDoItem.Action
			'Call PaintCanvas1.ReDo
			Return True
			
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events PopupMenu1
	#tag Event
		Sub Change()
		  Select Case Me.Text
		  Case "Filled oval"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.FilledOval
		  Case "Filled rectangle"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.FilledRect
		  Case "Line"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.Line
		  Case "Oval"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.Oval
		  Case "Freehand"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.Point
		  Case "Rectangle"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.Rect
		  Case "Flood fill"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.FloodFill
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AddRow("Filled oval")
		  Me.AddRow("Filled rectangle")
		  Me.AddRow("Line")
		  Me.AddRow("Oval")
		  Me.AddRow("Freehand")
		  Me.AddRow("Rectangle")
		  Me.AddRow("Flood fill")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextField1
	#tag Event
		Sub KeyUp(Key As String)
		  #pragma Unused key
		  PaintCanvas1.PreviewText(New REALbasic.Point(10, 10), Me.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  g.ForeColor = PaintCanvas1.DrawingColor
		  g.FillRect(2, 2, g.Width - 4, G.Height - 4)
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  Dim c As Color = PaintCanvas1.DrawingColor
		  If SelectColor(c, "New brush color") Then
		    PaintCanvas1.DrawingColor = c
		    Me.Invalidate
		  End If
		End Sub
	#tag EndEvent
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
#tag EndEvents
#tag Events PopupMenu2
	#tag Event
		Sub Open()
		  For i As Integer = 1 To 10
		    Me.AddRow(Str(i))
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  PaintCanvas1.PenSize = Val(Me.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
