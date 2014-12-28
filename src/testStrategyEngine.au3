#include <Misc.au3>
#include <ImageSearch.au3>
#include <string.au3>
#Include <Array.au3>
#include <Round.au3>
#include <Stacks.au3>
#include <Cards.au3>
#include <Players.au3>
#include <SitNGo6H.au3>
#include <Hands.au3>
#include <StrategyEngine.au3>

;Starting Strategy - pre-flop
$position = position(5)
ConsoleWrite(positionToString($position) & " ")

Dim $myCards[2][2]
$myCards[0][0]=1
$myCards[0][1]=2
$myCards[1][0]=12
$myCards[1][1]=2

$handScore = handScore($myCards)
ConsoleWrite($handScore & " ")

$raiseState=False
$decision = preFlop($myCards,$position, $raiseState)
ConsoleWrite(decisionToString($decision))