#tag Interface
Protected Interface DragObject
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(p As Picture)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CoordX() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CoordX(Assigns NewX As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CoordY() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CoordY(Assigns NewX As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Height(Assigns NewHeight As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image() As Picture
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Image(Assigns NewImage As Picture)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(TheObject As DragObject) As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(NewObject As DragObject)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(PropertyName As String) As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Lookup(PropertyName As String, Assigns Value As Variant)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Width(Assigns NewWidth As Integer)
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface
