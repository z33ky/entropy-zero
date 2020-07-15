HudLayout
{
	TargetID
	{
		fieldName	TargetID
		visible		1
		enabled		1
		xpos		c-126
		ypos		250
		wide	 	252
		tall	 	35
	}

	HudDeathNotice {
		"fieldName"			"HudDeathNotice"
		"visible"			"1"
		"enabled"			"1"
		"xpos"				"r640"
		"ypos"				"12"
		"wide"				"628"
		"tall"				"468"
		"MaxDeathNotices"	"4"
		"LineHeight"		"22"
		"RightJustify"		"1"	// If 1, draw notices from the right
		"TextFont"			"Default"
	}
	
	HudTrain
	{
		fieldName	HudTrain
		visible		1
		enabled		1
		wide		640
		tall		480
	}
	
	HudMessage
	{
		fieldName	HudMessage
		visible		1
		enabled		1
		wide		640
		tall		480
	}

	HudMenu
	{
		fieldName	HudMenu
		visible 	1
		enabled 	1
		wide	 	640
		tall	 	480
	}

	HudCrosshair
	{
		fieldName	"HudCrosshair"
		visible 	"1"
		enabled		"1"
		wide	 	"640"
		tall	 	"480"
	}
	
	HudWeapon
	{
		fieldName 	"HudWeapon"
		visible		"1"
		enabled 	"1"
		wide	 	"640"
		tall	 	"480"
	}

	HudHintDisplay
	{
		xpos	30
		ypos	30
		wide	120
		tall	120
		visible	1
		enabled	1
	}
	
	HudHintKeyDisplay
	{
		fieldName	HudHintKeyDisplay
		xpos	30
		ypos	30
		wide	120
		tall	120
		visible	1
		enabled	1
	}
	HudHintDisplayLabel
	{
		xpos		10
		ypos		10
		wide		120
		tall		120
		visible	1
		enabled	1
	}
	
	HudWeaponSelection {
		fieldName			HudWeaponSelection
		xpos				-90
		ypos				30
		wide				640
		tall				480
		visible 			1
		enabled 			1

		WeaponMenu1 {
			wide		90
			tall		60
			xpos		-3
			ypos		10
			enabled	1
			visible	1
		}

		WeaponMenu2 {
			wide		90
			tall		60
			xpos		-3
			ypos		74
			enabled	1
			visible	1
		}

		WeaponMenu3 {
			wide		90
			tall		60
			xpos		-3
			ypos		138
			enabled	1
			visible	1
		}

		WeaponMenu4 {
			wide		90
			tall		60
			xpos		-3
			ypos		202
			enabled	1
			visible	1
		}

		WeaponMenu5 {
			wide		90
			tall		60
			xpos		-3
			ypos		266
			enabled	1
			visible	1
		}

		WeaponMenu6 {
			wide		90
			tall		60
			xpos		-3
			ypos		330
			enabled	1
			visible	1
		}

		BuildMenu1 {
			wide		90
			tall		60
			xpos		100
			visible	1
		}

		BuildMenu2 {
			wide		90
			tall		60
			xpos		200
			visible	1
		}

		BuildMenu3 {
			wide		90
			tall		60
			xpos		300
			visible	1
		}

		BuildMenu4 {
			wide		90
			tall		60
			xpos		400
			visible	1
		}

		BuildMenu5 {
			wide		90
			tall		60
			xpos		500
			visible	1
		}

		BuildMenu6 {
			wide		90
			tall		60
			xpos		600
			visible	1
		}
	}

	HudWeaponFlashHelper
	{
		fieldName			HudWeaponFlashHelper
		xpos					10
		ypos					10
		wide					200
		tall					100
		visible 				1
		enabled 				1
		PaintBackgroundType	1
	}

	HudHealth
	{
		fieldName			"HudHealth"
		xpos				120
		ypos				432
		wide				"95"
		tall  				"36"
		visible 			"1"
		enabled 			"1"
		label_xpos_right 	"10"
		label_ypos 			"2"
		value_xpos_right 	"10"
		value_ypos 			"20"
		PaintBackgroundType	3
	}
	
	HudVehicle
	{
		fieldName	HudVehicle
		visible		1
		enabled		1
		wide		640
		tall		480
	}
	
	HudVehicleHealth
	{
		fieldName			"HudVehicleHealth"
		xpos				120
		ypos				386
		wide				"95"
		tall  				"36"
		visible 			"1"
		enabled 			"1"
		label_xpos_right 	"10"
		label_ypos 			"2"
		value_xpos_right 	"10"
		value_ypos 			"20"
		PaintBackgroundType	3
	}
	
	VehicleRoleHudElement
	{
		fieldName	VehicleRoleHudElement
		visible		1
		enabled		1
		xpos		200
		ypos		386
		wide		95
		tall		32
	}

	HudResources
	{
		fieldName			HudResources
		xpos				16	//120
		ypos				432
		wide				"95"
		tall  				"36"
		visible 			"1"
		enabled 			"1"
		label_xpos_right 	"10"
		label_ypos 			"2"
		value_xpos_right 	"10"
		value_ypos 			"20"

		Alpha				150

		PaintBackgroundType	3
	}
	
	HudResourcesPickup
	{
		fieldName			HudResourcesPickup
		xpos				80
		ypos				r40
		wide				25
		tall  				25
		visible 			1
		enabled 			1
		value_xpos_right 	0
		value_ypos 			0
	}
	
	HudAmmoPrimary
	{
		fieldName 			"HudAmmoPrimary"
		xpos				"r167"
		ypos				"432"
		wide				"75"
		tall 				"36"
		visible 			"1"
		enabled 			"1"
		label_xpos_right 	"10"
		label_ypos 			"2"
		value_xpos_right 	"10"
		value_ypos 			"20"
		PaintBackgroundType	2
	}
	
	HudAmmoPrimaryClip
	{
		fieldName 			"HudAmmoPrimaryClip"
		xpos				"r76"
		ypos				"432"
		wide				"60"
		tall  				"36"
		visible 			"1"
		enabled 			"1"
		value_xpos_right 	"10"
		value_ypos 			"20"
		PaintBackgroundType	2
	}
	
	HudAmmoSecondary
	{
		fieldName 			"HudAmmoSecondary"
		xpos				"r76"
		ypos				"380"
		wide				"60"
		tall  				"36"
		visible 			"1"
		enabled 			"1"
		digit_xpos 			"10"
		digit_ypos 			"2"
		PaintBackgroundType	2
	}
	
	HudVoiceSelfStatus
	{
		"fieldName" "HudVoiceSelfStatus"
		"visible" "0"
		"enabled" "0"
		"xpos" "r43"
		"ypos" "355"
		"wide" "24"
		"tall" "24"
	}

	HudVoiceStatus
	{
		"fieldName" "HudVoiceStatus"
		"visible" "1"
		"enabled" "1"
		"xpos" "r145"
		"ypos" "0"
		"wide" "145"
		"tall" "400"

		"item_wide"	"135"
		
		"show_avatar"		"0"
		
		"show_dead_icon"	"1"
		"dead_xpos"			"1"
		"dead_ypos"			"0"
		"dead_wide"			"16"
		"dead_tall"			"16"
		
		"show_voice_icon"	"1"
		"icon_ypos"			"0"
		"icon_xpos"			"15"
		"icon_tall"			"16"
		"icon_wide"			"16"
		
		"text_xpos"			"33"
	}

	HudCommentary
	{
		"fieldName" "HudCommentary"
		"xpos"	"c-190"
		"ypos"	"350"
		"wide"	"380"
		"tall"  "40"
		"visible" "1"
		"enabled" "1"
		
		"PaintBackgroundType"	"2"
		
		"bar_xpos"		"50"
		"bar_ypos"		"20"
		"bar_height"	"8"
		"bar_width"		"320"
		"speaker_xpos"	"50"
		"speaker_ypos"	"8"
		"count_xpos_from_right"	"10"	// Counts from the right side
		"count_ypos"	"8"
		
		"icon_texture"	"vgui/hud/icon_commentary"
		"icon_xpos"		"0"
		"icon_ypos"		"0"		
		"icon_width"	"40"
		"icon_height"	"40"
	}

	HudOrderList
	{
		fieldName	HudOrderList
		visible		0
		enabled		1
	}
	
	HudTimer
	{
		"fieldName" 	"HudTimer"
		"xpos"		"c50"
		"ypos"		"432"
		"wide"		"170"
		"tall"  		"36"
		"visible" 	"0"
		"enabled" 	"1"

		"PaintBackgroundType"	"2"

		"text_xpos" "8"
		"text_ypos" "20"
		"digit_xpos" "44"
		"digit_ypos" "2"
		//"NumberFont" "CloseCaption_Bold"
		//"digit_xpos" "3"
		//"digit_ypos" "1"
	}
	
	HudMinimap
	{
		fieldName	HudMinimap
		xpos			r170
		ypos			10
		wide			160
		tall			160
		visible 		1
		enabled 		1
	}
	
	HudMinimapTextHelpPanel
	{
		fieldName	HudMinimapTextHelpPanel
		xpos			r170
		ypos			180
		wide			128
		tall			128
		
		visible	1
		enabled	1
	}
	
	CCommanderStatusPanel
	{
		fieldName	CCommanderStatusPanel
		
		xpos		r170
		ypos		180
		wide		128
		tall		128
		
		visible 	1
		enabled 	1
	}
	
	DamageIndicator
	{
		fieldName	DamageIndicator
		visible 	1
		enabled 	1
	}
	
	HudChat
	{
		ControlName			"EditablePanel"
		fieldName			"HudChat"
		visible 			"1"
		enabled 			"1"
		xpos				"10"
		ypos				"275"
		wide	 			"320"
		tall	 			"120"
		PaintBackgroundType	"2"
	}
	
	HudPredictionDump
	{
		fieldName	HudPredictionDump
		visible		1
		enabled		1
		wide		640
		tall		480
	}
	
	HudHistoryResource
	{
		fieldName	HudHistoryResource
		visible		1
		enabled		1
		wide		640
		tall		480
	}
	
	HudAnimationInfo
	{
		fieldName	HudAnimationInfo
		visible		1
		enabled		1
		wide		640
		tall		480
	}
	
	HudCloseCaption
	{
		"fieldName" "HudCloseCaption"
		"visible"	"1"
		"enabled"	"1"
		"xpos"		"c-250"
		"ypos"		"276"
		"wide"		"500"
		"tall"		"136"

		"BgAlpha"	"128"

		"GrowTime"		"0.25"
		"ItemHiddenTime"	"0.2"  // Nearly same as grow time so that the item doesn't start to show until growth is finished
		"ItemFadeInTime"	"0.15"	// Once ItemHiddenTime is finished, takes this much longer to fade in
		"ItemFadeOutTime"	"0.3"

	}
	
	HudGeiger
	{
		fieldName	HudGeiger
		visible		1
		enabled		1
		wide		640
		tall		480
	}
	
	AchievementNotificationPanel
	{
		fieldName	AchievementNotificationPanel
		visible		0
		enabled		0
	}
}