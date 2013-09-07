#tag Window
Begin Window HexViewerTest
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   486
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   948080639
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Hex Viewer Test"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "View File"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   118
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   461
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin ScrollBar ScrollBar1
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   459
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   584
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin CheckBox LineNumber
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Show Offsets"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   6
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   463
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin FontPicker textFont
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   428
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   463
      Underline       =   False
      Visible         =   True
      Width           =   165
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   276
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Use a fixed-width font!"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   462
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   146
   End
   Begin HexViewer HexViewer1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      Bold            =   ""
      ByteBackgroundColor=   "&cFFFFFF00"
      ByteBackgroundColorAlt=   "&cC0C0C000"
      ByteColor       =   "&c0000FF00"
      DoubleBuffer    =   True
      Enabled         =   True
      GutterColor     =   "&cFFFFFF00"
      GutterColorAlt  =   "&cC0C0C000"
      Height          =   459
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LineNumbersColor=   "&c80000000"
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      ShowOffsets     =   ""
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextBackGroundColor=   "&cFFFFFF00"
      TextBackGroundColorAlt=   "&cC0C0C000"
      TextColor       =   ""
      TextFont        =   "System"
      TextSize        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   583
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  SetScrollMax()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub SetScrollMax()
		  ScrollBar1.Maximum = HexViewer1.LineCount - (HexViewer1.VisibleLineCount \ 2)
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Dim g As FolderItem = GetOpenFolderItem("")
		  If g <> Nil Then
		    Dim bs As BinaryStream = BinaryStream.Open(g)
		    HexViewer1.ShowData(bs)
		    Self.Title = "Hex Viewer Test - " + g.AbsolutePath
		    SetScrollMax()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScrollBar1
	#tag Event
		Sub ValueChanged()
		  HexViewer1.Offset = Me.Value * HexViewer1.LineLength
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LineNumber
	#tag Event
		Sub Action()
		  HexViewer1.ShowOffsets = Me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Value = HexViewer1.ShowOffsets
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textFont
	#tag Event
		Sub FontSelected(FontName As String)
		  HexViewer1.TextFont = FontName
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim index As Integer
		  For i As Integer = 0 To Me.ListCount - 1
		    If Me.List(i) = "Consolas" Then
		      index = i
		      Exit For
		    End If
		    If InStr(Me.List(i), " mono") > 0 Then
		      index = i
		    End If
		    
		    If InStr(Me.List(i), " fixed") > 0 Then
		      index = i
		    End If
		  Next
		  Me.ListIndex = index
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HexViewer1
	#tag Event
		Function Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
		  #pragma Unused BytesDelta
		  ScrollBar1.Value = ScrollBar1.Value + LinesDelta
		  Return True ' Since we're updating the offset in ScrollBar1.ValueChanged, we return true to prevent the HexViewer from updating it too.
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim mb As New MemoryBlock(256)
		  For i As Integer = 0 To 255
		    mb.Byte(i) = i
		  Next
		  Dim bs As New BinaryStream(mb)
		  HexViewer1.ShowData(bs)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
