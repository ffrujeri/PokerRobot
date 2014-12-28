Dim $playerPosition6H[6][2] 
$playerPosition6H[0][0]=241
$playerPosition6H[0][1]=40
$playerPosition6H[1][0]=481
$playerPosition6H[1][1]=40
$playerPosition6H[2][0]=685
$playerPosition6H[2][1]=186
$playerPosition6H[3][0]=481
$playerPosition6H[3][1]=362
$playerPosition6H[4][0]=241
$playerPosition6H[4][1]=362
$playerPosition6H[5][0]=55
$playerPosition6H[5][1]=186

Dim $cardSymbol
$cardSymbol='../images/cards.bmp'

Dim $cardAreaSize[2]
$cardAreaSize[0]=8
$cardAreaSize[1]=10

Func playerSearch($topX, $topY)
	$x=0
	$y=0
	If(_imagesearcharea($cardSymbol,0,$topX,$topY,$topX+$cardAreaSize[0],$topY+$cardAreaSize[1],$x,$y,150)) Then
		Return True
	Else
		Return False	
	EndIf
EndFunc

Func getPlayer($refX, $refY, $position)
	Return playerSearch($refX+$playerPosition6H[$position][0], $refY+$playerPosition6H[$position][1])
EndFunc

Func players($refX, $refY)
	Dim $number[$TABLE_TYPE+1]=[False, False, False, False, False, False,0]
	$number[$TABLE_TYPE]=1
	for $i = 0 to $TABLE_TYPE-1
		If($i<>$MY_POSITION) Then
			$number[$i] = getPlayer($refX, $refY, $i)
			If ($number[$i]==True) Then
				$number[$TABLE_TYPE]=$number[$TABLE_TYPE]+1
			EndIf
		EndIf
	Next
	$number[$MY_POSITION]=True
	Return $number
EndFunc

Func playersToString($players)
	$strRes =""
	for $i = 0 to $TABLE_TYPE
		$strRes=$strRes & $players[$i] & " "
	Next
	Return $strRes
EndFunc