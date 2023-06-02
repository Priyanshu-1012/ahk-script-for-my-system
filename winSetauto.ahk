Loop
{
    WinGetPos, X, Y,,, A
    
    ; Get the process name of the active window
    WinGet, activeProcess, ProcessName, A
    
    ; Check if the active window is Rainmeter or PowerToys.PowerOCR and exclude them
    If (activeProcess = "Rainmeter.exe") || (activeProcess = "PowerToys.PowerOCR.exe")
    {
        continue  ; Skip the rest of the loop if Rainmeter or PowerToys.PowerOCR is active
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
