global insertMode := 0
global visualMode := 0

DisplayModeText() {
  modeText := "Normal Mode"
  if (insertMode = 1) {
    modeText := "Insert Mode"
  } else if (visualMode = 1) {
    modeText := "Visual Mode"
  } else {
    modeText := "Normal Mode"
  }

  ToolTip, %modeText%, 0, 0
}

DisplayModeText()

#IfWinActive ahk_exe msedge.exe
^l::
  global insertMode = 1
  DisplayModeText()
  Send ^l
return

^t::
  global insertMode = 1
  DisplayModeText()
  Send ^t
return

,::
  global insertMode = 1
  DisplayModeText()
  Send {,}
return

Tab::
  if (insertMode = 1)
    Send {Tab}
  else
    Send ^{Tab}
return

+Tab::
  if (insertMode = 1)
    Send +{Tab}
  else
    Send ^+{Tab}
return

#IfWinNotActive ahk_class Emacs

Capslock::
  if (insertMode = 1) or (visualMode = 1) {
    global insertMode = 0
    global visualMode = 0
    DisplayModeText()
  }
  else
    Send {Esc}
return

2::
  if (insertMode = 1)
    Send {2}
  else {
    Send {Home}
    Send +{End}
    global visualMode = 1
  }
return

f::
  if (insertMode = 1)
    Send {f}
  else {
    global insertMode = 1
    DisplayModeText()
  }
return

t::
  if (insertMode = 1)
    Send {t}
  else {
    global visualMode = 1
    DisplayModeText()
  }
return

k::
  if (insertMode = 1)
    Send {k}
  else if (visualMode = 1)
    Send +{Down}
  else
    Send {Down}
return

j::
  if (insertMode = 1)
    Send {j}
  else if (visualMode = 1)
    Send +{Left}
  else
    Send {Left}
return

l::
  if (insertMode = 1)
    Send {l}
  else if (visualMode = 1)
    Send +{Right}
  else
    Send {Right}
return

i::
  if (insertMode = 1)
    Send {i}
  else if (visualMode = 1)
    Send +{Up}
  else
    Send {Up}
return

c::
  if (insertMode = 1)
    Send {c}
  else
    Send ^c
return

x::
  if (insertMode = 1)
    Send {x}
  else {x}
    Send ^x
    global insertMode = 1
    DisplayModeText()
  }
return

v::
  if (insertMode = 1)
    Send {v}
  else {
    Send ^v
    global visualMode = 0
    global normalMode = 1
    DisplayModeText()
  }
return

o::
  if (insertMode = 1)
    Send {o}
  else if (visualMode = 1)
    Send +^{Right}
  else
    Send ^{Right}
return

u::
  if (insertMode = 1)
    Send {u}
  else if (visualMode = 1)
    Send +^{Left}
  else
    Send ^{Left}
return

`;::
  if (insertMode = 1)
    Send {Text};
  else if (visualMode = 1)
    Send +{End}
  else
    Send {End}
return

h::
  if (insertMode = 1)
    Send {h}
  else if (visualMode = 1)
    Send +{Home}
  else
    Send {Home}
return

e::
  if (insertMode = 1)
    Send {e}
  else
    Send ^{Backspace}
return

d::
  if (insertMode = 1)
    Send {d}
  else
    Send {Backspace}
return

r::
  if (insertMode = 1)
    Send {r}
  else
    Send ^{Del}
return

a::
  if (insertMode = 1)
    Send {a}
  else {
    Send #s
    global insertMode = 1
    DisplayModeText()
  }
return

w::
  if (insertMode = 1)
    Send {w}
  else
    Send ^w
return

q::
  if (insertMode = 1)
    Send {q}
  else
    Send ^q
return

s::
  if (insertMode = 1)
    Send {s}
  else {
    if WinActive("ahk_exe slack.exe")
      Send +{Return}
    else
      Send {Return}
  }
return

p::
  if (insertMode = 1)
    Send {p}
  else {
    Send {Space}
  }
return
