#tag Class
Protected Class SliderCanvas
Inherits ProgressCanvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //up = &h1E
		  //down = &h1F
		  If Asc(key) = &h1E Then
		    If Me.Value >= Me.Maximum Then
		      Beep()
		    Else
		      Me.value = Me.value + 1
		    End If
		    Return True
		  ElseIf Asc(key) = &h1F Then
		    If Me.Value <= 0 Then
		      Beep()
		    Else
		      Me.value = Me.value - 1
		    End If
		    Return True
		  End If
		  
		  Return RaiseEvent KeyDown(Key)
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If Not RaiseEvent MouseDown(X, Y) Then
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma Unused Y
		  If Not Enabled Then
		    Return
		  End If
		  Me.value = (x * Me.maximum \ Me.Width)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, FilledWidth As Integer)
		  If Ticks Then
		    Dim markStep As Integer = g.Width \ 20
		    For i As Integer = 0 To g.Width Step markStep
		      g.ForeColor = TickColor
		      g.DrawLine(i, g.Height - g.Height \ 4, i, g.Height)
		    Next
		  End If
		  
		  'Thumb
		  Select Case Me.ThumbStyle
		  Case 0
		    Dim thumb As New Picture(g.Height \ 4, g.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= g.Width Then
		      g.DrawPicture(thumb, g.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  Case 1
		    Dim thumb As New Picture(g.Height, g.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= g.Width Then
		      g.DrawPicture(thumb, g.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  Case 2
		    Dim thumb As New Picture(g.Height \ 4, g.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillOval(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= g.Width Then
		      g.DrawPicture(thumb, g.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  Case 3
		    Dim thumb As New Picture(g.Height, g.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillOval(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= g.Width Then
		      g.DrawPicture(thumb, g.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  End Select
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event KeyDown(Key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook


	#tag Property, Flags = &h21
		Private mThumbColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mThumbStyle As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mThumbColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mThumbColor = value
			  Update()
			End Set
		#tag EndSetter
		ThumbColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mThumbStyle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mThumbStyle = value
			  Update()
			End Set
		#tag EndSetter
		ThumbStyle As Integer
	#tag EndComputedProperty


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
			Name="BackgroundColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c808080"
			Type="Color"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BarColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c00FF00"
			Type="Color"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BarThickness"
			Visible=true
			Group="Behavior"
			InitialValue="0.33"
			Type="Double"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
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
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Gradated"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GradientEndColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c004000"
			Type="Color"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="25"
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
			Name="Hilight"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
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
			Name="Italic"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
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
			Name="Maximum"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowCaption"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ProgressCanvas"
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
			Name="TextColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			Type="Single"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThumbColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThumbStyle"
			Visible=true
			Group="Behavior"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - SmallRect"
				"1 - BigRect"
				"2 - SmallOval"
				"3 - BigOval"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TickColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ticks"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ProgressCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
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
			Name="Value"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ProgressCanvas"
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
			InitialValue="200"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
