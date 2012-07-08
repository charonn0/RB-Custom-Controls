#tag Class
Protected Class Character
	#tag Method, Flags = &h21
		Private Function CharPic(Char As String, TextColor As Color, BackColor As Color, Font As String, FontSize As Single, Bold As Boolean = False, Italic As Boolean = False, Underline As Boolean = False) As Picture
		  Dim tmp As New Picture(50, 50, 32)
		  tmp.Graphics.ForeColor = BackColor
		  tmp.Graphics.FillRect(0, 0, tmp.Width, tmp.Height)
		  tmp.Graphics.ForeColor = TextColor
		  tmp.Graphics.TextFont = Font
		  tmp.Graphics.TextSize = FontSize
		  tmp.Graphics.Bold = Bold
		  tmp.Graphics.Italic = Italic
		  tmp.Graphics.Underline = Underline
		  
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
		  tmp.Graphics.Bold = Bold
		  tmp.Graphics.Italic = Italic
		  tmp.Graphics.Underline = Underline
		  tmp.Graphics.DrawString(Char, 0, reqHeight * 0.75)
		  
		  Return tmp
		  
		Exception OutOfBoundsException
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(NewChar As String)
		  If Asc(NewChar) >= 0 And Asc(NewChar) <= 31 Then NewChar = ""
		  Me.Char = NewChar
		  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBackColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBackColor = value
			  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
			End Set
		#tag EndSetter
		BackColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBold
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBold = value
			  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
			End Set
		#tag EndSetter
		Bold As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Char As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mForeColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mForeColor = value
			  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
			End Set
		#tag EndSetter
		ForeColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mItalic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mItalic = value
			  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
			  
			  
			End Set
		#tag EndSetter
		Italic As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mForeColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mItalic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextSize As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUnderline As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Pic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Selected As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextFont = value
			  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
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
			  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
			End Set
		#tag EndSetter
		TextSize As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUnderline
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUnderline = value
			  Me.Pic = charPic(Me.Char, ForeColor, BackColor, TextFont, TextSize, Bold, Italic, Underline)
			End Set
		#tag EndSetter
		Underline As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		X As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Y As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Char"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Pic"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="X"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Y"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
