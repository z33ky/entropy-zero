//========= Copyright Valve Corporation, All rights reserved. ============//
//
// Purpose:		ManhackToss - Manhack weapon - Breadman
//
// $NoKeywords: $
//=============================================================================//

#include "cbase.h"
#include "npcevent.h"
#include "basehlcombatweapon.h"
#include "basecombatcharacter.h"
#include "ai_basenpc.h"
#include "player.h"
#include "npc_manhack.h"
#include "gamerules.h"
#include "in_buttons.h"
#include "soundent.h"
#include "game.h"
#include "vstdlib/random.h"
#include "gamestats.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

// Like CTraceFilterSimple, except it only filters just a single entity, no owner entities
class CTraceFilterSingle : public CTraceFilter
{
public:
	// It does have a base, but we'll never network anything below here..
	DECLARE_CLASS_NOBASE( CTraceFilterSingle );

	CTraceFilterSingle( const IHandleEntity *passedict, int collisionGroup )
	{
		m_pPassEnt = passedict;
		m_collisionGroup = collisionGroup;
	}

	virtual bool ShouldHitEntity( IHandleEntity *pHandleEntity, int contentsMask )
	{
		if ( !StandardFilterRules( pHandleEntity, contentsMask ) )
			return false;

		if ( m_pPassEnt == pHandleEntity )
		{
			return false;
		}

		// Don't test if the game code tells us we should ignore this collision...
		CBaseEntity *pEntity = EntityFromEntityHandle( pHandleEntity );
		if ( !pEntity )
			return false;
		if ( !pEntity->ShouldCollide( m_collisionGroup, contentsMask ) )
			return false;
		if ( pEntity && !g_pGameRules->ShouldCollide( m_collisionGroup, pEntity->GetCollisionGroup() ) )
			return false;

		return true;
	}

private:
	const IHandleEntity *m_pPassEnt;
	int m_collisionGroup;

};

//-----------------------------------------------------------------------------
// CWeaponManhackToss
//-----------------------------------------------------------------------------

class CWeaponManhackToss : public CBaseHLCombatWeapon
{
	DECLARE_DATADESC();

public:
	DECLARE_CLASS(CWeaponManhackToss, CBaseHLCombatWeapon);

	CWeaponManhackToss(void);

	DECLARE_SERVERCLASS();

	void	Precache(void);
	void	ItemPostFrame(void);
	void	PrimaryAttack(void);
	void	TossManhack(void);

	int		CapabilitiesGet(void) { return bits_CAP_WEAPON_RANGE_ATTACK1; }
	Activity	GetPrimaryAttackActivity(void) { return ACT_VM_THROW; }

	DECLARE_ACTTABLE();

private:
	bool m_bDeploying;
	float m_flDelayedToss;
};


IMPLEMENT_SERVERCLASS_ST(CWeaponManhackToss, DT_WeaponManhackToss)
END_SEND_TABLE()

LINK_ENTITY_TO_CLASS(weapon_manhacktoss, CWeaponManhackToss);
PRECACHE_WEAPON_REGISTER(weapon_manhacktoss);

BEGIN_DATADESC(CWeaponManhackToss)
END_DATADESC()

acttable_t	CWeaponManhackToss::m_acttable[] =
{
	//{ ACT_IDLE, ACT_IDLE_PISTOL, true },
	//{ ACT_IDLE_ANGRY, ACT_IDLE_ANGRY_PISTOL, true },
	//{ ACT_RANGE_ATTACK1, ACT_RANGE_ATTACK_PISTOL, true },
	//{ ACT_RELOAD, ACT_RELOAD_PISTOL, true },
	//{ ACT_WALK_AIM, ACT_WALK_AIM_PISTOL, true },
	//{ ACT_RUN_AIM, ACT_RUN_AIM_PISTOL, true },
	//{ ACT_GESTURE_RANGE_ATTACK1, ACT_GESTURE_RANGE_ATTACK_PISTOL, true },
	//{ ACT_RELOAD_LOW, ACT_RELOAD_PISTOL_LOW, false },
	//{ ACT_RANGE_ATTACK1_LOW, ACT_RANGE_ATTACK_PISTOL_LOW, false },
	//{ ACT_COVER_LOW, ACT_COVER_PISTOL_LOW, false },
	//{ ACT_RANGE_AIM_LOW, ACT_RANGE_AIM_PISTOL_LOW, false },
	//{ ACT_GESTURE_RELOAD, ACT_GESTURE_RELOAD_PISTOL, false },
	//{ ACT_WALK, ACT_WALK_PISTOL, false },
	//{ ACT_RUN, ACT_RUN_PISTOL, false },
	{ ACT_RANGE_ATTACK1, ACT_RANGE_ATTACK_SLAM, true }
};


IMPLEMENT_ACTTABLE(CWeaponManhackToss);

//-----------------------------------------------------------------------------
// Purpose: Constructor
//-----------------------------------------------------------------------------
CWeaponManhackToss::CWeaponManhackToss(void)
{
	m_bFiresUnderwater = true;
	m_bDeploying = false;
}

//-----------------------------------------------------------------------------
// Purpose: Precache the manhack npc ent
//-----------------------------------------------------------------------------
void CWeaponManhackToss::Precache(void)
{
	BaseClass::Precache();

	UTIL_PrecacheOther("npc_manhack");
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
void CWeaponManhackToss::ItemPostFrame(void)
{
	BaseClass::ItemPostFrame();

	if ( m_bDeploying )
	{
		if ( m_flDelayedToss != 0 && m_flDelayedToss < gpGlobals->curtime )
		{
			TossManhack();
			m_flDelayedToss = 0;
			// check if the toss was aborted
			if ( !m_bDeploying )
				return;
		}

		if ( IsViewModelSequenceFinished() )
		{
			if ( m_flDelayedToss >= gpGlobals->curtime )
			{
				DevWarning( "weapon_manhacktoss sequence was finished before manhack was tossed.\n" );
				TossManhack();
			}

			if ( !HasPrimaryAmmo() )
			{
				CBasePlayer *pPlayer = ToBasePlayer(GetOwner());
				if ( pPlayer )
				{
					pPlayer->ClearActiveWeapon();
					pPlayer->SwitchToNextBestWeapon( this );
				}
			}
			else
			{
				SendWeaponAnim( ACT_VM_DRAW );
				m_flNextPrimaryAttack = gpGlobals->curtime + SequenceDuration();
			}

			m_bDeploying = false;
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: Primary attack - Spawn the Manhack
//-----------------------------------------------------------------------------
void CWeaponManhackToss::PrimaryAttack(void)
{
	if ( m_bDeploying )
		return;
	m_bDeploying = true;

	SendWeaponAnim(ACT_VM_THROW);

	float sequenceDuration = SequenceDuration();
	m_flDelayedToss = gpGlobals->curtime + sequenceDuration * 0.49f;

	// Time we wait before allowing to throw another
	m_flNextPrimaryAttack = gpGlobals->curtime + sequenceDuration;
}

void CWeaponManhackToss::TossManhack(void)
{
	CBasePlayer *pOwner = ToBasePlayer(GetOwner());
	if (!pOwner)
		return;

	QAngle ang = pOwner->EyeAngles();

	//align manhack spawn position to viewmodel
	Vector tossOffset = Vector(13.75f, 0.5f, -1.75f);
	//correct for viewmodel movement when looking up/down
	static const Vector tossOffsetUp(15.5f, -2.5f, 0.5f);
	static const Vector tossOffsetDown(12.5f, 3.0f, -3.0f);
	float pitch = ang.x / 90;
	if ( pitch <= 0 ) {
		tossOffset = Lerp( -pitch, tossOffset, tossOffsetUp );
	} else {
		tossOffset = Lerp( pitch, tossOffset, tossOffsetDown );
	}
	Vector rotatedTossOffset;
	VectorRotate( tossOffset, ang, rotatedTossOffset );

	Vector vecSpawnPos = pOwner->Weapon_ShootPosition() + rotatedTossOffset;

	//align manhack spawn orientation to viewmodel
	{
		//the quaternion was generated via this code
#if 0
		Quaternion a, b{0, 0, 0, 1}, c;
		AxisAngleQuaternion( Vector( 0, -1, 0 ), -23, a );
		QuaternionMult( a, b, c );
		AxisAngleQuaternion( Vector( 0, 0, 1 ), -105, a );
		QuaternionMult( a, c, b );
		AxisAngleQuaternion( Vector( 0, -1, 0 ), 10, a );
		QuaternionMult( a, b, c );
		Msg( "%.10ff, %.10ff, %.10ff, %.10ff,\n", c.x, c.y, c.z, c.w );
#endif
		static const Quaternion rot{
			0.2253245115f,
			0.0689137503f,
			-0.7606828212f,
			0.6048482060f,
		};
		Quaternion angAsQuat, result;
		AngleQuaternion( ang, angAsQuat );
		QuaternionMult( angAsQuat, rot, result );
		QuaternionAngles( result, ang );
	}

	// This is where we actually make the manhack spawn
	CNPC_Manhack *PlayerManhacks = (CNPC_Manhack * )CBaseEntity::CreateNoSpawn("npc_manhack", vecSpawnPos, ang, pOwner);

	if (PlayerManhacks == NULL) { return; }

	trace_t tr;
	CTraceFilterSingle filter( pOwner, COLLISION_GROUP_NONE );
	Vector hullOffset( 1.0f ); //some additional space
	UTIL_TraceHull( PlayerManhacks->GetAbsOrigin(), pOwner->Weapon_ShootPosition(), PlayerManhacks->GetHullMins() - hullOffset, PlayerManhacks->GetHullMaxs() + hullOffset, MASK_NPCSOLID, &filter, &tr );
	if ( tr.DidHit() )
	{
		UTIL_Remove( PlayerManhacks );
		WeaponSound( EMPTY );
		SendWeaponAnim( ACT_VM_IDLE );
		m_flNextPrimaryAttack = gpGlobals->curtime + 0.25f;

		m_bDeploying = false;

		return;
	}

	PlayerManhacks->AddSpawnFlags(SF_MANHACK_PACKED_UP);
	PlayerManhacks->KeyValue("squadname", "controllable_manhack_squad");
	PlayerManhacks->Spawn();
	PlayerManhacks->Activate();
	PlayerManhacks->ShouldFollowPlayer(true);
	PlayerManhacks->SetUse(&CNPC_Manhack::PlayerPickup);

	pOwner->RemoveAmmo( 1, m_iPrimaryAmmoType );

	m_iPrimaryAttacks++;

	gamestats->Event_WeaponFired(pOwner, true, GetClassname());
}
