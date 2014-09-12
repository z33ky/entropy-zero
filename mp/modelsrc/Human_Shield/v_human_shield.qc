$modelname "weapons\v_human_shield.mdl"
$cdmaterials models\player\commando

$origin 0 5.0 0

$body studio "v_human_shield.smd" 

$sequence idle "v_human_shield_idle.smd" fps 30 snap activity ACT_VM_IDLE 1

$bodygroup hands
{
studio "../human_hands/v_human_hands.smd"
}