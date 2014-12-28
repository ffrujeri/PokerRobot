#include <Misc.au3>
#include <ImageSearch.au3>
#include <string.au3>
#Include <Array.au3>
#include <Round.au3>
#include <Stacks.au3>
#include <Cards.au3>
#include <Players.au3>
#include <Decision.au3>
#include <SitNGo6H.au3>
#include <Hands2.au3>

;[OK] four of a kind
;Dim $myCards[2][2]=[[13,3],[13,4]]
;Dim $boardCards[5][2]=[[13,1],[12,2],[13,2],[11,4],[0,0]]

; [OK] full house
;Dim $myCards[2][2]=[[12,1],[12,3]]
;Dim $boardCards[5][2]=[[13,1],[12,2],[13,2],[11,4],[0,0]]

; [OK] flush
;Dim $myCards[2][2]=[[2,2],[11,2]]
;Dim $boardCards[5][2]=[[5,2],[12,2],[13,2],[11,4],[0,0]]

; [OK] straight
;Dim $myCards[2][2]=[[9,2],[10,1]]
;Dim $boardCards[5][2]=[[13,1],[12,1],[13,2],[11,1],[0,0]]

; [OK] three of a kind
;Dim $myCards[2][2]=[[2,2],[5,2]]
;Dim $boardCards[5][2]=[[5,1],[12,2],[5,3],[11,4],[0,0]]

; [OK] two pair
;Dim $myCards[2][2]=[[2,2],[5,2]]
;Dim $boardCards[5][2]=[[5,1],[12,2],[6,3],[2,4],[0,0]]

; [OK] one pair
;Dim $myCards[2][2]=[[2,2],[5,2]]
;Dim $boardCards[5][2]=[[5,1],[12,2],[6,3],[11,4],[0,0]]

; [OK] high card
Dim $myCards[2][2]=[[2,2],[5,2]]
Dim $boardCards[5][2]=[[8,1],[12,2],[9,3],[10,4],[0,0]]


_ArraySort($myCards, 0, 0, 0, 0)
;_ArraySort($boardCards, 0, 0, 0, 0)
$allCards=concatenateHand($myCards, $boardCards)
;_ArraySort($totalCards, 0, 0, 0, 1)

ConsoleWrite(cardsToString($allCards))
ConsoleWrite(@CRLF)

; testing sort

$cards=cardsSort($allCards)
for $i=1 to 14
	If($cards[$i][0]<>0) Then
		ConsoleWrite($i & "-")
		For $j=1 To 4
			If($cards[$i][$j]) Then
				ConsoleWrite($j & " ")
			EndIf
		Next
	EndIf
Next
ConsoleWrite(@CRLF)

$myHand = myHand($myCards, $boardCards)

Switch $myHand[0]
	case 0
		ConsoleWrite("Straight Flush \o/")
	case 1
		$fourOfAKind=$myHand[1]
		ConsoleWrite("Four of a kind " & $fourOfAKind[0] & " " & $fourOfAKind[1])
	case 2
		$fullHouse=$myHand[1]
		ConsoleWrite("Full house " & $fullHouse[0] & " " & $fullHouse[1])
	case 3
		$flush=$myHand[1]
		ConsoleWrite("Flush " & $flush[0] & " " & $flush[1])
	case 4
		ConsoleWrite("Straight " & $myHand[1])
	case 5
		$ThreeOfAKind=$myHand[1]
		ConsoleWrite("Three of a kind " & $ThreeOfAKind[0] & " " & $ThreeOfAKind[1])
	case 6
		$twoPairs=$myHand[1]
		ConsoleWrite("Two pairs " & $twoPairs[0] & " " & $twoPairs[1] & " " & $twoPairs[2])
	case 7
		$onePair=$myHand[1]
		ConsoleWrite("One pair " & $onePair[0] & " " & $onePair[1])
	case 8
		ConsoleWrite("High card " & $myHand[1])
EndSwitch
ConsoleWrite(@CRLF)


