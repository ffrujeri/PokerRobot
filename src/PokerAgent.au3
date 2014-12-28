$logo ='../images/logo.bmp'

;CONSTANTS
Dim Const $TABLE_TYPE=6
Dim Const $MY_POSITION=4

#include <Misc.au3>
#include <ImageSearch.au3>
#include <string.au3>
#include <Array.au3>
#include <ScrapingEngine.au3>
#include <StrategyEngine.au3>
#include <MotorEngine.au3>
#include <Round.au3>
#include <Dealer.au3>
#include <Players.au3>
#include <Stacks.au3>
#include <Cards.au3>
#include <Hands.au3>
#include <HandLogs.au3>

Func setReference()
	Dim $ref[2]
	$res = _imagesearcharea($logo,0,0,0,500,500,$ref[0],$ref[1],100)
	;MouseMove($ref[0], $ref[1],5)
	Return $ref
EndFunc

;TODO 5 red, numbers blue
$file = FileOpen("test.txt", 1)
$dllKey = DllOpen("user32.dll")
ConsoleWrite(@CRLF & "SitNGo6H -> ")
scrapingEngine()
FileClose($file)
DllClose($dllKey)