#tag Class
Protected Class HistoryField
Inherits TextField
	#tag Event
		Sub KeyUp(Key As String)
		  If Asc(Key) = &h1F Then  //Down arrow
		    Dim results() As String
		    Dim showAll As Boolean = (Me.Text = "")
		    For i As Integer = 0 To UBound(History)
		      If InStr(History(i), Me.Text) > 0 Or showAll Then
		        results.Append(History(i))
		      End If
		    Next
		    
		    If UBound(results) > -1 Then
		      Dim mnu As New MenuItem("History")
		      For Each item As String In results
		        mnu.Append(New MenuItem(item))
		      Next
		      Dim choice As MenuItem = mnu.PopUp(TrueWindow.Left + Me.Left, TrueWindow.Top + Me.Top + Me.Height)
		      If choice <> Nil Then
		        Me.Text = choice.Text
		      End If
		    End If
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItem(Text As String)
		  History.Append(Text)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		History() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="TextField"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CueText"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			InheritedFrom="TextField"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
			InheritedFrom="TextField"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
