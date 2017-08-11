; http://irisclasson.com/2015/02/17/horizontal-scroll-in-visual-studio-or-other-programs-with-autohotkey/
~Shift & WheelUp::
scroll(0)
return

~Shift & WheelDown::
scroll(1)
return

scroll(direction)
{
	SetTitleMatchMode, 2
	ControlGetFocus, fcontrol, Visual Studio
	Loop 40
	SendMessage, 0x114, %direction%, 0, %fcontrol%, Visual Studio
}

^d::Send, !d
return

; toggle my communication virtual window. s stands for slack
Capslock & s::
Toggle := !Toggle
If Toggle
Send #^{Right}
else
Send #^{Left}
Return

;; Activate Favorite Applications with a Keystroke
; ToggleWinMinimize(TheWindowTitle)
; {
	; SetTitleMatchMode,2
	; DetectHiddenWindows, Off
	; IfWinActive, %TheWindowTitle%
	; {
		; Send, !#{RightArrow}
	; }
	; Else
	; {
		; IfWinExist, %TheWindowTitle%
		; {
			; WinGet, winid, ID, %TheWindowTitle%
			; DllCall("SwitchToThisWindow", "UInt", winid, "UInt", 1)
		; }
	; }
	; Return
; } Capslock & s::ToggleWinMinimize("Slack") Return

; search google/duckduck from any app
^+s::
{
	Send, ^c
	Sleep 50
	Run, https://duckduckgo.com/?q=%clipboard%
	Return
}
^+!::
{
	Send, ^c
	Sleep 50
	Run, https://duckduckgo.com/?q=%clipboard%+!
	Return
}


; Move a window by hold alt and dragging from any location
; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com
Alt & LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return


!k::Send, ^k
return

!+,::Send, ^+,
return

^+SPACE::  Winset, Alwaysontop, , A

!Space::Send, ^{space}
return

!q::Send, ^q
return

!r::Send, ^r
return

!+c::Send, ^+c
return

::chr::chrisblupo@gmail.com
return

::lu::Lupo
return

::chri::Christopher
return

::cl::clupo@centeredgesoftware.com
return

!-::Send, ^-
return

!=::Send, ^=
return

!Backspace::Send, ^{Backspace}
return

!h::Send, ^h
return

!f::Send, ^f
return

!v::Send, ^v
return

!c::Send, ^c
return

!x::Send, ^x
return

!+v::Send, ^+v
return

!t::Send, ^t
return

!n::Send, ^n
return

!a::Send, ^a
return

!z::Send, ^z
return

!s::Send, ^s
return

!w::Send, ^w
return

!y::Send, ^y
return

!u::Send, ^u
return

!i::Send, ^i
return

!b::Send, ^b
return

!o::Send, ^o
return

!l::Send, ^l
return

!p::Send, ^p
return








; ; ---------------------------------------------------------------
; ; ---------------------------------------------------------------
; ; ---------------------------------------------------------------
; ; virutal desktop manager
; ; https://github.com/jpginc/windows10DesktopManager
; ; https://autohotkey.com/boards/viewtopic.php?t=9224
; ; ---------------------------------------------------------------
; ; ---------------------------------------------------------------
; ; ---------------------------------------------------------------
; #SingleInstance
; if(! A_IsAdmin)
; {
    ;; dll calls window movers will not work without admin
    ; Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
    ; ExitApp
; }
 ; /*
  ; * Alternatively you can use the hotkeyManager to set the hotkeys after the JPGIncDesktopManagerClass has been
  ; * constructed like this
  ; */
; globalDesktopManager := new JPGIncDesktopManagerClass()
; globalDesktopManager.setGoToDesktop("Capslock")
    ; .setMoveWindowToDesktop("+#")
    ; .afterGoToDesktop("turnCapslockOff")
    ; .afterMoveWindowToDesktop("turnCapslockOff")
    ; .setGoToNextDesktop("Capslock & w")
    ; .setGoToPreviousDesktop("Capslock & q")
    ; .setMoveWindowToNextDesktop("Capslock & s")
    ; .setMoveWindowToPreviousDesktop("Capslock & a")
    ; ~ .followToDesktopAfterMovingWindow(true)
	; ~ .setCloseDesktop("Capslock & x")
	; ~ .setNewDesktop("Capslock & n")

; return

; #c::ExitApp

; #Include desktopManager.ahk
; #Include desktopChanger.ahk
; #Include windowMover.ahk
; #Include desktopMapper.ahk
; #include virtualDesktopManager.ahk
; #Include monitorMapper.ahk
; #Include commonFunctions.ahk
; #Include dllWindowMover.ahk
