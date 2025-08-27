; Snap Tap logic for A and D only as it is usually only used on them keys (reminder not fully updated to realistic snaptap_
; Last pressed key is held, opposite is released
; this is probably undetected as it doesnt interfere with game memory at all (except valve secured servers idk)

#InstallKeybdHook
#Persistent

; Track current key for the first logic
currentKey := ""

$a::
    if (currentKey != "a") {
        if (currentKey = "d")
            SendInput {d up} ; release D if it was active
        SendInput {a down}
        currentKey := "a"
    }
return

$d::
    if (currentKey != "d") {
        if (currentKey = "a")
            SendInput {a up} ; release A if it was active
        SendInput {d down}
        currentKey := "d"
    }
return
; releasing keys (A and D)
$a up::
    if (currentKey = "a") {
        SendInput {a up}
        currentKey := ""
    }
return

$d up::
    if (currentKey = "d") {
        SendInput {d up}
        currentKey := ""
    }
return
