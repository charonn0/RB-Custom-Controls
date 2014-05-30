#tag Window
Begin Window ColorSelectorWindow
   BackColor       =   -256
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.4e+1
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Color Selector Test"
   Visible         =   True
   Width           =   8.2e+1
   Begin ColorSelector ColorSelector1
      AutoDeactivate  =   True
      BorderColor     =   &h000000
      BorderWidth     =   1
      Enabled         =   True
      FillColor       =   &hFFFFFF
      Height          =   47
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   9
      Visible         =   True
      Width           =   42
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events ColorSelector1
	#tag Event
		Sub ColorSelected(c As Color)
		  #pragma Unused c
		  'Canvas1.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  App.UseGDIPlus = True
		End Sub
	#tag EndEvent
#tag EndEvents
