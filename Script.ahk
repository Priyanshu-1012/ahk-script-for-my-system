#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^Esc::WinClose, A

!t::Run ms-settings:taskbar


SetTitleMatchMode, 2

#IfWinActive ahk_exe msedge.exe
!Up::
    Send ^{PgUp}
return

!Down::
    Send ^{PgDn}
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
  Run, explorer.exe "C:\Users\priya\Downloads"
return


#IfWinActive ahk_exe msedge.exe
^y::Run https://www.youtube.com
return



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

