#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^Esc::WinClose, A                  ;ctrl+esc to close active window

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!t::Run ms-settings:taskbar           ;Alt+t for taskbar settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^Down::
WinMinimize, A                   ;ctrl+down to minimize active window
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

lastMinimized := ""                   ;ctrl+up to UNminimize recently minimized window
                                      ;and open them in order to recently to first minimized
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


^Up::
 
    WinGet, windows, List

   
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
if (windowState = 1) ; Maximized                        ;making window fit to my taskbar
{
    ; Restore the window to its normal size and position
    WinRestore, ahk_id %awh%
    
}
; Use the handle to move the active window to the top-left corner of the screen
WinMove, ahk_id %awh%, , -5, 35,1928,1085
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^!d::
Run explorer.exe shell:Downloads
return

^!o::
Run explorer.exe shell:Documents
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


#IfWinActive ahk_exe msedge.exe
^y::Run https://www.youtube.com    ;youtube in new tab
return

#IfWinActive ahk_exe msedge.exe
RAlt & i::Run https://www.linkedin.com/feed/
!1::Run https://mail.google.com/mail/u/0/#inbox
!2::Run https://mail.google.com/mail/u/2/#inbox
!4::Run https://mail.google.com/mail/u/1/#inbox
!g::Run https://github.com/Priyanshu-1012
!c::Run https://classroom.google.com/u/1/h
!r::Run https://www.reddit.com/
!d::Run https://drive.google.com/drive/u/1/my-drive
return


#y::
Send, ^l
Send, https://www.youtube.com   ;youtube in same tab
Send, {Enter} 
Return


RAlt & l::
Click, 939, 994  ;;;;like a vid
Return



!+s::Shutdown, 1     ;Alt+shift+S/R for shutdown/restart
!+r::Shutdown, 2


RAlt::LAlt





SetTitleMatchMode, 2

#IfWinActive ahk_exe msedge.exe
RAlt & Up::
    Send ^{PgUp}
return                                        ;alt+up/down to switch tabs in edge

RAlt & Down::
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
            Sleep, 2000
            WinClose , cmd.exe
            Sleep, 2000
            awh := WinExist("A")
WinGet, windowState, MinMax, ahk_id %awh%
if (windowState = 1) ; Maximized                        ;making window fit to my taskbar
{
    ; Restore the window to its normal size and position
    WinRestore, ahk_id %awh%
    
}
; Use the handle to move the active window to the top-left corner of the screen
WinMove, ahk_id %awh%, , -5, 35,1928,1085
        }
    }
Return
#IfWinActive

;;;;;;::::::::::::::::::::::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^`::
 
Click, 1582,921

Sleep,500

Loop,5
{
Send,{Down}
Sleep,100
}

Sleep,500
Send,{Space}
Sleep,300

Loop,6
{
Send,{Up}
Sleep,100
}

Send,{Space}
sleep,10
click,826,1014
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_exe explorer.exe
+u::
send, {Alt}
sleep,10
loop,8
{
send, {Right}
sleep 10
}
send,{Enter}
sleep,1500
send,{Enter}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_exe explorer.exe
!s::
Loop,6
{
    Send, {Tab}
    Sleep, 10
}

Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
