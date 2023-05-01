#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^Esc::WinClose, A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


!t::Run ms-settings:taskbar

^Down::
WinMinimize, A
return


^!t::Click, 1, 553


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
!c::Run https://classroom.google.com/u/2/h
!r::Run https://www.reddit.com/
!d::Run https://drive.google.com/drive/u/2/my-drive
return

#y::
CoordMode, Mouse, Screen
MouseClick, left, 440, 124
return


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

;;