#tag Class
Protected Class PaintCanvas
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If IsContextualClick Then
		    Overlay = Nil
		    CancelDraw = True
		    Return True
		  End If
		  'Check if we're dragging the resize thumb
		  Dim p As New REALbasic.Point(X, Y)
		  Dim view As New REALbasic.Rect(ViewOffset.X, ViewOffset.Y, DrawingBuffer.Width, DrawingBuffer.Height)
		  Dim thumb As New REALbasic.Rect(DrawingBuffer.Width + ViewOffset.X, DrawingBuffer.Height + ViewOffset.Y, 5, 5)  //Resize thumb
		  If thumb.Contains(p) Then
		    ' mouse is over the resize thumb
		    Me.LastMode = Me.Mode
		    Me.Mode = DrawingModes.Resizing
		    Me.MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		    Return True
		  ElseIf view.Contains(p) Then
		    ' mouse is inside the picture
		    Select Case Me.Mode
		    Case DrawingModes.Line, DrawingModes.Oval, DrawingModes.Rect, DrawingModes.Point, DrawingModes.FilledRect, DrawingModes.FilledOval
		      DragStart = p
		    Case DrawingModes.FloodFill
		      DrawFill(p)
		    End Select
		  End If
		  Me.Invalidate(False)
		  Return RaiseEvent MouseDown(X, Y) <> True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  Dim p As New REALbasic.Point(X, Y)
		  Dim rect As New REALbasic.Rect(DragStart.X, DragStart.Y, X - DragStart.X, Y - DragStart.Y)
		  
		  If IsContextualClick Then
		    Overlay = Nil
		    CancelDraw = True
		  End If
		  
		  Select Case Mode
		  Case DrawingModes.Line
		    PreviewLine(DragStart, p)
		  Case DrawingModes.Oval
		    PreviewOval(rect, False)
		  Case DrawingModes.Rect
		    PreviewRect(rect, False)
		  Case DrawingModes.FilledRect
		    PreviewRect(rect, True)
		  Case DrawingModes.FilledOval
		    PreviewOval(rect, True)
		  Case DrawingModes.Point
		    If DragStart.X <> X Or DragStart.Y <> Y Then
		      PreviewPoint(p)
		    End If
		    DragStart = New REALbasic.Point(X, Y)
		  Case DrawingModes.Resizing
		    DragStart.X = X
		    DragStart.Y = Y
		    Me.Invalidate(False)
		  End Select
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Select Case Me.Mode
		  Case DrawingModes.Resizing
		    ' The user is dragging the resizing thumb to resize the picture
		    DragStart.X = X
		    DragStart.Y = Y
		    Me.Invalidate(False)
		  Else
		    ' check to see whether we're hovering over the resizing thumb
		    If X >= DrawingBuffer.Width + ViewOffset.X And X <= DrawingBuffer.Width + ViewOffset.X + 5 And Y >= DrawingBuffer.Height + ViewOffset.Y And Y <= DrawingBuffer.Height + ViewOffset.Y + 5 Then
		      ' we are, change the mouse cursor
		      Me.mousecursor = System.Cursors.ArrowNorthwestSoutheast
		    Else
		      ' we aren't, change the mouse cursor back to standard
		      Me.MouseCursor = System.Cursors.StandardPointer
		    End If
		  End Select
		  
		  ' Raise the event to the subclass
		  RaiseEvent MouseMove(System.MouseX, System.MouseY)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Dim p As New REALbasic.Point(X, Y)
		  Dim rect As New REALbasic.Rect(DragStart.X, DragStart.Y, X - DragStart.X, Y - DragStart.Y)
		  Select Case Me.Mode
		  Case DrawingModes.Line
		    DrawLine(DragStart, p)
		  Case DrawingModes.Oval
		    DrawOval(rect, False)
		  Case DrawingModes.Rect
		    DrawRect(rect, False)
		  Case DrawingModes.FilledRect
		    DrawRect(rect, True)
		  Case DrawingModes.FilledOval
		    DrawOval(rect, True)
		  Case DrawingModes.Point
		    If Not CancelDraw Then DrawingBuffer.Graphics.DrawPicture(OverLay, ViewOffset.X, ViewOffset.Y)
		  Case DrawingModes.Resizing
		    SaveUndo()
		    Me.Mode = LastMode
		    Dim tmp As Picture = New Picture(X - ViewOffset.X, Y - ViewOffset.Y, 32)
		    SetGraphicsSettings(tmp)
		    If DrawingBuffer <> Nil Then
		      tmp.Graphics.DrawPicture(DrawingBuffer, 0, 0)
		      DrawingBuffer = tmp
		    End If
		  End Select
		  Me.Refresh
		  DragStart = New REALbasic.Point(0, 0)
		  CancelDraw = False
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.DragStart = New REALbasic.Point(0, 0)
		  Me.AcceptFocus = True
		  DrawingBuffer = New Picture(500, 500, 32)
		  App.UseGDIPlus = True
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  If DrawingBuffer = Nil Then Return
		  If Not PaintBackdrop(g) Then
		    g.ForeColor = &c808080  //Dark grey
		    g.FillRect(0, 0, g.Width, g.Height)
		  End If
		  
		  Dim drawable As Graphics = g.Clip(ViewOffset.X, ViewOffset.Y, DrawingBuffer.Width, DrawingBuffer.Height)
		  If Not PaintDrawingBuffer(drawable) Then
		    g.DrawPicture(DrawingBuffer, ViewOffset.X, ViewOffset.Y)
		  End If
		  
		  If Not PaintOverlay(g) Then
		    g.DrawPicture(Overlay, 0, 0)
		    g.ForeColor = &c494949
		    g.FillRect(DrawingBuffer.Width + ViewOffset.X, DrawingBuffer.Height + ViewOffset.Y, 5, 5)  //Resize thumb
		  End If
		  
		  If Mode <> DrawingModes.Point Then Overlay = Nil
		  
		  If Me.Mode = DrawingModes.Resizing Then
		    g.ForeColor = &c00FF00
		    g.PenHeight = 3
		    g.PenWidth = 3
		    g.DrawLine(DragStart.X + 1, DragStart.Y + 1, DragStart.X + 1, 0)
		    g.DrawLine(DragStart.X + 1, DragStart.Y + 1, 0, DragStart.Y + 1)
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Clear()
		  SaveUndo()
		  DrawingBuffer = New Picture(DrawingBuffer.Width, DrawingBuffer.Height, 32)
		  OverLay = Nil
		  Me.Invalidate(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawFill(Point As REALbasic.Point)
		  SetGraphicsSettings(DrawingBuffer)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    Return
		  End If
		  DrawingBuffer.RGBSurface.FloodFill(Point.X - ViewOffset.X, Point.Y - ViewOffset.Y, DrawingColor)
		  
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawLine(Point1 As REALbasic.Point, Point2 As REALbasic.Point)
		  SetGraphicsSettings(DrawingBuffer)
		  Dim view As New REALbasic.Rect(ViewOffset.X, ViewOffset.Y, DrawingBuffer.Width, DrawingBuffer.Height)
		  
		  If view.Contains(Point1) And view.Contains(Point2) Then
		    If CancelDraw Then
		      CancelDraw = False
		      Me.Invalidate(False)
		      Return
		    End If
		    
		    If Point2.X < 0 Then
		      Point2.X = Abs(Point2.X)
		      Point1.X = Point1.X - Point2.X
		    End If
		    If Point2.Y < 0 Then
		      Point2.Y = Abs(Point2.Y)
		      Point1.Y = Point1.Y - Point2.Y
		    End If
		    DrawingBuffer.Graphics.DrawLine(Point1.X, Point1.Y, Point2.X, Point2.Y)
		    Me.Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawOval(Dimensions As REALbasic.Rect, Fill As Boolean)
		  SetGraphicsSettings(DrawingBuffer)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    Return
		  End If
		  
		  If Not Fill Then
		    DrawingBuffer.Graphics.DrawOval(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  Else
		    DrawingBuffer.Graphics.FillOval(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  End If
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawRect(Dimensions As REALbasic.Rect, Fill As Boolean)
		  SetGraphicsSettings(DrawingBuffer)
		  If Dimensions.Width < 0 Then
		    Dimensions.Width = Abs(Dimensions.Width)
		    Dimensions.Left = Dimensions.Left - Dimensions.Width
		  End If
		  If Dimensions.Height < 0 Then
		    Dimensions.Height = Abs(Dimensions.Height)
		    Dimensions.Top = Dimensions.Top - Dimensions.Height
		  End If
		  If Not Fill Then
		    DrawingBuffer.Graphics.DrawRect(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  Else
		    DrawingBuffer.Graphics.FillRect(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  End If
		  
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawText(Point As REALbasic.Point, Text As String)
		  SetGraphicsSettings(DrawingBuffer)
		  Dim g As Graphics = DrawingBuffer.Graphics
		  Dim w, h As Double
		  w = g.StringWidth(Text.Trim)
		  h = g.StringHeight(Text.Trim, w)
		  g = g.Clip(Point.X, Point.Y, w, h)
		  g.DrawString(Text.Trim, 0, g.Height)
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Open(p As Picture)
		  If p = Nil Then Return
		  DrawingBuffer = p
		  Overlay = Nil
		  Me.Invalidate(False)
		  mViewOffset = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PreviewFill(Point As REALbasic.Point)
		  OverLay.Graphics.DrawPicture(DrawingBuffer, 0, 0)
		  SetGraphicsSettings(OverLay)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    Return
		  End If
		  OverLay.RGBSurface.FloodFill(Point.X - ViewOffset.X, Point.Y - ViewOffset.Y, DrawingColor)
		  
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PreviewLine(Point1 As REALbasic.Point, Point2 As REALbasic.Point)
		  SetGraphicsSettings(Overlay)
		  Dim view As New REALbasic.Rect(ViewOffset.X, ViewOffset.Y, Overlay.Width, Overlay.Height)
		  
		  If view.Contains(Point1) And view.Contains(Point2) Then
		    If CancelDraw Then
		      CancelDraw = False
		      Me.Invalidate(False)
		      Return
		    End If
		    
		    If Point2.X < 0 Then
		      Point2.X = Abs(Point2.X)
		      Point1.X = Point1.X - Point2.X
		    End If
		    If Point2.Y < 0 Then
		      Point2.Y = Abs(Point2.Y)
		      Point1.Y = Point1.Y - Point2.Y
		    End If
		    Overlay.Graphics.DrawLine(Point1.X, Point1.Y, Point2.X, Point2.Y)
		    Me.Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PreviewOval(Dimensions As REALbasic.Rect, Fill As Boolean)
		  SetGraphicsSettings(Overlay)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    Return
		  End If
		  
		  If Not Fill Then
		    Overlay.Graphics.DrawOval(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  Else
		    Overlay.Graphics.FillOval(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  End If
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PreviewPoint(point As REALbasic.Point)
		  SetGraphicsSettings(Overlay)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    Return
		  End If
		  Overlay.Graphics.FillRect(Point.X - ViewOffset.X, Point.Y - ViewOffset.Y, Me.PenSize, Me.PenSize)
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PreviewRect(Dimensions As REALbasic.Rect, Fill As Boolean)
		  SetGraphicsSettings(OverLay)
		  If Dimensions.Width < 0 Then
		    Dimensions.Width = Abs(Dimensions.Width)
		    Dimensions.Left = Dimensions.Left - Dimensions.Width
		  End If
		  If Dimensions.Height < 0 Then
		    Dimensions.Height = Abs(Dimensions.Height)
		    Dimensions.Top = Dimensions.Top - Dimensions.Height
		  End If
		  If Not Fill Then
		    Overlay.Graphics.DrawRect(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  Else
		    Overlay.Graphics.FillRect(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  End If
		  
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreviewText(Point As REALbasic.Point, Text As String)
		  SetGraphicsSettings(OverLay)
		  Dim g As Graphics = OverLay.Graphics
		  Dim w, h As Double
		  w = g.StringWidth(Text.Trim)
		  h = g.StringHeight(Text.Trim, w) + 4
		  g = g.Clip(Point.X, Point.Y, w, h)
		  g.DrawString(Text.Trim, 0, g.Height - 2)
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveDrawingBuffer() As Picture
		  Dim p As New Picture(DrawingBuffer.Width, DrawingBuffer.Height)
		  p.Graphics.DrawPicture(DrawingBuffer, 0, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetGraphicsSettings(Pic As Picture)
		  Pic.Graphics.ForeColor = Me.DrawingColor
		  Pic.Graphics.PenWidth = Me.PenSize
		  Pic.Graphics.PenHeight = Me.PenSize
		  Pic.Graphics.TextFont = Me.TextFont
		  Pic.Graphics.TextSize = Me.TextSize
		  'Pic.Graphics.AntiAlias = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ViewOffset() As REALbasic.Point
		  If mViewOffset = Nil Then mviewOffset = New REALbasic.Point(0, 0)
		  return mViewOffset
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintBackdrop(g As Graphics) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintDrawingBuffer(g As Graphics) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintOverlay(g As Graphics) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SaveUndo()
	#tag EndHook


	#tag Property, Flags = &h1
		Protected CancelDraw As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DragStart As REALbasic.Point
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DrawingBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		DrawingColor As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastMode As DrawingModes
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As DrawingModes
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOverLay As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mViewOffset As REALbasic.Point
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mOverLay = Nil Then
			    mOverLay = New Picture(DrawingBuffer.Width, DrawingBuffer.Height)
			    SetGraphicsSettings(mOverLay)
			  End If
			  return mOverLay
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mOverLay = value
			End Set
		#tag EndSetter
		Protected OverLay As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		PenSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextFont As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TextSize As Single
	#tag EndProperty


	#tag Enum, Name = DrawingModes, Type = Integer, Flags = &h0
		Line
		  FilledOval
		  FilledRect
		  Freeform
		  Point
		  Oval
		  Rect
		  FloodFill
		  Magnify
		Resizing
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawingColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PenSize"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
