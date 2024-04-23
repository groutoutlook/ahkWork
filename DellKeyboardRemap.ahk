#SingleInstance Force
#Requires AutoHotkey v2.0-a
; +Space::Send "_"



Numpad0::MenuKey()
NumpadIns::MenuKey()

MenuKey(){
 ReadKey := A_ThisHotKey
 duration := 1000
 ToolTip Format("{1} pressed `nThis will be displayed for {2}s",ReadKey,duration/1000)
 SetTimer () => ToolTip(), -duration
 Send "{AppsKey}"
}
