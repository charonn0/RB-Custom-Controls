#tag Class
Protected Class DirViewListEx
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #pragma Unused row
		  //fill the selected column with a light gray
		  if column=lastPressedHeader then
		    g.foreColor=&cEFEFEF
		    g.fillrect 0,0,g.width,g.height
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Change()
		  dim fi as folderItem
		  if me.listindex<0 then return
		  fi=me.cellTag(me.listindex,0)
		  
		  itemClicked fi
		  Change
		End Sub
	#tag EndEvent

	#tag Event
		Sub DoubleClick()
		  if me.listindex<0 then return
		  dim fi as folderItem
		  
		  me.expanded(me.listindex)=not me.expanded(me.listindex)
		  fi=me.cellTag(me.listindex,0)
		  
		  itemDoubleClicked fi
		  DoubleClick
		End Sub
	#tag EndEvent

	#tag Event
		Sub ExpandRow(row As Integer)
		  //scan a child directory...
		  dim fi as folderitem
		  me.cell(row,0)=me.cell(row,0)+" (...)"
		  fi=me.cellTag(row,0)
		  
		  scan(fi)
		  me.cell(row,0)=replaceall(me.cell(row,0)," (...)","")
		End Sub
	#tag EndEvent

	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  lastPressedHeader=column
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //find an item
		  dim fi as folderItem
		  
		  dim i as integer
		  if(ticks-lastKeyPressedAt<30) then
		    lastkeyPressed=lastkeyPressed+key
		  else
		    lastkeyPressed=key
		  end if
		  lastKeyPressedAt=ticks
		  listIndex=-1
		  
		  for i = 0 to listcount-1
		    if(lowercase(left(list(i),len(lastKeyPressed)))=Lowercase(lastKeyPressed)) then
		      listindex=i
		      exit
		    end if
		  next
		  
		  if asc(key)=8 or asc(key)=127 and me.listindex>=0 then
		    fi=me.cellTag(me.listIndex,0)
		    if shouldRemoveItem(fi) then
		      me.removeRow me.listindex
		    end if
		    return true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.hierarchical=true
		  me.heading(0)="Name"
		  
		  if me.columncount>1 then
		    me.heading(1)="Size"
		    me.column(0).minWidthExpression="50%"
		    me.column(0).WidthExpression="80%"
		    
		    me.column(1).minWidthExpression="20%"
		  end if
		  
		  lastPressedHeader=-1
		  
		  Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub addDir(fi as folderItem)
		  if not fi.directory then return
		  
		  me.addfolder fi.name
		  if displayFinderIcons then
		    #if hasMBS then
		      me.rowPicture(me.lastIndex)=fi.iconMBS(16)
		    #else
		      me.rowPicture(me.lastIndex)=dirIcon
		    #endif
		    
		  end if
		  me.celltag(me.lastindex,0)=fi
		  me.cell(me.lastindex,1)=str(fi.count)+" items"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub addItem(fi as folderItem)
		  me.addrow fi.name
		  
		  if displayFinderIcons then
		    #If TargetWin32 Then
		      me.rowPicture(me.lastIndex) = DefaultIconForFileType(NthField(fi.Name, ".", CountFields(fi.Name, ".")))
		    #Else
		      #if hasMBS then
		        me.rowPicture(me.lastIndex)=fi.iconMBS(16)
		      #else
		        me.rowPicture(me.lastIndex)=docIcon
		      #endif
		    #endif
		  end if
		  
		  me.celltag(me.lastindex,0)=fi
		  me.cell(me.lastindex,1)=format(fi.length/1000,"#.#")+" K"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DefaultIconForFileType(extension As String, size As Integer = 16) As Picture
		  //Given a file extension like "html" or "doc", returns a picture of the default icon for that file type.
		  //If the specified file type doesn't have a default icon, this function returns Nil
		  
		  #If TargetWin32 Then
		    Static icons As Dictionary
		    If icons = Nil Then icons = New Dictionary
		    If icons.HasKey(extension) Then
		      Return icons.Value(extension)
		    Else
		      Dim info As SHFILEINFO
		      Declare Function SHGetFileInfo Lib "Shell32" Alias "SHGetFileInfoW" (FilePath As WString, Attribs As Integer, _
		      ByRef info As SHFILEINFO, infoSize As Integer, flags As Integer) As Boolean
		      Declare Function DrawIconEx Lib "User32" (hDC As Integer, xLeft As Integer, yTop As Integer, hIcon As Integer, _
		      cxWidth As Integer, cyWidth As Integer, istepIfAniCur As Integer, hbrFlickerFreeDraw As Integer, diFlags As Integer) As Integer
		      Declare Function DestroyIcon Lib "User32" (hIcon As Integer) As Integer
		      Const FILE_ATTRIBUTE_NORMAL = &h00000080
		      Const SHGFI_DISPLAYNAME = &h000000200
		      Const SHGFI_ICON = &h000000100
		      Const SHGFI_TYPENAME = &h000000400
		      Const SHGFI_USEFILEATTRIBUTES = &h000000010
		      If SHGetFileInfo("foo." + extension, FILE_ATTRIBUTE_NORMAL, info, info.Size, _
		        SHGFI_DISPLAYNAME Or SHGFI_TYPENAME Or SHGFI_USEFILEATTRIBUTES Or SHGFI_ICON) Then
		        Dim theIcon As Picture = New Picture(size, size, 32)
		        theIcon.Transparent = 1
		        Call DrawIconEx(theIcon.Graphics.Handle(1), 0, 0, info.hIcon, size, size, 0, 0, &h3)
		        Call DestroyIcon(info.hIcon)
		        icons.Value(extension) = theIcon
		        Return theIcon
		      Else
		        Return Nil
		      End If
		    End If
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function dirIcon() As picture
		  if _dirIcon=nil then
		    _dirIcon=new picture(16,16,32)
		    _dirIcon.mask.graphics.drawPicture dirMask,0,0
		    _dirIcon.graphics.drawPicture dir,0,0
		  end if
		  
		  return _dirIcon
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function docIcon() As picture
		  if _docIcon=nil then
		    _docIcon=new picture(16,16,32)
		    _docIcon.mask.graphics.drawPicture docMask,0,0
		    _docIcon.graphics.drawPicture doc,0,0
		  end if
		  
		  return _docIcon
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub scan(dir as folderItem)
		  dim i,cnt as integer
		  'dim stamp as double
		  'dim key as string
		  
		  if dir.directory then
		    cnt=dir.count
		    for i=1 to cnt
		      if dir.item(i).directory then
		        addDir(dir.item(i))
		      elseif dir.item(i).visible then
		        addItem(dir.item(i))
		      end if
		      if ticks>lastTicks+180 then
		        app.doevents
		        lastTicks=ticks
		      end if
		    next
		  elseif dir.visible then
		    addItem(dir)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scanDir(dir as folderItem)
		  if dir=nil then return
		  baseDir=dir
		  me.deleteAllRows
		  
		  if dir.directory then
		    addDir(dir)
		  else
		    me.addrow dir.name
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoubleClick()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event itemClicked(fi as folderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event itemDoubleClicked(fi as folderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event shouldRemoveItem(fi as folderItem) As boolean
	#tag EndHook


	#tag Note, Name = Info
		
		DirViewListEx
		By Alex Restrepo
		send comments, suggestions, fixes to alexrestrepo@mac.com
		
		To view the contents of a directory just call
		ScanDir(folderItem)
		
		requires the MonkeyBread plugin to display the actual finder Icons, then set the constant hasMBS to true
		
		Use in whatever way you like... at your own risk :P
		let me know if you find it useful.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected baseDir As folderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		displayFinderIcons As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastKeyPressed As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastKeyPressedAt As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastPressedHeader As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastTicks As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected _dirIcon As picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected _docIcon As picture
	#tag EndProperty


	#tag Constant, Name = hasMBS, Type = Boolean, Dynamic = False, Default = \"false", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = SHFILEINFO, Flags = &h21
		hIcon As Integer
		  IconIndex As Int32
		  attribs As Integer
		  displayName As WString*260
		TypeName As WString*80
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="displayFinderIcons"
			Visible=true
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Listbox"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Listbox"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Listbox"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			InheritedFrom="Listbox"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			InheritedFrom="Listbox"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
