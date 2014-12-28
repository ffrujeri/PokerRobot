#include <Numbers.au3>

Dim $dollarPosition6H[8][2] 
$dollarPosition6H[0][0]=$playerPosition6H[0][0]+3
$dollarPosition6H[0][1]=$playerPosition6H[0][1]+50
$dollarPosition6H[1][0]=$playerPosition6H[1][0]+3
$dollarPosition6H[1][1]=$playerPosition6H[1][1]+50
$dollarPosition6H[2][0]=$playerPosition6H[2][0]+3
$dollarPosition6H[2][1]=$playerPosition6H[2][1]+50
$dollarPosition6H[3][0]=$playerPosition6H[3][0]+3 
$dollarPosition6H[3][1]=$playerPosition6H[3][1]+50
$dollarPosition6H[4][0]=$playerPosition6H[4][0]+3 
$dollarPosition6H[4][1]=$playerPosition6H[4][1]+50
$dollarPosition6H[5][0]=$playerPosition6H[5][0]+3  
$dollarPosition6H[5][1]=$playerPosition6H[0][1]+50

$dollarPosition6H[6][0]=386 ;pot dollar
$dollarPosition6H[6][1]=161 

$dollarPosition6H[7][0]=550 ;call dollar
$dollarPosition6H[7][1]=468 

Dim $dollarSymbol[6]
$dollarSymbol[0]='../images/dollarW.bmp'
$dollarSymbol[1]='../images/dollarG.bmp'
$dollarSymbol[2]='../images/dollarY.bmp'
$dollarSymbol[3]='../images/dollarB.bmp'
$dollarSymbol[4]='../images/dollarAllIn.bmp'
$dollarSymbol[5]='../images/dollarFold.bmp'

Dim $dollarAreaSize[2]
$dollarAreaSize[0]=110
$dollarAreaSize[1]=21

Dim $blindsPosition6H[2] 
$blindsPosition6H[0]=57
$blindsPosition6H[1]=31

Func stackAssemble($topX, $topY, $type, $color)	
	$stack=0
	$flag=0
	;MouseMove($topX,$topY)
	Do
		if($type==1) Then
			$topX=$topX+8
		ElseIf($type==2) Then
			$topX=$topX+7
		ElseIf($type==3) Then
			$topX=$topX+5
		EndIf
		;MouseMove($topX,$topY)
		$result=numberSearch($topX, $topY, $color)
		if($result==10) Then
			$stack = "allIn"
			$flag=2
		Else
			if($result==-1) Then			
				$flag=$flag+1
				if($type==1) Then
					$topX=$topX-4
				Else
					$topX=$topX-3
				EndIf
			Else
				$stack=$stack*10+$result
			EndIf			
		EndIf
	Until ($flag >=2)
	Return $stack
EndFunc

Func getStack($refX, $refY, $players, $stackNumber)
	Switch $stackNumber
	Case 0 To $MY_POSITION-1
		If($players[$stackNumber]==True) Then
			Return stackAssemble($refX+$dollarPosition6H[$stackNumber][0], $refY+$dollarPosition6H[$stackNumber][1], 1,2)
		Else
			Return 0
		EndIf
	Case $MY_POSITION
		Return stackAssemble($refX+$dollarPosition6H[$stackNumber][0], $refY+$dollarPosition6H[$stackNumber][1], 1,2)
	Case $MY_POSITION+1 To $TABLE_TYPE-1
		If ($players[$stackNumber]==True) Then
			Return stackAssemble($refX+$dollarPosition6H[$stackNumber][0], $refY+$dollarPosition6H[$stackNumber][1], 1,2)
		EndIf
	Case $TABLE_TYPE ;pot
		$x=0
		$y=0
		$potDollar = _imagesearcharea($dollarSymbol[0],0,$refX+$dollarPosition6H[$TABLE_TYPE][0],$refY+$dollarPosition6H[$TABLE_TYPE][1],$refX+$dollarPosition6H[$TABLE_TYPE][0]+50,$refY+$dollarPosition6H[$TABLE_TYPE][1]+50,$x,$y,150)
		return stackAssemble($x-1, $y-1, 2, 0)
	Case $TABLE_TYPE+1 ;fold
		$x=0
		$y=0
		if(_imagesearcharea($dollarSymbol[1],0,$refX+$dollarPosition6H[$TABLE_TYPE+1][0],$refY+$dollarPosition6H[$TABLE_TYPE+1][1],$refX+$dollarPosition6H[$TABLE_TYPE+1][0]+50,$refY+$dollarPosition6H[$TABLE_TYPE+1][1]+50,$x,$y,150)) Then
			Return stackAssemble($x-1, $y-1, 1, 1)
		Else
			Return 0
		EndIf
	Case $TABLE_TYPE+2 ; Call
		
	Case $TABLE_TYPE+3 ; Blinds
		Return stackAssemble($refX+$blindsPosition6H[0]-6,  $refY+$blindsPosition6H[1], 3, 4)
	EndSwitch
EndFunc

Func gameStacks($refX, $refY, $players)
	Dim $gameStacks[$TABLE_TYPE]
	for $i = 0 to $TABLE_TYPE-1
		$gameStacks[$i]=getStack($refX, $refY, $players, $i)
	Next
	Return $gameStacks
EndFunc
