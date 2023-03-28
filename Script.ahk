#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^Esc::WinClose, A

!t::Run ms-settings:taskbar


^!t::Click, 44, 553


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




#IfWinActive ahk_exe msedge.exe
^y::Run https://www.youtube.com
return

#IfWinActive ahk_exe msedge.exe
!a::Run https://animesuge.to/anime/one-piece-ov8
RAlt & i::Run https://www.linkedin.com/feed/
!1::Run https://mail.google.com/mail/u/0/#inbox
!2::Run https://mail.google.com/mail/u/2/#inbox
!4::Run https://mail.google.com/mail/u/1/#inbox
!g::Run https://github.com/Priyanshu-1012
!d::Run https://drive.google.com/drive/u/2/my-drive
return



RAlt & l::
Click, 869, 1025  
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

