#tag Window
Begin Window DragContainerWindow
   BackColor       =   43257
   Backdrop        =   ""
   CloseButton     =   True
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
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
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
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   1015
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Untitled"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   1076
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -9
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim p As Picture = TextToPicture( _
		  "This control is a DragContainer Canvas which will display " + EndOfLine + _
		  "any object which implements the DragObject interface." + EndOfLine + _
		  "Implementors of the DragObject Interface are 100% responsible " + EndOfLine + _
		  "for their own images. The DragContainer class merely draws the " + EndOfLine + _
		  "provided image at the proper coordinates and notifies via events " + EndOfLine + _
		  "of various actions (ItemClicked, ItemContextualMenuAction, etc.)")
		  
		  Dim dragable As DragObject = New dragPicture(p)
		  dragContainer1.addObject(dragable)
		  
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
		      MsgBox(f.AbsolutePath)
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
