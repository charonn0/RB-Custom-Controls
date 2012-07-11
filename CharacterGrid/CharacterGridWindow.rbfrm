#tag Window
Begin Window CharacterGridWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   363
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1527588863
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "CharacterGrid Test Window"
   Visible         =   True
   Width           =   648
   Begin CharacterGrid CharacterGrid1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   0
      CaretPosition   =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   363
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectionColor  =   16776960
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   65280
      TextFont        =   "Veranda"
      TextSize        =   25
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   648
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   743
      LockedInPosition=   False
      Mode            =   2
      Period          =   75
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -24
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  
		  Static chars() As String
		  If UBound(Chars) = -1 Then
		    chars = SplitB("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut " + _
		    "labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea " + _
		    "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. " + _
		    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "")
		  End If
		  
		  CharacterGrid1.AppendChar(chars(0))
		  CharacterGrid1.Refresh(False)
		  chars.Remove(0)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
