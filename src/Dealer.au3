$dealerPin='../images/dealer.bmp'

Dim $dealerPosition6H[6][2]
$dealerPosition6H[0][0]=313 
$dealerPosition6H[0][1]=111
$dealerPosition6H[1][0]=554 
$dealerPosition6H[1][1]=111
$dealerPosition6H[2][0]=594 
$dealerPosition6H[2][1]=175
$dealerPosition6H[3][0]=554
$dealerPosition6H[3][1]=312
$dealerPosition6H[4][0]=313 
$dealerPosition6H[4][1]=312
$dealerPosition6H[5][0]=161  
$dealerPosition6H[5][1]=176
$dealerPinSize=36

Func dealerSearch($topX, $topY, $bottomX, $bottomY)
	$x=0
	$y=0
	Return (_imagesearcharea($dealerPin,0,$topX,$topY,$bottomX,$bottomY,$x,$y,200))
EndFunc

Func dealerPosition($refX, $refY)
	for $i = 0 to $TABLE_TYPE-1
		if (dealerSearch($refX+$dealerPosition6H[$i][0], $refY+$dealerPosition6H[$i][1],$refX+$dealerPosition6H[$i][0]+$dealerPinSize,$refY+$dealerPosition6H[$i][1]+$dealerPinSize)==1) Then
			Return $i
		EndIf
	Next
	Return -1
EndFunc

Func dealerToString($dealer)
	Return "" & $dealer
EndFunc
