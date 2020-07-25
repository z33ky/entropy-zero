#include "cbase.h"
#include "c_tf_basecombatweapon.h"
#include "c_weapon__stubs.h"
#include "weapon_basecombatobject.h"

// TODO for 12/22/02
// weapon_limpetmine
// weapon_builder:  don't do yet, waiting for Robin to change out UI

// TODO: Remove these two as well at some stage, as they're just legacy crap
STUB_WEAPON_CLASS( foo_weapon_machinegun, MachineGun, C_BaseCombatWeapon );
STUB_WEAPON_CLASS( weapon_plasmarifle, WeaponPlasmaRifle, C_TFMachineGun );

STUB_WEAPON_CLASS( cycler_weapon, WeaponCycler, C_BaseCombatWeapon );
STUB_WEAPON_CLASS( weapon_cubemap, WeaponCubemap, C_BaseCombatWeapon );