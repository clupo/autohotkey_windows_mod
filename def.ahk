#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 2
#IfWinActive Eclipse
::sop::
    Send, System.out.println({Right};
	Send, {Left 2}
Return
::soe::
    Send, System.err.println({Right};
	Send, {Left 2}
Return
::sof::
    Send, System.out.printf({Right};
	Send, {Left 2}
Return
#IfWinActive

::cl::console.log(
Return

^+!SPACE::  Winset, Alwaysontop, , A
Return