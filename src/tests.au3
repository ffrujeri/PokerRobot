Func teste($array2)
	$aux=$array2[1]
	ConsoleWrite("Aqui" & $aux[0])
EndFunc

$var1 = 3
Dim $var2[2] = [1,2]

Dim $array[2]=[$var1, $var2]
ConsoleWrite($array[0] & @CRLF)
ConsoleWrite($array[1] & @CRLF)
Dim $aux[2]
$aux=$array[1]
ConsoleWrite($aux[0])

teste($array)



#cs

$position=dealerPosition($ref[0],$ref[1])
	;MsgBox(0,'Info',$position)


$teste = players($ref[0], $ref[1])
MsgBox(0,'Info',  $teste[6])




for $i = 0 to 6
	MouseMove($ref[0]+$dollarPosition6H[$i][0],$ref[1]+$dollarPosition6H[$i][1],10)
Next




Dim $dollar[2]
$flagDollar = _imagesearcharea($dollarSymbol[1],0,$ref[0]+$dollarPosition6H[3][0],$ref[1]+$dollarPosition6H[3][1],$ref[0]+$dollarPosition6H[3][0]+$dollarAreaSize[0],$ref[1]+$dollarPosition6H[5][1]+$dollarAreaSize[1],$dollar[0],$dollar[1],200)

MouseMove($dollar[0],$dollar[1])

$result=stackAssemble($dollar[0], $dollar[1])
MsgBox(0,'Info',  $result)




for $i=0 to $TABLE_TYPE
	if($result[$i]>0) Then
		ConsoleWrite($result[$i])
		ConsoleWrite(".")
	EndIf
Next
#ce

#cs
MsgBox(0,'Info',  $result)


$boardCards = boardCards($ref[0], $ref[1])
$round = gameRound($boardCards)
MsgBox(0,'Info',$round)


	MsgBox(0,'Info',$boardCards[0][0])
	MsgBox(0,'Info',$boardCards[0][1])
	MsgBox(0,'Info',$boardCards[1][0])
	MsgBox(0,'Info',$boardCards[1][1])
	MsgBox(0,'Info',$boardCards[2][0])
	MsgBox(0,'Info',$boardCards[2][1])
	MsgBox(0,'Info',$boardCards[3][0])
	MsgBox(0,'Info',$boardCards[3][1])
	MsgBox(0,'Info',$boardCards[4][0])
	MsgBox(0,'Info',$boardCards[4][1])
	

$res = _imagesearcharea('empty.bmp',0,460, 151,561,241,$x,$y,100)
MouseMove($x,$y,10)
$res = _imagesearcharea('clubs.bmp',0,486, 281,556,367,$x,$y,100)
MouseMove($x,$y,10)
$res = _imagesearcharea('diamonds.bmp',0,542, 282,604,365,$x,$y,100)
MouseMove($x,$y,10)
$res = _imagesearcharea('hearts.bmp',0,441, 454,502,510,$x,$y,100)
MouseMove($x,$y,10)
$res = _imagesearcharea('spades.bmp',0,498,454,552,508,$x,$y,100)
MouseMove($x,$y,10)


$x=395
$y=384
$res = _imagesearcharea('kingR.bmp',1,172, 358, 285, 426,$x,$y,200)
MouseMove($x,$y,10)
$resposta = playerSearch(335, 149, 449, 256)
MsgBox(0,'Info',$resposta)
#ce
