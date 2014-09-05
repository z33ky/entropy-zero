HudLayout
{
	HudMenu
	{
		fieldName	"HudMenu"
		visible 	"1"
		enabled 	"1"
		wide	 	"640"
		tall	 	"480"
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
	
	HudWeaponSelection
	{
		fieldName			"HudWeaponSelection"
		xpos				"16"
		ypos				"16"
		visible 			"1"
		enabled 			"1"
		wide				"64"
		tall				"64"
		IconWidth			"32"
		IconHeight			"32"
		TextXPos			"10"
		TextYPos			"48"
		PaintBackgroundType	"2"
	}
	
	HudHealth
	{
		fieldName			"HudHealth"
		xpos				"16"
		ypos				"432"
		wide				"95"
		tall  				"36"
		visible 			"1"
		enabled 			"1"		
		label_xpos_right 	"10"
		label_ypos 			"2"
		value_xpos_right 	"10"
		value_ypos 			"20"
		PaintBackgroundType	"3"
	}

	HudResources
	{
		fieldName			"HudResources"
		xpos				"16"
		ypos				"380"
		wide				"95"
		tall  				"36"
		visible 			"1"
		enabled 			"1"
		label_xpos_right 	"10"
		label_ypos 			"2"
		value_xpos_right 	"10"
		value_ypos 			"20"
		PaintBackgroundType	"3"
	}
	
	HudResourcesPickup
	{
		fieldName			"HudResourcesPickup"
		xpos				"128"
		ypos				"380"
		wide				"30"
		tall  				"25"
		visible 			"1"
		enabled 			"1"
		value_xpos_right 	"0"
		value_ypos 			"0"
		PaintBackgroundType	"0"
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
		PaintBackgroundType	"3"
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
		PaintBackgroundType	"2"
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
		PaintBackgroundType	"2"
	}
	
	HudOrderList
	{
		fieldName	"HudOrderList"
		visible		"1"
		enabled		"1"
	}
	
	HudMinimap
	{
		fieldName		"HudMinimap"
		xpos			"r170"
		ypos			"10"
		wide			"160"
		tall			"160"
		visible 		"1"
		enabled 		"1"
	}
	
	DamageIndicator
	{
		fieldName	"DamageIndicator"
		visible 	"1"
		enabled 	"1"
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
	
	AchievementNotificationPanel
	{
		fieldName	"AchievementNotificationPanel"
		visible		"0"
		enabled		"0"
	}
}