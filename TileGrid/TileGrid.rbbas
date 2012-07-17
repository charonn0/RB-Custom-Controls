#tag Class
Protected Class TileGrid
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim piece As GridTile = HitpointToGrid(X, Y)
		  If piece = Nil Then Return False
		  If RaiseEvent TileClick(X, Y, piece) Then
		    Me.Refresh(False)
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  Dim piece As GridTile = HitpointToGrid(Me.MouseX, Me.MouseY)
		  If piece = Nil Then Return
		  If RaiseEvent TileMouseEnter(Me.MouseX, Me.MouseY, piece) Then
		    Me.Refresh(False)
		    Return
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Dim piece As GridTile = HitpointToGrid(Me.MouseX, Me.MouseY)
		  If piece = Nil Then Return
		  If RaiseEvent TileMouseExit(Me.MouseX, Me.MouseY, piece) Then
		    Me.Refresh(False)
		    Return
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  ReDim Grid(mColumnCount, mRowCount)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  If Buffer = Nil Or Buffer.Width <> g.Width Or Buffer.Height <> g.Height Then 
		    Buffer = New Picture(g.Width, g.Height, 32)
		    GenBoard()
		  End If
		  g.DrawPicture(Buffer, 0, 0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub GenBoard()
		  If Buffer = Nil Then Return
		  Dim stepX, stepY, gridX, gridY As Integer
		  stepX = Round(Me.Width / ColumnCount)
		  stepY = Round(Me.Height / RowCount)
		  
		  For Y As Integer = 0 To Me.Height Step StepY
		    For X As Integer = 0 To Me.Width Step StepX
		      If Grid(gridX, gridY) = Nil Then
		        Dim piece As New GridTile
		        piece.Rect = Buffer.Graphics.Clip(X, Y, StepX, StepY)
		        piece.Grid = gridX:gridY
		        Grid(gridX, gridY) = piece
		      Else
		        Grid(gridX, gridY).Rect = Buffer.Graphics.Clip(X, Y, StepX, StepY)
		      End If
		      If RaiseEvent TilePaint(gridX, gridY, Grid(gridX, gridY)) Then
		        Grid(gridX, gridY).Paint
		      End If
		      
		      If gridX < RowCount Then
		        gridX = gridX + 1
		      Else
		        Exit For X
		      End If
		    Next
		    If gridX = ColumnCount And gridY = RowCount Then Exit For Y
		    gridX = 0
		    If gridY < ColumnCount Then
		      gridY = gridY + 1
		    Else
		      gridY = 0
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HitpointToGrid(x1 As Integer, y1 As Integer) As GridTile
		  Dim stepX, stepY, gridX, gridY As Integer
		  stepX = Round(Me.Width / ColumnCount)
		  stepY = Round(Me.Height / RowCount)
		  
		  For Y As Integer = 0 To Me.Height Step StepY
		    For X As Integer = 0 To Me.Width Step StepX
		      If (X < x1) And (x1 < X + StepX) And (Y < y1) And (y1 < Y + StepY) Then
		        Return Grid(gridX, gridY)
		      End If
		      
		      If gridX < ColumnCount Then
		        gridX = gridX + 1
		      Else
		        Exit For X
		      End If
		    Next
		    If gridX = ColumnCount And gridY = RowCount Then Exit For Y
		    gridX = 0
		    If gridY < RowCount Then
		      gridY = gridY + 1
		    Else
		      gridY = 0
		    End If
		  Next
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event TileClick(GridX As Integer, GridY As Integer, Tile As GridTile) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TileContextMenu(GridX As Integer, GridY As Integer, TrueX As Integer, TrueY As Integer, Tile As GridTile) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TileMouseEnter(GridX As Integer, GridY As Integer, Tile As GridTile) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TileMouseExit(GridX As Integer, GridY As Integer, Tile As GridTile) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TilePaint(GridX As Integer, GridY As Integer, Tile As GridTile) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private Buffer As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mColumnCount
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mColumnCount = value
			  ReDim Grid(value, mRowCount)
			  GenBoard()
			End Set
		#tag EndSetter
		ColumnCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Grid(-1,-1) As GridTile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColumnCount As Integer = 9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowCount As Integer = 9
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRowCount
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRowCount = value
			  ReDim Grid(mColumnCount, value)
			  GenBoard()
			End Set
		#tag EndSetter
		RowCount As Integer
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
			Name="ColumnCount"
			Visible=true
			Group="Behavior"
			InitialValue="8"
			Type="Integer"
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
			Name="RowCount"
			Visible=true
			Group="Behavior"
			InitialValue="8"
			Type="Integer"
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
