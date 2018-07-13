#tag Class
Protected Class APICall
Inherits Xojo.Net.HTTPSocket
	#tag Event
		Function AuthenticationRequired(Realm as Text, ByRef Name as Text, ByRef Password as Text) As Boolean
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Error(err as RuntimeException)
		  Dim buffer As Text = err.ErrorNumber.ToText + " - " + err.Reason
		  
		  Select Case currentView
		  Case IsA viewSymbols
		    viewSymbols( currentView ).tableSymbols.AddSection
		    viewSymbols( currentView ).tableSymbols.AddRow( 0, buffer )
		    
		  End Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  // We convert the returned content (MemoryBlock) to a Text
		  Dim buffer As Text = TextEncoding.UTF8.ConvertDataToText( Content )
		  Select Case currentView
		  Case IsA viewSymbols
		    For i As Integer = 1 To 26
		      viewSymbols( currentView ).tableSymbols.AddSection( app.NumberToLetter( i ) )
		    Next
		    Dim d As Xojo.Core.Dictionary = Xojo.Data.ParseJSON( buffer )
		    Dim emptyA() As Auto 
		    Dim results As Xojo.Core.Dictionary = d.Lookup("symbols", emptyA)
		    For Each entry As xojo.core.dictionaryentry In results
		      Dim symbol, name, fill As Text
		      symbol = entry.Key
		      name = entry.Value
		      fill = symbol + " - " + name
		      Dim a As iOSTableCellData = viewSymbols( currentView ).tableSymbols.CreateCell
		      a.Text = Symbol
		      a.DetailText = name
		      viewSymbols(currentView).tableSymbols.AddRow( app.LetterToNumber( symbol.Left( 1 ) ), a )
		    Next
		    
		  Case IsA viewConvertOne
		    
		    Dim d As Xojo.Core.Dictionary = Xojo.Data.ParseJSON( buffer )
		    Dim emptyA() As Auto 
		    //Dim results As Xojo.Core.Dictionary = d.Lookup("result", "Error" )
		    viewConvertOne( currentView ).labelResult.Text = "Result: " + d.Lookup("result", "Error" )
		    viewConvertOne( currentView ).labelResult.Visible = True
		    
		  End Select
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		currentView As iOSView
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValidateCertificates"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
