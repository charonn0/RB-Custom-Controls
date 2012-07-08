#tag Class
Protected Class dragContainer
Inherits Canvas
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If currentObject > -1 Then
		    Return RaiseEvent ItemCreateContextMenu(objects(CurrentObject), base)
		  Else
		    Return RaiseEvent ItemCreateContextMenu(Nil, base)
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Dim ret As Boolean
		  
		  If currentObject > -1 Then
		    ret = RaiseEvent ItemContextMenuAction(objects(currentObject), hitItem)
		  Else
		    ret = RaiseEvent ItemContextMenuAction(Nil, hitItem)
		  End If
		  
		  menuUp = False
		  If ret Then update()
		  Refresh(False)
		  
		  Return ret
		End Function
	#tag EndEvent

	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If currentObject = -1 Then
		    If RaiseEvent ItemDoubleClicked(Nil) Then update()
		  Else
		    If RaiseEvent ItemDoubleClicked(objects(currentobject)) Then update()
		  End If
		  
		  Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  Dim i As Integer = HitpointToObject(Me.MouseX, Me.MouseY)
		  If i > 0 Then
		    RaiseEvent ItemDropObject(Objects(i), obj, action)
		  Else
		    RaiseEvent DropObject(obj, action)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  'dirty = True
		  'Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If currentObject > -1 Then
		    Return RaiseEvent ItemKeyDown(Objects(currentObject), Key)
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  If currentObject > -1 Then
		    RaiseEvent ItemKeyUp(Objects(currentObject), Key)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  currentObject = hitpointToObject(x, y)
		  If currentObject > -1 Then
		    bringToFront(currentObject)
		    If IsContextualClick Then
		      menuUp = True
		    End If
		  End If
		  update()
		  Refresh(False)
		  lastX = X
		  lastY = Y
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If currentObject > -1 Then
		    'Static t As Byte
		    Dim obj As DragObject = objects(currentObject)
		    Dim objX As Integer = x - lastx
		    Dim objY As Integer = y - lasty
		    lastx = x
		    lasty = y
		    obj.CoordX = obj.CoordX + objX
		    obj.CoordY = obj.CoordY + objY
		    update()
		    Refresh(False)
		    
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  Dim i As Integer = HitpointToObject(Me.MouseX, Me.MouseY)
		  If i > 0 Then
		    RaiseEvent ItemMouseIn(Objects(i))
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Dim i As Integer = HitpointToObject(Me.MouseX, Me.MouseY)
		  If i > 0 Then
		    RaiseEvent ItemMouseOut(Objects(i))
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If hitpointToObject(X, Y) > -1 Then
		    HoverTimer.Mode = Timer.ModeSingle
		  Else
		    HoverTimer.Mode = Timer.ModeOff
		  End If
		  
		  Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  'Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  Dim i As Integer = HitpointToObject(X, Y)
		  If i > 0 Then
		    If RaiseEvent ItemScrolled(Objects(i), deltaX, deltaY) Then Refresh(False)
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  buffer = New Picture(Me.Width, Me.Height, 24)
		  buffer.Graphics.ForeColor = &c808080
		  
		  HoverTimer = New Timer
		  AddHandler HoverTimer.Action, AddressOf HoverHandler
		  HoverTimer.Period = HoverPeriod
		  
		  update()
		  Refresh(False)
		  RaiseEvent Open()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  #pragma Unused g
		  Static lastWidth, lastHeight As Integer
		  
		  If lastWidth <> Me.Width Or lastHeight <> Me.Height Then
		    buffer = New Picture(Me.Width, Me.Height, 24)
		    lastWidth = Me.Width
		    lastHeight = Me.Height
		    update()
		  End If
		  'update()
		  
		  g.DrawPicture(buffer, 0, 0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addObject(no As dragObject)
		  If no.CoordX > Me.Width Or no.CoordY > Me.Height Then
		    no.CoordX = no.CoordX - 200
		    no.CoordY = no.CoordY - 200
		  End If
		  objects.Append(no)
		  update()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BringToFront(index As Integer)
		  If index = -1 Then Return
		  Dim obj As dragObject = objects(index)
		  objects.Remove(index)
		  objects.Append(obj)
		  currentObject = objects.Ubound
		  update()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearObject(index As Integer)
		  buffer.Graphics.ClearRect(objects(index).CoordX, objects(index).CoordY, objects(index).width, objects(index).height)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawObject(index As Integer)
		  Dim theobject As dragObject = objects(index)
		  buffer.Graphics.ForeColor = &c000000
		  buffer.Graphics.DrawRect(theObject.CoordX - 1, theObject.CoordY - 1, theObject.width + 1, theObject.height + 1)
		  buffer.Graphics.ForeColor = &c808080
		  buffer.Graphics.DrawPicture(theObject.Image, theObject.CoordX, theObject.CoordY)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HitpointToObject(x As Integer, y As Integer) As Integer
		  //Given an X, Y coordinate, returns the index of the object occupying those coordinates, or -1 if none.
		  For i As Integer = objects.Ubound DownTo 0
		    Dim theobject As dragObject = objects(i)
		    If ( _
		      theobject.CoordX < x) And _
		      (x < theobject.CoordX + theobject.width) And _
		      (theobject.CoordY < y) And _
		      (y < theobject.CoordY + theobject.height) Then
		      
		      Return i
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HoverHandler(Sender As Timer)
		  #pragma Unused Sender
		  Dim obj As Integer = HitPointToObject(Me.MouseX, Me.MouseY)
		  
		  If obj > -1 And obj <= Objects.Ubound Then
		    If RaiseEvent ItemHover(objects(obj)) Then update()
		  Else
		    If RaiseEvent ItemHover(Nil) Then update()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshHandler(Sender As Timer)
		  #pragma Unused Sender
		  Dim obj As Integer = HitPointToObject(Me.TrueWindow.MouseX, Me.TrueWindow.MouseY)
		  
		  If obj > -1 And obj <= Objects.Ubound Then
		    If RaiseEvent ItemHover(objects(obj)) Then update()
		  Else
		    If RaiseEvent ItemHover(Nil) Then update()
		  End If
		  
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeObject(obj As dragObject)
		  Dim index As Integer = hitpointToObject(obj.CoordX + 1, obj.CoordY + 1)
		  If index <= UBound(objects) Then
		    Objects.Remove(index)
		    RaiseEvent ItemRemoved(obj)
		    update()
		    Refresh(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update()
		  buffer.Graphics.ForeColor = &c808080
		  buffer.Graphics.FillRect(0, 0, buffer.Width, buffer.Height)
		  For i As Integer = 0 To objects.Ubound
		    drawObject(i)
		  Next
		  If currentObject > -1 And currentObject <= Objects.Ubound Then
		    buffer.Graphics.ForeColor = &c00FFFF
		    buffer.Graphics.DrawRect(objects(currentObject).CoordX - 1, objects(currentObject).CoordY - 1, objects(currentObject).width + 1, _
		    objects(currentObject).height + 1)
		    
		    
		    buffer.Graphics.DrawRect(objects(currentObject).CoordX - 2, objects(currentObject).CoordY - 2, objects(currentObject).width + 3, _
		    objects(currentObject).height + 3)
		    buffer.Graphics.ForeColor = &c808080
		  Else
		    currentObject = -1
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DropObject(Obj As DragItem, Action As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemContextMenuAction(Item As DragObject, hitItem As MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemCreateContextMenu(Item As DragObject, base As MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemDoubleClicked(Item As DragObject) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemDropObject(Item As DragObject, Obj As DragItem, Action As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemHover(Item As dragObject) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemKeyDown(Item As DragObject, Key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemKeyUp(Item As DragObject, Key As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemMouseIn(Item As DragObject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemMouseOut(Item As DragObject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemRemoved(Item As dragObject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemScrolled(Item As dragObject, DeltaX As Integer, DeltaY As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h21
		Private buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private currentObject As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		HoverPeriod As Integer = 250
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HoverTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private menuUp As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Objects() As DragObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RefreshTimer As Timer
	#tag EndProperty


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
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
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
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
			Name="HoverPeriod"
			Group="Behavior"
			InitialValue="250"
			Type="Integer"
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
