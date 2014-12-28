Func myHand($myCards, $boardCards)
	$allCards=concatenateHand($myCards, $boardCards)
	$cards=cardsSort($allCards)
	$combinations=findCombinations($cards)
	
	Dim $myHand[2] = [$bestHand, $kicker]
	Return $myHand
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
	Dim $ranks[15]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	Dim $suits[5]=[0,0,0,0,0]
	For $i=0 To UBound($allCards)-1
		If($ranks[$allCards[$i][0]]==0) Then
			Dim $card[2]
			$card[0]=1
			$card[1]=$allCards[$i][1]
			$ranks[$allCards[$i][0]]=$card
		Else
			$card = $ranks[$allCards[$i][0]]
			ReDim $card[UBound($card)+1]
			$card[0]+=1
			$card[UBound($card)-1]=$allCards[$i][1]
			$ranks[$allCards[$i][0]]=$card
		EndIf	
		If($suits[$allCards[$i][1]]==0) Then
			Dim $card[2]
			$card[0]=1
			$card[1]=$allCards[$i][0]
			$suits[$allCards[$i][1]]=$card
		Else
			$card = $suits[$allCards[$i][1]]
			ReDim $card[UBound($card)+1]
			$card[0]+=1
			$card[UBound($card)-1]=$allCards[$i][0]
			$suits[$allCards[$i][1]]=$card
		EndIf		
	Next
	$ranks[14]=$ranks[1]
	Dim $cards[2]
	$cards[0]=$ranks
	$cards[1]=$suits
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
	Dim $ranks = $cards[0]
	Dim $suits = $cards[1]
	
	For $i=1 To 14
		If($ranks[$i]<>0) Then
			$rank0 = $ranks[$i]
			If($i<=10) Then ;Straight / Straight flush
				If($ranks[$i+1]<>0 And $ranks[$i+2]<>0 And $ranks[$i+3]<>0 And $ranks[$i+4]<>0) Then
					$rank1 = $ranks[$i+1] 
					$rank2 = $ranks[$i+2]
					$rank3 = $ranks[$i+3]
					$rank4 = $ranks[$i+4]
					If($rank0[0] And $rank1[0] And $rank2[0] And $rank3[0] And $rank4[0]) Then
						Dim $hand[5][2]
						$hand[0][0]=$rank0[0]
						$hand[0][1]=$rank0[1]
						$hand[1][0]=$rank1[0]
						$hand[0][1]=$rank1[1]
						$hand[2][0]=$rank2[0]
						$hand[0][1]=$rank2[1]
						$hand[3][0]=$rank3[0]
						$hand[0][1]=$rank3[1]
						$hand[4][0]=$rank4[0]
						$hand[0][1]=$rank4[1]
				
						Dim $flagFlush[5]=[0,0,0,0,0]
						For $j=1 To 3
							If(UBound($rank0)>=$j+1) Then
								$flagFlush[$rank0[$j]]+=1
							EndIf
							If(UBound($rank1)>=$j+1) Then
								$flagFlush[$rank1[$j]]+=1
							EndIf
							If(UBound($rank2)>=$j+1) Then
								$flagFlush[$rank2[$j]]+=1
							EndIf
							If(UBound($rank3)>=$j+1) Then
								$flagFlush[$rank3[$j]]+=1
							EndIf			
							If(UBound($rank4)>=$j+1) Then
								$flagFlush[$rank4[$j]]+=1
							EndIf
						Next	
						If ($flagFlush[0]==5 Or $flagFlush[1]==5 Or $flagFlush[2]==5 Or $flagFlush[3]==5 Or $flagFlush[4]==5) Then
							$combinations[0]=$hand
						Else
							$combinations[4]=$hand
						EndIf
						Return $combinations
					EndIf
				EndIf
			EndIf
			If($i<=4) Then ;Flush
				$rank0Flush= $suits[$i]
				If($rank0Flush[0]>=5) Then
					Dim $hand[5][2]
					For $j=0 To 4
						$hand[$j][0]=$rank0Flush[$j+1]
						$hand[$j][1]=$rank0Flush[0]
					Next
					$combinations[3]=$hand
					Return $combinations
				EndIf
			EndIf
			Dim $hand[5][2]
			For $j=1 To UBound($rank0)-1
				$hand[$j-1][0]=$i
				$hand[$j-1][1]=$rank0[$j]
			Next
			
			Switch $rank0[0]
				Case 4
					$combinations[1]=$hand ;Four of a kind
				Case 3	; Three of a kind
					If($combinations[5]==0) Then
						$combinations[5]=$hand
					Else
						$ThreeOfAKind=$combinations[5]
						For $j=0 To 1
							$hand[$j+3][0]=$ThreeOfAKind[$j][0]
							$hand[$j+3][1]=$ThreeOfAKind[$j][1]
						Next
						$combinations[5]=0
						$combinations[2]=$hand ;Full House
						Return $combinations
					EndIf
				Case 2 ; Two pairs / One pair
					If($combinations[7]==0) Then
						$combinations[7]=$hand ;One Pair
					Else
						If($combinations[6]==0) Then ;Two Pairs
							$onePair=$combinations[7]
							For $j=0 To 1
								$hand[$j+2][0]=$onePair[$j][0]
								$hand[$j+2][1]=$onePair[$j][1]
							Next	
							$combinations[7]=0	
						Else
							$twoPairs = $combinations[6]
							$highCard= $combinations[8]
							If($twoPairs[2][0]>$highCard[0][0]) Then
								$highCard[0][0]=$twoPairs[2][0]
								$combinations[8]=$highCard
							EndIf
							For $j=0 To 1
								$hand[$j+2][0]=$twoPairs[$j][0]
								$hand[$j+2][1]=$twoPairs[$j][1]
							Next	
						EndIf
						$combinations[6]=$hand
					EndIf
				Case 1 ; High card
					$combinations[8]=$hand
			EndSwitch
		EndIf
	Next
	If($combinations[5]<>0 And $combinations[6]<>0) Then ; Full House
		$threeOfAKind=$combinations[5]
		$twoPairs=$combinations[6]
		For $j=0 To 1
			$threeOfAKind[$j+3][0]=$twoPairs[$j][0]
			$threeOfAKind[$j+3][1]=$twoPairs[$j][1]
		Next
		$combinations[5]=0
		$combinations[6]=0
		$combinations[2]=$threeOfAKind
	ElseIf($combinations[5]<>0 And $combinations[7]<>0) Then ; Full House
		$threeOfAKind=$combinations[5]
		$onePair=$combinations[7]
		For $j=0 To 1
			$threeOfAKind[$j+3][0]=$onePair[$j][0]
			$threeOfAKind[$j+3][1]=$onePair[$j][1]
		Next
		$combinations[5]=0
		$combinations[7]=0
		$combinations[2]=$threeOfAKind
	EndIf
	If($combinations[1]<>0) Then
		$fourOfAKind=$combinations[1]
		$highCard=$combinations[8]
		$fourOfAKind[4][0]=$highCard[0][0]
		$combinations[1]=$fourOfAKind
	EndIf
	If($combinations[6]<>0) Then
		$twoPairs=$combinations[6]
		$highCard=$combinations[8]
		$twoPairs[4][0]=$highCard[0][0]
		$combinations[6]=$twoPairs
	EndIf
	If($combinations[7]<>0) Then
		$onePair=$combinations[7]
		$highCard=$combinations[8]
		$onePair[2][0]=$highCard[0][0]
		$combinations[7]=$onePair
	EndIf
	Return $combinations
EndFunc
