// Created by Crowbar 0.19.0.0

$modelname "weapons\v_human_pda.mdl"

$body "studio" "v_pda_reference.smd"

$cdmaterials "models\player\commando\"
$cdmaterials "models\weapons\v_weapon_pda\"

$attachment "weapon_bone" "weapon" 0 0 0 rotate 0 0 0
//$attachment "FX_null" "Ant_Tip" 0.03 0.06 -0.02 rotate 0 0 0
//$attachment "controlpanel0_ur" "top_right" 0 0 0 rotate 0 0 0
//$attachment "controlpanel0_ll" "bottom_left" 0 0 0 rotate 0 0 0

$surfaceprop "default"

$contents "solid"

$sequence "idle" "v_pda_idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
	snap
}

$sequence "draw" "v_pda_draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
	snap
}

