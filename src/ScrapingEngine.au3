#include <GameState.au3>

Dim $foldPosition[2] 
$foldPosition[0]=388
$foldPosition[1]=468 

$foldSymbol='../images/fold.bmp'

Dim $foldAreaSize[2]
$foldAreaSize[0]=8
$foldAreaSize[1]=10

Func decisionTime($refX, $refY)
	$x=0
	$y=0
	If(_imagesearcharea($foldSymbol,0,$refX+$foldPosition[0],$refY+$foldPosition[1],$refX+$foldPosition[0]+$foldAreaSize[0],$refY+$foldPosition[1]+$foldAreaSize[1],$x,$y,100)) Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func decisionToString($decision)
	Enum $FOLD, $CALL, $RAISE
	Switch $decision
	Case $FOLD
		Return "FOLD"
	Case $CALL
		Return "CALL"
	Case $RAISE
		Return "RAISE"
	EndSwitch
EndFunc

Func scrapingEngine()	
	Dim $myCards[2][2]
	While (NOT _IsPressed("31", $dllKey))
		Sleep (500)
		$ref = setReference()
		$myCards = myCards($ref[0],$ref[1])
		setMyCardsState($myCards, True)
		If (getMyCardsState()) Then
			activeHand($myCards)
		EndIf
	WEnd
	Return
EndFunc

Func activeHand($myCards)
	$ref = setReference()
	$data = getData($myCards, $ref)
	dataToLog($data)
	$decision=strategyEngine($data)
	makedecision($decision, $ref)
	If($decision==0) Then
		setMyCardsState($myCards, False)
		setDealerState(0, False)
		setBlindsState(False)
	EndIf
	Return
EndFunc

Func getData($myCards,$ref)
	Dim $dealer
	Dim $boardCards[5][2]
	Dim $round
	Dim $players[$TABLE_TYPE+1]=[False, False, False, False, False, False,0]
	Dim $stacks[6]=[0,0,0,0,0,0]
	Dim $blinds[2]
	Dim $pot
	Dim $callCost
	ConsoleWrite("ActiveHand -> ")
	Do
		If(NOT getDealerState()) Then
			$dealer = dealerPosition($ref[0],$ref[1])
			setDealerState($dealer, True)
		EndIf
		If(NOT getBoardCardsState()) Then
			$boardCards= boardCards($ref[0],$ref[1])
			setBoardCardsState(True)
			$round= gameRound($boardCards)
		EndIf
		If(_IsPressed("31", $dllKey)) Then
			ExitLoop
		EndIf
		If(NOT getPlayersState()) Then
			$players= players($ref[0],$ref[1])
			setPlayersState(True)
		EndIf	
		If(NOT getStackState($MY_POSITION)) Then
			$stacks[$MY_POSITION]=getStack($ref[0],$ref[1], $players, $MY_POSITION)
			setStackState($MY_POSITION,True)
		EndIf	
		If(NOT getBlindsState()) Then
			$blinds[0] = getStack($ref[0],$ref[1],$players, $TABLE_TYPE+3)
			$blinds[1] = 2*$blinds[0]
			setBlindsState(True)
		EndIf
		#cs
		for $i=0 to 5
			If(NOT getStacksState($i)) Then
				$stacks[$i]=getStack($ref[0], $ref[1], $players, $i)
			EndIf
			If(timeToBet($ref[0], $ref[1])) Then
				ExitLoop
			EndIf
		Next
		#ce
	Until(decisionTime($ref[0], $ref[1]) OR _IsPressed("31", $dllKey))
	ConsoleWrite("Decision -> ")
	setBoardCardsState(False)
	setPlayersState(False)
	setStackState($MY_POSITION, False)
	If(_IsPressed("31", $dllKey)) Then
		Return
	EndIf
	#cs
	for $i=0 to 5
		If(NOT getStacksState($i)) Then
			$stacks[$i]=getStack($ref[0], $ref[1], $players, $i)
		EndIf
	Next
	#ce
	$pot=getStack($ref[0],$ref[1], $players, $TABLE_TYPE)
	$callCost=getStack($ref[0],$ref[1], $players, $TABLE_TYPE+1)
	$raiseState=0
	Dim $data[10]=[$myCards, $dealer, $players, $boardCards, $round, $blinds, $raiseState, $pot, $stacks, $callCost]
	Return $data
EndFunc


