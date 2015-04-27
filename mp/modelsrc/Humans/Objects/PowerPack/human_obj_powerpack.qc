$modelname "objects/human_obj_powerpack.mdl"
$cdmaterials "models/powerpack/"

$body "studio" "human_obj_powerpack_mesh.smd"

$illumposition 0 0 0

$surfaceprop "metal"

$contents solid

$attachment	"cablepoint1" "small_left_tesla" 0.00 0.00 0.00 rotate 0 0 0
$attachment "cablepoint2" "small_right_tesla" 0.00 0.00 0.00 rotate 0 0 0
$attachment "glow_01" "small_right_tesla" 0.00 0.00 0.00 rotate 0 0 0
$attachment "glow_02" "small_left_tesla" 0.00 0.00 0.00 rotate 0 0 0
$attachment "glow_03" "big_right_teslaend" 0.00 0.00 0.00 rotate 0 0 0
$attachment "glow_04" "big_left_teslaend" 0.00 0.00 0.00 rotate 0 0 0
//$attachment "glow_05" "small_right_tesla" 0.00 0.00 0.00 rotate 0 0 0
//$attachment "glow_06" "small_right_tesla" 0.00 0.00 0.00 rotate 0 0 0
$attachment "cablepoint3" "joint11" 0.00 0.00 0.00 rotate 0 0 0
//$attachment "controlpanel0_ll" "stack_a4" 0.00 0.00 0.00 rotate 0 0 0
//$attachment "controlpanel0_ur" "attachpoint1" 0.00 0.00 0.00 rotate 0 0 0
$attachment "Tesla_ll" "joint8" 0.00 0.00 0.00 rotate 0 0 0
$attachment "Tesla_ul" "big_left_teslaend" 0.00 0.00 0.00 rotate 0 0 0
$attachment "Tesla_lr" "joint5" 0.00 0.00 0.00 rotate 0 0 0
$attachment "Tesla_ur" "big_right_teslaend" 0.00 0.00 0.00 rotate 0 0 0

$sequence "idle" "human_obj_powerpack_.smd"