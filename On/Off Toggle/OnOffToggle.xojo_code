#tag Class
Protected Class OnOffToggle
Inherits Canvas
	#tag Event
		Sub GotFocus()
		  If Me.Value Then
		    BorderColorTrue = RGB(BorderColorTrue.Red, BorderColorTrue.Green, BorderColorTrue.Blue, 0)
		  Else
		    BorderColorFalse = RGB(BorderColorFalse.Red, BorderColorFalse.Green, BorderColorFalse.Blue, 0)
		  End If
		  Me.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Key = " " Then 'spacebar
		    Me.Value = Not Me.Value
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  If Me.Value Then
		    BorderColorTrue = RGB(BorderColorTrue.Red, BorderColorTrue.Green, BorderColorTrue.Blue, &hCC)
		  Else
		    BorderColorFalse = RGB(BorderColorFalse.Red, BorderColorFalse.Green, BorderColorFalse.Blue, &hCC)
		  End If
		  Me.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Me.SetFocus
		  Me.Invalidate(False)
		  Me.Value = Not Me.Value
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    App.UseGDIPlus = True
		    Me.DoubleBuffer = True
		    Me.EraseBackground = False
		  #endif
		  Me.AcceptFocus = True
		  Me.AcceptTabs = True
		  Me.UseFocusRing = True
		  If Me.Value Then
		    BorderColorTrue = RGB(BorderColorTrue.Red, BorderColorTrue.Green, BorderColorTrue.Blue, &hCC)
		  Else
		    BorderColorFalse = RGB(BorderColorFalse.Red, BorderColorFalse.Green, BorderColorFalse.Blue, &hCC)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #If RBVersion > 2012 Then
		    #pragma Unused areas
		  #endif
		  g.AntiAlias = True
		  Dim thumb As Integer = g.Height - 2
		  Dim X As Integer
		  
		  'draw background
		  If Me.Value Then
		    g.ForeColor = BackgroundColorTrue
		  Else
		    g.ForeColor = BackgroundColorFalse
		  End If
		  If Rounded Then
		    g.FillRoundRect(0, 0, g.Width, g.Height, thumb, thumb)
		  Else
		    g.FillRect(0, 0, g.Width, g.Height)
		  End If
		  
		  
		  'draw border
		  If Me.Value Then
		    g.ForeColor = BorderColorTrue
		  Else
		    g.ForeColor = BorderColorFalse
		  End If
		  If Rounded Then
		    g.DrawRoundRect(1, 1, g.Width - 2, g.Height - 2, thumb, thumb)
		  Else
		    g.DrawRect(0, 0, g.Width, g.Height)
		  End If
		  
		  'draw thumb
		  If Me.Value Then
		    g.ForeColor = ThumbColorTrue
		    X = g.Width - thumb - 1
		  Else
		    g.ForeColor = ThumbColorFalse
		    X = 1
		  End If
		  If Rounded Then
		    g.FillOval(X, 1, thumb, thumb)
		  Else
		    g.FillRect(X, 1, thumb, thumb)
		  End If
		  
		  
		  'draw thumb border
		  If Me.Value Then
		    g.ForeColor = BorderColorTrue
		    X = g.Width - thumb - 1
		  Else
		    g.ForeColor = BorderColorFalse
		    X = 1
		  End If
		  If Rounded Then
		    g.DrawOval(X, 1, thumb, thumb)
		  Else
		    g.DrawRect(X, 1, thumb, thumb)
		  End If
		  
		  
		  'draw text
		  g.Bold = True
		  If Me.Value Then
		    g.ForeColor = TextColorTrue
		    X = g.StringWidth(TrueText)
		    g.DrawString(TrueText, (0.25 * g.Width) - (0.5 * X), 0.5 * g.Height + 5)
		  Else
		    g.ForeColor = TextColorFalse
		    X = g.StringWidth(FalseText)
		    g.DrawString(FalseText, (0.75 * g.Width) - (0.5 * X), 0.5 * g.Height + 5)
		  End If
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag Property, Flags = &h0
		BackgroundColorFalse As Color = &cC0C0C000
	#tag EndProperty

	#tag Property, Flags = &h0
		BackgroundColorTrue As Color = &c0080FF00
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderColorFalse As Color = &c80808000
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderColorTrue As Color = &c80808000
	#tag EndProperty

	#tag Property, Flags = &h0
		FalseText As String = "Off"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRounded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValue As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRounded
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRounded = value
			  Invalidate(True)
			End Set
		#tag EndSetter
		Rounded As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		TextColorFalse As Color = &cFFFFFF00
	#tag EndProperty

	#tag Property, Flags = &h0
		TextColorTrue As Color = &cFFFFFF00
	#tag EndProperty

	#tag Property, Flags = &h0
		ThumbColorFalse As Color = &c80808000
	#tag EndProperty

	#tag Property, Flags = &h0
		ThumbColorTrue As Color = &c80808000
	#tag EndProperty

	#tag Property, Flags = &h0
		TrueText As String = "On"
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mValue = value
			  Invalidate(False)
			  ValueChanged()
			End Set
		#tag EndSetter
		Value As Boolean
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
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColorFalse"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColorTrue"
			Visible=true
			Group="Behavior"
			InitialValue="&c0080FF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColorFalse"
			Visible=true
			Group="Behavior"
			InitialValue="&c80808000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColorTrue"
			Visible=true
			Group="Behavior"
			InitialValue="&c80808000"
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
			Name="FalseText"
			Visible=true
			Group="Behavior"
			InitialValue="Off"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="30"
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
			Group="Position"
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
			Name="Rounded"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Name="TextColorFalse"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColorTrue"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThumbColorFalse"
			Visible=true
			Group="Behavior"
			InitialValue="&c80808000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThumbColorTrue"
			Visible=true
			Group="Behavior"
			InitialValue="&c80808000"
			Type="Color"
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
			Name="TrueText"
			Visible=true
			Group="Behavior"
			InitialValue="On"
			Type="String"
			EditorType="MultiLineEditor"
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
			Type="Boolean"
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
			InitialValue="60"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
