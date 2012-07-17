#tag Class
Protected Class GridTile
	#tag Method, Flags = &h0
		Sub Paint()
		  Rect.DrawPicture(Avatar, 0, 0, Rect.Width, Rect.Height, 0, 0, Avatar.Width, Avatar.Height)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAvatar
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAvatar = value
			  Me.Paint()
			End Set
		#tag EndSetter
		Avatar As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Grid As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAvatar As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Rect As Graphics
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Avatar"
			Group="Behavior"
			Type="Picture"
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
