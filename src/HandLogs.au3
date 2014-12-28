Func dataToLog($data)
	$myCards=$data[0]
	$dealer=$data[1]
	$players=$data[2]
	$boardCards=$data[3]
	$round=$data[4]
	$blinds=$data[5]
	$raiseState=$data[6]
	$pot=$data[7]
	$stacks=$data[8]
	$callCost=$data[9]
	FileWrite($file,@CRLF & @CRLF & "MyCards: " & cardsToString($myCards) & " ")
	FileWrite($file,@CRLF & "Dealer: " & dealerToString($dealer) & " ")
	FileWrite($file,@CRLF & "Players: " & playersToString($players) & " ")
	FileWrite($file,@CRLF & "MyStack: " & $stacks[$MY_POSITION] & " ")
	FileWrite($file,@CRLF & "BoardCards: " & cardsToString($boardCards))
	FileWrite($file,@CRLF & "Round: " & roundToString($round))
	FileWrite($file,@CRLF & "Blinds: " & $blinds[0] & "/" & $blinds[1])
	FileWrite($file,@CRLF & "Pot: " & $pot)
	FileWrite($file,@CRLF & "RaiseState: " & $raiseState)
	FileWrite($file,@CRLF & "CallCost: " & $callCost)
EndFunc