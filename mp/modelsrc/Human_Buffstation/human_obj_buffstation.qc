$modelname "objects/human_obj_buffstation.mdl"
$cdmaterials "models/objects/"

$body "studio" "human_obj_buffstation.smd"

$illumposition 0 0 0

$surfaceprop "metal"

$contents solid

$attachment "powerpoint" "attachpoint1" 0 0 0 rotate 0 0 0
$attachment	"playercable1" "attachpoint1" 0.00 0.00 0.00 rotate 0 90 0
$attachment "playercable2" "attachpoint2" 0.00 0.00 0.00 rotate 0 -90 0
$attachment "playercable3" "attachpoint3" 0.00 0.00 0.00 rotate -0 0 0
$attachment "playercable4" "attachpoint4" 0.00 0.00 0.00 rotate 0 180 0
$attachment "controlpanel0_ur" "stack_a1.001" 0.00 0.00 0.00 rotate -0 0 0
$attachment "controlpanel0_ll" "stack_a1" 0.00 0.00 0.00 rotate -0 0 0

$sequence "idle" "human_obj_buffstation.smd"