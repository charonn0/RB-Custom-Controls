#tag Window
Begin Window ColorSelectorWindow
   BackColor       =   -256
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   64
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
   Title           =   "Untitled"
   Visible         =   True
   Width           =   204
   Begin ColorSelector ColorSelector1
      AutoDeactivate  =   True
      BorderWidth     =   1
      Enabled         =   True
      Height          =   47
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   11
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   9
      Visible         =   True
      Width           =   42
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   65
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   139
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events ColorSelector1
	#tag Event
		Sub ColorSelected(c As Color)
		  #pragma Unused c
		  Canvas1.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  App.UseGDIPlus = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  #If RBVersion >= 2012 Then 'areas() was added in RS2012 R1
		    #pragma Unused areas
		  #endif
		  g.ForeColor = ColorSelector1.SelectedColor
		  g.FillRect(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
