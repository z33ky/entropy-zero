"buffstation_control_panel.res"
{
	Background
	{
		ControlName		"MaterialImage"
		fieldName		"Background"
		xpos			0
		ypos			0
		zpos			-2
		wide			640
		tall			480
		material		"vgui/screens/vgui_bg"
	}

	SocketReadout
	{
		ControlName		"Label"
		fieldName		"SocketReadout"
		font			"Default"
		xpos			"10"
		ypos			"10"
		wide			"390"
		tall			"30"
		autoResize		"0"
		pinCorner		"0"
		visible			"1"
		enabled			"1"
		labelText		"1"
		textAlignment	"Left"
		dulltext		"0"
		brighttext		"0"
		paintbackground	"0"
	}
	
	ConnectButton
	{
		ControlName		BitmapButton
		fieldName		"ConnectButton"
	}
}
