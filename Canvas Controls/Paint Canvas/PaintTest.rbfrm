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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   499095551
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
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
		  Case "Polygon"
		    PaintCanvas1.Mode = PaintCanvas.DrawingModes.Polygon
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
		  Me.AddRow("Polygon")
		  Me.AddRow("Flood fill")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PaintCanvas1
	#tag Event
		Sub Open()
		  Dim r As New REALbasic.Rect(Me.Width - 15, Me.Height - 15, 15, 15)
		  Me.AddControlItem(r, "ColorSelect")
		  r = New REALbasic.Rect(Me.Width - 15, 0, 15, 15)
		  Me.AddControlItem(r, "Line")
		End Sub
	#tag EndEvent
	#tag Event
		Sub ControlItemPaint(g As Graphics, Index As Integer)
		  Select Case Me.ControlItemTag(Index)
		  Case "ColorSelect"
		    Dim p As New REALbasic.Point(Me.MouseX, Me.MouseY)
		    If Me.ControlItem(Index).Contains(p) And Me.ControlItem(Index).Width <> 50 Then
		      Me.ControlItem(Index).Left = Me.Width - 50
		      Me.ControlItem(Index).Top = Me.Height - 50
		      Me.ControlItem(Index).Width = 50
		      Me.ControlItem(Index).Height = 50
		    ElseIf Me.ControlItem(Index).Width <> 15 And Not Me.ControlItem(Index).Contains(p) Then
		      Me.ControlItem(Index).Left = Me.Width - 15
		      Me.ControlItem(Index).Top = Me.Height - 15
		      Me.ControlItem(Index).Width = 15
		      Me.ControlItem(Index).Height = 15
		    Else
		      Me.ControlItem(Index).Left = Me.Width - Me.ControlItem(Index).Width
		      Me.ControlItem(Index).Top = Me.Height - Me.ControlItem(Index).Height
		    End If
		    g.ForeColor = Me.DrawingColor ' color select
		    g.FillRect(0, 0, g.Width, g.Height)
		    If Me.ControlItem(Index).Width = 50 Then
		      g.DrawPicture(Color_palette, 0, 0, g.Width, g.Height, 0, 0, Color_palette.Width, Color_palette.Height)
		    End If
		    
		  Case "Line"
		    Dim p As New REALbasic.Point(Me.MouseX, Me.MouseY)
		    If Me.ControlItem(Index).Contains(p) And Me.ControlItem(Index).Width <> 50 Then
		      Me.ControlItem(Index).Left = Me.Width - 50
		      Me.ControlItem(Index).Width = 50
		      Me.ControlItem(Index).Height = 50
		    ElseIf Me.ControlItem(Index).Width <> 15 And Not Me.ControlItem(Index).Contains(p) Then
		      Me.ControlItem(Index).Left = Me.Width - 15
		      Me.ControlItem(Index).Width = 15
		      Me.ControlItem(Index).Height = 15
		    Else
		      Me.ControlItem(Index).Left = Me.Width - Me.ControlItem(Index).Width
		      'Me.ControlItem(Index).Top = Me.Height - Me.ControlItem(Index).Height
		    End If
		    g.ForeColor = &cFFFFFF00
		    g.FillRect(0, 0, g.Width, g.Height)
		    'If Me.ControlItem(Index).Width = 50 Then
		    g.DrawPicture(pen_icon, 0, 0, g.Width, g.Height, 0, 0, pen_icon.Width, pen_icon.Height)
		    'End If
		  End Select
		  
		  g.ForeColor = &c00000000
		  g.PenHeight = 1
		  g.PenWidth = 1
		  g.DrawRect(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ControlItemAction(Index As Integer)
		  Select Case Me.ControlItemTag(Index)
		  Case "ColorSelect"
		    Dim c As Color = PaintCanvas1.DrawingColor
		    If SelectColor(c, "") Then
		      PaintCanvas1.DrawingColor = c
		    End If
		  Case "Line"
		    Me.LastMode = PaintCanvas.DrawingModes.Point
		  End Select
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
