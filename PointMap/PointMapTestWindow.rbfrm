#tag Window
Begin Window PointMapTestWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   538
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
   Placement       =   1
   Resizeable      =   False
   Title           =   "PointMap"
   Visible         =   True
   Width           =   1040
   Begin PointMap PointMap1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   538
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PointHeight     =   10
      PointWidth      =   10
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   1040
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function TextToPicture(Text As String, Font As String = "System", FontSize As Single = 11.0, Bold As Boolean = False, Underline As Boolean = False, Italic As Boolean = False, forecolor As Color = &c00000000, BackColor As Color = &cFFFFFF00) As Picture
		  //Given any String, returns a picture of that string. Line breaks are honored.
		  //The optional parameters ought to be self-explanitory.
		  
		  If Text = "" Then
		    Return New Picture(1, 1, 32)
		  End If
		  Dim lines() As Picture
		  Dim requiredHeight, requiredWidth As Integer
		  Dim tlines() As String = Split(Text, EndOfLine)
		  
		  For i As Integer = 0 To UBound(tlines)
		    If tlines(i) = "" Then tlines(i) = " "
		    Dim p As New Picture(250, 250, 24)
		    p.Graphics.TextFont = Font
		    p.Graphics.TextSize = FontSize
		    p.Graphics.Bold = Bold
		    p.Graphics.Italic = Italic
		    p.Graphics.Underline = Underline
		    Dim nm As String = tlines(i)
		    Dim strWidth, strHeight As Integer
		    strWidth = p.Graphics.StringWidth(nm) + 5
		    strHeight = p.Graphics.StringHeight(nm, strWidth)
		    p = New Picture(strWidth, strHeight, 32)
		    p.Graphics.ForeColor = BackColor
		    p.Graphics.FillRect(0, 0, p.Width, p.Height)
		    p.Graphics.AntiAlias = True
		    p.Graphics.ForeColor = forecolor
		    p.Graphics.TextFont = Font
		    p.Graphics.TextSize = FontSize
		    p.Graphics.Bold = Bold
		    p.Graphics.Italic = Italic
		    p.Graphics.Underline = Underline
		    p.Graphics.DrawString(nm, 1, ((p.Height\2) + (strHeight\4)))
		    lines.Append(p)
		    requiredHeight = requiredHeight + p.Height
		    If p.Width > requiredWidth Then requiredWidth = p.Width
		  Next
		  Dim txtBuffer As Picture
		  txtBuffer = New Picture(requiredWidth, requiredHeight, 24)
		  Dim x, y As Integer
		  For i As Integer = 0 To UBound(lines)
		    txtBuffer.Graphics.DrawPicture(lines(i), x, y)
		    y = y + lines(i).Height
		  Next
		  'txtBuffer.Transparent = 1
		  Return txtBuffer
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		PointHelpText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PointHelpX As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		PointHelpY As Integer = -1
	#tag EndProperty


#tag EndWindowCode

#tag Events PointMap1
	#tag Event
		Sub Paint(g As Graphics)
		  g.ForeColor = &c0080FF00
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.DrawPicture(world, 0, 0)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointPaint(g As Graphics, X As Integer, Y As Integer)
		  g.ForeColor = &cFF000000
		  g.PenHeight = 3
		  g.PenWidth = 3
		  g.DrawOval(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AddPoint(195, 144)
		  Me.PointTag(195, 144) = "New York City"
		  
		  Me.AddPoint(59, 143)
		  Me.PointTag(59, 143) = "San Francisco"
		  
		  Me.AddPoint(428, 96)
		  Me.PointTag(428, 96) = "London"
		  
		  Me.AddPoint(434, 113)
		  Me.PointTag(434, 113) = "Paris"
		  
		  Me.AddPoint(495, 392)
		  Me.PointTag(495, 392) = "Cape Town"
		  
		  Me.AddPoint(674, 181)
		  Me.PointTag(674, 181) = "New Delhi"
		  
		  Me.AddPoint(875, 403)
		  Me.PointTag(875, 403) = "Sydney"
		  
		  Me.AddPoint(512, 177)
		  Me.PointTag(512, 177) = "Cairo"
		  
		  Me.AddPoint(564, 191)
		  Me.PointTag(564, 191) = "Riyadh"
		  
		  Me.AddPoint(276, 359)
		  Me.PointTag(276, 359) = "São Paulo"
		  
		  Me.AddPoint(844, 152)
		  Me.PointTag(844, 152) = "Tokyo"
		End Sub
	#tag EndEvent
	#tag Event
		Sub PostPaint(g As Graphics)
		  If PointHelpText.Trim <> "" Then
		    Dim tmp As Picture = TextToPicture(PointHelpText, "System", 11, True, False, False, &c000000, &cFFFFFE)
		    Dim x, y As Integer
		    If Me.MouseX + 10 + tmp.Width > g.Width - 5 Then
		      x = Me.MouseX - tmp.Width
		    Else
		      x = Me.MouseX + 10
		    End If
		    
		    If Me.MouseY + 10 + tmp.Height > g.Height - 5 Then
		      y = Me.MouseY - tmp.Height
		    Else
		      y = Me.MouseY + 10
		    End If
		    
		    g.DrawPicture(tmp, x, y)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointMouseEnter(X As Integer, Y As Integer)
		  PointHelpText = Me.PointTag(X, Y)
		  PointHelpX = X
		  PointHelpY = Y
		  Me.Refresh(False)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointMouseExit()
		  PointHelpText = ""
		  PointHelpX = -1
		  PointHelpY = -1
		  Me.Refresh(False)
		End Sub
	#tag EndEvent
	#tag Event
		Function PointMouseDown(X As Integer, Y As Integer) As Boolean
		  Dim s As String = Me.PointTag(X, Y)
		  MsgBox(s)
		End Function
	#tag EndEvent
#tag EndEvents
