// Created by Crowbar 0.19.0.0

$modelname "player/human_medic.mdl"

$model "medic" "medic_reference.smd" {
	eyeball "eye_right" "bip_head" -0.984379 78.958735 3.836429 "eyeball_r" 1.2 3 "iris_unused" 0.5
	eyeball "eye_left" "bip_head" 0.984379 78.958735 3.836429 "eyeball_l" 1.2 -3 "iris_unused" 0.5
}

$lod 11
{
	replacemodel "medic_reference.smd" "medic_morphs_low_lod1.smd"
}
$lod 22
{
	replacemodel "medic_reference.smd" "medic_morphs_low_lod2.smd"
}
$lod 33
{
	replacemodel "medic_reference.smd" "medic_morphs_low_lod3.smd"
}
$lod 44
{
	replacemodel "medic_reference.smd" "medic_morphs_low_lod4.smd"
}
$lod 55
{
	replacemodel "medic_reference.smd" "medic_morphs_low_lod5.smd"
}
$shadowlod
{
	replacemodel "medic_reference.smd" "medic_morphs_low_lod6.smd"
}

$poseparameter "body_pitch" -45 90 360
$poseparameter "body_yaw" -45 45 360
$poseparameter "move_y" -1 1 0
$poseparameter "move_x" -1 1 0
$poseparameter "move_yaw" -180.0 180.0 loop 360.0 wrap

$cdmaterials "models\player\medic\"

$texturegroup "skinfamilies"
{
	{
		"human_medic.vmt"
		"human_medic_backpack.vmt"
		"human_medic_head.vmt"
		"eyeball_r.vmt"
		"eyeball_l.vmt"
	}
}

$attachment "eyes" "bip_head" 0 -2.42 -4.4 rotate 90 -90 0
$attachment "righteye" "bip_head" -0.98 -2.42 -4.4 rotate 90 -90 0
$attachment "lefteye" "bip_head" 0.98 -2.42 -4.4 rotate 90 -90 0

$surfaceprop "flesh"

$contents "solid"

$eyeposition 0 78.915 0

$hboxset "medic"
$hbox 1 "bip_head" -5 -8 -7.5 5 5 3.5
$hbox 0 "bip_pelvis" -9 -1 -6 9 11 5
$hbox 3 "bip_spine_0" -8 -1.5 -8 8 3.5 4
$hbox 3 "bip_spine_1" -7.5 -2 -8.5 7.5 4 3.5
$hbox 2 "bip_spine_2" -8.5 -3 -8.75 8.5 3 3.75
$hbox 2 "bip_spine_3" -10 -2 -5 10 2 3
$hbox 4 "bip_upperArm_L" -0.5 -3 -2.25 12.5 3.5 2.75
$hbox 4 "bip_lowerArm_L" 0 -2.35 -3 12 3.15 3
$hbox 4 "bip_hand_L" -3.5 -9.5 -3.25 1.5 -0.5 3.25
$hbox 5 "bip_upperArm_R" -0.5 -3.5 -2.75 12.5 3 2.25
$hbox 5 "bip_lowerArm_R" 0 -3 -3.15 12 3 2.35
$hbox 5 "bip_hand_R" -1.5 0.5 -3.25 3.5 9.5 3.25
$hbox 6 "bip_hip_L" 4 -3.25 -2.5 18 5.25 5.5
$hbox 6 "bip_knee_L" 0.5 -2.75 -3.5 19.5 4.25 3.5
$hbox 6 "bip_foot_L" -2 -10 -4 2 2 2
$hbox 7 "bip_hip_R" 4 -2.5 -3.25 18 5.5 5.25
$hbox 7 "bip_knee_R" 0.5 -3.5 -2.75 19.5 3.5 4.25
$hbox 7 "bip_foot_R" -2 -2 -2 2 10 4
$skipboneinbbox

$sequence "ref" "medic_anims\ref.smd" {
	fps 30
}

$sequence "ragdoll" "medic_anims\ragdoll.smd" {
	fps 30
	"ACT_DIERAGDOLL" 1
}

$sectionframes 30 120

$animation "a_reference" "medic_animations_anims\a_reference.smd" {
	fps 30
}
$animation "a_PRIMARY_aimmatrix_idle_neutral" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_neutral.smd" {
	fps 30
}
$animation "a_PRIMARY_aimmatrix_idle_down_right" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_down_center" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_down_left" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_mid_right" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_mid_center" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_mid_left" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_up_right" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_up_center" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_up_left" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_idle_straight_up" "medic_animations_anims\a_PRIMARY_aimmatrix_idle_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_neutral" "medic_animations_anims\a_PRIMARY_aimmatrix_run_neutral.smd" {
	fps 30
}
$animation "a_PRIMARY_aimmatrix_run_down_right" "medic_animations_anims\a_PRIMARY_aimmatrix_run_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_down_center" "medic_animations_anims\a_PRIMARY_aimmatrix_run_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_down_left" "medic_animations_anims\a_PRIMARY_aimmatrix_run_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_mid_right" "medic_animations_anims\a_PRIMARY_aimmatrix_run_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_mid_center" "medic_animations_anims\a_PRIMARY_aimmatrix_run_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_mid_left" "medic_animations_anims\a_PRIMARY_aimmatrix_run_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_up_right" "medic_animations_anims\a_PRIMARY_aimmatrix_run_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_up_center" "medic_animations_anims\a_PRIMARY_aimmatrix_run_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_up_left" "medic_animations_anims\a_PRIMARY_aimmatrix_run_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_run_straight_up" "medic_animations_anims\a_PRIMARY_aimmatrix_run_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_neutral" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_neutral.smd" {
	fps 30
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_down_right" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_down_center" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_down_left" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_mid_right" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_mid_center" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_mid_left" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_up_right" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_up_center" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_up_left" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_PRIMARY_aimmatrix_crouch_idle_straight_up" "medic_animations_anims\a_PRIMARY_aimmatrix_crouch_idle_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_neutral" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_neutral.smd" {
	fps 30
}
$animation "a_SECONDARY_aimmatrix_idle_down_right" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_down_center" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_down_left" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_mid_right" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_mid_center" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_mid_left" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_up_right" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_up_center" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_up_left" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_idle_straight_up" "medic_animations_anims\a_SECONDARY_aimmatrix_idle_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_neutral" "medic_animations_anims\a_SECONDARY_aimmatrix_run_neutral.smd" {
	fps 30
}
$animation "a_SECONDARY_aimmatrix_run_down_right" "medic_animations_anims\a_SECONDARY_aimmatrix_run_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_down_center" "medic_animations_anims\a_SECONDARY_aimmatrix_run_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_down_left" "medic_animations_anims\a_SECONDARY_aimmatrix_run_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_mid_right" "medic_animations_anims\a_SECONDARY_aimmatrix_run_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_mid_center" "medic_animations_anims\a_SECONDARY_aimmatrix_run_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_mid_left" "medic_animations_anims\a_SECONDARY_aimmatrix_run_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_up_right" "medic_animations_anims\a_SECONDARY_aimmatrix_run_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_up_center" "medic_animations_anims\a_SECONDARY_aimmatrix_run_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_up_left" "medic_animations_anims\a_SECONDARY_aimmatrix_run_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_run_straight_up" "medic_animations_anims\a_SECONDARY_aimmatrix_run_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_neutral" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_neutral.smd" {
	fps 30
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_down_right" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_down_center" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_down_left" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_mid_right" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_mid_center" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_mid_left" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_up_right" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_up_center" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_up_left" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_idle_straight_up" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_idle_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_neutral" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_neutral.smd" {
	fps 30
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_down_right" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_down_center" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_down_left" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_mid_right" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_mid_center" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_mid_left" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_up_right" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_up_center" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_up_left" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_SECONDARY_aimmatrix_crouch_walk_straight_up" "medic_animations_anims\a_SECONDARY_aimmatrix_crouch_walk_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_AttackStandBase" "medic_animations_anims\a_AttackStandBase.smd" {
	fps 30
}
$animation "a_MELEE_aimmatrix_idle_neutral" "medic_animations_anims\a_MELEE_aimmatrix_idle_neutral.smd" {
	fps 30
}
$animation "a_MELEE_aimmatrix_idle_down_right" "medic_animations_anims\a_MELEE_aimmatrix_idle_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_down_center" "medic_animations_anims\a_MELEE_aimmatrix_idle_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_down_left" "medic_animations_anims\a_MELEE_aimmatrix_idle_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_mid_right" "medic_animations_anims\a_MELEE_aimmatrix_idle_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_mid_center" "medic_animations_anims\a_MELEE_aimmatrix_idle_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_mid_left" "medic_animations_anims\a_MELEE_aimmatrix_idle_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_up_right" "medic_animations_anims\a_MELEE_aimmatrix_idle_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_up_center" "medic_animations_anims\a_MELEE_aimmatrix_idle_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_up_left" "medic_animations_anims\a_MELEE_aimmatrix_idle_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_idle_straight_up" "medic_animations_anims\a_MELEE_aimmatrix_idle_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_neutral" "medic_animations_anims\a_MELEE_aimmatrix_run_neutral.smd" {
	fps 30
}
$animation "a_MELEE_aimmatrix_run_down_right" "medic_animations_anims\a_MELEE_aimmatrix_run_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_down_center" "medic_animations_anims\a_MELEE_aimmatrix_run_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_down_left" "medic_animations_anims\a_MELEE_aimmatrix_run_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_mid_right" "medic_animations_anims\a_MELEE_aimmatrix_run_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_mid_center" "medic_animations_anims\a_MELEE_aimmatrix_run_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_mid_left" "medic_animations_anims\a_MELEE_aimmatrix_run_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_up_right" "medic_animations_anims\a_MELEE_aimmatrix_run_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_up_center" "medic_animations_anims\a_MELEE_aimmatrix_run_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_up_left" "medic_animations_anims\a_MELEE_aimmatrix_run_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_run_straight_up" "medic_animations_anims\a_MELEE_aimmatrix_run_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_neutral" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_neutral.smd" {
	fps 30
}
$animation "a_MELEE_aimmatrix_crouch_idle_down_right" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_down_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_down_center" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_down_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_down_left" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_down_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_mid_right" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_mid_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_mid_center" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_mid_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_mid_left" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_mid_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_up_right" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_up_right.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_up_center" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_up_center.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_up_left" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_up_left.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_MELEE_aimmatrix_crouch_idle_straight_up" "medic_animations_anims\a_MELEE_aimmatrix_crouch_idle_straight_up.smd" {
	fps 30
	// subtract "a_reference" 0
}
$animation "a_Melee_Crouch_Swing" "medic_animations_anims\a_Melee_Crouch_Swing.smd" {
	fps 30
}
$animation "a_swimCenter_SECONDARY" "medic_animations_anims\a_swimCenter_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimS_SECONDARY" "medic_animations_anims\a_swimS_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimSE_SECONDARY" "medic_animations_anims\a_swimSE_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimE_SECONDARY" "medic_animations_anims\a_swimE_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimNE_SECONDARY" "medic_animations_anims\a_swimNE_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimN_SECONDARY" "medic_animations_anims\a_swimN_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimNW_SECONDARY" "medic_animations_anims\a_swimNW_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimW_SECONDARY" "medic_animations_anims\a_swimW_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimSW_SECONDARY" "medic_animations_anims\a_swimSW_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_swimCenter_PRIMARY" "medic_animations_anims\a_swimCenter_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimS_PRIMARY" "medic_animations_anims\a_swimS_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimSE_PRIMARY" "medic_animations_anims\a_swimSE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimE_PRIMARY" "medic_animations_anims\a_swimE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimNE_PRIMARY" "medic_animations_anims\a_swimNE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimN_PRIMARY" "medic_animations_anims\a_swimN_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimNW_PRIMARY" "medic_animations_anims\a_swimNW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimW_PRIMARY" "medic_animations_anims\a_swimW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimSW_PRIMARY" "medic_animations_anims\a_swimSW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_swimCenter_MELEE" "medic_animations_anims\a_swimCenter_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimS_MELEE" "medic_animations_anims\a_swimS_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimSE_MELEE" "medic_animations_anims\a_swimSE_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimE_MELEE" "medic_animations_anims\a_swimE_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimNE_MELEE" "medic_animations_anims\a_swimNE_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimN_MELEE" "medic_animations_anims\a_swimN_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimNW_MELEE" "medic_animations_anims\a_swimNW_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimW_MELEE" "medic_animations_anims\a_swimW_MELEE.smd" {
	fps 30
	loop
}
$animation "a_swimSW_MELEE" "medic_animations_anims\a_swimSW_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runCenter_PRIMARY" "medic_animations_anims\a_runCenter_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runS_PRIMARY" "medic_animations_anims\a_runS_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runSE_PRIMARY" "medic_animations_anims\a_runSE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runE_PRIMARY" "medic_animations_anims\a_runE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runNE_PRIMARY" "medic_animations_anims\a_runNE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runN_PRIMARY" "medic_animations_anims\a_runN_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runNW_PRIMARY" "medic_animations_anims\a_runNW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runW_PRIMARY" "medic_animations_anims\a_runW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runSW_PRIMARY" "medic_animations_anims\a_runSW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkCenter_PRIMARY" "medic_animations_anims\a_crouch_walkCenter_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkS_PRIMARY" "medic_animations_anims\a_crouch_walkS_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkSE_PRIMARY" "medic_animations_anims\a_crouch_walkSE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkE_PRIMARY" "medic_animations_anims\a_crouch_walkE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkNE_PRIMARY" "medic_animations_anims\a_crouch_walkNE_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkN_PRIMARY" "medic_animations_anims\a_crouch_walkN_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkNW_PRIMARY" "medic_animations_anims\a_crouch_walkNW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkW_PRIMARY" "medic_animations_anims\a_crouch_walkW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkSW_PRIMARY" "medic_animations_anims\a_crouch_walkSW_PRIMARY.smd" {
	fps 30
	loop
}
$animation "a_runCenter_SECONDARY" "medic_animations_anims\a_runCenter_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runS_SECONDARY" "medic_animations_anims\a_runS_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runSE_secondary" "medic_animations_anims\a_runSE_secondary.smd" {
	fps 30
	loop
}
$animation "a_runE_SECONDARY" "medic_animations_anims\a_runE_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runNE_SECONDARY" "medic_animations_anims\a_runNE_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runN_SECONDARY" "medic_animations_anims\a_runN_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runNW_SECONDARY" "medic_animations_anims\a_runNW_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runW_SECONDARY" "medic_animations_anims\a_runW_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runSW_SECONDARY" "medic_animations_anims\a_runSW_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_blend_crouchN_Crouch_Walk_SECONDARY" "medic_animations_anims\a_blend_crouchN_Crouch_Walk_SECONDARY.smd" {
	fps 30
}
$animation "a_crouch_walkCenter_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkCenter_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkS_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkS_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkSE_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkSE_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkE_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkE_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkNE_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkNE_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkN_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkN_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkNW_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkNW_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkW_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkW_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkSW_Crouch_Walk_SECONDARY" "medic_animations_anims\a_crouch_walkSW_Crouch_Walk_SECONDARY.smd" {
	fps 30
	loop
}
$animation "a_runCenter_MELEE" "medic_animations_anims\a_runCenter_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runS_MELEE" "medic_animations_anims\a_runS_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runSE_MELEE" "medic_animations_anims\a_runSE_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runE_MELEE" "medic_animations_anims\a_runE_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runNE_MELEE" "medic_animations_anims\a_runNE_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runN_MELEE" "medic_animations_anims\a_runN_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runNW_MELEE" "medic_animations_anims\a_runNW_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runW_MELEE" "medic_animations_anims\a_runW_MELEE.smd" {
	fps 30
	loop
}
$animation "a_runSW_MELEE" "medic_animations_anims\a_runSW_MELEE.smd" {
	fps 30
	loop
}
$animation "a_blend_crouchN_Crouch_Walk_MELEE" "medic_animations_anims\a_blend_crouchN_Crouch_Walk_MELEE.smd" {
	fps 30
}
$animation "a_crouch_walkCenter_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkCenter_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkS_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkS_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkSE_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkSE_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkE_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkE_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkNE_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkNE_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkN_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkN_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkNW_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkNW_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkW_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkW_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_crouch_walkSW_Crouch_Walk_MELEE" "medic_animations_anims\a_crouch_walkSW_Crouch_Walk_MELEE.smd" {
	fps 30
	loop
}
$animation "a_jumpStart_primary" "medic_animations_anims\a_jumpStart_primary.smd" {
	fps 30
}
$animation "a_jumpStart_N_primary" "medic_animations_anims\a_jumpStart_N_primary.smd" {
	fps 30
}
$animation "a_jumpStart_NE_primary" "medic_animations_anims\a_jumpStart_NE_primary.smd" {
	fps 30
}
$animation "a_jumpStart_NW_primary" "medic_animations_anims\a_jumpStart_NW_primary.smd" {
	fps 30
}
$animation "a_jumpStart_E_primary" "medic_animations_anims\a_jumpStart_E_primary.smd" {
	fps 30
}
$animation "a_jumpStart_SE_primary" "medic_animations_anims\a_jumpStart_SE_primary.smd" {
	fps 30
}
$animation "a_jumpStart_W_primary" "medic_animations_anims\a_jumpStart_W_primary.smd" {
	fps 30
}
$animation "a_jumpStart_SW_primary" "medic_animations_anims\a_jumpStart_SW_primary.smd" {
	fps 30
}
$animation "a_jumpStart_S_primary" "medic_animations_anims\a_jumpStart_S_primary.smd" {
	fps 30
}
$animation "a_jumpFloat_primary" "medic_animations_anims\a_jumpFloat_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_N_primary" "medic_animations_anims\a_jumpFloat_N_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_NE_primary" "medic_animations_anims\a_jumpFloat_NE_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_NW_primary" "medic_animations_anims\a_jumpFloat_NW_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_E_primary" "medic_animations_anims\a_jumpFloat_E_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_SE_primary" "medic_animations_anims\a_jumpFloat_SE_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_W_primary" "medic_animations_anims\a_jumpFloat_W_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_SW_primary" "medic_animations_anims\a_jumpFloat_SW_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_S_primary" "medic_animations_anims\a_jumpFloat_S_primary.smd" {
	fps 30
	loop
}
$animation "a_jumpStart_secondary" "medic_animations_anims\a_jumpStart_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_N_secondary" "medic_animations_anims\a_jumpStart_N_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_NE_secondary" "medic_animations_anims\a_jumpStart_NE_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_NW_secondary" "medic_animations_anims\a_jumpStart_NW_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_E_secondary" "medic_animations_anims\a_jumpStart_E_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_SE_secondary" "medic_animations_anims\a_jumpStart_SE_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_W_secondary" "medic_animations_anims\a_jumpStart_W_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_SW_secondary" "medic_animations_anims\a_jumpStart_SW_secondary.smd" {
	fps 30
}
$animation "a_jumpStart_S_secondary" "medic_animations_anims\a_jumpStart_S_secondary.smd" {
	fps 30
}
$animation "a_jumpFloat_secondary" "medic_animations_anims\a_jumpFloat_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_N_secondary" "medic_animations_anims\a_jumpFloat_N_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_NE_secondary" "medic_animations_anims\a_jumpFloat_NE_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_NW_secondary" "medic_animations_anims\a_jumpFloat_NW_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_E_secondary" "medic_animations_anims\a_jumpFloat_E_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_SE_secondary" "medic_animations_anims\a_jumpFloat_SE_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_W_secondary" "medic_animations_anims\a_jumpFloat_W_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_SW_secondary" "medic_animations_anims\a_jumpFloat_SW_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_S_secondary" "medic_animations_anims\a_jumpFloat_S_secondary.smd" {
	fps 30
	loop
}
$animation "a_jumpStart_melee" "medic_animations_anims\a_jumpStart_melee.smd" {
	fps 30
}
$animation "a_jumpStart_N_melee" "medic_animations_anims\a_jumpStart_N_melee.smd" {
	fps 30
}
$animation "a_jumpStart_NE_melee" "medic_animations_anims\a_jumpStart_NE_melee.smd" {
	fps 30
}
$animation "a_jumpStart_NW_melee" "medic_animations_anims\a_jumpStart_NW_melee.smd" {
	fps 30
}
$animation "a_jumpStart_E_melee" "medic_animations_anims\a_jumpStart_E_melee.smd" {
	fps 30
}
$animation "a_jumpStart_SE_melee" "medic_animations_anims\a_jumpStart_SE_melee.smd" {
	fps 30
}
$animation "a_jumpStart_W_melee" "medic_animations_anims\a_jumpStart_W_melee.smd" {
	fps 30
}
$animation "a_jumpStart_SW_melee" "medic_animations_anims\a_jumpStart_SW_melee.smd" {
	fps 30
}
$animation "a_jumpStart_S_melee" "medic_animations_anims\a_jumpStart_S_melee.smd" {
	fps 30
}
$animation "a_jumpFloat_melee" "medic_animations_anims\a_jumpFloat_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_N_melee" "medic_animations_anims\a_jumpFloat_N_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_NE_melee" "medic_animations_anims\a_jumpFloat_NE_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_NW_melee" "medic_animations_anims\a_jumpFloat_NW_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_E_melee" "medic_animations_anims\a_jumpFloat_E_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_SE_melee" "medic_animations_anims\a_jumpFloat_SE_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_W_melee" "medic_animations_anims\a_jumpFloat_W_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_SW_melee" "medic_animations_anims\a_jumpFloat_SW_melee.smd" {
	fps 30
	loop
}
$animation "a_jumpFloat_S_melee" "medic_animations_anims\a_jumpFloat_S_melee.smd" {
	fps 30
	loop
}


$sequence "ragdollspawn" "medic_animations_anims\ragdollspawn.smd" {
	fps 30
}

$sequence "PRIMARY_aimmatrix_idle" {
	"a_PRIMARY_aimmatrix_idle_straight_up"
	"a_PRIMARY_aimmatrix_idle_straight_up"
	"a_PRIMARY_aimmatrix_idle_straight_up"
	"a_PRIMARY_aimmatrix_idle_up_right"
	"a_PRIMARY_aimmatrix_idle_up_center"
	"a_PRIMARY_aimmatrix_idle_up_left"
	"a_PRIMARY_aimmatrix_idle_mid_right"
	"a_PRIMARY_aimmatrix_idle_mid_center"
	"a_PRIMARY_aimmatrix_idle_mid_left"
	"a_PRIMARY_aimmatrix_idle_down_right"
	"a_PRIMARY_aimmatrix_idle_down_center"
	"a_PRIMARY_aimmatrix_idle_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "PRIMARY_aimmatrix_run" {
	"a_PRIMARY_aimmatrix_run_straight_up"
	"a_PRIMARY_aimmatrix_run_straight_up"
	"a_PRIMARY_aimmatrix_run_straight_up"
	"a_PRIMARY_aimmatrix_run_up_right"
	"a_PRIMARY_aimmatrix_run_up_center"
	"a_PRIMARY_aimmatrix_run_up_left"
	"a_PRIMARY_aimmatrix_run_mid_right"
	"a_PRIMARY_aimmatrix_run_mid_center"
	"a_PRIMARY_aimmatrix_run_mid_left"
	"a_PRIMARY_aimmatrix_run_down_right"
	"a_PRIMARY_aimmatrix_run_down_center"
	"a_PRIMARY_aimmatrix_run_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "PRIMARY_aimmatrix_crouch_idle" {
	"a_PRIMARY_aimmatrix_crouch_idle_straight_up"
	"a_PRIMARY_aimmatrix_crouch_idle_straight_up"
	"a_PRIMARY_aimmatrix_crouch_idle_straight_up"
	"a_PRIMARY_aimmatrix_crouch_idle_up_right"
	"a_PRIMARY_aimmatrix_crouch_idle_up_center"
	"a_PRIMARY_aimmatrix_crouch_idle_up_left"
	"a_PRIMARY_aimmatrix_crouch_idle_mid_right"
	"a_PRIMARY_aimmatrix_crouch_idle_mid_center"
	"a_PRIMARY_aimmatrix_crouch_idle_mid_left"
	"a_PRIMARY_aimmatrix_crouch_idle_down_right"
	"a_PRIMARY_aimmatrix_crouch_idle_down_center"
	"a_PRIMARY_aimmatrix_crouch_idle_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "AttackStand_PRIMARY" "medic_animations_anims\AttackStand_PRIMARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_STAND_PRIMARY" 1
	// delta
}

$sequence "AttackCrouch_PRIMARY" "medic_animations_anims\AttackCrouch_PRIMARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_CROUCH_PRIMARY" 1
	// delta
}

$sequence "AttackSwim_PRIMARY" "medic_animations_anims\AttackSwim_PRIMARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_SWIM_PRIMARY" 1
	// delta
}

$sequence "layer_reload_standing_arms_primary" "medic_animations_anims\layer_reload_standing_arms_primary.smd" {
	fps 30
	hidden
}

$sequence "ReloadStand_PRIMARY" "medic_animations_anims\ReloadStand_PRIMARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_RELOAD_STAND_PRIMARY" 1
	// delta
	// addlayer "layer_reload_standing_arms_primary"
}

$sequence "ReloadCrouch_PRIMARY" "medic_animations_anims\ReloadCrouch_PRIMARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_RELOAD_CROUCH_PRIMARY" 1
	// delta
	// addlayer "layer_reload_standing_arms_primary"
}

$sequence "ReloadSwim_PRIMARY" "medic_animations_anims\ReloadSwim_PRIMARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_RELOAD_SWIM_PRIMARY" 1
	// delta
	// addlayer "layer_reload_standing_arms_primary"
}

$sequence "ReloadAirwalk_PRIMARY" "medic_animations_anims\ReloadAirwalk_PRIMARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_RELOAD_AIRWALK_PRIMARY" 1
	// delta
	// addlayer "layer_reload_standing_arms_primary"
}

$sequence "a_flinch01" "medic_animations_anims\a_flinch01.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_FLINCH_CHEST" 1
	// delta
}

$sequence "layer_placeSapper_ArmL" "medic_animations_anims\layer_placeSapper_ArmL.smd" {
	fps 30
	hidden
}

$sequence "PRIMARY_placeSapper" "medic_animations_anims\PRIMARY_placeSapper.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_STAND_GRENADE" 1
	// delta
	// addlayer "layer_placeSapper_ArmL"
}

$sequence "SECONDARY_aimmatrix_idle" {
	"a_SECONDARY_aimmatrix_idle_straight_up"
	"a_SECONDARY_aimmatrix_idle_straight_up"
	"a_SECONDARY_aimmatrix_idle_straight_up"
	"a_SECONDARY_aimmatrix_idle_up_right"
	"a_SECONDARY_aimmatrix_idle_up_center"
	"a_SECONDARY_aimmatrix_idle_up_left"
	"a_SECONDARY_aimmatrix_idle_mid_right"
	"a_SECONDARY_aimmatrix_idle_mid_center"
	"a_SECONDARY_aimmatrix_idle_mid_left"
	"a_SECONDARY_aimmatrix_idle_down_right"
	"a_SECONDARY_aimmatrix_idle_down_center"
	"a_SECONDARY_aimmatrix_idle_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "SECONDARY_aimmatrix_run" {
	"a_SECONDARY_aimmatrix_run_straight_up"
	"a_SECONDARY_aimmatrix_run_straight_up"
	"a_SECONDARY_aimmatrix_run_straight_up"
	"a_SECONDARY_aimmatrix_run_up_right"
	"a_SECONDARY_aimmatrix_run_up_center"
	"a_SECONDARY_aimmatrix_run_up_left"
	"a_SECONDARY_aimmatrix_run_mid_right"
	"a_SECONDARY_aimmatrix_run_mid_center"
	"a_SECONDARY_aimmatrix_run_mid_left"
	"a_SECONDARY_aimmatrix_run_down_right"
	"a_SECONDARY_aimmatrix_run_down_center"
	"a_SECONDARY_aimmatrix_run_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "SECONDARY_aimmatrix_crouch_idle" {
	"a_SECONDARY_aimmatrix_crouch_idle_straight_up"
	"a_SECONDARY_aimmatrix_crouch_idle_straight_up"
	"a_SECONDARY_aimmatrix_crouch_idle_straight_up"
	"a_SECONDARY_aimmatrix_crouch_idle_up_right"
	"a_SECONDARY_aimmatrix_crouch_idle_up_center"
	"a_SECONDARY_aimmatrix_crouch_idle_up_left"
	"a_SECONDARY_aimmatrix_crouch_idle_mid_right"
	"a_SECONDARY_aimmatrix_crouch_idle_mid_center"
	"a_SECONDARY_aimmatrix_crouch_idle_mid_left"
	"a_SECONDARY_aimmatrix_crouch_idle_down_right"
	"a_SECONDARY_aimmatrix_crouch_idle_down_center"
	"a_SECONDARY_aimmatrix_crouch_idle_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "SECONDARY_aimmatrix_crouch_walk" {
	"a_SECONDARY_aimmatrix_crouch_walk_straight_up"
	"a_SECONDARY_aimmatrix_crouch_walk_straight_up"
	"a_SECONDARY_aimmatrix_crouch_walk_straight_up"
	"a_SECONDARY_aimmatrix_crouch_walk_up_right"
	"a_SECONDARY_aimmatrix_crouch_walk_up_center"
	"a_SECONDARY_aimmatrix_crouch_walk_up_left"
	"a_SECONDARY_aimmatrix_crouch_walk_mid_right"
	"a_SECONDARY_aimmatrix_crouch_walk_mid_center"
	"a_SECONDARY_aimmatrix_crouch_walk_mid_left"
	"a_SECONDARY_aimmatrix_crouch_walk_down_right"
	"a_SECONDARY_aimmatrix_crouch_walk_down_center"
	"a_SECONDARY_aimmatrix_crouch_walk_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "AttackStand_SECONDARY_Prefire" "medic_animations_anims\AttackStand_SECONDARY_Prefire.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_STAND_PREFIRE" 1
	// delta
}

$sequence "AttackStand_SECONDARY" "medic_animations_anims\AttackStand_SECONDARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_STAND_SECONDARY" 1
	loop
	// delta
}

$sequence "layer_AttackStand_SECONDARY_Postfire" "medic_animations_anims\layer_AttackStand_SECONDARY_Postfire.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_STAND_POSTFIRE" 1
	// delta
}

$sequence "AttackCrouch_SECONDARY_Prefire" "medic_animations_anims\AttackCrouch_SECONDARY_Prefire.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_Crouch_PREFIRE" 1
	// delta
}

$sequence "AttackCrouch_SECONDARY" "medic_animations_anims\AttackCrouch_SECONDARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_Crouch_SECONDARY" 1
	loop
	// delta
}

$sequence "AttackCrouch_SECONDARY_Postfire" "medic_animations_anims\AttackCrouch_SECONDARY_Postfire.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_Crouch_POSTFIRE" 1
	// delta
}

$sequence "AttackSwim_SECONDARY" "medic_animations_anims\AttackSwim_SECONDARY.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_SWIM_SECONDARY" 1
	// delta
}

$sequence "MELEE_aimmatrix_idle" {
	"a_MELEE_aimmatrix_idle_straight_up"
	"a_MELEE_aimmatrix_idle_straight_up"
	"a_MELEE_aimmatrix_idle_straight_up"
	"a_MELEE_aimmatrix_idle_up_right"
	"a_MELEE_aimmatrix_idle_up_center"
	"a_MELEE_aimmatrix_idle_up_left"
	"a_MELEE_aimmatrix_idle_mid_right"
	"a_MELEE_aimmatrix_idle_mid_center"
	"a_MELEE_aimmatrix_idle_mid_left"
	"a_MELEE_aimmatrix_idle_down_right"
	"a_MELEE_aimmatrix_idle_down_center"
	"a_MELEE_aimmatrix_idle_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "MELEE_aimmatrix_run" {
	"a_MELEE_aimmatrix_run_straight_up"
	"a_MELEE_aimmatrix_run_straight_up"
	"a_MELEE_aimmatrix_run_straight_up"
	"a_MELEE_aimmatrix_run_up_right"
	"a_MELEE_aimmatrix_run_up_center"
	"a_MELEE_aimmatrix_run_up_left"
	"a_MELEE_aimmatrix_run_mid_right"
	"a_MELEE_aimmatrix_run_mid_center"
	"a_MELEE_aimmatrix_run_mid_left"
	"a_MELEE_aimmatrix_run_down_right"
	"a_MELEE_aimmatrix_run_down_center"
	"a_MELEE_aimmatrix_run_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "MELEE_aimmatrix_crouch_idle" {
	"a_MELEE_aimmatrix_crouch_idle_straight_up"
	"a_MELEE_aimmatrix_crouch_idle_straight_up"
	"a_MELEE_aimmatrix_crouch_idle_straight_up"
	"a_MELEE_aimmatrix_crouch_idle_up_right"
	"a_MELEE_aimmatrix_crouch_idle_up_center"
	"a_MELEE_aimmatrix_crouch_idle_up_left"
	"a_MELEE_aimmatrix_crouch_idle_mid_right"
	"a_MELEE_aimmatrix_crouch_idle_mid_center"
	"a_MELEE_aimmatrix_crouch_idle_mid_left"
	"a_MELEE_aimmatrix_crouch_idle_down_right"
	"a_MELEE_aimmatrix_crouch_idle_down_center"
	"a_MELEE_aimmatrix_crouch_idle_down_left"
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
	blendwidth 3
	blend "body_yaw" 45 -45
	blend "body_pitch" 90 -45
}

$sequence "layer_AttackStandMelee_arms" "medic_animations_anims\layer_AttackStandMelee_arms.smd" {
	fps 30
	hidden
}

$sequence "layer_AttackStandMelee_runW_arms" "medic_animations_anims\layer_AttackStandMelee_runW_arms.smd" {
	fps 30
	hidden
}

$sequence "layer_melee_swing" "medic_animations_anims\layer_melee_swing.smd" {
	fps 30
	// subtract "a_reference" 0
	// delta
	blendlayer "layer_AttackStandMelee_arms" 0 0.133333 0.8 1 spline
}

$sequence "layer_melee_swing_runW" "medic_animations_anims\layer_melee_swing_runW.smd" {
	fps 30
	// subtract "a_reference" 0
	// delta
	blendlayer "layer_AttackStandMelee_runW_arms" 0 0.133333 0.766667 0.9 spline
}

$sequence "MELEE_swing" "medic_animations_anims\MELEE_swing.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_STAND_MELEE" 1
	blendlayer "layer_melee_swing" -0.8 -0.6 1 2 spline poseparameter move_y
	blendlayer "layer_melee_swing_runW" -2 -1 -0.6 -0.2 spline poseparameter move_y
}

$sequence "armslayer_melee_Crouch_swing" "medic_animations_anims\armslayer_melee_Crouch_swing.smd" {
	fps 30
	hidden
}

$sequence "bodylayer_Melee_Crouch_Swing" "medic_animations_anims\bodylayer_Melee_Crouch_Swing.smd" {
	fps 30
	// subtract "a_reference" 0
	// delta
	hidden
}

$sequence "Melee_Crouch_Swing" "medic_animations_anims\Melee_Crouch_Swing.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_CROUCH_MELEE" 1
	// addlayer "bodylayer_Melee_Crouch_Swing"
	// addlayer "armslayer_melee_Crouch_swing"
}

$sequence "layerBlend_attackSwimMelee_S_arms" "medic_animations_anims\layerBlend_attackSwimMelee_S_arms.smd" {
	fps 30
	hidden
}

$sequence "layer_AttackSwimMelee_S_arms" "medic_animations_anims\layer_AttackSwimMelee_S_arms.smd" {
	fps 30
	// subtract "a_reference" 0
	// addlayer "layerBlend_attackSwimMelee_S_arms"
}

$sequence "AttackSwim_MELEE" "medic_animations_anims\AttackSwim_MELEE.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_ATTACK_SWIM_MELEE" 1
	// addlayer "bodylayer_Melee_Crouch_Swing"
	blendlayer "armslayer_melee_Crouch_swing" 0.2 0.3 1 2 spline poseparameter move_x
	blendlayer "layer_AttackSwimMelee_S_arms" -2 -1 0.2 0.3 spline poseparameter move_x
}

$sequence "layer_idleNoise" "medic_animations_anims\layer_idleNoise.smd" {
	fps 30
	// subtract "a_reference" 0
	loop
	// delta
	realtime
	hidden
}

$sequence "Stand_PRIMARY" "medic_animations_anims\Stand_PRIMARY.smd" {
	fps 30
	"ACT_IDLE" 1
	loop
	// addlayer "PRIMARY_aimmatrix_idle"
}

$sequence "Stand_SECONDARY" "medic_animations_anims\Stand_SECONDARY.smd" {
	fps 30
	"ACT_MP_STAND_SECONDARY" 1
	loop
	// addlayer "SECONDARY_aimmatrix_idle"
	// addlayer "layer_idleNoise"
}

$sequence "Stand_MELEE" "medic_animations_anims\Stand_MELEE.smd" {
	fps 30
	"ACT_MP_STAND_MELEE" 1
	loop
	// addlayer "MELEE_aimmatrix_idle"
	// addlayer "layer_idleNoise"
}

$sequence "Crouch_PRIMARY" "medic_animations_anims\Crouch_PRIMARY.smd" {
	fps 30
	"ACT_MP_CROUCH_PRIMARY" 1
	loop
	// addlayer "PRIMARY_aimmatrix_crouch_idle"
	// addlayer "layer_idleNoise"
}

$sequence "Crouch_SECONDARY" "medic_animations_anims\Crouch_SECONDARY.smd" {
	fps 30
	"ACT_MP_CROUCH_SECONDARY" 1
	loop
	// addlayer "SECONDARY_aimmatrix_crouch_idle"
	// addlayer "layer_idleNoise"
}

$sequence "Crouch_MELEE" "medic_animations_anims\Crouch_MELEE.smd" {
	fps 30
	"ACT_MP_CROUCH_MELEE" 1
	loop
	// addlayer "MELEE_aimmatrix_idle"
	// addlayer "layer_idleNoise"
}

$sequence "s_swimAlign_SECONDARY" {
	"a_swimCenter_SECONDARY"
	fps 30
	loop
}

$sequence "Swim_SECONDARY" {
	"a_swimSW_SECONDARY"
	"a_swimS_SECONDARY"
	"a_swimSE_SECONDARY"
	"a_swimW_SECONDARY"
	"a_swimCenter_SECONDARY"
	"a_swimE_SECONDARY"
	"a_swimNW_SECONDARY"
	"a_swimN_SECONDARY"
	"a_swimNE_SECONDARY"
	fps 30
	"ACT_MP_SWIM_SECONDARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "SECONDARY_aimmatrix_idle"
}

$sequence "s_swimAlign_PRIMARY" {
	"a_swimCenter_PRIMARY"
	fps 30
	loop
}

$sequence "Swim_PRIMARY" {
	"a_swimSW_PRIMARY"
	"a_swimS_PRIMARY"
	"a_swimSE_PRIMARY"
	"a_swimW_PRIMARY"
	"a_swimCenter_PRIMARY"
	"a_swimE_PRIMARY"
	"a_swimNW_PRIMARY"
	"a_swimN_PRIMARY"
	"a_swimNE_PRIMARY"
	fps 30
	"ACT_MP_SWIM_PRIMARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "PRIMARY_aimmatrix_idle"
}

$sequence "s_swimAlign_MELEE" {
	"a_swimCenter_MELEE"
	fps 30
	loop
}

$sequence "Swim_MELEE" {
	"a_swimSW_MELEE"
	"a_swimS_MELEE"
	"a_swimSE_MELEE"
	"a_swimW_MELEE"
	"a_swimCenter_MELEE"
	"a_swimE_MELEE"
	"a_swimNW_MELEE"
	"a_swimN_MELEE"
	"a_swimNE_MELEE"
	fps 30
	"ACT_MP_SWIM_MELEE" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "MELEE_aimmatrix_idle"
}

$sequence "Run_PRIMARY" {
	"a_runSW_PRIMARY"
	"a_runS_PRIMARY"
	"a_runSE_PRIMARY"
	"a_runW_PRIMARY"
	"a_runCenter_PRIMARY"
	"a_runE_PRIMARY"
	"a_runNW_PRIMARY"
	"a_runN_PRIMARY"
	"a_runNE_PRIMARY"
	fps 30
	"ACT_RUN" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	//blend "move_yaw" -180.0 180.0
	node 1
	// addlayer "PRIMARY_aimmatrix_idle"
	//{ event 7001 1.00000000745058 "left" }
	//{ event 7001 10.0000004768372 "right" }
}

$sequence "crouch_walk_PRIMARY" {
	"a_crouch_walkSW_PRIMARY"
	"a_crouch_walkS_PRIMARY"
	"a_crouch_walkSE_PRIMARY"
	"a_crouch_walkW_PRIMARY"
	"a_crouch_walkCenter_PRIMARY"
	"a_crouch_walkE_PRIMARY"
	"a_crouch_walkNW_PRIMARY"
	"a_crouch_walkN_PRIMARY"
	"a_crouch_walkNE_PRIMARY"
	fps 30
	"ACT_MP_CROUCHWALK_PRIMARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "PRIMARY_aimmatrix_idle"
}

$sequence "Run_SECONDARY" {
	"a_runSW_SECONDARY"
	"a_runS_SECONDARY"
	"a_runSE_secondary"
	"a_runW_SECONDARY"
	"a_runCenter_SECONDARY"
	"a_runE_SECONDARY"
	"a_runNW_SECONDARY"
	"a_runN_SECONDARY"
	"a_runNE_SECONDARY"
	fps 30
	"ACT_MP_RUN_SECONDARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "SECONDARY_aimmatrix_run"
	{ event 7001 1.00000000745058 "left" }
	{ event 7001 10.0000004768372 "right" }
}

$sequence "Crouch_Walk_SECONDARY" {
	"a_crouch_walkSW_Crouch_Walk_SECONDARY"
	"a_crouch_walkS_Crouch_Walk_SECONDARY"
	"a_crouch_walkSE_Crouch_Walk_SECONDARY"
	"a_crouch_walkW_Crouch_Walk_SECONDARY"
	"a_crouch_walkCenter_Crouch_Walk_SECONDARY"
	"a_crouch_walkE_Crouch_Walk_SECONDARY"
	"a_crouch_walkNW_Crouch_Walk_SECONDARY"
	"a_crouch_walkN_Crouch_Walk_SECONDARY"
	"a_crouch_walkNE_Crouch_Walk_SECONDARY"
	fps 30
	"ACT_MP_CROUCHWALK_SECONDARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "SECONDARY_aimmatrix_crouch_walk"
}

$sequence "Run_MELEE" {
	"a_runSW_MELEE"
	"a_runS_MELEE"
	"a_runSE_MELEE"
	"a_runW_MELEE"
	"a_runCenter_MELEE"
	"a_runE_MELEE"
	"a_runNW_MELEE"
	"a_runN_MELEE"
	"a_runNE_MELEE"
	fps 30
	"ACT_MP_RUN_MELEE" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "MELEE_aimmatrix_idle"
	{ event 7001 1.00000000745058 "left" }
	{ event 7001 10.0000004768372 "right" }
}

$sequence "Crouch_Walk_MELEE" {
	"a_crouch_walkSW_Crouch_Walk_MELEE"
	"a_crouch_walkS_Crouch_Walk_MELEE"
	"a_crouch_walkSE_Crouch_Walk_MELEE"
	"a_crouch_walkW_Crouch_Walk_MELEE"
	"a_crouch_walkCenter_Crouch_Walk_MELEE"
	"a_crouch_walkE_Crouch_Walk_MELEE"
	"a_crouch_walkNW_Crouch_Walk_MELEE"
	"a_crouch_walkN_Crouch_Walk_MELEE"
	"a_crouch_walkNE_Crouch_Walk_MELEE"
	fps 30
	"ACT_MP_CROUCHWALK_MELEE" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "MELEE_aimmatrix_idle"
}

$sequence "Jump_MELEE" "medic_animations_anims\Jump_MELEE.smd" {
	fps 30
	"ACT_MP_JUMP_MELEE" 1
	// addlayer "MELEE_aimmatrix_idle"
}

$sequence "Jump_Start_primary" {
	"a_jumpStart_SW_primary"
	"a_jumpStart_S_primary"
	"a_jumpStart_SE_primary"
	"a_jumpStart_W_primary"
	"a_jumpStart_primary"
	"a_jumpStart_E_primary"
	"a_jumpStart_NW_primary"
	"a_jumpStart_N_primary"
	"a_jumpStart_NE_primary"
	fps 30
	"ACT_MP_JUMP_START_primary" 1
	blend "move_y" -1 1
	blend "move_x" -1 1
}

$sequence "layer_primary_jump_floatNoise" "medic_animations_anims\layer_primary_jump_floatNoise.smd" {
	fps 30
	// subtract "a_reference" 0
	// delta
	realtime
}

$sequence "Jump_Float_primary" {
	"a_jumpFloat_SW_primary"
	"a_jumpFloat_S_primary"
	"a_jumpFloat_SE_primary"
	"a_jumpFloat_W_primary"
	"a_jumpFloat_primary"
	"a_jumpFloat_E_primary"
	"a_jumpFloat_NW_primary"
	"a_jumpFloat_N_primary"
	"a_jumpFloat_NE_primary"
	fps 30
	"ACT_MP_JUMP_FLOAT_primary" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "PRIMARY_aimmatrix_idle"
	// addlayer "layer_primary_jump_floatNoise"
}

$sequence "jumpLand_primary" "medic_animations_anims\jumpLand_primary.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_JUMP_LAND_primary" 1
	// delta
}

$sequence "Jump_Start_secondary" {
	"a_jumpStart_SW_secondary"
	"a_jumpStart_S_secondary"
	"a_jumpStart_SE_secondary"
	"a_jumpStart_W_secondary"
	"a_jumpStart_secondary"
	"a_jumpStart_E_secondary"
	"a_jumpStart_NW_secondary"
	"a_jumpStart_N_secondary"
	"a_jumpStart_NE_secondary"
	fps 30
	"ACT_MP_JUMP_START_SECONDARY" 1
	blend "move_y" -1 1
	blend "move_x" -1 1
}

$sequence "Jump_Float_secondary" {
	"a_jumpFloat_SW_secondary"
	"a_jumpFloat_S_secondary"
	"a_jumpFloat_SE_secondary"
	"a_jumpFloat_W_secondary"
	"a_jumpFloat_secondary"
	"a_jumpFloat_E_secondary"
	"a_jumpFloat_NW_secondary"
	"a_jumpFloat_N_secondary"
	"a_jumpFloat_NE_secondary"
	fps 30
	"ACT_MP_JUMP_FLOAT_SECONDARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "SECONDARY_aimmatrix_idle"
	// addlayer "layer_primary_jump_floatNoise"
}

$sequence "jumpLand_secondary" "medic_animations_anims\jumpLand_secondary.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_JUMP_LAND_SECONDARY" 1
	// delta
}

$sequence "Jump_Start_melee" {
	"a_jumpStart_SW_melee"
	"a_jumpStart_S_melee"
	"a_jumpStart_SE_melee"
	"a_jumpStart_W_melee"
	"a_jumpStart_melee"
	"a_jumpStart_E_melee"
	"a_jumpStart_NW_melee"
	"a_jumpStart_N_melee"
	"a_jumpStart_NE_melee"
	fps 30
	"ACT_MP_JUMP_START_melee" 1
	blend "move_y" -1 1
	blend "move_x" -1 1
}

$sequence "Jump_Float_melee" {
	"a_jumpFloat_SW_melee"
	"a_jumpFloat_S_melee"
	"a_jumpFloat_SE_melee"
	"a_jumpFloat_W_melee"
	"a_jumpFloat_melee"
	"a_jumpFloat_E_melee"
	"a_jumpFloat_NW_melee"
	"a_jumpFloat_N_melee"
	"a_jumpFloat_NE_melee"
	fps 30
	"ACT_MP_JUMP_FLOAT_melee" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "MELEE_aimmatrix_idle"
	// addlayer "layer_primary_jump_floatNoise"
}

$sequence "jumpLand_melee" "medic_animations_anims\jumpLand_melee.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_JUMP_LAND_melee" 1
	// delta
}

$sequence "layer_airwalkXtraNoise" "medic_animations_anims\layer_airwalkXtraNoise.smd" {
	fps 30
	// subtract "a_reference" 0
	loop
	// delta
	realtime
}

$sequence "airwalk_primary" {
	"a_jumpFloat_SW_primary"
	"a_jumpFloat_S_primary"
	"a_jumpFloat_SE_primary"
	"a_jumpFloat_W_primary"
	"a_jumpFloat_primary"
	"a_jumpFloat_E_primary"
	"a_jumpFloat_NW_primary"
	"a_jumpFloat_N_primary"
	"a_jumpFloat_NE_primary"
	fps 30
	"ACT_MP_AIRWALK_PRIMARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "PRIMARY_aimmatrix_idle"
	// addlayer "layer_airwalkXtraNoise"
}

$sequence "airwalk_secondary" {
	"a_jumpFloat_SW_secondary"
	"a_jumpFloat_S_secondary"
	"a_jumpFloat_SE_secondary"
	"a_jumpFloat_W_secondary"
	"a_jumpFloat_secondary"
	"a_jumpFloat_E_secondary"
	"a_jumpFloat_NW_secondary"
	"a_jumpFloat_N_secondary"
	"a_jumpFloat_NE_secondary"
	fps 30
	"ACT_MP_AIRWALK_SECONDARY" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "SECONDARY_aimmatrix_idle"
	// addlayer "layer_airwalkXtraNoise"
}

$sequence "airwalk_melee" {
	"a_jumpFloat_SW_melee"
	"a_jumpFloat_S_melee"
	"a_jumpFloat_SE_melee"
	"a_jumpFloat_W_melee"
	"a_jumpFloat_melee"
	"a_jumpFloat_E_melee"
	"a_jumpFloat_NW_melee"
	"a_jumpFloat_N_melee"
	"a_jumpFloat_NE_melee"
	fps 30
	"ACT_MP_AIRWALK_MELEE" 1
	loop
	blend "move_y" -1 1
	blend "move_x" -1 1
	// addlayer "MELEE_aimmatrix_idle"
	// addlayer "layer_airwalkXtraNoise"
}

$sequence "layer_taunt01" "medic_animations_anims\layer_taunt01.smd" {
	fps 30
	hidden
}

$sequence "taunt01" "medic_animations_anims\taunt01.smd" {
	fps 30
	// subtract "a_reference" 0
	// addlayer "layer_taunt01"
	{ event AE_CL_PLAYSOUND 40.0000011920929 "Taunt.MedicGloveStretch" }
	{ event AE_CL_PLAYSOUND 89.0000009536743 "Taunt.MedicGloveSnap" }
	{ event AE_WPN_HIDE 1.00000005215406 "" }
	{ event AE_WPN_UNHIDE 120 "" }
}

$sequence "layer_taunt02" "medic_animations_anims\layer_taunt02.smd" {
	fps 30
	hidden
}

$sequence "taunt02" "medic_animations_anims\taunt02.smd" {
	fps 30
	// subtract "a_reference" 0
	// addlayer "layer_taunt02"
	{ event AE_WPN_HIDE 1.00000002421439 "" }
	{ event AE_WPN_UNHIDE 75 "" }
}

$sequence "layer_taunt03" "medic_animations_anims\layer_taunt03.smd" {
	fps 30
	hidden
}

$sequence "taunt03" "medic_animations_anims\taunt03.smd" {
	fps 30
	// subtract "a_reference" 0
	// addlayer "layer_taunt03"
	{ event AE_CL_PLAYSOUND 22.0000004768372 "Taunt.MedicViolin" }
}

$sequence "layer_gesture_primary_go_armL" "medic_animations_anims\layer_gesture_primary_go_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_primary_go" "medic_animations_anims\gesture_primary_go.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_FINGERPOINT_PRIMARY" 1
	// delta
	// addlayer "layer_gesture_primary_go_armL"
}

$sequence "layer_gesture_primary_help_armL" "medic_animations_anims\layer_gesture_primary_help_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_primary_help" "medic_animations_anims\gesture_primary_help.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_HANDMOUTH_PRIMARY" 1
	// delta
	// addlayer "layer_gesture_primary_help_armL"
}

$sequence "layer_gesture_primary_cheer_armL" "medic_animations_anims\layer_gesture_primary_cheer_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_primary_cheer" "medic_animations_anims\gesture_primary_cheer.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_FISTPUMP_PRIMARY" 1
	// delta
	// addlayer "layer_gesture_primary_cheer_armL"
}

$sequence "layer_gesture_primary_positive_armL" "medic_animations_anims\layer_gesture_primary_positive_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_primary_positive" "medic_animations_anims\gesture_primary_positive.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_THUMBSUP_PRIMARY" 1
	// delta
	// addlayer "layer_gesture_primary_positive_armL"
}

$sequence "layer_gesture_secondary_go_armR" "medic_animations_anims\layer_gesture_secondary_go_armR.smd" {
	fps 30
	hidden
}

$sequence "gesture_secondary_go" "medic_animations_anims\gesture_secondary_go.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_FINGERPOINT_SECONDARY" 1
	// delta
	blendlayer "layer_gesture_secondary_go_armR" 0 0.133333 0.866667 1 spline
}

$sequence "layer_gesture_secondary_help_armR" "medic_animations_anims\layer_gesture_secondary_help_armR.smd" {
	fps 30
	hidden
}

$sequence "gesture_secondary_help" "medic_animations_anims\gesture_secondary_help.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_HANDMOUTH_SECONDARY" 1
	// delta
	// addlayer "layer_gesture_secondary_help_armR"
}

$sequence "layer_gesture_secondary_positive_armR" "medic_animations_anims\layer_gesture_secondary_positive_armR.smd" {
	fps 30
	hidden
}

$sequence "gesture_secondary_positive" "medic_animations_anims\gesture_secondary_positive.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_THUMBSUP_SECONDARY" 1
	// delta
	// addlayer "layer_gesture_secondary_positive_armR"
}

$sequence "layer_gesture_secondary_cheer_armR" "medic_animations_anims\layer_gesture_secondary_cheer_armR.smd" {
	fps 30
	hidden
}

$sequence "gesture_secondary_cheer" "medic_animations_anims\gesture_secondary_cheer.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_FISTPUMP_SECONDARY" 1
	// delta
	// addlayer "layer_gesture_secondary_cheer_armR"
}

$sequence "layer_gesture_melee_go_armL" "medic_animations_anims\layer_gesture_melee_go_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_melee_go" "medic_animations_anims\gesture_melee_go.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_FINGERPOINT_MELEE" 1
	// delta
	// addlayer "layer_gesture_melee_go_armL"
}

$sequence "layer_gesture_melee_help_armL" "medic_animations_anims\layer_gesture_melee_help_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_melee_help" "medic_animations_anims\gesture_melee_help.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_HANDMOUTH_MELEE" 1
	// delta
	// addlayer "layer_gesture_melee_help_armL"
}

$sequence "layer_gesture_melee_cheer_armL" "medic_animations_anims\layer_gesture_melee_cheer_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_melee_cheer" "medic_animations_anims\gesture_melee_cheer.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_FISTPUMP_MELEE" 1
	// delta
	// addlayer "layer_gesture_melee_cheer_armL"
}

$sequence "layer_gesture_melee_positive_armL" "medic_animations_anims\layer_gesture_melee_positive_armL.smd" {
	fps 30
	hidden
}

$sequence "gesture_melee_positive" "medic_animations_anims\gesture_melee_positive.smd" {
	fps 30
	// subtract "a_reference" 0
	"ACT_MP_GESTURE_VC_THUMBSUP_MELEE" 1
	// delta
	// addlayer "layer_gesture_melee_positive_armL"
}

$sequence "SelectionMenu_StartPose" "medic_animations_anims\SelectionMenu_StartPose.smd" {
	fps 30
}

$sequence "SelectionMenu_Anim01" "medic_animations_anims\SelectionMenu_Anim01.smd" {
	fps 30
	{ event AE_CL_PLAYSOUND 29.0000009536743 "Selection.MedicFootStomp" }
	{ event AE_CL_PLAYSOUND 30 "Selection.MedicFootSlide" }
	{ event AE_CL_PLAYSOUND 43.0000019073486 "Selection.MedicHeelClick" }
}

$sequence "SelectionMenu_Idle" "medic_animations_anims\SelectionMenu_Idle.smd" {
	fps 30
	loop
}

$ikchain "rhand" "bip_hand_R" knee 0 0 0
$ikchain "lhand" "bip_hand_L" knee 0 0 0
$ikchain "rfoot" "bip_foot_R" knee 0.57 0 0.821
$ikchain "lfoot" "bip_foot_L" knee 0.531 0.847 0
$ikchain "medicHose" "joint_hose05" knee 0.467 -0.874 0.136

$collisionjoints "medic_physics.smd"
{
	$mass 100
	$inertia 10
	$damping 0
	$rotdamping 7
	$rootbone "bip_pelvis"

	$jointrotdamping "bip_pelvis" 0

	$jointmassbias "prp_coat_front_1_R" 0.75
	$jointconstrain "prp_coat_front_1_R" x limit -10 22 0
	$jointconstrain "prp_coat_front_1_R" y limit -19 25 0
	$jointconstrain "prp_coat_front_1_R" z limit -17 15 0

	$jointmassbias "prp_coat_back_1_R" 0.75
	$jointconstrain "prp_coat_back_1_R" x limit -10 22 0
	$jointconstrain "prp_coat_back_1_R" y limit -19 25 0
	$jointconstrain "prp_coat_back_1_R" z limit -17 10 0

	$jointmassbias "prp_coat_back_2_R" 0.75
	$jointconstrain "prp_coat_back_2_R" x limit -10 22 0
	$jointconstrain "prp_coat_back_2_R" y limit -19 25 0
	$jointconstrain "prp_coat_back_2_R" z limit -17 24 0

	$jointmassbias "prp_coat_back_1_M" 0.75
	$jointconstrain "prp_coat_back_1_M" x limit -3 22 0
	$jointconstrain "prp_coat_back_1_M" y limit -35 35 0
	$jointconstrain "prp_coat_back_1_M" z limit -18 18 0

	$jointmassbias "prp_coat_back_2_M" 0.75
	$jointconstrain "prp_coat_back_2_M" x limit -3 22 0
	$jointconstrain "prp_coat_back_2_M" y limit -19 25 0
	$jointconstrain "prp_coat_back_2_M" z limit -17 24 0

	$jointmassbias "prp_coat_back_1_L" 0.75
	$jointconstrain "prp_coat_back_1_L" x limit -10 22 0
	$jointconstrain "prp_coat_back_1_L" y limit -19 25 0
	$jointconstrain "prp_coat_back_1_L" z limit -17 24 0

	$jointmassbias "prp_coat_back_2_L" 0.75
	$jointconstrain "prp_coat_back_2_L" x limit -18 25 0
	$jointconstrain "prp_coat_back_2_L" y limit -19 25 0
	$jointconstrain "prp_coat_back_2_L" z limit -17 24 0

	$jointmassbias "prp_coat_front_1_L" 0.75
	$jointconstrain "prp_coat_front_1_L" x limit -10 22 0
	$jointconstrain "prp_coat_front_1_L" y limit -35 30 0
	$jointconstrain "prp_coat_front_1_L" z limit -10 24 0

	$jointmassbias "prp_coat_front_2_L" 0.75
	$jointconstrain "prp_coat_front_2_L" x limit -10 22 0
	$jointconstrain "prp_coat_front_2_L" y limit -19 25 0
	$jointconstrain "prp_coat_front_2_L" z limit -17 24 0

	$jointmassbias "bip_hip_R" 0.8
	$jointrotdamping "bip_hip_R" 4
	$jointconstrain "bip_hip_R" x limit -20 30 0
	$jointconstrain "bip_hip_R" y limit -15 15 0
	$jointconstrain "bip_hip_R" z limit -12 80 0

	$jointmassbias "bip_knee_R" 1.2
	$jointrotdamping "bip_knee_R" 3
	$jointconstrain "bip_knee_R" x limit 0 0 0
	$jointconstrain "bip_knee_R" y limit -8 25 0
	$jointconstrain "bip_knee_R" z limit 0 0 0

	$jointmassbias "prp_coat_front_2_R" 0.75
	$jointconstrain "prp_coat_front_2_R" x limit -10 22 0
	$jointconstrain "prp_coat_front_2_R" y limit -19 25 0
	$jointconstrain "prp_coat_front_2_R" z limit -25 15 0

	$jointmassbias "bip_hip_L" 0.8
	$jointrotdamping "bip_hip_L" 4
	$jointconstrain "bip_hip_L" x limit -20 30 0
	$jointconstrain "bip_hip_L" y limit -79 24 0
	$jointconstrain "bip_hip_L" z limit -12 20 0

	$jointmassbias "bip_knee_L" 1.2
	$jointrotdamping "bip_knee_L" 3
	$jointconstrain "bip_knee_L" x limit 0 0 0
	$jointconstrain "bip_knee_L" y limit 0 0 0
	$jointconstrain "bip_knee_L" z limit -25 8 0

	$jointmassbias "bip_foot_L" 0.75
	$jointconstrain "bip_foot_L" x limit -15 30 0
	$jointconstrain "bip_foot_L" y limit -19 25 0
	$jointconstrain "bip_foot_L" z limit -17 24 0

	$jointmassbias "bip_spine_1" 1.6
	$jointrotdamping "bip_spine_1" 12
	$jointconstrain "bip_spine_1" x limit -30 30 0
	$jointconstrain "bip_spine_1" y limit -16 16 0
	$jointconstrain "bip_spine_1" z limit -20 15 0

	$jointmassbias "bip_upperArm_R" 0.8
	$jointrotdamping "bip_upperArm_R" 16
	$jointconstrain "bip_upperArm_R" x limit -50 40 0
	$jointconstrain "bip_upperArm_R" y limit -32 55 0
	$jointconstrain "bip_upperArm_R" z limit -80 25 0

	$jointmassbias "bip_lowerArm_R" 1.8
	$jointrotdamping "bip_lowerArm_R" 4
	$jointconstrain "bip_lowerArm_R" x limit 0 0 0
	$jointconstrain "bip_lowerArm_R" y limit 0 0 0
	$jointconstrain "bip_lowerArm_R" z limit -120 12 0

	$jointmassbias "bip_upperArm_L" 0.8
	$jointrotdamping "bip_upperArm_L" 16
	$jointconstrain "bip_upperArm_L" x limit -40 50 0
	$jointconstrain "bip_upperArm_L" y limit -15 48 0
	$jointconstrain "bip_upperArm_L" z limit -35 70 0

	$jointmassbias "bip_lowerArm_L" 1.8
	$jointrotdamping "bip_lowerArm_L" 4
	$jointconstrain "bip_lowerArm_L" x limit -25 25 0
	$jointconstrain "bip_lowerArm_L" y limit -110 13 0
	$jointconstrain "bip_lowerArm_L" z limit 0 0 0

	$jointmassbias "bip_head" 1.5
	$jointrotdamping "bip_head" 8
	$jointconstrain "bip_head" x limit -44 20 0
	$jointconstrain "bip_head" y limit -35 35 0
	$jointconstrain "bip_head" z limit -26 30 0

	$jointmassbias "bip_hand_R" 0.6
	$jointrotdamping "bip_hand_R" 8
	$jointconstrain "bip_hand_R" x limit -10 30 0
	$jointconstrain "bip_hand_R" y limit -8 30 0
	$jointconstrain "bip_hand_R" z limit -20 40 0

	$jointmassbias "bip_foot_R" 0.75
	$jointconstrain "bip_foot_R" x limit -10 22 0
	$jointconstrain "bip_foot_R" y limit -19 25 0
	$jointconstrain "bip_foot_R" z limit -17 24 0
}

$bonemerge "bip_pelvis"
$bonemerge "bip_spine_0"
$bonemerge "bip_spine_1"
$bonemerge "bip_spine_2"
$bonemerge "bip_spine_3"
$bonemerge "bip_collar_L"
$bonemerge "bip_upperArm_L"
$bonemerge "bip_lowerArm_L"
$bonemerge "bip_collar_R"
$bonemerge "bip_upperArm_R"
$bonemerge "bip_lowerArm_R"
$bonemerge "bip_hand_L"
$bonemerge "bip_hand_R"
$bonemerge "weapon_bone_L"
$bonemerge "joint_lever"
$bonemerge "joint_hose01"
$bonemerge "joint_hose02"
$bonemerge "joint_hose03"
$bonemerge "joint_hose04"
$bonemerge "joint_hose05"
$bonemerge "weapon_bone"
$bonemerge "weapon_bone_1"
