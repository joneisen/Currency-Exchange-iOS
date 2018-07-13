#tag IOSView
Begin iosView viewConvertOne
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSTextField fieldEntry
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   fieldEntry, 7, , 0, False, +1.00, 4, 1, 262, , True
      AutoLayout      =   fieldEntry, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   fieldEntry, 8, , 0, True, +1.00, 4, 1, 31, , True
      AutoLayout      =   fieldEntry, 4, <Parent>, 4, False, +1.00, 4, 1, -374, , True
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   29
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   "Enter amount here"
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   75
      Visible         =   True
      Width           =   262.0
   End
   Begin iOSButton buttonSymbolStart
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   buttonSymbolStart, 4, fieldEntry, 4, False, +1.00, 4, 1, 60, , True
      AutoLayout      =   buttonSymbolStart, 9, <Parent>, 9, False, +1.00, 4, 1, -79, , True
      AutoLayout      =   buttonSymbolStart, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   buttonSymbolStart, 7, , 0, False, +1.00, 4, 1, 122, , True
      Caption         =   "Start Currency"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   136
      Visible         =   True
      Width           =   122.0
   End
   Begin iOSButton buttonSymbolTarget
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   buttonSymbolTarget, 1, <Parent>, 1, False, +1.00, 4, 1, 175, , True
      AutoLayout      =   buttonSymbolTarget, 2, fieldEntry, 2, False, +1.00, 4, 1, 9, , True
      AutoLayout      =   buttonSymbolTarget, 11, buttonSymbolStart, 11, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   buttonSymbolTarget, 8, , 0, False, +1.00, 4, 1, 30, , True
      Caption         =   "Target Currency"
      Enabled         =   True
      Height          =   30.0
      Left            =   175
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   136
      Visible         =   True
      Width           =   125.0
   End
   Begin iOSLabel labelResult
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   labelResult, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   labelResult, 1, fieldEntry, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   labelResult, 2, fieldEntry, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   labelResult, 3, buttonLookup, 4, False, +1.00, 4, 1, 50, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   29
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   0
      Text            =   "result"
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   296
      Visible         =   False
      Width           =   262.0
   End
   Begin iOSButton buttonLookup
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   buttonLookup, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   buttonLookup, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   buttonLookup, 3, buttonSymbolStart, 4, False, +1.00, 4, 1, 50, , True
      AutoLayout      =   buttonLookup, 7, , 0, False, +1.00, 4, 1, 100, , True
      Caption         =   "Lookup"
      Enabled         =   True
      Height          =   30.0
      Left            =   110
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   216
      Visible         =   True
      Width           =   100.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Property, Flags = &h0
		http As APICall
	#tag EndProperty


#tag EndWindowCode

#tag Events buttonSymbolStart
	#tag Event
		Sub Action()
		  Dim v As New viewSymbols
		  Self.PushTo( v )
		  v.source = "Start"
		  v.Referrer = Self
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events buttonSymbolTarget
	#tag Event
		Sub Action()
		  Dim v As New viewSymbols
		  Self.PushTo( v )
		  v.source = "Target"
		  v.Referrer = Self
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events buttonLookup
	#tag Event
		Sub Action()
		  http = New APICall
		  
		  http.currentView = Self
		  
		  Dim URL As Text = "http://data.fixer.io/api/convert?access_key=" + app.APIKey + "&from=" + buttonSymbolStart.Caption + "&to=" + buttonSymbolTarget.Caption + "&amount=" + Integer.Parse( Self.fieldEntry.Text ).totext
		  
		  http.send("Get", URL )
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
#tag EndViewBehavior
