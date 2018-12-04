#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, 1:Color, ffffff
Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
WinSet, TransColor, ffffff
SetTimer,UpdateTime,250 ;Go to the updatetime sub every 1000ms


Gui, 1:Add, Picture, vpicPlayerHero w64 h-1 +BackgroundTrans, OverwatchHeroImages\Unknown.png
Gui, Add, Progress, w64 h16 cffa500 vplayerUltCharge

Gui, 1:Add, Picture, vpicAllyHero1 w64 h-1 +BackgroundTrans, OverwatchHeroImages\Unknown.png
Gui, Add, Progress, w64 h16 cffa500 vally1UltCharge

Gui, 1:Add, Picture, vpicAllyHero2 w64 h-1 +BackgroundTrans, OverwatchHeroImages\Unknown.png
Gui, Add, Progress, w64 h16 cffa500 vally2UltCharge

Gui, 1:Add, Picture, vpicAllyHero3 w64 h-1 +BackgroundTrans, OverwatchHeroImages\Unknown.png
Gui, Add, Progress, w64 h16 cffa500 vally3UltCharge

Gui, 1:Add, Picture, vpicAllyHero4 w64 h-1 +BackgroundTrans, OverwatchHeroImages\Unknown.png
Gui, Add, Progress, w64 h16 cffa500 vally4UltCharge

Gui, 1:Add, Picture, vpicAllyHero5 w64 h-1 +BackgroundTrans, OverwatchHeroImages\Unknown.png
Gui, Add, Progress, w64 h16 cffa500 vally5UltCharge

Gui, 1:Show, x0 y0 NoActivate
return



UpdateTime:
Array := []
ArrayCount = 0
Loop, read, OverPyLay.csv   ; This loop retrieves each line from the file, one at a time.
{
    Loop, parse, A_LoopReadLine, CSV
    {
    ArrayCount += 1  ; Keep track of how many items are in the array.
    Array.Push(A_LoopField) ; Append this line to the array.
    }
}
playerHero := Array[2]
allyHero1 := Array[3]
allyHero2 := Array[4]
allyHero3 := Array[5]
allyHero4 := Array[6]
allyHero5 := Array[7]
playerUltimateCharge := Array[9]
ally1UltimateCharge := Array[10]
ally2UltimateCharge := Array[11]
ally3UltimateCharge := Array[12]
ally4UltimateCharge := Array[13]
ally5UltimateCharge := Array[14]

Sleep, 25
GuiControl, , picPlayerHero, OverwatchHeroImages\%playerHero%.png
Sleep, 25
GuiControl, , picAllyHero1, OverwatchHeroImages\%allyHero1%.png
Sleep, 25
GuiControl, , picAllyHero2, OverwatchHeroImages\%allyHero2%.png
Sleep, 25
GuiControl, , picAllyHero3, OverwatchHeroImages\%allyHero3%.png
Sleep, 25
GuiControl, , picAllyHero4, OverwatchHeroImages\%allyHero4%.png
Sleep, 25
GuiControl, , picAllyHero5, OverwatchHeroImages\%allyHero5%.png
Sleep, 25
GuiControl, , playerUltCharge,%playerUltimateCharge%
Sleep, 25
GuiControl, , ally1UltCharge,%ally1UltimateCharge%
Sleep, 25
GuiControl, , ally2UltCharge,%ally2UltimateCharge%
Sleep, 25
GuiControl, , ally3UltCharge,%ally3UltimateCharge%
Sleep, 25
GuiControl, , ally4UltCharge,%ally4UltimateCharge%
Sleep, 25
GuiControl, , ally5UltCharge,%ally5UltimateCharge%
Sleep, 25

Return