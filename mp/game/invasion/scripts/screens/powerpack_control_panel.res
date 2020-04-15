powerpack_control_panel {
	ActivePanel {
		ControlName	"EditablePanel"
		fieldName	"ActivePanel"

		SocketReadout {
			ControlName	"Label"
			fieldName	"SocketReadout"
			xpos		10
			ypos		100
			wide		300
			tall		40
			visible		1
			enabled		1
		}
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
		label		"#INVASION_DISMANTLE"
		enabled		1
		xpos		10
		ypos		50
		wide		150
		tall		50
		command		"Dismantle"
	}

	DeterioratingPanel {
		ControlName	"EditablePanel"
		fieldName	"DeterioratingPanel"

		AssumeControlButton {
			ControlName "Button"
			fieldName	"AssumeControl"
			label		"#INVASION_ASSUME_CONTROL"
			visible		0
			xpos		160
			ypos 		50
			wide 		150
			tall		50
			command		"AssumeControl"
		}
	}

	DismantlingPanel {
		ControlName	"EditablePanel"
		fieldName	"DismantlingPanel"

		DismantleTime {
			ControlName "Label"
			fieldName	"DismantleTime"
			xpos		10
			ypos		100
			wide		300
			tall		40
			visible		1
			enabled		1
		}

		CancelDismantleButton {
			ControlName "Button"
			fieldName	"CancelDismantleButton"
			label		"#INVASION_CANCEL"
			visible		1
			enabled		1
			xpos		10
			ypos		50
			wide		150
			tall		50
			command		"CancelDismantle"
		}
	}
}
