$modelname "resources/resource_chunk_b.mdl"
$cdmaterials "models/resources/"

$scale	4

$body "studio" "resource_chunk_b.smd"

$surfaceprop "flesh"

$contents solid

$sequence "Idle" "resource_chunk_b.smd" fps 30.00 loop ACT_IDLE 1 

$collisionmodel "resource_chunk_b_phys.smd"
{
	$mass 80.0
}