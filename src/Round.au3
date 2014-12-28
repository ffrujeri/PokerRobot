Func gameRound($boardCards)
	Enum $PREFLOP, $FLOP, $TURN, $RIVER
	$flag=0
	for $i = 0 to 4
		if $boardCards[$i][0]<>0 Then
			$flag=$flag+1
		EndIf
	Next
	Switch $flag
		Case 0
			return $PREFLOP
		Case 3
			return $FLOP
		Case 4
			return $TURN
		Case 5
			return $RIVER
	EndSwitch
EndFunc

Func roundToString($round)
	Enum $PREFLOP, $FLOP, $TURN, $RIVER
	Switch $round
		Case $PREFLOP
			Return "Pre-flop"
		Case $FLOP
			Return "Flop"
		Case $TURN
			Return "Turn"
		Case $RIVER
			Return "River"
	EndSwitch
EndFunc