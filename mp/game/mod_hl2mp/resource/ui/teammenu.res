TeamMenu
{
	team
	{
		ControlName				CFortressTeamMenu
		fieldName				team
		xpos					c-160
		ypos					c-120
		wide					320
		tall					240
		autoResize				0
		pinCorner				0
		visible					1
		enabled					1
		tabPosition				0
	}
	
	HeaderLabel
	{
		ControlName		Label
		fieldName		HeaderLabel
		xpos			0
		ypos			4
		wide			320
		tall			24
		visible			1
		enabled			1
		font			HudHintTextLarge
		labelText		"#FORTRESS_TEAMHEADER"
		textAlignment	center
	}

	MapInfo
	{
		ControlName		RichText
		fieldName		MapInfo
		xpos			0
		ypos			0
		wide			0
		tall			0
		visible			0
		enabled			0
	}
	
	TeamInfo
	{
		ControlName		RichText
		fieldName		TeamInfo
		xpos			120
		ypos			155
		wide			190
		tall			55
		visible			1
		enabled			1
		scrollbar		0
		text			"#FORTRESS_TEAMHUMANINFO"
	}
	
	AlienButton
	{
		ControlName		Button
		fieldName		AlienButton
		xpos			10
		ypos			80
		wide			100
		tall			40
		labelText		"#FORTRESS_ALIENS"
		
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"		
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"6"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
		"use_proportional_insets"		"0"
		"command"		"changeteam 3"
		"Default"		"0"
	}
	
	HumanButton
	{
		ControlName		Button
		fieldName		HumanButton
		xpos			10
		ypos			30
		wide			100
		tall			40
		labelText		"#FORTRESS_HUMANS"

		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"6"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
		"use_proportional_insets"		"0"
		"command"		"changeteam 2"
		"Default"		"0"
	}
	
	AutoButton
	{
		ControlName		Button
		fieldName		AutoButton
		xpos			10
		ypos			130
		wide			100
		tall			40
		command			"changeteam -1"
		textAlignment	center
		
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"2"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"Automatic"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"6"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
		"use_proportional_insets"		"0"
		"Default"		"0"
	}
	
	CancelButton
	{
		ControlName		Button
		fieldName		CancelButton
		xpos			245
		ypos			215
		wide			64
		tall			16
		
		"autoResize"		"0"
		"pinCorner"		"0"
		"RoundedCorners"		"15"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"labelText"		"Cancel"
		"textAlignment"		"west"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"centerwrap"		"0"
		"textinsetx"		"6"
		"textinsety"		"0"
		"auto_wide_tocontents"		"0"
		"use_proportional_insets"		"0"
		"Default"		"0"
	}
	
	TeamLogoPreview
	{
		ControlName		CModelPanel
		fieldName		TeamLogoPreview
		xpos			120
		ypos			30
		wide			190
		tall			120
		autoResize		0
		pinCorner		0
		visible			1
		enabled			1
		tabPosition		0
		
		model
		{
			modelname		"models/interface/red_team.mdl"
			modelname_hwm	""
			skin			0
			angles_x		0.0
			angles_y		160.0
			angles_z		0.0
			origin_x		300.0
			origin_y		0.0
			origin_z		0.0
			frame_origin_x	0.0
			frame_origin_y	0.0
			frame_origin_z	0.0
			vcd				""
			spotlight		1
		}
		
		animation
		{
			name		""
			sequence	""
			activity	""
			default		1
		}
	}

	TeamPreview
	{
		ControlName		CModelPanel
		fieldName		TeamPreview
		xpos			210
		ypos			10
		wide			100
		tall			140
		autoResize		0
		pinCorner		0
		visible			1
		enabled			1
		tabPosition		0
		
		model
		{
			modelname		"models/player/human_commando.mdl"
			modelname_hwm	""
			skin			0
			angles_x		0.0
			angles_y		160.0
			angles_z		0.0
			origin_x		55.0
			origin_y		0.0
			origin_z		-57.0
			frame_origin_x	0.0
			frame_origin_y	0.0
			frame_origin_z	0.0
			vcd				""
			spotlight		1
		}
		
		animation
		{
			name		""
			sequence	""
			activity	"ACT_IDLE"
			default		1
		}
	}
	
	HumanImage
	{
		ControlName		CBitmapImagePanel
		fieldName		HumanImage
		xpos			11
		ypos			33
		wide			32
		tall			32
		visible			1
		enabled			1
		image			team_human
		imageAlignment	center
	}
	
	AlienImage
	{
		ControlName		CBitmapImagePanel
		fieldName		AlienImage
		xpos			75
		ypos			84
		wide			32
		tall			32
		visible			1
		enabled			1
		image			team_alien
		imageAlignment	center
	}
}
