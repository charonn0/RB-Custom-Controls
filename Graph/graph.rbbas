#tag Class
Protected Class graph
Inherits Canvas
	#tag Event
		Sub Open()
		  PreviousX.Append(0)
		  PreviousY.Append(Me.Height)
		  #If TargetWin32 Then
		    App.UseGDIPlus = True
		  #endif
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  If buffer = Nil Then Clear()
		  Dim tmp As New Picture(g.Width, g.Height, 32)
		  drawBack(tmp.Graphics)
		  buffer.Graphics.AntiAlias = False
		  buffer.Transparent = 1
		  tmp.Graphics.DrawPicture(buffer, 0, 0)
		  RaiseEvent Paint(tmp.Graphics)
		  g.DrawPicture(tmp, 0, 0)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addLinkedPoint(x As Integer, y As Integer)
		  y = (Me.Height - y)
		  
		  If PreviousY.Ubound > Me.Width Or buffer = Nil Then
		    buffer = New Picture(Me.Width, Me.Height, 32)
		    buffer.Graphics.PenWidth = 2
		    buffer.Graphics.PenHeight = 2
		    Redim PreviousX(0)
		    ReDim PreviousY(0)
		  End If
		  buffer.Graphics.ForeColor = graphColor
		  buffer.Graphics.DrawLine(LastX, LastY, x, y)
		  
		  LastX = x
		  LastY = y
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addPoint(x As Integer, y As Integer)
		  y = (Me.Height - y)
		  buffer.Graphics.ForeColor = graphColor
		  buffer.Graphics.FillRect(x - 1, y - 1, 3, 3)
		  LastX = x
		  LastY = y
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  If Me.Width <= 0 Or Me.Height <= 0 Then
		    buffer = New Picture(1, 1, 32)
		  Else
		    buffer = New Picture(Me.Width, Me.Height, 32)
		  End If
		  buffer.Graphics.PenWidth = 2
		  buffer.Graphics.PenHeight = 2
		  Buffer.Graphics.ClearRect(0, 0, Me.Width, Me.Height)
		  Refresh(False)
		  Redim PreviousX(0)
		  Redim PreviousY(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawBack(g As Graphics)
		  g.ForeColor = background
		  g.FillRect(0, 0, g.Width, g.Height)
		  If hasGrid Then
		    g.ForeColor = gridColor
		    For i As Integer = 0 To g.Width Step gridWidth
		      g.DrawLine(i, 0, i, g.Height)
		    Next
		    For i As Integer = 0 To g.Height Step gridHeight
		      g.DrawLine(0, i, g.Width, i)
		    Next
		  End If
		  
		  g.ForeColor = graphColor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LinkPoints(x1 As Integer, y1 As Integer, x2 As Integer, y2 As Integer)
		  y2 = (Me.Height - y2)
		  
		  If PreviousY.Ubound > Me.Width Or buffer = Nil Then
		    buffer = New Picture(Me.Width, Me.Height, 32)
		    buffer.Graphics.PenWidth = 2
		    buffer.Graphics.PenHeight = 2
		    'drawBack(buffer)
		    Redim Previousx(0)
		    ReDim PreviousY(0)
		  End If
		  
		  buffer.Graphics.ForeColor = graphColor
		  buffer.Graphics.DrawLine(x1, y1, x2, y2)
		  
		  LastX = x1
		  LastY = y1
		  LastX = x2
		  LastY = y2
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g As Graphics)
	#tag EndHook


	#tag Property, Flags = &h21
		Private backBuff As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		background As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		graphColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		gridColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		gridHeight As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h0
		gridWidth As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h0
		HasGrid As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return PreviousX(PreviousX.Ubound)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  PreviousX.Append(value)
			End Set
		#tag EndSetter
		LastX As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return PreviousY(PreviousY.Ubound)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  PreviousY.Append(value)
			End Set
		#tag EndSetter
		LastY As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mpointWidth As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PreviousX() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PreviousY() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private time As Integer = 0
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
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="background"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
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
			Name="graphColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFF0000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gridColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c00FF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gridHeight"
			Visible=true
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gridWidth"
			Visible=true
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasGrid"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="LastX"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastY"
			Group="Behavior"
			Type="Integer"
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
