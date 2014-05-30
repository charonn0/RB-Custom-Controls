#tag Class
Protected Class PaintCanvas
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If Not RaiseEvent MouseDown(X, Y) Then
		    'Check if we're dragging the resize thumb
		    X = X - ViewOffset.X
		    Y = Y - ViewOffset.Y
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
		        DrawFill(Overlay, p)
		      Case DrawingModes.Polygon
		        PolygonPoints.Append(p)
		        DrawPolygon(OverLay, PolygonPoints, True)
		      End Select
		    End If
		    Me.Invalidate(False)
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  X = X - ViewOffset.X
		  Y = Y - ViewOffset.Y
		  Dim p As New REALbasic.Point(X, Y)
		  Dim rect As New REALbasic.Rect(DragStart.X, DragStart.Y, X - DragStart.X, Y - DragStart.Y)
		  Dim view As New REALbasic.Rect(ViewOffset.X, ViewOffset.Y, DrawingBuffer.Width, DrawingBuffer.Height)
		  
		  Select Case Mode
		  Case DrawingModes.Line
		    If DragStart.X > -1 Then DrawLine(Overlay, DragStart, p)
		  Case DrawingModes.Oval
		    If DragStart.X > -1 Then DrawOval(Overlay, rect, False)
		  Case DrawingModes.Rect
		    If DragStart.X > -1 Then DrawRect(Overlay, rect, False)
		  Case DrawingModes.FilledRect
		    If DragStart.X > -1 Then DrawRect(Overlay, rect, True)
		  Case DrawingModes.FilledOval
		    If DragStart.X > -1 Then DrawOval(Overlay, rect, True)
		  Case DrawingModes.Point
		    If DragStart.X <> X Or DragStart.Y <> Y Then
		      DrawLine(OverLay, DragStart, p)
		    End If
		    DragStart = New REALbasic.Point(X, Y)
		  Case DrawingModes.Resizing
		    DragStart.X = X
		    DragStart.Y = Y
		    Me.Invalidate(False)
		  Case DrawingModes.Polygon
		    PolygonPoints.Append(p)
		    DrawPolygon(OverLay, PolygonPoints, True)
		  End Select
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  X = X - ViewOffset.X
		  Y = Y - ViewOffset.Y
		  Select Case Me.Mode
		  Case DrawingModes.Resizing
		    ' The user is dragging the resizing thumb to resize the picture
		    DragStart.X = X
		    DragStart.Y = Y
		  Else
		    Dim p As New REALbasic.Point(X, Y)
		    Dim rect As New REALbasic.Rect(DragStart.X, DragStart.Y, X - DragStart.X, Y - DragStart.Y)
		    If Me.Mode <> DrawingModes.ModeSelect Then LastMode = Me.Mode
		    For i As Integer = 0 To UBound(ControlRects)
		      Dim crect As REALbasic.Rect = ControlRects(i)
		      If crect.Contains(p) Then
		        Me.Mode = DrawingModes.ModeSelect
		        Me.Invalidate(False)
		        Exit For
		      ElseIf Me.Mode <> LastMode Then
		        Me.Mode = LastMode
		        Me.Invalidate(False)
		      End If
		    Next
		    '
		    
		    ' check to see whether we're hovering over the resizing thumb
		    Dim thumb As New REALbasic.Rect(DrawingBuffer.Width + ViewOffset.X, DrawingBuffer.Height + ViewOffset.Y, 5, 5)
		    If thumb.Contains(p) Then
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
		  RaiseEvent MouseUp(X, Y)
		  X = X - ViewOffset.X
		  Y = Y - ViewOffset.Y
		  Dim p As New REALbasic.Point(X, Y)
		  Dim rect As New REALbasic.Rect(DragStart.X, DragStart.Y, X - DragStart.X, Y - DragStart.Y)
		  
		  Select Case Me.Mode
		  Case DrawingModes.ModeSelect
		    For i As Integer = 0 To UBound(ControlRects)
		      Dim crect As REALbasic.Rect = ControlRects(i)
		      If crect.Contains(p) Then
		        RaiseEvent ControlItemAction(i)
		      End If
		    Next
		    Me.Mode = LastMode
		  Case DrawingModes.Line
		    If DragStart.X > -1 Then DrawLine(DrawingBuffer, DragStart, p)
		  Case DrawingModes.Oval
		    If DragStart.X > -1 Then DrawOval(DrawingBuffer, rect, False)
		  Case DrawingModes.Rect
		    If DragStart.X > -1 Then DrawRect(DrawingBuffer, rect, False)
		  Case DrawingModes.FilledRect
		    If DragStart.X > -1 Then DrawRect(DrawingBuffer, rect, True)
		  Case DrawingModes.FilledOval
		    If DragStart.X > -1 Then DrawOval(DrawingBuffer, rect, True)
		  Case DrawingModes.Eyedropper
		    Me.DrawingColor = DrawingBuffer.RGBSurface.Pixel(X, Y)
		    Me.Invalidate(False)
		    Me.Mode = LastMode
		  Case DrawingModes.FloodFill
		    DrawFill(DrawingBuffer, p)
		  Case DrawingModes.Point
		    If CancelDraw Then
		      CancelDraw = False
		      Me.Invalidate(False)
		      CancelDraw = False
		    Else
		      DrawingBuffer.Graphics.DrawPicture(OverLay, ViewOffset.X, ViewOffset.Y)
		    End If
		  Case DrawingModes.Resizing
		    SaveUndo()
		    Me.Mode = LastMode
		    Dim tmp As Picture = New Picture(X - ViewOffset.X, Y - ViewOffset.Y, DrawingBuffer.Depth)
		    SetGraphicsSettings(tmp)
		    If DrawingBuffer <> Nil Then
		      tmp.Graphics.DrawPicture(DrawingBuffer, 0, 0)
		      DrawingBuffer = tmp
		    End If
		  Case DrawingModes.Polygon
		    If Keyboard.AsyncControlKey Then
		      PolygonPoints.Append(p)
		      DrawPolygon(DrawingBuffer, PolygonPoints, True)
		    Else
		      ReDim PolygonPoints(-1)
		      OverLay = Nil
		    End If
		  End Select
		  
		  Me.Invalidate(False)
		  DragStart = New REALbasic.Point(-1, -1)
		  CancelDraw = False
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.DragStart = New REALbasic.Point(0, 0)
		  Me.AcceptFocus = True
		  DrawingBuffer = New Picture(500, 500, 32)
		  App.UseGDIPlus = True
		  RaiseEvent Open()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  If DrawingBuffer = Nil Then Return
		  g.ForeColor = &c808080  //Dark grey
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = &c00000000  //Black
		  g.DrawRect(0, 0, g.Width, g.Height)
		  
		  Dim drawable As Graphics = g.Clip(ViewOffset.X, ViewOffset.Y, DrawingBuffer.Width, DrawingBuffer.Height)
		  For X As Integer = 0 To drawable.Width Step checker.Width
		    For Y As Integer = 0 To drawable.Height Step checker.Height
		      drawable.DrawPicture(checker, X, Y)
		    Next
		  Next
		  
		  
		  drawable.DrawPicture(DrawingBuffer, 0, 0)
		  g.ForeColor = &c00000000
		  g.PenHeight = 1
		  g.PenWidth = 1
		  g.DrawRect(ViewOffset.X - 1, ViewOffset.Y - 1, DrawingBuffer.Width + 2, DrawingBuffer.Height + 2) ' buffer border
		  g.ForeColor = &c494949
		  g.FillRect(DrawingBuffer.Width + ViewOffset.X, DrawingBuffer.Height + ViewOffset.Y, 5, 5)  //Resize thumb
		  
		  g.DrawPicture(Overlay, 0, 0)
		  For i As Integer = 0 To UBound(ControlRects)
		    Dim r As REALbasic.Rect = ControlRects(i)
		    g.ForeColor = &cFFFFFF00
		    g.FillRect(r.Left, r.Top, r.Width, r.Height)
		    RaiseEvent ControlItemPaint(g.Clip(r.Left, r.Top, r.Width, r.Height), i)
		  Next
		  
		  If Mode <> DrawingModes.Point Then Overlay = Nil
		  g.ForeColor = &c00000000
		  g.PenHeight = 1
		  g.PenWidth = 1
		  g.DrawRect(0, 0, g.Width, g.Height) ' control border
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
		Sub AddControlItem(Dimensions As REALbasic.Rect, Tag As Variant)
		  If Dimensions <> Nil Then
		    ControlRects.Append(Dimensions)
		    ControlTags.Append(Tag)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  SaveUndo()
		  DrawingBuffer = New Picture(DrawingBuffer.Width, DrawingBuffer.Height, 32)
		  OverLay = Nil
		  Me.Invalidate(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlItem(Index As Integer) As REALbasic.Rect
		  Return ControlRects(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlItem(Index As Integer, Assigns NewRect As REALbasic.Rect)
		  ControlRects(Index) = NewRect
		  'Me.Invalidate()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlItemCount() As Integer
		  Return UBound(ControlRects) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlItemTag(Index As Integer) As Variant
		  Return ControlTags(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlItemTag(Index As Integer, Assigns NewTag As Variant)
		  ControlTags(Index) = NewTag
		  Me.Invalidate()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawFill(p As Picture, Point As REALbasic.Point)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    CancelDraw = False
		    Return
		  End If
		  p.Graphics.DrawPicture(DrawingBuffer, 0, 0)
		  SetGraphicsSettings(p)
		  Dim view As New REALbasic.Rect(ViewOffset.X, ViewOffset.Y, p.Width, p.Height)
		  
		  If view.Contains(Point) Then
		    p.RGBSurface.FloodFill(Point.X - ViewOffset.X, Point.Y - ViewOffset.Y, DrawingColor)
		  End If
		  
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawLine(p As Picture, Point1 As REALbasic.Point, Point2 As REALbasic.Point)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    CancelDraw = False
		    Return
		  End If
		  
		  SetGraphicsSettings(p)
		  Dim view As New REALbasic.Rect(ViewOffset.X, ViewOffset.Y, p.Width, p.Height)
		  
		  If view.Contains(Point1) And view.Contains(Point2) Then
		    If Point2.X < 0 Then
		      Point2.X = Abs(Point2.X)
		      Point1.X = Point1.X - Point2.X
		    End If
		    If Point2.Y < 0 Then
		      Point2.Y = Abs(Point2.Y)
		      Point1.Y = Point1.Y - Point2.Y
		    End If
		    p.Graphics.DrawLine(Point1.X, Point1.Y, Point2.X, Point2.Y)
		    Me.Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawOval(p As Picture, Dimensions As REALbasic.Rect, Fill As Boolean)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    CancelDraw = False
		    Return
		  End If
		  
		  SetGraphicsSettings(p)
		  If Not Fill Then
		    p.Graphics.DrawOval(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  Else
		    p.Graphics.FillOval(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  End If
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawPolygon(p As Picture, Points() As RealBasic.Point, Fill As Boolean)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    CancelDraw = False
		    Return
		  End If
		  If UBound(Points) > 0 Then
		    SetGraphicsSettings(p)
		    Dim g As Graphics = p.Graphics
		    For i As Integer = 1 To UBound(Points)
		      Dim p1, p2 As REALbasic.Point
		      p1 = Points(i - 1)
		      p2 = Points(i)
		      g.DrawLine(p1.X, p1.Y, p2.X, p2.Y)
		    Next
		  End If
		  
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawRect(p As Picture, Dimensions As REALbasic.Rect, Fill As Boolean)
		  If CancelDraw Then
		    CancelDraw = False
		    Me.Invalidate(False)
		    CancelDraw = False
		    Return
		  End If
		  
		  SetGraphicsSettings(p)
		  If Dimensions.Width < 0 Then
		    Dimensions.Width = Abs(Dimensions.Width)
		    Dimensions.Left = Dimensions.Left - Dimensions.Width
		  End If
		  If Dimensions.Height < 0 Then
		    Dimensions.Height = Abs(Dimensions.Height)
		    Dimensions.Top = Dimensions.Top - Dimensions.Height
		  End If
		  If Not Fill Then
		    p.Graphics.DrawRect(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  Else
		    p.Graphics.FillRect(Dimensions.Left, Dimensions.Top, Dimensions.Width, Dimensions.Height)
		  End If
		  
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawText(p As Picture, Point As REALbasic.Point, Text As String)
		  SetGraphicsSettings(p)
		  Dim g As Graphics = p.Graphics
		  Dim w, h As Double
		  w = g.StringWidth(Text.Trim)
		  h = g.StringHeight(Text.Trim, w)
		  g = g.Clip(Point.X, Point.Y, w, h)
		  g.DrawString(Text.Trim, 0, g.Height)
		  Me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertControlItem(Index As Integer, Dimensions As REALbasic.Rect, Tag As Variant)
		  If Dimensions <> Nil Then
		    ControlRects.Insert(Index, Dimensions)
		    ControlTags.Insert(Index, Tag)
		  End If
		  Me.Invalidate()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Open(p As Picture)
		  If p = Nil Then Return
		  DrawingBuffer = p
		  Overlay = Nil
		  Me.Invalidate(False)
		  mViewOffset = New REALbasic.Point(0, 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveControlItem(Tag As Variant)
		  For i As Integer = UBound(ControlTags) DownTo 0
		    If Tag <> ControlTags(i) Then
		      Continue
		    Else
		      ControlTags.Remove(i)
		      ControlRects.Remove(i)
		    End If
		  Next
		  Me.Invalidate()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveDrawingBuffer() As Picture
		  Dim p As New Picture(DrawingBuffer.Width, DrawingBuffer.Height)
		  p.Graphics.DrawPicture(DrawingBuffer, 0, 0)
		  Return p
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
		Event ControlItemAction(Index As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ControlItemPaint(g As Graphics, Index As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SaveUndo()
	#tag EndHook


	#tag Property, Flags = &h1
		Protected CancelDraw As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ControlRects() As REALbasic.Rect
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ControlTags() As Variant
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

	#tag Property, Flags = &h0
		LastMode As DrawingModes
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

	#tag Property, Flags = &h1
		Protected PolygonPoints() As REALbasic.Point
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
		  Polygon
		  ModeSelect
		Eyedropper
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
