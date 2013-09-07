#tag Class
Protected Class HexViewer
Inherits BaseCanvas
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  #pragma Unused deltaX
		  #pragma Unused X
		  #pragma Unused Y
		  Dim data As String
		  Stream.Position = Offset
		  Do Until Buffer.Graphics.StringWidth(data) >= Buffer.Graphics.Width - Buffer.Graphics.StringWidth(" 00")
		    Dim bt As Byte = Stream.ReadByte
		    data = data + " " + Left(Hex(bt) + "00", 2) + " "
		  Loop
		  
		  Dim linedelta, bytesdelta As Integer
		  If Sign(deltaY) = 1 Then ' scroll down
		    For i As Integer = 1 To deltaY
		      bytesdelta = bytesdelta + LineLength
		      linedelta = linedelta + 1
		    Next
		    
		  ElseIf Sign(deltaY) = -1 Then ' scroll up
		    
		    For i As Integer = deltaY To 0
		      bytesdelta = bytesdelta + LineLength
		      linedelta = linedelta + 1
		    Next
		    
		    bytesdelta = bytesdelta * -1
		    linedelta = linedelta * -1
		    
		  End If
		  
		  If Not RaiseEvent Scrolled(linedelta, bytesdelta) Then
		    Me.Offset = Me.Offset + bytesdelta
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.UpdateClearsBackground = True
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint	(g As Graphics)
		  'g.ClearRect(0, 0, g.Width, g.Height)
		  g.AntiAlias = True
		  App.UseGDIPlus = True
		  Dim BinWidth As Integer
		  Dim gw As Integer
		  If ShowOffsets Then
		    gw = g.StringWidth("0x00000000") + 2
		  Else
		    gw = 0
		  End If
		  GutterGraphics = g.Clip(0, 0, gw, Buffer.Height)
		  BinWidth = (0.80 * Me.Width) - GutterGraphics.Width
		  BinGraphics = g.Clip(GutterGraphics.Width, 0, BinWidth, Buffer.Height)
		  Dim TextWidth As Integer = Me.Width - BinWidth - GutterGraphics.Width
		  TextGraphics = g.Clip(BinWidth + GutterGraphics.Width, 0, TextWidth, Buffer.Height)
		  GutterGraphics.ForeColor = &cC0C0C000
		  GutterGraphics.FillRect(0, 0, GutterGraphics.Width, GutterGraphics.Height)
		  If Stream = Nil Then Return
		  Dim TextHeight, row, column, bytewidth As Integer
		  Dim data, txt, hx As String
		  bytewidth = BinGraphics.StringWidth(" 00")
		  Stream.Position = Offset
		  row = LineFromOffset(Offset)
		  Do Until TextHeight > BinGraphics.Height Or Stream.EOF
		    Do Until BinGraphics.StringWidth(data) >= BinGraphics.Width - bytewidth
		      Dim bt As Byte = Stream.ReadByte
		      hx = Left(Hex(bt) + "00", 2)
		      data = data + " " + hx + " "
		      If bt < 33 Or bt > 127 Then
		        txt = txt + "."
		      Else
		        If Me.Encoding <> Nil Then
		          txt = txt + Me.Encoding.Chr(bt).Trim
		        Else
		          txt = txt + Chr(bt).Trim
		        End If
		      End If
		      column = column + 1
		    Loop
		    column = 1
		    TextHeight = TextHeight + LineHeight
		    If row Mod 2 = 0 Then
		      BinGraphics.Forecolor = &cEAFFFF00
		      BinGraphics.FillRect(0, TextHeight, BinGraphics.Width, LineHeight)
		      BinGraphics.ForeColor = &c00000000
		      TextGraphics.Forecolor = &cEAFFFF00
		      TextGraphics.FillRect(0, TextHeight, TextGraphics.Width, LineHeight)
		      TextGraphics.ForeColor = &c00000000
		    End If
		    BinGraphics.DrawString(data, 0, TextHeight)
		    TextGraphics.DrawString(txt, 0, TextHeight)
		    GutterGraphics.ForeColor = &c0000FF00
		    GutterGraphics.DrawString("0x" + Left(Hex(row) + "00000000", 8), 0, TextHeight)
		    
		    data = ""
		    txt = ""
		    row = row + 1
		  Loop
		  g.DrawLine(BinGraphics.Width + GutterGraphics.Width, 0, BinGraphics.Width + GutterGraphics.Width, BinGraphics.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function LineCount() As Integer
		  If Stream.Length Mod LineLength = 0 Then
		    Return Stream.Length \ LineLength
		  Else
		    Return (Stream.Length \ LineLength) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LineFromOffset(BytesOffset As UInt64) As Integer
		  If BytesOffset Mod LineLength = 0 Then
		    Return BytesOffset \ LineLength
		  Else
		    Return (BytesOffset \ LineLength) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineHeight() As Integer
		  Return BinGraphics.StringHeight("00", BinGraphics.Width)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineLength() As Integer
		  ' the number of bytes each line represents
		  Dim data As String
		  Dim g As Graphics = Buffer.Graphics
		  Dim count As Integer
		  Do Until g.StringWidth(data) >= BinGraphics.Width - g.StringWidth(" 00")
		    data = data + " 00"
		    count = count + 1
		  Loop
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OffsetFromLine(Line As Integer) As UInt64
		  Return LineLength * Line
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OffsetFromXY(X As Integer, Y As Integer) As Int64
		  Dim row As Integer = Y \ LineHeight
		  Dim column As Integer = X \ LineLength
		  Dim oldoffset As UInt64 = Me.Offset
		  Stream.Position = Me.Offset
		  For a As Integer = 0 To row
		    For b As Integer = 0 To column
		      If a = row And b = column Then
		        Dim ret As Int64 = Stream.Position + 1
		        Stream.Position = oldoffset
		        Return ret
		      End If
		    Next
		  Next
		  
		  Stream.Position = oldoffset
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowData(DataStream As BinaryStream)
		  Me.Stream = DataStream
		  Me.Stream.Position = 0
		  Offset = 0
		  Me.Refresh(False)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private BinGraphics As Graphics
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEncoding
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEncoding = value
			  Update()
			End Set
		#tag EndSetter
		Encoding As TextEncoding
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private GutterGraphics As Graphics
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOffset As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowOffsets As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStreamLen As UInt64
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <= Stream.Length Then
			    mOffset = value
			    Update()
			  End If
			End Set
		#tag EndSetter
		Offset As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mShowOffsets
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mShowOffsets = value
			  Update()
			End Set
		#tag EndSetter
		ShowOffsets As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Stream As BinaryStream
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Stream.Length
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Stream.Length = value
			  Update()
			End Set
		#tag EndSetter
		StreamLen As UInt64
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TextGraphics As Graphics
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
			Visible=true
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
			Name="ShowOffsets"
			Group="Behavior"
			Type="Boolean"
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
			Name="TextColor"
			Group="Behavior"
			Type="Color"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
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
