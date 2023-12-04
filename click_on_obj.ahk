#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen


global grid_unit = 16

global small_unit = 4


global xpos := 0
global ypos := 0
Global mycount := 0
global direction := 2
global current_ind := 0




F12:: ClickRename()
ClickRename(){
	global
	; static mycount := 588
	; MouseMove 1744, 448
	MouseGetPos, xpos, ypos
	; MsgBox "The cursor is at X" %xpos% " Y" %ypos%
	; MouseClick, Left, 1693, 845,0
	MouseClick, Left, 1693, 845,,0

	Send ^a
	Send LED_
	Send % mycount
	Send {Enter}
	; ControlSend "kk","Blender"
	ClickNext()
	compareInd()
	mycount += 1
}


compareInd(){
	global
	MouseClick, Right, %xpos%, %ypos%,,0
	MouseClick,  Left, 1693, 845,,0
	Send ^a
	Send ^c
	tempind := Trim(clipboard,"LED_") as integer
	while(tempind == mycount){
                If GetKeyState("Esc")
                        break
		MoveSlightly()
		MouseClick, Right, %xpos%, %ypos%,,0
		MouseClick,  Left, 1693, 845,,0
		Send ^a
		Send ^c
		Send {Enter}
		tempind := Trim(clipboard,"LED_") as integer
	}
	MouseClick, Right, %xpos%, %ypos%,,0
	; MsgBox clip is %tempind%

}

MoveSlightly(){
	global
	; static direction := 2
	switch direction
	{
	case 1: 
		xpos -= small_unit 
		ypos += small_unit
	case 2: 
		; xpos -= 17
		ypos += small_unit
	case 3: 
		xpos += small_unit
		ypos += small_unit
	case 4: 
		xpos -= small_unit
		; ypos += 17
	case 6:
		xpos += small_unit
		
	case 7: 
		xpos -= small_unit
		ypos -= small_unit
	case 8: 
		; xpos -= small_unit
		ypos -= small_unit
	case 9: 
		xpos += small_unit
		ypos -= small_unit
	}

}

F11:: ClickNext()

ClickNext(){
	global
	; static direction := 2
	switch direction
	{
	case 1: 
		xpos -= grid_unit 
		ypos += grid_unit
	case 2: 
		; xpos -= 17
		ypos += grid_unit
	case 3: 
		xpos += grid_unit
		ypos += grid_unit
	case 4: 
		xpos -= grid_unit
		; ypos += 17
	case 6:
		xpos += grid_unit
		
	case 7: 
		xpos -= grid_unit
		ypos -= grid_unit
	case 8: 
		; xpos -= grid_unit
		ypos -= grid_unit
	case 9: 
		xpos += grid_unit
		ypos -= grid_unit

	}
}

F10:: ChangeDirection()

ChangeDirection(){
	global
	direction += 1
	if (direction > 9) {
		direction := 1
	}
	
	MsgBox "dir = %direction%."
}

^F10:: UpdateDirection()

UpdateDirection(){
	global
	InputBox, UserInput, direct, Please enter direction., , 320, 240
	if ErrorLevel
	    MsgBox "You entered '" %UserInput% "' but then cancelled."
	else{
		MsgBox "dir = %UserInput%"
		direction := UserInput

	}
}

+F12:: updateInd()

updateInd(){
	global
	
	; IB := InputBox("Update index", "mycount", "w640 h480")
	InputBox, UserInput, Phone Number, Please enter a phone number., , 640, 480
	if ErrorLevel
	    MsgBox "You entered '" %UserInput% "' but then cancelled."
	else{
		MsgBox "ind = %UserInput%"
		mycount := UserInput
	}
	; MsgBox "ind = %current_ind%." 

	; current_ind += 1
}

^F12:: getInd()

getInd(){
	global
	MsgBox "ind = %mycount%." 

	; current_ind += 1
}


^+F12:: loopRename()

loopRename(){
	global
	MsgBox "loop."
	updateInd()
	updateDirection()
	while(1){
                If GetKeyState("Esc")
                        break
		ClickRename()
	}
	

}


