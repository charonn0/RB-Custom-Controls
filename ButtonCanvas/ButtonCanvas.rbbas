#tag Class
Protected Class ButtonCanvas
Inherits Canvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If IsEnabled And key = " " Then
		    IsDown = True
		  End If
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  If IsDown And Key = " " Then
		    IsDown = False
		    Action()
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If IsEnabled Then
		    IsDown = True
		  End If
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if x<0 or y<0 or x>me.width or y>me.height then
		    //Outside the button
		    isHovering = False
		    reset()
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  If IsEnabled Then isHovering = True
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  If IsEnabled Then isHovering = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If IsEnabled Then IsDown = False
		  If isHovering Then Action()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  Static lastWidth, lastHeight As Integer
		  If (lastWidth <> Me.Width Or lastHeight <> Me.Height) And (Me.Width > 1 And Me.Height > 1) Then   //Can't have negative dimensions
		    buffer = New Picture(Me.Width, Me.Height, 24)
		    lastWidth = Me.Width
		    lastHeight = Me.Height
		    reset()
		  End If
		  
		  g.DrawPicture(buffer, 0, 0)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub drawText(ByRef buf As Picture)
		  buf.Graphics.TextSize = FontSize
		  If IsEnabled Then
		    buf.Graphics.ForeColor = FontColor
		  Else
		    buf.Graphics.ForeColor = RGB(FontColor.Red + ((255 - FontColor.Red) / 2), FontColor.Green + ((255 - FontColor.Green) / 2), _
		    FontColor.Blue + ((255 - FontColor.Blue) / 2))
		  End If
		  buffer.Graphics.Bold = bold
		  buffer.Graphics.Italic = italic
		  buffer.Graphics.Underline = underline
		  buffer.Graphics.TextFont = Font
		  buffer.Graphics.TextSize = FontSize
		  Dim strWidth, strHeight As Integer
		  strWidth = buf.Graphics.StringWidth(Me.Caption)
		  strHeight = buf.Graphics.StringHeight(Me.Caption, Me.Width)
		  buf.Graphics.DrawString(Me.Caption, (Me.Width/2) - (strWidth/2), ((Me.Height/2) + (strHeight/4)))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GreyScale(p As Picture)
		  //Converts the passed Picture to greyscale.
		  //Can take a few seconds on very large Pictures
		  //This function was *greatly* optimized by user 'doofus' on the RealSoftware forums:
		  //http://forums.realsoftware.com/viewtopic.php?f=1&t=42327&sid=4e724091fc9dd70fd5705110098adf67
		  //This function should be cross-platform safe.
		  
		  If p = Nil Then Raise New NilObjectException
		  Dim w As Integer = p.Width
		  Dim h As Integer = p.Height
		  Dim surf As RGBSurface = p.RGBSurface
		  
		  If surf = Nil Then Raise New NilObjectException
		  
		  Dim greyColor(255) As Color //precompute the 256 grey colors
		  For i As Integer = 0 To 255
		    greyColor(i) = RGB(i, i, i)
		  Next
		  
		  Dim X, Y, intensity As Integer, c As Color
		  For X = 0 To w
		    For Y = 0 To h
		      c = surf.Pixel(X, Y)
		      intensity = c.Red * 0.30 + c.Green * 0.59 + c.Blue * 0.11
		      surf.Pixel(X, Y) = greyColor(intensity) //lookup grey
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub highlight(ByRef buf As Picture)
		  Dim map(255) As Integer
		  For i as Integer = 255 DownTo 0
		    map(i) = 255 + i + 15
		  next
		  buf.RGBSurface.Transform(map)
		  
		  If hilightBorder Then
		    Dim middle1 As Color = RGB(hilightColor.Red * 0.75, hilightColor.Green * 0.75, hilightColor.Blue * 0.75)
		    Dim inner As Color = RGB(hilightColor.Red * 0.50, hilightColor.Green * 0.50, hilightColor.Blue * 0.50)
		    
		    buf.Graphics.ForeColor = hilightColor
		    buf.Graphics.DrawLine(0, 0, 0, Me.Height)
		    buf.Graphics.DrawLine(0, 0, Me.Width, 0)
		    buf.Graphics.DrawLine(Me.Width - 1, Me.Height - 1, Me.Width -1, 1)
		    buf.Graphics.DrawLine(Me.Width - 1, Me.Height - 1, 1, Me.Height - 1)
		    
		    buf.Graphics.ForeColor = middle1
		    buf.Graphics.DrawLine(1, 1, 1, Me.Height - 1)
		    buf.Graphics.DrawLine(1, 1, Me.Width - 1, 1)
		    buf.Graphics.DrawLine(Me.Width - 2, Me.Height - 2, Me.Width -2, 2)
		    buf.Graphics.DrawLine(Me.Width - 2, Me.Height - 2, 2, Me.Height - 2)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub invert(ByRef tmp As Picture)
		  Dim map(255) As Integer
		  For i as Integer = 0 to 255
		    map(i) = 255 - i + 178
		  next
		  tmp.RGBSurface.Transform(map)
		  highlight(tmp)
		  drawText(tmp)
		  Buffer.Graphics.DrawPicture(tmp, 0, 0)
		  Me.Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub reset()
		  #pragma BreakOnExceptions Off
		  Dim startColor As Color = &cC0C0C0 //FIXME make colors configurable
		  Dim endColor As Color = &cE6E6E6
		  
		  Dim ratio, endratio as Double
		  For i As Integer = 0 To buffer.Height
		    ratio = ((buffer.Height - i) / buffer.Height)
		    endratio = (i / buffer.Height)
		    buffer.Graphics.ForeColor = RGB(startColor.Red * endratio + endColor.Red * ratio, startColor.Green * endratio + endColor.Green * ratio, _
		    startColor.Blue * endratio + endColor.Blue * ratio)
		    buffer.Graphics.DrawLine(0, i, buffer.Width, i)
		  next
		  buffer.Graphics.ForeColor = endColor
		  buffer.Graphics.DrawLine(0, 0, buffer.Width, 0)
		  If isHovering Then 
		    highlight(buffer)
		  Else
		    buffer.Graphics.ForeColor = &c000000  
		    buffer.Graphics.DrawLine(0, 0, 0, Me.Height)
		    buffer.Graphics.DrawLine(0, 0, Me.Width, 0)
		    buffer.Graphics.DrawLine(Me.Width - 1, Me.Height - 1, Me.Width -1, 1)
		    buffer.Graphics.DrawLine(Me.Width - 1, Me.Height - 1, 1, Me.Height - 1)
		  End If
		  drawText(buffer)
		  If Not IsEnabled Then
		    GreyScale(buffer)
		  End If
		Exception Err As NilObjectException
		  //The button has not been fully created yet so there is no Graphics oobject yet
		  Return
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook


	#tag Note, Name = About ButtonCanvas
		Copyright (c)2011 Andrew Lambert
		
		You may use this class in your projects under the terms of the Creative Commons Attribution-Share Alike license.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBold
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBold = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Bold As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private buffer As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCaption
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCaption = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFont = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Font As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFontColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFontColor = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		FontColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFontSize = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		FontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhilightBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhilightBorder = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		hilightBorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mhilightColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhilightColor = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		hilightColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return mIsDown
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mIsDown = value
			  If value Then
			    invert(buffer)
			  Else
			    reset()
			  End If
			  
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Private IsDown As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnabled = value
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		IsEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return misHovering
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  misHovering = value
			  
			  If value Then
			    highlight(buffer)
			    drawText(buffer)
			  Else
			    reset()
			  End If
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Private isHovering As Boolean
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
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Italic As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaption As String = "Click Me!"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFont As String = """System"""
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontSize As Integer = 12
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhilightBorder As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mhilightColor As Color = &c00FFFF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private misHovering As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mItalic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUnderline As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUnderline
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUnderline = value
			  buffer = New Picture(Me.Width, Me.Height, 24)
			  reset()
			  Me.Refresh(False)
			End Set
		#tag EndSetter
		Underline As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mIsDown
			End Get
		#tag EndGetter
		Value As Boolean
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
			Name="Bold"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Font"
			Visible=true
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
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
			Name="hilightBorder"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hilightColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c00FFFF"
			Type="Color"
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
			Name="IsEnabled"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Behavior"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
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
			Name="Underline"
			Visible=true
			Group="Behavior"
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
			Name="Value"
			Group="Behavior"
			Type="Boolean"
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
