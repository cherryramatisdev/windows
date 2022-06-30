#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir D:\\ ; Ensures the consistent starting directory.

; AutoHotkey code to swap middle and right buttons
$RButton::MButton
$MButton::RButton

Capslock::Ctrl
~Capslock Up::Send % "{Ctrl up}" (A_PriorKey = "Capslock" ? "{Esc}" : "")

Tab::LAlt
~Tab Up::Send % "{LAlt up}" (A_PriorKey = "Tab" ? "{Tab}" : "")

CreateNewNote() {
  InputBox, NoteTitle, Phone Number, Note title: , , 640, 480
  titleLen := strLen(NoteTitle)

  if (titleLen > 0)
    Run emacsclientw.exe -t -e "(notes/create-new \"%NoteTitle%\")"
}

^!Return::CreateNewNote()

FocusWindow() {
  WinActivate
  ; WinMaximize
}

ExecuteCmd(cmd) {
  Run %cmd%
  FocusWindow()
}

OpenWorkBrowser() {
  if WinExist("ahk_exe msedge.exe")
    FocusWindow()
  else
    ExecuteCmd("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
}


Numpad1::OpenWorkBrowser()
#1::OpenWorkBrowser()
RAlt & 1::OpenWorkBrowser()

OpenPersonalBrowser() {
  if WinExist("ahk_exe firefox.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\scoop\apps\firefox\current\firefox.exe")
}

; Numpad2::OpenPersonalBrowser()
; #2::OpenPersonalBrowser()
; RAlt & 2::OpenPersonalBrowser()

OpenEditor() {
  if WinExist("ahk_class Emacs")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\scoop\shims\runemacs.exe")
}

Numpad2::OpenEditor()
#2::OpenEditor()
RAlt & 2::OpenEditor()
Numpad3::OpenEditor()
#3::OpenEditor()
RAlt & 3::OpenEditor()

OpenSlack() {
  if WinExist("ahk_exe slack.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\slack\slack.exe")
}

Numpad4::OpenSlack()
#4::OpenSlack()
RAlt & 4::OpenSlack()

OpenFigma() {
  if WinExist("ahk_exe Figma.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\Figma\Figma.exe")
}

Numpad5::OpenFigma()
#5::OpenFigma()
RAlt & 5::OpenFigma()

OpenNoteTaking() {
  if WinExist("ahk_exe Mem.exe")
    FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\Programs\@mem-labsdesktop-client\Mem.exe")
}

Numpad6::OpenNoteTaking()
#6::OpenNoteTaking()
RAlt & 6::OpenNoteTaking()

OpenTerminal() {
  if WinExist("ahk_exe WindowsTerminal.exe") {
    FocusWindow()
    global insertMode = 1
  }
  else {
    ExecuteCmd("C:\Users\cherr\AppData\Local\Microsoft\WindowsApps\wt.exe")
    global insertMode = 1    
  }
}

Numpad7::OpenTerminal()
#7::OpenTerminal()
RAlt & 7::OpenTerminal()
#Return::OpenTerminal()

OpenDiscord() {
  if WinExist("ahk_exe Discord.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\Discord\app-1.0.9005\Discord.exe")
}

Numpad8::OpenDiscord()
#8::OpenDiscord()
RAlt & 8::OpenDiscord()

!Return::
WinGet, WinState, MinMax, A
if (WinState = 1)
{
  WinRestore, A
}
else
{
  WinMaximize, A
}
return

^q::
WinGetTitle, Title, A
WinKill, %Title%
return

^m::
WinGetTitle, Title, A
WinMinimize, %Title%
return

^F11::reload