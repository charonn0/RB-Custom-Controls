#tag Class
Protected Class ProgressCanvas
Inherits BaseCanvas
	#tag Event
		Sub Paint	(g As Graphics)
		  Dim filledWidth As Integer = (((value * 100) / maximum) * (Me.Width / 100))
		  'barWell
		  Dim H, W As Integer
		  H = Buffer.Height
		  W = Buffer.Width
		  g.ForeColor = BackgroundColor
		  g.FillRect(0, 0, W, H)
		  
		  'bar
		  Dim ratio, endratio as Double
		  Dim thickness As Integer = Max(BarThickness * Buffer.Height, 5)
		  Dim bottom, top As Integer
		  bottom = g.Height - thickness
		  g.ForeColor = barColor
		  If bottom < g.Height - bottom Then
		    top = g.Height - bottom
		  Else
		    top = bottom
		    bottom = g.Height - top
		  End If
		  
		  For i As Integer = top DownTo bottom
		    If Gradated Then
		      ratio = ((thickness - (i - bottom)) / thickness)
		      endratio = ((i - bottom) / thickness)
		      g.ForeColor = RGB(GradientEndColor.Red * endratio + barColor.Red * ratio, GradientEndColor.Green * endratio + barColor.Green * ratio, _
		      GradientEndColor.Blue * endratio + barColor.Blue * ratio)
		      g.DrawLine(0, i, filledWidth, i)
		      
		    Else
		      g.DrawLine(0, i, filledWidth, i)
		    End If
		  Next
		  
		  'box
		  If Border Then
		    g.ForeColor = BorderColor
		    g.DrawRect(0, 0, W, H)
		  End If
		  
		  'text
		  If ShowCaption Then
		    Dim percStr As String
		    g.TextSize = 10
		    percStr = GetText()
		    g.Bold = bold
		    g.Italic = italic
		    g.Underline = underline
		    g.TextFont = textFont
		    g.ForeColor= textColor
		    g.TextSize = textSize
		    Dim strWidth, strHeight As Integer
		    strWidth = g.StringWidth(percStr)
		    strHeight = g.StringHeight(percStr, Me.Width)
		    g.DrawString(percStr, (Me.Width/2) - (strWidth/2), ((Me.Height/2) + (strHeight/4)))
		  End If
		  
		  RaiseEvent Paint(g, filledwidth)
		  
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event GetText() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g As Graphics, FilledWidth As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbarWell
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbarWell = value
			  Update()
			End Set
		#tag EndSetter
		BackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbarColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbarColor = value
			  Update()
			End Set
		#tag EndSetter
		BarColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBarThickness
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBarThickness = value
			  Update()
			End Set
		#tag EndSetter
		BarThickness As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhasBox
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhasBox = value
			  Update()
			End Set
		#tag EndSetter
		Border As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mboxColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mboxColor = value
			  Update()
			End Set
		#tag EndSetter
		BorderColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhasGradient
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhasGradient = value
			  Update()
			End Set
		#tag EndSetter
		Gradated As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mgradientEnd
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mgradientEnd = value
			  Update()
			End Set
		#tag EndSetter
		GradientEndColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mmaximum
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mmaximum = value
			  Update()
			End Set
		#tag EndSetter
		Maximum As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mbarColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBarThickness As Double = 1.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbarWell As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mboxColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mgradientEnd As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhasBox As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhasGradient As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhasText As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mmaximum As Integer = 100
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
			  return mhasText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhasText = value
			  Update()
			End Set
		#tag EndSetter
		ShowCaption As Boolean
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
			  return mvalue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mvalue = Min(value, Me.Maximum)
			  mvalue = Max(mvalue, 0)
			  RaiseEvent ValueChanged()
			  Update()
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
			Name="BackgroundColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c808080"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BarColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c00FF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BarThickness"
			Group="Behavior"
			Type="Double"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="GradientEndColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c004000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
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
			Visible=true
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
			Group="Position"
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
			Name="TickColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ticks"
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
