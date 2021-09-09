hk(keyboard:=0, mouse:=0, message:="", timeout:=3) { 
   static AllKeys
   if !AllKeys {
      s := "||NumpadEnter|Home|End|PgUp|PgDn|Left|Right|Up|Down|Del|Ins|"
      Loop, 254
         k := GetKeyName(Format("VK{:0X}", A_Index))
       , s .= InStr(s, "|" k "|") ? "" : k "|"
      For k,v in {Control:"Ctrl",Escape:"Esc"}
         AllKeys := StrReplace(s, k, v)
      AllKeys := StrSplit(Trim(AllKeys, "|"), "|")
   }
   ;------------------
   For k,v in AllKeys {
      IsMouseButton := Instr(v, "Wheel") || Instr(v, "Button")
      Hotkey, *%v%, Block_Input, % (keyboard && !IsMouseButton) || (mouse && IsMouseButton) ? "On" : "Off"
   }
   if (message != "") {
      Progress, B1 M FS12 ZH0, %message%
      SetTimer, TimeoutTimer, % -timeout*1000
   }
   else
      Progress, Off
   Block_Input:
   Return
   TimeoutTimer:
   Progress, Off
   Return
}

#!F1::hk(1,1,"Keyboard keys and mouse buttons disabled!`nPress Alt+F2 to enable")   ; Disable all keyboard keys and mouse buttons

#!F2::hk(0,0,"Keyboard keys and mouse buttons restored!")         ; Enable all keyboard keys and mouse buttons

#!F3::hk(1,0,"Keyboard keys disabled!`nPress Alt+F2 to enable")   ; Disable all keyboard keys (but not mouse buttons)

#!F4::hk(0,1,"Mouse buttons disabled!`nPress Alt+F2 to enable")   ; Disable all mouse buttons (but not keyboard keys)
