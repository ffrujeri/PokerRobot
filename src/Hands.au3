Func myHand($myCards, $boardCards)
	$allCards=concatenateHand($myCards, $boardCards)
	$cards=cardsSort($allCards)
	Return findCombinations($cards)
EndFunc

Func concatenateHand($myCards, $boardCards)
	For $i=0 To UBound($boardCards)-1
		If($boardCards[$i][0]<>0) Then
			ReDim $myCards[UBound($myCards)+1][2]
			$myCards[UBound($myCards)-1][0]=$boardCards[$i][0]
			$myCards[UBound($myCards)-1][1]=$boardCards[$i][1]
		EndIf
	Next
	Return $myCards
EndFunc

Func changeArank($allCards)
	For $i=0 To UBound($boardCards)-1
		If($boardCards[$i][0]==1) Then
			ReDim $myCards[UBound($myCards)+1][2]
			$boardCards[$i][0]==14
		EndIf
	Next
EndFunc

Func cardsSort($allCards)
	Dim $cards[15][5]=[[0, 0, 0, 0, 0],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false],[0, false, false, false, false]]
	For $i=0 To UBound($allCards)-1                                                                                                                                    
		$cards[$allCards[$i][0]][$allCards[$i][1]]=True
		$cards[$allCards[$i][0]][0]+=1
		$cards[0][$allCards[$i][1]]+=1
	Next
	For $i=1 To 4                                                                                                                                    
		$cards[14][$i]=$cards[1][$i]
	Next
	Return $cards
EndFunc

Func findCombinations($cards)
	Dim $combinations[9]=[0,0,0,0,0,0,0,0,0] 
	#cs
		0 Straight flush
		1 Four of a kind
		2 Full house
		3 Flush
		4 Straight
		5 Three of a kind
		6 Two pairs
		7 One pair
		8 High card
	#ce
	
	For $i=1 To 14
		If($i<=4) Then ;Flush
			If($cards[0][$i]>=5) Then
				For $j=14 to 1 Step -1
					If($cards[$j][$i]) Then
						Dim $flush[2]
						$flush[0]=$j
						$flush[1]=$i
						$combinations[3]=$flush
						ExitLoop
					EndIf
				Next 
			EndIf
		EndIf
		
		If($i<=10) Then ;Straight / Straight flush
			If($cards[$i][0]<>0 And $cards[$i+1][0]<>0 And $cards[$i+2][0]<>0 And $cards[$i+3][0]<>0 And $cards[$i+4][0]<>0) Then
				$combinations[4]=$i+4
				For $j=1 to 4
					If($cards[$i][$j]<>0 And $cards[$i+1][$j]<>0 And $cards[$i+2][$j]<>0 And $cards[$i+3][$j]<>0 And $cards[$i+4][$j]<>0) Then
						$combinations[0]=$i+4
						ExitLoop
					EndIf
				Next
			EndIf
		EndIf

		Switch $cards[$i][0]
			Case 4 ;Four of a kind
				$combinations[1]=$i 
			Case 3	; Three of a kind
				If($combinations[5]==0) Then
					$combinations[5]=$i
				Else
					$onePair=$combinations[5]
					$combinations[5]=$i
					$combinations[7]=$onePair
				EndIf
			Case 2 ; Two pairs / One pair
				If($combinations[7]==0) Then
					$combinations[7]=$i ;One Pair
				Else
					Dim $twoPairs[3]
					If($combinations[6]==0) Then ;Two Pairs
						$twoPairs[1]=$combinations[7]
						$twoPairs[0]=$i
						$combinations[7]=0	
					Else
						$twoPairs = $combinations[6]
						If($twoPairs[1]>$combinations[8]) Then
							$combinations[8]=$twoPairs[1]
						EndIf
						$twoPairs[0]=$twoPairs[1]
						$twoPairs[1]=$i
					EndIf
					$combinations[6]=$twoPairs
				EndIf
			Case 1 ; High card
				$combinations[8]=$i
		EndSwitch
	Next
	If($combinations[5]<>0 And $combinations[6]<>0) Then ; Full House
		Dim $fullHouse[2]
		$fullHouse[0]=$combinations[5]
		$fullHouse[1]=$combinations[6]
		$combinations[2]=$fullHouse
	ElseIf($combinations[5]<>0 And $combinations[7]<>0) Then ; Full House
		Dim $fullHouse[2]
		$fullHouse[0]=$combinations[5]
		$fullHouse[1]=$combinations[7]
		$combinations[2]=$fullHouse
	EndIf
	If($combinations[1]<>0) Then
		Dim $fourOfAKind[2]
		$fourOfAKind[0]=$combinations[1]
		$fourOfAKind[1]=$combinations[8]
		$combinations[1]=$fourOfAKind
	EndIf
	If($combinations[5]<>0) Then
		Dim $ThreeOfAKind[2]
		$ThreeOfAKind[0]=$combinations[5]
		$ThreeOfAKind[1]=$combinations[8]
		$combinations[5]=$ThreeOfAKind
	EndIf
	If($combinations[6]<>0) Then
		$twoPairs=$combinations[6]
		$twoPairs[2]=$combinations[8]
		$combinations[6]=$twoPairs
	EndIf
	If($combinations[7]<>0) Then
		Dim $onePair[2]
		$onePair[0]=$combinations[7]
		$onePair[1]=$combinations[8]
		$combinations[7]=$onePair
	EndIf
	For $i=0 To 8
		If($combinations[$i]<>0) Then
			Dim $myHand[2]
			$myHand[0]=$i
			$myHand[1]=$combinations[$i]
			Return $myHand
		EndIf
	Next
	Return $combinations
EndFunc
