CoordMode, Mouse, Screen

Sleep, 3000 ; wait for me to change the focus of the window after I click the .ahk script

loop 11313 {
clipboard =
;Sleep, 3000
Send, ^c
Sleep, 1000
clipboard = %clipboard%
FileAppend, %clipboard% `n, C:\Users\Christopher Lupo\Desktop\scv.txt
Click, 964, 254
Sleep, 3000
}