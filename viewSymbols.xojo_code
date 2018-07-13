#tag IOSView
Begin iosView viewSymbols
   BackButtonTitle =   "Symbols"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Available Symbols"
   Top             =   0
   Begin iOSTable tableSymbols
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   tableSymbols, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   tableSymbols, 2, <Parent>, 2, False, +1.00, 4, 1, -0, , True
      AutoLayout      =   tableSymbols, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   tableSymbols, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   tableSymbols, 3, TopLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   "0"
      Height          =   415.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  http = New APICall
		  
		  http.currentView = Self
		  
		  Dim URL As Text = "http://data.fixer.io/api/symbols?access_key=" + app.APIKey
		  
		  http.send("Get", URL )
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		http As APICall
	#tag EndProperty

	#tag Property, Flags = &h0
		Referrer As iOSView
	#tag EndProperty

	#tag Property, Flags = &h0
		source As text
	#tag EndProperty


#tag EndWindowCode

#tag Events tableSymbols
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  Dim selected As iOSTableCellData = Me.RowData( section, row )
		  
		  Self.close
		  
		  If Self.source = "Start" Then
		    
		    viewConvertOne( Referrer ).buttonSymbolStart.Caption = selected.Text
		    
		  Else
		    
		    viewConvertOne( Referrer ).buttonSymbolTarget.Caption = selected.Text
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="http"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
