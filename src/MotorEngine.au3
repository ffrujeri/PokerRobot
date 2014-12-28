Func makeDecision($decision, $ref)
	Switch $decision
		Case 0 ; fold
			MouseClick("left", $ref[0]+$foldPosition[0]+Random(-50, 80, 1), $ref[1]+$foldPosition[1]+Random(-9, 20, 1), 1, 5)
		Case 1 ; check/call
			MouseClick($x, $y)
		Case 2 ; raise
			MouseClick($x, $y)
	EndSwitch
EndFunc