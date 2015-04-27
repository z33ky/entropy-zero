// Created by Crowbar 0.19.0.0

$modelname "weapons\v_human_builder.mdl"

$bodygroup "v_PDA_engineer"
{
	studio "v_pda_engineer_reference2.smd"
}

$cdmaterials "models\player\engineer\"
$cdmaterials "models\weapons\v_weapon_builder\"

$attachment "weapon_bone" "weapon_bone" 0 0 0 rotate 0 0 0
$attachment "FX_null" "Ant_Tip" 0.03 0.06 -0.02 rotate 0 0 0
$attachment "controlpanel0_ur" "top_right" 0 0 0 rotate 0 0 0
$attachment "controlpanel0_ll" "bottom_left" 0 0 0 rotate 0 0 0

$surfaceprop "default"

$contents "solid"

$sequence "idle" "v_pda_engineer_anims\idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
	snap
}

$sequence "draw" "v_pda_engineer_anims\draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
	snap
	{ event 5004 1.00000005215406 "Weapon_PDA.DrawEngineer" }
	{ event 5004 13.0000001192093 "Weapon_PDA.AntennaeEngineer" }
}

