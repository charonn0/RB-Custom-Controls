#tag Window
Begin ContainerControl FilterList
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   -256
   Backdrop        =   0
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   False
   Visible         =   True
   Width           =   478
   Begin Listbox FilteredList
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
      Height          =   276
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   24
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   478
      _ScrollWidth    =   -1
   End
   Begin HintTextField FilterText
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   "Search..."
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      HintText        =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   1
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   1
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   476
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AddItem(Item As String)
		  List.Append(Item)
		  Update
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update()
		  FilteredList.DeleteAllRows()
		  For i As Integer = 0 To UBound(Self.List)
		    If InStr(Self.List(i), Self.Param) > 0 Or Param = "" Then
		      FilteredList.AddRow(Self.List(i))
		      FilteredList.RowTag(FilteredList.LastIndex) = i
		    End If
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		HilightColor As Color = &c80FFFFEE
	#tag EndProperty

	#tag Property, Flags = &h21
		Private List() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Param As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TextColor As Color = &c00000000
	#tag EndProperty


#tag EndWindowCode

#tag Events FilteredList
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If row > Me.ListCount - 1 Or row <= -1 Then Return False
		  Dim txt As String = Me.Cell(row, column)
		  Dim tstart, tstop, gstart, gstop As Integer
		  tstart = InStr(txt, Self.Param) - 1
		  tstop = tstart + Self.Param.Len
		  gstart = g.StringWidth(Left(txt, tstart))
		  For i As Integer = tstart To tstop
		    Dim char As String = Mid(txt.Trim, i, 1).Trim
		    If i = txt.Len Then Continue
		    gstop = gstop + g.StringWidth(char)
		  Next
		  g.ForeColor = Self.HilightColor
		  g.FillRoundRect(gstart, 2, gStop, g.Height - 2, 5, 5)
		  g.ForeColor = Self.TextColor
		  g.DrawString(txt, 0, y)
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events FilterText
	#tag Event
		Sub KeyUp(Key As String)
		  #pragma Unused Key
		  Self.Param = Me.Text
		  Update()
		End Sub
	#tag EndEvent
#tag EndEvents
