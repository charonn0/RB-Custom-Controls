#tag Class
Protected Class SliderCanvas
Inherits BaseCanvas
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
		Sub Paint	(g As Graphics)
		  Dim FilledWidth As Integer = (Me.Value * 100 / Me.Maximum) * (Me.Width / 100)
		  'BarWell
		  g.ForeColor = barWell
		  g.FillRect(0, 0, Buffer.Width, Buffer.Height)
		  
		  'ticks
		  If Ticks Then
		    Dim markStep As Integer = Buffer.Width \ 20
		    For i As Integer = 0 To Buffer.Width Step markStep
		      g.ForeColor = TickColor
		      g.DrawLine(i, Buffer.Height - Buffer.Height \ 4, i, Buffer.Height)
		    Next
		  End If
		  
		  'bar
		  Dim ratio, endratio as Double
		  Dim w As Integer = Max(0.25 * Buffer.Height, 5)
		  For i As Integer = w To Buffer.Height - w
		    If Gradated Then
		      ratio = ((Buffer.Height - i) / Buffer.Height)
		      endratio = (i / Buffer.Height)
		      g.ForeColor = RGB(GradientEnd.Red * endratio + barColor.Red * ratio, GradientEnd.Green * endratio + barColor.Green * ratio, _
		      GradientEnd.Blue * endratio + barColor.Blue * ratio)
		    Else
		      g.ForeColor = barColor
		    End If
		    g.DrawLine(0, i, filledWidth, i)
		  next
		  
		  'Thumb
		  #pragma BreakOnExceptions Off 'We might get and OoBE if Height\4 <= 0
		  
		  #pragma BreakOnExceptions On
		  Select Case Me.ThumbStyle
		  Case 0
		    Dim thumb As New Picture(Buffer.Height \ 4, Buffer.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= Buffer.Width Then
		      g.DrawPicture(thumb, Buffer.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  Case 1
		    Dim thumb As New Picture(Buffer.Height, Buffer.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= Buffer.Width Then
		      g.DrawPicture(thumb, Buffer.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  Case 2
		    Dim thumb As New Picture(Buffer.Height \ 4, Buffer.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillOval(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= Buffer.Width Then
		      g.DrawPicture(thumb, Buffer.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  Case 3
		    Dim thumb As New Picture(Buffer.Height, Buffer.Height)', 32)
		    thumb.Graphics.ForeColor = &cFFFFFFFF
		    thumb.Graphics.FillRect(0, 0, thumb.Width, thumb.Height)
		    thumb.Graphics.ForeColor = ThumbColor
		    thumb.Graphics.FillOval(0, 0, thumb.Width, thumb.Height)
		    If FilledWidth <= 0 Then
		      g.DrawPicture(thumb, 0 - thumb.Width \ 2, 0)
		    ElseIf FilledWidth >= Buffer.Width Then
		      g.DrawPicture(thumb, Buffer.Width - (thumb.Width \ 2), 0)
		    Else
		      g.DrawPicture(thumb, FilledWidth - (thumb.Width \ 2), 0)
		    End If
		  End Select
		  
		  
		  'border
		  If Me.Border Then
		    g.ForeColor = boxColor
		    g.DrawRect(0, 0, Buffer.Width, Buffer.Height)
		  End If
		  
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

	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBarColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBarColor = value
			  Update()
			End Set
		#tag EndSetter
		BarColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBarwell
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBarwell = value
			  Update()
			End Set
		#tag EndSetter
		Barwell As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorder = value
			  Update()
			End Set
		#tag EndSetter
		Border As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBoxColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBoxColor = value
			  Update()
			End Set
		#tag EndSetter
		BoxColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return RectControl(Self).Enabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  RectControl(Self).Enabled = value
			  Update()
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGradated
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGradated = value
			  Update()
			End Set
		#tag EndSetter
		Gradated As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGradientEnd
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGradientEnd = value
			  Update()
			End Set
		#tag EndSetter
		GradientEnd As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		LiveScroll As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMaximum
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMaximum = value
			  Update()
			End Set
		#tag EndSetter
		Maximum As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBarColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBarwell As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBoxColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGradated As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGradientEnd As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMaximum As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mThumbColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mThumbStyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTickColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTicks As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mvalue As Integer
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTickColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTickColor = value
			  Update()
			End Set
		#tag EndSetter
		TickColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTicks
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTicks = value
			  Update()
			End Set
		#tag EndSetter
		Ticks As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value > Me.Maximum Or value < 0 Then Return
			  mValue = value
			  Update()
			  ValueChanged()
			  If LiveScroll Then
			    Refresh(False)
			  End If
			End Set
		#tag EndSetter
		Value As Integer
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
			Name="BarColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cCC0000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BarWell"
			Visible=true
			Group="Behavior"
			InitialValue="&cCCCCCC"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BoxColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
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
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Gradated"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GradientEnd"
			Visible=true
			Group="Behavior"
			InitialValue="&cFF0000"
			Type="Color"
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
			Name="LiveScroll"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ticks"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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
			Name="Value"
			Visible=true
			Group="Behavior"
			Type="Integer"
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
