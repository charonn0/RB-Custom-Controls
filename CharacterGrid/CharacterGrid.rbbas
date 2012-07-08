#tag Class
Protected Class CharacterGrid
Inherits Canvas
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  
		  Dim cp As New MenuItem("Copy")
		  Dim pst As New MenuItem("Paste")
		  Dim ct As New MenuItem("Cut")
		  
		  Base.Append(cp)
		  Base.Append(pst)
		  Base.Append(ct)
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
		  End Select
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
		  CursorTimer = New Timer
		  CursorTimer.Period = 500
		  AddHandler CursorTimer.Action, AddressOf CursorHandler
		  CursorTimer.Mode = Timer.ModeMultiple
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
		    Dim chrpic As Picture = Characters(i).Pic
		    If Characters(i).Selected Or (i = CaretPosition And Microseconds Mod 2 = 0) Then
		      chrpic = CharPic(Characters(i).Char, Me.TextColor, Me.SelectionColor, Me.TextFont, Me.TextSize)
		    End If
		    tmp.Graphics.DrawPicture((chrpic, x, y))
		    If x + Characters(i).Pic.Width + 4 > tmp.Width Or Characters(i).Char = Chr(&h0D) Then
		      If Characters(i).Char = Chr(&h0A) Then Break
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
		 Shared Function CharPic(Char As String, TextColor As Color, BackColor As Color, Font As String, FontSize As Single) As Picture
		  //Similar to TextToPicture but meant for single characters
		  Dim tmp As New Picture(50, 50, 32)
		  tmp.Graphics.ForeColor = BackColor
		  tmp.Graphics.FillRect(0, 0, tmp.Width, tmp.Height)
		  tmp.Graphics.ForeColor = TextColor
		  tmp.Graphics.TextFont = Font
		  tmp.Graphics.TextSize = FontSize
		  
		  Dim reqWidth, reqHeight As Integer
		  reqWidth = tmp.Graphics.StringWidth(Char)
		  reqHeight = tmp.Graphics.StringHeight(Char, reqWidth)
		  #pragma BreakOnExceptions Off
		  Try
		    tmp = New Picture(reqWidth, reqHeight, 32)
		  Catch OutOfBoundsException
		    reqWidth = tmp.Graphics.StringWidth(Chr(&h20))
		    reqHeight = tmp.Graphics.StringHeight(Chr(&h20), reqWidth)
		    tmp = New Picture(reqWidth, reqHeight, 32)
		  End Try
		  #pragma BreakOnExceptions On
		  
		  tmp.Graphics.ForeColor = BackColor
		  tmp.Graphics.FillRect(0, 0, tmp.Width, tmp.Height)
		  tmp.Graphics.ForeColor = TextColor
		  tmp.Graphics.TextFont = Font
		  tmp.Graphics.TextSize = FontSize
		  tmp.Graphics.DrawString(Char, 0, reqHeight * 0.75)
		  
		  Return tmp
		  
		Exception OutOfBoundsException
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSelection()
		  For Each char As Character In Characters
		    char.Selected = False
		  Next
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CursorHandler(Sender As Timer)
		  #pragma Unused Sender
		  If CaretPosition <= UBound(Characters) And CaretPosition > -1 Then
		    Characters(CaretPosition).Selected = Not Characters(CaretPosition).Selected
		    Me.Refresh(False)
		  End If
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
			End Set
		#tag EndSetter
		CaretPosition As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Characters() As Character
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CursorTimer As Timer
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
			    Dim char As String = Chr(bs.ReadByte)
			    Dim charpic As Picture
			    
			    Select Case Asc(Char)
			    Case &hD  //Carriage return 
			      charpic = CharPic(char, Me.TextColor, Me.BackgroundColor, Me.TextFont, Me.TextSize)
			      If bs.ReadByte <> &h0A And bs.Length > bs.Position Then
			        bs.Position = bs.Position - 1
			      End If
			      
			    Case &h20
			      charpic = CharPic(char, Me.TextColor, Me.BackgroundColor, Me.TextFont, Me.TextSize)
			    Else
			      If char.Trim = "" Then Continue
			      charpic = CharPic(char, Me.TextColor, Me.BackgroundColor, Me.TextFont, Me.TextSize)
			    End Select
			    Characters.Append(New Character(char, charpic))
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
