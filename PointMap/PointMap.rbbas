#tag Class
Protected Class PointMap
Inherits BaseCanvas
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  If FindPoint(X, Y) Then
		    PointDoubleClick(X, Y)
		  Else
		    RaiseEvent DoubleClick(X, Y)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If FindPoint(X, Y) Then
		    Return PointMouseDown(X, Y)
		  Else
		    Return RaiseEvent MouseDown() And True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If FindPoint(X, Y) Then
		    PointMouseEnter(X, Y)
		    Hovering = True
		  Else
		    If Hovering Then
		      PointMouseExit()
		    Else
		      RaiseEvent MouseMove(X, Y)
		    End If
		    Hovering = False
		  End If
		  Me.Update(False)
		  Me.Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If FindPoint(X, Y) Then
		    PointMouseUp(X, Y)
		  Else
		    RaiseEvent MouseUp(X, Y)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint	(g As Graphics)
		  RaiseEvent Paint(g)
		  For Each Key As String In Points.Keys
		    Dim X, Y As Integer
		    X = CoordX(Key)
		    Y = CoordY(Key)
		    Dim gX, gY As Integer
		    gX = X - (0.5 * Me.PointWidth)
		    gY = Y - (0.5 * Me.PointHeight)
		    PointPaint(g.Clip(gX, gY, Me.PointWidth, Me.PointHeight), X, Y)
		  Next
		  
		  PostPaint(g)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPoint(X As Integer, Y As Integer)
		  Points.Value(Key(X, Y)) = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CoordX(sKey As String) As Integer
		  Return Val(NthField(sKey, ",", 1))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CoordY(sKey As String) As Integer
		  Return Val(NthField(sKey, ",", 2))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindPoint(ByRef X As Integer, ByRef Y As Integer) As Boolean
		  //Finds the point containing X,Y, if any, and modifies X and Y to correspond with the center of that point. Returns true if X and/or Y
		  //were modified, which also means a point was found.
		  For x1 As Integer = X - PointWidth \ 2 To X + PointWidth \ 2
		    For y1 As Integer = Y - PointHeight \ 2 To Y + PointHeight \ 2
		      If Points.HasKey(Key(x1, y1)) Then
		        X = x1
		        Y = y1
		        Return True
		      End If
		    Next
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Key(X As Integer, Y As Integer) As String
		  Return Str(X) + "," + Str(Y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PointTag(X As Integer, Y As Integer) As Variant
		  If FindPoint(X, Y) Then
		    Return Points.Value(Key(X, Y))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PointTag(X As Integer, Y As Integer, Assigns v As Variant)
		  If FindPoint(X, Y) Then
		    Points.Value(Key(X, Y)) = v
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePoint(X As Integer, Y As Integer)
		  If Points.HasKey(Key(X, Y)) Then
		    Points.Remove(Key(X, Y))
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DoubleClick(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g As Graphics)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PointDoubleClick(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PointMouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PointMouseEnter(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PointMouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PointMouseUp(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PointPaint(g As Graphics, X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PostPaint(g As Graphics)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Hovering As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPoints As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		PointHeight As Integer = 50
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  If mPoints = Nil Then mPoints = New Dictionary
			  return mPoints
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPoints = value
			End Set
		#tag EndSetter
		Private Points As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		PointWidth As Integer = 50
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
			InitialValue="True"
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
			Type="String"
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
			Name="PointHeight"
			Visible=true
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PointWidth"
			Visible=true
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
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
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
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
