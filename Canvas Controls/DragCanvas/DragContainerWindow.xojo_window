#tag Window
Begin Window DragContainerWindow
   BackColor       =   &c00A8F900
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   609
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   219828223
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "DragContainer Test"
   Visible         =   True
   Width           =   1015
   Begin dragContainer dragContainer1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   609
      HelpTag         =   ""
      HoverPeriod     =   250
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   1015
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Untitled"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1076
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -9
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim dragable As DragObject
		  Dim f As FolderItem = SpecialFolder.Pictures
		  
		  For i As Integer = 1 To f.Count
		    Dim ext As String = NthField(f.Item(i).Name, ".", CountFields(f.Item(i).Name, "."))
		    Select Case ext
		    Case "bmp", "png", "jpg", "jfif"
		      dragable = New dragPicture(Picture.Open(f.Item(i)))
		      dragable.File = f.Item(i)   //Using the Operator_Lookup method to access custom Properties of the DragObject instance
		      dragContainer1.addObject(dragable)
		    End Select
		    If i = 5 Then Exit For
		  Next
		  
		  
		  Dim p As Picture = TextToPicture( _
		  "This control is a DragContainer Canvas which will display " + EndOfLine + _
		  "any object which implements the DragObject interface." + EndOfLine + _
		  "Implementors of the DragObject Interface are 100% responsible " + EndOfLine + _
		  "for their own images. The DragContainer class merely draws the " + EndOfLine + _
		  "provided image at the proper coordinates and notifies via events " + EndOfLine + _
		  "of various actions (ItemClicked, ItemContextualMenuAction, etc.)")
		  
		  dragable = New dragPicture(p)
		  dragContainer1.addObject(dragable)
		  
		Exception
		  Return
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function TextToPicture(Text As String) As Picture
		  Dim lines() As Picture
		  Dim requiredHeight, requiredWidth As Integer
		  Dim tlines() As String = Split(Text, EndOfLine)
		  
		  For i As Integer = 0 To UBound(tlines)
		    Try
		      Dim p As New Picture(250, 250, 24)
		      p.Graphics.TextFont = "Lucida"
		      p.Graphics.TextSize = 15
		      Dim nm As String = tlines(i)
		      Dim strWidth, strHeight As Integer
		      strWidth = p.Graphics.StringWidth(nm) + 5
		      strHeight = p.Graphics.StringHeight(nm, strWidth)
		      p = New Picture(strWidth, strHeight + 4, 32)
		      p.Graphics.AntiAlias = True
		      p.Graphics.TextFont = "Lucida"
		      p.Graphics.TextSize = 15
		      p.Graphics.DrawString(nm, 1, ((p.Height/2) + (strHeight/4)))
		      p.Graphics.ForeColor = &cFFFFFF
		      p.Graphics.DrawRect(1, 1, p.Width - 1, p.Height - 1)
		      lines.Append(p)
		      requiredHeight = requiredHeight + p.Height
		      If p.Width > requiredWidth Then requiredWidth = p.Width
		    Catch NilObjectException
		      Continue
		    End Try
		  Next
		  Dim txtBuffer As Picture
		  txtBuffer = New Picture(requiredWidth, requiredHeight * 1.5, 24)
		  Dim x, y As Integer
		  For i As Integer = 0 To UBound(lines)
		    txtBuffer.Graphics.DrawPicture(lines(i), x, y)
		    y = y + lines(i).Height + 5
		  Next
		  txtBuffer.Graphics.ForeColor = &cFFFFFF
		  txtBuffer.Graphics.DrawRect(1, 1, txtBuffer.Width, txtBuffer.Height)
		  'txtBuffer.Transparent = 1
		  Return txtBuffer
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events dragContainer1
	#tag Event
		Function ItemDoubleClicked(Item As DragObject) As Boolean
		  If Item = Nil Then
		    Dim f As FolderItem = GetOpenFolderItem(FileTypes1.All)
		    If f <> Nil Then
		      Dim p As Picture
		      Try
		        p = p.Open(f)
		      Catch
		        Return False
		      End Try
		      Dim no As DragObject = New dragPicture(p)
		      Me.addObject(no)
		      Return True
		    End If
		  End If
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ItemContextMenuAction(Item As DragObject, hitItem As MenuItem) As Boolean
		  If hitItem.Text = "Delete" Then
		    Me.removeObject(Item)
		    Return True
		  ElseIf hitItem.Text = "Picture Info" Then
		    Dim pic As DragObject = Item
		    If pic.file <> Nil Then
		      Dim f As FolderItem = pic.file
		      #If RBVersion >= 2012 Then 'areas() was added in RS2012 R1
		        MsgBox(f.NativePath)
		      #Else
		        MsgBox(f.AbsolutePath)
		      #endif
		      
		      Return True
		    End If
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ItemCreateContextMenu(Item As DragObject, base As MenuItem) As Boolean
		  If Item <> Nil Then
		    Dim nm As New MenuItem("Picture Info")
		    Dim del As New MenuItem("Delete")
		    Dim lItem As DragObject = Item
		    If lItem.file <> Nil Then
		      nm.Enabled = True
		    End If
		    base.Append(nm)
		    base.Append(del)
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Quit()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Left = -1600
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		InheritedFrom="Window"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		InheritedFrom="Window"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
		InheritedFrom="Window"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		InheritedFrom="Window"
	#tag EndViewProperty
#tag EndViewBehavior
