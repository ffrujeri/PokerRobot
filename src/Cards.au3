Dim $cardsRank[13][2]
$cardsRank[0][0]='../images/asB.bmp'
$cardsRank[0][1]='../images/asR.bmp'
$cardsRank[1][0]='../images/twoB.bmp'
$cardsRank[1][1]='../images/twoR.bmp'
$cardsRank[2][0]='../images/threeB.bmp'
$cardsRank[2][1]='../images/threeR.bmp'
$cardsRank[3][0]='../images/fourB.bmp'
$cardsRank[3][1]='../images/fourR.bmp'
$cardsRank[4][0]='../images/fiveB.bmp'
$cardsRank[4][1]='../images/fiveR.bmp'
$cardsRank[5][0]='../images/sixB.bmp'
$cardsRank[5][1]='../images/sixR.bmp'
$cardsRank[6][0]='../images/sevenB.bmp'
$cardsRank[6][1]='../images/sevenR.bmp'
$cardsRank[7][0]='../images/eightB.bmp'
$cardsRank[7][1]='../images/eightR.bmp'
$cardsRank[8][0]='../images/nineB.bmp'
$cardsRank[8][1]='../images/nineR.bmp'
$cardsRank[9][0]='../images/tenB.bmp'
$cardsRank[9][1]='../images/tenR.bmp'
$cardsRank[10][0]='../images/jackB.bmp'
$cardsRank[10][1]='../images/jackR.bmp'
$cardsRank[11][0]='../images/queenB.bmp'
$cardsRank[11][1]='../images/queenR.bmp'
$cardsRank[12][0]='../images/kingB.bmp'
$cardsRank[12][1]='../images/kingR.bmp'

Dim $cardsSuit[4]
$cardsSuit[0]='../images/diamonds.bmp'
$cardsSuit[1]='../images/hearts.bmp'
$cardsSuit[2]='../images/clubs.bmp'
$cardsSuit[3]='../images/spades.bmp'

Dim $myCardsPosition[2][2]
$myCardsPosition[0][0]=$playerPosition6H[$MY_POSITION][0]-24
$myCardsPosition[0][1]=$playerPosition6H[$MY_POSITION][1]-17
$myCardsPosition[1][0]=$playerPosition6H[$MY_POSITION][0]+26
$myCardsPosition[1][1]=$playerPosition6H[$MY_POSITION][1]-17

Dim $boardCardsPosition[1][2]
$boardCardsPosition[0][0]=263
$boardCardsPosition[0][1]=175

Dim $rankAreaSize[2]
$rankAreaSize[0]=9
$rankAreaSize[1]=18

$suitAreaSize=13

Func cardSearch($topX, $topY)
	Dim $result[2]
	$result[0]=0
	$result[1]=0
	for $i = 0 to 12
		$x=0
		$y=0		
		If(_imagesearcharea($cardsRank[$i][0],0,$topX+4,$topY+3,$topX+4+$rankAreaSize[0],$topY+3+$rankAreaSize[1],$x,$y,200)) Then
			$result[0]=$i+1
			;MouseMove($x,$y,10)
		ElseIf(_imagesearcharea($cardsRank[$i][1],0,$topX+4,$topY+3,$topX+4+$rankAreaSize[0],$topY+3+$rankAreaSize[1],$x,$y,200)) Then
			$result[0]=$i+1
			;MouseMove($x,$y,10)
		EndIf
	Next
	for $i = 0 to 3
		$x=0
		$y=0
		if (_imagesearcharea($cardsSuit[$i],0,$topX+2,$topY+22,$topX+2+$suitAreaSize,$topY+22+$suitAreaSize,$x,$y,200)) Then
			$result[1]=$i+1
			;MouseMove($x,$y,10)
		EndIf
	Next
	Return $result
EndFunc

Func myCards($refX, $refY)
	Dim $myCards[2][2]
	Dim $result[2]
	for $i = 0 to 1
		$result=cardSearch($refX+$myCardsPosition[$i][0], $refY+$myCardsPosition[$i][1])
		$myCards[$i][0]=$result[0]
		$myCards[$i][1]=$result[1]
	Next
	Return $myCards
EndFunc

Func boardCards($refX, $refY)
	Dim $boardCards[5][2]
	Dim $result[2]
	for $i = 0 to 4
		$result=cardSearch($refX+$boardCardsPosition[0][0]+$i*54, $refY+$boardCardsPosition[0][1])
		$boardCards[$i][0]=$result[0]
		$boardCards[$i][1]=$result[1]
	Next
	Return $boardCards
EndFunc

Func cardsToString($cards)
	Dim $strRes = ""
	for $i = 0 to UBound($cards)-1
		Switch $cards[$i][0]
			Case 1
				$strRes=$strRes & "A"
			Case 2
				$strRes=$strRes & "2"
			Case 3
				$strRes=$strRes & "3"
			Case 4
				$strRes=$strRes & "4"
			Case 5
				$strRes=$strRes & "5"
			Case 6
				$strRes=$strRes & "6"
			Case 7
				$strRes=$strRes & "7"
			Case 8
				$strRes=$strRes & "8"
			Case 9
				$strRes=$strRes & "9"
			Case 10
				$strRes=$strRes & "10"
			Case 11
				$strRes=$strRes & "J"
			Case 12
				$strRes=$strRes & "Q"
			Case 13
				$strRes=$strRes & "K"
			Case 14
				$strRes=$strRes & "A"
		EndSwitch
	
		Switch $cards[$i][1]
			Case 1
				$strRes=$strRes & "d"
			Case 2
				$strRes=$strRes & "h"
			Case 3
				$strRes=$strRes & "c"
			Case 4
				$strRes=$strRes & "s"
		EndSwitch
	Next
	Return $strRes
EndFunc