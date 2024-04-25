#SingleInstance Force
#Requires AutoHotkey v2.0-a
; +Space::Send "_"



Numpad0::MenuKey()
NumpadIns::MenuKey()

; NumpadDot::WinKey()
; NumpadDel::WinKey()

MenuKey(){
 ; Input handling 
 ReadKey := A_ThisHotKey
 
 ; Tooltip info
 duration := 1000
 ToolTip Format("{1} pressed `nThis will be displayed for {2}s",ReadKey,duration/1000)
 SetTimer () => ToolTip(), -duration

 Send "{AppsKey}"
}


; WinKey(){
;  ReadKey := A_ThisHotKey
;  Position := "1"
;
; ; Checkout obsidian://advanced-uri?vault=Vault_2401&filepath=310000_Syntax%2520in%2520ahk.md&block=xjvoqg
;  PositionEvent := InputHook("L1 M")
;  PositionEvent.Start()
;  PositionEvent.Wait()
;  Position := PositionEvent.Input
;  
;  Send "{RWin down}{" Position "down}"
;  Sleep 200
;  Send "{RWin up}{" Position "up}"
;  
; }
