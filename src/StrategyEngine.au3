Func position($dealer)
	Enum $EP, $MP, $LP
	Switch $dealer
	Case 0 to 1
		Return $MP
	Case 2 to 3 
		Return $EP
	Case 4 to 5
		Return $LP
	EndSwitch
EndFunc

Func handScore($myCards) ; Chen's Formula
	For $i=0 To 1
		If($myCards[$i][0]==1) Then
			$myCards[$i][0]=14
		EndIf
	Next
	_ArraySort($myCards, 0, 0, 0, 0)
	$handScore = 0
	Switch $myCards[1][0]
		Case 14
			$handScore=10
		Case 13
			$handScore=8
		Case 12
			$handScore=7
		Case 11
			$handScore=6
		Case 2 To 10
			$handScore+=Ceiling(($myCards[1][0])/2)
	EndSwitch
	If($myCards[0][0]==$myCards[1][0]) Then
		$handScore*=2
		If($handScore<5) Then
			$handScore=5
		EndIf
	EndIf
	If($myCards[0][1]==$myCards[1][1]) Then
		$handScore+=2
	EndIf
	$gap = $myCards[1][0]-$myCards[0][0]-1
	If($gap>=4) Then
		$gap=5
	EndIf
	If($gap>0) Then
		$handScore-=$gap
	EndIf
	If($gap<=1 And $myCards[1][0]<12) Then
		$handScore+=1
	EndIf
	Return $handScore
EndFunc

Func preFlop($myCards,$position, $raiseState)
	Enum $EP, $MP, $LP
	Enum $FOLD, $CALL, $RAISE
	$handScore=handScore($myCards)
	Switch $position
	Case $EP 
		If($handScore>=9 And $raiseState==False) Then
			Return $RAISE
		Else
			Return $FOLD
		EndIf
	Case $MP
		If($handScore>=8 And $raiseState==False) Then
			Return $RAISE
		Else
			Return $FOLD
		EndIf
	Case $LP
		If($handScore>=7 And $raiseState==False) Then
			Return $RAISE
		Else
			Return $FOLD
		EndIf
	EndSwitch
EndFunc
	
Func strategyEngine($data)
	Enum $PREFLOP, $FLOP, $TURN, $RIVER
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
	$position = position($dealer)
	Switch $round
	Case $PREFLOP
		Return preFlop($myCards,$position, $raiseState)
	Case Else
		Return
	EndSwitch
EndFunc

Func positionToString($position)
	Enum $EP, $MP, $LP
	Switch $position
	Case $EP
		Return "EP"
	Case $MP
		Return "MP"
	Case $LP
		Return "LP"
	EndSwitch
EndFunc


