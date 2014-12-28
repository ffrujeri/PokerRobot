$myCardsState=False
$boardCardsState=False
$dealerState=False
$playersState=False
Dim $stacksState[6] = [False, False, False, False, False, False]
Dim $blindsState=False

Func setMyCardsState($myCards, $state)
	If($myCards[0][0]<>0 AND $myCards[0][1]<>0 AND $state==True) Then
		$myCardsState=True
	Else
		$myCardsState=False
	EndIf	
EndFunc

Func getMyCardsState()
	Return $myCardsState
EndFunc

Func setBoardCardsState($state)
	$boardCardsState=$state
EndFunc

Func getboardCardsState()
	Return $boardCardsState
EndFunc

Func setDealerState($dealer, $state)
	If($dealer>=0 AND $dealer<=5 AND $state) Then
		$dealerState=True
	Else
		$dealerState=False
	EndIf
EndFunc

Func getDealerState()
	Return $dealerState
EndFunc

Func setStackState($stack, $state)
	$stacksState[$stack]=$state
EndFunc

Func getStackState($stack)
	Return $stacksState[$stack]
EndFunc

Func setBlindsState($state)
	Dim $blindsState=$state
EndFunc

Func getBlindsState()
	Return $blindsState
EndFunc

Func setPlayersState($state)
	$playersState=True
EndFunc

Func getPlayersState()
	Return $playersState
EndFunc