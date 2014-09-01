$modelname "objects/human_obj_powerpack.mdl"
$cdmaterials "models/powerpack/"

$body "studio" "human_obj_powerpack.smd"

$illumposition 0 0 0

$surfaceprop "metal"

$contents solid

$attachment	"playercable1" "attachpoint1" 0.00 0.00 0.00 rotate 0 90 0
$attachment "playercable2" "attachpoint2" 0.00 0.00 0.00 rotate 0 -90 0
$attachment "playercable3" "attachpoint3" 0.00 0.00 0.00 rotate -0 0 0
$attachment "controlpanel0_ll" "stack_a4" 0.00 0.00 0.00 rotate -0 0 0
$attachment "controlpanel0_ur" "attachpoint1" 0.00 0.00 0.00 rotate -0 0 0

$sequence "idle" "human_obj_powerpack.smd"