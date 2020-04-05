powerpack_control_panel {
	CPowerPackControlPanel {
		ControlName	"CPowerPackControlPanel"
		fieldName	"CPowerPackControlPanel"
		xpos		0
		ypos		0
		wide		400
		tall		400
		visible		1
		enabled		1
	}

	SocketReadout {
		ControlName	"Label"
		fieldName	"SocketReadout"
		xpos		10
		ypos		100
		wide		300
		tall		40
		visible		0
	}

	HealthReadout {
		ControlName "Label"
		fieldName	"HealthReadout"
		xpos		10
		ypos		10
		wide		300
		tall		40
	}

	OwnerReadout {
		ControlName "Label"
		fieldName	"OwnerReadout"
		xpos		180
		ypos		10
		wide 		300
		tall		40
	}

	DismantleButton {
		ControlName "Button"
		fieldName	"DismantleButton"
		enabled		1
		xpos		10
		ypos		50
		wide		150
		tall		50
		command		"Dismantle"
	}

	AssumeControlButton {
		ControlName "Button"
		fieldName	"AssumeControl"
		visible		1
		enabled		1
		xpos		160
		ypos 		50
		wide 		150
		tall		50
		label		"#INVASION_BUTTON_ASSUME_CONTROL"
	}

	DismantleTime {
		ControlName "Label"
		fieldName	"DismantleTime"
		xpos		10
		ypos		100
		wide		300
		tall		40
		visible		1
	}
}
