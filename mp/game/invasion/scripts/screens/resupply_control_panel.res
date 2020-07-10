powerpack_control_panel {
	ObjectName {
		ControlName "Label"
		fieldName	"ObjectName"
		label		"Resupply Station"
		xpos		48
		ypos		32
		wide 		300
		tall		50
	}

	OwnerReadout {
		ControlName "Label"
		fieldName	"OwnerReadout"
		xpos		48
		ypos		75
		wide 		300
		tall		50
	}
	
	HealthReadout {
		ControlName "Label"
		fieldName	"HealthReadout"
		xpos		48
		ypos		118
		wide		300
		tall		50
	}

	ActivePanel {
		ControlName	"EditablePanel"
		fieldName	"ActivePanel"
		enabled		1
		visible		1
		wide		640
		tall		480
		xpos		0
		ypos		0

		DismantleButton {
			ControlName "Button"
			fieldName	"DismantleButton"
			label		"#INVASION_DISMANTLE"
			enabled		1
			visible		1
			xpos		432
			ypos		37
			wide		160
			tall		64
			command		"Dismantle"
		}
		
		BuyAmmoButton {
			ControlName "Button"
			fieldName	"BuyAmmoButton"
			label		"#INVASION_BUY_AMMO"
			enabled		0
			visible		1
			xpos		48
			ypos		192
			wide		160
			tall		64
			command		"BuyAmmo"
		}

		BuyHealthButton {
			ControlName "Button"
			fieldName	"BuyHealthButton"
			label		"#INVASION_BUY_HEALTH"
			enabled		0
			visible		1
			xpos		240
			ypos		192
			wide		160
			tall		64
			command		"BuyHealth"
		}

		BuyGrenadesButton {
			ControlName "Button"
			fieldName	"BuyGrenadesButton"
			label		"#INVASION_BUY_GRENADES"
			enabled		0
			visible		1
			xpos		432
			ypos		192
			wide		160
			tall		64
			command		"BuyGrenades"
		}

		BuyAllButton {
			ControlName "Button"
			fieldName	"BuyAllButton"
			label		"#INVASION_BUY_ALL"
			enabled		0
			visible		1
			xpos		240
			ypos		288
			wide		160
			tall		64
			command		"BuyAll"
		}
	}

	DeterioratingPanel {
		ControlName	"EditablePanel"
		fieldName	"DeterioratingPanel"

		AssumeControlButton {
			ControlName "Button"
			fieldName	"AssumeControl"
			label		"#INVASION_ASSUME_CONTROL"
			visible		1
			enabled		1
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
