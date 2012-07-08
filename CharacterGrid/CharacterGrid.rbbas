#tag Class
Protected Class CharacterGrid
Inherits Canvas
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  
		  Base.Append(New MenuItem("Copy"))
		  Base.Append(New MenuItem("Cut"))
		  Base.Append(New MenuItem("Paste"))
		  Base.Append(New MenuItem("Bold"))
		  Base.Append(New MenuItem("Italic"))
		  Base.Append(New MenuItem("Underline"))
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Copy"
		    Dim cp As New Clipboard
		    For i As Integer = 0 To UBound(Characters)
		      If Characters(i).Selected Then
		        cp.Text = cp.Text + Characters(i).Char
		      End If
		    Next
		    
		  Case "Cut"
		    For i As Integer = UBound(Characters) DownTo 0
		      If Characters(i).Selected Then
		        Characters.Remove(i)
		      End If
		    Next
		    Refresh(False)
		    
		  Case "Paste"
		    Dim cp As New Clipboard
		    If cp.TextAvailable Then
		      Dim l, r, s As String
		      s = Me.Text
		      l = s.Mid(0, CaretPosition)
		      r = s.Mid(CaretPosition, s.Len)
		      Me.Text = l + cp.Text + r
		    End If
		    
		  Case "Bold"
		    For i As Integer = 0 To UBound(Characters)
		      If Characters(i).Selected Then Characters(i).Bold = Not Characters(i).Bold
		    Next
		    
		  Case "Italic"
		    For i As Integer = 0 To UBound(Characters)
		      If Characters(i).Selected Then Characters(i).Italic = Not Characters(i).Italic
		    Next
		    
		  Case "Underline"
		    For i As Integer = 0 To UBound(Characters)
		      If Characters(i).Selected Then Characters(i).Underline = Not Characters(i).Underline
		    Next
		  End Select
		  
		  ClearSelection()
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If Not IsContextualClick Then
		    ClearSelection()
		    CaretPosition = HitpointToChar(X, Y)
		    mDown = True
		    StartX = X
		    StartY = Y
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If mDown Then
		    Dim chars() As Integer = SelectionRectToChars(StartX, StartY, X, Y)
		    
		    For Each char As Integer In Chars
		      If char > -1 Then Characters(char).Selected = True
		    Next
		    Refresh(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  mDown = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  mDown = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.Text = Me.Text
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  Dim tmp As New Picture(g.Width, g.Height, 32)
		  tmp.Graphics.ForeColor = Me.BackgroundColor
		  tmp.Graphics.FillRect(0, 0, tmp.Width, tmp.Height)
		  Dim x, y As Integer
		  
		  For i As Integer = 0 To UBound(Characters)
		    If Characters(i).Selected Or (i = CaretPosition And Microseconds Mod 2 = 0) Then
		      Characters(i).BackColor = Me.SelectionColor
		    End If
		    tmp.Graphics.DrawPicture((Characters(i).Pic, x, y))
		    If x + Characters(i).Pic.Width + 4 > tmp.Width Or Characters(i).Char = Chr(&h0D) Then
		      x = 0
		      y = y + Characters(i).Pic.Height
		    Else
		      x = x + Characters(i).Pic.Width
		    End If
		    Characters(i).X = x
		    Characters(i).Y = y
		  Next
		  
		  g.DrawPicture(tmp, 0, 0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AppendText(Text As String)
		  Me.Text = Me.Text + Text
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSelection()
		  For Each char As Character In Characters
		    char.Selected = False
		    char.BackColor = Me.BackgroundColor
		  Next
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HitpointToChar(x As Integer, y As Integer) As Integer
		  For i As Integer = Characters.Ubound DownTo 0
		    Dim thechar As Character = Characters(i)
		    If ( _
		      thechar.X < x) And _
		      (x < thechar.X + thechar.Pic.width) And _
		      (thechar.Y < y) And _
		      (y < thechar.Y + thechar.Pic.height) Then
		      
		      Return i
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionRectToChars(x1 As Integer, y1 As Integer, x2 As Integer, y2 As Integer) As Integer()
		  Dim ret() As Integer
		  For i As Integer = Characters.Ubound DownTo 0
		    Dim thechar As Character = Characters(i)
		    
		    If (thechar.X < x1) And (x2 < thechar.X + thechar.Pic.width) And (thechar.Y < y1) And (y2 < thechar.Y + thechar.Pic.height) _
		      Or _
		      (thechar.X < x2) And (x1 < thechar.X + thechar.Pic.width) And (thechar.Y < y2) And (y1 < thechar.Y + thechar.Pic.height) Then
		      Ret.Append(i)
		    End If
		  Next
		  Return ret
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBackgroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBackgroundColor = value
			  Refresh(False)
			End Set
		#tag EndSetter
		BackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCaretPosition
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mCaretPosition > -1 And mCaretPosition >= UBound(Characters) Then
			    Characters(mCaretPosition).Selected = False
			  End If
			  mCaretPosition = value
			  Refresh(False)
			End Set
		#tag EndSetter
		CaretPosition As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Characters() As Character
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretPosition As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextSize As Single
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSelectionColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionColor = value
			  Refresh(False)
			End Set
		#tag EndSetter
		SelectionColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private StartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartY As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim ret As String
			  For i As Integer = 0 To UBound(Characters)
			    ret = ret + Characters(i).Char
			  Next
			  
			  Return ret
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ReDim Characters(-1)
			  Dim bs As New BinaryStream(value)
			  While Not bs.EOF
			    Dim char As New Character(Chr(bs.ReadByte))
			    char.BackColor = Me.BackgroundColor
			    char.ForeColor = Me.TextColor
			    char.TextFont = Me.TextFont
			    char.TextSize = Me.TextSize
			    
			    Characters.Append(char)
			  Wend
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextColor = value
			  Refresh(False)
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextFont = value
			  Refresh(False)
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextSize = value
			  Refresh(False)
			End Set
		#tag EndSetter
		TextSize As Single
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
			InitialValue="&cFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretPosition"
			Group="Behavior"
			Type="Integer"
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
			Name="SelectionColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c0000EE"
			Type="Color"
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
			Name="Text"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
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