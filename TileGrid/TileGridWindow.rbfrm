#tag Window
Begin Window TileGridWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.33e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   594687999
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "TileGrid Test Window"
   Visible         =   True
   Width           =   600
   Begin TileGrid TileGrid1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      ColumnCount     =   6
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   533
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RowCount        =   6
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events TileGrid1
	#tag Event
		Function TilePaint(GridX As Integer, GridY As Integer, Tile As GridTile) As Boolean
		  If Tile = Nil Then Return False
		  Dim p As New Picture(Tile.Rect.Width, Tile.Rect.Height, 32)
		  p.Graphics.ForeColor = &c80808000
		  p.Graphics.FillRect(1, 1, Tile.Rect.Width - 1, Tile.Rect.Height - 1)
		  p.Graphics.ForeColor = &c00000000
		  p.Graphics.DrawString(Str(Tile.Grid.Left) + ", " + Str(Tile.Grid.Right), 4, Tile.Rect.Height \ 2)
		  Tile.Avatar = p
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function TileClick(GridX As Integer, GridY As Integer, Tile As GridTile) As Boolean
		  If Tile = Nil Then Return False
		  Dim p As New Picture(Tile.Rect.Width, Tile.Rect.Height, 32)
		  p.Graphics.ForeColor = &cFF008000
		  p.Graphics.FillRect(2, 2, Tile.Rect.Width - 2, Tile.Rect.Height - 2)
		  p.Graphics.ForeColor = &c00000000
		  p.Graphics.DrawString(Str(Tile.Grid.Left) + ", " + Str(Tile.Grid.Right), 4, Tile.Rect.Height \ 2)
		  Tile.Avatar = p
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
