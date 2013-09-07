#tag Window
Begin Window FilterListTest
   BackColor       =   -256
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "FilterList Test"
   Visible         =   True
   Width           =   600
   Begin FilterList FilterList1
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   "&cFFFFFF00"
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   400
      HelpTag         =   ""
      HilightColor    =   "&c80FF8000"
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
      TextColor       =   "&c00000000"
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events FilterList1
	#tag Event
		Sub Open()
		  Dim s() As String = Split("File item canvas control catalyst compile condone deacon")
		  Dim rand As New Random
		  
		  For i As Integer = 0 To 99
		    Dim x, y As Integer
		    Dim b1 As Boolean = Rand.Number > 0.5
		    Dim b2 As Boolean = Rand.Number > 0.5
		    x = Rand.InRange(0, s.Ubound)
		    y = Rand.InRange(0, s.Ubound)
		    Dim a, b As String
		    a = s(x)
		    If b1 Then a = Uppercase(a)
		    b = s(y)
		    If b2 Then b = Uppercase(b)
		    Me.AddItem(b + a)
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
