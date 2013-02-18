#tag Class
Protected Class ProgBar
Inherits Canvas
	#tag Event
		Sub Paint(g As Graphics)
		  If Buffer = Nil Or Buffer.Width <> g.Width Or Buffer.Height <> g.Height Then Update(False)
		  g.DrawPicture(Buffer, 0, 0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Update(Invalidate As Boolean = True)
		  #pragma BreakOnExceptions Off
		  Dim filledWidth As Integer = (((value * 100) / maximum) * (Me.Width / 100))
		  #If RBVersion >= 2011.04 Then
		    Buffer = New Picture(Me.Width, Me.Height)
		  #Else
		    Buffer = New Picture(Me.Width, Me.Height, 32)
		  #endif
		  
		  'barWell
		  Dim H, W As Integer
		  H = Buffer.Height
		  W = Buffer.Width
		  Buffer.Graphics.ForeColor = barWell
		  Buffer.Graphics.FillRect(0, 0, W, H)
		  
		  
		  'bar
		  If hasGradient Then
		    Dim ratio, endratio as Double
		    For i As Integer = 0 To Buffer.Height
		      ratio = ((Buffer.Height - i) / Buffer.Height)
		      endratio = (i / Buffer.Height)
		      Buffer.Graphics.ForeColor = RGB(gradientEnd.Red * endratio + barColor.Red * ratio, gradientEnd.Green * endratio + barColor.Green * ratio, _
		      gradientEnd.Blue * endratio + barColor.Blue * ratio)
		      Buffer.Graphics.DrawLine(0, i, filledWidth, i)
		    next
		    Buffer.Graphics.ForeColor = barColor
		    Buffer.Graphics.DrawLine(0, 0, filledWidth, 0)
		  Else
		    Buffer.Graphics.ForeColor = barColor
		    Buffer.Graphics.FillRect(0, 0, filledWidth, H)
		  End If
		  
		  'box
		  If hasBox Then 
		    Buffer.Graphics.ForeColor = boxColor
		    Buffer.Graphics.DrawRect(0, 0, W, H)
		  End If
		  
		  'text
		  If hasText Then 
		    Dim percStr As String
		    Buffer.Graphics.TextSize = 10
		    percStr = PreText + " " + Format((Me.Value*100) / Me.maximum, textFormat) + OverrideText
		    Buffer.Graphics.Bold = bold
		    Buffer.Graphics.Italic = italic
		    Buffer.Graphics.Underline = underline
		    Buffer.Graphics.TextFont = textFont
		    Buffer.Graphics.ForeColor= textColor
		    Buffer.Graphics.TextSize = textSize
		    Dim strWidth, strHeight As Integer
		    strWidth = Buffer.Graphics.StringWidth(percStr)
		    strHeight = Buffer.Graphics.StringHeight(percStr, Me.Width)
		    Buffer.Graphics.DrawString(percStr, (Me.Width/2) - (strWidth/2), ((Me.Height/2) + (strHeight/4)))
		  End If
		  
		  If Invalidate Then
		    Me.Invalidate(False)
		  End If
		  
		  
		Exception Err As OutOfBoundsException
		  Buffer = Nil
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event OverrideText() As String
	#tag EndHook


	#tag Note, Name = Using
		
		To use this control, import it into your RealBasic project. This will add a new control to the Controls pane called "ProgBar"
		Add a ProgBar control to the window and change the default settings in the properties pane, if desired.
		
		This control is intended as a drop-in replacement of the standard ProgressBar control. Set and read its maximum and value in the same manner 
		as a ProgressBar control:
		
		 Dim x As Integer = ProgBar.value
		 Dim x As Integer = ProgBar.maximum
		
		 ProgBar.value = x
		 ProgBar.maximum = x
		
		
		  Boolean values (set/get):
		    *bold
		       True=Text is bold
		       False=Text is not bold
		
		    *italic
		       True=Text is italicized
		       False=Text is not italicized
		
		    *underline
		       True=Text is underlined
		       False=Text is not underlined
		
		    *hasBox
		       True=A border is drawn around the Control
		       False=No border
		
		    *hasGradient
		       True=The bar is drawn as a gradient from barColor to gradientEnd
		       False=The bar is a solid bar of barColor
		
		    *hasText
		       True=A string representation of the control's percent full is drawn in the center of the control
		       False=No text is drawn
		
		  Integer values (set/get):
		    *maximum
		       get or set the maximum value of the ProgBar (minimum is always zero)
		
		    *textSize
		       get or set the point size of the text (see: hasText As Boolean)
		
		    *value
		       get or set the current value of the ProgBar.
		
		  Color values (set/get):
		    *barColor
		       get or set the main color of the foreground bar (the part that shows how "full" the ProgBar is)
		
		    *barWell
		       get or set the color of the background 
		
		    *boxColor
		       get or set the color of the border around the control (if hasBox = True)
		
		    *gradientEnd
		       get or set the ending (bottom) color of the foreground bar if hasGradient = true
		
		    *textColor
		       get or set the color of the percent string if hasText = True
		
		  String values (set/get):
		    *textFont
		       get or set the font of the percent text is hasText = True
		
		    *textFormat
		       get or set the format of the percent text if hasText = True  (see: http://docs.realsoftware.com/index.php/Format)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbarColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbarColor = value
			  Update()
			End Set
		#tag EndSetter
		barColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbarWell
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbarWell = value
			  Update()
			End Set
		#tag EndSetter
		barWell As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbold
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbold = value
			  Update()
			End Set
		#tag EndSetter
		bold As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mboxColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mboxColor = value
			  Update()
			End Set
		#tag EndSetter
		boxColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Buffer As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mgradientEnd
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mgradientEnd = value
			  Update()
			End Set
		#tag EndSetter
		gradientEnd As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhasBox
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhasBox = value
			  Update()
			End Set
		#tag EndSetter
		hasBox As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhasGradient
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhasGradient = value
			  Update()
			End Set
		#tag EndSetter
		hasGradient As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhasText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhasText = value
			  Update()
			End Set
		#tag EndSetter
		hasText As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mitalic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mitalic = value
			  Update()
			End Set
		#tag EndSetter
		italic As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mmaximum
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mmaximum = value
			  Update()
			End Set
		#tag EndSetter
		maximum As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mbarColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbarWell As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mboxColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mgradientEnd As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhasBox As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhasGradient As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhasText As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mitalic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mmaximum As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextFormat As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private munderline As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mvalue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mvalue1 As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		PreText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowValue1 As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextColor = value
			  Update()
			End Set
		#tag EndSetter
		textColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextFont = value
			  Update()
			End Set
		#tag EndSetter
		textFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextFormat
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextFormat = value
			  If Me.Width = 0 And Me.Height = 0 Then Return
			  Update()
			End Set
		#tag EndSetter
		textFormat As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextSize = value
			  Update()
			End Set
		#tag EndSetter
		textSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return munderline
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  munderline = value
			  Update()
			End Set
		#tag EndSetter
		underline As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mvalue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //Calculates x, where x/Control.Width = val/maximum
			  //Invokes the drawing methods
			  mvalue = value
			  Update()
			End Set
		#tag EndSetter
		value As Double
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
			Name="barColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c00FF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="barWell"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C0"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bold"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="boxColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
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
			Name="gradientEnd"
			Visible=true
			Group="Behavior"
			InitialValue="&c009B4E"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasBox"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasGradient"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasText"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="25"
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
			Name="italic"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="maximum"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreText"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowValue1"
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
			Name="textColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="textFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="textFormat"
			Visible=true
			Group="Behavior"
			InitialValue="###.0\\%"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="textSize"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="underline"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="value"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="value1"
			Group="Behavior"
			Type="Double"
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
