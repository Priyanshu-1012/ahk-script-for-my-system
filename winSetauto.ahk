#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;this one is just to adjust all windows to not overlap with my rainmeter taskbar

Loop
{
    WinGetPos, X, Y,,, A
    
    ; Check if the active window is Rainmeter and exclude it
    IfWinExist, ahk_exe Rainmeter.exe
    {
        IfWinActive, ahk_exe Rainmeter.exe
            continue  ; Skip the rest of the loop if Rainmeter is active
    }

    ; Check if the active window is below 33 pixels in the y-direction
    If Y < 33
    {
        awh := WinExist("A")
        WinGet, windowState, MinMax, ahk_id %awh%
        
        ; Restore the window if it is maximized
        If (windowState = 1)
            WinRestore, ahk_id %awh%
        
        ; Move the window to 33 pixels from the top
        WinMove, ahk_id %awh%, , , 33,,
    }

    Sleep, 10000 ; Delay between each loop iteration
}
