#tag Window
Begin Window OnOffToggleTest
   BackColor       =   -256
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   130
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "On/Off Toggle Test"
   Visible         =   True
   Width           =   258
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Item:"
      TextAlign       =   2
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   32
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   46
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Item:"
      TextAlign       =   2
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   61
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   46
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Item:"
      TextAlign       =   2
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   93
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   46
   End
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   92
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   27
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   121
      _ScrollWidth    =   -1
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Rounded"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin OnOffToggle OnOff
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColorFalse=   "&cC0C0C000"
      BackgroundColorTrue=   "&c0080FF00"
      Bold            =   ""
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      FalseText       =   "Off"
      Height          =   30
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   ""
      Left            =   58
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Rounded         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColorFalse  =   "&c00000000"
      TextColorTrue   =   "&cFFFFFF00"
      TextFont        =   "System"
      TextSize        =   0.0
      ThumbColorFalse =   "&c80808000"
      ThumbColorTrue  =   "&c80808000"
      Top             =   26
      TrueText        =   "On"
      Underline       =   ""
      UseFocusRing    =   True
      Value           =   False
      Visible         =   True
      Width           =   60
   End
   Begin OnOffToggle OnOff
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColorFalse=   "&cC0C0C000"
      BackgroundColorTrue=   "&c0080FF00"
      Bold            =   ""
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      FalseText       =   "Off"
      Height          =   30
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   58
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Rounded         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextColorFalse  =   "&c00000000"
      TextColorTrue   =   "&cFFFFFF00"
      TextFont        =   "System"
      TextSize        =   0.0
      ThumbColorFalse =   "&c80808000"
      ThumbColorTrue  =   "&c80808000"
      Top             =   58
      TrueText        =   "On"
      Underline       =   ""
      UseFocusRing    =   True
      Value           =   False
      Visible         =   True
      Width           =   60
   End
   Begin OnOffToggle OnOff
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BackgroundColorFalse=   "&cC0C0C000"
      BackgroundColorTrue=   "&c0080FF00"
      Bold            =   ""
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      FalseText       =   "Off"
      Height          =   30
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   ""
      Left            =   58
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Rounded         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColorFalse  =   "&c00000000"
      TextColorTrue   =   "&cFFFFFF00"
      TextFont        =   "System"
      TextSize        =   0.0
      ThumbColorFalse =   "&c80808000"
      ThumbColorTrue  =   "&c80808000"
      Top             =   90
      TrueText        =   "On"
      Underline       =   ""
      UseFocusRing    =   True
      Value           =   False
      Visible         =   True
      Width           =   60
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events CheckBox1
	#tag Event
		Sub Action()
		  OnOff(0).Rounded = Me.Value
		  OnOff(1).Rounded = Me.Value
		  OnOff(2).Rounded = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OnOff
	#tag Event
		Sub ValueChanged(index as Integer)
		  Listbox1.AddRow("Toggle #" + Str(index) + ": " + Str(Me.Value))
		  Listbox1.ScrollPosition = Listbox1.LastIndex
		End Sub
	#tag EndEvent
#tag EndEvents
