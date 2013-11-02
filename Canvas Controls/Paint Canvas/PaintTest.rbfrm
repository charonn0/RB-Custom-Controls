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
	#tag Event
		Sub Resizing()
		  PaintCanvas1.Invalidate
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
			PaintCanvas1.Clear
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h1
		Protected ControlIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected EyeDropColor As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected EyeDropMode As Boolean
	#tag EndProperty


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
		  Dim r As REALbasic.Rect
		  
		  r = New REALbasic.Rect(Me.Width - 35, 0, 35, 35)
		  Me.AddControlItem(r, "Freehand")
		  
		  r = New REALbasic.Rect(Me.Width - 35, 35, 35, 35)
		  Me.AddControlItem(r, "Rect")
		  
		  r = New REALbasic.Rect(Me.Width - 35, 70, 35, 35)
		  Me.AddControlItem(r, "FilledRect")
		  
		  r = New REALbasic.Rect(Me.Width - 35, 105, 35, 35)
		  Me.AddControlItem(r, "Oval")
		  
		  r = New REALbasic.Rect(Me.Width - 35, 140, 35, 35)
		  Me.AddControlItem(r, "FilledOval")
		  
		  r = New REALbasic.Rect(Me.Width - 35, 175, 35, 35)
		  Me.AddControlItem(r, "FloodFill")
		  
		  r = New REALbasic.Rect(Me.Width - 35, 210, 35, 35)
		  Me.AddControlItem(r, "Line")
		  
		  'r = New REALbasic.Rect(Me.Width - 35, 245, 35, 35)
		  'Me.AddControlItem(r, "EyeDropper")
		  
		  r = New REALbasic.Rect(Me.Width - 35, 280, 35, 35)
		  Me.AddControlItem(r, "ColorSelect")
		End Sub
	#tag EndEvent
	#tag Event
		Sub ControlItemPaint(g As Graphics, Index As Integer)
		  g.ForeColor = &cFFFFFF00
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  Select Case Me.ControlItemTag(Index)
		  Case "ColorSelect"
		    g.ForeColor = Me.DrawingColor ' color select
		    g.FillRect(0, 0, g.Width, g.Height)
		    g.DrawPicture(Color_palette, 0, 0, g.Width, g.Height, 0, 0, Color_palette.Width, Color_palette.Height)
		    
		  Case "Freehand"
		    g.DrawPicture(pen_icon, 0, 0, g.Width, g.Height, 0, 0, pen_icon.Width, pen_icon.Height)
		    
		  Case "FloodFill"
		    g.DrawPicture(floodfill, 0, 0, g.Width, g.Height, 0, 0, floodfill.Width, floodfill.Height)
		    
		  Case "Line"
		    g.DrawPicture(drawline, 0, 0, g.Width, g.Height, 0, 0, drawline.Width, drawline.Height)
		    
		  Case "Rect"
		    g.DrawPicture(square, 0, 0, g.Width, g.Height, 0, 0, square.Width, square.Height)
		    
		  Case "FilledRect"
		    g.DrawPicture(filledsquare, 0, 0, g.Width, g.Height, 0, 0, filledsquare.Width, filledsquare.Height)
		    
		  Case "Oval"
		    g.DrawPicture(circle, 0, 0, g.Width, g.Height, 0, 0, circle.Width, circle.Height)
		    
		  Case "FilledOval"
		    g.DrawPicture(filledcircle, 0, 0, g.Width, g.Height, 0, 0, filledcircle.Width, filledcircle.Height)
		    
		  Case "EyeDropper"
		    g.DrawPicture(eye_dropper, 0, 0, g.Width, g.Height, 0, 0, eye_dropper.Width, eye_dropper.Height)
		    
		  End Select
		  
		  
		  
		  If Index = ControlIndex Then
		    g.ForeColor = &c0000FF00
		    g.PenHeight = 3
		    g.PenWidth = 3
		  Else
		    g.ForeColor = &c00000000
		    g.PenHeight = 1
		    g.PenWidth = 1
		  End If
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
		    Return
		    
		  Case "Freehand"
		    Me.LastMode = PaintCanvas.DrawingModes.Point
		    
		  Case "Rect"
		    Me.LastMode = PaintCanvas.DrawingModes.Rect
		    
		  Case "FilledRect"
		    Me.LastMode = PaintCanvas.DrawingModes.FilledRect
		    
		  Case "Oval"
		    Me.LastMode = PaintCanvas.DrawingModes.Oval
		    
		  Case "FilledOval"
		    Me.LastMode = PaintCanvas.DrawingModes.FilledOval
		    
		  Case "Line"
		    Me.LastMode = PaintCanvas.DrawingModes.Line
		    
		  Case "FloodFill"
		    Me.LastMode = PaintCanvas.DrawingModes.FloodFill
		    
		  Case "EyeDropper"
		    'Me.LastMode = PaintCanvas.DrawingModes.FloodFill
		    EyeDropMode = True
		    
		  End Select
		  ControlIndex = Index
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim p As New REALbasic.Point(Me.MouseX, Me.MouseY)
		  Dim ccount As Integer = PaintCanvas1.ControlItemCount - 1
		  Dim pos As Integer
		  For i As Integer = 0 To ccount
		    Dim r As REALbasic.Rect = PaintCanvas1.ControlItem(i)
		    
		    r.Top = pos
		    If r.Contains(p) Then
		      r.Left = Me.Width - 45
		      r.Width = 45
		      r.Height = 45
		    Else
		      r.Left = Me.Width - 35
		      r.Width = 35
		      r.Height = 35
		    End If
		    pos = r.Bottom
		    PaintCanvas1.ControlItem(i) = r
		  Next
		  Me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Dim ccount As Integer = PaintCanvas1.ControlItemCount - 1
		  Dim pos As Integer
		  For i As Integer = 0 To ccount
		    Dim r As REALbasic.Rect = PaintCanvas1.ControlItem(i)
		    r.Top = pos
		    r.Left = Me.Width - 35
		    r.Width = 35
		    r.Height = 35
		    pos = r.Bottom
		    PaintCanvas1.ControlItem(i) = r
		  Next
		  Me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If EyeDropMode Then
		    Me.DrawingColor = Me.DrawingBuffer.Graphics.Pixel(X, Y)
		    Me.Invalidate(False)
		    Return True
		  End If
		End Function
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
