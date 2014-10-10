$modelname "engineer.mdl"
$cdmaterials "placeholder"
$scale 1.0
$cliptotextures
$surfaceprop "flesh"

//reference mesh(es)
$body "studio" "engineer"

$origin	0 0 -50

// 4 attachment(s)
$attachment 0 "Bip01 R Hand" 20.000000 2.000000 5.000000
$attachment 1 "Bip01 R Hand" 15.000000 1.500000 3.750000
$attachment 2 "Bip01 R Hand" 27.823200 -0.644536 3.742240
$attachment 3 "Bip01 R Hand" 29.000000 3.000000 11.000000

// 5 bone controller(s)
$controller 4 "Bone02" ZR 0.000000 15.000000
$controller 0 "Bip01 Spine" XR -30.000000 30.000000
$controller 1 "Bip01 Spine1" XR -30.000000 30.000000
$controller 2 "Bip01 Spine2" XR -30.000000 30.000000
$controller 3 "Bip01 Spine3" XR -30.000000 30.000000

// 20 hit box(es)
$hbox 3 "Bip01 Pelvis" -4.690000 -4.440000 -6.750000 4.000000 5.560000 6.750000
$hbox 6 "Bip01 L Thigh" 2.660000 -3.690000 -3.090000 18.160000 4.880000 3.310000
$hbox 6 "Bip01 L Calf" 0.380000 -3.970000 -2.840000 17.600000 4.000000 2.940000
$hbox 6 "Bip01 L Foot" -0.590000 -2.340000 -2.630000 3.790000 8.000000 2.190000
$hbox 7 "Bip01 R Thigh" 2.470000 -3.690000 -3.160000 18.129999 4.880000 3.380000
$hbox 7 "Bip01 R Calf" 0.310000 -3.970000 -2.840000 17.600000 3.940000 2.970000
$hbox 7 "Bip01 R Foot" -0.560000 -2.340000 -2.190000 3.810000 8.000000 2.660000
$hbox 3 "Bip01 Spine1" -3.250000 -5.500000 -5.500000 4.830000 5.500000 5.500000
$hbox 2 "Bip01 Spine2" -0.060000 -5.530000 -7.590000 8.000000 7.000000 7.590000
$hbox 2 "Bip01 Spine3" -2.250000 -6.810000 -6.310000 6.500000 5.090000 6.310000
$hbox 2 "Bip01 Neck" -3.110000 -1.500000 -3.000000 2.050000 3.500000 3.000000
$hbox 1 "Bip01 Head" 0.090000 -3.660000 -3.000000 8.410000 5.090000 3.000000
$hbox 4 "Bip01 L Clavicle" 0.940000 -2.880000 -4.130000 5.440000 4.280000 3.500000
$hbox 4 "Bip01 L UpperArm" -2.160000 -2.340000 -2.560000 11.560000 3.410000 2.380000
$hbox 4 "Bip01 L Forearm" 0.590000 -1.810000 -2.190000 10.750000 2.840000 2.410000
$hbox 4 "Bip01 L Hand" 0.000000 -1.000000 -2.000000 3.000000 1.500000 3.500000
$hbox 5 "Bip01 R Clavicle" 1.380000 -2.840000 -3.560000 5.690000 4.310000 4.310000
$hbox 5 "Bip01 R UpperArm" -1.880000 -2.470000 -2.160000 11.810000 3.280000 2.810000
$hbox 5 "Bip01 R Forearm" 0.440000 -1.970000 -2.340000 10.590000 2.720000 2.220000
$hbox 5 "Bip01 R Hand" 0.000000 -1.000000 -2.000000 3.000000 1.500000 3.500000

// 77 animation sequence(s)
$sequence "look_idle" "look_idle" fps 12 loop ACT_IDLE 1 
$sequence "idle" "idle" fps 14 loop ACT_IDLE 1 
$sequence "deep_idle" "deep_idle" fps 12 loop ACT_IDLE 4 
$sequence "run2" "run2" LX fps 60 loop ACT_RUN 1 
$sequence "walk2handed" "walk2handed" LX fps 60 loop ACT_WALK 1 
$sequence "2handshoot" "2handshoot" fps 20 ACT_RANGE_ATTACK1 1 
$sequence "crawl" "crawl" LX fps 30 loop ACT_CROUCH 1 
$sequence "crouch_idle" "crouch_idle" fps 10 loop ACT_CROUCHIDLE 1 
$sequence "jump" "jump" LX fps 60 ACT_HOP 1 
$sequence "long_jump" "long_jump" LX fps 30 ACT_LEAP 1 
$sequence "swim" "swim" fps 30 loop ACT_SWIM 1 
$sequence "treadwater" "treadwater" fps 24 loop ACT_HOVER 1 
$sequence "run" "run" fps 1 loop 
$sequence "walk" "walk" fps 1 loop 
$sequence "aim_2" "aim_2" fps 1 loop 
$sequence "shoot_2" "shoot_2" fps 1 loop 
$sequence "aim_1" "aim_1" fps 1 loop 
$sequence "shoot_1" "shoot_1" fps 1 loop 
$sequence "die_simple" "die_simple" fps 22 ACT_DIESIMPLE 1 { event 2001 10 } 
$sequence "die_backwards1" "die_backwards1" fps 26 ACT_DIEBACKWARD 4 { event 2001 14 } 
$sequence "die_backwards" "die_backwards" fps 30 ACT_DIEBACKWARD 1 { event 2001 15 } 
$sequence "die_forwards" "die_forwards" fps 26 ACT_DIEFORWARD 1 { event 2001 9 } 
$sequence "headshot" "headshot" fps 24 ACT_DIE_HEADSHOT 4 { event 2001 23 } 
$sequence "die_spin" "die_spin" fps 30 ACT_DIE_HEADSHOT 1 { event 2001 16 } 
$sequence "gutshot" "gutshot" fps 26 ACT_DIE_GUTSHOT 1 { event 2001 23 } 
$sequence "ref_aim_crowbar" "ref_aim_crowbar_blend1" "ref_aim_crowbar_blend2" blend XR -45 35 fps 12 loop 
$sequence "ref_shoot_crowbar" "ref_shoot_crowbar_blend1" "ref_shoot_crowbar_blend2" blend XR -45 35 fps 30 
$sequence "crouch_aim_crowbar" "crouch_aim_crowbar_blend1" "crouch_aim_crowbar_blend2" blend XR -45 35 fps 12 loop 
$sequence "crouch_shoot_crowbar" "crouch_shoot_crowbar_blend1" "crouch_shoot_crowbar_blend2" blend XR -45 35 fps 30 
$sequence "ref_aim_onehanded" "ref_aim_onehanded_blend1" "ref_aim_onehanded_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_onehanded" "ref_shoot_onehanded_blend1" "ref_shoot_onehanded_blend2" blend XR -45 35 fps 30 { event 5011 0 "21" } 
$sequence "crouch_aim_onehanded" "crouch_aim_onehanded_blend1" "crouch_aim_onehanded_blend2" blend XR -50 35 fps 5 loop 
$sequence "crouch_shoot_onehanded" "crouch_shoot_onehanded_blend1" "crouch_shoot_onehanded_blend2" blend XR -50 35 fps 30 { event 5011 0 "21" } 
$sequence "ref_aim_shotgun" "ref_aim_shotgun_blend1" "ref_aim_shotgun_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_shotgun" "ref_shoot_shotgun_blend1" "ref_shoot_shotgun_blend2" blend XR -45 35 fps 30 { event 5021 0 "51" } 
$sequence "crouch_aim_shotgun" "crouch_aim_shotgun_blend1" "crouch_aim_shotgun_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_shotgun" "crouch_shoot_shotgun_blend1" "crouch_shoot_shotgun_blend2" blend XR -45 35 fps 30 { event 5021 0 "51" } 
$sequence "ref_aim_gauss" "ref_aim_gauss" fps 1 loop 
$sequence "ref_shoot_gauss" "ref_shoot_gauss" fps 1 loop 
$sequence "crouch_aim_gauss" "crouch_aim_gauss" fps 1 loop 
$sequence "crouch_shoot_gauss" "crouch_shoot_gauss" fps 1 loop 
$sequence "ref_aim_mp5" "ref_aim_mp5_blend1" "ref_aim_mp5_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_mp5" "ref_shoot_mp5_blend1" "ref_shoot_mp5_blend2" blend XR -45 35 fps 30 loop { event 5001 0 "40" } 
$sequence "crouch_aim_mp5" "crouch_aim_mp5_blend1" "crouch_aim_mp5_blend2" blend XR -30 40 fps 5 loop 
$sequence "crouch_shoot_mp5" "crouch_shoot_mp5_blend1" "crouch_shoot_mp5_blend2" blend XR -30 40 fps 30 loop { event 5001 0 "40" } 
$sequence "ref_aim_rpg" "ref_aim_rpg_blend1" "ref_aim_rpg_blend2" blend XR -45 30 fps 5 loop 
$sequence "ref_shoot_rpg" "ref_shoot_rpg_blend1" "ref_shoot_rpg_blend2" blend XR -45 30 fps 30 
$sequence "crouch_aim_rpg" "crouch_aim_rpg_blend1" "crouch_aim_rpg_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_rpg" "crouch_shoot_rpg_blend1" "crouch_shoot_rpg_blend2" blend XR -45 35 fps 30 
$sequence "ref_aim_egon" "ref_aim_egon_blend1" "ref_aim_egon_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_egon" "ref_shoot_egon_blend1" "ref_shoot_egon_blend2" blend XR -45 35 fps 30 loop 
$sequence "crouch_aim_egon" "crouch_aim_egon_blend1" "crouch_aim_egon_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_egon" "crouch_shoot_egon_blend1" "crouch_shoot_egon_blend2" blend XR -45 35 fps 30 loop 
$sequence "ref_aim_sniper" "ref_aim_sniper_blend1" "ref_aim_sniper_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_sniper" "ref_shoot_sniper_blend1" "ref_shoot_sniper_blend2" blend XR -45 35 fps 30 { event 5021 0 "21" } 
$sequence "crouch_aim_sniper" "crouch_aim_sniper_blend1" "crouch_aim_sniper_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_sniper" "crouch_shoot_sniper_blend1" "crouch_shoot_sniper_blend2" blend XR -45 35 fps 30 { event 5021 0 "21" } 
$sequence "ref_aim_autosniper" "ref_aim_autosniper_blend1" "ref_aim_autosniper_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_autosniper" "ref_shoot_autosniper_blend1" "ref_shoot_autosniper_blend2" blend XR -45 35 fps 30 { event 5021 0 "21" } 
$sequence "crouch_aim_autosniper" "crouch_aim_autosniper_blend1" "crouch_aim_autosniper_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_autosniper" "crouch_shoot_autosniper_blend1" "crouch_shoot_autosniper_blend2" blend XR -45 35 fps 30 { event 5021 0 "21" } 
$sequence "ref_aim_medkit" "ref_aim_medkit_blend1" "ref_aim_medkit_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_medkit" "ref_shoot_medkit_blend1" "ref_shoot_medkit_blend2" blend XR -45 35 fps 30 
$sequence "crouch_aim_medkit" "crouch_aim_medkit_blend1" "crouch_aim_medkit_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_medkit" "crouch_shoot_medkit_blend1" "crouch_shoot_medkit_blend2" blend XR -65 20 fps 28 
$sequence "ref_aim_knife" "ref_aim_knife_blend1" "ref_aim_knife_blend2" blend XR -45 35 fps 5 loop 
$sequence "ref_shoot_knife" "ref_shoot_knife_blend1" "ref_shoot_knife_blend2" blend XR -45 35 fps 30 
$sequence "crouch_aim_knife" "crouch_aim_knife_blend1" "crouch_aim_knife_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_knife" "crouch_shoot_knife_blend1" "crouch_shoot_knife_blend2" blend XR -45 35 fps 30 
$sequence "ref_aim_AC" "ref_aim_AC_blend1" "ref_aim_AC_blend2" blend XR -45 30 fps 5 loop 
$sequence "ref_shoot_AC" "ref_shoot_AC_blend1" "ref_shoot_AC_blend2" blend XR -45 30 fps 30 {
  { event 5031 0 "62" } 
  { event 5031 3 "42" } 
  { event 5031 8 "72" } 
 }
$sequence "crouch_aim_AC" "crouch_aim_AC_blend1" "crouch_aim_AC_blend2" blend XR -45 35 fps 5 loop 
$sequence "crouch_shoot_AC" "crouch_shoot_AC_blend1" "crouch_shoot_AC_blend2" blend XR -45 35 fps 30 {
  { event 5031 0 "62" } 
  { event 5031 3 "42" } 
  { event 5031 4 "72" } 
 }
$sequence "deadback" "deadback" fps 10 
$sequence "deadsitting" "deadsitting" fps 10 
$sequence "deadstomach" "deadstomach" fps 10 
$sequence "deadtable" "deadtable" fps 10 

// End of QC script.
