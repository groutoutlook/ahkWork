#Requires AutoHotkey v2.0
#SingleInstance Force
SetTitleMatchMode 2
; CoordMode Mouse, Screen

; #F11::
global PID := 16660
DetectHiddenWindows 1

; WinActivate "ahk_exe UV4.exe"
sleep 1000
~Ctrl::counter := 10


F12:: FeedKeys()
FeedKeys()
{
	global
	while (1){
		If GetKeyState("Ins") 
			break
		sleep 1000
		ControlSend "{F8}", ,"ahk_exe UV4.exe"
		; while WinExist("ahk_class #32770"){
			; sleep 1000
			;ControlSend "{Enter}", , "ahk_class #32770"
			Send "{Enter}"
			sleep 1000
			Send "{Enter}"
			
			; ControlSend "{Enter}", , "ahk_class #32770"
		}
		
	; }
}
; return







; Run "Notepad",, "Min", &PID  ; Run Notepad minimized.
; WinWait "ahk_pid " PID  ; Wait for it to appear.



; ControlSend "{Enter}{Enter}", "ahk_exe UV4.exe"

; ControlSend "This is a line of text in the notepad window.{Enter}", "Edit1"
; ControlSendText "Notice that {Enter} is not sent as an Enter keystroke with ControlSendText.", "Edit1"

; Msgbox "Press OK to activate the window to see the result."
; WinActivate "ahk_pid " PID  ; Show the result.
