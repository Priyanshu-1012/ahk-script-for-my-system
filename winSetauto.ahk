#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;this one is just to adjust all windows to not overlap with my rainmeter taskbar

Loop
{
    WinGetPos, X, Y,,, A
    if Y < 35
    {
        awh := WinExist("A")
        WinGet, windowState, MinMax, ahk_id %awh%
        if (windowState = 1) ; Maximized
        {
            
            WinRestore, ahk_id %awh%
        }

        WinMove, ahk_id %awh%, , , 35,,
    }
    Sleep, 1000 ; 
}
