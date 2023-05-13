#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^Esc::WinClose, A                  ;ctrl+esc to close active window
#HotkeyModifierTimeout, 100
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!t::Run ms-settings:taskbar   
#HotkeyModifierTimeout, 100        ;Alt+t for taskbar settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Alt+shift+S/R for shutdown/restart
    
!+r:: 
    MsgBox, 4145, Restart Computer, Restarting computer in 5 seconds. Press Cancel to abort., 5

    IfMsgBox Cancel
        Return

     RunWait, shutdown.exe -r -t 0
Return


!+s::
Shutdown, 1
Return
 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
WinMove, ahk_id %awh%, , -5, 35,1928,1050
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
^y::Run https://www.youtube.com  
#HotkeyModifierTimeout, 100          ;youtube in new tab
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
Sleep,10
Send, https://www.youtube.com   ;youtube in same tab
Sleep,10
Send, {Enter} 
Return


RAlt & l::
Click, 939, 994  ;;;;like a vid
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
#IfWinActive ahk_exe explorer.exe
`::
Run, explorer.exe "C:\"
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
#IfWinActive ahk_exe msedge.exe
^`::

Click, 1649,880

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
!u::
sleep,500
send, {Alt}
sleep,100
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
#IfWinActive ahk_exe msedge.exe            ;a quick google search for selected text
^g::
 Send, ^c
Sleep, 50
 Run, https://www.google.com/search?q=%clipboard%
Return
#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
f1:: run notepad.exe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RAlt::LAlt
RAlt & LButton::

CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
WinGet, window_minmax, MinMax, ahk_id %window_id%

; Return if the window is maximized or minimized
if window_minmax <> 0
{
  return
}

CoordMode, Mouse, Screen
SetWinDelay, 0

loop
{
  if !GetKeyState("LButton", "P")
  {
    break
  }

  ; move the window based on cursor position
  MouseGetPos, cur_x, cur_y
  WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}

return
