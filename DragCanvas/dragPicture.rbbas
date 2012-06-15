#tag Class
Protected Class dragPicture
Implements DragObject
	#tag Method, Flags = &h0
		Sub Constructor()
		  Dim rand As New Random
		  
		  mimage = New Picture(Rand.InRange(100, 200), Rand.InRange(100, 200), 24)
		  mimage.Graphics.ForeColor = RGB(Rand.InRange(20, 240), Rand.InRange(20, 240), Rand.InRange(20, 240))
		  mimage.Graphics.FillRect(0, 0, mimage.Width, mimage.Height)
		  
		  mx = Rand.InRange(0, DragContainerWindow.dragContainer1.Width)
		  my = Rand.InRange(0, DragContainerWindow.dragContainer1.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(p As Picture)
		  Dim rand As New Random
		  mimage = p
		  mx = Rand.InRange(0, DragContainerWindow.dragContainer1.Width)
		  my = Rand.InRange(0, DragContainerWindow.dragContainer1.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CoordX() As Integer
		  Return Me.mX
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CoordX(Assigns NewX As Integer)
		  Me.mX = NewX
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CoordY() As Integer
		  Return Me.mY
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CoordY(Assigns NewY As Integer)
		  Me.mY = NewY
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height() As Integer
		  Return mImage.height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Height(Assigns NewHeight As Integer)
		  #pragma Unused NewHeight
		  //Nope
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image() As Picture
		  // Part of the DragObject interface.
		  Return mimage
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Image(Assigns NewImage As Picture)
		  Me.mimage = NewImage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(TheObject As DragObject) As Integer
		  If Me Is TheObject Then
		    Return 0
		  Else
		    Return 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(NewObject As DragObject)
		  #pragma Unused NewObject
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(PropertyName As String) As Variant
		  If mProperties = Nil Then mProperties = New Dictionary
		  If mProperties.HasKey(PropertyName) Then
		    Return mProperties.Value(PropertyName)
		  End If
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Lookup(PropertyName As String, Assigns Value As Variant)
		  If mProperties = Nil Then mProperties = New Dictionary
		  mProperties.Value(PropertyName) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width() As Integer
		  Return mimage.width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Width(Assigns NewWidth As Integer)
		  #pragma Unused NewWidth
		  //Nope
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mimage As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mProperties As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mX As Integer = 75
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mY As Integer = 75
	#tag EndProperty


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Class
#tag EndClass
