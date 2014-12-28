Dim $numbers[11][5]
$numbers[0][0]='../images/W0.bmp'
$numbers[0][1]='../images/G0.bmp'
$numbers[0][2]='../images/Y0.bmp'
$numbers[0][3]='../images/B0.bmp'
$numbers[0][4]='../images/Wb0.bmp'
$numbers[1][0]='../images/W1.bmp'
$numbers[1][1]='../images/G1.bmp'
$numbers[1][2]='../images/Y1.bmp'
$numbers[1][3]='../images/B1.bmp'
$numbers[1][4]='../images/Wb1.bmp'
$numbers[2][0]='../images/W2.bmp'
$numbers[2][1]='../images/G2.bmp'
$numbers[2][2]='../images/Y2.bmp'
$numbers[2][3]='../images/B2.bmp'
$numbers[2][4]='../images/Wb2.bmp'
$numbers[3][0]='../images/W3.bmp'
$numbers[3][1]='../images/G3.bmp'
$numbers[3][2]='../images/Y3.bmp'
$numbers[3][3]='../images/B3.bmp'
$numbers[3][4]='../images/Wb3.bmp'
$numbers[4][0]='../images/W4.bmp'
$numbers[4][1]='../images/G4.bmp'
$numbers[4][2]='../images/Y4.bmp'
$numbers[4][3]='../images/B4.bmp'
$numbers[4][4]='../images/Wb4.bmp'
$numbers[5][0]='../images/W5.bmp'
$numbers[5][1]='../images/G5.bmp'
$numbers[5][2]='../images/Y5.bmp'
$numbers[5][3]='../images/B5.bmp'
$numbers[5][4]='../images/Wb5.bmp'
$numbers[6][0]='../images/W6.bmp'
$numbers[6][1]='../images/G6.bmp'
$numbers[6][2]='../images/Y6.bmp'
$numbers[6][3]='../images/B6.bmp'
$numbers[6][4]='../images/Wb6.bmp'
$numbers[7][0]='../images/W7.bmp'
$numbers[7][1]='../images/G7.bmp'
$numbers[7][2]='../images/Y7.bmp'
$numbers[7][3]='../images/B7.bmp'
$numbers[7][4]='../images/Wb7.bmp'
$numbers[8][0]='../images/W8.bmp'
$numbers[8][1]='../images/G8.bmp'
$numbers[8][2]='../images/Y8.bmp'
$numbers[8][3]='../images/B8.bmp'
$numbers[8][4]='../images/Wb8.bmp'
$numbers[9][0]='../images/W9.bmp'
$numbers[9][1]='../images/G9.bmp'
$numbers[9][2]='../images/Y9.bmp'
$numbers[9][3]='../images/B9.bmp'
$numbers[9][4]='../images/Wb9.bmp'
$numbers[10][0]='../images/Wcomma.bmp'
$numbers[10][1]='../images/Gcomma.bmp'
$numbers[10][2]='../images/YallIn.bmp'
$numbers[10][3]='../images/Bcomma.bmp'
$numbers[10][4]='../images/Wcomma.bmp'

Dim $numberSize[2]
$numberSize[0]=8
$numberSize[1]=10

Func numberSearch($topX, $topY, $color)
	for $i = 0 to 10
		$x=0
		$y=0
		Switch $color
			Case 0
				If (_imagesearcharea($numbers[$i][0],0,$topX,$topY,$topX+$numberSize[0],$topY+$numberSize[1],$x,$y,100)) Then
					Return $i
				EndIf
			Case 1
				If (_imagesearcharea($numbers[$i][1],0,$topX,$topY,$topX+$numberSize[0],$topY+$numberSize[1],$x,$y,100)) Then
					Return $i
				EndIf
			Case 2
				If (_imagesearcharea($numbers[$i][2],0,$topX,$topY,$topX+$numberSize[0],$topY+$numberSize[1],$x,$y,100)) Then
					Return $i
				EndIf
			Case 3
				If (_imagesearcharea($numbers[$i][3],0,$topX,$topY,$topX+$numberSize[0],$topY+$numberSize[1],$x,$y,100)) Then
					Return $i
				EndIf
			Case 4
				If (_imagesearcharea($numbers[$i][4],0,$topX,$topY,$topX+$numberSize[0],$topY+$numberSize[1],$x,$y,100)) Then
					;MsgBox(1, "Aqui", $i)
					Return $i
				EndIf
		EndSwitch
	Next
	Return -1
EndFunc