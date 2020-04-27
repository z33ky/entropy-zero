//========= Copyright © 1996-2005, Valve Corporation, All rights reserved. ============//
//
// Purpose:	Harpoon
//
// $NoKeywords: $
//=============================================================================//
#include "cbase.h"
#include "basetfplayer_shared.h"
#include "basetfcombatweapon_shared.h"
#include "in_buttons.h"
#include "engine/IEngineSound.h"

#if defined( CLIENT_DLL )
#define CWeaponHarpoon C_WeaponHarpoon
#endif

class CHarpoon; 

// Fist defines
#define	FIST_RANGE			90

#if !defined( CLIENT_DLL )

ConVar	weapon_harpoon_damage( "weapon_harpoon_damage","40", FCVAR_NONE, "Harpoon impale damage" );
ConVar	weapon_fist_damage( "weapon_fist_damage","50", FCVAR_NONE, "Fist damage to everything other than objects" );
ConVar	weapon_fist_damage_objects( "weapon_fist_damage_objects","150", FCVAR_NONE, "Fist damage to objects" );

#include "rope.h"
#include "rope_shared.h"

//-----------------------------------------------------------------------------
// Purpose: Harpoon thrown by the harpoon weapon
//-----------------------------------------------------------------------------
class CHarpoon : public CBaseAnimating
{
	DECLARE_CLASS( CHarpoon, CBaseAnimating );
public:
	DECLARE_DATADESC();
	DECLARE_SERVERCLASS();

	CHarpoon( void );
	virtual void	Spawn( void );
	virtual void	Precache( void );

	void SetHarpoonAngles( void );
	void FlyThink( void );
	void ConstrainThink( void );
	void HarpoonTouch( CBaseEntity *pOther );

	void RemoveFromImpaledTarget();

	static CHarpoon *Create( const Vector &vecOrigin, const Vector &vecForward, CBasePlayer *pOwner );
	CRopeKeyframe	*GetRope( void ) { return m_hRope; }
	void			SetRope( CRopeKeyframe *pRope ) { m_hRope = pRope; }
	CBaseEntity		*GetImpaledTarget( void ) { return m_hImpaledTarget; }
	void			SetLinkedHarpoon( CHarpoon *pLinkedHarpoon ) { m_hLinkedHarpoon = pLinkedHarpoon; }
	void			CheckLinkedHarpoon( void );
	void			ImpaleTarget( CBaseAnimating *pOther );

private:
	// Impaling
	int attachedBone{ -1 };
	CNetworkVector( m_vecOffset );
	CNetworkQAngle( m_angOffset );
	float		m_flConstrainLength;

	CHandle< CRopeKeyframe >	m_hRope;
	EHANDLE						m_hImpaledTarget;
	CHandle< CHarpoon >			m_hLinkedHarpoon;
};

LINK_ENTITY_TO_CLASS( harpoon, CHarpoon );
PRECACHE_REGISTER(harpoon);

IMPLEMENT_SERVERCLASS_ST(CHarpoon, DT_Harpoon)
	SendPropVector( SENDINFO(m_vecOffset), -1, SPROP_COORD ),
	SendPropVector( SENDINFO(m_angOffset), -1, SPROP_COORD ),
END_SEND_TABLE()

BEGIN_DATADESC( CHarpoon )
	// Function Pointers
	DEFINE_FUNCTION( HarpoonTouch ),
	DEFINE_FUNCTION( FlyThink ),
	DEFINE_FUNCTION( ConstrainThink ),
END_DATADESC()

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CHarpoon::CHarpoon( void )
{
	UseClientSideAnimation();
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CHarpoon::Spawn( void )
{
	Precache();

	SetMoveType( MOVETYPE_FLYGRAVITY, MOVECOLLIDE_FLY_CUSTOM );
	SetSolid( SOLID_BBOX );
	//m_flGravity = 1.0;
	SetFriction( 0.75 );
	SetModel( "models/harpoon.mdl" );
	UTIL_SetSize(this, Vector( -4, -4, -4), Vector(4, 4, 4));
	SetCollisionGroup( TFCOLLISION_GROUP_GRENADE );

	SetTouch(&CHarpoon::HarpoonTouch);
	SetThink(&CHarpoon::FlyThink);
	SetNextThink( gpGlobals->curtime + 0.1f );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CHarpoon::Precache( void )
{
	PrecacheModel( "models/harpoon.mdl" );

	PrecacheScriptSound( "Harpoon.Impact" );
	PrecacheScriptSound( "Harpoon.Impale" );
	PrecacheScriptSound( "Harpoon.HitFlesh" );
	PrecacheScriptSound( "Harpoon.HitMetal" );
	PrecacheScriptSound( "Harpoon.Yank" );

}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CHarpoon::SetHarpoonAngles( void )
{
	QAngle angles;
	VectorAngles( GetAbsVelocity(), angles );
	SetLocalAngles( angles );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CHarpoon::HarpoonTouch( CBaseEntity *pOther )
{
#if 0 // move this...
	// If we've stuck something, freeze. Make sure we hit it along our velocity.
	if ( pOther->GetCollisionGroup() != TFCOLLISION_GROUP_SHIELD )
	{
		// Perform the collision response...
		Vector vecNewVelocity;
		const trace_t &tr = CBaseEntity::GetTouchTrace( );
		PhysicsClipVelocity (GetAbsVelocity(), tr.plane.normal, vecNewVelocity, 2.0 - GetFriction());
		SetAbsVelocity( vecNewVelocity );
	}
	else
	{
		// Move away from the shield...
		// Fling it out a little extra along the plane normal
		Vector vecCenter;
		AngleVectors( pOther->GetAbsAngles(), &vecCenter );

		Vector vecNewVelocity;
		VectorMultiply( vecCenter, 400.0f, vecNewVelocity );
		SetAbsVelocity( vecNewVelocity );
	}
#endif

	if ( ( pOther->IsPlayer() && pOther->InSameTeam( this ) ) || ( !pOther->IsBSPModel() && !pOther->GetBaseAnimating() ) ) {
		return;
	}

	// At this point, it shouldn't affect player movement
	SetCollisionGroup( COLLISION_GROUP_DEBRIS );

	// Remove myself soon
	SetThink(&CBaseEntity::SUB_Remove);
	SetNextThink( gpGlobals->curtime + 30.0 );

	m_hImpaledTarget = pOther;

	// Should I impale something?
	CBaseAnimating *animatingEntity = pOther->GetBaseAnimating();
	if ( animatingEntity != nullptr ) {
		CheckLinkedHarpoon();

		if ( animatingEntity->GetMoveType() != MOVETYPE_NONE ) {
			ImpaleTarget( animatingEntity );
			return;
		}
	}

	CheckLinkedHarpoon();

	EmitSound( "Harpoon.Impact" );

	// Stop moving
	SetMoveType( MOVETYPE_NONE );
}

void CHarpoon::RemoveFromImpaledTarget() {
	DevMsg( "RemoveFromImpaledTarget" );

	// Break the rope
	if ( m_hRope ) {
		m_hRope->DetachPoint( 1 );
		m_hRope->DieAtNextRest();
		m_hRope = NULL;
	}

	// If we're impaling a player, remove his movement constraint
	CBaseTFPlayer *player = dynamic_cast< CBaseTFPlayer* >( GetImpaledTarget() );
	if ( player != nullptr ) {
		player->DeactivateMovementConstraint();
	}

	SetThink( NULL );
}

//-----------------------------------------------------------------------------
// Purpose: Check to see if we've got a linked harpoon, and see if we should constrain something
//-----------------------------------------------------------------------------
void CHarpoon::CheckLinkedHarpoon( void )
{
	if ( m_hLinkedHarpoon )
	{
		CHarpoon *pPlayerHarpoon = NULL;
		CHarpoon *pNonMovingHarpoon = NULL;

		// Find out if either of us has impaled something
		if ( GetImpaledTarget() && m_hLinkedHarpoon->GetImpaledTarget() )
		{
			// Only care about players for now. One of the targets must be a player.
			CBaseTFPlayer *pPlayer = NULL;
			if ( GetImpaledTarget()->IsPlayer() )
			{
				pPlayer = (CBaseTFPlayer*)GetImpaledTarget();
				pPlayerHarpoon = this;
				pNonMovingHarpoon = m_hLinkedHarpoon;
			}
			else if ( m_hLinkedHarpoon->GetImpaledTarget()->IsPlayer() )
			{
				pPlayer = (CBaseTFPlayer*)m_hLinkedHarpoon->GetImpaledTarget();
				pNonMovingHarpoon = this;
				pPlayerHarpoon = m_hLinkedHarpoon;
			}

			// Found a player?
			if ( pPlayer )
			{
				CBaseEntity *pOtherTarget = pNonMovingHarpoon->GetImpaledTarget();

				// For now, we have to be linked to a non-moving target. Eventually we could support linked moving targets.
				// pOtherTarget == NULL means the harpoon's buried in the world.
				if ( pOtherTarget->IsBSPModel() || pOtherTarget->GetMoveType() == MOVETYPE_NONE )
				{
					// Add a little slack
					m_flConstrainLength = ( m_hLinkedHarpoon->GetAbsOrigin() - GetAbsOrigin() ).Length() + 150;
					pPlayer->ActivateMovementConstraint( NULL, pNonMovingHarpoon->GetAbsOrigin(), m_flConstrainLength, 150.0f, 0.1f );
					// Square it for later checking
					m_flConstrainLength *= m_flConstrainLength;

					// Start checking the length
					pPlayerHarpoon->m_flConstrainLength = m_flConstrainLength;
					pPlayerHarpoon->SetThink( &CHarpoon::ConstrainThink );
					pPlayerHarpoon->SetNextThink( gpGlobals->curtime + 0.1f );

					// Make the rope taught, and prevent it resizing
					if ( m_hRope )
					{
						m_hRope->m_RopeFlags &= ~ROPE_RESIZE;
						m_hRope->RecalculateLength();
					}
				}
			}
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CHarpoon::ImpaleTarget( CBaseAnimating *pOther ) {
	// Impale!
	EmitSound( "Harpoon.Impale" );

	// Calculate our impale offset
	m_vecOffset = GetAbsOrigin(); // (pOther->GetAbsOrigin() - GetAbsOrigin());
	m_angOffset = GetAbsAngles(); // (pOther->GetAbsAngles() - GetAbsAngles());

	Vector tracePos = GetAbsOrigin() - GetAbsVelocity() * 0.15f;
	Vector endTracePos = GetAbsOrigin() + GetAbsVelocity() * 0.15f;

	// Find the bone for the hitbox we hit
	trace_t tr;
	UTIL_TraceLine( tracePos, endTracePos, MASK_SHOT, this, COLLISION_GROUP_NONE, &tr );
	//DebugDrawLine( tracePos, endTracePos, 255, 0, 0, true, 100.0f );

	Vector vecBonePos;
	QAngle vecBoneAngles;
	if ( tr.hitbox ) {
		attachedBone = pOther->GetHitboxBone( tr.hitbox );
	} else {
		attachedBone = 0;
	}

	pOther->GetBonePosition( attachedBone, vecBonePos, vecBoneAngles );

	SetAbsOrigin( vecBonePos );

	SetMoveType( MOVETYPE_NONE );
	AddSolidFlags( FSOLID_NOT_SOLID );

	// Do some damage to the target
	if ( pOther->m_takedamage )
	{
		CBaseTFPlayer *pOwner = ToBaseTFPlayer( GetOwnerEntity() );
		if ( !pOwner )
			return;

		pOther->TakeDamage( CTakeDamageInfo( this, pOwner, weapon_harpoon_damage.GetFloat(), DMG_GENERIC ) );

		if ( !pOther->IsAlive() ) {
			RemoveFromImpaledTarget();
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CHarpoon::FlyThink( void )
{
	SetHarpoonAngles();

	SetNextThink( gpGlobals->curtime + 0.1f );
}

//-----------------------------------------------------------------------------
// Purpose: Check to see if our target has moved beyond our length
//-----------------------------------------------------------------------------
void CHarpoon::ConstrainThink( void ) {
	if ( !GetImpaledTarget() || !m_hLinkedHarpoon.Get() )
		return;

	CBaseEntity *impaledTarget = GetImpaledTarget();
	if ( impaledTarget != nullptr ) {
		if ( !impaledTarget->IsAlive() ) {
			RemoveFromImpaledTarget();
			return;
		}

		// Ensure we follow whatever bone we're linked to
		CBaseAnimating *animatingEntity = ( CBaseAnimating * ) GetImpaledTarget();
		if ( animatingEntity != nullptr && attachedBone != -1 ) {
			Vector vecBonePos;
			QAngle vecBoneAngles;
			animatingEntity->GetBonePosition( attachedBone, vecBonePos, vecBoneAngles );

			SetAbsOrigin( vecBonePos );
			//SetAbsAngles( vecBoneAngles );

			DevMsg( "%f %f %f\n", vecBonePos.x, vecBonePos.y, vecBonePos.z );
		}
	}

	// Moved too far away?
	float flDistSq = m_hLinkedHarpoon->GetAbsOrigin().DistToSqr( GetImpaledTarget()->GetAbsOrigin() );
	if ( flDistSq > m_flConstrainLength ) {
		RemoveFromImpaledTarget();
	} else {
		SetNextThink( gpGlobals->curtime + 0.1f );
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CHarpoon *CHarpoon::Create( const Vector &vecOrigin, const Vector &vecForward, CBasePlayer *pOwner )
{
	CHarpoon *pHarpoon = (CHarpoon*)CreateEntityByName("harpoon");

	UTIL_SetOrigin( pHarpoon, vecOrigin );
	pHarpoon->Spawn();
	pHarpoon->ChangeTeam( pOwner->GetTeamNumber() );
	pHarpoon->SetOwnerEntity( pOwner );
	pHarpoon->SetAbsVelocity( vecForward );
	pHarpoon->SetHarpoonAngles();

	return pHarpoon;
}
#endif


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
class CWeaponHarpoon : public CBaseTFCombatWeapon
{
	DECLARE_CLASS( CWeaponHarpoon, CBaseTFCombatWeapon );
public:
	CWeaponHarpoon();

	DECLARE_NETWORKCLASS();
	DECLARE_PREDICTABLE();

	virtual void	ItemPostFrame( void ) override;
	virtual void	PrimaryAttack( void ) override;
	virtual void	SecondaryAttack( void ) override;
	virtual float	GetFireRate( void ) override;

	void ThrowGrenade();
	
	void DetachRope();
	void YankHarpoon();

	// Custom grenade types
	virtual CHarpoon *CreateHarpoon( const Vector &vecOrigin, const Vector &vecAngles, CBasePlayer *pOwner );

	// All predicted weapons need to implement and return true
	virtual bool IsPredicted( void ) const override
	{ 
		return true;
	}

#if defined( CLIENT_DLL )
	virtual bool ShouldPredict( void ) override
	{
		if ( GetOwner() && GetOwner() == C_BasePlayer::GetLocalPlayer() )
			return true;

		return BaseClass::ShouldPredict();
	}
#endif

private:
	CNetworkVar( float, m_flStartedThrowAt );
	float	m_flCantThrowUntil;
	float	m_flSecondaryAttackAt;
	bool	m_bActiveHarpoon;

#if !defined( CLIENT_DLL )
	CHandle< CRopeKeyframe >	m_hRope;
	CHandle< CHarpoon >			m_hHarpoon;
#endif
													
	CWeaponHarpoon( const CWeaponHarpoon & );
};

LINK_ENTITY_TO_CLASS( weapon_harpoon, CWeaponHarpoon );

IMPLEMENT_NETWORKCLASS_ALIASED( WeaponHarpoon, DT_WeaponHarpoon )

BEGIN_NETWORK_TABLE( CWeaponHarpoon, DT_WeaponHarpoon )
#if !defined( CLIENT_DLL )
	SendPropTime( SENDINFO( m_flStartedThrowAt ) ),
#else
	RecvPropTime( RECVINFO( m_flStartedThrowAt ) ),
#endif
END_NETWORK_TABLE()

#ifdef CLIENT_DLL

BEGIN_PREDICTION_DATA( CWeaponHarpoon  )

	DEFINE_PRED_FIELD_TOL( m_flStartedThrowAt, FIELD_FLOAT, FTYPEDESC_INSENDTABLE, TD_MSECTOLERANCE ),

END_PREDICTION_DATA()

#endif

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CWeaponHarpoon::CWeaponHarpoon( void )
{
	m_flStartedThrowAt = 0;
	m_flCantThrowUntil = 0;
	m_flSecondaryAttackAt = 0;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
float CWeaponHarpoon::GetFireRate( void )
{	
	return 2.0f; 
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CWeaponHarpoon::ItemPostFrame( void )
{
	CBasePlayer *pOwner = ToBasePlayer( GetOwner() );
	if (!pOwner)
		return;

	// Look for button downs
	if ( (pOwner->m_afButtonPressed & IN_ATTACK) && !m_flStartedThrowAt && (m_flNextPrimaryAttack <= gpGlobals->curtime) )
	{
		// If we don't have a harpoon, throw one out. Otherwise, yank it back.
		if ( m_bActiveHarpoon ) {
			YankHarpoon();
		} else {
			m_bActiveHarpoon = true;
			m_flStartedThrowAt = gpGlobals->curtime;
			PlayAttackAnimation( ACT_VM_PULLBACK );
			m_flCantThrowUntil = gpGlobals->curtime + SequenceDuration();
		}
	}
	else if ( m_flCantThrowUntil && m_bActiveHarpoon && !(pOwner->m_nButtons & IN_ATTACK) && (m_flNextPrimaryAttack <= gpGlobals->curtime) && (m_flCantThrowUntil <= gpGlobals->curtime)  )
	{
		m_flNextPrimaryAttack = gpGlobals->curtime;
		PrimaryAttack();
		m_flStartedThrowAt = 0;
		m_flCantThrowUntil = 0;
	}
	else if ( (pOwner->m_nButtons & IN_ATTACK2) && (m_flNextPrimaryAttack <= gpGlobals->curtime) ) {
		if ( m_bActiveHarpoon ) {
			m_flNextPrimaryAttack = gpGlobals->curtime;
			PrimaryAttack();
			m_flStartedThrowAt = 0;
			m_flCantThrowUntil = 0;
			return;
		}

		PlayAttackAnimation( ACT_VM_SECONDARYATTACK );
		m_flSecondaryAttackAt = gpGlobals->curtime + SequenceDuration() * 0.3;
		m_flNextPrimaryAttack = gpGlobals->curtime + SequenceDuration();
	}
	else if ( m_flSecondaryAttackAt && m_flSecondaryAttackAt < gpGlobals->curtime )
	{
		SecondaryAttack();
		m_flSecondaryAttackAt = 0;
	}

	//  No buttons down?
	if ( !((pOwner->m_nButtons & IN_ATTACK) || (pOwner->m_nButtons & IN_ATTACK2) || (pOwner->m_nButtons & IN_RELOAD)) )
	{
		WeaponIdle( );
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CWeaponHarpoon::PrimaryAttack( void )
{
	CBasePlayer *pPlayer = dynamic_cast<CBasePlayer*>( GetOwner() );
	if ( !pPlayer )
		return;

	if ( !ComputeEMPFireState() )
		return;

	ThrowGrenade();

	// Setup for refire
	m_flNextPrimaryAttack = gpGlobals->curtime + 1.0;
	CheckRemoveDisguise();

	// If I'm now out of ammo, switch away
	if ( !HasPrimaryAmmo() )
	{
		pPlayer->SelectLastItem();
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CWeaponHarpoon::SecondaryAttack( void )
{
	CBasePlayer *pPlayer = dynamic_cast<CBasePlayer*>( GetOwner() );
	if ( !pPlayer )
		return;

	// Slap things in front of me
	Vector vecForward;
	Vector vecBox = Vector( FIST_RANGE,FIST_RANGE,FIST_RANGE * 1.5 ) * 0.5;
	pPlayer->EyeVectors( &vecForward );
	Vector vecSrc = pPlayer->Weapon_ShootPosition( );
	Vector vecCenter = vecSrc + (FIST_RANGE * 0.5 * vecForward);

#if !defined( CLIENT_DLL )
	//NDebugOverlay::Box( vecCenter, -Vector(2,2,2), Vector(2,2,2), 255,0,0,20,2.0);
	//NDebugOverlay::Box( vecCenter, -vecBox, vecBox, 255,255,255,20,2.0);

	bool bHitMetal = false;
	bool bHitPlayer = false;

	CBaseEntity	*pList[100];
	int count = UTIL_EntitiesInBox( pList, 100, vecSrc - vecBox, vecSrc + vecBox, FL_CLIENT|FL_NPC|FL_OBJECT );
	for ( int i = 0; i < count; i++ )
	{
		CBaseEntity *pEntity = pList[i];
		if ( !pEntity->m_takedamage )
			continue;
		if ( pEntity->InSameTeam( this ) )
			continue;

		//NDebugOverlay::EntityBounds( pEntity, 0,255,0,20,2.0);
		if ( pEntity->IsPlayer() )
		{
			bHitPlayer = true;
			CTakeDamageInfo info( this, pPlayer, weapon_fist_damage.GetFloat(), DMG_CLUB );
			CalculateMeleeDamageForce( &info, (pEntity->GetAbsOrigin() - vecCenter), pEntity->GetAbsOrigin() );
			pEntity->TakeDamage( info );
		}
		else if ( pEntity->Classify() == CLASS_MILITARY )
		{
			bHitMetal = true;
			CTakeDamageInfo info( this, pPlayer, weapon_fist_damage_objects.GetFloat(), DMG_CLUB );
			CalculateMeleeDamageForce( &info, (pEntity->GetAbsOrigin() - vecCenter), pEntity->GetAbsOrigin() );
			pEntity->TakeDamage( info );
		}
		else
		{
			bHitMetal = true;
			CTakeDamageInfo info( this, pPlayer, weapon_fist_damage.GetFloat(), DMG_CLUB );
			CalculateMeleeDamageForce( &info, (pEntity->GetAbsOrigin() - vecCenter), pEntity->GetAbsOrigin() );
			pEntity->TakeDamage( info );
		}
	}

	// Play the right sound
	if ( bHitPlayer )
	{
		EmitSound( "Harpoon.HitFlesh" );
	}
	else if ( bHitMetal )
	{
		EmitSound( "Harpoon.HitMetal" );
	}
#endif
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CWeaponHarpoon::ThrowGrenade( void )
{
	CBasePlayer *pPlayer = dynamic_cast<CBasePlayer*>( GetOwner() );
	if ( !pPlayer )
		return;

	BaseClass::WeaponSound(WPN_DOUBLE);

	// Calculate launch velocity (3 seconds for max distance)
	float flThrowTime = min( (gpGlobals->curtime - m_flStartedThrowAt), 3.0 );
	float flSpeed = 1000 + (200 * flThrowTime);

	PlayAttackAnimation( ACT_VM_PRIMARYATTACK );

	// If the player's crouched, roll the grenade
	if ( pPlayer->GetFlags() & FL_DUCKING )
	{
		// Launch the grenade
		Vector vecForward;
		QAngle vecAngles = pPlayer->EyeAngles();
		// Throw it up just a tad
		vecAngles.x = -1;
		AngleVectors( vecAngles, &vecForward, NULL, NULL);
		Vector vecOrigin;
		VectorLerp( pPlayer->EyePosition(), pPlayer->GetAbsOrigin(), 0.25f, vecOrigin );
		vecOrigin += (vecForward * 16);
		vecForward = vecForward * flSpeed;
		CreateHarpoon(vecOrigin, vecForward, pPlayer );
	}
	else
	{
		// Launch the grenade
		Vector vecForward;
		QAngle vecAngles = pPlayer->EyeAngles();
		AngleVectors( vecAngles, &vecForward, NULL, NULL);
		Vector vecOrigin = pPlayer->EyePosition();
		vecOrigin += (vecForward * 16);
		vecForward = vecForward * flSpeed;
		CreateHarpoon(vecOrigin, vecForward, pPlayer );
	}

	pPlayer->RemoveAmmo( 1, m_iPrimaryAmmoType );
}

//-----------------------------------------------------------------------------
// Purpose: Give the harpoon a yank
//-----------------------------------------------------------------------------
void CWeaponHarpoon::YankHarpoon( void )
{
	CBasePlayer *pPlayer = dynamic_cast<CBasePlayer*>( GetOwner() );
	if ( !pPlayer )
		return;

#if !defined( CLIENT_DLL )
	if ( m_bActiveHarpoon && m_hHarpoon.Get() )
	{
		// If the harpoon's impaled something, pull it towards me
		CBaseEntity *pTarget = m_hHarpoon->GetImpaledTarget();
		if ( pTarget )
		{
			if ( !pTarget->IsBSPModel() && pTarget->GetMoveType() != MOVETYPE_NONE )
			{
				// Bring him to me!
				EmitSound( "Harpoon.Yank" );

				// Get a yank vector, and raise it a little to get them off the ground if they're on it
				Vector vecOverHere = ( pPlayer->GetAbsOrigin() - pTarget->GetAbsOrigin() );
				VectorNormalize( vecOverHere );
				if ( pTarget->GetFlags() & FL_ONGROUND )
				{
					pTarget->SetGroundEntity( NULL );
					vecOverHere.z = 0.5;
				}
				pTarget->ApplyAbsVelocityImpulse( vecOverHere * 500 );

				PlayAttackAnimation( ACT_VM_HAULBACK );
			}
		}
		m_hHarpoon->SetThink( &CBaseEntity::SUB_Remove );
		m_hHarpoon->SetNextThink( gpGlobals->curtime + 5.0 );
		m_hHarpoon = NULL;
		m_bActiveHarpoon = false;
	}

	DetachRope();
#endif
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CWeaponHarpoon::DetachRope( void )
{
#if !defined( CLIENT_DLL )
	if ( m_hRope )
	{
		m_hRope->DetachPoint(1);
		m_hRope->DieAtNextRest();
		m_hRope = NULL;
	}
#endif
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CHarpoon *CWeaponHarpoon::CreateHarpoon( const Vector &vecOrigin, const Vector &vecAngles, CBasePlayer *pOwner )
{
#if !defined( CLIENT_DLL )
	CHarpoon *pHarpoon = CHarpoon::Create( vecOrigin, vecAngles, pOwner );
	if ( pHarpoon ) {
		// Create the rope on first throw. Otherwise attach our existing rope.
		if ( !m_hRope ) {
			CRopeKeyframe *pRope = CRopeKeyframe::Create( pHarpoon, pOwner, 0, 0 );
			if ( pRope ) {
				pRope->m_RopeLength = 1.0;
				pRope->m_Slack = 50.0f;
				pRope->m_Width = 2;
				pRope->m_nSegments = ROPE_MAX_SEGMENTS;
				pRope->m_RopeFlags |= ROPE_RESIZE | ROPE_COLLIDE;
			}
			m_hRope = pRope;
			pHarpoon->SetRope( m_hRope );
		} else {
			m_hRope->SetEndPoint( pHarpoon, 0 );
			pHarpoon->SetRope( m_hRope );
			m_hRope = NULL;
		}

		// Do we already have a harpoon out?
		CHarpoon *pOldHarpoon = m_hHarpoon;
		m_hHarpoon = pHarpoon;

		if ( pOldHarpoon ) {
			pOldHarpoon->SetLinkedHarpoon( m_hHarpoon );
			pHarpoon->SetLinkedHarpoon( pOldHarpoon );
			m_hHarpoon = NULL;
		}
	}

	return pHarpoon;
#else
	return NULL;
#endif
}
