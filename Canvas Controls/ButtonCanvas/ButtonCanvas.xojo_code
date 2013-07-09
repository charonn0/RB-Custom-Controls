#tag Class
Protected Class ButtonCanvas
Inherits BoolCanvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Enabled And key = " " Then
		    Me.Value = True
		  End If
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  If Me.Value And Key = " " Then
		    Me.Value = False
		    Action()
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If Enabled Then
		    Me.Value = True
		  End If
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if x<0 or y<0 or x>me.width or y>me.height then
		    //Outside the button
		    misHovering = False
		    Update(False)
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  If Enabled Then
		    isHovering = True
		    Me.Hilight = True
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  If Enabled Then
		    isHovering = False
		    Me.Hilight = False
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If Enabled Then Me.Value = False
		  If isHovering Then Action()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint	(g As Graphics)
		  Dim startColor As Color = &cC0C0C0 //FIXME make colors configurable
		  Dim endColor As Color = &cE6E6E6
		  Dim ratio, endratio as Double
		  For i As Integer = 0 To g.Height
		    ratio = ((g.Height - i) / g.Height)
		    endratio = (i / g.Height)
		    g.ForeColor = RGB(startColor.Red * endratio + endColor.Red * ratio, startColor.Green * endratio + endColor.Green * ratio, _
		    startColor.Blue * endratio + endColor.Blue * ratio)
		    g.DrawLine(0, i, g.Width, i)
		  next
		  g.ForeColor = endColor
		  g.DrawLine(0, 0, g.Width, 0)
		  
		  If isHovering Or Me.Value Then
		    If hilightBorder Then
		      Dim middle1 As Color = RGB(hilightColor.Red * 0.75, hilightColor.Green * 0.75, hilightColor.Blue * 0.75)
		      Dim inner As Color = RGB(hilightColor.Red * 0.50, hilightColor.Green * 0.50, hilightColor.Blue * 0.50)
		      
		      g.ForeColor = hilightColor
		      g.DrawLine(0, 0, 0, Me.Height)
		      g.DrawLine(0, 0, Me.Width, 0)
		      g.DrawLine(Me.Width - 1, Me.Height - 1, Me.Width -1, 1)
		      g.DrawLine(Me.Width - 1, Me.Height - 1, 1, Me.Height - 1)
		      
		      g.ForeColor = middle1
		      g.DrawLine(1, 1, 1, Me.Height - 1)
		      g.DrawLine(1, 1, Me.Width - 1, 1)
		      g.DrawLine(Me.Width - 2, Me.Height - 2, Me.Width -2, 2)
		      g.DrawLine(Me.Width - 2, Me.Height - 2, 2, Me.Height - 2)
		    Else
		      g.ForeColor = &c000000
		      g.DrawLine(0, 0, 0, Me.Height)
		      g.DrawLine(0, 0, Me.Width, 0)
		      g.DrawLine(Me.Width - 1, Me.Height - 1, Me.Width -1, 1)
		      g.DrawLine(Me.Width - 1, Me.Height - 1, 1, Me.Height - 1)
		    End If
		  Else
		    g.ForeColor = &c000000
		    g.DrawLine(0, 0, 0, Me.Height)
		    g.DrawLine(0, 0, Me.Width, 0)
		    g.DrawLine(Me.Width - 1, Me.Height - 1, Me.Width -1, 1)
		    g.DrawLine(Me.Width - 1, Me.Height - 1, 1, Me.Height - 1)
		  End If
		  
		  g.TextSize = Me.TextSize
		  If Enabled Then
		    g.ForeColor = Me.TextColor
		  Else
		    g.ForeColor = RGB(Me.TextColor.Red + ((255 - Me.TextColor.Red) / 2), Me.TextColor.Green + ((255 - Me.TextColor.Green) / 2), _
		    Me.TextColor.Blue + ((255 - Me.TextColor.Blue) / 2))
		  End If
		  g.Bold = bold
		  g.Italic = italic
		  g.Underline = underline
		  g.TextFont = Me.TextFont
		  g.TextSize = Me.TextSize
		  Dim strWidth, strHeight As Integer
		  strWidth = g.StringWidth(Me.Caption)
		  strHeight = g.StringHeight(Me.Caption, Me.Width)
		  g.DrawString(Me.Caption, (Me.Width/2) - (strWidth/2), ((Me.Height/2) + (strHeight/4)))
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ValueChanged()
		  Return
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCaption
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCaption = value
			  If Me.Width <= 0 Or Me.Height <= 0 Then Return
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  Update()
			  
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhilightBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhilightBorder = value
			  If Me.Width <= 0 Or Me.Height <= 0 Then Return
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  Update()
			  
			End Set
		#tag EndSetter
		hilightBorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhilightColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhilightColor = value
			  If Me.Width <= 0 Or Me.Height <= 0 Then Return
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  Update()
			  
			End Set
		#tag EndSetter
		hilightColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return misHovering
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  misHovering = value
			  Update()
			End Set
		#tag EndSetter
		Private isHovering As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCaption As String = "Click Me!"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhilightBorder As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhilightColor As Color = &c00FFFF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private misHovering As Boolean
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
			Name="Bold"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Hilight"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hilightBorder"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hilightColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c00FFFF"
			Type="Color"
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
			Name="TextColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			Type="Single"
			InheritedFrom="BaseCanvas"
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
			Name="Underline"
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
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BoolCanvas"
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
