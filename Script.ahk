#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^Esc::WinClose, A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; Set desktop work area
; ; Get the working area coordinates for the primary monitor
; SysGet, monitorWorkArea, MonitorWorkArea

; ; Set the height of the work area to be 35 pixels less than the screen height
; workAreaHeight := monitorWorkArea.Bottom - monitorWorkArea.Top - 35

; ; Define a function to set the work area for a window
; SetWindowWorkArea(windowTitle)
; {
;   ; Get the window handle for the specified title
;   WinGet, windowHandle, ID, %windowTitle%
  
;   ; If the window is maximized, set the work area to the adjusted height
;   WinGet, windowState, MinMax, %windowTitle%
;   if (windowState = 1) {
;     DllCall("SystemParametersInfo", UInt, 0x2f, UInt, 0, UInt, 0, UInt, 0x1)
;     DllCall("SystemParametersInfo", UInt, 0x30, UInt, 0, UInt, 0, UInt, 0x1)
;     WinMove, ahk_id %windowHandle%, , monitorWorkArea.Left, monitorWorkArea.Top, monitorWorkArea.Right - monitorWorkArea.Left, workAreaHeight
;     DllCall("SystemParametersInfo", UInt, 0x2f, UInt, 0, UInt, 0, UInt, 0x2)
;     DllCall("SystemParametersInfo", UInt, 0x30, UInt, 0, UInt, 0, UInt, 0x2)
;   }
; }

; ; Example usage:
; SetTitleMatchMode, 2
; SetWindowWorkArea("My Window Title")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!t::Run ms-settings:taskbar

^Down::
WinMinimize, A
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set up a variable to keep track of the last minimized window
lastMinimized := ""

; Define a function to unminimize a given window
unminimize(hwnd) {
    WinGet, style, Style, ahk_id %hwnd%
    if (style & 0x20000000) {  ; If the window is minimized, unminimize it
        WinGet, exStyle, ExStyle, ahk_id %hwnd%
        if (exStyle & 0x00000001) {  ; If the window is iconic, restore it
            SendMessage, 0x0112, 0xF120, 0  ; WM_SYSCOMMAND SC_RESTORE
        } else {
            SendMessage, 0x0112, 0xF120, 1  ; WM_SYSCOMMAND SC_RESTORE
        }
        WinActivate, ahk_id %hwnd%
    }
}

; Define the hotkey
^Up::
    ; Get a list of all windows
    WinGet, windows, List

    ; Create a blank list for minimized windows
    minimizedWindows := []

    ; Loop through all windows and add minimized ones to the list
    Loop %windows%
    {
        hwnd := windows%A_Index%
        WinGet, style, Style, ahk_id %hwnd%
        if (style & 0x20000000) {
            minimizedWindows.Insert(hwnd)
        }
    }

    ; If there are no minimized windows, do nothing
    if (minimizedWindows.Length() = 0) {
        return
    }

    ; If the last minimized window is still minimized, unminimize it
    if (lastMinimized != "" && minimizedWindows.Find(lastMinimized) > 0) {
        unminimize(lastMinimized)
    }

    ; Otherwise, unminimize the most recently minimized window
    else {
        lastMinimized := minimizedWindows[1]
        unminimize(lastMinimized)
    }
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#z::
; Get the handle of the active window
awh := WinExist("A")
WinGet, windowState, MinMax, ahk_id %awh%
if (windowState = 1) ; Maximized
{
    ; Restore the window to its normal size and position
    WinRestore, ahk_id %awh%
    
}
; Use the handle to move the active window to the top-left corner of the screen
WinMove, ahk_id %awh%, , -5, 35,1928,1085
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




RAlt & Left::
    IfWinActive ahk_class CabinetWClass ; for Windows Explorer
    {
        Send {ALTDOWN}{Left}{ALTUP}
    }
    Else
    {
        Send {RAlt Down}{Left}{RAlt Up}
    }
    return



RAlt & Right::
IfWinActive ahk_class CabinetWClass ; for Windows Explorer
{
Send {ALTDOWN}{Right}{ALTUP}
}
Else
{
Send {RAlt Down}{Right}{RAlt Up}
}
return



^!c::Run "C:\ChatGPT - Shortcut.lnk"
^!m::Run "C:\Mail - Shortcut.lnk"
^!e::Run "C:\Users\priya\Documents\START_ESPANSO.bat - Shortcut.lnk"
^!b::Run "C:\Microsoft Edge - Shortcut.lnk"
^!s::Run "C:\Spotify - Shortcut.lnk"
^!l::Run "C:\Phone Link - Shortcut.lnk"
^!w::Run "C:\WhatsApp - Shortcut.lnk"
^!p::Run "C:\Prime Video for Windows - Shortcut.lnk"
^!r::Run "C:\OBS Studio (64bit) - Shortcut.lnk"
^!d::
Run explorer.exe shell:Downloads
return

^!o::
Run explorer.exe shell:Documents
return




#IfWinActive ahk_exe msedge.exe
^y::Run https://www.youtube.com
return

#IfWinActive ahk_exe msedge.exe
!a::Run https://animesuge.to/home
RAlt & i::Run https://www.linkedin.com/feed/
RAlt & m::Run https://mentorship.lfx.linuxfoundation.org/#projects_all
!1::Run https://mail.google.com/mail/u/0/#inbox
!2::Run https://mail.google.com/mail/u/2/#inbox
!4::Run https://mail.google.com/mail/u/1/#inbox
!g::Run https://github.com/Priyanshu-1012
!c::Run https://classroom.google.com/u/1/h
!r::Run https://www.reddit.com/
!d::Run https://drive.google.com/drive/u/1/my-drive
return

; #y::
; CoordMode, Mouse, Screen
; MouseClick, left, 440, 124
; return

#y::
Send, ^l
Send, https://www.youtube.com
Send, {Enter} 
Return


RAlt & l::
Click, 939, 994  
Return




!+e::
Run, explorer.exe "C:\Users\priya\Documents\Electronics"
return

!+s::Shutdown, 1
!+r::Shutdown, 2


RAlt::LAlt





SetTitleMatchMode, 2

#IfWinActive ahk_exe msedge.exe
RAlt & Up::
    Send ^{PgUp}
return

RAlt & Down::
    Send ^{PgDn}
return



SetTitleMatchMode, 2

#IfWinActive ahk_exe msedge.exe
!Up::
    Send ^{PgUp}
return

!Down::
    Send ^{PgDn}
return


SetTitleMatchMode,2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;open file in VSCode with Alt+V on selected file
#IfWinActive ahk_exe explorer.exe
!v::
    clipboard =
    SendInput, ^c
    ClipWait, 1
    If !ErrorLevel
    {
        path := Trim(Clipboard, "`r`n`0")
        If InStr(path, ":") = 2
        {
            Run,cmd.exe /c code "%path%"
        }
    }
Return
#IfWinActive

;;;;;;::::::::::::::::::::::;;;;;;
;Launch google meet in new window and copy the link to clipboard and then open wapp
^+m::
Run, msedge.exe -new-window https://meet.google.com/?authuser=0
WinWait, ahk_exe msedge.exe
Sleep, 5000
WinMaximize, A

Sleep, 50

Send, {Space}
Sleep, 500                                                                               
Send, {Down}
Sleep, 500
Send, {Space}
Sleep,9000

Loop, 20
{
    Send, {Tab}
    Sleep, 10
}

Send, {Space}

Run "C:\WhatsApp - Shortcut.lnk"

Return