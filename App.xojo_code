#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Method, Flags = &h0
		Function LetterToNumber(Letter as text) As Integer
		  Dim result As Integer
		  Select Case Letter
		    
		  Case "A"
		    result = 1
		  Case "B"
		    result = 2
		  Case "C"
		    result = 3
		  Case "D"
		    result = 4
		  Case "E"
		    result = 5
		  Case "F"
		    result = 6
		  Case "G"
		    result = 7
		  Case "H"
		    result = 8
		  Case "I"
		    result = 9
		  Case "J"
		    result = 10
		  Case "K"
		    result = 11
		  Case "L"
		    result = 12
		  Case "M"
		    result = 13
		  Case "N"
		    result = 14
		  Case "O"
		    result = 15
		  Case "P"
		    result = 16
		  Case "Q"
		    result = 17
		  Case "R"
		    result = 18
		  Case "S"
		    result = 19
		  Case "T"
		    result = 20
		  Case "U"
		    result = 21
		  Case "V"
		    result = 22
		  Case "W"
		    result = 23
		  Case "X"
		    result = 24
		  Case "Y"
		    result = 25
		  Case "Z"
		    result = 26
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberToLetter(Number as Integer) As Text
		  Dim result As Text
		  Select Case Number
		    
		  Case 1
		    result = "A"
		  Case 2
		    result = "B"
		  Case 3
		    result = "C"
		  Case 4
		    result = "D"
		  Case 5
		    result = "E"
		  Case 6
		    result = "F"
		  Case 7
		    result = "G"
		  Case 8
		    result = "H"
		  Case 9
		    result = "I"
		  Case 10
		    result = "J"
		  Case 11
		    result = "K"
		  Case 12
		    result = "L"
		  Case 13
		    result = "M"
		  Case 14
		    result = "N"
		  Case 15
		    result = "O"
		  Case 16
		    result = "P"
		  Case 17
		    result = "Q"
		  Case 18
		    result = "R"
		  Case 19
		    result = "S"
		  Case 20
		    result = "T"
		  Case 21
		    result = "U"
		  Case 22
		    result = "V"
		  Case 23
		    result = "W"
		  Case 24
		    result = "X"
		  Case 25
		    result = "Y"
		  Case 26
		    result = "Z"
		  End Select
		End Function
	#tag EndMethod


	#tag Note, Name = Info.plist
		Keep the info.plist file if using the free api from fixer.io. Of course, this app is kind of usesless without the basic subscription
		
	#tag EndNote


	#tag Property, Flags = &h0
		#tag Note
			//Add your fixer.io API key as the default
		#tag EndNote
		APIKey As Text
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
